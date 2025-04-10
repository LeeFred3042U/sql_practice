-- Top 3 weapons ranked by total headshots across all players
SELECT 
    w.weapon_name,
    SUM(pws.headshots) AS total_headshots
FROM player_weapon_stats pws
JOIN weapons w ON pws.weapon_id = w.weapon_id
GROUP BY w.weapon_name
ORDER BY total_headshots DESC
LIMIT 3;
