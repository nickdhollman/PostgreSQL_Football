DROP TABLE IF EXISTS public.appearances;

CREATE TABLE IF NOT EXISTS public.appearances
(
    appearance_id character varying NOT NULL,
    game_id integer,
    player_id integer,
    player_club_id integer,
    player_current_club_id integer,
    date date,
    player_name character varying COLLATE pg_catalog."default",
    competition_id character varying COLLATE pg_catalog."default",
    yellow_cards integer,
    red_card integer,
    goals integer,
    assists integer,
    minutes_played integer,
    CONSTRAINT appearances_pkey PRIMARY KEY (appearance_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.appearances
    OWNER to postgres;