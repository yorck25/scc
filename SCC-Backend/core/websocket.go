package core

import (
	"fmt"
	"github.com/golang-jwt/jwt"
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

	gameToken := ctx.Request().Header.Get("X-Game-Token")

	gameId, sPlayerId, err := DecodeGameToken(gameToken, ctx)
	if err != nil {
		ws.WriteMessage(websocket.TextMessage, []byte("Fail to decode game token"))
		ws.Close()
		return nil
	}

	playerId := strconv.Itoa(sPlayerId)

	Mu.Lock()
	wasConnected := false
	for _, id := range ActiveWebSocketClients {
		if id == playerId {
			wasConnected = true
			break
		}
	}
	ActiveWebSocketClients[ws] = playerId
	PlayerGameMapping[playerId] = gameId

	if GameGroups[gameId] == nil {
		GameGroups[gameId] = make(map[*websocket.Conn]bool)
	}
	GameGroups[gameId][ws] = true
	Mu.Unlock()

	welcomeMsg := fmt.Sprintf("Welcome to game %d, Player %s!", gameId, playerId)
	if err := ws.WriteMessage(websocket.TextMessage, []byte(welcomeMsg)); err != nil {
		RemoveWebSocketClient(ws)
		return nil
	}

	notification := fmt.Sprintf("Player %s has %s to game %d",
		playerId,
		map[bool]string{true: "reconnected", false: "connected"}[wasConnected],
		gameId)

	BroadcastToGame(gameId, []byte(notification))

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
	gameId, exists := PlayerGameMapping[playerId]
	Mu.RUnlock()

	if !exists {
		return
	}

	response := fmt.Sprintf("Player %s: %s", playerId, string(msg))

	BroadcastToGame(gameId, []byte(response))
}

func RemoveWebSocketClient(ws *websocket.Conn) {
	Mu.Lock()
	defer Mu.Unlock()

	playerId := ActiveWebSocketClients[ws]
	delete(ActiveWebSocketClients, ws)
	delete(PlayerGameMapping, playerId)

	for gameId := range GameGroups {
		delete(GameGroups[gameId], ws)
		if len(GameGroups[gameId]) == 0 {
			delete(GameGroups, gameId)
		}
	}
}

func BroadcastToGame(gameId int, message []byte) {
	Mu.RLock()
	defer Mu.RUnlock()

	for ws := range GameGroups[gameId] {
		if err := ws.WriteMessage(websocket.TextMessage, message); err != nil {
			log.Println("Broadcast error:", err)
			ws.Close()
			RemoveWebSocketClient(ws)
		}
	}
}

type GameClaims struct {
	GameId   int `json:"gameId"`
	PlayerId int `json:"playerId"`
	jwt.StandardClaims
}

func DecodeGameToken(token string, ctx *WebContext) (int, int, error) {
	claims := GameClaims{}

	_, err := jwt.ParseWithClaims(token, &claims, func(token *jwt.Token) (interface{}, error) {
		return ctx.GetConfig().JwtSecretKey, nil
	})

	if err != nil {
		return 0, 0, err
	}

	return claims.GameId, claims.PlayerId, nil
}
