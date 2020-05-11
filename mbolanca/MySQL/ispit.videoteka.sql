
-- Dumping database structure for videoteka
DROP DATABASE IF EXISTS `videoteka`;
CREATE DATABASE IF NOT EXISTS `videoteka` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `videoteka`;

-- Dumping structure for table videoteka.clan
DROP TABLE IF EXISTS `clan`;
CREATE TABLE IF NOT EXISTS `clan` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ime` varchar(50) NOT NULL DEFAULT '0',
  `prezime` varchar(50) NOT NULL DEFAULT '0',
  `kontakt` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table videoteka.clan: ~3 rows (approximately)
/*!40000 ALTER TABLE `clan` DISABLE KEYS */;
INSERT INTO `clan` (`id`, `ime`, `prezime`, `kontakt`) VALUES
	(1, 'Mato', 'Neretljak', '555212'),
	(2, 'Dragan', 'Blatnjak', '555323'),
	(3, 'Vlatko', 'Đolonga', '555402');
/*!40000 ALTER TABLE `clan` ENABLE KEYS */;

-- Dumping structure for table videoteka.film
DROP TABLE IF EXISTS `film`;
CREATE TABLE IF NOT EXISTS `film` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `naziv` varchar(50) NOT NULL DEFAULT '0',
  `redatelj` varchar(50) DEFAULT '0',
  `god` year(4) DEFAULT NULL,
  `trajanje` time DEFAULT '00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table videoteka.film: ~3 rows (approximately)
/*!40000 ALTER TABLE `film` DISABLE KEYS */;
INSERT INTO `film` (`id`, `naziv`, `redatelj`, `god`, `trajanje`) VALUES
	(1, 'Citizen Kane', 'Orson Welles', '1941', '01:59:00'),
	(2, 'Dr.Strangelove', 'Stanley Kubrick', '1964', '01:35:00'),
	(3, 'The Elephant Man', 'David Lynch', '1980', '02:04:00');
/*!40000 ALTER TABLE `film` ENABLE KEYS */;

-- Dumping structure for table videoteka.posudba
DROP TABLE IF EXISTS `posudba`;
CREATE TABLE IF NOT EXISTS `posudba` (
  `clan_id` int(10) unsigned NOT NULL,
  `film_id` int(10) unsigned NOT NULL,
  `dat_posudbe` date NOT NULL,
  `dat_povrata` date DEFAULT NULL,
  KEY `FK_posudba_clan` (`clan_id`),
  KEY `FK_posudba_film` (`film_id`),
  CONSTRAINT `FK_posudba_clan` FOREIGN KEY (`clan_id`) REFERENCES `clan` (`id`),
  CONSTRAINT `FK_posudba_film` FOREIGN KEY (`film_id`) REFERENCES `film` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table videoteka.posudba: ~3 rows (approximately)
/*!40000 ALTER TABLE `posudba` DISABLE KEYS */;
INSERT INTO `posudba` (`clan_id`, `film_id`, `dat_posudbe`, `dat_povrata`) VALUES
	(1, 1, '2020-04-25', '2020-04-27'),
	(3, 2, '2020-04-28', NULL),
	(2, 3, '2020-04-27', NULL);
/*!40000 ALTER TABLE `posudba` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;


-- SQL upit za dohvaćanje podataka o članovima koji nisu vratili film, kao i naziv tog filma.

SELECT

CONCAT ( clan.ime, " " , clan.prezime) AS "Ime i Prezime",
film.naziv AS "Naziv Filma",
posudba.dat_posudbe AS "Datum posudbe",
posudba.dat_povrata AS "Datum povrata"

FROM clan INNER JOIN posudba ON clan.id=posudba.clan_id
INNER JOIN film ON posudba.film_id=film.id

WHERE posudba.dat_povrata IS NULL