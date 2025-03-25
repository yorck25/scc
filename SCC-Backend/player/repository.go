package player

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

func (r *Repository) GetNews(userId string) ([]int, error) {
	news := make([]int, 0)

	//stmt, err := r.db.PrepareNamed(`SELECT * FROM news WHERE userId = :userid`)
	//if err != nil {
	//	return nil, err
	//}
	//
	//params := map[string]any{
	//	"userid": userId,
	//}
	//
	//err = stmt.Select(&news, params)
	//if err != nil {
	//	return nil, err
	//}

	return news, nil
}
