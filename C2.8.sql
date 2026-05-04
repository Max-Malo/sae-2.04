/*Les patients ayant fréquenté tous les services de l'hôpital Jacques Monod*/
select      pat.nom_pat,
            pat.prenom_pat

from        patient as pat
            inner join 
			consulte as consulte on pat.idpat 		  = consulte.idpat
            inner join 
			medecin  as med 		on consulte.idmed = med.idmed
            inner join 
			hopital  as hop 		on med.idhop 	  = hop.idhop

where       hop.nom_hop = 'Jacques Monod' and
            med.idserv is not null

group by    pat.nom_pat, pat.prenom_pat

having      count(distinct med.idserv) = (
                select      count(*)
                
                from        service as serv
                            inner join 
							hopital as hop2 on serv.idhop = hop2.idhop
                
                where       hop2.nom_hop = 'Jacques Monod'
            );