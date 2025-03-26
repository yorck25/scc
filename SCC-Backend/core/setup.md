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
 ┌──────────────┐       ┌────────────────┐     ┌───────────────┐
 │   players    │       │ player_stats   │     │ transactions  │
 ├──────────────┤       ├────────────────┤     ├───────────────┤
 │ id (PK)      │◄─────▶│ player_id (FK) │     │ id (PK)       │
 │ username     │       │ balance        │     │ player_id (FK)│
 │ email        │       │ tax_rate       │     │ amount        │
 └──────────────┘       └────────────────┘     └───────────────┘
          │  
          │   
   ┌───────────────────────────────────────────────────────────┐
   │                         CITY MAP                          │
   └───────────────────────────────────────────────────────────┘
        │                      │                     │
 ┌──────────────┐       ┌──────────────┐     ┌───────────────┐
 │  grid_cells  │◄─────▶│  buildings   │◄───▶│ building_types│
 ├──────────────┤       ├──────────────┤     ├───────────────┤
 │ x (PK)       │       │ id (PK)      │     │ type (PK)     │
 │ y (PK)       │       │ type (FK)    │     │ description   │
 │ owner_id (FK)│       │ owner_id (FK)│     └───────────────┘
 │ building_id  │       │ created_at   │ 
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