package core

import (
	"fmt"
	"github.com/labstack/echo/v4"
	"github.com/labstack/gommon/log"
	"net/http"

	"github.com/jmoiron/sqlx"
	_ "github.com/lib/pq"
)

type App struct {
	*echo.Echo
	Ctx *AppContext
}

func InitApp() (*App, error) {
	ctx := &AppContext{}

	config, err := LoadConfig()
	if err != nil {
		return nil, err
	}

	ctx.config = config

	connStr := "host=localhost port=5432 user=user password=password dbname=postgres sslmode=disable"

	db, err := sqlx.Connect("postgres", connStr)
	if err != nil {
		return nil, err
	}
	ctx.db = db

	err = db.Ping()
	if err != nil {
		log.Fatalf("Cannot reach the database: %v", err)
	}

	fmt.Println("✅ Successfully connected to PostgreSQL!")

	//_, err = db.Exec(`CREATE TABLE IF NOT EXISTS news (id VARCHAR(255) UNIQUE NOT NULL, title VARCHAR(255), content TEXT, published INT, publishedAt DATE, deleted INT, deletedAt DATE, userId VARCHAR(255))`)
	//if err != nil {
	//	log.Fatalf("Failed to create table: %v", err)
	//}

	e := echo.New()
	e.Debug = true
	e.Logger.SetLevel(log.DEBUG)
	e.Use(CreateCtx(ctx))

	return &App{Echo: e, Ctx: ctx}, nil
}

type HandlerFunc func(*WebContext) error

func (f HandlerFunc) Handle(ctx *WebContext) error {
	return f(ctx)
}

func wrapHandler(h HandlerFunc) echo.HandlerFunc {
	return func(c echo.Context) error {
		ctx := c.(*WebContext)
		return h.Handle(ctx)
	}
}

func (a *App) GET(path string, h HandlerFunc, m ...echo.MiddlewareFunc) *echo.Route {
	return a.Add(http.MethodGet, path, wrapHandler(h), m...)
}

func (a *App) POST(path string, h HandlerFunc, m ...echo.MiddlewareFunc) *echo.Route {
	return a.Add(http.MethodPost, path, wrapHandler(h), m...)
}

func (a *App) PUT(path string, h HandlerFunc, m ...echo.MiddlewareFunc) *echo.Route {
	return a.Add(http.MethodPut, path, wrapHandler(h), m...)
}

func (a *App) DELETE(path string, h HandlerFunc, m ...echo.MiddlewareFunc) *echo.Route {
	return a.Add(http.MethodDelete, path, wrapHandler(h), m...)
}
