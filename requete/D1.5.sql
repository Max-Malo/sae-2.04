/* 5. Écrire une requête qui donne la liste des consultations 
(nom du médecin, nom du patient) des patients de plus de 40 ans. 
Utiliser la fonction age_patient */

select m.nom_med, 
       p.nom_pat
from   consulte c
join   medecin m on c.idmed = m.idmed
join   patient p on c.idpat = p.idpat
where  age_patient(p.idpat) > 40;