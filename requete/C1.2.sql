/*Noms des hôpitaux qui ont un service de Cardiologie.*/
select		hop.nom_hop

from		hopital as hop
			inner join
			service as serv on serv.idhop = hop.idhop

where		serv.nom_serv like 'Cardiologie';