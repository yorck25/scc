package game

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

func (r *Repository) ListGames() ([]Game, error) {
	var games []Game

	stmt, err := r.db.PrepareNamed(`SELECT * FROM game LIMIT 25`)
	if err != nil {
		return nil, err
	}

	err = stmt.Select(&games, map[string]any{})
	if err != nil {
		return nil, err
	}

	return games, nil
}

func (r *Repository) GetGameByName(searchName string) ([]Game, error) {
	var game []Game

	stmt, err := r.db.PrepareNamed(`SELECT * FROM game WHERE name LIKE :name`)
	if err != nil {
		return nil, err
	}

	params := map[string]any{
		"name": searchName + "%",
	}

	err = stmt.Get(&game, params)
	if err != nil {
		return nil, err
	}

	return game, nil
}

func (r *Repository) CreateNewGame(cgr CreateGameRequest, playerId int) error {
	stmt, err := r.db.PrepareNamed(`INSERT INTO game (name, password, owner_id) VALUES (:name, :pw, :ownerId)`)
	if err != nil {
		return err
	}

	params := map[string]any{
		"name":    cgr.Name,
		"pw":      cgr.Password,
		"ownerId": playerId,
	}

	_, err = stmt.Exec(params)
	if err != nil {
		return err
	}

	return nil
}

func (r *Repository) UpdateGame(ugr UpdateGameRequest, playerId int) error {
	stmt, err := r.db.PrepareNamed(`UPDATE game SET game_id = :gameId, name = :name, password = :password, owner_id = :ownerId WHERE game_id = :gameId AND owner_id = :playerId`)
	if err != nil {
		return err
	}

	params := map[string]any{
		"gameId":   ugr.GameId,
		"name":     ugr.Name,
		"password": ugr.Password,
		"ownerId":  ugr.OwnerId,
		"playerId": playerId,
	}

	_, err = stmt.Exec(params)
	if err != nil {
		return err
	}

	return nil
}

func (r *Repository) DeleteGame(dgr DeleteGameRequest, playerId int) error {
	stmt, err := r.db.PrepareNamed(`DELETE FROM game WHERE game_id = :gameId AND owner_id = :ownerId`)
	if err != nil {
		return err
	}

	params := map[string]any{
		"gameId":  dgr.GameId,
		"ownerId": playerId,
	}

	_, err = stmt.Exec(params)
	if err != nil {
		return err
	}

	return nil
}

func (r *Repository) CreatePlayerGame(cpgr CreatePlayerGameRequest) error {
	stmt, err := r.db.PrepareNamed(`INSERT INTO game (game_id, player_id) VALUES (:gameId, :playerId)`)
	if err != nil {
		return err
	}

	params := map[string]any{
		"gameId":   cpgr.GameId,
		"playerId": cpgr.PlayerId,
	}

	_, err = stmt.Exec(params)
	if err != nil {
		return err
	}

	return nil
}
