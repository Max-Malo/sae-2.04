insert into hopital (idHop, nom_hop, adresse_hop, tel_hop) values 
  (1, 'Flaubert', '55 Bis Rue Gustave Flaubert 76600', '0232733232'),
  (2, 'Pierre Janet', '47 Rue de Tourneville 76600', '0232733920'),
  (3, 'Raoul Dufy', '4 Rue Lanfant de Metz 76600', '0232733950'),
  (4, 'Jacques Monod', '29 Avenue Pierre Mendès France 76290', '0232733232'),
  (5, 'HPE- Ramsay santé', '505 Rue Irène Joliot Curie 76600', '0252680202');

insert into laboratoire (idLab, nom_lab, idHop) values 
  (1, 'Biochimie', 1),
  (2, 'Microbiologie', 1),
  (3, 'Biologie', 4),
  (4, 'Bactériologie', 4),
  (5, 'Hématologie', 4);

insert into service (idServ, nom_serv, nb_lits, id_Hop) values 
  (1, 'Ophtalmologie', 50, 1),
  (2, 'Dermatologie', 30, 1),
  (3, 'Cardiologie', 120, 4),
  (4, 'Gynécologie', 40, 4),
  (5, 'Cardiologie', 80, 5);

insert into medecin (idMed, nom_med, mail_med, spec, fct, idLab, idServ, idHop) values 
  (1, 'Robert', 'robert@hop.fr', 'Bactériologiste', 'CHERCHEUR', 4, null, 4),
  (2, 'Vercoust', 'vercoust@hop.fr', 'Hématologiste', 'CHERCHEUR', 5, null, 4),
  (3, 'Favier', 'favier@hop.fr', 'Gynécologue', 'PRATICIEN', null, 4, 4),
  (4, 'Sorrel', 'sorrel@hop.fr', 'Pédiatre', 'PRATICIEN', null, 1, 1),
  (5, 'Ferret', 'ferret@hop.fr', 'Cardiologue', 'PRATICIEN', null, 3, 4),
  (6, 'Blanchard', 'blanchard@hop.fr', 'Cardiologue', 'PRATICIEN', null, 5, 5),
  (7, 'Firmin', 'firmin@hop.fr', 'Gynécologue', 'CONSULTANT', null, null, 4),
  (8, 'Leroy', 'leroy@hop.fr', 'Psychiatre', 'CONSULTANT', null, null, 2);

insert into patient (idPat, nom_pat, prenom_pat, adresse_pat, date_nais) values 
  (1, 'Dupont', 'Jean', 'Le Havre', '1980-05-12'),
  (2, 'Martin', 'Claire', 'Rouen', '1995-10-20'),
  (3, 'Durand', 'Marc', 'Sainte-Adresse', '1950-01-30');

insert into consulte (idPat, idMed, date_consult) values 
  (1, 7, '2023-10-01 10:00:00'),
  (2, 5, '2023-10-02 14:30:00'),
  (1, 6, '2023-11-05 09:00:00');
