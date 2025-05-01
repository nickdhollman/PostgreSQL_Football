-- Insert missing values with placeholder to enforce foreign keys
INSERT INTO players (player_id, name)
SELECT DISTINCT player_id, 'Unknown Player'
FROM (
    SELECT player_id FROM game_events
    UNION
    SELECT player_id FROM appearances
    UNION
    SELECT player_id FROM player_valuations
) AS all_players
WHERE player_id IS NOT NULL
  AND player_id NOT IN (SELECT player_id FROM players);

INSERT INTO games (game_id)
SELECT DISTINCT game_id
FROM (
    SELECT game_id FROM appearances
    UNION
    SELECT game_id FROM club_games
    UNION
    SELECT game_id FROM game_events
) AS all_games
WHERE game_id IS NOT NULL
  AND game_id NOT IN (SELECT game_id FROM games);

INSERT INTO clubs (club_id, name)
SELECT DISTINCT club_id, 'Unknown Club'
FROM (
    SELECT home_club_id AS club_id FROM games
    UNION
    SELECT away_club_id FROM games
    UNION
    SELECT club_id FROM club_games
    UNION
    SELECT opponent_id FROM club_games
    UNION
    SELECT player_current_club_id FROM appearances
    UNION
    SELECT current_club_id FROM players
    UNION
    SELECT current_club_id FROM player_valuations
    UNION
    SELECT club_id FROM game_events
) AS all_clubs
WHERE club_id IS NOT NULL
  AND club_id NOT IN (SELECT club_id FROM clubs);

INSERT INTO competitions (competition_id, name, type)
SELECT DISTINCT competition_id, 'Unknown Competition', 'other'
FROM (
    SELECT competition_id FROM games
    UNION
    SELECT current_club_domestic_competition_id FROM players
    UNION
    SELECT player_club_domestic_competition_id FROM player_valuations
) AS all_competitions
WHERE competition_id IS NOT NULL
  AND competition_id NOT IN (SELECT competition_id FROM competitions);

-- Foreign keys for games
ALTER TABLE games
ADD CONSTRAINT fk_games_competitions FOREIGN KEY (competition_id) REFERENCES competitions(competition_id);

ALTER TABLE games
ADD CONSTRAINT fk_games_home_club FOREIGN KEY (home_club_id) REFERENCES clubs(club_id);

ALTER TABLE games
ADD CONSTRAINT fk_games_away_club FOREIGN KEY (away_club_id) REFERENCES clubs(club_id);

-- Foreign keys for club_games
ALTER TABLE club_games
ADD CONSTRAINT fk_club_games_game FOREIGN KEY (game_id) REFERENCES games(game_id);

ALTER TABLE club_games
ADD CONSTRAINT fk_club_games_club FOREIGN KEY (club_id) REFERENCES clubs(club_id);

ALTER TABLE club_games
ADD CONSTRAINT fk_club_games_opponent FOREIGN KEY (opponent_id) REFERENCES clubs(club_id);

-- Foreign keys for appearances
ALTER TABLE appearances
ADD CONSTRAINT fk_appearances_game FOREIGN KEY (game_id) REFERENCES games(game_id);

ALTER TABLE appearances
ADD CONSTRAINT fk_appearances_player FOREIGN KEY (player_id) REFERENCES players(player_id);

-- Foreign keys for game_events
ALTER TABLE game_events
ADD CONSTRAINT fk_game_events_game FOREIGN KEY (game_id) REFERENCES games(game_id);

ALTER TABLE game_events
ADD CONSTRAINT fk_game_events_player FOREIGN KEY (player_id) REFERENCES players(player_id);

ALTER TABLE game_events
ADD CONSTRAINT fk_game_events_club FOREIGN KEY (club_id) REFERENCES clubs(club_id);

-- Foreign keys for player_valuations
ALTER TABLE player_valuations
ADD CONSTRAINT fk_valuations_player FOREIGN KEY (player_id) REFERENCES players(player_id);

-- Foreign keys for players
ALTER TABLE players
ADD CONSTRAINT fk_players_club FOREIGN KEY (current_club_id) REFERENCES clubs(club_id);