use master;
go
drop database if exists novcanik;
go
create database novcanik;
go
use novcanik;

create table korisnici(
id int primary key identity(1,1) not null,
ime varchar(25) not null,
oib char(11) not null,
datum_rodenja date
);

create table racuni(
id int primary key identity(1,1) not null,
korisnicko_ime varchar(18) not null,
email varchar(100) not null,
pocetno_stanje decimal(18,2) not null,
korisnik int
);

create table prihodi(
id int primary key identity(1,1) not null,
ocekivani decimal(18,2) not null,
neocekivani decimal(18,2),
ukupno decimal(18,2),
racun int
);

create table troskovi(
id int primary key identity(1,1) not null,
ukupno decimal(18,2),
grupni_trosak decimal(18,2),
trosak int
);

create table grupa(
id int primary key identity(1,1) not null,
korisnik int,
trosak int
);

alter table racuni add foreign key (korisnik) references korisnici(id);
alter table prihodi add foreign key (racun) references racuni(id);
alter table troskovi add foreign key (trosak) references racuni(id);
alter table grupa add foreign key (korisnik) references korisnici(id);
alter table grupa add foreign key (trosak) references troskovi(id);