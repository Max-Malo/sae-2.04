/*Noms des patients ayant consulté un médecin consultant indépendant à l'hôpital Jacques
Monod*/
select		pat.nom_pat

from		patient  as pat
			inner join
			consulte as consulte on consulte.idpat = pat.idpat
			inner join
			medecin  as med 	 on med.idmed	   = consulte.idmed
			inner join
			hopital  as hop		 on hop.idhop 	   = med.idhop

where		hop.nom_hop like 'Jacques Monod' and
			med.fct like 'CONSULTANT'		 ;/*indépendant ????*/