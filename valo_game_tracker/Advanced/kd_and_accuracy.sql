-- Locate player with the highest weapon accuracy
SELECT p.player_name, 
       ROUND(SUM(pws.shots_hit) * 100.0 / SUM(pws.shots_fired), 2) AS accuracy_percent
FROM player_weapon_stats pws
JOIN players p ON pws.player_id = p.player_id
GROUP BY p.player_name
HAVING SUM(pws.shots_fired) >= 20
ORDER BY accuracy_percent DESC
LIMIT 5;

-- Find players with the highest K/D ratio across all matches
SELECT p.player_name, 
       ROUND(SUM(pms.kills) / SUM(pms.deaths), 2) AS overall_kd_ratio
FROM player_match_stats pms
JOIN players p ON pms.player_id = p.player_id
GROUP BY p.player_name
ORDER BY overall_kd_ratio DESC
LIMIT 5;
