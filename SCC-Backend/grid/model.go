package grid

type Coordinate struct {
	X int `json:"x" db:"x"`
	Y int `json:"y" db:"y"`
}

type Cell struct {
	CellId int `json:"cellId" db:"cell_id"`
	Coordinate
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
