insert into hopital values (1, 'Flaubert', '55 Bis Rue Gustave Flaubert 76600', '0232733232');
insert into hopital values (2, 'Pierre Janet', '47 Rue de Tourneville 76600', '0232733920');
insert into hopital values (3, 'Raoul Dufy', '4 Rue Lanfant de Metz 76600', '0232733950');
insert into hopital values (4, 'Jacques Monod', '29 Avenue Pierre Mendès France 76290', '0232733232');
insert into hopital values (5, 'HPE- Ramsay santé', '505 Rue Irène Joliot Curie 76600', '0252680202');

insert into laboratoire values (1, 'Biochimie', 1);
insert into laboratoire values (2, 'Microbiologie', 1);
insert into laboratoire values (3, 'Biologie', 4);
insert into laboratoire values (4, 'Bactériologie', 4);
insert into laboratoire values (5, 'Hématologie', 4);

insert into service values (1, 'Ophtalmologie', 50, 1);
insert into service values (2, 'Dermatologie', 30, 1);
insert into service values (3, 'Cardiologie', 120, 4);
insert into service values (4, 'Gynécologie', 40, 4);
insert into service values (5, 'Cardiologie', 80, 5);

insert into medecin values (1, 'Robert', 'robert@hop.fr', 'Bactériologiste', 'CHERCHEUR', 4, null, 4);
insert into medecin values (2, 'Vercoust', 'vercoust@hop.fr', 'Hématologiste', 'CHERCHEUR', 5, null, 4);
insert into medecin values (3, 'Favier', 'favier@hop.fr', 'Gynécologue', 'PRATICIEN', null, 4, 4);
insert into medecin values (4, 'Sorrel', 'sorrel@hop.fr', 'Pédiatre', 'PRATICIEN', null, 1, 1);
insert into medecin values (5, 'Ferret', 'ferret@hop.fr', 'Cardiologue', 'PRATICIEN', null, 3, 4);
insert into medecin values (6, 'Blanchard', 'blanchard@hop.fr', 'Cardiologue', 'PRATICIEN', null, 5, 5);
insert into medecin values (7, 'Firmin', 'firmin@hop.fr', 'Gynécologue', 'CONSULTANT', null, null, 4);
insert into medecin values (8, 'Leroy', 'leroy@hop.fr', 'Psychiatre', 'CONSULTANT', null, null, 2);

insert into patient values (1, 'Dupont', 'Jean', 'Le Havre', '1980-05-12');
insert into patient values (2, 'Martin', 'Claire', 'Rouen', '1995-10-20');
insert into patient values (3, 'Durand', 'Marc', 'Sainte-Adresse', '1950-01-30');

insert into consulte values (1, 7, '2023-10-01 10:00:00');
insert into consulte values (2, 5, '2023-10-02 14:30:00');
insert into consulte values (1, 6, '2023-11-05 09:00:00');
