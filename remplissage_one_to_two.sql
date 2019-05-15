delete from passage;
delete from contenu;
delete from devoir;
delete from exercice;
delete from eleve;
delete from niveau;
delete from prof;
delete from etablissement;
delete from ville;

--rempli ville
insert into ville select * from tmp.ville;

														 
--rempli etablissement
insert into etablissement select * from tmp.etablissement;

--rempli prof
insert into prof select idprof, nom, 'Joe', annee_naissance, idetablissement, idville, 2000 from tmp.prof;

--rempli niveau
insert into niveau select * from tmp.niveau;

--rempli eleve
insert into eleve select ideleve + 10, nom, prenom, 2000, idetablissement, idniveau from tmp.eleve;

--rempli exercice
insert into exercice select * from tmp.exercice;

--rempli devoir
insert into devoir select * from tmp.devoir;

--rempli notion, pas notion dans pas tmp

--rempli contenu
insert into contenu select * from contenu;

--rempli passage
insert into passage select iddevoir, ideleve + 10, datepassage, note from tmp.passage;

