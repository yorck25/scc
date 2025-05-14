package player

import (
	"game-service/core"
	"github.com/jmoiron/sqlx"
)

type Repository struct {
	db *sqlx.DB
}

func NewRepository(ctx *core.WebContext) *Repository {
	return &Repository{db: ctx.GetDb()}
}

func (r *Repository) GetPlayer(id int) (*Player, error) {
	var player Player

	stmt, err := r.db.PrepareNamed(`SELECT * FROM game.player WHERE id = :id`)
	if err != nil {
		return nil, err
	}

	params := map[string]any{
		"id": id,
	}

	err = stmt.Get(&player, params)
	if err != nil {
		return nil, err
	}

	return &player, nil
}

func (r *Repository) GetPlayerStats(playerId int) (*PlayerStats, error) {
	var playerStats PlayerStats

	stmt, err := r.db.PrepareNamed(`SELECT * FROM game.player_stats WHERE playerId = :playerId`)
	if err != nil {
		return nil, err
	}

	params := map[string]any{
		"playerId": playerId,
	}

	err = stmt.Get(&playerStats, params)
	if err != nil {
		return nil, err
	}

	return &playerStats, nil
}
