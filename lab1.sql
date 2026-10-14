-- Drop tables
DROP TABLE IF EXISTS player_contracts, player_attributes, players, clubs;

-- Clubs details
CREATE TABLE clubs (
  club_id TEXT PRIMARY KEY,
  club_name VARCHAR(120) UNIQUE NOT NULL
);

-- Players details
CREATE TABLE players (
  player_id INT PRIMARY KEY,         
  player_name TEXT NOT NULL,   
  age INT,                     
  nationality TEXT, 
  preferred_foot TEXT,          
  body_type TEXT,           
  height TEXT,                   
  weight TEXT                    
);

-- Player attributes/ratings
CREATE TABLE player_attributes (
  player_attributes_id serial primary key,  
  player_id INT REFERENCES players(player_id),
  overall INT,
  potential INT,
  international_reputation INT,  
  weak_foot INT,                
  skill_moves INT,               
  work_rate VARCHAR(30),       
  position VARCHAR(10),       
  heading_accuracy INT,
  dribbling INT,
  agility INT,
  penalties INT
);

--Player and club contract and finances
CREATE TABLE player_contracts (
  player_contract_id serial,  
  player_id INT REFERENCES players(player_id),
  club_id TEXT REFERENCES clubs(club_id),
  joined DATE,                
  contract_valid_until INT,      
  jersey_number INT,
  value NUMERIC(12,0),  
  wage INT,
  release_clause INT
);
