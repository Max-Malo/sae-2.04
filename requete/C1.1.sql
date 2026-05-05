/*Les noms des services ayant plus de 100 lits.*/
select		serv.nom_serv

from		service as serv

where		serv.nb_lits > 100;
