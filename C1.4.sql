/*Noms des patients ayant consulté un gynécologue*/
select		pat.nom_pat

from		patient  as pat
			inner join
			consulte as consulte on consulte.idpat = pat.idpat
			inner join
			medecin  as med 	 on med.idmed = consulte.idmed

where		med.spec like 'Gynécologue';