-- List Players in Match
SELECT p.player_name
FROM players p
JOIN player_match_stats pms ON p.player_id = pms.player_id
WHERE pms.match_id = 101;

-- Querying Date of match, map name and duration of match
SELECT match_date, map_name, match_duration
FROM matches
WHERE match_id = 102;

-- Total Kills by Player
SELECT SUM(kills) AS total_kills
FROM player_match_stats
WHERE player_id = 1;

-- Players having Specific Weapon
SELECT DISTINCT p.player_name
FROM player_weapon_stats pws
JOIN players p ON pws.player_id = p.player_id
JOIN weapons w ON pws.weapon_id = w.weapon_id
WHERE w.weapon_name = 'Vandal';
