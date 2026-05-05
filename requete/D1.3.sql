/* 3. Créer une vue contenant les premières consultations des patients (idPat, premiere_date) */

create view prem_consulte_patient as

select c.idPat ,
       c.MIN(date_consult) as premiere_date

from   consulte as c 

group by c.idPat;
