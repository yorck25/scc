package grid

import "map-service/cell"

type Grid struct {
	CityId    int         `json:"cityId" db:"city_id"`
	Height    int         `json:"height" db:"height"`
	Width     int         `json:"width" db:"width"`
	UpdatedAt string      `json:"updatedAt" db:"updated_at"`
	Cells     []cell.Cell `json:"cells"`
}

type CreateGridRequest struct {
	CityID int         `json:"cityId" db:"city_id"`
	Height int         `json:"height" db:"height"`
	Width  int         `json:"width" db:"width"`
	Cells  []cell.Cell `json:"cells" db:"-"`
}

type UpdateGridRequest struct {
	CityId     int `json:"cityId" db:"city_id"`
	X          int `json:"x" db:"x"`
	Y          int `json:"y" db:"y"`
	Height     int `json:"height" db:"height"`
	Width      int `json:"width" db:"width"`
	BuildingId int `json:"buildingId" db:"building_id"`
}

type DeleteGridRequest struct {
	CityId int `json:"cityId" db:"city_id"`
}

type BroadcastUpdateGrid struct {
	CityID    int         `json:"cityId"`
	Changes   []cell.Cell `json:"changes"`
	Timestamp int64       `json:"timestamp"`
}
