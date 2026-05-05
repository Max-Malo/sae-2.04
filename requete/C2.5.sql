/*Le nombre de lits par type de service pour l'ensemble des hôpitaux*/
select      serv.nom_serv, 
			sum(serv.nb_lits) as total_lits

from        service as serv

group by    serv.nom_serv;