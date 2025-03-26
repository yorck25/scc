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
 ┌──────────────┐       ┌────────────────┐     ┌───────────────┐ ┌───────────────┐ ┌───────────────┐
 │   players    │       │ player_stats   │     │ transactions  │ │ game          │ │ game_players  │
 ├──────────────┤       ├────────────────┤     ├───────────────┤ ├───────────────┤ ├───────────────┤
 │ id (PK)      │<────> │ player_id (FK) │     │ id (PK)       │ │ game_id (PK)  │ │ game_id (FK)  │
 │ username     │       │ balance        │     │ player_id (FK)│ │ name          │ │ id (PK)       │
 │ email        │       │ tax_rate       │     │ amount        │ │ password      │ │ player_Id (FK)│
 └──────────────┘       └────────────────┘     └───────────────┘ └───────────────┘ └───────────────┘
          │  
          │   
   ┌───────────────────────────────────────────────────────────┐
   │                         CITY MAP                          │
   └───────────────────────────────────────────────────────────┘
        │                      │                     │
 ┌──────────────┐       ┌──────────────┐     ┌───────────────┐
 │  grid_cells  │<─────>│  buildings   │<───>│ building_types│
 ├──────────────┤       ├──────────────┤     ├───────────────┤
 │ x (PK)       │       │ id (PK)      │     │ type (PK)     │
 │ y (PK)       │       │ type (FK)    │     │ description   │
 │ owner_id (FK)│       │ owner_id (FK)│     └───────────────┘
 │ building_id  │       │ created_at   │ 
 │ game_id (FK) │       │              │ 
 └──────────────┘       └──────────────┘
          │
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
Create TABLE player
(
    id       SERIAL PRIMARY KEY,
    username VARCHAR(128) NOT NULL,
    email    VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(128) NOT NULL
);

CREATE TABLE audit
(
    id        SERIAL PRIMARY KEY,
    player_id INT,
    action    VARCHAR(255) NOT NULL,
    old_value JSONB,
    new_value JSONB,
    FOREIGN KEY (player_id) REFERENCES player (id)
);

CREATE TABLE game
(
    game_id  SERIAL PRIMARY KEY,
    name     varchar(255),
    password varchar(255),
    owner_id int,
    FOREIGN KEY (owner_id) REFERENCES player (id)
);

CREATE TABLE city
(
    city_id  SERIAL PRIMARY KEY,
    name     varchar(255),
    game_id  int,
    owner_id int,
    FOREIGN KEY (owner_id) REFERENCES player (id),
    FOREIGN KEY (game_id) REFERENCES game (game_id)
);

Create Table buildings_types
(
    id          SERIAL PRIMARY KEY,
    type        varchar(128) NOT NULL UNIQUE,
    description varchar(255)
);

CREATE TABLE buildings
(
    id         SERIAL PRIMARY KEY,
    type       int NOT NULL,
    owner_id   int NOT NULL,
    game_id    int NOT NULL,
    created_at timestamp DEFAULT NOW(),
    FOREIGN KEY (type) REFERENCES buildings_types (id),
    FOREIGN KEY (owner_id) REFERENCES player (id),
    FOREIGN KEY (game_id) REFERENCES game (game_id)
);

Create TABLE grid
(
    city_id     int,
    x           int,
    y           int,
    building_id int,
    PRIMARY KEY (city_id, x, y),
    FOREIGN KEY (building_id) REFERENCES buildings (id),
    FOREIGN KEY (city_id) REFERENCES city (city_id)
);

CREATE TABLE player_stats
(
    id        SERIAL PRIMARY KEY,
    player_id INT,
    game_id   INT,
    balance   float,
    tax_rate  INT,
    FOREIGN KEY (player_id) REFERENCES player (id),
    FOREIGN KEY (game_id) REFERENCES game (game_id)
);

CREATE TABLE game_player
(
    id        SERIAL PRIMARY KEY,
    game_id   int,
    player_id int,
    FOREIGN KEY (player_id) REFERENCES player (id),
    FOREIGN KEY (game_id) REFERENCES game (game_id)
);
```