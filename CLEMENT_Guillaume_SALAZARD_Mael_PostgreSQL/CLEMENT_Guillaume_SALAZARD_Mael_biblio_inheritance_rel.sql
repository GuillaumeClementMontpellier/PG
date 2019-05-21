drop table if exists emprunt;
drop table if exists abonnement;
drop table if exists bibliotheque;
drop table if exists caracterise;
drop table if exists exemplaire;
drop table if exists residence;
drop table if exists ville;
drop table if exists abonne;
drop table if exists habitant;
drop table if exists personnephysique;
drop table if exists mot_clef;
drop table if exists livretraduit;
drop table if exists livreoriginal;
drop table if exists livre;

create table LIVRE (
	IDLIVRE integer,
	ISBN varchar(20),
	TITRE varchar(50) constraint lititre not null,
	constraint cp_livre PRIMARY KEY (IDLIVRE)
);

create table LIVREORIGINAL (
	idlivre integer,
	SIECLE integer check (SIECLE BETWEEN 0 and 21),
	CATEGORIE varchar(20),
	constraint cp_livreO PRIMARY KEY (IDLIVRE),
	constraint ce_livreO_livre Foreign KEY (IDLIVRE) references livre(idlivre)
);


create table LIVRETRADUIT (
	idlivre integer,
	IDLIVREORIGINAL integer,
	constraint cp_livreT PRIMARY KEY (IDLIVRE),
	constraint ce_livreT_livre Foreign KEY (IDLIVRE) references livre(idlivre),
	constraint ce_livreT_livreO Foreign KEY (IDLIVREORIGINAL) references LIVREORIGINAL(IDLIVRE)
) ; 

create table personnephysique (
	idpersonnephysique integer,
	nom varchar(30) constraint abnom not null,
	prenom varchar(20),
	age integer,
	CONSTRAINT cp_pers primary key (idpersonnephysique),
	constraint dom_age check (age between 0 and 120)
);

create table habitant (
	idpersonnephysique integer,
	CONSTRAINT cp_hab primary key (idpersonnephysique),
	CONSTRAINT ce_hab_pers foreign key (idpersonnephysique) references personnephysique(idpersonnephysique)
) ;

create table ville(
	idville integer,
	nom varchar(20),
	constraint cp_ville primary key (idville)
);

create table residence(
	idville integer,
	idpersonnephysique integer,
	constraint cp_res primary key (idville, idpersonnephysique),
	constraint ce_ville foreign key (idville) references ville(idville),
	CONSTRAINT ce_res_hab foreign key (idpersonnephysique) references habitant(idpersonnephysique)
); 


create table abonne (
	numeroabonne integer,
	reduction real,
	idpersonnephysique integer,
	CONSTRAINT cp_abo primary key (idpersonnephysique),
	CONSTRAINT ce_abo_pers foreign key (idpersonnephysique) references habitant(idpersonnephysique)
) ;

create table bibliotheque (
	idbibliotheque integer,
	nom varchar(30),
	constraint cp_bi primary key (idbibliotheque)
);

create table abonnement (
	idbibliotheque integer,
	idpersonnephysique integer,
	tarif real,
	constraint cp_ab primary key (idbibliotheque, idpersonnephysique),
	constraint ce_bi foreign key (idbibliotheque) references bibliotheque,
	constraint ce_abo_abo foreign key (idpersonnephysique) references abonne(idpersonnephysique)
); 


create table EXEMPLAIRE ( 
	idexemplaire integer,
	numero integer,
	DATEACHAT date,
	PRIX real,
	CODE_PRET varchar(20),
	ETAT varchar(15) check (etat in ('BON','ABIME','EN_REPARATION')),
	idlivre integer,
	CONSTRAINT cp_exemplaire primary key (idexemplaire),
	CONSTRAINT ce_exemplaire FOREIGN KEY (idlivre) REFERENCES LIVRE(idlivre),
	constraint dom_code_pret check (code_pret in ('EXCLU', 'EMPRUNTABLE', 'CONSULTABLE')) 
);

create table MOT_CLEF (
	idmotcle integer,
	MOT varchar(20),
	CONSTRAINT cp_mot_clef primary key (idmotcle)
);

create table EMPRUNT (
	idpersonnephysique integer,
	idexemplaire integer,
	DateEMPRUNT date,
	DateRETOURprevue date,
	DateRETOURreel date,
	NBRELANCE integer check (nbrelance in (1,2,3)),
	constraint cp_emprunt primary key (idpersonnephysique, idexemplaire, DateEMPRUNT),
	CONSTRAINT ce2_emprunt FOREIGN KEY (idexemplaire) REFERENCES EXEMPLAIRE(idexemplaire),
	CONSTRAINT ce1_emprunt FOREIGN KEY (idpersonnephysique) REFERENCES abonne(idpersonnephysique)
);

create table CARACTERISE (
	idlivre integer,
	idmotcle integer,
	constraint cp_caract primary key (idlivre,idmotcle),
	CONSTRAINT ce1_caract FOREIGN KEY (idlivre) REFERENCES livre(idlivre),
	CONSTRAINT ce2_caract FOREIGN KEY (idmotcle) REFERENCES mot_clef(idmotcle)
);

----------------------------------------------------------------------------------------------

-- pp
insert into personnephysique values (0, 'LORCA', 'BERNARD', 15);
insert into personnephysique values (1, 'CLANET', 'LUCIEN', 40);

-- ville
insert into ville values (0,'MONTPELLIER');
insert into ville values (1,'BEZIER');

-- habitant + pp + residence
create or replace function insert_habitant(nom varchar(30), prenom varchar(20), age integer, idville integer)
returns integer AS 
$body$
DECLARE
  ma integer;
BEGIN
  select max(idpersonnephysique) into ma from personnephysique;
  insert into personnephysique values (ma+1, nom, prenom);
  insert into habitant values (ma+1);
  insert into residence values (idville, ma+1);  
  return (ma + 1);
END;
$body$
language plpgsql;

select insert_habitant('NABILA', 'ZOE', 78, 0);
select insert_habitant('HUGO', 'EMILE', 53, 1);

-- biblio 
insert into bibliotheque values(0,'EMILE ZOLA');
insert into bibliotheque values(1,'VICTOR HUGO');

-- tmp => abo + habitant + pp + abo + residence
create or replace function insert_abo(num_ab integer, nom varchar(30), prenom varchar(20), age integer, nomville varchar(20), tarif integer, reduc integer)
returns integer AS 
$body$
DECLARE
  idp integer;
  idv integer;
BEGIN
  select idville into idv from ville v where v.nom = nomville;
  select insert_habitant(nom, prenom, age, idv) into idp;
  insert into abonne values (num_ab, reduc, idp);
  IF nom = 'DUPONT' THEN
    insert into abonnement values (0, idp, tarif);
  ELSE
    insert into abonnement values (1, idp, tarif);
  END IF;
  return idp;
END;
$body$
language plpgsql;

select insert_abo(num_ab, nom, prenom, age, ville, tarif, reduc) from tmp.abonne;

