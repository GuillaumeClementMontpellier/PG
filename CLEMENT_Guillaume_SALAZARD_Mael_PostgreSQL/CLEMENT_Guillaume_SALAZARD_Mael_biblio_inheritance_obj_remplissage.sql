--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.9
-- Dumped by pg_dump version 9.6.9

-- Started on 2019-05-21 17:51:02
--
-- TOC entry 2253 (class 0 OID 46841)
-- Dependencies: 199
-- Data for Name: abonne; Type: TABLE DATA; Schema: public; Owner: postgres
--

set session datestyle to ISO, dmy;

INSERT INTO public.abonne VALUES (4, 'LEVEQUE', 'PIERRE', 40, 901001, NULL);
INSERT INTO public.abonne VALUES (5, 'DUPONT', '03IE', 20, 902043, 20);
INSERT INTO public.abonne VALUES (6, 'RENARD', 'ALBERT', 18, 902075, NULL);
INSERT INTO public.abonne VALUES (7, '03TIN', 'LOIC', 35, 911007, 20);
INSERT INTO public.abonne VALUES (8, 'DUPONT', 'ANTOINE', 38, 911021, NULL);
INSERT INTO public.abonne VALUES (9, 'DUPONT', 'SYLVIE', 35, 911022, NULL);
INSERT INTO public.abonne VALUES (10, 'DUPONT', 'ANTOINE', 22, 911023, 20);
INSERT INTO public.abonne VALUES (11, 'MEUNIER', 'LUC', 14, 922016, NULL);
INSERT INTO public.abonne VALUES (12, 'LUCAS', 'PAUL', 48, 921102, 20);
INSERT INTO public.abonne VALUES (13, 'REVEST', 'ANNIE', 12, 922143, NULL);
INSERT INTO public.abonne VALUES (14, 'ANTON', 'JEANNE', 10, 932010, NULL);

--
-- TOC entry 2254 (class 0 OID 46845)
-- Dependencies: 200
-- Data for Name: bibliotheque; Type: TABLE DATA; Schema: public; Owner: postgres
--


INSERT INTO public.bibliotheque VALUES (0, 'EMILE ZOLA');
INSERT INTO public.bibliotheque VALUES (1, 'VICTOR HUGO');



--
-- TOC entry 2255 (class 0 OID 46850)
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



INSERT INTO public.habitant VALUES (2, 'NABILA', 'ZOE', 78);
INSERT INTO public.habitant VALUES (3, 'HUGO', 'EMILE', 53);


--
-- TOC entry 2249 (class 0 OID 46816)
-- Dependencies: 195
-- Data for Name: personnephysique; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.personnephysique VALUES (0, 'LORCA', 'BERNARD', 15);
INSERT INTO public.personnephysique VALUES (1, 'CLANET', 'LUCIEN', 40);


--
-- TOC entry 2251 (class 0 OID 46826)
-- Dependencies: 197
-- Data for Name: ville; Type: TABLE DATA; Schema: public; Owner: postgres
--


INSERT INTO public.ville VALUES (0, 'MONTPELLIER');
INSERT INTO public.ville VALUES (1, 'BEZIER');



--
-- TOC entry 2252 (class 0 OID 46831)
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



-- Completed on 2019-05-21 17:51:02

--
-- PostgreSQL database dump complete
--

