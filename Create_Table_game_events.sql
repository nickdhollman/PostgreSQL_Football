-- Table: public.game_events

-- DROP TABLE IF EXISTS public.game_events;

CREATE TABLE IF NOT EXISTS public.game_events
(
    game_event_id character varying COLLATE pg_catalog."default" NOT NULL,
    date date,
    game_id integer,
    minute integer,
    type character varying COLLATE pg_catalog."default",
    club_id integer,
    player_id integer,
    description text COLLATE pg_catalog."default",
    player_in_id integer,
    player_assist_id integer,
    CONSTRAINT game_events_pkey PRIMARY KEY (game_event_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.game_events
    OWNER to postgres;