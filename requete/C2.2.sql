/*Les noms des hôpitaux avec un service de Cardiologie de capacité supérieure au service de
Cardiologie de l'hôpital Jacques Monod*/
select		hop.nom_hop

from		hopital as hop
			inner join
			service as serv on serv.idhop = hop.idhop

where		serv.nom_serv = 'Cardiologie' and
			serv.nb_lits > (
					select		serv2.nb_lits

					from		service as serv2
								inner join
								hopital as hop2 on hop2.idhop = serv2.idhop

					where		nom_hop = 'Jacques Monod' and
								serv2.nom_serv = 'Cardiologie'
			);