/* 1. Créer une vue qui regroupe les médecins chercheurs (nom, mail, spécialité) et le nom de leur hôpital. */

create view medecin_chercheur as 

select  m.nom_med  ,
        m.mail_med ,
        m.spec     ,

        h.nom_hop  

from    MEDECIN as m 
        inner join 
        HOPITAL as h on h.idHop = m.idHop

where   m.fct = 'chercheur' ;