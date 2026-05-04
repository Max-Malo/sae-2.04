/*Liste des noms des médecins de la même spécialité que le médecin Firmin, cette liste est triée
par ordre alphabétique*/
select		med.nom_med

from		medecin as med

where		med.spec like (
					select		med2.spec

					from		medecin as med2

					where		nom_med = 'Firmin'
			);