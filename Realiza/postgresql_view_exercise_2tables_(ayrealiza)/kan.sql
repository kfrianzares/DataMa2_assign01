-- Database: kan

-- DROP DATABASE kan;

CREATE DATABASE kan
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

-- Table: public.account

-- DROP TABLE public.account;

CREATE TABLE public.account
(
    id integer NOT NULL DEFAULT nextval('account_id_seq'::regclass),
    acc_name character varying(50) COLLATE pg_catalog."default",
    acc_desc character varying(50) COLLATE pg_catalog."default",
    cli_id integer,
    CONSTRAINT account_pkey PRIMARY KEY (id),
    CONSTRAINT account_cli_id_fkey FOREIGN KEY (cli_id)
        REFERENCES public.client (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE public.account
    OWNER to postgres;

-- Table: public.client

-- DROP TABLE public.client;

CREATE TABLE public.client
(
    id integer NOT NULL DEFAULT nextval('client_id_seq'::regclass),
    cli_name character varying(50) COLLATE pg_catalog."default",
    cli_addr character varying(50) COLLATE pg_catalog."default",
    cli_desc character varying(50) COLLATE pg_catalog."default",
    CONSTRAINT client_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE public.client
    OWNER to postgres;

-- View: public.view_client_account

-- DROP VIEW public.view_client_account;

CREATE OR REPLACE VIEW public.view_client_account
 AS
 SELECT account.id AS acc_id,
    account.acc_name,
    client.id AS cli_id,
    client.cli_name
   FROM account
     JOIN client ON account.acc_name::text = client.cli_name::text;

ALTER TABLE public.view_client_account
    OWNER TO postgres;

