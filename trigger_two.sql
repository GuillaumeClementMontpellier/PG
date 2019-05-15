drop trigger if exists abstract_personne on personne;
drop trigger if exists fk_prof_etab on prof;
drop trigger if exists fk_prof_ville on prof;
drop trigger if exists pk_prof_pers on prof;
drop trigger if exists fk_prof_delete on prof;
drop trigger if exists fk_eleve_etab on eleve;
drop trigger if exists fk_eleve_ville on eleve;
drop trigger if exists pk_eleve_pers on eleve;
drop trigger if exists fk_eleve_delete on eleve;
drop trigger if exists fk_exercice_prof on exercice;
drop trigger if exists fk_devoir_prof on devoir;
drop trigger if exists fk_passage_eleve on passage;
drop trigger if exists fk_ville_delete on ville;
drop trigger if exists fk_etablissement_delete on etablissement;

--fonctions de trigger 

----------------------------------------------------------------------
CREATE OR REPLACE FUNCTION refuse () 
RETURNS TRIGGER AS
$body$ 
BEGIN
  RAISE EXCEPTION 'Insertion impossible, % est une classe abstraite',TG_TABLE_NAME;
END;
$body$ 
LANGUAGE plpgsql;

---------------------------------------------------------------------
 
CREATE OR REPLACE FUNCTION test_foreign_key_etab () 
RETURNS TRIGGER AS
$body$ 
DECLARE
  nb bigint;
BEGIN
  SELECT count(*) INTO nb FROM etablissement WHERE etablissement.idetablissement = NEW.idetablissement;
  IF nb = 0 THEN
    RAISE EXCEPTION 'Insertion impossible';
  END IF;
  RETURN NEW;
END;
$body$ 
LANGUAGE plpgsql;

-----------------------------------------------------------------------

CREATE OR REPLACE FUNCTION test_foreign_key_ville () 
RETURNS TRIGGER AS
$body$ 
DECLARE
  nb bigint;
BEGIN
  SELECT count(*) INTO nb FROM ville WHERE ville.idville = NEW.idville;
  IF nb = 0 THEN
    RAISE EXCEPTION 'Insertion impossible';
  END IF;
  RETURN NEW;
END;
$body$ 
LANGUAGE plpgsql;
---------------------------------------------------------------------
CREATE OR REPLACE FUNCTION test_primary_key_personne () 
RETURNS TRIGGER AS
$body$ 
DECLARE
  nb bigint;
BEGIN
  SELECT count(*) INTO nb FROM personne WHERE personne.idpersonne = NEW.idpersonne;
  IF nb != 0 THEN
    RAISE EXCEPTION 'Insertion impossible';
  END IF;
  RETURN NEW;
END;
$body$ 
LANGUAGE plpgsql;
------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION test_foreign_key_prof () 
RETURNS TRIGGER AS
$body$ 
DECLARE
  nb bigint;
BEGIN
  SELECT count(*) INTO nb FROM prof WHERE prof.idpersonne = NEW.idprof;
  IF nb = 0 THEN
    RAISE EXCEPTION 'Insertion impossible';
  END IF;
  RETURN NEW;
END;
$body$ 
LANGUAGE plpgsql;
----------------------------------------------------------------------
CREATE OR REPLACE FUNCTION test_foreign_key_eleve () 
RETURNS TRIGGER AS
$body$ 
DECLARE
  nb bigint;
BEGIN
  SELECT count(*) INTO nb FROM eleve WHERE eleve.idpersonne = NEW.ideleve;
  IF nb = 0 THEN
    RAISE EXCEPTION 'Insertion impossible';
  END IF;
  RETURN NEW;
END;
$body$ 
LANGUAGE plpgsql;
---------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION test_foreign_key_delete_prof () 
RETURNS TRIGGER AS
$body$ 
DECLARE
  nb bigint;
BEGIN
  SELECT count(*) INTO nb FROM devoir WHERE devoir.idprof = OLD.idpersonne;
  IF nb != 0 THEN
    RAISE EXCEPTION 'Insertion impossible';
  END IF;
  SELECT count(*) INTO nb FROM exercice WHERE exercice.idprof = OLD.idpersonne;
  IF nb != 0 THEN
    RAISE EXCEPTION 'Insertion impossible';
  END IF;
  RETURN OLD;
END;
$body$ 
LANGUAGE plpgsql;
-----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION test_foreign_key_delete_eleve () 
RETURNS TRIGGER AS
$body$ 
DECLARE
  nb bigint;
BEGIN
  SELECT count(*) INTO nb FROM passage WHERE passage.ideleve = OLD.idpersonne;
  IF nb != 0 THEN
    RAISE EXCEPTION 'Insertion impossible';
  END IF;
  RETURN OLD;
END;
$body$ 
LANGUAGE plpgsql;
---------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION test_foreign_key_delete_ville () 
RETURNS TRIGGER AS
$body$ 
DECLARE
  nb bigint;
BEGIN
  SELECT count(*) INTO nb FROM personne WHERE personne.idville = OLD.idville;
  IF nb != 0 THEN
    RAISE EXCEPTION 'Insertion impossible';
  END IF;
  RETURN OLD;
END;
$body$ 
LANGUAGE plpgsql;
-----------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION test_foreign_key_delete_etablissement () 
RETURNS TRIGGER AS
$body$ 
DECLARE
  nb bigint;
BEGIN
  SELECT count(*) INTO nb FROM personne WHERE personne.idetablissement = OLD.idetablissement;
  IF nb != 0 THEN
    RAISE EXCEPTION 'Insertion impossible';
  END IF;
  RETURN OLD;
END;
$body$ 
LANGUAGE plpgsql;
-----------------------------------------------------------------------------------


--trigger personne abstrait 
CREATE TRIGGER abstract_personne 
BEFORE INSERT OR UPDATE OR DELETE ON personne
FOR EACH ROW EXECUTE PROCEDURE refuse();

--trigger delete ville
CREATE TRIGGER fk_ville_delete
BEFORE DELETE ON ville
FOR EACH ROW EXECUTE PROCEDURE test_foreign_key_delete_ville();

--trigger delete etablissement
CREATE TRIGGER fk_etablissement_delete
BEFORE DELETE ON etablissement
FOR EACH ROW EXECUTE PROCEDURE test_foreign_key_delete_etablissement();

--trigger prof id
CREATE TRIGGER pk_prof_pers
BEFORE INSERT OR UPDATE ON prof
FOR EACH ROW EXECUTE PROCEDURE test_primary_key_personne();
 
--trigger prof fk etablissement
CREATE TRIGGER fk_prof_etab
BEFORE INSERT OR UPDATE ON prof
FOR EACH ROW EXECUTE PROCEDURE test_foreign_key_etab();
 
--trigger prof fk ville
CREATE TRIGGER fk_prof_ville
BEFORE INSERT OR UPDATE ON prof
FOR EACH ROW EXECUTE PROCEDURE test_foreign_key_ville();

--trigger delete on prof
CREATE TRIGGER fk_prof_delete
BEFORE DELETE ON prof
FOR EACH ROW EXECUTE PROCEDURE test_foreign_key_delete_prof();
 
--trigger eleve id
CREATE TRIGGER pk_eleve_pers
BEFORE INSERT OR UPDATE ON eleve
FOR EACH ROW EXECUTE PROCEDURE test_primary_key_personne();
 
 --trigger eleve fk etablissement
CREATE TRIGGER fk_eleve_etab
BEFORE INSERT OR UPDATE ON eleve
FOR EACH ROW EXECUTE PROCEDURE test_foreign_key_etab();
 
 --trigger eleve fk ville
CREATE TRIGGER fk_eleve_ville
BEFORE INSERT OR UPDATE ON eleve
FOR EACH ROW EXECUTE PROCEDURE test_foreign_key_ville();

--trigger delete eleve
CREATE TRIGGER fk_eleve_delete
BEFORE DELETE ON eleve
FOR EACH ROW EXECUTE PROCEDURE test_foreign_key_delete_eleve();
 
 --trigger exercice fk prof 
CREATE TRIGGER fk_exercice_prof
BEFORE INSERT OR UPDATE ON exercice
FOR EACH ROW EXECUTE PROCEDURE test_foreign_key_prof ();
 
 --trigger devoir fk prof
CREATE TRIGGER fk_devoir_prof
BEFORE INSERT OR UPDATE ON devoir
FOR EACH ROW EXECUTE PROCEDURE test_foreign_key_prof ();
 
 --trigger passage fk eleve
CREATE TRIGGER fk_passage_eleve
BEFORE INSERT OR UPDATE ON passage
FOR EACH ROW EXECUTE PROCEDURE test_foreign_key_eleve ();
 
 