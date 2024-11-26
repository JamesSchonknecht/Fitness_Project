-- Table: fitness_schema.strong_data

-- DROP TABLE IF EXISTS fitness_schema.strong_data;

CREATE TABLE IF NOT EXISTS fitness_schema.strong_data
(
    "Date" timestamp without time zone,
    "Workout Name" text COLLATE pg_catalog."default",
    "Exercise Name" text COLLATE pg_catalog."default",
    "Set Order" smallint,
    "Weight" numeric,
    "Weight Unit" text COLLATE pg_catalog."default",
    "Reps" smallint,
    "RPE" smallint,
    "Distance" integer,
    "Distance Unit" text COLLATE pg_catalog."default",
    "Seconds" integer,
    "Notes" text COLLATE pg_catalog."default",
    "Workout Notes" text COLLATE pg_catalog."default",
    "Workout Duration" text COLLATE pg_catalog."default"
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS fitness_schema.strong_data
    OWNER to postgres;