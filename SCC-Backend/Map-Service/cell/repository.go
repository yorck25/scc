package cell

import (
	"encoding/json"
	"github.com/jmoiron/sqlx"
	"map-service/core"
)

type Repository struct {
	db *sqlx.DB
}

func NewRepository(ctx *core.WebContext) *Repository {
	return &Repository{db: ctx.GetDb()}
}

func (r *Repository) GetCellsForGrid(cityId int) ([]Cell, error) {
	var cellRequests []CellRequest

	stmt, err := r.db.PrepareNamed(`SELECT * FROM grid.cells WHERE city_id = :cityId`)
	if err != nil {
		return nil, err
	}

	err = stmt.Select(&cellRequests, map[string]any{
		"cityId": cityId,
	})
	if err != nil {
		return nil, err
	}

	var cells []Cell
	for _, cr := range cellRequests {
		cell := Cell{
			Coordinate: cr.Coordinate,
			CellData:   cr.CellData,
			BuildingId: 0,
			CityId:     cr.CityId,
		}

		if cr.BuildingId.Valid {
			cell.BuildingId = int(cr.BuildingId.Int64)
		}

		cells = append(cells, cell)
	}

	return cells, nil
}

func (r *Repository) GetCell(cityId, x, y int) (*Cell, error) {
	var cell Cell

	stmt, err := r.db.PrepareNamed(`SELECT * FROM grid.cells WHERE city_id = $1 AND x = $2 AND y = $3`)
	if err != nil {
		return nil, err
	}

	err = stmt.Get(&cell, map[string]any{
		"cityId": cityId,
		"x":      x,
		"y":      y,
	})

	if err != nil {
		return nil, err
	}

	return &cell, err
}

func (r *Repository) CreateCell(cell Cell) error {
	stmt, err := r.db.PrepareNamed(`
		INSERT INTO grid.cells (
			x, y, building_id, city_id,
			zone_type, population, pollution,
			available_workers, available_goods,
			is_powered, is_adjacent_to_powerline
		) VALUES (
			:x, :y, :buildingId, :cityId,
			:zoneType, :population, :pollution,
			:availableWorkers, :availableGoods,
			:isPowered, :isAdjacentToPowerline
		)
	`)
	if err != nil {
		return err
	}

	var buildingId *int = nil

	if cell.BuildingId != 0 {
		buildingId = &cell.BuildingId
	}

	goodsJSON, err := json.Marshal(cell.AvailableGoods)
	if err != nil {
		return err
	}

	params := map[string]any{
		"x":                     cell.X,
		"y":                     cell.Y,
		"buildingId":            buildingId,
		"cityId":                cell.CityId,
		"zoneType":              cell.ZoneType,
		"population":            cell.Population,
		"pollution":             cell.Pollution,
		"availableWorkers":      cell.AvailableWorkers,
		"availableGoods":        goodsJSON,
		"isPowered":             cell.IsPowered,
		"isAdjacentToPowerline": cell.IsAdjacentToPowerline,
	}

	_, err = stmt.Exec(params)
	return err
}

func (r *Repository) UpdateCell(ugr Cell) error {
	var exists bool

	stmt, err := r.db.PrepareNamed(`
		SELECT EXISTS(
			SELECT 1 FROM grid.cells
			WHERE city_id = :cityId AND x = :x AND y = :y
		)
	`)
	if err != nil {
		return err
	}

	params := map[string]any{
		"x":      ugr.X,
		"y":      ugr.Y,
		"cityId": ugr.CityId,
	}

	err = stmt.Get(&exists, params)
	if err != nil {
		return err
	}

	if exists {
		err = r.updateCell(ugr)
	} else {
		err = r.CreateCell(ugr)
	}

	return err
}

func (r *Repository) updateCell(cell Cell) error {
	stmt, err := r.db.PrepareNamed(`
		UPDATE grid.cells SET
			building_id = :buildingId,
			zone_type = :zoneType,
			population = :population,
			pollution = :pollution,
			available_workers = :availableWorkers,
			available_goods = :availableGoods,
			is_powered = :isPowered,
			is_adjacent_to_powerline = :isAdjacentToPowerline
		WHERE city_id = :cityId AND x = :x AND y = :y
	`)
	if err != nil {
		return err
	}

	var buildingIn *int
	if cell.BuildingId == 0 {
		buildingIn = nil
	} else {
		buildingIn = &cell.BuildingId
	}

	goodsJSON, err := json.Marshal(cell.AvailableGoods)
	if err != nil {
		return err
	}

	params := map[string]any{
		"x":                     cell.X,
		"y":                     cell.Y,
		"buildingId":            buildingIn,
		"cityId":                cell.CityId,
		"zoneType":              cell.ZoneType,
		"population":            cell.Population,
		"pollution":             cell.Pollution,
		"availableWorkers":      cell.AvailableWorkers,
		"availableGoods":        goodsJSON,
		"isPowered":             cell.IsPowered,
		"isAdjacentToPowerline": cell.IsAdjacentToPowerline,
	}

	_, err = stmt.Exec(params)
	return err
}

func (r *Repository) DeleteSingleCell(cityId, x, y int) error {
	stmt, err := r.db.PrepareNamed(`DELETE FROM grid.cells WHERE city_id = :cityId AND x = :x AND y = :y`)
	if err != nil {
		return err
	}

	_, err = stmt.Exec(map[string]any{
		"cityId": cityId,
		"x":      x,
		"y":      y,
	})

	return err
}

func (r *Repository) DeleteCellForGrid(cityId int) error {
	stmt, err := r.db.PrepareNamed(`DELETE FROM grid.cells WHERE city_id = :cityId`)
	if err != nil {
		return err
	}

	_, err = stmt.Exec(map[string]any{
		"cityId": cityId,
	})

	return err
}
