package grid

import (
	"github.com/jmoiron/sqlx"
	"map-service/cell"
	"map-service/core"
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
	stmt, err := r.db.PrepareNamed(`SELECT * FROM grid.grid WHERE city_id = :cityId`)
	if err != nil {
		return nil, err
	}

	err = stmt.Get(&grid, map[string]any{
		"cityId": cityId,
	})

	if err != nil {
		return nil, err
	}

	return &grid, nil
}

func (r *Repository) CreateGridForCity(cgr CreateGridRequest) (*Grid, error) {
	var grid Grid
	stmt, err := r.db.PrepareNamed(`INSERT INTO grid.grid (city_id,height,width, updated_at) VALUES (:cityId, :height, :width, :updatedAt) RETURNING *`)
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
			newCoordinate := cell.Coordinate{
				X: w,
				Y: h,
			}

			newCellData := cell.CellData{
				ZoneType:              "plane",
				Population:            0,
				Pollution:             0,
				AvailableWorkers:      0,
				AvailableGoods:        make(map[string]int),
				IsPowered:             false,
				IsAdjacentToPowerline: false,
			}

			newCell := cell.Cell{
				Coordinate: newCoordinate,
				BuildingId: 0,
				CellData:   newCellData,
				CityId:     cgr.CityID,
			}

			grid.Cells = append(grid.Cells, newCell)
		}
	}

	return &grid, err
}

func (r *Repository) UpdateGrid(ugr UpdateGridRequest) error {
	stmt, err := r.db.PrepareNamed(`UPDATE grid.grid SET height = :height, width = :width WHERE city_id = :cityId`)
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
	stmt, err := r.db.PrepareNamed(`DELETE FROM grid.grid WHERE city_id = :cityId`)
	if err != nil {
		return err
	}

	_, err = stmt.Exec(map[string]any{
		"cityId": dgr.CityId,
	})

	return err
}
