package cluster

import (
	"github.com/jmoiron/sqlx"
	"map-service/core"
)

type Repository struct {
	db *sqlx.DB
}

func NewRepository(ctx *core.WebContext) *Repository {
	return &Repository{db: ctx.GetDb()}
}
