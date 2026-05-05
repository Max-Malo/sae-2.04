/*Les hôpitaux ayant les mêmes laboratoires que l'hôpital Jacques Monod*/
select      hop.nom_hop

from        hopital as hop
            inner join 
			laboratoire as lab on hop.idhop = lab.idhop

where       hop.nom_hop != 'Jacques Monod' and
            lab.nom_lab in (
                select      lab2.nom_lab
                
                from        laboratoire as lab2
                            inner join 
							hopital as hop2 on lab2.idhop = hop2.idhop
                
                where       hop2.nom_hop = 'Jacques Monod'
            )

group by    hop.nom_hop

having      count(distinct lab.nom_lab) = (
                select      count(*)
                
                from        laboratoire as lab3
                            inner join 
							hopital as hop3 on lab3.idhop = hop3.idhop
                
                where       hop3.nom_hop = 'Jacques Monod'
            );