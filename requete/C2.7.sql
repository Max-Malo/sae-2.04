/*Les noms des médecins ayant plus de patients que le médecin Firmin*/
select      med.nom_med

from        medecin  as med
			inner join 
			consulte as consulte on med.idmed = consulte.idmed

group by    med.nom_med

having      count(distinct consulte.idpat) > (
				select      count(distinct consulte2.idpat)
				
				from        consulte as consulte2
							inner join 
							medecin  as med2 on consulte2.idmed = med2.idmed
				
				where       med2.nom_med = 'Firmin'
			);