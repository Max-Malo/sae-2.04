/*Les noms des laboratoires de l’hôpital Jacques Monod.*/
select		lab.nom_lab

from		laboratoire as lab
			inner join
			hopital		as hop on hop.idhop = lab.idhop

where		hop.nom_hop like 'Jacques Monod';