-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Gegenereerd op: 03 dec 2018 om 08:48
-- Serverversie: 5.7.21
-- PHP-versie: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mydb`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `artiest`
--

DROP TABLE IF EXISTS `artiest`;
CREATE TABLE IF NOT EXISTS `artiest` (
  `artiest_id` int(10) NOT NULL AUTO_INCREMENT,
  `naam` varchar(100) NOT NULL,
  `beschrijving` text NOT NULL,
  `geluidsfragment` varchar(255) DEFAULT NULL,
  `videofragment` varchar(255) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `doorverwijzing` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`artiest_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `artiest`
--

INSERT INTO `artiest` (`artiest_id`, `naam`, `beschrijving`, `geluidsfragment`, `videofragment`, `foto`, `doorverwijzing`) VALUES
(1, 'Micheal Jackson', 'Test omschrijving', 'emp.mp3', 'Video.mp4', 'michealjackson.png', 'www.michealjackson.com'),
(2, 'Katy Perry', 'Test Mens', 'geluid.mp3', 'video.mp4', 'katy.png', 'www.katyperry.com'),
(3, 'Carly Rae Jepsen', 'Test persoon', 'Geluiden.mp3', 'videos.mp4', 'carly.png', 'www.carlyraejepsen.com');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `gebruiker`
--

DROP TABLE IF EXISTS `gebruiker`;
CREATE TABLE IF NOT EXISTS `gebruiker` (
  `gebruiker_id` int(10) NOT NULL AUTO_INCREMENT,
  `naam` varbinary(255) NOT NULL,
  `tussenvoegsel` varbinary(255) DEFAULT NULL,
  `achternaam` varbinary(255) NOT NULL,
  `adres` varbinary(255) DEFAULT NULL,
  `huisnummer` varbinary(255) DEFAULT NULL,
  `postcode` varbinary(255) DEFAULT NULL,
  `plaats` varbinary(255) NOT NULL,
  `land` varbinary(255) NOT NULL,
  `email` varbinary(255) NOT NULL,
  `tel` varbinary(255) DEFAULT NULL,
  `rol` varchar(45) NOT NULL,
  `wachtwoord` varchar(255) NOT NULL,
  `mailinglist` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`gebruiker_id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `FK_Gebruiker_rol_idx` (`rol`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `gebruiker`
--

INSERT INTO `gebruiker` (`gebruiker_id`, `naam`, `tussenvoegsel`, `achternaam`, `adres`, `huisnummer`, `postcode`, `plaats`, `land`, `email`, `tel`, `rol`, `wachtwoord`, `mailinglist`) VALUES
(2, 0x48656e6b, '', 0x5a616c656e, 0x426c6f656d656e737472616174, 0x3536, 0x323436315444, 0x54657220416172, 0x4e656465726c616e64, 0x68656e6b7a616c656e40676d61696c2e636f6d, 0x31323334353637383930, '1', '$2a$11$7FqvevAM4jCM2rHqELk0SuNBE9BXd69iSF1aEUQgmRSt6czT6LvAS', NULL);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `optreden`
--

DROP TABLE IF EXISTS `optreden`;
CREATE TABLE IF NOT EXISTS `optreden` (
  `optreden_id` int(10) NOT NULL AUTO_INCREMENT,
  `artiest_id` int(10) NOT NULL,
  `typeOptreden` varchar(45) NOT NULL,
  `zaal` varchar(100) NOT NULL,
  `begin` datetime NOT NULL,
  `prijs` double NOT NULL,
  `eind` datetime NOT NULL,
  `ticket` int(11) NOT NULL,
  PRIMARY KEY (`optreden_id`),
  KEY `FK_Optreden_Artiest_idx` (`artiest_id`),
  KEY `FK_Optreden_Zaal_idx` (`zaal`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `optreden`
--

INSERT INTO `optreden` (`optreden_id`, `artiest_id`, `typeOptreden`, `zaal`, `begin`, `prijs`, `eind`, `ticket`) VALUES
(1, 1, 'Dansfeest', 'Zaal_1', '2018-11-17 00:00:00', 19, '2018-11-18 00:00:00', 150),
(2, 3, 'raveFeest', 'Zaal_2', '2018-11-16 00:00:00', 20.5, '2018-11-22 00:00:00', 100),
(3, 2, 'rockFeest', 'Zaal_3', '2018-11-29 00:00:00', 50, '2018-11-30 00:00:00', 50);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `persbericht`
--

DROP TABLE IF EXISTS `persbericht`;
CREATE TABLE IF NOT EXISTS `persbericht` (
  `persbericht_id` int(10) NOT NULL AUTO_INCREMENT,
  `berichtTitel` varchar(45) NOT NULL,
  `bericht` text NOT NULL,
  `website` varchar(255) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `geluidsfragment` varchar(255) DEFAULT NULL,
  `videofragment` varchar(255) DEFAULT NULL,
  `auteur` varchar(45) NOT NULL,
  `datum` datetime NOT NULL,
  PRIMARY KEY (`persbericht_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `persbericht`
--

INSERT INTO `persbericht` (`persbericht_id`, `berichtTitel`, `bericht`, `website`, `foto`, `geluidsfragment`, `videofragment`, `auteur`, `datum`) VALUES
(1, 'Ik ben een titel', 'Ik ben een test bericht', 'www.test.nl', 'foto.png', 'geluid.mp3', 'video.mp4', 'AuteurMeneer', '2018-11-16 00:00:00');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `reservering`
--

DROP TABLE IF EXISTS `reservering`;
CREATE TABLE IF NOT EXISTS `reservering` (
  `reservering_id` int(10) NOT NULL AUTO_INCREMENT,
  `gebruiker_id` int(10) NOT NULL,
  `optreden_id` int(10) NOT NULL,
  `res_status` varchar(45) NOT NULL,
  `datum` datetime NOT NULL,
  PRIMARY KEY (`reservering_id`),
  KEY `FK_Reservering_Gebruiker_idx` (`gebruiker_id`),
  KEY `FK_Reservering_Optreden_idx` (`optreden_id`),
  KEY `FK_Reservering_Status_idx` (`res_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `reserveringstatus`
--

DROP TABLE IF EXISTS `reserveringstatus`;
CREATE TABLE IF NOT EXISTS `reserveringstatus` (
  `status_id` varchar(45) NOT NULL,
  `beschrijving` varchar(255) NOT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `reserveringstatus`
--

INSERT INTO `reserveringstatus` (`status_id`, `beschrijving`) VALUES
('Opgehaald', 'De ticket is opgehaald'),
('Ophalen', 'De ticket ligt klaar en mag opgehaald worden'),
('Reviewing', 'Het product is in review');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `rol`
--

DROP TABLE IF EXISTS `rol`;
CREATE TABLE IF NOT EXISTS `rol` (
  `rol_id` varchar(45) NOT NULL,
  `beschrijving` varchar(255) NOT NULL,
  PRIMARY KEY (`rol_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `rol`
--

INSERT INTO `rol` (`rol_id`, `beschrijving`) VALUES
('1', 'Gebruiker'),
('2', 'Moderator');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `ticket`
--

DROP TABLE IF EXISTS `ticket`;
CREATE TABLE IF NOT EXISTS `ticket` (
  `ticket_id` int(10) NOT NULL AUTO_INCREMENT,
  `optreden_id` int(10) NOT NULL,
  PRIMARY KEY (`ticket_id`),
  KEY `Ticket_OptredenId_idx` (`optreden_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `ticket`
--

INSERT INTO `ticket` (`ticket_id`, `optreden_id`) VALUES
(1, 1),
(2, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `zaal`
--

DROP TABLE IF EXISTS `zaal`;
CREATE TABLE IF NOT EXISTS `zaal` (
  `zaal_id` varchar(100) NOT NULL,
  `plaatsen` int(10) NOT NULL,
  PRIMARY KEY (`zaal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `zaal`
--

INSERT INTO `zaal` (`zaal_id`, `plaatsen`) VALUES
('Zaal_1', 150),
('Zaal_2', 100),
('Zaal_3', 50);

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `gebruiker`
--
ALTER TABLE `gebruiker`
  ADD CONSTRAINT `FK_Gebruiker_rol` FOREIGN KEY (`rol`) REFERENCES `rol` (`rol_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Beperkingen voor tabel `optreden`
--
ALTER TABLE `optreden`
  ADD CONSTRAINT `FK_Optreden_Artiest` FOREIGN KEY (`artiest_id`) REFERENCES `artiest` (`artiest_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Optreden_Zaal` FOREIGN KEY (`zaal`) REFERENCES `zaal` (`zaal_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Beperkingen voor tabel `reservering`
--
ALTER TABLE `reservering`
  ADD CONSTRAINT `FK_Reservering_Gebruiker` FOREIGN KEY (`gebruiker_id`) REFERENCES `gebruiker` (`gebruiker_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Reservering_Optreden` FOREIGN KEY (`optreden_id`) REFERENCES `optreden` (`optreden_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Reservering_Status` FOREIGN KEY (`res_status`) REFERENCES `reserveringstatus` (`status_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Beperkingen voor tabel `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `FK_Ticket_OptredenId` FOREIGN KEY (`optreden_id`) REFERENCES `optreden` (`optreden_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
