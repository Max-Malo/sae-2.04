/*Noms des patients n'ayant consulté qu'à l'hôpital Jacques Monod*/
select distinct	pat.nom_pat

from			patient  as pat
				inner join 
				consulte as consulte on pat.idpat 	    = consulte.idpat
				inner join 
				medecin  as med 	 on consulte.idmed  = med.idmed
				inner join 
				hopital  as hop 	 on med.idhop 		= hop.idhop

where			hop.nom_hop = 'Jacques Monod' and
				pat.idpat not in (
					select		consulte2.idpat
					
					from		consulte as consulte2
								inner join 
								medecin as med2 on consulte2.idmed = med2.idmed
								inner join 
								hopital as hop2 on med2.idhop = hop2.idhop

					where		hop2.nom_hop != 'Jacques Monod'
				);