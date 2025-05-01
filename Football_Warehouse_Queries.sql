-- Players with the Most Goals in Game Events
SELECT p.name, COUNT(*) AS goals_scored
FROM game_events ge
JOIN players p ON ge.player_id = p.player_id
WHERE ge.type = 'Goals' AND p.name != 'Unknown Player'
GROUP BY p.name
ORDER BY goals_scored DESC
LIMIT 10;

-- Average Attendance by Competition
SELECT c.name AS competition_name, ROUND(AVG(g.attendance)) AS avg_attendance
FROM games g
JOIN competitions c ON g.competition_id = c.competition_id
GROUP BY c.name
ORDER BY avg_attendance DESC;

-- Player Market Value Over Time (for Lionel Messi)
SELECT pv.date, pv.market_value_in_eur
FROM player_valuations pv
JOIN players p ON pv.player_id = p.player_id
WHERE p.name = 'Lionel Messi'
ORDER BY pv.date;

-- Clubs with Highest Average Player Value
SELECT c.name AS club_name, ROUND(AVG(pv.market_value_in_eur)) AS avg_value
FROM player_valuations pv
JOIN clubs c ON pv.current_club_id = c.club_id
GROUP BY c.name
ORDER BY avg_value DESC
LIMIT 10;

-- Most Frequent Home Club Formations
SELECT home_club_formation, COUNT(*) AS matches
FROM games
WHERE home_club_formation IS NOT NULL
GROUP BY home_club_formation
ORDER BY matches DESC
LIMIT 15;

-- Players with Most Assists
-- This is assuming that player_assist_id indicates the player id that 
SELECT p.name, COUNT(*) AS assists
FROM game_events ge
JOIN players p ON ge.player_assist_id = p.player_id
WHERE ge.player_assist_id IS NOT NULL AND p.name != 'Unknown Player'
GROUP BY p.name
ORDER BY assists DESC
LIMIT 10;


-- Clubs with Most Matches Played
SELECT c.name, COUNT(*) AS matches_played
FROM club_games cg
JOIN clubs c ON cg.club_id = c.club_id
WHERE c.name != 'Unknown Club'
GROUP BY c.name
ORDER BY matches_played DESC
LIMIT 10;
