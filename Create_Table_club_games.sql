CREATE TABLE public.club_games (
	game_id integer NOT NULL,
	club_id integer NOT NULL,
	own_goals integer,
	own_position integer,
	own_manager_name character varying,
	opponent_id integer,
	opponent_goals integer,
	opponent_position integer,
	opponent_manager_name character varying,
	hosting character varying,
	is_win integer,
	CONSTRAINT club_games_pkey PRIMARY KEY (game_id, club_id)
)