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

func (r *Repository) GetAuditsFromPlayer(playerId int64) ([]Audit, error) {
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

func (r *Repository) CreateNewAudit(playerId int64) ([]Audit, error) {
	audits := make([]Audit, 0)

	stmt, err := r.db.PrepareNamed(`Insert INTO audit VALUE (player_id = :playerId)`)
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
