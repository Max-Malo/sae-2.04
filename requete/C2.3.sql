/*Les hôpitaux ayant plus de 300 lits*/
select		hop.nom_hop

from		hopital as hop
			inner join service as serv on hop.idhop = serv.idhop

group by	hop.nom_hop

having		sum(serv.nb_lits) > 300;
