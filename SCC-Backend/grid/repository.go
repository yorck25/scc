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

	cells, err := r.GetCells(cityId)
	if err != nil {
		return nil, err
	}

	grid.Cells = cells
	return &grid, nil
}

func (r *Repository) CreateGridForCity(cgr CreateGridRequest) error {
	stmt, err := r.db.PrepareNamed(`INSERT INTO grid (city_id,height,width) VALUES (:cityId, :height, :width)`)
	if err != nil {
		return err
	}

	params := map[string]any{
		"cityId": cgr.CityID,
		"height": cgr.Height,
		"width":  cgr.Width,
	}

	_, err = stmt.Exec(params)
	if err != nil {
		return err
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
				return err
			}
		}
	}

	return nil
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

func (r *Repository) GetCells(cityId int) ([]Cell, error) {
	var cells []Cell

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

	return cells, nil
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

func (r *Repository) UpdateCell(ugr UpdateGridRequest) error {
	var exists bool

	stmt, err := r.db.PrepareNamed(`SELECT EXISTS(SELECT 1 FROM cells WHERE city_id = :cityId AND x = :x AND y = :y)`)
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

	params := map[string]any{
		"x":          cell.X,
		"y":          cell.Y,
		"buildingId": cell.BuildingId,
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
