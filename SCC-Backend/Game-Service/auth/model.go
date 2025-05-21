package auth

type Player struct {
	Id       int    `json:"id" db:"id"`
	Username string `json:"username" db:"username"`
	Email    string `json:"email" db:"email"`
	Password string `json:"password" db:"password"`
}

type JoinGameRequest struct {
	GameId   int    `json:"gameId" db:"game_id"`
	Password string `json:"password" db:"password"`
}
