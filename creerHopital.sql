-------------------------------------------------------
-- BASLEY 	Max-Malo 	C1
-- COFFARD 	Alexis 		C1
-- LARBI 	Timothé 	C2
-------------------------------------------------------
-- script creerHopital.sql
-- connexion a postgresql:    	psql 
-- execution du script:		=>\i creerHopital.sql
-- verif:			=>\dt
-------------------------------------------------------

-- suppression des tables si elles existent déjà

drop table if exists HOPITAL 		cascade ;
drop table if exists LABORATOIRE 	cascade ;
drop table if exists SERVICE 		cascade ;
drop table if exists MEDECIN 		cascade ;
drop table if exists PATIENT 		cascade ;
drop table if exists CONSULTE 		cascade ;


-- création des tables

create table HOPITAL (
	idHop   	int				not null ,
	nom_hop 	varchar(50) 	not null ,
	adresse_hop	varchar(50)		not null ,
	tel_hop     varchar(10) not null ,
								
	constraint PK_HOPITAL 		primary key ( idHop )
								
) ;

create table LABORATOIRE ( 
	idLab		int 		not null ,
	nom_lab		varchar(50) not null ,
	idHop		int 		not null ,
								
	constraint PK_LABORATOIRE 	primary key ( idLab ) ,
								
	constraint FK_LABORATOIRE	foreign key (idHop ) references HOPITAL (idHop) 
								
) ;

create table SERVICE (
	idServ		int			not null ,
	nom_serv	varchar(50) not null ,
	nb_lits		int 		not null ,
	idHop       	int  	not null ,
								
	constraint PK_SERVICE		primary key ( idServ ) ,
								
	constraint FK_SERVICE		foreign key (idHop ) references HOPITAL (idHop) ,
								
	constraint CK_SERVICE		check 		(nb_lits > 0) 
								
) ;

create table MEDECIN ( 
	idMed 		int 		not null ,
	nom_med 	varchar(50) not null ,
	mail_med	varchar(50)	not null ,
	spec		varchar(50) not null ,
	fct		varchar(50) 	not null ,
	idLab		int		 	 		 ,
	idServ		int			 		 ,
	idHop		int			not null ,
								
	constraint PK_MEDECIN 		primary key ( idMed ) ,
								
	constraint FK_MEDECIN_HOP	foreign key (idHop ) references HOPITAL (idHop) ,
	constraint FK_MEDECIN_SERV	foreign key (idServ) references SERVICE (idServ),
	constraint FK_MEDECIN_LAB	foreign key (idLab ) references LABORATOIRE (idLab),
								
	constraint UNQ_MEDECIN		unique		(mail_med) ,
								
	constraint CK_MEDECIN      	check		(fct IN ('CONSULTANT', 'CHERCHEUR', 'PRATICIEN'))
								
) ;

create table PATIENT (
	idPat		int			not null ,
	nom_pat		varchar(50) not null ,
	prenom_pat	varchar(50) not null ,
	adresse_pat	varchar(50)	not null ,
	date_nais	date 		not null ,
								
	constraint PK_PATIENT		primary key ( idPat )
								
) ;

create table CONSULTE	(
	idPat		int 			not null ,
	idMed		int				not null ,
	date_consult 	timestamp	not null ,
								
	constraint PK_CONSULTE 		primary key ( idPat , idMed , date_consult ) ,
								
	constraint FK_CONSULTE_PAT 	foreign key ( idPat) references PATIENT (idPat) ,
	constraint FK_CONSULTE_MED	foreign key ( idMed) references MEDECIN (idMed) 							
								
) ;
