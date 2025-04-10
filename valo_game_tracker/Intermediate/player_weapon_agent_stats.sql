-- Player stats in a specific match
SELECT kills, deaths, assists
FROM player_match_stats
WHERE player_id = 1 AND match_id = 105;

-- Get the top most played agents
SELECT a.agent_name, COUNT(*) AS times_played
FROM player_match_stats pms
JOIN agents a ON pms.agent_id = a.agent_id
GROUP BY a.agent_name
ORDER BY times_played DESC
LIMIT 1;

-- Most used weapon in a match
SELECT w.weapon_name, COUNT(*) AS usage_count
FROM player_weapon_stats pws
JOIN weapons w ON pws.weapon_id = w.weapon_id
WHERE pws.match_id = 110
GROUP BY w.weapon_name
ORDER BY usage_count DESC
LIMIT 1;
