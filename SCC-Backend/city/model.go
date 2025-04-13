package city

type City struct {
	CityId  int    `json:"cityId" db:"city_id"`
	Name    string `json:"name" db:"name"`
	GameId  int    `json:"gameId" db:"game_id"`
	OwnerId int    `json:"ownerId" db:"ownerId"`
}

type CreateCityRequest struct {
	Name   string `json:"name" db:"name"`
	GameId int    `json:"gameId" db:"game_id"`
}

type UpdateCityRequest struct {
	CityId int    `json:"cityId" db:"city_id"`
	Name   string `json:"name" db:"name"`
	GameId int    `json:"gameId" db:"game_id"`
}

type DeleteCityRequest struct {
	CityId int `json:"cityId" db:"city_id"`
}
