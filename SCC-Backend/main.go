package main

import (
	"SCC_Backend/audit"
	"SCC_Backend/auth"
	"SCC_Backend/city"
	"SCC_Backend/core"
	"SCC_Backend/game"
	"SCC_Backend/grid"
	"SCC_Backend/player"
	"github.com/labstack/echo/v4/middleware"
)

func main() {
	app, err := core.InitApp()
	if err != nil {
		panic(err)
	}

	app.Use(middleware.CORSWithConfig(middleware.DefaultCORSConfig))

	app.GET("/", defaultUrl)
	app.GET("/health", healthUrl)

	app.GET("/login", auth.Login)
	app.GET("/join-game", auth.JoinGame)

	app.GET("/player", player.HandleGetPlayer)

	app.GET("/audit", audit.HandleGetAudit)
	app.POST("/audit", audit.HandleCreateAudit)

	app.GET("/game/:searchNameValue", game.HandleSearchGame)
	app.POST("/game", game.HandleCreateGame)
	app.PUT("/game", game.HandleUpdateGame)
	app.DELETE("/game", game.HandleDeleteGame)

	app.GET("/city/:gameId", city.HandleGetAllCitiesForGame)
	app.GET("/city/:gameId/:name", city.HandleGetCityByName)
	app.POST("/city", city.HandleCreateCity)
	app.PUT("/city", city.HandleUpdateCity)
	app.DELETE("/city", city.HandleDeleteCity)

	app.GET("/grid/:cityId", grid.HandleGetGridForCity)
	app.POST("/grid", grid.HandleCreateGridForCity)
	app.PUT("/grid", grid.HandleUpdateGrid)
	app.DELETE("/grid", grid.HandleDeleteGrid)

	app.Logger.Fatal(app.Start(":5555"))
}

func defaultUrl(ctx *core.WebContext) error {
	return ctx.Success("SCC-Backend is up and running")
}

func healthUrl(ctx *core.WebContext) error {
	return ctx.Success("The backend is still alive")
}
