package main

import (
	"SCC_Backend/core"
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
	app.GET("/player", player.HandlerGetPlayer)

	app.Logger.Fatal(app.Start(":5555"))

}

func defaultUrl(ctx *core.WebContext) error {
	return ctx.Success("CMS-Service is up and running")
}
