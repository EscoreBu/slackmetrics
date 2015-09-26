--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

DROP DATABASE slack;


CREATE DATABASE slack WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';



\connect slack

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



CREATE TABLE dim_canal (
    id_dim_canal integer,
    id_canal character varying(44),
    nome_canal character varying(50),
    PRIMARY KEY (id_dim_canal)
);




CREATE TABLE dim_contexto_mining (
    id_dim_sentimento_mining bigint,
    contexto character varying(20),
    sentimento character varying(20),
    conteudo character varying(20),
    insulto character varying(20),
    PRIMARY KEY (id_dim_sentimento_mining)
);





CREATE TABLE dim_conversa (
    id_dim_conversa bigint,
    id_conversa character varying(50),
    nome_team character varying(250),
    nome_canal character varying(50),
    PRIMARY KEY (id_dim_conversa)
);





CREATE TABLE dim_team (
    id_dim_team bigint,
    id_team character varying(44),
    nome_team character varying(250),
    PRIMARY KEY (id_dim_team)
);





CREATE TABLE dim_tempo (
    id_tempo smallint,
    data_tempo timestamp without time zone,
    ano character varying(4),
    mes_numero smallint,
    dia_numero smallint,
    dia_semana_numero smallint,
    dia_semana character varying(30),
    dia_semana_abrev character varying(3),
    mes_nome character varying(30),
    mes_abrev character varying(3),
    trimestre character varying(1),
    data_string character varying(30),
    mes_trimestre integer,
    quinzena character varying(25),
    semana_ano integer,
    semana_mes character varying(30),
    semana_nome character varying(9),
    trimestre_abrev character varying(7),
    semestre_num character varying(1),
    semestre_nome character varying(11),
    dia_util integer,
    PRIMARY KEY (id_tempo)
);




CREATE TABLE dim_user (
    id_dim_user bigint,
    id_team character varying(44),
    nome_user character varying(44),
    PRIMARY KEY (id_dim_user)
);





CREATE TABLE dsp_security (
    nome_team character varying(250),
    nome_canal character varying(44),
    nome_user character varying(44),
    PRIMARY KEY (nome_team, nome_canal, nome_user)
);





CREATE TABLE fato_slack (
    id_dim_team integer,
    id_dim_canal integer,
    id_dim_conversa integer,
    id_dim_tempo integer,
    id_dim_user integer,
    id_dim_sentimento_mining integer,
    data character varying(8),
    datats character varying(15),
    hour integer,
    post text,
    count integer
);

CREATE INDEX ON fato_slack ( id_dim_team, id_dim_canal );
CREATE INDEX ON fato_slack ( id_dim_team, id_dim_canal, id_dim_tempo );
CREATE INDEX ON fato_slack ( id_dim_team, id_dim_canal, id_dim_tempo, id_dim_user );
CREATE INDEX ON fato_slack ( id_dim_team, id_dim_canal, id_dim_tempo, id_dim_user, id_dim_sentimento_mining );
CREATE INDEX ON fato_slack ( id_dim_tempo, id_dim_user );









--
-- PostgreSQL database dump complete
--

