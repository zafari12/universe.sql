--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: description; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.description (
    description_id integer NOT NULL,
    name character varying(30) NOT NULL,
    has_life boolean,
    is_spherical boolean,
    galaxy_types text,
    moon_types text,
    distance numeric(10,2),
    age_in_millions_of_years integer,
    planet_id integer
);


ALTER TABLE public.description OWNER TO freecodecamp;

--
-- Name: description_description_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.description_description_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.description_description_id_seq OWNER TO freecodecamp;

--
-- Name: description_description_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.description_description_id_seq OWNED BY public.description.description_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance_from_earth integer,
    age_in_millions_of_years numeric(10,2),
    is_spherical boolean,
    has_life boolean NOT NULL,
    planet_types text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    planet_id integer,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric(10,2),
    has_life boolean,
    is_spherical boolean,
    galaxy_types text,
    planet_types text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    has_life boolean NOT NULL,
    is_spherical boolean,
    distance_from_earth numeric(10,2),
    age_in_millions_of_years integer,
    planet_types text,
    galaxy_types text,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_types text,
    galaxy_types text,
    has_life boolean NOT NULL,
    is_spherical boolean,
    age_in_millions_of_years integer,
    distance_from_earth numeric(10,2),
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: description description_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.description ALTER COLUMN description_id SET DEFAULT nextval('public.description_description_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: description; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.description VALUES (1, 'Star', true, false, 'moon', 'spiral', 122.20, 423, 2);
INSERT INTO public.description VALUES (2, 'Moon', true, true, 'spiral', NULL, 2840.39, 2839, 1);
INSERT INTO public.description VALUES (3, 'Earth', false, false, NULL, NULL, 8273.92, 4728, 7);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Marrinate Galaxy', 247, 283.28, false, true, 'Weirdly cute');
INSERT INTO public.galaxy VALUES (2, 'Pookie', 837, 28402.94, true, false, 'Whiskers');
INSERT INTO public.galaxy VALUES (3, 'Cuttie pie', 483, 82729.94, true, true, 'Ginger');
INSERT INTO public.galaxy VALUES (4, 'Marinated chicken', 348, 294802.94, false, false, 'kittens');
INSERT INTO public.galaxy VALUES (5, 'Just kidding', 382, 92837.93, true, true, 'Remedy');
INSERT INTO public.galaxy VALUES (6, 'Magical forsight', 291, 48923.33, true, false, 'Famous');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 2, 4500, 0.00, false, true, 'Spiral', 'Satellite');
INSERT INTO public.moon VALUES (2, 'Europa', 2, 4500, 4.20, false, true, 'Spiral', 'Moon');
INSERT INTO public.moon VALUES (3, 'Ganymede', 12, 4500, 4.20, false, true, 'Spiral', 'Moon');
INSERT INTO public.moon VALUES (4, 'Titan', 11, 4500, 8.60, false, true, 'Spiral', 'Moon');
INSERT INTO public.moon VALUES (5, 'Callisto', 10, 4500, 4.20, false, true, 'Spiral', 'Moon');
INSERT INTO public.moon VALUES (6, 'Io', 9, 4500, 4.20, false, true, 'Spiral', 'Moon');
INSERT INTO public.moon VALUES (7, 'Phobos', 8, 4500, 1.28, false, true, 'Spiral', 'Moon');
INSERT INTO public.moon VALUES (8, 'Deimos', 7, 4500, 1.28, false, true, 'Spiral', 'Moon');
INSERT INTO public.moon VALUES (9, 'Enceladus', 7, 4500, 8.60, false, true, 'Spiral', 'Moon');
INSERT INTO public.moon VALUES (10, 'Triton', 6, 4500, 30.07, false, true, 'Spiral', 'Moon');
INSERT INTO public.moon VALUES (13, 'Rhea', 1, 4500, 8.60, false, true, 'Spiral', 'Moon');
INSERT INTO public.moon VALUES (14, 'Iapetus', 2, 4500, 8.60, false, true, 'Spiral', 'Moon');
INSERT INTO public.moon VALUES (15, 'Mimas', 3, 4500, 8.60, false, true, 'Spiral', 'Moon');
INSERT INTO public.moon VALUES (16, 'Charon', 4, 4500, 39.48, false, true, 'Spiral', 'Moon');
INSERT INTO public.moon VALUES (17, 'Nereid', 5, 4500, 30.07, false, true, 'Spiral', 'Moon');
INSERT INTO public.moon VALUES (18, 'Hyperion', 1, 4500, 8.60, false, true, 'Spiral', 'Moon');
INSERT INTO public.moon VALUES (19, 'Dione', 7, 4500, 8.60, false, true, 'Spiral', 'Moon');
INSERT INTO public.moon VALUES (20, 'Umbriel', 8, 4500, 19.19, false, true, 'Spiral', 'Moon');
INSERT INTO public.moon VALUES (11, 'Miranda', 4, 4500, 19.19, false, true, 'Spiral', 'Moon');
INSERT INTO public.moon VALUES (12, 'Oberon', 4, 4500, 19.19, false, true, 'Spiral', 'Moon');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', true, true, 0.00, 4500, 'Terrestrial', 'Spiral', 2);
INSERT INTO public.planet VALUES (2, 'Mars', false, true, 1.28, 4500, 'Terrestrial', 'Spiral', 1);
INSERT INTO public.planet VALUES (3, 'Jupiter', false, true, 4.20, 4600, 'Gas Giant', 'Spiral', 3);
INSERT INTO public.planet VALUES (4, 'Saturn', false, true, 8.60, 4600, 'Gas Giant', 'Spiral', 1);
INSERT INTO public.planet VALUES (5, 'Neptun', false, true, 30.07, 4500, 'Ice Giant', 'Spiral', 4);
INSERT INTO public.planet VALUES (6, 'Proxima Centauri', false, true, 4.24, 5000, 'Exoplanet', 'Spiral', 5);
INSERT INTO public.planet VALUES (7, 'Venus', false, true, 600.00, 6000, 'Exoplanet', 'Spiral', 6);
INSERT INTO public.planet VALUES (8, 'Venus', false, true, 0.67, 4500, 'Terrestrial', 'Spiral', 6);
INSERT INTO public.planet VALUES (9, 'Titan', false, true, 8.60, 4500, 'Moon', 'Spiral', 3);
INSERT INTO public.planet VALUES (10, 'Europa', false, true, 4.20, 4500, 'Moon', 'Spiral', 2);
INSERT INTO public.planet VALUES (11, 'Andromeda I', false, true, 5238.90, 12000, 'Dwarf Planet', 'Spiral', 1);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1d', false, true, 40.00, 7000, 'Exoplanet', 'Spiral', 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Terrestrial', 'Spiral', 'Proxima Centauri', false, false, 356, 2933.00, 2);
INSERT INTO public.star VALUES (2, 'Gas Giant', 'Spiral', 'Sirius', false, false, 3326, 282.00, 3);
INSERT INTO public.star VALUES (3, 'Terrestrial', 'Spiral', 'Sun', true, false, 33929, 382.00, 1);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 'Again', 'Betelgeuse', true, true, 38275, 928.00, 4);
INSERT INTO public.star VALUES (5, 'Rocky', 'Vega', 'Spiral', false, false, 27484, 27492.00, 6);
INSERT INTO public.star VALUES (6, 'Elliptical', 'Bagel', 'Rigel', false, false, 274, 284.00, 5);


--
-- Name: description_description_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.description_description_id_seq', 1, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: description description_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.description
    ADD CONSTRAINT description_name_key UNIQUE (name);


--
-- Name: description description_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.description
    ADD CONSTRAINT description_pkey PRIMARY KEY (description_id);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

