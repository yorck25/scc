package auth

import (
	"SCC_Backend/core"
	"github.com/jmoiron/sqlx"
)

type Repository struct {
	db *sqlx.DB
}

func NewRepository(ctx *core.WebContext) *Repository {
	return &Repository{db: ctx.GetDb()}
}

func (r *Repository) GetPlayer(playerName string) (*Player, error) {
	var player Player

	stmt, err := r.db.PrepareNamed("SELECT * FROM player WHERE username = :playername")
	if err != nil {
		return nil, err
	}

	params := map[string]any{
		"playerName": playerName,
	}

	err = stmt.Get(&player, params)
	if err != nil {
		return nil, err
	}

	return &player, nil
}

func (r *Repository) GetGame(gameId int) (*JoinGameRequest, error) {
	var game JoinGameRequest

	stmt, err := r.db.PrepareNamed("SELECT * FROM game WHERE game_id = :gameId")
	if err != nil {
		return nil, err
	}

	params := map[string]any{
		"gameId": gameId,
	}

	err = stmt.Get(&game, params)
	if err != nil {
		return nil, err
	}

	return &game, nil
}
