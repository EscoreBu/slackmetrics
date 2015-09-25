--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

DROP DATABASE slack_stage;


CREATE DATABASE slack_stage WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';



\connect slack_stage

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;



CREATE SCHEMA public;





COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner:
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;


-- Table: messagesteamsslack

-- DROP TABLE messagesteamsslack;

CREATE TABLE messagesteamsslack
(
  id_team character varying(44),
  id_canal character varying(44),
  id_user text,
  ts text,
  nome_team character varying(44),
  nome_canal text,
  nome_user text,
  texto text
);

CREATE TABLE messagesteamsslack_translate
(
  id_team character varying(44),
  id_canal character varying(44),
  id_user text,
  ts text,
  nome_canal text,
  nome_user text,
  texto text,
  nome_team character varying(250),
  textotraduzido text
);

CREATE TABLE slack_controle_1
(
  id_team text,
  id_user text,
  id_channel text,
  team_name text,
  channel_name text,
  user_name text
);

CREATE TABLE slack_valida_insercao
(
  channel text,
  team text,
  mints text
);

CREATE TABLE stageslack_pre_conteudo
(
  id_team character varying(44),
  id_canal character varying(44),
  id_user text,
  ts text,
  nome_canal text,
  nome_user text,
  nome_team character varying(250),
  texto text,
  class double precision,
  conteudo text
);

CREATE TABLE stageslack_pre_insulto
(
  id_team character varying(44),
  id_canal character varying(44),
  id_user text,
  ts text,
  nome_canal text,
  nome_user text,
  nome_team character varying(250),
  texto text,
  class double precision
);

CREATE TABLE stageslack_pre_sentiment
(
  id_team character varying(44),
  id_canal character varying(44),
  id_user text,
  ts text,
  nome_canal text,
  nome_user text,
  nome_team character varying(250),
  texto text,
  sentiment character varying(100)
);


--
-- PostgreSQL database dump complete
--

