package grid

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

func (r *Repository) GetGridForGame(cityId int) (*Grid, error) {
	var grid Grid

	stmt, err := r.db.PrepareNamed(`SELECT * FROM grid WHERE city_id = :cityId`)
	if err != nil {
		return nil, err
	}

	params := map[string]any{
		"cityId": cityId,
	}

	err = stmt.Get(&grid, params)
	if err != nil {
		return nil, err
	}

	return &grid, nil
}

func (r *Repository) CreateGridForCity(cgr CreateGridRequest) error {
	stmt, err := r.db.PrepareNamed(`INSERT INTO grid (city_id, x, y) VALUES (:cityId, :x, :y)`)
	if err != nil {
		return err
	}

	params := map[string]any{
		"cityId": cgr.CityId,
		"x":      cgr.X,
		"y":      cgr.Y,
	}

	_, err = stmt.Exec(params)
	if err != nil {
		return err
	}

	return nil
}

func (r *Repository) UpdateGrid(ugr UpdateGridRequest) error {
	stmt, err := r.db.PrepareNamed(`UPDATE grid SET city_id = :cityId, x = :x, y = :y, building_id = :buildingId WHERE city_id = :cityId`)
	if err != nil {
		return err
	}

	params := map[string]any{
		"cityId":     ugr.CityId,
		"x":          ugr.X,
		"y":          ugr.Y,
		"buildingId": ugr.BuildingId,
	}

	_, err = stmt.Exec(params)
	if err != nil {
		return err
	}

	return nil
}

func (r *Repository) DeleteGrid(dgr DeleteGridRequest) error {
	stmt, err := r.db.PrepareNamed(`DELETE FROM grid WHERE city_id = :cityId`)
	if err != nil {
		return err
	}

	params := map[string]any{
		"cityId": dgr.CityId,
	}

	_, err = stmt.Exec(params)
	if err != nil {
		return err
	}

	return nil
}
