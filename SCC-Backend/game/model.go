package game

type Game struct {
	GameId   int    `json:"gameId" db:"game_id"`
	Name     string `json:"username" db:"username"`
	Password string `json:"password" db:"password"`
	OwnerId  int    `json:"ownerId" db:"owner_id"`
}

type CreateGameRequest struct {
	Name     string `json:"username" db:"username"`
	Password string `json:"password" db:"password"`
}

type UpdateGameRequest struct {
	GameId   int    `json:"gameId" db:"game_id"`
	Name     string `json:"username" db:"username"`
	Password string `json:"password" db:"password"`
	OwnerId  int    `json:"ownerId" db:"owner_id"`
}

type DeleteGameRequest struct {
	GameId int `json:"gameId" db:"game_id"`
}

type GamePlayer struct {
	Id       int `json:"id" db:"id"`
	PlayerId int `json:"playerId" db:"player_id"`
	GameId   int `json:"gameId" db:"game_id"`
}

type CreatePlayerGameRequest struct {
	PlayerId int `json:"playerId" db:"player_id"`
	GameId   int `json:"gameId" db:"game_id"`
}
