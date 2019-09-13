-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 13, 2019 at 02:51 AM
-- Server version: 5.7.23
-- PHP Version: 7.0.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `socheat_borey`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_branch_type`
--

DROP TABLE IF EXISTS `tbl_branch_type`;
CREATE TABLE IF NOT EXISTS `tbl_branch_type` (
  `bra_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `bra_nm` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bra_des` text COLLATE utf8_unicode_ci,
  `regDt` datetime DEFAULT NULL,
  `upDt` datetime DEFAULT NULL,
  `useYn` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `regUsr` int(11) DEFAULT NULL,
  `upUsr` int(11) DEFAULT NULL,
  `com_id` int(11) DEFAULT NULL,
  `bra_nm_kh` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`bra_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_branch_type`
--

INSERT INTO `tbl_branch_type` (`bra_type_id`, `bra_nm`, `bra_des`, `regDt`, `upDt`, `useYn`, `regUsr`, `upUsr`, `com_id`, `bra_nm_kh`) VALUES
(1, 'Sub branch', NULL, '2018-08-24 03:58:01', NULL, NULL, NULL, NULL, NULL, 'អនុសាខា'),
(2, 'Head branch', NULL, '2018-08-24 03:57:37', NULL, NULL, NULL, NULL, NULL, 'សាខាធំ');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
