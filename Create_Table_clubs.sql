-- DROP TABLE IF EXISTS public.clubs;

CREATE TABLE IF NOT EXISTS public.clubs
(
    club_id integer NOT NULL,
    club_code character varying COLLATE pg_catalog."default",
    name character varying COLLATE pg_catalog."default",
    domestic_competition_id character varying COLLATE pg_catalog."default",
    total_market_value integer,
    squad_size integer,
    average_age double precision,
    foreigners_number integer,
    foreigners_percentage double precision,
    national_team_players integer,
    stadium_name character varying COLLATE pg_catalog."default",
    stadium_seats integer,
    net_transfer_record text COLLATE pg_catalog."default",
    coach_name character varying COLLATE pg_catalog."default",
    last_season integer,
    filename text COLLATE pg_catalog."default",
    url text COLLATE pg_catalog."default",
    CONSTRAINT clubs_pkey PRIMARY KEY (club_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.clubs
    OWNER to postgres;