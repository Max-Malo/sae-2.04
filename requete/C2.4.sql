/*Les patients ayant consulté dans plusieurs hôpitaux*/
select      pat.nom_pat, 
			pat.prenom_pat

from        patient  as pat
			inner join 
			consulte as consulte on pat.idpat 	   = consulte.idpat
			inner join 
			medecin  as med 	 on consulte.idmed = med.idmed

group by    pat.nom_pat, pat.prenom_pat

having      count(distinct med.idhop) > 1;