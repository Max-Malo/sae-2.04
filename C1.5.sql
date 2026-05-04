/*Liste des consultations de médecins (nom du médecin, nom du patient et la date de
consultation)*/
select		med.nom_med,

			pat.nom_pat,

			consulte.date_consult

from		patient  as pat
			inner join
			consulte as consulte on consulte.idpat = pat.idpat
			inner join
			medecin  as med 	 on med.idmed = consulte.idmed;