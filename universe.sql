--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    id_galaxy integer NOT NULL,
    name character varying(50),
    description text,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years integer,
    planet_types character varying(20),
    distance_from_earth integer,
    galaxy_type integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_galaxy_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_galaxy_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_galaxy_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_galaxy_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_galaxy_seq OWNED BY public.galaxy.id_galaxy;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    id_moon integer NOT NULL,
    name character varying(50),
    description text,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years integer,
    planet_types character varying(20),
    distance_from_earth integer,
    galaxy_type integer,
    id_planet integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_moon_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_moon_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_moon_seq OWNER TO freecodecamp;

--
-- Name: moon_id_moon_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_moon_seq OWNED BY public.moon.id_moon;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    id_planet integer NOT NULL,
    name character varying(50),
    description text,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years integer,
    planet_types character varying(20),
    distance_from_earth integer,
    galaxy_type integer,
    id_star integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_planet_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_planet_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_planet_seq OWNER TO freecodecamp;

--
-- Name: planet_id_planet_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_planet_seq OWNED BY public.planet.id_planet;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    id_star integer NOT NULL,
    name character varying(50),
    description text,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years integer,
    planet_types character varying(20),
    distance_from_earth integer,
    galaxy_type integer,
    id_galaxy integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_star_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_star_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_star_seq OWNER TO freecodecamp;

--
-- Name: star_id_star_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_star_seq OWNED BY public.star.id_star;


--
-- Name: system; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.system (
    id_system integer NOT NULL,
    name character varying(30),
    description text,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth integer
);


ALTER TABLE public.system OWNER TO freecodecamp;

--
-- Name: system_id_system_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.system_id_system_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.system_id_system_seq OWNER TO freecodecamp;

--
-- Name: system_id_system_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.system_id_system_seq OWNED BY public.system.id_system;


--
-- Name: galaxy id_galaxy; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN id_galaxy SET DEFAULT nextval('public.galaxy_id_galaxy_seq'::regclass);


--
-- Name: moon id_moon; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN id_moon SET DEFAULT nextval('public.moon_id_moon_seq'::regclass);


--
-- Name: planet id_planet; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN id_planet SET DEFAULT nextval('public.planet_id_planet_seq'::regclass);


--
-- Name: star id_star; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN id_star SET DEFAULT nextval('public.star_id_star_seq'::regclass);


--
-- Name: system id_system; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.system ALTER COLUMN id_system SET DEFAULT nextval('public.system_id_system_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'galaxy 1', 'descriprion 1', true, true, 100, 'planet type 1', 1000, 1);
INSERT INTO public.galaxy VALUES (2, 'galaxy 2', 'descriprion 2', true, true, 200, 'planet type 2', 2000, 2);
INSERT INTO public.galaxy VALUES (3, 'galaxy 3', 'descriprion 3', true, true, 300, 'planet type 3', 3000, 3);
INSERT INTO public.galaxy VALUES (4, 'galaxy 4', 'descriprion 4', true, true, 400, 'planet type 4', 4000, 4);
INSERT INTO public.galaxy VALUES (5, 'galaxy 5', 'descriprion 5', true, true, 500, 'planet type 5', 5000, 5);
INSERT INTO public.galaxy VALUES (6, 'galaxy 6', 'descriprion 6', true, true, 600, 'planet type 6', 6000, 6);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon 1', 'descriprion 1', true, true, 100, 'planet type 1', 1000, 1, NULL);
INSERT INTO public.moon VALUES (2, 'moon 1', 'descriprion 1', true, true, 100, 'planet type 1', 1000, 1, NULL);
INSERT INTO public.moon VALUES (3, 'moon 1', 'descriprion 1', true, true, 100, 'planet type 1', 1000, 1, NULL);
INSERT INTO public.moon VALUES (4, 'moon 1', 'descriprion 1', true, true, 100, 'planet type 1', 1000, 1, NULL);
INSERT INTO public.moon VALUES (5, 'moon 1', 'descriprion 1', true, true, 100, 'planet type 1', 1000, 1, NULL);
INSERT INTO public.moon VALUES (6, 'moon 1', 'descriprion 1', true, true, 100, 'planet type 1', 1000, 1, NULL);
INSERT INTO public.moon VALUES (7, 'moon 1', 'descriprion 1', true, true, 100, 'planet type 1', 1000, 1, NULL);
INSERT INTO public.moon VALUES (8, 'moon 1', 'descriprion 1', true, true, 100, 'planet type 1', 1000, 1, NULL);
INSERT INTO public.moon VALUES (9, 'moon 1', 'descriprion 1', true, true, 100, 'planet type 1', 1000, 1, NULL);
INSERT INTO public.moon VALUES (10, 'moon 1', 'descriprion 1', true, true, 100, 'planet type 1', 1000, 1, NULL);
INSERT INTO public.moon VALUES (11, 'moon 1', 'descriprion 1', true, true, 100, 'planet type 1', 1000, 1, NULL);
INSERT INTO public.moon VALUES (12, 'moon 1', 'descriprion 1', true, true, 100, 'planet type 1', 1000, 1, NULL);
INSERT INTO public.moon VALUES (13, 'moon 1', 'descriprion 1', true, true, 100, 'planet type 1', 1000, 1, NULL);
INSERT INTO public.moon VALUES (14, 'moon 1', 'descriprion 1', true, true, 100, 'planet type 1', 1000, 1, NULL);
INSERT INTO public.moon VALUES (15, 'moon 1', 'descriprion 1', true, true, 100, 'planet type 1', 1000, 1, NULL);
INSERT INTO public.moon VALUES (16, 'moon 1', 'descriprion 1', true, true, 100, 'planet type 1', 1000, 1, NULL);
INSERT INTO public.moon VALUES (17, 'moon 1', 'descriprion 1', true, true, 100, 'planet type 1', 1000, 1, NULL);
INSERT INTO public.moon VALUES (18, 'moon 1', 'descriprion 1', true, true, 100, 'planet type 1', 1000, 1, NULL);
INSERT INTO public.moon VALUES (19, 'moon 1', 'descriprion 1', true, true, 100, 'planet type 1', 1000, 1, NULL);
INSERT INTO public.moon VALUES (20, 'moon 1', 'descriprion 1', true, true, 100, 'planet type 1', 1000, 1, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'planet 1', 'descriprion 1', true, true, 100, 'planet type 1', 1000, 1, NULL);
INSERT INTO public.planet VALUES (2, 'planet 2', 'descriprion 2', true, true, 100, 'planet type 2', 2000, 2, NULL);
INSERT INTO public.planet VALUES (3, 'planet 3', 'descriprion 3', true, true, 100, 'planet type 3', 3000, 3, NULL);
INSERT INTO public.planet VALUES (4, 'planet 4', 'descriprion 4', true, true, 100, 'planet type 4', 4000, 4, NULL);
INSERT INTO public.planet VALUES (5, 'planet 5', 'descriprion 5', true, true, 100, 'planet type 5', 5000, 5, NULL);
INSERT INTO public.planet VALUES (6, 'planet 6', 'descriprion 6', true, true, 100, 'planet type 6', 6000, 6, NULL);
INSERT INTO public.planet VALUES (7, 'planet 7', 'descriprion 7', true, true, 100, 'planet type 7', 7000, 7, NULL);
INSERT INTO public.planet VALUES (8, 'planet 8', 'descriprion 8', true, true, 100, 'planet type 8', 8000, 8, NULL);
INSERT INTO public.planet VALUES (9, 'planet 9', 'descriprion 9', true, true, 100, 'planet type 9', 9000, 9, NULL);
INSERT INTO public.planet VALUES (10, 'planet 10', 'descriprion 10', true, true, 100, 'planet type 10', 10000, 10, NULL);
INSERT INTO public.planet VALUES (11, 'planet 11', 'descriprion 11', true, true, 100, 'planet type 11', 11000, 11, NULL);
INSERT INTO public.planet VALUES (12, 'planet 12', 'descriprion 12', true, true, 100, 'planet type 12', 12000, 12, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'star 1', 'descriprion 1', true, true, 100, 'planet type 1', 1000, 1, NULL);
INSERT INTO public.star VALUES (2, 'star 2', 'descriprion 2', true, true, 200, 'planet type 2', 2000, 2, NULL);
INSERT INTO public.star VALUES (3, 'star 3', 'descriprion 3', true, true, 300, 'planet type 3', 3000, 3, NULL);
INSERT INTO public.star VALUES (4, 'star 4', 'descriprion 4', true, true, 400, 'planet type 4', 4000, 4, NULL);
INSERT INTO public.star VALUES (5, 'star 5', 'descriprion 5', true, true, 500, 'planet type 5', 5000, 5, NULL);
INSERT INTO public.star VALUES (6, 'star 6', 'descriprion 6', true, true, 600, 'planet type 6', 6000, 6, NULL);


--
-- Data for Name: system; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.system VALUES (1, 'system 1', 'descriprion 1', true, true, 100, 1000);
INSERT INTO public.system VALUES (2, 'system 1', 'descriprion 1', true, true, 100, 1000);
INSERT INTO public.system VALUES (3, 'system 1', 'descriprion 1', true, true, 100, 1000);
INSERT INTO public.system VALUES (4, 'system 1', 'descriprion 1', true, true, 100, 1000);


--
-- Name: galaxy_id_galaxy_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_galaxy_seq', 6, true);


--
-- Name: moon_id_moon_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_moon_seq', 20, true);


--
-- Name: planet_id_planet_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_planet_seq', 12, true);


--
-- Name: star_id_star_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_star_seq', 6, true);


--
-- Name: system_id_system_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.system_id_system_seq', 4, true);


--
-- Name: galaxy galaxy_id_galaxy_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_id_galaxy_key UNIQUE (id_galaxy);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (id_moon);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (id_planet);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (id_star);


--
-- Name: system system_id_system_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.system
    ADD CONSTRAINT system_id_system_key UNIQUE (id_system);


--
-- Name: moon moon_id_planet_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_id_planet_fkey FOREIGN KEY (id_planet) REFERENCES public.planet(id_planet);


--
-- Name: planet planet_id_star_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_id_star_fkey FOREIGN KEY (id_star) REFERENCES public.star(id_star);


--
-- Name: star star_id_galaxy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_id_galaxy_fkey FOREIGN KEY (id_galaxy) REFERENCES public.galaxy(id_galaxy);


--
-- PostgreSQL database dump complete
--

