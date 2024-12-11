--
-- Tabellenstruktur für Tabelle `t_Abteilung`
--

CREATE TABLE `t_Abteilung`
(
    `Abtnr`           int(11)      DEFAULT NULL,
    `PersnrAbtleiter` int(11)      DEFAULT NULL,
    `Abtname`         varchar(255) DEFAULT NULL,
    PRIMARY KEY (Abtnr),
    FOREIGN KEY (PersnrAbtleiter) REFERENCES t_Personaldaten (Persnr)
);

--
-- Daten für Tabelle `t_Abteilung`
--

INSERT INTO `t_Abteilung` (`Abtnr`, `PersnrAbtleiter`, `Abtname`)
VALUES (1, 10, 'Leitung'),
       (2, 9, 'Steuerung'),
       (3, 5, 'Transport'),
       (4, 1, 'Einkauf'),
       (5, 0, 'im Aufbau');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `t_ArchivRechnungen`
--

CREATE TABLE `t_ArchivRechnungen`
(
    `ArRechnungsnummer` int(11) NOT NULL,
    `ArRechnungsdatum`  date           DEFAULT NULL,
    `ArKNr`             int(11)        DEFAULT NULL,
    `ArAnzahlPosten`    int(11)        DEFAULT NULL,
    `ArGesamtsumme`     decimal(19, 4) DEFAULT NULL
);

--
-- Daten für Tabelle `t_ArchivRechnungen`
--

INSERT INTO `t_ArchivRechnungen` (`ArRechnungsnummer`, `ArRechnungsdatum`, `ArKNr`, `ArAnzahlPosten`, `ArGesamtsumme`)
VALUES (4800, '2020-09-19', 30505, 7, '1999.0000'),
       (4832, '2020-09-29', 10101, 9, '2044.0000'),
       (4833, '2020-08-29', 10101, 50, '24000.0000'),
       (4834, '2020-07-17', 20306, 25, '7909.0000'),
       (4835, '2020-09-04', 20306, 1, '1499.0000');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `t_Auftrag`
--

CREATE TABLE `t_Auftrag`
(
    `Aufnr`         int(11)  DEFAULT NULL,
    `Auftragswert`  double   DEFAULT NULL,
    `Auftragsdatum` datetime DEFAULT NULL,
    `Knr`           int(11)  DEFAULT NULL,
    PRIMARY KEY (Aufnr),
    FOREIGN KEY (Knr) REFERENCES t_Kunde (Knr)
);

--
-- Daten für Tabelle `t_Auftrag`
--

INSERT INTO `t_Auftrag` (`Aufnr`, `Auftragswert`, `Auftragsdatum`, `Knr`)
VALUES (1111, 56400, '2021-02-28 00:00:00', 10101),
       (2222, 52700, NULL, 20306),
       (3333, 20800, '2021-02-28 00:00:00', 30514),
       (4444, NULL, NULL, 30505),
       (1112, 56400, '2021-02-28 00:00:00', 10101),
       (2223, 52700, NULL, 20306),
       (3334, 20800, '2021-02-28 00:00:00', 30514),
       (4445, NULL, NULL, 30505),
       (1116, 56400, '2021-02-28 00:00:00', 10101),
       (2227, 52700, NULL, 20306),
       (3338, 20800, '2021-02-28 00:00:00', 30514),
       (4449, NULL, NULL, 30505),
       (1113, 56400, '2021-02-28 00:00:00', 10101),
       (2224, 52700, NULL, 20306),
       (3335, 20800, '2021-02-28 00:00:00', 30514),
       (4446, NULL, NULL, 30505);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `t_Bonizahlungen_2021`
--

CREATE TABLE `t_Bonizahlungen_2021`
(
    `PersNr` int(11)        DEFAULT 0,
    `AufNr`  int(11)        DEFAULT 0,
    `Betrag` decimal(19, 4) DEFAULT 0.0000,
    FOREIGN KEY (Persnr) REFERENCES t_Personaldaten (Persnr)
);
--
-- Daten für Tabelle `t_Bonizahlungen_2021`
--

INSERT INTO `t_Bonizahlungen_2021` (`PersNr`, `AufNr`, `Betrag`)
VALUES (1, 2222, '500.0000'),
       (1, 4444, '750.0000'),
       (3, 2222, '5000.0000'),
       (3, 4444, '1000.0000'),
       (5, 4444, '750.0000'),
       (5, 2222, '750.0000'),
       (8, 2222, '500.0000'),
       (8, 4444, '100.0000'),
       (1, 2222, '500.0000'),
       (1, 4444, '750.0000'),
       (3, 2222, '5000.0000'),
       (3, 4444, '1000.0000'),
       (5, 4444, '750.0000'),
       (5, 2222, '750.0000'),
       (8, 2222, '500.0000'),
       (8, 4444, '100.0000');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `t_Familienmitglieder`
--

CREATE TABLE `t_Familienmitglieder`
(
    `Persnr`             int(11)     DEFAULT NULL,
    `Fmnr`               int(11)     DEFAULT NULL,
    `Vorname`            varchar(12) DEFAULT NULL,
    `Verwandschaftsgrad` varchar(20) DEFAULT NULL,
    `Zuschlag`           double      DEFAULT NULL,
    `Geb_Datum`          datetime    DEFAULT NULL,
    PRIMARY Key (Persnr, Fmnr, Vorname),
    FOREIGN KEY (Persnr) REFERENCES t_Personaldaten (Persnr),
    FOREIGN KEY (Verwandschaftsgrad) REFERENCES t_VWgrade (VWGrad)
);

--
-- Daten für Tabelle `t_Familienmitglieder`
--

INSERT INTO `t_Familienmitglieder` (`Persnr`, `Fmnr`, `Vorname`, `Verwandschaftsgrad`, `Zuschlag`, `Geb_Datum`)
VALUES (10, 3, 'Mara        ', 'Tochter', 60, '2011-04-14 00:00:00'),
       (10, 2, 'Theo        ', 'Sohn', 40, '2009-09-08 00:00:00'),
       (10, 1, 'Hanna       ', 'Ehefrau', 60, '2017-03-06 00:00:00'),
       (8, 1, 'Christa     ', 'Tochter', 40, '2018-02-28 00:00:00'),
       (5, 2, 'Heinz       ', 'Sohn', 40, '2008-09-29 00:00:00'),
       (5, 1, 'Beate       ', 'Ehefrau', 60, '1979-07-11 00:00:00'),
       (3, 1, 'Heinrich    ', 'Ehemann', 60, '1960-09-01 00:00:00'),
       (10, 4, 'Karl        ', 'Sohn', 40, '2020-09-08 00:00:00'),
       (8, 1, 'Selin     ', 'Tochter', 40, '2018-02-28 00:00:00'),
       (5, 2, 'Jona       ', 'Sohn', 40, '2020-09-29 00:00:00'),
       (3, 1, 'Harald    ', 'Ehemann', 60, '1960-09-01 00:00:00');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `t_Fehlzeiten`
--

CREATE TABLE `t_Fehlzeiten`
(
    `PersNr`    int(11)      DEFAULT NULL,
    `Fehlgrund` varchar(255) DEFAULT NULL,
    `Fehltage`  int(11)      DEFAULT NULL,
    FOREIGN KEY (Persnr) REFERENCES t_Personaldaten (Persnr)
);

--
-- Daten für Tabelle `t_Fehlzeiten`
--

INSERT INTO `t_Fehlzeiten` (`PersNr`, `Fehlgrund`, `Fehltage`)
VALUES (1, 'Urlaub', 14),
       (1, 'Urlaub', 14),
       (1, 'Urlaub', 2),
       (1, 'Fortbildung', 5),
       (1, 'Urlaub', 14),
       (1, 'Urlaub', 2),
       (1, 'Fortbildung', 5),
       (1, 'krank', 2),
       (1, 'krank', 2),
       (1, 'Urlaub', 14),
       (1, 'Urlaub', 2),
       (1, 'Fortbildung', 5),
       (1, 'krank', 2),
       (1, 'krank', 2),
       (1, 'krank', 1),
       (3, 'Urlaub', 1),
       (3, 'Urlaub', 10),
       (3, 'krank', 1),
       (3, 'Urlaub', 2),
       (3, 'Urlaub', 1),
       (3, 'Urlaub', 5),
       (3, 'krank', 3),
       (3, 'krank', 5),
       (4, 'Fortbildung', 5),
       (4, 'Urlaub', 1),
       (4, 'Urlaub', 10),
       (4, 'Urlaub', 2),
       (4, 'krank', 5),
       (1, 'Urlaub', 14),
       (1, 'Urlaub', 14),
       (1, 'Urlaub', 2),
       (1, 'Fortbildung', 5),
       (1, 'Urlaub', 14),
       (1, 'Urlaub', 2),
       (1, 'Fortbildung', 5),
       (1, 'krank', 2),
       (1, 'krank', 2),
       (1, 'Urlaub', 14),
       (1, 'Urlaub', 2),
       (1, 'Fortbildung', 5),
       (1, 'krank', 2),
       (1, 'krank', 2),
       (1, 'krank', 1),
       (3, 'Urlaub', 1),
       (3, 'Urlaub', 10),
       (3, 'krank', 1),
       (3, 'Urlaub', 2),
       (3, 'Urlaub', 1),
       (3, 'Urlaub', 5),
       (3, 'krank', 3),
       (3, 'krank', 5),
       (4, 'Fortbildung', 5),
       (4, 'Urlaub', 1),
       (4, 'Urlaub', 10),
       (4, 'Urlaub', 2),
       (4, 'krank', 5);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `t_Genommer_Urlaub_2021`
--

CREATE TABLE `t_Genommer_Urlaub_2021`
(
    `PersNr`      int(11) DEFAULT 0,
    `Urlaubstage` int(11) DEFAULT 0,
    FOREIGN KEY (PersNr) REFERENCES t_Personaldaten (PersNr)
);

--
-- Daten für Tabelle `t_Genommer_Urlaub_2021`
--

INSERT INTO `t_Genommer_Urlaub_2021` (`PersNr`, `Urlaubstage`)
VALUES (9, 7),
       (5, 1),
       (8, 10),
       (7, 5),
       (9, 2),
       (9, 10);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `t_Kunde`
--

CREATE TABLE `t_Kunde`
(
    `Knr`      int(11)     DEFAULT NULL,
    `KName`    varchar(25) DEFAULT NULL,
    `KStrasse` varchar(20) DEFAULT NULL,
    `KOrt`     varchar(15) DEFAULT NULL,
    `KAnrede`  varchar(6)  DEFAULT NULL,
    PRIMARY KEY (Knr)
);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `t_Mitarbeitergehalt`
--

CREATE TABLE `t_Mitarbeitergehalt`
(
    `Persnr`  int(11) DEFAULT NULL,
    `Jahr`    int(11) DEFAULT NULL,
    `Monat`   int(11) DEFAULT NULL,
    `MGehalt` double  DEFAULT NULL,
    FOREIGN KEY (Persnr) REFERENCES t_Personaldaten (Persnr)
);

--
-- Daten für Tabelle `t_Mitarbeitergehalt`
--

INSERT INTO `t_Mitarbeitergehalt` (`Persnr`, `Jahr`, `Monat`, `MGehalt`)
VALUES (1, 2021, 1, 4100),
       (3, 2021, 1, 3200),
       (4, 2021, 1, 3820),
       (5, 2021, 1, 5000),
       (8, 2021, 1, 4760),
       (9, 2021, 1, 4250),
       (10, 2021, 1, 5900),
       (7, 2021, 1, 2700),
       (1, 2021, 1, 4100),
       (3, 2021, 1, 3200),
       (4, 2021, 1, 3820),
       (5, 2021, 1, 5000),
       (8, 2021, 1, 4760),
       (9, 2021, 1, 4250),
       (10, 2021, 1, 5900),
       (7, 2021, 1, 2700);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `t_Personaldaten`
--

CREATE TABLE `t_Personaldaten`
(
    `Persnr`           int(11) NOT NULL,
    `PName`            varchar(12) DEFAULT NULL,
    `PVorname`         varchar(12) DEFAULT NULL,
    `Geschlecht`       varchar(1)  DEFAULT NULL,
    `Abtnr`            double      DEFAULT NULL,
    `Eintritt`         date        DEFAULT NULL,
    `Eintrittsgehalt`  double      DEFAULT NULL,
    `Urlaubstage`      int(11)     DEFAULT NULL,
    `Tagesarbeitszeit` int(11)     DEFAULT NULL,
    PRIMARY KEY (Persnr),
    FOREIGN KEY (Abtnr) REFERENCES t_Abteilung (Abtnr)
);

--
-- Daten für Tabelle `t_Personaldaten`
--

INSERT INTO `t_Personaldaten` (`Persnr`, `PName`, `PVorname`, `Geschlecht`, `Abtnr`, `Eintritt`, `Eintrittsgehalt`,
                               `Urlaubstage`, `Tagesarbeitszeit`)
VALUES (1, 'Eifer', 'Stefan', 'M', 4, '2010-05-15', 4500, 30, 8),
       (3, 'Schaefer', 'Johanna', 'w', 4, '1998-02-01', 3850, 30, 7),
       (4, 'Sokolow', 'Dimitri', 'M', 2, '2005-05-15', 3800, 29, 8),
       (5, 'Franzke', 'Axel', 'M', 3, '2011-05-15', 4500, 29, 8),
       (8, 'Oezdemir', 'Serkan', 'M', 3, '2001-12-01', 4200, 30, 8),
       (9, 'Zeiss', 'Gisela', 'W', 2, '1999-02-01', 2700, 30, 8),
       (10, 'Meier', 'Tom', 'M', 1, '2014-02-01', 3950, 30, 8),
       (11, 'Meier', 'Eva', 'W', 1, '2001-12-01', 2900, 29, 7);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `t_Posten`
--

CREATE TABLE `t_Posten`
(
    `TBNr`     date         DEFAULT NULL,
    `Persnr`   int(7)       DEFAULT NULL,
    `Aufnr`    mediumint(7) DEFAULT NULL,
    `Tartnr`   varchar(2)   DEFAULT NULL,
    `TStunden` double       DEFAULT NULL,
    FOREIGN KEY (Persnr) REFERENCES t_Personaldaten (Persnr),
    FOREIGN KEY (Aufnr) REFERENCES t_Auftrag (Aufnr),
    FOREIGN KEY (Tartnr) REFERENCES t_Tätigkeitsarten (Tartnr)
);

--
-- Daten für Tabelle `t_Posten`
--

INSERT INTO `t_Posten` (`TBNr`, `Persnr`, `Aufnr`, `Tartnr`, `TStunden`)
VALUES ('2022-11-04', 1, 4444, '2', 8),
       ('2012-03-01', 1, 4444, '2', 8),
       ('2012-03-01', 3, 4444, '7', 3),
       ('2012-03-01', 3, 4444, '6', 4),
       ('2012-03-01', 5, 2222, '6', 6),
       ('2012-03-01', 7, 2222, '7', 6.5),
       ('2012-03-01', 8, 4444, '2', NULL),
       ('2012-03-01', 10, 2222, '4', 3),
       ('2012-03-01', 10, 2222, '2', 4),
       ('2012-02-28', 1, 3333, '5', 9),
       ('2012-02-28', 1, 3333, '3', 5),
       ('2012-02-28', 1, 2222, '6', 24),
       ('2012-02-28', 1, 2222, '5', 7),
       ('2012-02-28', 1, 2222, '3', 4),
       ('2012-02-28', 1, 1111, '6', 32),
       ('2012-02-28', 1, 1111, '5', 18),
       ('2012-02-28', 1, 1111, '3', 12),
       ('2012-02-28', 1, 3333, '6', 39),
       ('2012-02-28', 3, 2222, '7', 38),
       ('2012-02-28', 3, 2222, '6', 12),
       ('2012-02-28', 3, 1111, '7', 24),
       ('2012-02-28', 3, 1111, '6', 70),
       ('2012-02-28', 3, 3333, '6', 12),
       ('2012-02-28', 3, 3333, '7', 18),
       ('2012-04-02', 5, 1111, '3', 18),
       ('2012-04-02', 5, 4444, '2', 24),
       ('2012-04-02', 5, 1111, '1', 18),
       ('2012-04-02', 5, 1111, '4', 42),
       ('2012-04-02', 5, 1111, '5', 12),
       ('2012-02-28', 5, 2222, '5', 17),
       ('2012-02-28', 5, 2222, '6', 32),
       ('2012-02-28', 7, 1111, '7', 58),
       ('2012-02-28', 7, 2222, '7', 35),
       ('2012-02-28', 7, 3333, '7', 62),
       ('2012-02-28', 8, 1111, '5', 4),
       ('2012-02-28', 8, 1111, '6', 62),
       ('2012-02-28', 8, 2222, '5', 7),
       ('2012-02-28', 8, 2222, '6', 42),
       ('2012-02-28', 8, 3333, '6', 39),
       ('2012-02-28', 10, 1111, '1', 38),
       ('2012-02-28', 10, 1111, '2', 42),
       ('2012-02-28', 10, 4444, '3', 38),
       ('2012-02-28', 10, 3333, '1', 17),
       ('2012-02-28', 10, 3333, '2', 18),
       ('2012-02-28', 10, 3333, '3', 12);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `t_Rechnungen`
--

CREATE TABLE `t_Rechnungen`
(
    `Rechnungsnummer` int(11) NOT NULL,
    `Rechnungsdatum`  datetime       DEFAULT NULL,
    `KNr`             int(11)        DEFAULT NULL,
    `AnzahlPosten`    int(11)        DEFAULT NULL,
    `Gesamtsumme`     decimal(19, 4) DEFAULT NULL,
    `EingangZahlung`  datetime       DEFAULT NULL,
    FOREIGN KEY (Knr) REFERENCES t_Kunde (Knr)
);

--
-- Daten für Tabelle `t_Rechnungen`
--

INSERT INTO `t_Rechnungen` (`Rechnungsnummer`, `Rechnungsdatum`, `KNr`, `AnzahlPosten`, `Gesamtsumme`, `EingangZahlung`)
VALUES (4832, '2021-09-29 00:00:00', 10101, 7, '1044.0000', '2021-10-14 00:00:00'),
       (4833, '2021-05-01 00:00:00', 10101, 5, '2400.0000', '2021-04-01 00:00:00'),
       (4835, '2021-09-29 00:00:00', 10101, 7, '1044.0000', '2021-10-02 00:00:00'),
       (4833, '2021-05-01 00:00:00', 10101, 5, '2400.0000', '2021-05-14 00:00:00'),
       (4835, '2022-01-11 00:00:00', 20306, 8, '1499.0000', '2022-01-19 00:00:00'),
       (4800, '2021-07-25 00:00:00', 30505, 20, '12999.0000', '2021-08-20 00:00:00'),
       (4840, '2022-02-02 00:00:00', 10101, 5, '4999.0000', '2022-02-20 00:00:00');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `t_Tätigkeitsarten`
--

CREATE TABLE `t_Tätigkeitsarten`
(
    `TArtnr` varchar(1)  DEFAULT NULL,
    `TBez`   varchar(15) DEFAULT NULL,
    `TPreis` double      DEFAULT NULL,
    PRIMARY KEY (TArtnr, TPreis)
);

--
-- Daten für Tabelle `t_Tätigkeitsarten`
--

INSERT INTO `t_Tätigkeitsarten` (`TArtnr`, `TBez`, `TPreis`)
VALUES ('1', 'Akquisition', 90),
       ('2', 'Vorbesprechung', 100),
       ('3', 'Beratung', 130),
       ('4', 'Projektentwurf', 120),
       ('5', 'Kalkulation', 110),
       ('6', 'Zeichnen', 90),
       ('7', 'Schreibarbeiten', 80);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `t_Vorgesetzter`
--

CREATE TABLE `t_Vorgesetzter`
(
    `Persnr`  int(11) DEFAULT NULL,
    `VPersnr` int(11) DEFAULT NULL,
    FOREIGN KEY (Persnr) REFERENCES t_Personaldaten (Persnr),
    FOREIGN KEY (VPersnr) REFERENCES t_Vorgesetzter (VPersnr)
);

--
-- Daten für Tabelle `t_Vorgesetzter`
--

INSERT INTO `t_Vorgesetzter` (`Persnr`, `VPersnr`)
VALUES (1, 10),
       (3, 1),
       (4, 9),
       (5, 10),
       (7, 5),
       (8, 5),
       (9, 10),
       (10, 0),
       (1, 10),
       (3, 1),
       (4, 9),
       (5, 10),
       (7, 5),
       (8, 5),
       (9, 10),
       (10, 0),
       (1, 10),
       (3, 1),
       (4, 9),
       (5, 10),
       (7, 5),
       (8, 5),
       (9, 10),
       (10, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `t_VWgrade`
--

CREATE TABLE `t_VWgrade`
(
    `VWGrad` varchar(1) PRIMARY KEY,
    `VWName` varchar(7) DEFAULT NULL
);

--
-- Daten für Tabelle `t_VWgrade`
--

INSERT INTO `t_VWgrade` (`VWGrad`, `VWName`)
VALUES ('f', 'Ehefrau'),
       ('m', 'Ehemann'),
       ('s', 'Sohn'),
       ('t', 'Tochter');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


-- Tabellenstruktur Auto Tabelle
CREATE TABLE t_Auto
(
    Auto_ID                 INTEGER,
    Marke                   VARCHAR(50) NOT NULL,
    Modell                  VARCHAR(50) NOT NULL,
    Nummernschild           VARCHAR(20) NOT NULL,
    Baujahr                 INTEGER     NOT NULL,
    Typ                     VARCHAR(20) NOT NULL,
    Motor                   VARCHAR(20) NOT NULL,
    Datum_letzte_Inspektion DATE        NOT NULL,
    PRIMARY KEY (Auto_ID)
);

-- Daten Autotabelle t_Auto
INSERT INTO t_Auto (Auto_ID, Marke, Modell, Nummernschild, Baujahr, Typ, Motor, Datum_letzte_Inspektion)
VALUES (1, 'Ford', 'Mondeo', 'K-OM-278', 2020, 'Kombi', 'Diesel', '2021-05-20'),
       (2, 'Ford', 'Mondeo', 'K-OM-279', 2019, 'Kombi', 'Benziner', '2020-12-19'),
       (3, 'Ford', 'Kuga', 'K-OM-280', 2021, 'SUV', 'Benziner', '2021-08-05'),
       (4, 'Smart', 'Fortwo', 'K-OM-281', 2019, 'Kleinwagen', 'Hybrid', '2020-01-05'),
       (5, 'Smart', 'Fortwo', 'K-OM-282', 2019, 'Kleinwagen', 'Hybrid', '2021-01-05'),
       (6, 'Smart', 'Fortwo', 'K-OM-283', 2019, 'Kleinwagen', 'Hybrid', '2021-01-05');

-- Tabellenstruktur Mietauto zu Auto Tabelle
CREATE TABLE t_Mietdatum_zu_Auto
(
    Auto_ID               INTEGER,
    Mietbeginn_Datum      DATE,
    Mietbeginn_Uhrzeit    TIME,
    gefahrene_Kilometer   INTEGER,
    Kilometerstand_vorher INTEGER,
    Mitarbeiter_ID        INTEGER,
    Mietdauer_in_h        INTEGER,
    FOREIGN KEY (Auto_ID) REFERENCES t_Auto (Auto_ID),
    FOREIGN KEY (Mitarbeiter_ID) REFERENCES t_Personaldaten (Persnr)
);

-- Daten zu Tabelle t_Mietauto_zu_Auto
INSERT INTO t_Mietdatum_zu_Auto (Auto_ID, Mietbeginn_Datum, Mietbeginn_Uhrzeit, gefahrene_Kilometer,
                                 Kilometerstand_vorher, Mitarbeiter_ID, Mietdauer_in_h)
VALUES (1, '2021-08-02', '09:00', 27, 11885, 47, 3),
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