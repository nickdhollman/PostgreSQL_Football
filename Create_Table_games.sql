-- DROP TABLE IF EXISTS public.games;

CREATE TABLE IF NOT EXISTS public.games
(
    game_id integer NOT NULL,
    competition_id character varying COLLATE pg_catalog."default",
    season integer,
    round character varying COLLATE pg_catalog."default",
    date date,
    home_club_id integer,
    away_club_id integer,
    home_club_goals integer,
    away_club_goals integer,
    home_club_position integer,
    away_club_position integer,
    home_club_manager_name character varying COLLATE pg_catalog."default",
    away_club_manager_name character varying COLLATE pg_catalog."default",
    stadium character varying COLLATE pg_catalog."default",
    attendance integer,
    referee character varying COLLATE pg_catalog."default",
    url character varying COLLATE pg_catalog."default",
    home_club_formation character varying COLLATE pg_catalog."default",
    away_club_formation character varying COLLATE pg_catalog."default",
    home_club_name character varying COLLATE pg_catalog."default",
    away_club_name character varying COLLATE pg_catalog."default",
    aggregate text COLLATE pg_catalog."default",
    competition_type character varying COLLATE pg_catalog."default",
    CONSTRAINT games_pkey PRIMARY KEY (game_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.games
    OWNER to postgres;