/* partie C */

/*Les noms des services ayant plus de 100 lits.*/
select		serv.nom_serv

from		service as serv

where		serv.nb_lits > 100;

/*Noms des hôpitaux qui ont un service de Cardiologie.*/
select		hop.nom_hop

from		hopital as hop
			inner join
			service as serv on serv.idhop = hop.idhop

where		serv.nom_serv like 'Cardiologie';

/*Les noms des laboratoires de l’hôpital Jacques Monod.*/
select		lab.nom_lab

from		laboratoire as lab
			inner join
			hopital		as hop on hop.idhop = lab.idhop

where		hop.nom_hop like 'Jacques Monod';

/*Noms des patients ayant consulté un gynécologue*/
select		pat.nom_pat

from		patient  as pat
			inner join
			consulte as consulte on consulte.idpat = pat.idpat
			inner join
			medecin  as med 	 on med.idmed = consulte.idmed

where		med.spec like 'Gynécologue';

/*Liste des consultations de médecins (nom du médecin, nom du patient et la date de
consultation)*/
select		med.nom_med,

			pat.nom_pat,

			consulte.date_consult

from		patient  as pat
			inner join
			consulte as consulte on consulte.idpat = pat.idpat
			inner join
			medecin  as med 	 on med.idmed = consulte.idmed;


/*Noms des patients ayant consulté un médecin consultant indépendant à l'hôpital Jacques
Monod*/
select		pat.nom_pat

from		patient  as pat
			inner join
			consulte as consulte on consulte.idpat = pat.idpat
			inner join
			medecin  as med 	 on med.idmed	   = consulte.idmed
			inner join
			hopital  as hop		 on hop.idhop 	   = med.idhop

where		hop.nom_hop like 'Jacques Monod' and
			med.fct like 'CONSULTANT'		 ;/*indépendant ????*/*


/*Noms des patients n'ayant consulté qu'à l'hôpital Jacques Monod*/
select distinct	pat.nom_pat

from			patient  as pat
				inner join 
				consulte as consulte on pat.idpat 	    = consulte.idpat
				inner join 
				medecin  as med 	 on consulte.idmed  = med.idmed
				inner join 
				hopital  as hop 	 on med.idhop 		= hop.idhop

where			hop.nom_hop = 'Jacques Monod' and
				pat.idpat not in (
					select		consulte2.idpat
					
					from		consulte as consulte2
								inner join 
								medecin as med2 on consulte2.idmed = med2.idmed
								inner join 
								hopital as hop2 on med2.idhop = hop2.idhop

					where		hop2.nom_hop != 'Jacques Monod'
				);

/*Liste des noms des médecins de la même spécialité que le médecin Firmin, cette liste est triée
par ordre alphabétique*/
select		med.nom_med

from		medecin as med

where		med.spec like (
					select		med2.spec

					from		medecin as med2

					where		nom_med = 'Firmin'
			);

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

/*Les hôpitaux ayant plus de 300 lits*/
select		hop.nom_hop

from		hopital as hop
			inner join service as serv on hop.idhop = serv.idhop

group by	hop.nom_hop

having		sum(serv.nb_lits) > 300;

/*Les patients ayant consulté dans plusieurs hôpitaux*/
select      pat.nom_pat, 
			pat.prenom_pat

from        patient  as pat
			inner join 
			consulte as consulte on pat.idpat 	   = consulte.idpat
			inner join 
			medecin  as med 	 on consulte.idmed = med.idmed

group by    pat.nom_pat, pat.prenom_pat

having      count(distinct med.idhop) > 1;

/*Le nombre de lits par type de service pour l'ensemble des hôpitaux*/
select      serv.nom_serv, 
			sum(serv.nb_lits) as total_lits

from        service as serv

group by    serv.nom_serv;

/*Liste des noms des médecins et du nombre de patients examinés par médecin. La liste est triée
par ordre décroissant du nombre de patients*/
select      med.nom_med, 
			count(distinct consulte.idpat) as nombre_patients

from        medecin  as med
			inner join 
			consulte as consulte on med.idmed = consulte.idmed

group by    med.idmed, 
			med.nom_med

order by    nombre_patients desc;

/*Les noms des médecins ayant plus de patients que le médecin Firmin*/
select      med.nom_med

from        medecin  as med
			inner join 
			consulte as consulte on med.idmed = consulte.idmed

group by    med.nom_med

having      count(distinct consulte.idpat) > (
				select      count(distinct consulte2.idpat)
				
				from        consulte as consulte2
							inner join 
							medecin  as med2 on consulte2.idmed = med2.idmed
				
				where       med2.nom_med = 'Firmin'
			);

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

/* Partie D */

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

/* 2. Utiliser cette vue pour afficher les médecins chercheurs de l'hôpital Jacques Monod. */

select *

from   medecin_chercheur 

where  nom_hop = 'Jacques Monod' ;

/* 3. Créer une vue contenant les premières consultations des patients (idPat, premiere_date) */

create view prem_consulte_patient as

select c.idPat ,
       c.MIN(date_consult) as premiere_date

from   consulte as c 

group by c.idPat;

/* 4. Utiliser cette vue pour écrire une fonction age_patient qui admet comme paramètre l’identifiant du patient 
et qui retourne l’âge du patient à sa première consultation */


create or replace function age_patient( id_recherche int )
returns int as $$

declare 
    v_age int ;
begin

    select  EXTRACT (YEAR FROM v.premiere_date) - EXTRACT(YEAR FROM p.date_nais)
    into v_age

    from    patient p
    join    prem_consulte_patient v ON p.idPat = v.idPat

    where   p.idPat = id_recherche;

    RETURN v_age;
end ;
$$ LANGUAGE plpgsql;

/* 5. Écrire une requête qui donne la liste des consultations 
(nom du médecin, nom du patient) des patients de plus de 40 ans. 
Utiliser la fonction age_patient */

select m.nom_med, 
       p.nom_pat
from   consulte c
join   medecin m on c.idmed = m.idmed
join   patient p on c.idpat = p.idpat
where  age_patient(p.idpat) > 40;