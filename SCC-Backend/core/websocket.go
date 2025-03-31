package core

import (
	"fmt"
	"github.com/gorilla/websocket"
	"log"
	"net/http"
	"sync"
)

type WSMessage struct {
	Type    string      `json:"type"`
	Payload interface{} `json:"payload"`
}

var (
	ActiveWebSocketClients = make(map[*websocket.Conn]string)
	Mu                     sync.Mutex
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

	Mu.Lock()
	// Check if player was previously connected
	wasConnected := false
	for _, id := range ActiveWebSocketClients {
		if id == playerId {
			wasConnected = true
			break
		}
	}
	ActiveWebSocketClients[ws] = playerId
	Mu.Unlock()

	if err := ws.WriteMessage(websocket.TextMessage, []byte(fmt.Sprintf("Welcome, Player %s!", playerId))); err != nil {
		RemoveWebSocketClient(ws)
		return nil
	}

	if wasConnected {
		notifyOtherClients(playerId, "reconnected")
	} else {
		notifyOtherClients(playerId, "connected")
	}

	defer func() {
		RemoveWebSocketClient(ws)
		ws.Close()
	}()

	for {
		_, _, err := ws.ReadMessage()
		if err != nil {
			if websocket.IsUnexpectedCloseError(err, websocket.CloseGoingAway, websocket.CloseNormalClosure) {
				log.Printf("Unexpected WebSocket close for Player %s: %v", playerId, err)
			}
			break
		}
	}

	return nil
}

func GetActiveClients() []*websocket.Conn {
	Mu.Lock()
	defer Mu.Unlock()

	clients := make([]*websocket.Conn, 0, len(ActiveWebSocketClients))
	for client := range ActiveWebSocketClients {
		clients = append(clients, client)
	}
	return clients
}

func RemoveWebSocketClient(ws *websocket.Conn) {
	Mu.Lock()
	playerId, exists := ActiveWebSocketClients[ws]
	if exists {
		delete(ActiveWebSocketClients, ws)
	}
	Mu.Unlock()

	if exists {
		notifyOtherClientsOnDisconnect(playerId)
	}
}

func notifyOtherClients(playerId string, action string) {
	Mu.Lock()
	defer Mu.Unlock()

	message := fmt.Sprintf("Player %s has %s!", playerId, action)
	for wsClient, id := range ActiveWebSocketClients {
		if id != playerId {
			if err := wsClient.WriteMessage(websocket.TextMessage, []byte(message)); err != nil {
				log.Printf("Error sending to Player %s: %v", id, err)
			}
		}
	}
}

func notifyOtherClientsOnDisconnect(disconnectedPlayerId string) {
	Mu.Lock()
	defer Mu.Unlock()

	message := fmt.Sprintf("Player %s has disconnected.", disconnectedPlayerId)
	for wsClient, playerId := range ActiveWebSocketClients {
		if playerId != disconnectedPlayerId {
			if err := wsClient.WriteMessage(websocket.TextMessage, []byte(message)); err != nil {
				log.Printf("Error sending to Player %s: %v", playerId, err)
			}
		}
	}
}
