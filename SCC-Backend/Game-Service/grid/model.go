package grid

import "database/sql"

type Coordinate struct {
	X int `json:"x" db:"x"`
	Y int `json:"y" db:"y"`
}

type CellData struct {
	ZoneType              string `json:"zoneType" db:"zone_type"`
	Population            int    `json:"population" db:"population"`
	Pollution             int    `json:"pollution" db:"pollution"`
	AvailableWorkers      int    `json:"availableWorkers" db:"available_workers"`
	AvailableGoods        int    `json:"availableGoods" db:"available_goods"`
	IsPowered             bool   `json:"isPowered" db:"is_powered"`
	IsAdjacentToPowerline bool   `json:"isAdjacentToPowerline" db:"is_adjacent_to_powerline"`
}

type CellRequest struct {
	CellId int `json:"cellId" db:"cell_id"`
	Coordinate
	CellData
	BuildingId sql.NullInt64 `json:"buildingId" db:"building_id"`
	CityId     int           `json:"cityId" db:"city_id"`
}

type Cell struct {
	CellId int `json:"cellId" db:"cell_id"`
	Coordinate
	CellData
	BuildingId int `json:"buildingId" db:"building_id"`
	CityId     int `json:"cityId" db:"city_id"`
}

type Grid struct {
	CityId    int    `json:"cityId" db:"city_id"`
	Height    int    `json:"height" db:"height"`
	Width     int    `json:"width" db:"width"`
	UpdatedAt string `json:"updatedAt" db:"updated_at"`
	Cells     []Cell `json:"cells"`
}

type CreateGridRequest struct {
	CityID int    `json:"cityId" db:"city_id"`
	Height int    `json:"height" db:"height"`
	Width  int    `json:"width" db:"width"`
	Cells  []Cell `json:"cells" db:"-"`
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
	CityID    int    `json:"cityId"`
	Changes   []Cell `json:"changes"`
	Timestamp int64  `json:"timestamp"`
}

type UpdateCellRequest struct {
	CellId int `json:"cellId" db:"cell_id"`
	Coordinate
	CellData
	BuildingId int `json:"buildingId" db:"building_id"`
}
