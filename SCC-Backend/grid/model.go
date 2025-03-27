package grid

type Grid struct {
	CityId     int `json:"cityId" db:"city_id"`
	X          int `json:"x" db:"x"`
	Y          int `json:"y" db:"y"`
	BuildingId int `json:"buildingId" db:"building_id"`
}

type CreateGridRequest struct {
	CityId int `json:"cityId" db:"city_id"`
	X      int `json:"x" db:"x"`
	Y      int `json:"y" db:"y"`
}

type UpdateGridRequest struct {
	CityId     int `json:"cityId" db:"city_id"`
	X          int `json:"x" db:"x"`
	Y          int `json:"y" db:"y"`
	BuildingId int `json:"buildingId" db:"building_id"`
}

type DeleteGridRequest struct {
	CityId int `json:"cityId" db:"city_id"`
}
