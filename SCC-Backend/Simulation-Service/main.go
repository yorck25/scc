package main

import (
	"github.com/labstack/echo/v4/middleware"
	"simulation-service/core"
	"simulation-service/npc"
)

func main() {
	app, err := core.InitApp()
	if err != nil {
		panic(err)
	}

	app.Use(middleware.CORSWithConfig(middleware.DefaultCORSConfig))

	app.GET("/", defaultUrl)
	app.GET("/health", healthUrl)

	app.POST("/npc", npc.CreateNpc)

	app.Logger.Fatal(app.Start(":5755"))
}

func defaultUrl(ctx *core.WebContext) error {
	return ctx.Success("SCC-Backend is up and running")
}

func healthUrl(ctx *core.WebContext) error {
	return ctx.Success("The backend is still alive")
}
