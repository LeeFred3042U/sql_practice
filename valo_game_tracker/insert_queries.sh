BASE_PATH="/home/zeeshan/Coding/sql_practice/valo_game_tracker"

# Checking folders Existence
mkdir -p "$BASE_PATH/Basic"
mkdir -p "$BASE_PATH/Intermediate"
mkdir -p "$BASE_PATH/Advanced"

# Queries being entered in Basic folder
cat <<EOF > "$BASE_PATH/Basic/match_info_queries.sql"
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
EOF

# Adding things to intermediate
cat <<EOF > "$BASE_PATH/Intermediate/player_weapon_agent_stats.sql"
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
EOF

# Asking for Advaance questions ig since we need Advance level queries
cat <<EOF > "$BASE_PATH/Advanced/kd_and_accuracy.sql"
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
EOF

# Bonus window query
cat <<EOF > "$BASE_PATH/Advanced/player_rank_by_match.sql"
-- Locate player ranking based on kills in each match (using window functions)
SELECT p.player_name, m.match_id, pms.kills,
       RANK() OVER (PARTITION BY m.match_id ORDER BY pms.kills DESC) AS kill_rank
FROM player_match_stats pms
JOIN players p ON pms.player_id = p.player_id
JOIN matches m ON pms.match_id = m.match_id
ORDER BY m.match_id, kill_rank;
EOF

echo "✅ All queries have been saved to their respective files with descriptive names."
