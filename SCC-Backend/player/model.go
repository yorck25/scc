package player

type Player struct {
	Id       int64  `json:"id" db:"id"`
	Username string `json:"username" db:"username"`
	Email    string `json:"email" db:"email"`
	Password string `json:"password" db:"password"`
}

type PlayerStats struct {
	PlayerId int64   `json:"player_id" db:"player_id"`
	Balance  float64 `json:"balance" db:"balance"`
	tax_rate int64   `json:"tax_rate" db:"tax_rate"`
}
