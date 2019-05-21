drop table if exists tmp.emprunt;
drop table if exists tmp.caracterise;
drop table if exists tmp.exemplaire;
drop table if exists tmp.abonne;
drop table if exists tmp.mot_clef;
drop table if exists tmp.livre;

create table tmp.LIVRE (
ISBN varchar(20),
TITRE varchar(50) constraint lititre not null,
SIECLE integer check (SIECLE BETWEEN 0 and 21),
CATEGORIE varchar(20),
CONSTRAINT cp_livre primary key (ISBN)
);

create table tmp.abonne (
num_ab integer,
nom varchar(30) constraint abnom not null,
prenom varchar(20),
ville varchar(30),
age integer,
tarif integer,
reduc integer,
CONSTRAINT cp_abonne primary key (num_ab),
constraint dom_age check (age between 0 and 120));

create table tmp.EXEMPLAIRE (
NUMERO integer,
DATE_ACHAT date,
PRIX integer,
CODE_PRET varchar(20),
ETAT varchar(15) check (etat in ('BON','ABIME','EN_REPARATION')),
ISBN varchar(20),
CONSTRAINT cp_exemplaire primary key (numero),
CONSTRAINT ce_exemplaire FOREIGN KEY (ISBN) REFERENCES tmp.LIVRE(ISBN),
constraint dom_code_pret check (code_pret in ('EXCLU', 'EMPRUNTABLE', 'CONSULTABLE')) 
);

create table tmp.MOT_CLEF (
MOT varchar(20) CONSTRAINT cp_mot_clef primary key
);

create table tmp.EMPRUNT (
NUM_AB integer,
NUM_EX integer,
D_EMPRUNT date,
D_RETOUR date,
D_RET_REEL date,
NB_RELANCE integer check (nb_relance in (1,2,3)),
constraint cp_emprunt primary key (NUM_AB,NUM_EX,D_EMPRUNT),
CONSTRAINT ce1_emprunt FOREIGN KEY (num_ab) REFERENCES tmp.ABONNE(NUM_AB),
CONSTRAINT ce2_emprunt FOREIGN KEY (num_ex) REFERENCES tmp.EXEMPLAIRE(NUMERO)
);

create table tmp.CARACTERISE (
ISBN varchar(20),
MOT varchar(20),
constraint cp_caract primary key (ISBN,MOT),
CONSTRAINT ce1_caract FOREIGN KEY (isbn) REFERENCES tmp.livre(ISBN),
CONSTRAINT ce2_caract FOREIGN KEY (mot) REFERENCES tmp.mot_clef(mot)
);


BEGIN;

set session datestyle to ISO, dmy;

delete from tmp.emprunt;
delete from tmp.caracterise;
delete from tmp.mot_clef;
delete from tmp.exemplaire;
delete from tmp.abonne;
delete from tmp.livre;




insert into tmp.abonne values(901001,'LEVEQUE','PIERRE','MONTPELLIER',40,500,NULL);
insert into tmp.abonne values(902043,'DUPONT','03IE','MONTPELLIER',20,200,20);
insert into tmp.abonne values(902075,'RENARD','ALBERT','MONTPELLIER',18,200,NULL);
insert into tmp.abonne values(911007,'03TIN','LOIC','BEZIER',35,500,20);
insert into tmp.abonne values(911021,'DUPONT','ANTOINE','MONTPELLIER',38,500,NULL);
insert into tmp.abonne values(911022,'DUPONT','SYLVIE','MONTPELLIER',35,500,NULL);
insert into tmp.abonne values(911023,'DUPONT','ANTOINE','BEZIER',22,200,20);
insert into tmp.abonne values(922016,'MEUNIER','LUC','MONTPELLIER',14,100,NULL);
insert into tmp.abonne values(921102,'LUCAS','PAUL','MONTPELLIER',48,500,20);
insert into tmp.abonne values(922143,'REVEST','ANNIE','MONTPELLIER',12,100,NULL);
insert into tmp.abonne values(932010,'ANTON','JEANNE','MONTPELLIER',10,100,NULL);


insert into tmp.LIVRE values('1_104_1050_2','LE MUR',20,'NOUVELLE');
insert into tmp.LIVRE values('0_15_270500_3','LE MIRACLE DE LA ROSE',20,'ROMAN');
insert into tmp.LIVRE values('0_85_4107_3','L ENFANT',19,'ROMAN');
insert into tmp.LIVRE values('0_112_3785_5','POESIES COMPLETES', 15,'POEME');
insert into tmp.LIVRE values('0_201_14439_5','AN INTRODUCTION TO DATABASE SYSTEMS',20,'SCIENCES');
insert into tmp.LIVRE values('0_12_27550_2','NEW APPLICATIONS OF DATABASES',20,'SCIENCES');
insert into tmp.LIVRE values('0_8_7707_2','BASES DE DONNEES RELATIONNELLES',20,'SCIENCES');
insert into tmp.LIVRE values('1_22_1721_3','LE NOM DE LA ROSE',20,'ROMAN');
insert into tmp.LIVRE values('3_505_13700_5','LE GRAND VESTIAIRE',20,'ROMAN');
insert into tmp.LIVRE values('0_18_47892_2','UNE ROSE POUR MORRISSON',20,'ROMAN');
insert into tmp.LIVRE values('9_782070_36','LA PERLE',20,'ROMAN');
insert into tmp.LIVRE values('2_7296_0040','GODEL ESCHER BACH : LES BRINS D UNE GUIRLANDE',20,NULL);
insert into tmp.LIVRE values('0_26_28079_6','OBJET, DE MERISE A C++',20,'SCIENCES');


insert into tmp.mot_clef values('LITTERATURE');
insert into tmp.mot_clef values('ROMAN');
insert into tmp.mot_clef values('POESIE');
insert into tmp.mot_clef values('SCIENCES');
insert into tmp.mot_clef values('INFORMATIQUE');
insert into tmp.mot_clef values('BASES DE DONNEES');
insert into tmp.mot_clef values('HISTOIRE');
insert into tmp.mot_clef values('ESSAI');
insert into tmp.mot_clef values('NOUVELLE');
insert into tmp.mot_clef values('ME12INE');


insert into tmp.CARACTERISE VALUES ('1_104_1050_2','LITTERATURE');
insert into tmp.CARACTERISE VALUES ('0_15_270500_3','LITTERATURE');
insert into tmp.CARACTERISE VALUES ('0_15_270500_3','ROMAN');
insert into tmp.CARACTERISE VALUES ('0_85_4107_3','LITTERATURE');
insert into tmp.CARACTERISE VALUES ('0_85_4107_3','ROMAN');
insert into tmp.CARACTERISE VALUES ('0_112_3785_5','LITTERATURE');
insert into tmp.CARACTERISE VALUES ('0_112_3785_5','POESIE');
insert into tmp.CARACTERISE VALUES ('0_201_14439_5','SCIENCES');
insert into tmp.CARACTERISE VALUES ('0_201_14439_5','INFORMATIQUE');
insert into tmp.CARACTERISE VALUES ('0_201_14439_5','BASES DE DONNEES');
insert into tmp.CARACTERISE VALUES ('0_12_27550_2','SCIENCES');
insert into tmp.CARACTERISE VALUES ('0_12_27550_2','INFORMATIQUE');
insert into tmp.CARACTERISE VALUES ('0_8_7707_2','SCIENCES');
insert into tmp.CARACTERISE VALUES ('0_8_7707_2','INFORMATIQUE');
insert into tmp.CARACTERISE VALUES ('0_8_7707_2','BASES DE DONNEES');
insert into tmp.CARACTERISE VALUES ('1_22_1721_3','ROMAN');
insert into tmp.CARACTERISE VALUES ('1_22_1721_3','HISTOIRE');
insert into tmp.CARACTERISE VALUES ('3_505_13700_5','LITTERATURE');
insert into tmp.CARACTERISE VALUES ('3_505_13700_5','ROMAN');
insert into tmp.CARACTERISE VALUES ('0_26_28079_6','SCIENCES');
insert into tmp.CARACTERISE VALUES ('0_26_28079_6','INFORMATIQUE');
insert into tmp.CARACTERISE VALUES ('0_26_28079_6','BASES DE DONNEES');


insert into tmp.exemplaire values (1010,'10-04-1985',55,'EMPRUNTABLE','BON','0_18_47892_2');
insert into tmp.exemplaire values (1011,'10-04-1985',55,'EMPRUNTABLE','BON','0_18_47892_2');
insert into tmp.exemplaire values (1012,'20-05-1985',112,'EMPRUNTABLE','BON','3_505_13700_5');
insert into tmp.exemplaire values (2909,'30-03-1990',35,'EMPRUNTABLE','BON','3_505_13700_5');
insert into tmp.exemplaire values (2673,'15-03-1991',42,'EMPRUNTABLE','ABIME','3_505_13700_5');
insert into tmp.exemplaire values (2710,'20-06-1984',270,'CONSULTABLE','BON','0_8_7707_2');
insert into tmp.exemplaire values (2711,'20-06-1984',270,'EMPRUNTABLE','BON','0_8_7707_2');
insert into tmp.exemplaire values (3014,'15-09-1990',420,'CONSULTABLE','BON','0_201_14439_5');
insert into tmp.exemplaire values (3016,'15-09-1990',420,'EMPRUNTABLE','BON','0_201_14439_5');
insert into tmp.exemplaire values (3702,'20-02-1992',210,'EMPRUNTABLE','BON','1_22_1721_3');
insert into tmp.exemplaire values (3703,'20-02-1992',210,'CONSULTABLE','BON','1_22_1721_3');
insert into tmp.exemplaire values (4111,'03-01-1995',48,'EMPRUNTABLE','BON','1_22_1721_3');
insert into tmp.exemplaire values (4112,'03-01-1995',48,'EXCLU','BON','1_22_1721_3');
insert into tmp.exemplaire values (4203,'29-11-1992',35,'EMPRUNTABLE','BON','1_104_1050_2');
insert into tmp.exemplaire values (4204,'29-11-1992',35,'EMPRUNTABLE','ABIME','1_104_1050_2');
insert into tmp.exemplaire values (5003,'10-06-1993',39,'EMPRUNTABLE','BON','1_104_1050_2');
insert into tmp.exemplaire values (5004,'10-06-1993',41,'EMPRUNTABLE','BON','0_15_270500_3');
insert into tmp.exemplaire values (5005,'10-06-1993',41,'EMPRUNTABLE','BON','0_15_270500_3');
insert into tmp.exemplaire values (5103,'20-12-1990',470,'CONSULTABLE','BON','0_12_27550_2');
insert into tmp.exemplaire values (5104,'20-12-1990',470,'EMPRUNTABLE','BON','0_12_27550_2');
insert into tmp.exemplaire values (6006,'15-12-1995',33,'EMPRUNTABLE','BON','0_85_4107_3');
insert into tmp.exemplaire values (6007,'15-12-1995',33,'EMPRUNTABLE','BON','0_85_4107_3');
insert into tmp.exemplaire values (5202,'18-10-1993',40,'EMPRUNTABLE','BON','0_18_47892_2');
insert into tmp.exemplaire values (7000,'01-09-1987',420,'CONSULTABLE','BON','2_7296_0040');
insert into tmp.exemplaire values (7001,'01-09-1987',420,'EMPRUNTABLE','BON','2_7296_0040');
insert into tmp.exemplaire values (7002,'01-09-1987',420,'EXCLU','BON','2_7296_0040');
insert into tmp.exemplaire values (1090,'23-11-1985',150,'EXCLU','ABIME','9_782070_36');
insert into tmp.exemplaire values (1091,'23-11-1985',150,'CONSULTABLE','EN_REPARATION','9_782070_36');
insert into tmp.exemplaire values (1109,'30-05-1987',170,'EMPRUNTABLE','BON','9_782070_36');


insert into tmp.emprunt values (911023,5003,'10-03-2002','30-03-2002','30-03-2002',NULL);
insert into tmp.emprunt values (911023,5005,'30-03-2002','15-04-2002','10-04-2002',NULL);
insert into tmp.emprunt values (911023,1012,'30-03-2002','15-04-2002','10-04-2002',NULL);
insert into tmp.emprunt values (911023,5103,'17-06-2002','30-06-2002','20-07-2002',1);
insert into tmp.emprunt values (901001,4203,'03-01-2001','18-01-2001','18-01-2001',NULL);
insert into tmp.emprunt values (901001,5005,'03-01-2001','18-01-2001','18-01-2001',NULL);
insert into tmp.emprunt values (911007,4203,'25-02-2001','08-03-2001','25-03-2001',1);
insert into tmp.emprunt values (911007,1010,'13-05-2001','31-05-2001','31-05-2001',NULL);
insert into tmp.emprunt values (921102,4204,'08-08-2002','22-08-2002','30-08-2002',NULL);
insert into tmp.emprunt values (921102,5005,'08-08-2002','22-08-2002','30-08-2002',NULL);
insert into tmp.emprunt values (911021,5004,'10-12-2002','30-12-2002','28-12-2002',NULL);
insert into tmp.emprunt values (911007,5004,'20-07-2002','10-08-2002','10-08-2002',NULL);
insert into tmp.emprunt values (911007,4204,'19-01-2003','10-02-2003',NULL,1);
insert into tmp.emprunt values (911007,2673,'10-12-2002','30-12-2002','28-12-2002',NULL);
insert into tmp.emprunt values (902075,2673,'15-02-2003','28-02-2003',NULL,NULL);
insert into tmp.emprunt values (902075,1010,'05-01-2003','25-01-2003',NULL,1);
insert into tmp.emprunt values (921102,6006,'20-12-2002','10-01-2003',NULL,2);
insert into tmp.emprunt values (911023,6007,'22-12-2002','12-01-2003','13-01-2003',NULL);
insert into tmp.emprunt values (902043,7001,'15-09-2000','09-10-2000','10-10-2000',NULL);
insert into tmp.emprunt values (902043,3014,'01-10-2000','21-10-2000','20-11-2000',2);
insert into tmp.emprunt values (902043,3014,'01-12-2000','20-12-2000','20-12-2000',NULL);
insert into tmp.emprunt values (911023,1109,'15-09-2002','05-10-2002','05-11-2002',2);
insert into tmp.emprunt values (902043,7001,'20-11-2000','10-12-2000','10-12-2000', NULL);
insert into tmp.emprunt values (901001,7001,'30-01-2000','20-02-2000','18-02-2000',NULL);
insert into tmp.emprunt values (901001,7001,'22-05-2002','12-06-2002','15-06-2002',NULL);

COMMIT;

