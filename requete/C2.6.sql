/*Liste des noms des médecins et du nombre de patients examinés par médecin. La liste est triée
par ordre décroissant du nombre de patients*/
select      med.nom_med, 
			count(distinct consulte.idpat) as nombre_patients

from        medecin  as med
			inner join 
			consulte as consulte on med.idmed = consulte.idmed

group by    med.idmed, 
			med.nom_med

order by    nombre_patients desc;