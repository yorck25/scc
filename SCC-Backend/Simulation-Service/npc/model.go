package npc

import "time"

type Npc struct {
	ID            int       `db:"id" json:"id"`
	Name          string    `db:"name" json:"name"`
	Gender        *string   `db:"gender" json:"gender"`
	CityID        *int      `db:"city_id" json:"cityId"`
	HomeCellID    *int      `db:"home_cell_id" json:"homeCellId"`
	WorkCellID    *int      `db:"work_cell_id" json:"workCellId"`
	CurrentCellID *int      `db:"current_cell_id" json:"currentCellId"`
	Degree        int       `db:"degree" json:"degree"`
	Happiness     float64   `db:"happiness" json:"happiness"`
	Money         float64   `db:"money" json:"money"`
	Profession    string    `db:"profession" json:"profession"`
	State         string    `db:"state" json:"state"`
	LastUpdated   time.Time `db:"last_updated" json:"lastUpdated"`
}

type CreateNpcRequest struct {
	Name          string  `db:"name" json:"name"`
	Gender        *string `db:"gender" json:"gender"`
	CityID        *int    `db:"city_id" json:"cityId"`
	HomeCellID    *int    `db:"home_cell_id" json:"homeCellId"`
	CurrentCellID *int    `db:"current_cell_id" json:"currentCellId"`
}

type NameData struct {
	FirstNames struct {
		Male   []string `json:"male"`
		Female []string `json:"female"`
	} `json:"firstNames"`
	LastNames []string `json:"lastNames"`
}
