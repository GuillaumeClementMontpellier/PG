
drop table if exists passage;
drop table if exists contenu;
drop table if exists devoir;
drop table if exists exercice;
drop table if exists eleve;
drop table if exists niveau;
drop table if exists prof;
drop table if exists personne;
drop table if exists etablissement;
drop table if exists ville;

create table VILLE (			IDVILLE integer,
								NOM varchar(30) not null,
					 			constraint cp_ville Primary Key (IDVILLE));

create table ETABLISSEMENT(		IDETABLISSEMENT integer,
								RNE varchar(8),
								NOM varchar(50) not null,
								IDVILLE integer,
								constraint cp_etab Primary Key (IDETABLISSEMENT),
						  		constraint ce_etab_ville Foreign Key (IDVILLE) REFERENCES VILLE(IDVILLE)  );
								
create table PERSONNE(			IDPERSONNE integer,
								NOM varchar(20) not null,
								PRENOM varchar(20),
								ANNEE_NAISSANCE integer,
								IDETABLISSEMENT integer,
								IDVILLE integer  );	--trigger pour dire abstrait (on peut pas les créer)						

create table PROF(				ANNEE_TITULARISATION integer   ) INHERITS(PERSONNE); --trigger pour id, et fk etablissement et ville

create table NIVEAU(			IDNIVEAU integer,
								NIVEAU varchar(4),
								constraint cp_niveau Primary Key (IDNIVEAU),
								constraint chk_niveau check (NIVEAU in ('6eme','5eme','4eme','3eme'))  );

create table ELEVE(				IDNIVEAU integer,
				  				constraint ce_eleve_niveau FOREIGN KEY (IDNIVEAU) REFERENCES NIVEAU(IDNIVEAU)   ) INHERITS(PERSONNE); --trigger pour id, et fk etablissement et ville

create table EXERCICE(			IDEXERCICE integer,
								CONTENU varchar(250),
								IDNIVEAU integer,
								IDPROF integer,
								DATECREATION date,
								constraint cp_exercice primary key (IDEXERCICE),
								constraint ce_exercice_niveau FOREIGN KEY (IDNIVEAU) REFERENCES NIVEAU(IDNIVEAU)  ); --trigger pour fk prof createur

create table DEVOIR(			IDDEVOIR integer,
								DATECREATION date,
								IDPROF integer not null,
								IDNIVEAU integer,
								constraint cp_devoir primary key (IDDEVOIR),
								constraint ce_devoir_niveau FOREIGN KEY (IDNIVEAU) REFERENCES NIVEAU(IDNIVEAU)  ); --trigger pour fk prof createur

create table CONTENU(			IDDEVOIR integer,
								IDEXERCICE integer,
								BAREME real,
								constraint cp_contenu primary key (IDDEVOIR,IDEXERCICE),
								constraint ce_contenu_devoir FOREIGN KEY (IDDEVOIR) REFERENCES DEVOIR(IDDEVOIR),
								constraint ce_contenu_exercice FOREIGN KEY (IDEXERCICE) REFERENCES EXERCICE(IDEXERCICE)  );

create table PASSAGE(			IDDEVOIR integer,
								IDELEVE integer,
								DATEPASSAGE date,
								NOTE integer,
								constraint cp_passage primary key (IDDEVOIR,IDELEVE,DATEPASSAGE),
								constraint ce_passage_devoir FOREIGN KEY (IDDEVOIR) REFERENCES DEVOIR(IDDEVOIR)  ); --trigger pour fk eleve

 