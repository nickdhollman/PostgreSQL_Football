DROP TABLE IF EXISTS public.competitions;

CREATE TABLE IF NOT EXISTS public.competitions
(
    competition_id character varying COLLATE pg_catalog."default" NOT NULL,
    competition_code character varying COLLATE pg_catalog."default",
    name character varying COLLATE pg_catalog."default",
	sub_type character varying COLLATE pg_catalog."default",
	type character varying COLLATE pg_catalog."default",
    country_id integer,
	country_name character varying COLLATE pg_catalog."default",
    domestic_league_code character varying COLLATE pg_catalog."default",
    confederation character varying COLLATE pg_catalog."default",
    url character varying COLLATE pg_catalog."default",
    is_major_national_league boolean,
    CONSTRAINT competitions_pkey PRIMARY KEY (competition_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.competitions
    OWNER to postgres;