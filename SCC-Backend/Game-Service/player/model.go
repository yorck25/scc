package player

type Player struct {
	Id       int    `json:"id" db:"id"`
	Username string `json:"username" db:"username"`
	Email    string `json:"email" db:"email"`
	Password string `json:"password" db:"password"`
}

type PlayerStats struct {
	PlayerId int     `json:"playerId" db:"player_id"`
	Balance  float64 `json:"balance" db:"balance"`
	tax_rate int     `json:"taxRate" db:"tax_rate"`
}
