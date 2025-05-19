package main

import (
	"github.com/labstack/echo/v4/middleware"
	"map-service/cell"
	"map-service/cluster"
	"map-service/core"
	"map-service/grid"
)

func main() {
	app, err := core.InitApp()
	if err != nil {
		panic(err)
	}

	app.Use(middleware.CORSWithConfig(middleware.DefaultCORSConfig))

	app.GET("/", defaultUrl)
	app.GET("/health", healthUrl)

	app.GET("/grid", grid.HandleGetGridForCity)
	app.POST("/grid", grid.HandleCreateGridForCity)
	app.PUT("/grid", grid.HandleUpdateGrid)
	app.DELETE("/grid", grid.HandleDeleteGrid)

	app.GET("/cells", cell.HandleGetGridCells)
	app.PUT("/cell", cell.HandleUpdateCell)

	app.GET("/generate-res", cluster.CreateCluster)

	app.Logger.Fatal(app.Start(":5655"))
}

func defaultUrl(ctx *core.WebContext) error {
	return ctx.Success("SCC-Backend is up and running")
}

func healthUrl(ctx *core.WebContext) error {
	return ctx.Success("The backend is still alive")
}
