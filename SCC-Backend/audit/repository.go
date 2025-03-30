package audit

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

func (r *Repository) GetAuditsFromPlayer(playerId int) ([]Audit, error) {
	audits := make([]Audit, 0)

	stmt, err := r.db.PrepareNamed(`SELECT * FROM audit WHERE player_id = :playerId`)
	if err != nil {
		return nil, err
	}

	params := map[string]any{
		"playerId": playerId,
	}

	err = stmt.Select(&audits, params)
	if err != nil {
		return nil, err
	}

	return audits, nil
}

func (r *Repository) CreateNewAudit(car CreateAuditRequest, playerId int) error {
	audits := make([]Audit, 0)

	stmt, err := r.db.PrepareNamed(`INSERT INTO audit (player_id, action, old_value, new_value) VALUES (:playerId, :action, :old, :new)`)
	if err != nil {
		return err
	}

	params := map[string]any{
		"playerId": playerId,
		"action":   car.Action,
		"old":      string(car.OldValue),
		"new":      string(car.NewValue),
	}

	err = stmt.Select(&audits, params)
	if err != nil {
		return err
	}

	return nil
}
