-------------------------------------------------------
-- BASLEY 	Max-Malo 	C1
-- COFFARD 	Alexis 		C1
-- LARBI 	Timothé 	C2
-------------------------------------------------------
-- script initHopital.sql
-- connexion a postgresql:    	psql 
-- execution du script:		=>\i initHopital.sql
-- verif:			=>\dt
-------------------------------------------------------

-- insertion des données dans les tables

insert into HOPITAL (idHop, nom_hop, adresse_hop, tel_hop) values 
  (1, 'Flaubert'		      , '55 Bis Rue Gustave Flaubert 76600'	  , '0232733232'),
  (2, 'Pierre Janet'		  , '47 Rue de Tourneville 76600'		      , '0232733920'),
  (3, 'Raoul Dufy'		    , '4 Rue Lanfant de Metz 76600'		      , '0232733950'),
  (4, 'Jacques Monod'		  , '29 Avenue Pierre Mendès France 76290', '0232733232'),
  (5, 'HPE- Ramsay santé'	, '505 Rue Irène Joliot Curie 76600'	  , '0252680202');

insert into LABORATOIRE (idLab, nom_lab, idHop) values 
  (1 , 'Biochimie'		        , 1),
  (2 , 'Microbiologie'		    , 1),
  (3 , 'Hématologie'		      , 1),
  (4 , 'Auto-immunité'		    , 1),
  (5 , 'Neurophysiologie'	    , 1),
/* Données ajoutés nous-même */
  (6 , 'Sérologie'		        , 1),
  (7 , 'Pharmacologie'		    , 1),
  
  (8 , 'Biologie'		          , 2),
  (9 , 'Pharmacotoxicologie'	, 2),
  (10, 'Neuropathologie'	    , 2),
  (11, 'Bactériologie'		    , 2),
/* Données ajoutés nous-même */
  (12, 'Toxicologie'		      , 2),
  (13, 'Virologie'		        , 2),
  
  (14, 'Bactériologie'		    , 3),
  (15, 'Hématologie'		      , 3),
  (16, 'Biologie'		          , 3),
  (17, 'Fertilité'		        , 3),
/* Données ajoutés nous-même */
  (18, 'Parasitologie'		    , 3),
  (19, 'Immunologie'		      , 3),

  (20, 'Biologie'		          , 4),
  (21, 'Bactériologie'		    , 4),
  (22, 'Hématologie'		      , 4),
  (23, 'Fertilité'		        , 4),
/* Données ajoutés nous-même */
  (24, 'Génétique'		        , 4),
  (25, 'Biologie molécule'	  , 4),
  
  (26, 'Biologie'		          , 5),
  (27, 'Bactériologie'		    , 5),
  (28, 'Fertilité'		        , 5),
  (29, 'Hématologie'		      , 5),
/* Données ajoutés nous-même */
  (30, 'Anatomopatologie'	    , 5);

insert into SERVICE (idServ, nom_serv, nb_lits, idHop) values 
  (1 , 'Ophtalmologie'		  , 50 , 1),
  (2 , 'Dermatologie'		    , 30 , 1),
  (3 , 'Pédiatrie'		      , 30 , 1),
/* Données ajoutés nous-même */
  (4 , 'Urgences'		        , 50 , 1),
  (5 , 'Réanimation'		    , 40 , 1),
  (6 , 'Radiologie'		      , 15 , 1), 
   
  (7 , 'Psychiatrie'		    , 50 , 2),
  (8 , 'Neurologie'		      , 25 , 2),
/* Données ajoutés nous-même */
  (9 , 'Addictologie'		    , 10 , 2),
  (10, 'Gériatrie'		      , 8  , 2),
  (11, 'Soins palliatifs'	  , 15 , 2),
  
  (12, 'Pédiatrie'		      , 30 , 3),
  (13, 'Stomatologie'		    , 20 , 3),
/* Données ajoutés nous-même */
  (14, 'Maternité'		      , 30 , 3),
  (15, 'ORL'			          , 5  , 3),
  (16, 'Médecine interne'	  , 8  , 3),
  
  (17, 'Cardiologie'		    , 120, 4),
  (18, 'Gynécologie'		    , 40 , 4),
  (19, 'Gastro-entérologie'	, 40 , 4),
  (20, 'Endocrinologie'		  , 35 , 4),
/* Données ajoutés nous-même */
  (21, 'Chirurgie générale'	, 20 , 4),
  (22, 'Orthopédie'		      , 10 , 4),
  (23, 'Urologie'		        , 5  , 4),
  
  (24, 'Cardiologie'		    , 80 , 5),
  (25, 'Pédiatrie'		      , 40 , 5),
  (26, 'Gastro-entérologie'	, 50 , 5),
  (27, 'Cancérologie'		    , 30 , 5),
/* Données ajoutés nous-même */  
  (28, 'Pneumologie'		    , 8  , 5),
  (29, 'Rhumatologie'		    , 5  , 5),
  (30, 'Néphrologie'		    , 5  , 5);

insert into MEDECIN (idMed, nom_med, mail_med, spec, fct, idLab, idServ, idHop) values 
  (1 , 'Sorrel'   	, 'sorrel@hop.fr'   , 'Pédiatre'       		      , 'PRATICIEN'	, null, 3   , 1),
  (2 , 'Amiot'		  , 'amiot@hop.fr'    , 'Dermatologue'		        , 'PRATICIEN'	, null, 2   , 1),
  (3 , 'Vincent'	  , 'vincent@hop.fr'  , 'Ophtalmologue'		        , 'PRATICIEN'	, null, 1   , 1),
/* Données ajoutés nous-même */ 
  (4 , 'Thomas'   	, 'thomas@hop.fr'   , 'Pharmacologue'           , 'CHERCHEUR' , 7   , null, 1),  
  (5 , 'Petit'    	, 'petit@hop.fr'    , 'Urgentiste'              , 'PRATICIEN' , null, 4   , 1),
  
  (6 , 'Renault'	  , 'renault@hop.fr'  , 'Psychiatre'     		      , 'PRATICIEN'	, null, 4   , 2),
  (7 , 'Leroy'		  , 'leroy@hop.fr'    , 'Psychiatre'     		      , 'CONSULTANT', null, null, 2),
  (8 , 'Perrot'		  , 'perrot@hop.fr'   , 'Neurologue'     		      , 'PRATICIEN'	, null, 5   , 2),
/* Données ajoutés nous-même */ 
  (9 , 'Martin'   	, 'martin@hop.fr'   , 'Virologue'               , 'CHERCHEUR' , 13  , null, 2),
  (10, 'Dubois'   	, 'dubois@hop.fr'   , 'Toxicologue'             , 'CHERCHEUR' , 12  , null, 2),
  (11, 'Moreau'   	, 'moreau@hop.fr'   , 'Gériatre'                , 'PRATICIEN' , null, 10  , 2),
  
  (12, 'Lévecque'	  , 'levecque@hop.fr' , 'Pédiatre'		            , 'PRATICIEN'	, null, 6   , 3),
  (13, 'Morrice'	  , 'morrice@hop.fr'  , 'Stomatologue' 		        , 'PRATICIEN'	, null, 7   , 3),
/* Données ajoutés nous-même */ 
  (14, 'Bernard'  	, 'bernard@hop.fr'  , 'Immunologiste'           , 'CHERCHEUR' , 19  , null, 3),
  
  (15, 'Robert'		  , 'robert@hop.fr'   , 'Bactériologiste'		      , 'CHERCHEUR'	, 15  , null, 4),
  (16, 'Vercoust'	  , 'vercoust@hop.fr' , 'Hématologiste'  		      , 'CHERCHEUR'	, 5   , null, 4),
  (17, 'Favier'		  , 'favier@hop.fr'   , 'Gynécologue'    		      , 'PRATICIEN'	, null, 9   , 4),
  (18, 'Firmin'		  , 'firmin@hop.fr'   , 'Gynécologue'    		      , 'CONSULTANT', null, null, 4),
  (19, 'Ferret'		  , 'ferret@hop.fr'   , 'Cardiologue'    		      , 'PRATICIEN'	, null, 8   , 4),
  (20, 'Aubin'		  , 'aubin@hop.fr'    , 'Gynécologue'		          , 'PRATICIEN'	, null, 9   , 4),
  (21, 'Mercier'	  , 'mercier@hop.fr'  , 'Gastro-entérologue'      , 'PRATICIEN'	, null, 10  , 4),
  (22, 'Pasquet'	  , 'pasquet@hop.fr'  , 'Endocrinologue'		      , 'PRATICIEN'	, null, 11  , 4),
/* Données ajoutés nous-même */
  (23, 'Dupont'   	, 'dupont@hop.fr'   , 'Généticien'            	, 'CHERCHEUR' , 24  , null, 4),
  (24, 'Richard'  	, 'richard@hop.fr'  , 'Biologiste moléculaire'	, 'CHERCHEUR' , 25  , null, 4),
  (25, 'Durand'   	, 'durand@hop.fr'   , 'Chirurgien'            	, 'PRATICIEN' , null, 21  , 4),
  	
  (26, 'Blanchard'	, 'blanchard@hop.fr', 'Cardiologue'    		      , 'PRATICIEN'	, null, 12  , 5),
  (27, 'Lalande'	  , 'lalande@hop.fr'  , 'Gastro-entérologue'    	, 'PRATICIEN'	, null, 14  , 5),
  (28, 'Perrin'		  , 'perrin@hop.fr'   , 'Gastro-entérologue'    	, 'PRATICIEN'	, null, 14  , 5),
/* Données ajoutés nous-même */ 
  (29, 'Simon'    	, 'simon@hop.fr'    , 'Pneumologue'           	, 'PRATICIEN' , null, 28  , 5),
  (30, 'Laurent'  	, 'laurent@hop.fr'  , 'Rhumatologue'          	, 'CONSULTANT', null, null, 5);


insert into PATIENT (idPat, nom_pat, prenom_pat, adresse_pat, date_nais) values 
  (1 , 'Dupont'       , 'Jean'    , 'Le Havre'           , '1980-05-12'),
  (2 , 'Martin'       , 'Claire'  , 'Rouen'              , '1995-10-20'),
  (3 , 'Durand'       , 'Marc'    , 'Sainte-Adresse'     , '1950-01-30'),
/* Données ajoutés nous-même */ 
  (4 , 'Lecarpentier' , 'Alice'   , 'Caen'               , '1992-03-14'),
  (5 , 'Leblond'      , 'Hugo'    , 'Dieppe'             , '1985-07-22'),
  (6 , 'Lemaire'      , 'Chloé'   , 'Fécamp'             , '2001-11-05'),
  (7 , 'Deschamps'    , 'Gabin'   , 'Honfleur'           , '1974-09-18'),
  (8 , 'Baudry'       , 'Emma'    , 'Évreux'             , '1963-12-01'),
  (9 , 'Lemarchand'   , 'Arthur'  , 'Cherbourg'          , '2010-02-28'),
  (10, 'Maupas'       , 'Juliette', 'Lisieux'            , '1998-08-15'),
  (11, 'Gosselin'     , 'Louis'   , 'Bayeux'             , '1955-04-04'),
  (12, 'Lefevre'      , 'Camille' , 'Deauville'          , '1989-06-25'),
  (13, 'Letellier'    , 'Raphaël' , 'Trouville-sur-Mer'  , '1977-10-10'),
  (14, 'Mallet'       , 'Sarah'   , 'Bolbec'             , '2005-01-19'),
  (15, 'Hebert'       , 'Maël'    , 'Yvetot'             , '1994-05-30'),
  (16, 'Roussel'      , 'Manon'   , 'Barentin'           , '1981-11-12'),
  (17, 'Vallee'       , 'Jules'   , 'Montivilliers'      , '2012-07-08'),
  (18, 'Blondel'      , 'Margaux' , 'Harfleur'           , '1968-03-22'),
  (19, 'Carpentier'   , 'Lucas'   , 'Pont-Audemer'       , '1990-09-05'),
  (20, 'Delacroix'    , 'Romane'  , 'Bernay'             , '1983-12-14'),
  (21, 'Fournier'     , 'Ethan'   , 'Vernon'             , '2008-04-17'),
  (22, 'Gauthier'     , 'Léa'     , 'Le Havre'           , '1971-02-09'),
  (23, 'Huet'         , 'Mathis'  , 'Rouen'              , '1996-08-03'),
  (24, 'Joly'         , 'Anaïs'   , 'Sainte-Adresse'     , '1959-11-27'),
  (25, 'Lambert'      , 'Tom'     , 'Fécamp'             , '2015-06-11'),
  (26, 'Masson'       , 'Clara'   , 'Caen'               , '1987-01-20'),
  (27, 'Morel'        , 'Noah'    , 'Dieppe'             , '1979-10-29'),
  (28, 'Poret'        , 'Mila'    , 'Évreux'             , '2003-05-06'),
  (29, 'Vasseur'      , 'Paul'    , 'Cherbourg'          , '1965-08-14'),
  (30, 'Tessier'      , 'Lina'    , 'Lisieux'            , '1991-12-31');

insert into CONSULTE (idPat, idMed, date_consult) values 
  (1 , 7 , '2023-10-01 10:00:00'),
  (2 , 5 , '2023-10-02 14:30:00'),
  (1 , 6 , '2023-11-05 09:00:00'),
/* Données ajoutés nous-mêmes */
  (4 , 1 , '2023-01-15 09:30:00'),  
  (4 , 2 , '2023-02-20 14:00:00'), 
  (5 , 8 , '2023-03-10 11:15:00'), 
  (6 , 18, '2023-04-05 10:00:00'), 
  (6 , 18, '2023-05-12 10:30:00'), 
  (7 , 5 , '2023-06-18 22:45:00'), 
  (8 , 11, '2023-07-22 09:00:00'), 
  (9 , 12, '2023-08-30 15:30:00'), 
  (10, 30, '2023-09-14 14:45:00'), 
  (11, 19, '2023-10-02 08:30:00'), 
  (11, 25, '2023-10-15 11:00:00'), 
  (12, 17, '2023-11-21 16:20:00'), 
  (13, 21, '2023-12-05 10:10:00'), 
  (14, 3 , '2024-01-08 09:15:00'), 
  (15, 6 , '2024-01-20 14:00:00'), 
  (15, 7 , '2024-02-05 15:30:00'), 
  (16, 26, '2024-02-18 11:45:00'), 
  (17, 1 , '2024-03-01 08:50:00'), 
  (18, 22, '2024-03-12 10:00:00'), 
  (19, 13, '2024-03-25 16:40:00'), 
  (20, 27, '2024-04-04 09:30:00'), 
  (21, 12, '2024-04-10 14:15:00'), 
  (22, 2 , '2024-04-22 11:30:00'), 
  (23, 29, '2024-05-05 10:45:00'), 
  (24, 11, '2024-05-16 15:00:00'), 
  (25, 1 , '2024-05-20 08:30:00'), 
  (26, 28, '2024-06-02 14:20:00'); 
