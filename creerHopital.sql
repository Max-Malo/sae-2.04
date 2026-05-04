drop table if exists consulte;
drop table if exists patient;
drop table if exists medecin;
drop table if exists service;
drop table if exists laboratoire;
drop table if exists hopital;

create table hopital (
    idhop int primary key,
    nom_hop varchar(100) not null,
    adresse_hop varchar(255),
    tel_hop char(10)
);

create table laboratoire (
    idlab int primary key,
    nom_lab varchar(100) not null,
    idhop int not null,
    constraint fk_lab_hop foreign key (idhop) references hopital(idhop)
);

create table service (
    idserv int primary key,
    nom_serv varchar(100) not null,
    nb_lits int check (nb_lits >= 0),
    idhop int not null,
    constraint fk_serv_hop foreign key (idhop) references hopital(idhop)
);

create table medecin (
    idmed int primary key,
    nom_med varchar(100) not null,
    mail_med varchar(150) unique not null,
    spec varchar(100),
    fct varchar(20) check (fct in ('CONSULTANT', 'CHERCHEUR', 'PRATICIEN')),
    idlab int,
    idserv int,
    idhop int not null,
    constraint fk_med_lab foreign key (idlab) references laboratoire(idlab),
    constraint fk_med_serv foreign key (idserv) references service(idserv),
    constraint fk_med_hop foreign key (idhop) references hopital(idhop)
);

create table patient (
    idpat int primary key,
    nom_pat varchar(100) not null,
    prenom_pat varchar(100),
    adresse_pat varchar(255),
    date_nais date
);

create table consulte (
    idpat int,
    idmed int,
    date_consult timestamp,
    primary key (idpat, idmed, date_consult),
    constraint fk_cons_pat foreign key (idpat) references patient(idpat),
    constraint fk_cons_med foreign key (idmed) references medecin(idmed)
);
