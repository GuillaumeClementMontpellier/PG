--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.9
-- Dumped by pg_dump version 9.6.9

-- Started on 2019-05-21 17:53:10

set session datestyle to ISO, dmy;
--
-- TOC entry 2251 (class 0 OID 46947)
-- Dependencies: 195
-- Data for Name: personnephysique; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.personnephysique VALUES (0, 'LORCA', 'BERNARD', 15);
INSERT INTO public.personnephysique VALUES (1, 'CLANET', 'LUCIEN', 40);
INSERT INTO public.personnephysique VALUES (2, 'NABILA', 'ZOE', NULL);
INSERT INTO public.personnephysique VALUES (3, 'HUGO', 'EMILE', NULL);
INSERT INTO public.personnephysique VALUES (4, 'LEVEQUE', 'PIERRE', NULL);
INSERT INTO public.personnephysique VALUES (5, 'DUPONT', '03IE', NULL);
INSERT INTO public.personnephysique VALUES (6, 'RENARD', 'ALBERT', NULL);
INSERT INTO public.personnephysique VALUES (7, '03TIN', 'LOIC', NULL);
INSERT INTO public.personnephysique VALUES (8, 'DUPONT', 'ANTOINE', NULL);
INSERT INTO public.personnephysique VALUES (9, 'DUPONT', 'SYLVIE', NULL);
INSERT INTO public.personnephysique VALUES (10, 'DUPONT', 'ANTOINE', NULL);
INSERT INTO public.personnephysique VALUES (11, 'MEUNIER', 'LUC', NULL);
INSERT INTO public.personnephysique VALUES (12, 'LUCAS', 'PAUL', NULL);
INSERT INTO public.personnephysique VALUES (13, 'REVEST', 'ANNIE', NULL);
INSERT INTO public.personnephysique VALUES (14, 'ANTON', 'JEANNE', NULL);


--
-- TOC entry 2252 (class 0 OID 46953)
-- Dependencies: 196
-- Data for Name: habitant; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.habitant VALUES (2);
INSERT INTO public.habitant VALUES (3);
INSERT INTO public.habitant VALUES (4);
INSERT INTO public.habitant VALUES (5);
INSERT INTO public.habitant VALUES (6);
INSERT INTO public.habitant VALUES (7);
INSERT INTO public.habitant VALUES (8);
INSERT INTO public.habitant VALUES (9);
INSERT INTO public.habitant VALUES (10);
INSERT INTO public.habitant VALUES (11);
INSERT INTO public.habitant VALUES (12);
INSERT INTO public.habitant VALUES (13);
INSERT INTO public.habitant VALUES (14);


--
-- TOC entry 2255 (class 0 OID 46983)
-- Dependencies: 199
-- Data for Name: abonne; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.abonne VALUES (901001, NULL, 4);
INSERT INTO public.abonne VALUES (902043, 20, 5);
INSERT INTO public.abonne VALUES (902075, NULL, 6);
INSERT INTO public.abonne VALUES (911007, 20, 7);
INSERT INTO public.abonne VALUES (911021, NULL, 8);
INSERT INTO public.abonne VALUES (911022, NULL, 9);
INSERT INTO public.abonne VALUES (911023, 20, 10);
INSERT INTO public.abonne VALUES (922016, NULL, 11);
INSERT INTO public.abonne VALUES (921102, 20, 12);
INSERT INTO public.abonne VALUES (922143, NULL, 13);
INSERT INTO public.abonne VALUES (932010, NULL, 14);


--
-- TOC entry 2256 (class 0 OID 46993)
-- Dependencies: 200
-- Data for Name: bibliotheque; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.bibliotheque VALUES (0, 'EMILE ZOLA');
INSERT INTO public.bibliotheque VALUES (1, 'VICTOR HUGO');


--
-- TOC entry 2257 (class 0 OID 46998)
-- Dependencies: 201
-- Data for Name: abonnement; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.abonnement VALUES (1, 4, 500);
INSERT INTO public.abonnement VALUES (0, 5, 200);
INSERT INTO public.abonnement VALUES (1, 6, 200);
INSERT INTO public.abonnement VALUES (1, 7, 500);
INSERT INTO public.abonnement VALUES (0, 8, 500);
INSERT INTO public.abonnement VALUES (0, 9, 500);
INSERT INTO public.abonnement VALUES (0, 10, 200);
INSERT INTO public.abonnement VALUES (1, 11, 100);
INSERT INTO public.abonnement VALUES (1, 12, 500);
INSERT INTO public.abonnement VALUES (1, 13, 100);
INSERT INTO public.abonnement VALUES (1, 14, 100);


--
-- TOC entry 2248 (class 0 OID 46916)
-- Dependencies: 192
-- Data for Name: livre; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2259 (class 0 OID 47025)
-- Dependencies: 203
-- Data for Name: mot_clef; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2261 (class 0 OID 47046)
-- Dependencies: 205
-- Data for Name: caracterise; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2258 (class 0 OID 47013)
-- Dependencies: 202
-- Data for Name: exemplaire; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2260 (class 0 OID 47030)
-- Dependencies: 204
-- Data for Name: emprunt; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2249 (class 0 OID 46921)
-- Dependencies: 193
-- Data for Name: livreoriginal; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2250 (class 0 OID 46932)
-- Dependencies: 194
-- Data for Name: livretraduit; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2253 (class 0 OID 46963)
-- Dependencies: 197
-- Data for Name: ville; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ville VALUES (0, 'MONTPELLIER');
INSERT INTO public.ville VALUES (1, 'BEZIER');


--
-- TOC entry 2254 (class 0 OID 46968)
-- Dependencies: 198
-- Data for Name: residence; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.residence VALUES (0, 2);
INSERT INTO public.residence VALUES (1, 3);
INSERT INTO public.residence VALUES (0, 4);
INSERT INTO public.residence VALUES (0, 5);
INSERT INTO public.residence VALUES (0, 6);
INSERT INTO public.residence VALUES (1, 7);
INSERT INTO public.residence VALUES (0, 8);
INSERT INTO public.residence VALUES (0, 9);
INSERT INTO public.residence VALUES (1, 10);
INSERT INTO public.residence VALUES (0, 11);
INSERT INTO public.residence VALUES (0, 12);
INSERT INTO public.residence VALUES (0, 13);
INSERT INTO public.residence VALUES (0, 14);


-- Completed on 2019-05-21 17:53:10

--
-- PostgreSQL database dump complete
--

