--
-- PostgreSQL database dump
--

-- Dumped from database version 14.3
-- Dumped by pg_dump version 14.3

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

DROP DATABASE workout;
--
-- Name: workout; Type: DATABASE; Schema: -; Owner: workout-admin
--

CREATE DATABASE workout WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'C';


ALTER DATABASE workout OWNER TO "workout-admin";

\connect workout

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

--
-- Name: workout; Type: SCHEMA; Schema: -; Owner: workout-admin
--

CREATE SCHEMA workout;


ALTER SCHEMA workout OWNER TO "workout-admin";

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: exercises; Type: TABLE; Schema: workout; Owner: workout-admin
--

CREATE TABLE workout.exercises (
    id integer NOT NULL,
    name character varying NOT NULL,
    "default-reps" integer DEFAULT 10 NOT NULL,
    "default-sets" integer DEFAULT 3 NOT NULL,
    instructions text[] NOT NULL
);


ALTER TABLE workout.exercises OWNER TO "workout-admin";

--
-- Name: exercises_id_seq; Type: SEQUENCE; Schema: workout; Owner: workout-admin
--

CREATE SEQUENCE workout.exercises_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE workout.exercises_id_seq OWNER TO "workout-admin";

--
-- Name: exercises_id_seq; Type: SEQUENCE OWNED BY; Schema: workout; Owner: workout-admin
--

ALTER SEQUENCE workout.exercises_id_seq OWNED BY workout.exercises.id;


--
-- Name: focuses; Type: TABLE; Schema: workout; Owner: workout-admin
--

CREATE TABLE workout.focuses (
    id integer NOT NULL,
    label text NOT NULL,
    exercise_id integer NOT NULL
);


ALTER TABLE workout.focuses OWNER TO "workout-admin";

--
-- Name: focuses_id_seq; Type: SEQUENCE; Schema: workout; Owner: workout-admin
--

CREATE SEQUENCE workout.focuses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE workout.focuses_id_seq OWNER TO "workout-admin";

--
-- Name: focuses_id_seq; Type: SEQUENCE OWNED BY; Schema: workout; Owner: workout-admin
--

ALTER SEQUENCE workout.focuses_id_seq OWNED BY workout.focuses.id;


--
-- Name: user-exercise-workout; Type: TABLE; Schema: workout; Owner: workout-admin
--

CREATE TABLE workout."user-exercise-workout" (
    id integer NOT NULL,
    user_id integer NOT NULL,
    exercise_id integer NOT NULL,
    workout_id integer NOT NULL,
    record_reps integer DEFAULT 0 NOT NULL,
    record_sets integer DEFAULT 0 NOT NULL,
    completed_utc time without time zone DEFAULT now() NOT NULL,
    record_weights integer DEFAULT 0 NOT NULL
);


ALTER TABLE workout."user-exercise-workout" OWNER TO "workout-admin";

--
-- Name: user-exercise-workout_id_seq; Type: SEQUENCE; Schema: workout; Owner: workout-admin
--

CREATE SEQUENCE workout."user-exercise-workout_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE workout."user-exercise-workout_id_seq" OWNER TO "workout-admin";

--
-- Name: user-exercise-workout_id_seq; Type: SEQUENCE OWNED BY; Schema: workout; Owner: workout-admin
--

ALTER SEQUENCE workout."user-exercise-workout_id_seq" OWNED BY workout."user-exercise-workout".id;


--
-- Name: users; Type: TABLE; Schema: workout; Owner: workout-admin
--

CREATE TABLE workout.users (
    id integer NOT NULL,
    email character varying(128) NOT NULL
);


ALTER TABLE workout.users OWNER TO "workout-admin";

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: workout; Owner: workout-admin
--

CREATE SEQUENCE workout.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE workout.users_id_seq OWNER TO "workout-admin";

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: workout; Owner: workout-admin
--

ALTER SEQUENCE workout.users_id_seq OWNED BY workout.users.id;


--
-- Name: workouts; Type: TABLE; Schema: workout; Owner: workout-admin
--

CREATE TABLE workout.workouts (
    id integer NOT NULL
);


ALTER TABLE workout.workouts OWNER TO "workout-admin";

--
-- Name: workouts_id_seq; Type: SEQUENCE; Schema: workout; Owner: workout-admin
--

CREATE SEQUENCE workout.workouts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE workout.workouts_id_seq OWNER TO "workout-admin";

--
-- Name: workouts_id_seq; Type: SEQUENCE OWNED BY; Schema: workout; Owner: workout-admin
--

ALTER SEQUENCE workout.workouts_id_seq OWNED BY workout.workouts.id;


--
-- Name: exercises id; Type: DEFAULT; Schema: workout; Owner: workout-admin
--

ALTER TABLE ONLY workout.exercises ALTER COLUMN id SET DEFAULT nextval('workout.exercises_id_seq'::regclass);


--
-- Name: focuses id; Type: DEFAULT; Schema: workout; Owner: workout-admin
--

ALTER TABLE ONLY workout.focuses ALTER COLUMN id SET DEFAULT nextval('workout.focuses_id_seq'::regclass);


--
-- Name: user-exercise-workout id; Type: DEFAULT; Schema: workout; Owner: workout-admin
--

ALTER TABLE ONLY workout."user-exercise-workout" ALTER COLUMN id SET DEFAULT nextval('workout."user-exercise-workout_id_seq"'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: workout; Owner: workout-admin
--

ALTER TABLE ONLY workout.users ALTER COLUMN id SET DEFAULT nextval('workout.users_id_seq'::regclass);


--
-- Name: workouts id; Type: DEFAULT; Schema: workout; Owner: workout-admin
--

ALTER TABLE ONLY workout.workouts ALTER COLUMN id SET DEFAULT nextval('workout.workouts_id_seq'::regclass);


--
-- Name: users email_unique; Type: CONSTRAINT; Schema: workout; Owner: workout-admin
--

ALTER TABLE ONLY workout.users
    ADD CONSTRAINT email_unique UNIQUE (email);


--
-- Name: exercises exercises_pkey; Type: CONSTRAINT; Schema: workout; Owner: workout-admin
--

ALTER TABLE ONLY workout.exercises
    ADD CONSTRAINT exercises_pkey PRIMARY KEY (id);


--
-- Name: focuses focuses_pkey; Type: CONSTRAINT; Schema: workout; Owner: workout-admin
--

ALTER TABLE ONLY workout.focuses
    ADD CONSTRAINT focuses_pkey PRIMARY KEY (id);


--
-- Name: user-exercise-workout user-exercise-workout_pkey; Type: CONSTRAINT; Schema: workout; Owner: workout-admin
--

ALTER TABLE ONLY workout."user-exercise-workout"
    ADD CONSTRAINT "user-exercise-workout_pkey" PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: workout; Owner: workout-admin
--

ALTER TABLE ONLY workout.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: workouts workouts_pkey; Type: CONSTRAINT; Schema: workout; Owner: workout-admin
--

ALTER TABLE ONLY workout.workouts
    ADD CONSTRAINT workouts_pkey PRIMARY KEY (id);


--
-- Name: focuses exercise_id; Type: FK CONSTRAINT; Schema: workout; Owner: workout-admin
--

ALTER TABLE ONLY workout.focuses
    ADD CONSTRAINT exercise_id FOREIGN KEY (exercise_id) REFERENCES workout.exercises(id);


--
-- Name: user-exercise-workout exercise_id; Type: FK CONSTRAINT; Schema: workout; Owner: workout-admin
--

ALTER TABLE ONLY workout."user-exercise-workout"
    ADD CONSTRAINT exercise_id FOREIGN KEY (exercise_id) REFERENCES workout.exercises(id);


--
-- Name: user-exercise-workout user_id; Type: FK CONSTRAINT; Schema: workout; Owner: workout-admin
--

ALTER TABLE ONLY workout."user-exercise-workout"
    ADD CONSTRAINT user_id FOREIGN KEY (user_id) REFERENCES workout.users(id);


--
-- Name: user-exercise-workout workout_id; Type: FK CONSTRAINT; Schema: workout; Owner: workout-admin
--

ALTER TABLE ONLY workout."user-exercise-workout"
    ADD CONSTRAINT workout_id FOREIGN KEY (workout_id) REFERENCES workout.workouts(id);


--
-- PostgreSQL database dump complete
--

