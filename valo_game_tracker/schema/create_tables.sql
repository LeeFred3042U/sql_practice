-- Table containing Agents
CREATE TABLE agents (
    agent_id INT PRIMARY KEY,
    agent_name VARCHAR(30) NOT NULL,
    role VARCHAR(20) -- Duelist, Controller, Initiator, Sentinel
);

-- Table for Players
CREATE TABLE players (
    player_id INT PRIMARY KEY,
    player_name VARCHAR(50) NOT NULL,
    region VARCHAR(20)
);

-- Table showing Match info
CREATE TABLE matches (
    match_id INT PRIMARY KEY,
    match_date DATE NOT NULL,
    map_name VARCHAR(30),
    winning_team VARCHAR(20)
);

-- Table telling about the Stats in the Match the player played 
CREATE TABLE player_match_stats (
    match_id INT,
    player_id INT,
    agent_id INT,
    kills INT DEFAULT 0,
    deaths INT DEFAULT 0,
    assists INT DEFAULT 0,
    team VARCHAR(10),
    PRIMARY KEY (match_id, player_id),
    FOREIGN KEY (match_id) REFERENCES matches(match_id),
    FOREIGN KEY (player_id) REFERENCES players(player_id),
    FOREIGN KEY (agent_id) REFERENCES agents(agent_id)
);

-- Weapon List
CREATE TABLE weapons (
    weapon_id INT PRIMARY KEY,
    weapon_name VARCHAR(30) NOT NULL,
    type VARCHAR(20) -- Rifle, Sniper, SMG, Sidearm, Shotgun, Melee
);

-- TPlayer Weapon Stats per Match
CREATE TABLE player_weapon_stats (
    match_id INT,
    player_id INT,
    weapon_id INT,
    kills_with_weapon INT DEFAULT 0,
    shots_fired INT DEFAULT 0,
    shots_hit INT DEFAULT 0,
    headshots INT DEFAULT 0,
    PRIMARY KEY (match_id, player_id, weapon_id),
    FOREIGN KEY (match_id) REFERENCES matches(match_id),
    FOREIGN KEY (player_id) REFERENCES players(player_id),
    FOREIGN KEY (weapon_id) REFERENCES weapons(weapon_id)
);
