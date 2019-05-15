
drop table if exists tmp.passage;
drop table if exists tmp.contenu;
drop table if exists tmp.devoir;
drop table if exists tmp.exercice;
drop table if exists tmp.eleve;
drop table if exists tmp.niveau;
drop table if exists tmp.prof;
drop table if exists tmp.etablissement;
drop table if exists tmp.ville;

create table tmp.VILLE (	IDVILLE integer,
						NOM varchar(30) not null,
					    constraint cp_ville Primary Key (IDVILLE));

create table tmp.ETABLISSEMENT(		IDETABLISSEMENT integer,
								RNE varchar(8),
								NOM varchar(50) not null,
								IDVILLE integer,
								constraint cp_etab Primary Key (IDETABLISSEMENT),
						  		constraint ce_etab_ville Foreign Key (IDVILLE) REFERENCES tmp.VILLE(IDVILLE)  );

create table tmp.PROF(				IDPROF integer,
								NOM varchar(20) not null,
								ANNEE_NAISSANCE integer,
								IDETABLISSEMENT integer,
								IDVILLE integer,
								constraint cp_prof Primary Key (IDPROF),
								constraint ce_prof_etab FOREIGN KEY (IDETABLISSEMENT) REFERENCES tmp.ETABLISSEMENT(IDETABLISSEMENT),
						  		constraint ce_prof_ville Foreign Key (IDVILLE) REFERENCES tmp.VILLE(IDVILLE)  );

create table tmp.NIVEAU(			IDNIVEAU integer,
								NIVEAU varchar(4),
								constraint cp_niveau Primary Key (IDNIVEAU),
								constraint chk_niveau check (NIVEAU in ('6eme','5eme','4eme','3eme'))  );

create table tmp.ELEVE(				IDELEVE integer,
								NOM varchar(50) not null,
								PRENOM varchar(30),
								IDETABLISSEMENT integer,
								IDNIVEAU integer,
								constraint cp_eleve Primary Key (IDELEVE),
								constraint ce_eleve_etab FOREIGN KEY (IDETABLISSEMENT) REFERENCES tmp.ETABLISSEMENT(IDETABLISSEMENT),
								constraint ce_eleve_niveau FOREIGN KEY (IDNIVEAU) REFERENCES tmp.NIVEAU(IDNIVEAU)  );

create table tmp.EXERCICE(			IDEXERCICE integer,
								CONTENU varchar(250),
								IDNIVEAU integer,
								IDPROF integer,
								DATECREATION date,
								constraint cp_exercice primary key (IDEXERCICE),
								constraint ce_exercice_niveau FOREIGN KEY (IDNIVEAU) REFERENCES tmp.NIVEAU(IDNIVEAU),
								constraint ce_exercice_prof FOREIGN KEY (IDPROF) REFERENCES tmp.PROF(IDPROF)  );

create table tmp.DEVOIR(			IDDEVOIR integer,
								DATECREATION date,
								IDPROF integer not null,
								IDNIVEAU integer,
								constraint cp_devoir primary key (IDDEVOIR),
								constraint ce_devoir_prof FOREIGN KEY (IDPROF) REFERENCES tmp.PROF(IDPROF),
								constraint ce_devoir_niveau FOREIGN KEY (IDNIVEAU) REFERENCES tmp.NIVEAU(IDNIVEAU)  );

create table tmp.CONTENU(			IDDEVOIR integer,
								IDEXERCICE integer,
								BAREME real,
								constraint cp_contenu primary key (IDDEVOIR,IDEXERCICE),
								constraint ce_contenu_devoir FOREIGN KEY (IDDEVOIR) REFERENCES tmp.DEVOIR(IDDEVOIR),
								constraint ce_contenu_exercice FOREIGN KEY (IDEXERCICE) REFERENCES tmp.EXERCICE(IDEXERCICE)  );

create table tmp.PASSAGE(			IDDEVOIR integer,
								IDELEVE integer,
								DATEPASSAGE date,
								NOTE integer,
								constraint cp_passage primary key (IDDEVOIR,IDELEVE,DATEPASSAGE),
								constraint ce_passage_devoir FOREIGN KEY (IDDEVOIR) REFERENCES tmp.DEVOIR(IDDEVOIR),
								constraint ce_passage_eleve FOREIGN KEY (IDELEVE) REFERENCES tmp.ELEVE(IDELEVE)  );

 