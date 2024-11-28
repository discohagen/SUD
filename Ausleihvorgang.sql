create table `t_Auto`
(
    Auto_ID                 int primary key,
    Marke                   text        not null,
    Modell                  text        not null,
    Nummernschild           text unique not null,
    Baujahr                 int         not null,
    Typ                     text        not null,
    Motor                   text        not null,
    Datum_letzte_Inspektion text
);

insert into `t_Auto` (Auto_ID, Marke, Modell, Nummernschild, Baujahr, Typ, Motor, Datum_letzte_Inspektion)
values (1, 'Ford', 'Mondeo', 'K-OM-278', 2020, 'Kombi', 'Diesel', '2021-05-20'),
       (2, 'Ford', 'Mondeo', 'K-OM-279', 2019, 'Kombi', 'Benziner', '2020-12-19'),
       (3, 'Ford', 'Kuga', 'K-OM-280', 2021, 'SUV', 'Benziner', '2021-08-05'),
       (4, 'Smart', 'Fortwo', 'K-OM-281', 2019, 'Kleinwagen', 'Hybrid', '2020-01-05'),
       (5, 'Smart', 'Fortwo', 'K-OM-282', 2019, 'Kleinwagen', 'Hybrid', '2021-01-05'),
       (6, 'Smart', 'Fortwo', 'K-OM-283', 2019, 'Kleinwagen', 'Hybrid', '2021-01-05');

create table `t_Mietdatum_zu_Auto`
(
    Auto_ID               int,
    Mietbeginn_Datum      text,
    Mietbeginn_Uhrzeit    text,
    Gefahrene_Kilometer   int,
    Kilometerstand_vorher int not null,
    Mitarbeiter_ID        int,
    Mietdauer_in_h        int,
    primary key (Auto_ID, Mietbeginn_Datum, Mietbeginn_Uhrzeit),
    foreign key (Mitarbeiter_ID) references t_Personaldaten (Persnr)
);

insert into `t_Mietdatum_zu_Auto` (Auto_ID, Mietbeginn_Datum, Mietbeginn_Uhrzeit, Gefahrene_Kilometer,
                                   Kilometerstand_vorher, Mitarbeiter_ID, Mietdauer_in_h)
values (1, '2021-08-02', '09:00', 27, 11885, 47, 3),
       (1, '2021-08-21', '08:00', 27, 11912, 47, 4),
       (1, '2021-08-17', '09:00', 27, 10896, 47, 6),
       (1, '2021-08-04', '08:00', 112, 10923, 14, 30),
       (1, '2021-08-09', '08:00', 798, 11035, 6, 104),
       (1, '2021-08-16', '09:00', 52, 11833, 24, 5),
       (2, '2021-08-16', '09:00', 149, 15500, 6, 5),
       (3, '2021-08-18', '09:00', 571, 9023, 34, 9),
       (4, '2021-08-12', '09:00', 25, 544194, 11, 10),
       (4, '2021-08-14', '08:00', 25, 55219, 11, 5),
       (5, '2021-08-10', '09:00', 25, 26547, 11, 10);