CREATE TABLE IF NOT EXISTS public.players
(
    player_id integer NOT NULL,
    first_name character varying COLLATE pg_catalog."default",
    last_name character varying COLLATE pg_catalog."default",
    name character varying COLLATE pg_catalog."default",
    last_season integer,
    current_club_id integer,
    player_code character varying COLLATE pg_catalog."default",
    country_of_birth character varying COLLATE pg_catalog."default",
    city_of_birth character varying COLLATE pg_catalog."default",
    country_of_citizenship character varying COLLATE pg_catalog."default",
    date_of_birth date,
    sub_position character varying COLLATE pg_catalog."default",
    "position" character varying COLLATE pg_catalog."default",
    foot character varying COLLATE pg_catalog."default",
    height_in_cm character varying COLLATE pg_catalog."default",
    contract_expiration_date date,
    agent_name character varying COLLATE pg_catalog."default",
    image_url text COLLATE pg_catalog."default",
    url text COLLATE pg_catalog."default",
    current_club_domestic_competition_id character varying COLLATE pg_catalog."default",
    current_club_name character varying COLLATE pg_catalog."default",
    market_value_in_eur integer,
    highest_market_value_in_eur integer,
    CONSTRAINT players_pkey PRIMARY KEY (player_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.players
    OWNER to postgres;