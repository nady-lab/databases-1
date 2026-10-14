/*
Nadyla Barbosa 
Databases 1 - Lab 5
13/10/2026
*/

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

SELECT * FROM clubs, players, player_attributes, player_contracts;

SELECT player_name, club_name
FROM players
JOIN player_contracts USING (player_id)
JOIN clubs USING (club_id)
ORDER BY player_name;

SELECT player_name, wage, club_name
FROM players
JOIN player_contracts USING (player_id)
JOIN clubs USING (club_id)
ORDER BY wage DESC LIMIT 10;

SELECT player_name, club_name, contract_valid_until
FROM players
JOIN player_contracts USING (player_id)
JOIN clubs USING (club_id)
WHERE contract_valid_until = 2025
ORDER BY player_name;

-- LAB 5 START
-- q1
SELECT player_id
FROM players
WHERE age > 40
EXCEPT
SELECT player_id
FROM player_contracts;

-- q2
SELECT player_id
FROM player_attributes
EXCEPT
SELECT player_id
FROM player_contracts
ORDER BY player_id;

-- q3
SELECT player_id
FROM players
WHERE age < 20
INTERSECT
SELECT player_id
FROM player_contracts
ORDER BY player_id ASC;
 
-- q4
SELECT player_id
FROM player_attributes
WHERE overall >= 85
EXCEPT
SELECT player_id
FROM player_contracts;

-- q5
SELECT player_id
FROM players
INTERSECT
SELECT player_id
FROM player_contracts
INTERSECT
SELECT player_id
FROM player_attributes;

-- q6
SELECT player_id
FROM players
WHERE lower(preferred_foot) = 'left'
UNION 
SELECT player_id
FROM player_attributes
WHERE upper(position) = 'gk';
