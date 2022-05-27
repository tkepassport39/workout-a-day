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

--
-- Data for Name: exercises; Type: TABLE DATA; Schema: workout; Owner: workout-admin
--

INSERT INTO workout.exercises (id, name, "default-reps", "default-sets", instructions) VALUES (1, 'Dumbbell Bicep Curls', 10, 3, '{"start standing with a dumbbell in each hand","Bring the dumbbells all the way up to your shoulders by bending your elbows","Reverse the curl slowly and repeat"}');
INSERT INTO workout.exercises (id, name, "default-reps", "default-sets", instructions) VALUES (2, 'Dips', 10, 3, '{"Grasp the parallel bars and hop up so your arms are straight","Slowly bend your elbows to lower your body into the Dip until your upper arms are about parallel to the ground"}');
INSERT INTO workout.exercises (id, name, "default-reps", "default-sets", instructions) VALUES (3, 'Resistence Bicep Pull', 10, 3, '{"Grap resistence band","Bring band all the way up to your shoulders by bending your elbows"}');


--
-- Data for Name: focuses; Type: TABLE DATA; Schema: workout; Owner: workout-admin
--

INSERT INTO workout.focuses (id, label, exercise_id) VALUES (5, 'bicep', 1);
INSERT INTO workout.focuses (id, label, exercise_id) VALUES (6, 'tricep', 2);
INSERT INTO workout.focuses (id, label, exercise_id) VALUES (8, 'bicep', 3);
INSERT INTO workout.focuses (id, label, exercise_id) VALUES (7, 'forearm', 1);


--
-- Data for Name: users; Type: TABLE DATA; Schema: workout; Owner: workout-admin
--

INSERT INTO workout.users (id, email) VALUES (1, 'john@gmail.com');
INSERT INTO workout.users (id, email) VALUES (2, 'melissa@gmail.com');


--
-- Data for Name: workouts; Type: TABLE DATA; Schema: workout; Owner: workout-admin
--

INSERT INTO workout.workouts (id) VALUES (1);
INSERT INTO workout.workouts (id) VALUES (2);


--
-- Data for Name: user-exercise-workout; Type: TABLE DATA; Schema: workout; Owner: workout-admin
--

INSERT INTO workout."user-exercise-workout" (id, user_id, exercise_id, workout_id, record_reps, record_sets, completed_utc, record_weights) VALUES (1, 1, 1, 1, 15, 3, '11:57:27.029226', 25);
INSERT INTO workout."user-exercise-workout" (id, user_id, exercise_id, workout_id, record_reps, record_sets, completed_utc, record_weights) VALUES (2, 2, 2, 2, 8, 3, '11:58:07.097647', 10);


--
-- Name: exercises_id_seq; Type: SEQUENCE SET; Schema: workout; Owner: workout-admin
--

SELECT pg_catalog.setval('workout.exercises_id_seq', 3, true);


--
-- Name: focuses_id_seq; Type: SEQUENCE SET; Schema: workout; Owner: workout-admin
--

SELECT pg_catalog.setval('workout.focuses_id_seq', 8, true);


--
-- Name: user-exercise-workout_id_seq; Type: SEQUENCE SET; Schema: workout; Owner: workout-admin
--

SELECT pg_catalog.setval('workout."user-exercise-workout_id_seq"', 2, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: workout; Owner: workout-admin
--

SELECT pg_catalog.setval('workout.users_id_seq', 2, true);


--
-- Name: workouts_id_seq; Type: SEQUENCE SET; Schema: workout; Owner: workout-admin
--

SELECT pg_catalog.setval('workout.workouts_id_seq', 2, true);


--
-- PostgreSQL database dump complete
--

