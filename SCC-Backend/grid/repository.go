package grid

import (
	"SCC_Backend/core"
	"github.com/jmoiron/sqlx"
	"time"
)

type Repository struct {
	db *sqlx.DB
}

func NewRepository(ctx *core.WebContext) *Repository {
	return &Repository{db: ctx.GetDb()}
}

func (r *Repository) GetGridForCity(cityId int) (*Grid, error) {
	var grid Grid
	stmt, err := r.db.PrepareNamed(`SELECT * FROM grid WHERE city_id = :cityId`)
	if err != nil {
		return nil, err
	}

	err = stmt.Get(&grid, map[string]any{
		"cityId": cityId,
	})

	if err != nil {
		return nil, err
	}

	cells, err := r.GetCellsForGrid(cityId)
	if err != nil {
		return nil, err
	}

	grid.Cells = cells
	return &grid, nil
}

func (r *Repository) GetCellsForGrid(cityId int) ([]Cell, error) {
	var cells []CellRequest

	stmt, err := r.db.PrepareNamed(`SELECT * FROM cells WHERE city_id = :cityId`)
	if err != nil {
		return nil, err
	}

	err = stmt.Select(&cells, map[string]any{
		"cityId": cityId,
	})

	if err != nil {
		return nil, err
	}

	var mappedCells []Cell

	for i := range cells {
		newCell := Cell{
			CellId:     cells[i].CellId,
			Coordinate: cells[i].Coordinate,
			BuildingId: int(cells[i].BuildingId.Int64),
			CityId:     cells[i].CityId,
		}

		mappedCells = append(mappedCells, newCell)
	}

	return mappedCells, nil
}

func (r *Repository) CreateGridForCity(cgr CreateGridRequest) (*Grid, error) {
	var grid Grid
	stmt, err := r.db.PrepareNamed(`INSERT INTO grid (city_id,height,width, updated_at) VALUES (:cityId, :height, :width, :updatedAt) RETURNING *`)
	if err != nil {
		return &grid, err
	}

	params := map[string]any{
		"cityId":    cgr.CityID,
		"height":    cgr.Height,
		"width":     cgr.Width,
		"updatedAt": time.Now(),
	}

	err = stmt.Get(&grid, params)
	if err != nil {
		return &grid, err
	}

	for w := 0; w < cgr.Width; w++ {
		for h := 0; h < cgr.Width; h++ {
			newCoordinate := Coordinate{
				X: w,
				Y: h,
			}

			newCell := Cell{
				Coordinate: newCoordinate,
				CityId:     cgr.CityID,
			}

			err := r.CreateCell(newCell)
			if err != nil {
				return &grid, err
			}
		}
	}

	return &grid, err
}

func (r *Repository) UpdateGrid(ugr UpdateGridRequest) error {
	stmt, err := r.db.PrepareNamed(`UPDATE grid SET height = :height, width = :width WHERE city_id = :cityId`)
	if err != nil {
		return err
	}

	params := map[string]any{
		"height": ugr.Height,
		"width":  ugr.Width,
		"cityId": ugr.CityId,
	}

	_, err = stmt.Exec(params)
	if err != nil {
		return err
	}

	return nil
}

func (r *Repository) DeleteGrid(dgr DeleteGridRequest) error {
	err := r.DeleteCellForGrid(dgr.CityId)
	if err != nil {
		return err
	}

	stmt, err := r.db.PrepareNamed(`DELETE FROM grid WHERE city_id = :cityId`)
	if err != nil {
		return err
	}

	_, err = stmt.Exec(map[string]any{
		"cityId": dgr.CityId,
	})

	return err
}

func (r *Repository) GetCell(cityId, x, y int) (*Cell, error) {
	var cell Cell

	stmt, err := r.db.PrepareNamed(`SELECT * FROM cells WHERE city_id = $1 AND x = $2 AND y = $3`)
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
	stmt, err := r.db.PrepareNamed(`INSERT INTO cells (x, y, building_id, city_id) VALUES (:x, :y, :buildingId, :cityId)`)
	if err != nil {
		return err
	}

	params := map[string]any{
		"x":          cell.X,
		"y":          cell.Y,
		"buildingId": cell.BuildingId,
		"cityId":     cell.CityId,
	}

	_, err = stmt.Exec(params)
	return err
}

func (r *Repository) UpdateCell(ugr Cell) error {
	var exists bool

	stmt, err := r.db.PrepareNamed(`SELECT EXISTS(SELECT 1 FROM cells WHERE cell_id = :cellId AND x = :x AND y = :y)`)
	if err != nil {
		return err
	}

	params := map[string]any{
		"x":      ugr.X,
		"y":      ugr.Y,
		"cellId": ugr.CellId,
	}

	err = stmt.Get(&exists, params)
	if err != nil {
		return err
	}

	if exists {
		updatedCell := Cell{
			BuildingId: ugr.BuildingId,
			CityId:     ugr.CityId,
			Coordinate: Coordinate{
				X: ugr.X,
				Y: ugr.Y,
			},
		}

		err := r.updateCell(updatedCell)
		if err != nil {
			return err
		}
	} else {
		newCell := Cell{
			BuildingId: ugr.BuildingId,
			CityId:     ugr.CityId,
			Coordinate: Coordinate{
				X: ugr.X,
				Y: ugr.Y,
			},
		}

		err = r.CreateCell(newCell)
	}

	return err
}

func (r *Repository) updateCell(cell Cell) error {
	stmt, err := r.db.PrepareNamed(`UPDATE cells SET building_id = :buildingId WHERE city_id = :cityId AND x = :x AND y = :y`)
	if err != nil {
		return err
	}

	var buildingIn *int

	if cell.BuildingId == 0 {
		buildingIn = nil
	} else {
		buildingIn = &cell.BuildingId
	}

	params := map[string]any{
		"x":          cell.X,
		"y":          cell.Y,
		"buildingId": buildingIn,
		"cityId":     cell.CityId,
	}

	_, err = stmt.Exec(params)
	return err
}

func (r *Repository) DeleteSingleCell(cityId, x, y int) error {
	stmt, err := r.db.PrepareNamed(`DELETE FROM cells WHERE city_id = :cityId AND x = :x AND y = :y`)
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
	stmt, err := r.db.PrepareNamed(`DELETE FROM cells WHERE city_id = :cityId`)
	if err != nil {
		return err
	}

	_, err = stmt.Exec(map[string]any{
		"cityId": cityId,
	})

	return err
}
