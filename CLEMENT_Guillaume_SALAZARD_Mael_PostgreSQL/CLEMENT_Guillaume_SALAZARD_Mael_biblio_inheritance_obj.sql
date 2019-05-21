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
	SIECLE integer check (SIECLE BETWEEN 0 and 21),
	CATEGORIE varchar(20)
) inherits (LIVRE);


create table LIVRETRADUIT (
	IDLIVREORIGINAL integer
) inherits (LIVRE); --trigger pour livreOriginal

create table personnephysique (
	idpersonnephysique integer,
	nom varchar(30) constraint abnom not null,
	prenom varchar(20),
	age integer,
	CONSTRAINT cp_abonne primary key (idpersonnephysique),
	constraint dom_age check (age between 0 and 120)
);

create table habitant ( ) inherits (personnephysique);

create table ville(
	idville integer,
	nom varchar(20),
	constraint cp_ville primary key (idville)
);

create table residence(
	idville integer,
	idpersonnephysique integer,
	constraint cp_res primary key (idville, idpersonnephysique),
	constraint ce_ville foreign key (idville) references ville(idville)
); --trigger pour cle etrangere habitant


create table abonne (
	numeroabonne integer,
	reduction real
) inherits (habitant);

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
	constraint ce_bi foreign key (idbibliotheque) references bibliotheque
); --trigger pou cle etrangere abonne


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
	CONSTRAINT ce2_emprunt FOREIGN KEY (idexemplaire) REFERENCES EXEMPLAIRE(idexemplaire)
); --trigger pour cle etrangere abonne

create table CARACTERISE (
	idlivre integer,
	idmotcle integer,
	constraint cp_caract primary key (idlivre,idmotcle),
	CONSTRAINT ce1_caract FOREIGN KEY (idlivre) REFERENCES livre(idlivre),
	CONSTRAINT ce2_caract FOREIGN KEY (idmotcle) REFERENCES mot_clef(idmotcle)
);


-------------------------------------------------------------------------------------------

-- trigger unicite id pp, hab, abo

CREATE OR REPLACE FUNCTION test_primary () 
RETURNS TRIGGER AS
$body$ 
DECLARE
  nb integer;
BEGIN
  SELECT count(*) INTO nb FROM personnephysique WHERE personnephysique.idpersonnephysique = NEW.idpersonnephysique;
  IF nb != 0 THEN
    RAISE EXCEPTION 'Insertion impossible';
  END IF;
  RETURN NEW;
END;
$body$ 
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION test_primary_up () 
RETURNS TRIGGER AS
$body$ 
DECLARE
  nb integer;
BEGIN
  IF NEW.idpersonnephysique = OLD.idpersonnephysique THEN
    RETURN NEW; 
  END IF;
  SELECT count(*) INTO nb FROM personnephysique WHERE personnephysique.idpersonnephysique = NEW.idpersonnephysique;
  IF nb != 0 THEN
    RAISE EXCEPTION 'Insertion impossible';
  END IF;
  RETURN NEW;
END;
$body$ 
LANGUAGE plpgsql;

CREATE TRIGGER cp_hab 
BEFORE INSERT ON habitant
FOR EACH ROW EXECUTE PROCEDURE test_primary() ;

CREATE TRIGGER cp_abo 
BEFORE INSERT ON abonne
FOR EACH ROW EXECUTE PROCEDURE test_primary() ;

CREATE TRIGGER cp_hab_up
BEFORE UPDATE ON habitant
FOR EACH ROW EXECUTE PROCEDURE test_primary_up() ;

CREATE TRIGGER cp_abo_up
BEFORE UPDATE ON abonne
FOR EACH ROW EXECUTE PROCEDURE test_primary_up() ;

CREATE TRIGGER cp_pers 
BEFORE INSERT ON personnephysique
FOR EACH ROW EXECUTE PROCEDURE test_primary() ;

CREATE TRIGGER cp_pers_up
BEFORE UPDATE ON personnephysique
FOR EACH ROW EXECUTE PROCEDURE test_primary_up() ;

-- trigger res => habitant, Abonnement => abo, emprunt => abonne

-- residence

CREATE OR REPLACE FUNCTION test_foreign_residence_insert () 
RETURNS TRIGGER AS
$body$ 
DECLARE
  nb integer;
BEGIN
  SELECT count(*) INTO nb FROM habitant WHERE habitant.idpersonnephysique = NEW.idpersonnephysique;
  IF nb = 0 THEN
    RAISE EXCEPTION 'Insertion impossible';
  END IF;
  RETURN NEW;
END;
$body$ 
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION test_foreign_residence_delete () 
RETURNS TRIGGER AS
$body$ 
DECLARE
  nb integer;
BEGIN
  SELECT count(*) INTO nb FROM residence WHERE residence.idpersonnephysique = OLD.idpersonnephysique;
  IF nb != 0 THEN
    RAISE EXCEPTION 'Suppression impossible';
  END IF;
  RETURN OLD;
END;
$body$ 
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION test_foreign_residence_up () 
RETURNS TRIGGER AS
$body$ 
DECLARE
  nb integer;
BEGIN
  IF NEW.idpersonnephysique = OLD.idpersonnephysique THEN
    RETURN NEW; 
  END IF;
  
  SELECT count(*) INTO nb FROM residence WHERE residence.idpersonnephysique = OLD.idpersonnephysique;
  IF nb != 0 THEN
    RAISE EXCEPTION 'Suppression impossible';
  END IF;
  RETURN OLD;
END;
$body$ 
LANGUAGE plpgsql;

CREATE TRIGGER ce_res_hab 
BEFORE INSERT OR UPDATE ON residence
FOR EACH ROW EXECUTE PROCEDURE test_foreign_residence_insert () ;

CREATE TRIGGER ce_res_hab_del
BEFORE DELETE ON habitant
FOR EACH ROW EXECUTE PROCEDURE test_foreign_residence_delete () ;

CREATE TRIGGER ce_res_hab_up
BEFORE UPDATE ON habitant
FOR EACH ROW EXECUTE PROCEDURE test_foreign_residence_up () ;

-- abbonnement

CREATE OR REPLACE FUNCTION test_foreign_abonnement_insert () 
RETURNS TRIGGER AS
$body$ 
DECLARE
  nb integer;
BEGIN
  SELECT count(*) INTO nb FROM abonne WHERE abonne.idpersonnephysique = NEW.idpersonnephysique;
  IF nb = 0 THEN
    RAISE EXCEPTION 'Insertion impossible';
  END IF;
  RETURN NEW;
END;
$body$ 
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION test_foreign_abonnement_delete () 
RETURNS TRIGGER AS
$body$ 
DECLARE
  nb integer;
BEGIN
  SELECT count(*) INTO nb FROM abonnement WHERE abonnement.idpersonnephysique = OLD.idpersonnephysique;
  IF nb != 0 THEN
    RAISE EXCEPTION 'Suppression impossible';
  END IF;
  RETURN OLD;
END;
$body$ 
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION test_foreign_abonnement_up () 
RETURNS TRIGGER AS
$body$ 
DECLARE
  nb integer;
BEGIN
  IF NEW.idpersonnephysique = OLD.idpersonnephysique THEN
    RETURN NEW; 
  END IF;
  
  SELECT count(*) INTO nb FROM abonnement WHERE abonnement.idpersonnephysique = OLD.idpersonnephysique;
  IF nb != 0 THEN
    RAISE EXCEPTION 'Suppression impossible';
  END IF;
  RETURN OLD;
END;
$body$ 
LANGUAGE plpgsql;

CREATE TRIGGER ce_res_abo 
BEFORE INSERT OR UPDATE ON abonnement
FOR EACH ROW EXECUTE PROCEDURE test_foreign_abonnement_insert () ;

CREATE TRIGGER ce_res_abo_del
BEFORE DELETE ON abonne
FOR EACH ROW EXECUTE PROCEDURE test_foreign_abonnement_delete () ;

CREATE TRIGGER ce_res_abo_up
BEFORE UPDATE ON abonne
FOR EACH ROW EXECUTE PROCEDURE test_foreign_abonnement_up () ;

----------------------------------------------------------------------------------------------

--remplissage de Personne physique, habitant, abonne, ville, (Residence), Bibliotheque, (abonnement)

--personne
insert into personnephysique values (0,'LORCA', 'BERNARD', 15);
insert into personnephysique values (1,'CLANET', 'LUCIEN', 40);

--habitant
insert into habitant values (2,'NABILA', 'ZOE', 78);
insert into habitant values (3,'HUGO', 'EMILE', 53);

--ville
insert into ville values (0,'MONTPELLIER');
insert into ville values (1,'BEZIER');

--residence
insert into residence values (0, 2);
insert into residence values (1, 3);

-- biblio
insert into bibliotheque values(0,'EMILE ZOLA');
insert into bibliotheque values(1,'VICTOR HUGO');

-- tmp abo => abonne + residence + ville + abonnement (DUPONT / !DUPONT)Do
do
$body$ 
DECLARE
  abo record;
  ma bigint;
  cmpt bigint;
BEGIN
  cmpt = 1;
  
  select max(idpersonnephysique) into ma from personnephysique;
  
  FOR abo in (select * from tmp.abonne) LOOP
  
    insert into abonne values (ma + cmpt, abo.nom, abo.prenom, abo.age, abo.num_ab, abo.reduc );
	
	IF abo.ville = 'MONTPELLIER' THEN
      insert into residence values (0, ma + cmpt);
	ELSE
      insert into residence values (1, ma + cmpt);
	END IF;
	
	IF abo.nom = 'DUPONT' THEN
      insert into abonnement values (0, ma + cmpt, abo.tarif);
	ELSE
      insert into abonnement values (1, ma + cmpt, abo.tarif);
	END IF;
	
	cmpt = cmpt + 1;
  END LOOP;
END;
$body$ ;




