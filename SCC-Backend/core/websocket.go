package core

import (
	"fmt"
	"github.com/gorilla/websocket"
	"log"
	"net/http"
	"strconv"
	"sync"
)

type WSMessage struct {
	Type    string      `json:"type"`
	Payload interface{} `json:"payload"`
}

var (
	Mu                     sync.RWMutex
	ActiveWebSocketClients = make(map[*websocket.Conn]string)
	PlayerGameMapping      = make(map[string]int)
	GameGroups             = make(map[int]map[*websocket.Conn]bool)
)

var upgrader = websocket.Upgrader{
	CheckOrigin: func(r *http.Request) bool {
		return true
	},
}

func HandleWebSocket(ctx *WebContext) error {
	ws, err := upgrader.Upgrade(ctx.Response(), ctx.Request(), nil)
	if err != nil {
		log.Println("Failed to upgrade WebSocket:", err)
		return err
	}

	playerId := ctx.Request().Header.Get("X-Player-ID")
	if playerId == "" {
		ws.WriteMessage(websocket.TextMessage, []byte("No playerId provided"))
		ws.Close()
		return nil
	}

	gameID, err := strconv.Atoi(ctx.Request().Header.Get("X-Game-ID"))
	if err != nil {
		_, msg, err := ws.ReadMessage()
		if err != nil {
			ws.Close()
			return nil
		}
		gameID, err = strconv.Atoi(string(msg))
		if err != nil {
			ws.WriteMessage(websocket.TextMessage, []byte("Invalid gameID format"))
			ws.Close()
			return nil
		}
	}

	Mu.Lock()
	wasConnected := false
	for _, id := range ActiveWebSocketClients {
		if id == playerId {
			wasConnected = true
			break
		}
	}
	ActiveWebSocketClients[ws] = playerId
	PlayerGameMapping[playerId] = gameID

	if GameGroups[gameID] == nil {
		GameGroups[gameID] = make(map[*websocket.Conn]bool)
	}
	GameGroups[gameID][ws] = true
	Mu.Unlock()

	welcomeMsg := fmt.Sprintf("Welcome to game %d, Player %s!", gameID, playerId)
	if err := ws.WriteMessage(websocket.TextMessage, []byte(welcomeMsg)); err != nil {
		RemoveWebSocketClient(ws)
		return nil
	}

	notification := fmt.Sprintf("Player %s has %s to game %d",
		playerId,
		map[bool]string{true: "reconnected", false: "connected"}[wasConnected],
		gameID)

	BroadcastToGame(gameID, []byte(notification))

	defer func() {
		RemoveWebSocketClient(ws)
		ws.Close()
	}()

	for {
		_, msg, err := ws.ReadMessage()
		if err != nil {
			if websocket.IsUnexpectedCloseError(err, websocket.CloseGoingAway, websocket.CloseNormalClosure) {
				log.Printf("Unexpected WebSocket close for Player %s: %v", playerId, err)
			}
			break
		}

		HandleGameAction(ws, playerId, msg)
	}

	return nil
}

func HandleGameAction(ws *websocket.Conn, playerId string, msg []byte) {
	Mu.RLock()
	gameID, exists := PlayerGameMapping[playerId]
	Mu.RUnlock()

	if !exists {
		return
	}

	response := fmt.Sprintf("Player %s: %s", playerId, string(msg))

	BroadcastToGame(gameID, []byte(response))
}

func RemoveWebSocketClient(ws *websocket.Conn) {
	Mu.Lock()
	defer Mu.Unlock()

	playerId := ActiveWebSocketClients[ws]
	delete(ActiveWebSocketClients, ws)
	delete(PlayerGameMapping, playerId)

	for gameID := range GameGroups {
		delete(GameGroups[gameID], ws)
		if len(GameGroups[gameID]) == 0 {
			delete(GameGroups, gameID)
		}
	}
}

func BroadcastToGame(gameID int, message []byte) {
	Mu.RLock()
	defer Mu.RUnlock()

	for ws := range GameGroups[gameID] {
		if err := ws.WriteMessage(websocket.TextMessage, message); err != nil {
			log.Println("Broadcast error:", err)
			ws.Close()
			RemoveWebSocketClient(ws)
		}
	}
}
