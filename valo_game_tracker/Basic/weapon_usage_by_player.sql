-- Listing all weapons used by a specific player in all matches
SELECT DISTINCT w.weapon_name
FROM player_weapon_stats pws
JOIN weapons w ON pws.weapon_id = w.weapon_id
WHERE pws.player_id = 1;
