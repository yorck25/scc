package grid

import (
	"encoding/json"
	"game-service/core"
	"github.com/gorilla/websocket"
	"log"
)

func broadcastGridUpdate(grid *UpdateGridRequest) {
	core.Mu.Lock()
	defer core.Mu.Unlock()

	message := core.WSMessage{
		Type: "grid_update",
		Payload: map[string]interface{}{
			"height": grid.Height,
			"width":  grid.Width,
			"cityId": grid.CityId,
		},
	}

	jsonMessage, err := json.Marshal(message)
	if err != nil {
		log.Printf("Error marshaling grid update message: %v", err)
		return
	}

	for wsClient := range core.ActiveWebSocketClients {
		if err := wsClient.WriteMessage(websocket.TextMessage, jsonMessage); err != nil {
			log.Printf("Error sending grid update to client: %v", err)
			wsClient.Close()
			delete(core.ActiveWebSocketClients, wsClient)
		}
	}
}
