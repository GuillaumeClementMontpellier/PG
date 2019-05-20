delete from passage;
delete from contenu;
delete from devoir;
delete from exercice;
delete from eleve;
delete from niveau;
delete from prof;
delete from personne;
delete from etablissement;
delete from ville;

--rempli ville
insert into ville select * from tmp.ville;	
												 
--rempli etablissement
insert into etablissement select * from tmp.etablissement;

--rempli niveau
insert into niveau select * from tmp.niveau;

--rempli personne / prof : faire fonctions anonymes
Do
$body$ 
DECLARE
  pe record;
BEGIN
  FOR pe in (select * from tmp.prof) LOOP
    insert into personne values (pe.idprof, pe.nom, null, pe.annee_naissance, pe.idetablissement, pe.idville);
    insert into prof values (pe.idprof, null);
  END LOOP;
END;
$body$ ;

--rempli devoir
insert into devoir select * from tmp.devoir;

--rempli personne / eleve / passage
Do
$body$ 
DECLARE
  pe record;
  ma bigint;
BEGIN
  select max(idpersonne) into ma from personne;
  FOR pe in (select * from tmp.eleve) LOOP
    insert into personne values (pe.ideleve + ma, pe.nom, pe.prenom, null, pe.idetablissement, null);
    insert into eleve values (pe.ideleve + ma, pe.idniveau);
	insert into passage (select iddevoir, pa.ideleve + ma, datepassage, note from tmp.passage pa where pa.ideleve=pe.ideleve);
  END LOOP;
END;
$body$ ;

--rempli exercice
insert into exercice select * from tmp.exercice;

--rempli contenu
insert into contenu select * from tmp.contenu;