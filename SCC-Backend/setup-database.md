## Database Schema
```plaintext
                           ┌────────────────┐
                           │  game_data     │
                           ├────────────────┤
                           │ game_time      │
                           │ economy_status │
                           │ tax_modifier   │
                           └──────┬─────────┘
                                  │
   ┌───────────────────────────────────────────────────────────┐
   │                      MULTIPLAYER SYSTEM                   │
   └───────────────────────────────────────────────────────────┘
        │                      │                     │
 ┌──────────────┐       ┌────────────────┐     ┌───────────────┐ ┌───────────────┐
 │   players    │       │ player_stats   │     │ transactions  │ │ game_players  │
 ├──────────────┤       ├────────────────┤     ├───────────────┤ ├───────────────┤
 │ id (PK)      │<────> │ player_id (FK) │     │ id (PK)       │ │ game_id (FK)  │
 │ username     │       │ balance        │     │ player_id (FK)│ │ id (PK)       │
 │ email        │       │ tax_rate       │     │ amount        │ │ player_Id (FK)│
 └──────┬───────┘       └────────────────┘     └───────────────┘ └───────────────┘
        │  
┌───────────────┐
│ game          │
├───────────────┤
│ game_id (PK)  │
│ name          │
│ password      │
└─────┬─────────┘
      ▼
 ┌────────────┐
 │   city     │
 ├────────────┤
 │ city_id PK │
 │ name       │
 │ game_id FK │
 │ owner_id FK│
 └────┬───────┘
      ▼  
 ┌────────────────────┐  
 │    grid_cells      │  
 ├────────────────────┤  
 │ x (PK)             │  
 │ y (PK)             │  
 │ game_id (FK)       │  
 │ owner_id (FK)      │  
 │ building_id (FK)   │  
 │ zone_type          │  
 │ population         │       
 │ pollution          │       
 │ available_workers  │       
 │ available_goods    │       
 │ is_powered         │       
 │ is_adjacent_to_powerline │ 
 └──────┬─────────────┘          
        │
        ▼                               
 ┌──────────────┐     ┌───────────────┐
 │  buildings   │<────│ building_types│
 ├──────────────┤     ├───────────────┤
 │ id (PK)      │     │ type (PK)     │
 │ type (FK)    │     │ description   │
 │ owner_id     │     └───────────────┘
 │ created_at   │ 
 │ city_id (FK) │ 
 └──────┬───────┘
        ▼
   ┌───────────────────────────────────────────────────────────┐
   │                   BUILDING-SPECIFIC TABLES                │
   └───────────────────────────────────────────────────────────┘
        │                      │                     │
 ┌──────────────┐       ┌──────────────┐     ┌─────────────────┐
 │   houses     │       │  factories   │     │   parks         │
 ├──────────────┤       ├──────────────┤     ├─────────────────┤
 │ building_id  │       │ building_id  │     │ building_id     │
 │ residents    │       │ employees    │     │ happiness_boost │
 │ comfort      │       │ pollution    │     │ greenery_level  │
 └──────────────┘       └──────────────┘     └─────────────────┘
 
   ┌───────────────────────────────────────────────────────────┐
   │                  INFRASTRUCTURE & TRAFFIC                 │
   └───────────────────────────────────────────────────────────┘
        │                      │                    
 ┌──────────────┐       ┌──────────────┐    
 │   roads      │       │  traffic     │    
 ├──────────────┤       ├──────────────┤    
 │ x (PK)       │       │ road_x (FK)  │    
 │ y (PK)       │       │ road_y (FK)  │    
 │ owner_id (FK)│       │ congestion   │    
 └──────────────┘       └──────────────┘    

   ┌────────────────────────────────────────────────────────────┐
   │                  EVENTS & DISASTERS                        │
   └────────────────────────────────────────────────────────────┘
       │
 ┌──────────────┐
 │   events     │
 ├──────────────┤
 │ id (PK)      │
 │ event_type   │
 │ affected_area│
 │ severity     │
 │ start_time   │
 └──────────────┘
```

## Create Database Commands

### Player Table

#### Create Table
```postgresql
Create TABLE Player (
    id SERIAL PRIMARY KEY,
    username VARCHAR(128) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(128) NOT NULL
);
```

#### Insert Dummy Data
```postgresql
INSERT INTO player (username, email, password) VALUES ('yorck', 'test@mail.de', 'test1234')
```

### Play Stats Table

#### Create Table
```postgresql
CREATE TABLE player_stats (
    player_id INT PRIMARY KEY,
    balance float,
    tax_rate INT,
    FOREIGN KEY (player_id) REFERENCES player(id)
);
```

### Audit Table

#### Create Table
```postgresql
CREATE TABLE audit (
    id SERIAL PRIMARY KEY,
    player_id INT,
    action VARCHAR(255) NOT NULL,
    old_value JSONB,
    new_value JSONB,
    FOREIGN KEY (player_id) REFERENCES player(id)
);
```

#### Insert Dummy Data
```postgresql
INSERT INTO audit (player_id, action, old_value, new_value) VALUES (1, 'read', '{"test":"test"}', '{"test":"test"}')
```

### Game Table

```postgresql
CREATE TABLE game (
    game_id SERIAL PRIMARY KEY,
    name varchar(255),
    password varchar(255),
    owner_id int,
    FOREIGN KEY (owner_id) REFERENCES player(id)
);
```

### Game_player Table

```postgresql
CREATE TABLE game_player (
    id SERIAL PRIMARY KEY,
    game_id int,
    player_id int,
    FOREIGN KEY (player_id) REFERENCES player(id),
    FOREIGN KEY (game_id) REFERENCES game(game_id)
);
```

### Extras
```postgresql
CREATE TABLE player
(
    id       SERIAL PRIMARY KEY,
    username VARCHAR(128) NOT NULL,
    email    VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(128) NOT NULL
);

-- Games
CREATE TABLE game
(
    game_id  SERIAL PRIMARY KEY,
    name     VARCHAR(255),
    password VARCHAR(255),
    owner_id INT,
    FOREIGN KEY (owner_id) REFERENCES player (id)
);

-- Game Player Mapping (Multiplayer)
CREATE TABLE game_player
(
    id        SERIAL PRIMARY KEY,
    game_id   INT,
    player_id INT,
    FOREIGN KEY (game_id) REFERENCES game (game_id),
    FOREIGN KEY (player_id) REFERENCES player (id)
);

-- Game State / Simulation Data
CREATE TABLE game_data
(
    game_id        INT PRIMARY KEY,
    game_time      TIMESTAMP,
    economy_status VARCHAR(255),
    tax_modifier   NUMERIC,
    FOREIGN KEY (game_id) REFERENCES game (game_id)
);

-- Player Statistics
CREATE TABLE player_stats
(
    id        SERIAL PRIMARY KEY,
    player_id INT,
    game_id   INT,
    balance   DOUBLE PRECISION,
    tax_rate  INT,
    FOREIGN KEY (player_id) REFERENCES player (id),
    FOREIGN KEY (game_id) REFERENCES game (game_id)
);

-- Financial Transactions
CREATE TABLE transactions
(
    id        SERIAL PRIMARY KEY,
    player_id INT,
    amount    NUMERIC,
    FOREIGN KEY (player_id) REFERENCES player (id)
);

-- City
CREATE TABLE city
(
    city_id  SERIAL PRIMARY KEY,
    name     VARCHAR(255),
    game_id  INT,
    owner_id INT,
    FOREIGN KEY (game_id) REFERENCES game (game_id),
    FOREIGN KEY (owner_id) REFERENCES player (id)
);

-- Grid Information
CREATE TABLE grid
(
    city_id    INT PRIMARY KEY,
    height     INT NOT NULL,
    width      INT NOT NULL,
    updated_at TIMESTAMP,
    FOREIGN KEY (city_id) REFERENCES city (city_id)
);

-- Grid Cells with Simulation Data
CREATE TABLE grid_cells
(
    x                        INT NOT NULL,
    y                        INT NOT NULL,
    city_id                  INT,
    owner_id                 INT,
    building_id              INT,
    zone_type                VARCHAR(50),
    population               INT     DEFAULT 0,
    pollution                INT     DEFAULT 0,
    available_workers        INT     DEFAULT 0,
    available_goods          INT     DEFAULT 0,
    is_powered               BOOLEAN DEFAULT FALSE,
    is_adjacent_to_powerline BOOLEAN DEFAULT FALSE,
    PRIMARY KEY (x, y, city_id),
    FOREIGN KEY (city_id) REFERENCES city (city_id),
    FOREIGN KEY (owner_id) REFERENCES player (id),
    FOREIGN KEY (building_id) REFERENCES buildings (id)
);

-- Building Types
CREATE TABLE building_types
(
    id          SERIAL PRIMARY KEY,
    type        VARCHAR(128) NOT NULL UNIQUE,
    description VARCHAR(255)
);

-- Buildings
CREATE TABLE buildings
(
    id         SERIAL PRIMARY KEY,
    type       INT NOT NULL,
    owner_id   INT NOT NULL,
    city_id    INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (type) REFERENCES building_types (id),
    FOREIGN KEY (owner_id) REFERENCES player (id),
    FOREIGN KEY (city_id) REFERENCES city (city_id)
);

-- House Buildings
CREATE TABLE houses
(
    building_id INT PRIMARY KEY,
    residents   INT,
    comfort     INT,
    rent        NUMERIC,
    FOREIGN KEY (building_id) REFERENCES buildings (id)
);

-- Factory Buildings
CREATE TABLE factories
(
    building_id  INT PRIMARY KEY,
    employees    INT,
    pollution    INT,
    output_goods INT,
    FOREIGN KEY (building_id) REFERENCES buildings (id)
);

-- Park Buildings
CREATE TABLE parks
(
    building_id     INT PRIMARY KEY,
    happiness_boost INT,
    greenery_level  INT,
    FOREIGN KEY (building_id) REFERENCES buildings (id)
);

-- Roads
CREATE TABLE roads
(
    x        INT,
    y        INT,
    owner_id INT,
    PRIMARY KEY (x, y),
    FOREIGN KEY (owner_id) REFERENCES player (id)
);

-- Traffic System
CREATE TABLE traffic
(
    road_x     INT,
    road_y     INT,
    congestion INT,
    PRIMARY KEY (road_x, road_y),
    FOREIGN KEY (road_x, road_y) REFERENCES roads (x, y)
);

-- Events & Disasters
CREATE TABLE events
(
    id            SERIAL PRIMARY KEY,
    event_type    VARCHAR(128),
    affected_area TEXT,
    severity      INT,
    start_time    TIMESTAMP
);

-- Audit Log
CREATE TABLE audit
(
    id        SERIAL PRIMARY KEY,
    player_id INT,
    action    VARCHAR(255) NOT NULL,
    old_value JSONB,
    new_value JSONB,
    FOREIGN KEY (player_id) REFERENCES player (id)
);

INSERT INTO player (username, email, password)
VALUES ('yorck', 'test@mail.de', 'test1234');

INSERT INTO game (name, password, owner_id)
VALUES ('test game 1', 'test1234', 1);

INSERT INTO city (name, game_id, owner_id)
VALUES ('test city 1', 1, 1);
INSERT INTO grid (city_id, height, width, updated_at)
VALUES (1, 10, 10, now());

INSERT INTO buildings_types (type, description)
VALUES ('House',
        'A building for human habitation, especially one that is lived in by a family or small group of people.');

INSERT INTO buildings (type, owner_id, city_id)
VALUES (1, 1, 1);
```