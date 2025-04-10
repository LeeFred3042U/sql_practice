-- Locate player ranking based on kills in each match (using window functions)
SELECT p.player_name, m.match_id, pms.kills,
       RANK() OVER (PARTITION BY m.match_id ORDER BY pms.kills DESC) AS kill_rank
FROM player_match_stats pms
JOIN players p ON pms.player_id = p.player_id
JOIN matches m ON pms.match_id = m.match_id
ORDER BY m.match_id, kill_rank;
