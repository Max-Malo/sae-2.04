-------------------------------------------------------
-- BASLEY 	Max-Malo 	C1
-- COFFARD 	Alexis 		C1
-- LARBI 	Timothé 	C2
-------------------------------------------------------
-- script requetesHopital.sql
-- connexion a postgresql:    	psql 
-- execution du script:		=>\i requetesHopital.sql
-- verif:			=>\dt
-------------------------------------------------------

/* Partie C */

/*1. Les noms des services ayant plus de 100 lits.*/
select		serv.nom_serv

from		SERVICE as serv

where		serv.nb_lits > 100;


/*2. Noms des hôpitaux qui ont un service de Cardiologie.*/
select		hop.nom_hop

from		HOPITAL as hop
			inner join
			SERVICE as serv on serv.idhop = hop.idhop

where		serv.nom_serv like 'Cardiologie';


/*3. Les noms des laboratoires de l’hôpital Jacques Monod.*/
select		lab.nom_lab

from		LABORATOIRE as lab
			inner join
			HOPITAL	    as hop on hop.idhop = lab.idhop

where		hop.nom_hop like 'Jacques Monod';


/*4. Noms des patients ayant consulté un gynécologue*/
select		pat.nom_pat

from		PATIENT  as pat
			inner join
			CONSULTE as cons on cons.idpat = pat.idpat
			inner join
			MEDECIN  as med  on med.idmed = cons.idmed

where		med.spec like 'Gynécologue';


/*5. Liste des consultations de médecins (nom du médecin, nom du patient et la date de
consultation)*/
select		med.nom_med,

			pat.nom_pat,

			cons.date_consult

from		PATIENT  as pat
			inner join
			CONSULTE as cons on cons.idpat = pat.idpat
			inner join
			MEDECIN  as med  on med.idmed = cons.idmed;


/*6. Noms des patients ayant consulté un médecin consultant indépendant à l'hôpital Jacques
Monod*/
select		pat.nom_pat

from		PATIENT  as pat
			inner join
			CONSULTE as cons on cons.idpat = pat.idpat
			inner join
			MEDECIN  as med  on med.idmed  = cons.idmed
			inner join
			HOPITAL  as hop	 on hop.idhop  = med.idhop

where		hop.nom_hop like 'Jacques Monod' and

			med.fct     like 'CONSULTANT'		 ;/*indépendant ????*/


/*7. Noms des patients n'ayant consulté qu'à l'hôpital Jacques Monod*/
select distinct	pat.nom_pat

from			PATIENT  as pat
				inner join 
				CONSULTE as cons on pat.idpat 	= cons.idpat
				inner join 
				MEDECIN  as med  on cons.idmed  = med.idmed
				inner join 
				HOPITAL  as hop  on med.idhop   = hop.idhop

where			hop.nom_hop = 'Jacques Monod' and
				pat.idpat not in ( 	select	CONSULTE2.idpat
					
					   				from		CONSULTE as cons2
												inner join 
												MEDECIN  as med2 on cons2.idmed = med2.idmed
												inner join 
												HOPITAL  as hop2 on med2.idhop = hop2.idhop

					   				where	hop2.nom_hop != 'Jacques Monod' );
				

/*8. Liste des noms des médecins de la même spécialité que le médecin Firmin, cette liste est triée
par ordre alphabétique*/
select		med.nom_med

from		MEDECIN as med

where		med.spec like ( select		med2.spec

							from		MEDECIN as med2

							where		nom_med = 'Firmin' )

order by	med.nom_med;


/*9. Les noms des hôpitaux avec un service de Cardiologie de capacité supérieure au service de
Cardiologie de l'hôpital Jacques Monod*/
select		hop.nom_hop

from		HOPITAL as hop
			inner join
			SERVICE as serv on serv.idhop = hop.idhop

where		serv.nom_serv = 'Cardiologie' 	and

			serv.nb_lits > ( select		serv2.nb_lits

						 	 from		SERVICE as serv2
										inner join
										HOPITAL as hop2 on hop2.idhop = serv2.idhop

							 where		nom_hop = 'Jacques Monod' 	and
				 
										serv2.nom_serv = 'Cardiologie' );
			

/*10. Les hôpitaux ayant plus de 300 lits*/
select		hop.nom_hop

from		HOPITAL as hop
			inner join 
			SERVICE as serv on hop.idhop = serv.idhop

group by	hop.nom_hop

having		sum(serv.nb_lits) > 300;


/*11. Les patients ayant consulté dans plusieurs hôpitaux*/
select			pat.nom_pat, 
				pat.prenom_pat

from        	PATIENT  as pat
				inner join 
				CONSULTE as cons on pat.idpat  = cons.idpat
				inner join 
				MEDECIN  as med  on cons.idmed = med.idmed

group by    	pat.nom_pat, pat.prenom_pat

having      	count(distinct med.idhop) > 1;


/*12. Le nombre de lits par type de service pour l'ensemble des hôpitaux*/
select     	 	serv.nom_serv, 
				sum(serv.nb_lits) as total_lits

from        	SERVICE as serv

group by    	serv.nom_serv;


/*13. Liste des noms des médecins et du nombre de patients examinés par médecin. La liste est triée
par ordre décroissant du nombre de patients*/
select      	med.nom_med, 
		
				count(distinct cons.idpat) as nombre_patients

from        	MEDECIN  as med
				inner join 
				CONSULTE as cons on med.idmed = cons.idmed

group by    	med.idmed, 
				med.nom_med

order by    	nombre_patients desc;


/*14. Les noms des médecins ayant plus de patients que le médecin Firmin*/
select      	med.nom_med

from        	MEDECIN  as med
				inner join 
				CONSULTE as cons on med.idmed = cons.idmed

group by    	med.nom_med

having      	count(distinct cons.idpat) > ( 	select      count(distinct cons2.idpat)
				
												from       	CONSULTE as cons2
															inner join 
															MEDECIN  as med2 on cons2.idmed = med2.idmed
				
												where       med2.nom_med = 'Firmin' );
			

/*15. Les patients ayant fréquenté tous les services de l'hôpital Jacques Monod*/
select      	pat.nom_pat,
            	pat.prenom_pat

from        	PATIENT as pat
            	inner join 
				CONSULTE as cons on pat.idpat  = cons.idpat
            	inner join 
				MEDECIN  as med  on cons.idmed = med.idmed
            	inner join 
				HOPITAL  as hop  on med.idhop  = hop.idhop

where       	hop.nom_hop = 'Jacques Monod' and

            	med.idserv is not null

group by   		pat.nom_pat, pat.prenom_pat

having      	count(distinct med.idserv) = ( 	select      	count(*)
                
                								from        	SERVICE as serv
                            									inner join 
																HOPITAL as hop2 on serv.idhop = hop2.idhop
                
                								where       hop2.nom_hop = 'Jacques Monod' );
            

/*16. Les hôpitaux ayant les mêmes laboratoires que l'hôpital Jacques Monod*/

select			hop.nom_hop

from        	HOPITAL as hop
            	inner join 
				LABORATOIRE as lab on hop.idhop = lab.idhop

where       	hop.nom_hop != 'Jacques Monod' and
            	lab.nom_lab in (select      	lab2.nom_lab
                
                				from        	LABORATOIRE as lab2
                            					inner join 
												HOPITAL as hop2 on lab2.idhop = hop2.idhop
                
               					where       hop2.nom_hop = 'Jacques Monod' )

group by    	hop.nom_hop

having      	count(distinct lab.nom_lab) = ( select      	count(*)
                
                								from        	LABORATOIRE as lab3
                            									inner join 
																HOPITAL as hop3 on lab3.idhop = hop3.idhop
                
                								where       hop3.nom_hop = 'Jacques Monod' );
            

/* Partie D */

/* 1. Créer une vue qui regroupe les médecins chercheurs (nom, mail, spécialité) et le nom de leur hôpital. */

create view medecin_chercheur as 

select  	med.nom_med  ,
        	med.mail_med ,
        	med.spec     ,

        	hop.nom_hop  

from    	MEDECIN as m ed
        	inner join 
        	HOPITAL as hop on hop.idHop = med.idHop

where   	med.fct = 'CHERCHEUR' ;

/* 2. Utiliser cette vue pour afficher les médecins chercheurs de l'hôpital Jacques Monod. */

select 		*

from   		medecin_chercheur 

where  		nom_hop = 'Jacques Monod' ;

/* 3. Créer une vue contenant les premières consultations des patients (idPat, premiere_date) */

create view prem_consulte_patient as

select 		cons.idPat ,
       		MIN(date_consult) 	  as premiere_date

from   		CONSULTE 	  		  as cons

group by 	cons.idPat;

/* 4. Utiliser cette vue pour écrire une fonction age_patient qui admet comme paramètre l’identifiant du patient 
et qui retourne l’âge du patient à sa première consultation */


create or replace function age_patient( id_recherche int )
returns int as $$

declare 
    v_age int ;
begin

    select  	EXTRACT (YEAR from v.premiere_date) - EXTRACT(YEAR from p.date_nais) into v_age

    from		PATIENT 	      	  as pat
    			inner join    
    			prem_consulte_patient as v on pat.idPat = v.idPat

    where   	pat.idPat = id_recherche;

    return v_age;
end ;
$$ language plpgsql;

/* 5. Écrire une requête qui donne la liste des consultations 
(nom du médecin, nom du patient) des patients de plus de 40 ans. 
Utiliser la fonction age_patient */

select 		med.nom_med, 
       		pat.nom_pat
       		
from   		CONSULTE as cons
			inner join   
			MEDECIN  as med 	on cons.idmed = med.idmed
			inner join   
			PATIENT  as pat 	on cons.idpat = pat.idpat
		
where  		age_patient(pat.idpat) > 40;
