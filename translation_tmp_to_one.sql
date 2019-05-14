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
insert into ville SELECT row_number() over(), ville FROM (SELECT DISTINCT ville FROM (SELECT ville as ville FROM tmp.PROF
									                                                    UNION SELECT localite as ville FROM tmp.etablissement
																					 )as unionVilles
														 ) as distinctUnionVilles ;
														 
--rempli etablissement														 
insert into etablissement SELECT row_number() over(), RNE, etablissement.nom, ville.idville from tmp.etablissement, ville 
where ville.nom = tmp.etablissement.localite;

--rempli prof
insert into prof select idp, tmp.prof.nom, annee_naissance, etablissement.idetablissement, ville.idville from tmp.prof, etablissement, ville 
where tmp.prof.rne = etablissement.rne AND tmp.prof.ville = ville.nom;

--rempli niveau
insert into niveau select row_number() over(),niveau from tmp.niveau;

--rempli eleve
insert into eleve select idel, tmp.eleve.nom, prenom, etablissement.idetablissement, niveau.idniveau from tmp.eleve, etablissement, niveau
where college = etablissement.rne and tmp.eleve.niveau = niveau.niveau;

--rempli exercice
insert into exercice select idex, contenu, niveau.idniveau, proprietaire, date_creation from tmp.exercice, niveau
where tmp.exercice.niveau = niveau.niveau;

--rempli devoir
insert into devoir select idd, date_creation, prof_createur, niveau.idniveau from tmp.devoir, niveau
where tmp.devoir.niveau = niveau.niveau;

--rempli notion, pas notion dans pas tmp

--rempli contenu
insert into contenu select idd, idex, bareme from tmp.contenu;

--rempli passage
insert into passage select idd, idel, date_passage, note from tmp.passage;
