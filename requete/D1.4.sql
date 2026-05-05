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