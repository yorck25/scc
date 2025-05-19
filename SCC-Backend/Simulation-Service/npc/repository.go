package npc

import (
	"github.com/jmoiron/sqlx"
	"simulation-service/core"
	"time"
)

type Repository struct {
	db *sqlx.DB
}

func NewRepository(ctx *core.WebContext) *Repository {
	return &Repository{db: ctx.GetDb()}
}

func (r *Repository) InsertNpc(cnr CreateNpcRequest) error {
	stmt, err := r.db.PrepareNamed(`INSERT INTO simulation.npc (name, gender, city_id, home_cell_id, current_cell_id, last_updated) VALUES (:name, :gender, :cityId, :homeCellId, :currentCellId, :lastUpdated)`)
	if err != nil {
		return err
	}

	params := map[string]any{
		"name":          cnr.Name,
		"gender":        cnr.Gender,
		"cityId":        cnr.CityID,
		"homeCellId":    cnr.HomeCellID,
		"currentCellId": cnr.CurrentCellID,
		"lastUpdated":   time.Now(),
	}

	_, err = stmt.Exec(params)
	return err
}
