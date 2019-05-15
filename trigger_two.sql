
drop trigger if exists abstract_personne on personne;
 
CREATE OR REPLACE FUNCTION refuse () 
RETURNS TRIGGER AS
$body$ 
BEGIN
RAISE EXCEPTION 'Insertion impossible, % est une classe abstraite',TG_TABLE_NAME;
END;
$body$ 
LANGUAGE plpgsql;
 
CREATE OR REPLACE FUNCTION test_foreign_key () 
RETURNS TRIGGER AS
$body$ 
BEGIN
  RAISE EXCEPTION 'Insertion impossible, % est une classe abstraite',TG_TABLE_NAME;
END;
$body$ 
LANGUAGE plpgsql;

--trigger personne abstrait 
CREATE TRIGGER abstract_personne 
BEFORE INSERT ON personne
FOR EACH ROW EXECUTE PROCEDURE refuse();

--trigger prof id
 
--trigger prof fk etablissement
 
--trigger prof fk ville
 
--trigger eleve id
 
 --trigger eleve fk etablissement
 
 --trigger eleve fk ville
 
 --trigger exercice fk prof
 
 --trigger devoir fk prof
 
 --trigger passage fk eleve