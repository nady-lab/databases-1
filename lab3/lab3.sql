/*
Nadyla Barbosa
Databases 1 - Lab 3
29/09/2026
*/

/* if tables already exists, they'll be deleted (no errors when the code is ran)*/ 
DROP TABLE IF EXISTS player_contracts, player_attributes, players, clubs;

/* create table to store clubs info */
CREATE TABLE clubs (
  club_id TEXT PRIMARY KEY NOT NULL,
  club_name TEXT
);

/* create table to store players info */
CREATE TABLE players (
  player_id INT PRIMARY KEY NOT NULL,
  player_name TEXT,
  age INT,
  nationality TEXT, 
  preferred_foot TEXT,
  body_type TEXT,
  height TEXT,
  weight TEXT
);

/* create table to store information on each players attributes */
CREATE TABLE player_attributes (
  player_attributes_id INT PRIMARY KEY NOT NULL,
  player_id INT,
  overall INT,
  potential INT,
  international_reputation INT,
  weak_foot INT,
  skill_moves INT,
  work_rate TEXT,
  position TEXT,
  heading_accuracy INT,
  dribbling INT,
  agility INT,
  penalties INT,
  FOREIGN KEY (player_id) REFERENCES players(player_id)
);

/* table to store info on each players contracts */
CREATE TABLE player_contracts (
  play_contract_id INT,
  player_id INT,
  club_id TEXT,
  joined TIMESTAMP,
  contract_valid_until INT,
  jersey_number INT,
  value INT,
  wage INT,
  release_clause INT,
  FOREIGN KEY (player_id) REFERENCES players(player_id),
  FOREIGN KEY (club_id) REFERENCES clubs(club_id)
);

/* 
  addition of an extra column to the "player_contracts" table
  with the default value being 0 and
  a check to make sure no negative value is entered
 */
ALTER TABLE player_contracts
ADD COLUMN bonus_column INT DEFAULT 0,
ADD CONSTRAINT bonus_not_zero CHECK (bonus_column >= 0);

SELECT * FROM clubs, players, player_attributes, player_contracts;
