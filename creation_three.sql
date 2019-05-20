--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.9
-- Dumped by pg_dump version 9.6.9

-- Started on 2019-05-20 15:43:39

--
-- TOC entry 194 (class 1259 OID 35176)
-- Name: contenu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contenu (
    iddevoir integer NOT NULL,
    idexercice integer NOT NULL,
    bareme real
);


ALTER TABLE public.contenu OWNER TO postgres;

--
-- TOC entry 193 (class 1259 OID 35161)
-- Name: devoir; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.devoir (
    iddevoir integer NOT NULL,
    datecreation date,
    idprof integer NOT NULL,
    idniveau integer
);


ALTER TABLE public.devoir OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 35131)
-- Name: eleve; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.eleve (
    idpersonne integer NOT NULL,
    idniveau integer
);


ALTER TABLE public.eleve OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 35090)
-- Name: etablissement; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.etablissement (
    idetablissement integer NOT NULL,
    rne character varying(8),
    nom character varying(50) NOT NULL,
    idville integer
);


ALTER TABLE public.etablissement OWNER TO postgres;

--
-- TOC entry 192 (class 1259 OID 35146)
-- Name: exercice; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.exercice (
    idexercice integer NOT NULL,
    contenu character varying(250),
    idniveau integer,
    idprof integer,
    datecreation date
);


ALTER TABLE public.exercice OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 35125)
-- Name: niveau; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.niveau (
    idniveau integer NOT NULL,
    niveau character varying(4),
    CONSTRAINT chk_niveau CHECK (((niveau)::text = ANY ((ARRAY['6eme'::character varying, '5eme'::character varying, '4eme'::character varying, '3eme'::character varying])::text[])))
);


ALTER TABLE public.niveau OWNER TO postgres;

--
-- TOC entry 195 (class 1259 OID 35191)
-- Name: passage; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.passage (
    iddevoir integer NOT NULL,
    ideleve integer NOT NULL,
    datepassage date NOT NULL,
    note integer
);


ALTER TABLE public.passage OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 35100)
-- Name: personne; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personne (
    idpersonne integer NOT NULL,
    nom character varying(20) NOT NULL,
    prenom character varying(20),
    annee_naissance integer,
    idetablissement integer,
    idville integer
);


ALTER TABLE public.personne OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 35115)
-- Name: prof; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prof (
    idpersonne integer NOT NULL,
    annee_titularisation integer
);


ALTER TABLE public.prof OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 35085)
-- Name: ville; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ville (
    idville integer NOT NULL,
    nom character varying(30) NOT NULL
);


ALTER TABLE public.ville OWNER TO postgres;

--
-- TOC entry 2223 (class 0 OID 35176)
-- Dependencies: 194
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
-- TOC entry 2222 (class 0 OID 35161)
-- Dependencies: 193
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
-- TOC entry 2220 (class 0 OID 35131)
-- Dependencies: 191
-- Data for Name: eleve; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.eleve VALUES (9, 1);
INSERT INTO public.eleve VALUES (10, 3);
INSERT INTO public.eleve VALUES (11, 1);
INSERT INTO public.eleve VALUES (12, 1);
INSERT INTO public.eleve VALUES (13, 2);
INSERT INTO public.eleve VALUES (14, 3);
INSERT INTO public.eleve VALUES (15, 4);
INSERT INTO public.eleve VALUES (16, 2);


--
-- TOC entry 2216 (class 0 OID 35090)
-- Dependencies: 187
-- Data for Name: etablissement; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.etablissement VALUES (1, '0341278E', 'College Arthur Rimbaud', 5);
INSERT INTO public.etablissement VALUES (2, '0341280G', 'College Les Pins', 1);
INSERT INTO public.etablissement VALUES (3, '0340008Z', 'College Victor Hugo', 6);
INSERT INTO public.etablissement VALUES (4, '0301094B', 'College Diderot', 4);


--
-- TOC entry 2221 (class 0 OID 35146)
-- Dependencies: 192
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
-- TOC entry 2219 (class 0 OID 35125)
-- Dependencies: 190
-- Data for Name: niveau; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.niveau VALUES (1, '6eme');
INSERT INTO public.niveau VALUES (2, '5eme');
INSERT INTO public.niveau VALUES (3, '4eme');
INSERT INTO public.niveau VALUES (4, '3eme');


--
-- TOC entry 2224 (class 0 OID 35191)
-- Dependencies: 195
-- Data for Name: passage; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.passage VALUES (1, 9, '2019-02-15', 5);
INSERT INTO public.passage VALUES (3, 9, '2019-02-20', 8);
INSERT INTO public.passage VALUES (2, 10, '2019-02-18', 6);
INSERT INTO public.passage VALUES (3, 10, '2019-02-20', 8);
INSERT INTO public.passage VALUES (1, 11, '2019-02-15', 6);
INSERT INTO public.passage VALUES (4, 11, '2019-02-23', 3);
INSERT INTO public.passage VALUES (7, 11, '2019-02-22', 3);
INSERT INTO public.passage VALUES (10, 11, '2019-02-28', 11);
INSERT INTO public.passage VALUES (1, 12, '2019-02-15', 4);
INSERT INTO public.passage VALUES (6, 12, '2019-02-28', 11);
INSERT INTO public.passage VALUES (8, 12, '2019-02-27', 11);
INSERT INTO public.passage VALUES (9, 12, '2019-03-01', 11);
INSERT INTO public.passage VALUES (2, 13, '2019-02-18', 5);
INSERT INTO public.passage VALUES (5, 13, '2019-02-26', 14);
INSERT INTO public.passage VALUES (3, 14, '2019-02-20', 7);


--
-- TOC entry 2217 (class 0 OID 35100)
-- Dependencies: 188
-- Data for Name: personne; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.personne VALUES (1, 'James Bond', NULL, 1972, 1, 5);
INSERT INTO public.personne VALUES (2, 'Bioman', NULL, 1970, 1, 7);
INSERT INTO public.personne VALUES (3, 'Superman', NULL, 1978, 2, 1);
INSERT INTO public.personne VALUES (4, 'Batman', NULL, 1972, 3, 2);
INSERT INTO public.personne VALUES (5, 'Hulk', NULL, 1979, 3, 5);
INSERT INTO public.personne VALUES (6, 'Wonder Woman', NULL, 1983, 2, 5);
INSERT INTO public.personne VALUES (7, 'Tintin', NULL, 1974, 3, 3);
INSERT INTO public.personne VALUES (8, 'Zorro', NULL, 1972, 3, 1);
INSERT INTO public.personne VALUES (9, 'RAMI', 'ALEXANDRE', NULL, 1, NULL);
INSERT INTO public.personne VALUES (10, 'DUPONT', 'MAXIME', NULL, 3, NULL);
INSERT INTO public.personne VALUES (11, 'DUPONT', 'ARNAUD', NULL, 1, NULL);
INSERT INTO public.personne VALUES (12, 'VIGROS', 'HELENE', NULL, 1, NULL);
INSERT INTO public.personne VALUES (13, 'GOMAZ', 'GILLE', NULL, 2, NULL);
INSERT INTO public.personne VALUES (14, 'CHOUMIN', 'KHALIL', NULL, 3, NULL);
INSERT INTO public.personne VALUES (15, 'MONTEO', 'ILONA', NULL, 3, NULL);
INSERT INTO public.personne VALUES (16, 'MONTEO', 'MILAN', NULL, 3, NULL);


--
-- TOC entry 2218 (class 0 OID 35115)
-- Dependencies: 189
-- Data for Name: prof; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.prof VALUES (1, NULL);
INSERT INTO public.prof VALUES (2, NULL);
INSERT INTO public.prof VALUES (3, NULL);
INSERT INTO public.prof VALUES (4, NULL);
INSERT INTO public.prof VALUES (5, NULL);
INSERT INTO public.prof VALUES (6, NULL);
INSERT INTO public.prof VALUES (7, NULL);
INSERT INTO public.prof VALUES (8, NULL);


--
-- TOC entry 2215 (class 0 OID 35085)
-- Dependencies: 186
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
-- TOC entry 2081 (class 2606 OID 35180)
-- Name: contenu cp_contenu; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contenu
    ADD CONSTRAINT cp_contenu PRIMARY KEY (iddevoir, idexercice);


--
-- TOC entry 2079 (class 2606 OID 35165)
-- Name: devoir cp_devoir; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.devoir
    ADD CONSTRAINT cp_devoir PRIMARY KEY (iddevoir);


--
-- TOC entry 2075 (class 2606 OID 35135)
-- Name: eleve cp_eleve; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eleve
    ADD CONSTRAINT cp_eleve PRIMARY KEY (idpersonne);


--
-- TOC entry 2067 (class 2606 OID 35094)
-- Name: etablissement cp_etab; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.etablissement
    ADD CONSTRAINT cp_etab PRIMARY KEY (idetablissement);


--
-- TOC entry 2077 (class 2606 OID 35150)
-- Name: exercice cp_exercice; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exercice
    ADD CONSTRAINT cp_exercice PRIMARY KEY (idexercice);


--
-- TOC entry 2073 (class 2606 OID 35130)
-- Name: niveau cp_niveau; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.niveau
    ADD CONSTRAINT cp_niveau PRIMARY KEY (idniveau);


--
-- TOC entry 2083 (class 2606 OID 35195)
-- Name: passage cp_passage; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.passage
    ADD CONSTRAINT cp_passage PRIMARY KEY (iddevoir, ideleve, datepassage);


--
-- TOC entry 2069 (class 2606 OID 35104)
-- Name: personne cp_personne; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personne
    ADD CONSTRAINT cp_personne PRIMARY KEY (idpersonne);


--
-- TOC entry 2071 (class 2606 OID 35119)
-- Name: prof cp_prof; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prof
    ADD CONSTRAINT cp_prof PRIMARY KEY (idpersonne);


--
-- TOC entry 2065 (class 2606 OID 35089)
-- Name: ville cp_ville; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ville
    ADD CONSTRAINT cp_ville PRIMARY KEY (idville);


--
-- TOC entry 2095 (class 2606 OID 35181)
-- Name: contenu ce_contenu_devoir; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contenu
    ADD CONSTRAINT ce_contenu_devoir FOREIGN KEY (iddevoir) REFERENCES public.devoir(iddevoir);


--
-- TOC entry 2094 (class 2606 OID 35186)
-- Name: contenu ce_contenu_exercice; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contenu
    ADD CONSTRAINT ce_contenu_exercice FOREIGN KEY (idexercice) REFERENCES public.exercice(idexercice);


--
-- TOC entry 2093 (class 2606 OID 35166)
-- Name: devoir ce_devoir_niveau; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.devoir
    ADD CONSTRAINT ce_devoir_niveau FOREIGN KEY (idniveau) REFERENCES public.niveau(idniveau);


--
-- TOC entry 2092 (class 2606 OID 35171)
-- Name: devoir ce_devoir_prof; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.devoir
    ADD CONSTRAINT ce_devoir_prof FOREIGN KEY (idprof) REFERENCES public.prof(idpersonne);


--
-- TOC entry 2089 (class 2606 OID 35136)
-- Name: eleve ce_eleve_niveau; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eleve
    ADD CONSTRAINT ce_eleve_niveau FOREIGN KEY (idniveau) REFERENCES public.niveau(idniveau);


--
-- TOC entry 2088 (class 2606 OID 35141)
-- Name: eleve ce_eleve_personne; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eleve
    ADD CONSTRAINT ce_eleve_personne FOREIGN KEY (idpersonne) REFERENCES public.personne(idpersonne);


--
-- TOC entry 2084 (class 2606 OID 35095)
-- Name: etablissement ce_etab_ville; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.etablissement
    ADD CONSTRAINT ce_etab_ville FOREIGN KEY (idville) REFERENCES public.ville(idville);


--
-- TOC entry 2091 (class 2606 OID 35151)
-- Name: exercice ce_exercice_niveau; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exercice
    ADD CONSTRAINT ce_exercice_niveau FOREIGN KEY (idniveau) REFERENCES public.niveau(idniveau);


--
-- TOC entry 2090 (class 2606 OID 35156)
-- Name: exercice ce_exercice_prof; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exercice
    ADD CONSTRAINT ce_exercice_prof FOREIGN KEY (idprof) REFERENCES public.prof(idpersonne);


--
-- TOC entry 2097 (class 2606 OID 35196)
-- Name: passage ce_passage_devoir; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.passage
    ADD CONSTRAINT ce_passage_devoir FOREIGN KEY (iddevoir) REFERENCES public.devoir(iddevoir);


--
-- TOC entry 2096 (class 2606 OID 35201)
-- Name: passage ce_passage_eleve; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.passage
    ADD CONSTRAINT ce_passage_eleve FOREIGN KEY (ideleve) REFERENCES public.eleve(idpersonne);


--
-- TOC entry 2085 (class 2606 OID 35110)
-- Name: personne ce_personne_etab; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personne
    ADD CONSTRAINT ce_personne_etab FOREIGN KEY (idetablissement) REFERENCES public.etablissement(idetablissement);


--
-- TOC entry 2086 (class 2606 OID 35105)
-- Name: personne ce_personne_ville; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personne
    ADD CONSTRAINT ce_personne_ville FOREIGN KEY (idville) REFERENCES public.ville(idville);


--
-- TOC entry 2087 (class 2606 OID 35120)
-- Name: prof ce_prof_personne; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prof
    ADD CONSTRAINT ce_prof_personne FOREIGN KEY (idpersonne) REFERENCES public.personne(idpersonne);


-- Completed on 2019-05-20 15:43:39

--
-- PostgreSQL database dump complete
--

