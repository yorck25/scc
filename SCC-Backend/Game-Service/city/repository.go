package city

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

func (r *Repository) CreateNewCity(ccr CreateCityRequest, playerId int) (*City, error) {
	var city City
	stmt, err := r.db.PrepareNamed(`INSERT INTO game.city (name, game_id, owner_id) VALUES (:name, :gameId, :ownerId) RETURNING *`)
	if err != nil {
		return &city, err
	}

	params := map[string]any{
		"name":    ccr.Name,
		"gameId":  ccr.GameId,
		"ownerId": playerId,
	}

	err = stmt.Get(&city, params)
	if err != nil {
		return &city, err
	}

	return &city, nil
}

func (r *Repository) UpdateCity(ucr UpdateCityRequest, playerId int) error {
	stmt, err := r.db.PrepareNamed(`UPDATE game.city SET name = :name, game_id = :gameId WHERE city_id = :cityId AND owner_id = :ownerId`)
	if err != nil {
		return err
	}

	params := map[string]any{
		"cityId":  ucr.CityId,
		"name":    ucr.Name,
		"gameId":  ucr.GameId,
		"ownerId": playerId,
	}

	_, err = stmt.Exec(params)
	if err != nil {
		return err
	}

	return nil
}

func (r *Repository) DeleteCity(dcr DeleteCityRequest, playerId int) error {
	stmt, err := r.db.PrepareNamed(`DELETE FROM game.city WHERE city_id = :cityId AND owner_id = :ownerId`)
	if err != nil {
		return err
	}

	params := map[string]any{
		"cityId":  dcr.CityId,
		"ownerId": playerId,
	}

	_, err = stmt.Exec(params)
	if err != nil {
		return err
	}

	return nil
}

func (r *Repository) GetAllCitiesForGame(gameId int) ([]City, error) {
	var cities []City

	stmt, err := r.db.PrepareNamed(`SELECT * FROM game.city WHERE game_id = :gameId`)
	if err != nil {
		return nil, err
	}

	params := map[string]any{
		"gameId": gameId,
	}

	err = stmt.Select(&cities, params)
	if err != nil {
		return nil, err
	}

	return cities, nil
}

func (r *Repository) GetCityByName(gameId int, name string) ([]City, error) {
	var cities []City

	stmt, err := r.db.PrepareNamed(`SELECT * FROM game.city WHERE game_id = :gameId AND name LIKE :name`)
	if err != nil {
		return nil, err
	}

	params := map[string]any{
		"gameId": gameId,
		"name":   name,
	}

	err = stmt.Select(&cities, params)
	if err != nil {
		return nil, err
	}

	return cities, nil
}
