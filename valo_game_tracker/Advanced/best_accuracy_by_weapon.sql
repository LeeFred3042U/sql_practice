-- 🧠 Rank players by best accuracy (shots_hit/shots_fired) per weapon (min 20 shots)
SELECT 
    p.player_name,
    w.weapon_name,
    ROUND(SUM(pws.shots_hit) * 100.0 / SUM(pws.shots_fired), 2) AS accuracy_percent,
    RANK() OVER (PARTITION BY w.weapon_id ORDER BY SUM(pws.shots_hit) * 1.0 / NULLIF(SUM(pws.shots_fired), 0) DESC) AS rank_in_weapon
FROM player_weapon_stats pws
JOIN players p ON p.player_id = pws.player_id
JOIN weapons w ON w.weapon_id = pws.weapon_id
GROUP BY p.player_name, w.weapon_name, w.weapon_id
HAVING SUM(pws.shots_fired) >= 20;
