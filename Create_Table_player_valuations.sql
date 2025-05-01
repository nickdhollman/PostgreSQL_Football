DROP TABLE IF EXISTS public.player_valuations;
CREATE TABLE IF NOT EXISTS public.player_valuations
(
    player_id integer NOT NULL,
    date date NOT NULL,
    market_value_in_eur integer,
    current_club_id integer,
    player_club_domestic_competition_id character varying COLLATE pg_catalog."default",
    CONSTRAINT player_valuations_pkey PRIMARY KEY (player_id, date)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.player_valuations
    OWNER to postgres;