--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.9
-- Dumped by pg_dump version 9.6.9

-- Started on 2019-05-14 12:32:35

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 2180 (class 0 OID 25925)
-- Dependencies: 185
-- Data for Name: ville; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ville VALUES (1, 'Castries');
INSERT INTO public.ville VALUES (2, 'Juvignac');
INSERT INTO public.ville VALUES (3, 'Grabels');
INSERT INTO public.ville VALUES (4, 'Nimes');
INSERT INTO public.ville VALUES (5, 'Montpellier');
INSERT INTO public.ville VALUES (6, 'Bessan');
INSERT INTO public.ville VALUES (7, 'Lunel');


--
-- TOC entry 2181 (class 0 OID 25930)
-- Dependencies: 186
-- Data for Name: etablissement; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.etablissement VALUES (1, '0341278E', 'College Arthur Rimbaud', 5);
INSERT INTO public.etablissement VALUES (2, '0341280G', 'College Les Pins', 1);
INSERT INTO public.etablissement VALUES (3, '0340008Z', 'College Victor Hugo', 6);
INSERT INTO public.etablissement VALUES (4, '0301094B', 'College Diderot', 4);


--
-- TOC entry 2183 (class 0 OID 25955)
-- Dependencies: 188
-- Data for Name: niveau; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.niveau VALUES (1, '6eme');
INSERT INTO public.niveau VALUES (2, '5eme');
INSERT INTO public.niveau VALUES (3, '4eme');
INSERT INTO public.niveau VALUES (4, '3eme');


--
-- TOC entry 2182 (class 0 OID 25940)
-- Dependencies: 187
-- Data for Name: prof; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.prof VALUES (1, 'James Bond', 1972, 1, 5);
INSERT INTO public.prof VALUES (2, 'Bioman', 1970, 1, 7);
INSERT INTO public.prof VALUES (3, 'Superman', 1978, 2, 1);
INSERT INTO public.prof VALUES (4, 'Batman', 1972, 3, 2);
INSERT INTO public.prof VALUES (5, 'Hulk', 1979, 3, 5);
INSERT INTO public.prof VALUES (6, 'Wonder Woman', 1983, 2, 5);
INSERT INTO public.prof VALUES (7, 'Tintin', 1974, 3, 3);
INSERT INTO public.prof VALUES (8, 'Zorro', 1972, 3, 1);


--
-- TOC entry 2186 (class 0 OID 25991)
-- Dependencies: 191
-- Data for Name: devoir; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.devoir VALUES (1, '2019-02-14', 1, 1);
INSERT INTO public.devoir VALUES (2, '2019-02-17', 1, 2);
INSERT INTO public.devoir VALUES (3, '2019-02-17', 2, 3);
INSERT INTO public.devoir VALUES (4, '2019-02-18', 1, 1);
INSERT INTO public.devoir VALUES (5, '2019-02-20', 2, 2);
INSERT INTO public.devoir VALUES (6, '2019-02-21', 3, 3);
INSERT INTO public.devoir VALUES (7, '2019-02-21', 8, 3);
INSERT INTO public.devoir VALUES (8, '2019-02-26', 4, 4);
INSERT INTO public.devoir VALUES (9, '2019-02-28', 2, 4);
INSERT INTO public.devoir VALUES (10, '2019-02-28', 5, 4);


--
-- TOC entry 2185 (class 0 OID 25976)
-- Dependencies: 190
-- Data for Name: exercice; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.exercice VALUES (1, 'Calculer 2+3', 1, 2, '2019-02-08');
INSERT INTO public.exercice VALUES (2, 'Developper 2(3x+5)', 2, 1, '2019-01-07');
INSERT INTO public.exercice VALUES (3, 'Calculer (-3)-(2)', 2, 2, '2019-01-10');
INSERT INTO public.exercice VALUES (4, 'Calculer la médiane de la série suivante : 12 - 14 - 15 - 19 -22 -25', 2, 1, '2019-02-08');
INSERT INTO public.exercice VALUES (5, 'Tracer un triangle equilatéral de 6 cm de côte', 1, 3, '2018-10-08');
INSERT INTO public.exercice VALUES (6, 'Calculer la longueur du segment [AB]', 3, 2, '2018-11-10');
INSERT INTO public.exercice VALUES (7, 'Tracer l''image de A par la translation qui transforme B en C', 3, 2, '2018-11-10');
INSERT INTO public.exercice VALUES (8, 'Simplifier l''expression suivante puis exprimer son double en fonction de x', 3, 2, '2018-11-10');
INSERT INTO public.exercice VALUES (9, 'Calculer le triple de 9', 1, 2, '2019-01-12');
INSERT INTO public.exercice VALUES (10, 'Effectuer les calculs suivants : 8 + 3 * 5 ; 17 - 3*2', 1, 5, '2019-01-14');
INSERT INTO public.exercice VALUES (11, 'Developper l''expression suivante : (2x-5)²', 4, 5, '2019-01-19');


--
-- TOC entry 2187 (class 0 OID 26006)
-- Dependencies: 192
-- Data for Name: contenu; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.contenu VALUES (1, 1, 6);
INSERT INTO public.contenu VALUES (1, 3, 4);
INSERT INTO public.contenu VALUES (2, 2, 5);
INSERT INTO public.contenu VALUES (2, 4, 2);
INSERT INTO public.contenu VALUES (3, 6, 3);
INSERT INTO public.contenu VALUES (3, 7, 4);
INSERT INTO public.contenu VALUES (3, 8, 3);
INSERT INTO public.contenu VALUES (4, 1, 1);
INSERT INTO public.contenu VALUES (4, 5, 2);
INSERT INTO public.contenu VALUES (4, 9, 1);
INSERT INTO public.contenu VALUES (5, 1, 2);
INSERT INTO public.contenu VALUES (5, 3, 5);
INSERT INTO public.contenu VALUES (5, 6, 5);
INSERT INTO public.contenu VALUES (5, 2, 3);
INSERT INTO public.contenu VALUES (5, 11, 5);
INSERT INTO public.contenu VALUES (6, 1, 3);
INSERT INTO public.contenu VALUES (6, 2, 6);
INSERT INTO public.contenu VALUES (6, 4, 5);
INSERT INTO public.contenu VALUES (6, 8, 2);
INSERT INTO public.contenu VALUES (7, 2, 3);
INSERT INTO public.contenu VALUES (7, 5, 2);
INSERT INTO public.contenu VALUES (8, 5, 2);
INSERT INTO public.contenu VALUES (8, 2, 2);
INSERT INTO public.contenu VALUES (8, 7, 2);
INSERT INTO public.contenu VALUES (8, 6, 2);
INSERT INTO public.contenu VALUES (8, 11, 2);
INSERT INTO public.contenu VALUES (9, 2, 2);
INSERT INTO public.contenu VALUES (9, 4, 2);
INSERT INTO public.contenu VALUES (9, 8, 2);
INSERT INTO public.contenu VALUES (9, 11, 4);
INSERT INTO public.contenu VALUES (10, 1, 2);
INSERT INTO public.contenu VALUES (10, 3, 2);
INSERT INTO public.contenu VALUES (10, 6, 2);
INSERT INTO public.contenu VALUES (10, 9, 2);
INSERT INTO public.contenu VALUES (10, 10, 2);
INSERT INTO public.contenu VALUES (10, 4, 2);


--
-- TOC entry 2184 (class 0 OID 25961)
-- Dependencies: 189
-- Data for Name: eleve; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.eleve VALUES (1, 'RAMI', 'ALEXANDRE', 1, 1);
INSERT INTO public.eleve VALUES (2, 'DUPONT', 'MAXIME', 3, 3);
INSERT INTO public.eleve VALUES (3, 'DUPONT', 'ARNAUD', 1, 1);
INSERT INTO public.eleve VALUES (4, 'VIGROS', 'HELENE', 1, 1);
INSERT INTO public.eleve VALUES (5, 'GOMAZ', 'GILLE', 2, 2);
INSERT INTO public.eleve VALUES (6, 'CHOUMIN', 'KHALIL', 3, 3);
INSERT INTO public.eleve VALUES (7, 'MONTEO', 'ILONA', 3, 4);
INSERT INTO public.eleve VALUES (8, 'MONTEO', 'MILAN', 3, 2);


--
-- TOC entry 2188 (class 0 OID 26021)
-- Dependencies: 193
-- Data for Name: passage; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.passage VALUES (1, 1, '2019-02-15', 5);
INSERT INTO public.passage VALUES (1, 3, '2019-02-15', 6);
INSERT INTO public.passage VALUES (1, 4, '2019-02-15', 4);
INSERT INTO public.passage VALUES (2, 5, '2019-02-18', 5);
INSERT INTO public.passage VALUES (2, 2, '2019-02-18', 6);
INSERT INTO public.passage VALUES (3, 1, '2019-02-20', 8);
INSERT INTO public.passage VALUES (3, 2, '2019-02-20', 8);
INSERT INTO public.passage VALUES (3, 6, '2019-02-20', 7);
INSERT INTO public.passage VALUES (4, 3, '2019-02-23', 3);
INSERT INTO public.passage VALUES (5, 5, '2019-02-26', 14);
INSERT INTO public.passage VALUES (6, 4, '2019-02-28', 11);
INSERT INTO public.passage VALUES (7, 3, '2019-02-22', 3);
INSERT INTO public.passage VALUES (8, 4, '2019-02-27', 11);
INSERT INTO public.passage VALUES (9, 4, '2019-03-01', 11);
INSERT INTO public.passage VALUES (10, 3, '2019-02-28', 11);


-- Completed on 2019-05-14 12:32:36

--
-- PostgreSQL database dump complete
--

