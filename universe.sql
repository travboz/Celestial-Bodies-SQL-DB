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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60),
    type character varying(30),
    stellar_mass_in_solar_masses double precision,
    average_distance_from_earth_in_light_years integer,
    spiral_galaxy boolean NOT NULL
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
    name character varying(45) NOT NULL,
    mean_diameter_in_km double precision NOT NULL,
    mass_in_kg double precision NOT NULL,
    orbital_period numeric(10,2) NOT NULL,
    planet_id integer
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
    name character varying(45) NOT NULL,
    mean_diameter_in_km integer NOT NULL,
    mass_in_kg double precision NOT NULL,
    orbital_period numeric(10,2) NOT NULL,
    number_of_moons integer NOT NULL,
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
-- Name: spacecraft; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.spacecraft (
    spacecraft_id integer NOT NULL,
    name character varying(60) NOT NULL,
    mission character varying(120),
    purpose text,
    date_launched date NOT NULL,
    still_in_use boolean NOT NULL
);


ALTER TABLE public.spacecraft OWNER TO freecodecamp;

--
-- Name: spacecraft_spacecraft_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.spacecraft_spacecraft_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spacecraft_spacecraft_id_seq OWNER TO freecodecamp;

--
-- Name: spacecraft_spacecraft_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.spacecraft_spacecraft_id_seq OWNED BY public.spacecraft.spacecraft_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(45),
    stellar_type character varying(30),
    distance_in_light_years double precision NOT NULL,
    apparent_magnitude double precision NOT NULL,
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
-- Name: spacecraft spacecraft_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spacecraft ALTER COLUMN spacecraft_id SET DEFAULT nextval('public.spacecraft_spacecraft_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 60000000000, 100000, false);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 85000000000, 200000, false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 10000000000, 300000, false);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Barred Spiral', 30000000000, 400000, true);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Spiral', 25000000000, 500000, true);
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 'Elliptical', 28000000000, 600000, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 3476, 7.342e+22, 27.30, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 22.2, 1.0659e+16, 0.30, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 12.4, 1.4762e+15, 1.30, 4);
INSERT INTO public.moon VALUES (4, 'Ganymede', 5268.2, 1.4819e+23, 7.20, 5);
INSERT INTO public.moon VALUES (5, 'Callisto', 4821.6, 1.0759e+23, 16.70, 5);
INSERT INTO public.moon VALUES (6, 'Io', 3643.2, 8.9319e+22, 1.80, 5);
INSERT INTO public.moon VALUES (7, 'Europa', 3121.6, 4.797e+22, 3.50, 5);
INSERT INTO public.moon VALUES (8, 'Titan', 5150, 1.3455e+23, 15.90, 6);
INSERT INTO public.moon VALUES (9, 'Rhea', 1527, 2.306e+21, 4.50, 6);
INSERT INTO public.moon VALUES (10, 'Triton', 2706.8, 2.1479e+22, 5.90, 8);
INSERT INTO public.moon VALUES (11, 'Tethys', 1062, 6.174e+20, 1.90, 6);
INSERT INTO public.moon VALUES (12, 'Dione', 1123, 1.095e+21, 2.70, 6);
INSERT INTO public.moon VALUES (13, 'Ariel', 1157.8, 1.251e+21, 2.50, 7);
INSERT INTO public.moon VALUES (14, 'Umbriel', 1169.4, 1.275e+21, 4.10, 7);
INSERT INTO public.moon VALUES (15, 'Charon', 1212, 1.586e+21, 6.40, 9);
INSERT INTO public.moon VALUES (16, 'Oberon', 1522.8, 3.014e+21, 13.50, 7);
INSERT INTO public.moon VALUES (17, 'Enceladus', 504.2, 1.08e+20, 1.40, 6);
INSERT INTO public.moon VALUES (18, 'Iapetus', 1470, 1.805e+21, 79.00, 6);
INSERT INTO public.moon VALUES (19, 'Hyperion', 270.6, 5.62e+18, 21.30, 6);
INSERT INTO public.moon VALUES (20, 'Mimas', 396.4, 3.75e+19, 0.90, 6);
INSERT INTO public.moon VALUES (21, 'Miranda', 472.6, 6.59e+19, 1.40, 7);
INSERT INTO public.moon VALUES (22, 'Olympus Mons', 624, 1.48e+20, 0.90, 4);
INSERT INTO public.moon VALUES (24, 'Proteus', 420, 5.4e+19, 1.10, 6);
INSERT INTO public.moon VALUES (25, 'Phoebe', 213.2, 5.17e+18, 550.40, 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 4880, 3.3e+23, 88.00, 0, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 12104, 4.87e+24, 225.00, 0, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 12742, 5.97e+24, 365.25, 1, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 6779, 6.42e+23, 687.00, 2, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 139820, 1.9e+27, 4333.00, 79, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 116460, 5.68e+26, 10759.00, 83, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 50724, 8.68e+25, 30688.00, 27, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 49244, 1.02e+26, 60182.00, 14, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 2377, 1.3e+22, 90560.00, 5, 1);
INSERT INTO public.planet VALUES (11, 'HD 209458 b', 128000, 1.49e+27, 3.52, 0, 2);
INSERT INTO public.planet VALUES (12, 'Kepler-10 b', 29373, 4.56e+24, 0.84, 0, 2);
INSERT INTO public.planet VALUES (13, 'TRAPPIST-1d', 8190, 4.1e+23, 4.05, 0, 2);
INSERT INTO public.planet VALUES (14, 'Gliese 876 b', 12687, 1.93e+25, 1.94, 0, 2);
INSERT INTO public.planet VALUES (15, 'Proxima Centauri b', 18204, 4.9999999999999996e+22, 11.20, 0, 3);
INSERT INTO public.planet VALUES (16, 'Kepler-442b', 26341, 2.34e+24, 112.30, 0, 3);
INSERT INTO public.planet VALUES (17, 'HD 40307g', 17518, 8.2e+24, 197.80, 0, 3);
INSERT INTO public.planet VALUES (18, 'K2-18 b', 27869, 6.6e+24, 32.00, 0, 3);
INSERT INTO public.planet VALUES (19, 'TOI 700 d', 15620, 5.3e+23, 37.40, 0, 3);
INSERT INTO public.planet VALUES (20, 'LHS 3844 b', 10350, 1.69e+23, 11.30, 0, 3);
INSERT INTO public.planet VALUES (21, 'New Planet', 15000, 8e+24, 500.00, 2, 2);


--
-- Data for Name: spacecraft; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.spacecraft VALUES (1, 'Voyager 1', 'Voyager program', 'Interstellar exploration', '1977-09-05', false);
INSERT INTO public.spacecraft VALUES (2, 'Cassini', 'Cassini-Huygens mission', 'Study of Saturn and its moons', '1997-10-15', false);
INSERT INTO public.spacecraft VALUES (3, 'Hubble Space Telescope', 'Hubble Space Telescope mission', 'Observing distant galaxies and celestial objects', '1990-04-24', true);
INSERT INTO public.spacecraft VALUES (4, 'Chang''e 4', 'Chang''e program', 'Exploration of the lunar far side', '2018-12-07', true);
INSERT INTO public.spacecraft VALUES (5, 'Mars Curiosity Rover', 'Mars Science Laboratory mission', 'Investigation of Martian climate and geology', '2011-11-26', true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'G2V', 0, -26.74, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 'A1Vm', 8.6, -1.46, 2);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 'G2V', 4.37, 0.01, 3);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 'M1-2Ia-Iab', 642.5, 0.42, 4);
INSERT INTO public.star VALUES (5, 'Vega', 'A0V', 25.04, 0.03, 5);
INSERT INTO public.star VALUES (6, 'Arcturus', 'K1.5IIIa', 36.7, -0.04, 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 25, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 21, true);


--
-- Name: spacecraft_spacecraft_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.spacecraft_spacecraft_id_seq', 5, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_average_distance_from_earth_in_light_years_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_average_distance_from_earth_in_light_years_key UNIQUE (average_distance_from_earth_in_light_years);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_mean_diameter_in_km_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_mean_diameter_in_km_key UNIQUE (mean_diameter_in_km);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: spacecraft spacecraft_date_launched_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spacecraft
    ADD CONSTRAINT spacecraft_date_launched_key UNIQUE (date_launched);


--
-- Name: spacecraft spacecraft_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spacecraft
    ADD CONSTRAINT spacecraft_pkey PRIMARY KEY (spacecraft_id);


--
-- Name: star star_distance_in_light_years_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_distance_in_light_years_key UNIQUE (distance_in_light_years);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


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

