-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 04, 2020 at 04:10 PM
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
-- Database: `borey_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_supplier`
--

DROP TABLE IF EXISTS `tbl_supplier`;
CREATE TABLE IF NOT EXISTS `tbl_supplier` (
  `sup_id` int(11) NOT NULL AUTO_INCREMENT,
  `sup_nm` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `sup_phone` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sup_email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sup_addr` text COLLATE utf8_unicode_ci,
  `sup_des` text COLLATE utf8_unicode_ci,
  `sup_cont` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `regDt` datetime DEFAULT NULL,
  `upDt` datetime DEFAULT NULL,
  `useYn` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `regUsr` int(11) NOT NULL,
  `upUsr` int(11) NOT NULL,
  `com_id` int(11) NOT NULL,
  `sup_nm_kh` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`sup_id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_supplier`
--

INSERT INTO `tbl_supplier` (`sup_id`, `sup_nm`, `sup_phone`, `sup_email`, `sup_addr`, `sup_des`, `sup_cont`, `regDt`, `upDt`, `useYn`, `regUsr`, `upUsr`, `com_id`, `sup_nm_kh`) VALUES
(1, 'Garden 168', '010234567', '', 'Phnom Penh', 'A', NULL, '2019-09-13 16:26:22', '2019-09-15 00:07:48', 'Y', 2, 0, 1, 'សួនផ្ការ១៦៨'),
(2, 'None', '0', '', '0', '', NULL, '2019-12-27 13:38:03', NULL, 'Y', 3, 0, 1, 'None'),
(3, 'ចែប៉ុច', '0', '', 'ភ្នំពេញ', '', NULL, '2020-01-08 10:25:07', NULL, 'Y', 3, 0, 1, 'ចែប៉ុច'),
(4, 'Multi Solution Cambodia', '0', '', '0', '', NULL, '2020-01-13 14:59:57', '2020-01-13 15:00:13', 'Y', 3, 0, 1, 'Multi Solution Cambodia'),
(5, 'SOKKHA LAW OFFICE', '0', '', 'ក្បែរវិមានឯករាជ្យ', '', NULL, '2020-01-13 15:15:23', NULL, 'Y', 3, 0, 1, 'SOKKHA LAW OFFICE'),
(6, 'ឌី សុខលាង', '0', '', 'ភ្នំពេញ', '', NULL, '2020-01-13 16:42:27', NULL, 'Y', 3, 0, 1, 'ឌី សុខលាង'),
(7, 'LH Supply', '0', '', 'ភ្នំពេញ', '', NULL, '2020-01-13 16:47:33', NULL, 'Y', 3, 0, 1, 'LH Supply'),
(8, 'ថេត ស៊ីដែត', '0', '', 'ភ្នំពេញ', '', NULL, '2020-01-13 16:51:49', NULL, 'Y', 3, 0, 1, 'ថេត ស៊ីដែត'),
(9, 'TC Surveying', '0', '', 'ភ្នំពេញ', '', NULL, '2020-01-14 14:27:18', NULL, 'Y', 3, 0, 1, 'TC Surveying'),
(10, 'CK', '', '', 'PP', '', NULL, '2020-02-01 14:35:34', NULL, 'Y', 2, 0, 1, 'CK'),
(11, 'Dala Computer', '', '', 'PP', '', NULL, '2020-02-01 14:36:02', NULL, 'Y', 2, 0, 1, 'Dala Computer'),
(12, 'Multi Solution cambodia', '', '', '', '', NULL, '2020-02-01 14:38:10', '2020-02-02 09:15:44', 'N', 2, 0, 1, 'Multi Solution cambodia'),
(13, 'SOKHA LAW OFFICE', '', '', '', '', NULL, '2020-02-01 14:38:52', NULL, 'Y', 2, 0, 1, 'SOKHA LAW OFFICE'),
(14, 'គ្រីលីម', '', '', '', '', NULL, '2020-02-01 14:39:25', NULL, 'Y', 2, 0, 1, 'គ្រីលីម'),
(15, 'ឆេង​គង់', '', '', '', '', NULL, '2020-02-01 14:40:05', NULL, 'Y', 2, 0, 1, 'ឆេង​គង់'),
(16, 'ជា ចំរុង', '', '', '', '', NULL, '2020-02-01 14:40:34', NULL, 'Y', 2, 0, 1, 'ជា ចំរុង'),
(17, 'ដេប៉ូតេលា ឆេកូ', '', '', '', '', NULL, '2020-02-01 14:40:57', NULL, 'Y', 2, 0, 1, 'ដេប៉ូតេលា ឆេកូ'),
(18, 'មាស​ សុភិន', '', '', '', '', NULL, '2020-02-01 14:41:23', NULL, 'Y', 2, 0, 1, 'មាស​ សុភិន'),
(19, 'លី ស៊ីវលីង', '', '', '', '', NULL, '2020-02-01 14:41:45', NULL, 'Y', 2, 0, 1, 'លី ស៊ីវលីង'),
(20, 'វិសាខា', '', '', '', '', NULL, '2020-02-01 14:42:06', NULL, 'Y', 2, 0, 1, 'វិសាខា'),
(21, 'សាង វាសនា', '', '', '', '', NULL, '2020-02-01 14:42:30', NULL, 'Y', 2, 0, 1, 'សាង វាសនា'),
(22, 'BAR MOIN CHAIR STATION', '', '', '', '', NULL, '2020-02-01 14:45:59', NULL, 'Y', 2, 0, 1, 'BAR MOIN CHAIR STATION'),
(23, 'Global umbrellas', '', '', '', '', NULL, '2020-02-01 14:46:22', NULL, 'Y', 2, 0, 1, 'Global umbrellas'),
(24, 'IBC', '', '', '', '', NULL, '2020-02-01 14:47:24', NULL, 'Y', 2, 0, 1, 'IBC'),
(25, 'iBC International Book', '', '', '', '', NULL, '2020-02-01 14:47:45', NULL, 'Y', 2, 0, 1, 'iBC International Book'),
(26, 'KSL Printer', '', '', '', '', NULL, '2020-02-01 14:48:18', NULL, 'Y', 2, 0, 1, 'KSL Printer'),
(27, 'LH Supply', '', '', '', '', NULL, '2020-02-01 14:48:55', '2020-02-01 15:34:43', 'N', 2, 0, 1, 'LH Supply'),
(28, 'Luky', '', '', '', '', NULL, '2020-02-01 14:49:19', NULL, 'Y', 2, 0, 1, 'Luky'),
(29, 'LY LEANGKIM DIGITAL PRINTING', '', '', '', '', NULL, '2020-02-01 14:49:44', NULL, 'Y', 2, 0, 1, 'LY LEANGKIM DIGITAL PRINTING'),
(30, 'Material', '', '', '', '', NULL, '2020-02-01 14:50:22', NULL, 'Y', 2, 0, 1, 'Material'),
(31, 'MSC', '', '', '', '', NULL, '2020-02-01 14:50:41', NULL, 'Y', 2, 0, 1, 'MSC'),
(32, 'Property Area Asai', '', '', '', '', NULL, '2020-02-01 14:51:07', NULL, 'Y', 2, 0, 1, 'Property Area Asai'),
(33, 'Psar Prekchrey', '', '', '', '', NULL, '2020-02-01 14:51:57', NULL, 'Y', 2, 0, 1, 'Psar Prekchrey'),
(34, 'S N Service', '', '', '', '', NULL, '2020-02-01 14:52:31', NULL, 'Y', 2, 0, 1, 'S N Service'),
(35, 'Station Total Baku', '', '', '', '', NULL, '2020-02-01 14:53:19', NULL, 'Y', 2, 0, 1, 'Station Total Baku'),
(36, 'Tax depart ment', '', '', '', '', NULL, '2020-02-01 14:53:47', NULL, 'Y', 2, 0, 1, 'Tax depart ment'),
(37, 'TC Surveying', '', '', '', '', NULL, '2020-02-01 14:54:18', '2020-02-01 15:36:10', 'N', 2, 0, 1, 'TC Surveying'),
(38, 'Tela', '', '', '', '', NULL, '2020-02-01 14:54:36', NULL, 'Y', 2, 0, 1, 'Tela'),
(39, 'Tiger Art and Advertising', '', '', '', '', NULL, '2020-02-01 14:54:59', NULL, 'Y', 2, 0, 1, 'Tiger Art and Advertising'),
(40, 'កន្ត្រៃទេព កាត់ដែរ', '', '', '', '', NULL, '2020-02-01 14:55:19', NULL, 'Y', 2, 0, 1, 'កន្ត្រៃទេព កាត់ដែរ'),
(41, 'ជុំ សុផៃ', '', '', '', '', NULL, '2020-02-01 14:56:16', NULL, 'Y', 2, 0, 1, 'ជុំ សុផៃ'),
(42, 'ឌី សុខលាង', '', '', '', '', NULL, '2020-02-01 14:56:36', '2020-02-01 15:33:49', 'N', 2, 0, 1, 'ឌី សុខលាង'),
(43, 'តាំង យីន', '', '', '', '', NULL, '2020-02-01 14:57:00', NULL, 'Y', 2, 0, 1, 'តាំង យីន'),
(44, 'តាំង សាំងហាក់', '', '', '', '', NULL, '2020-02-01 14:57:19', NULL, 'Y', 2, 0, 1, 'តាំង សាំងហាក់'),
(45, 'ថេត ស៊ីដែត', '', '', '', '', NULL, '2020-02-01 14:57:41', '2020-02-01 15:35:22', 'N', 2, 0, 1, 'ថេត ស៊ីដែត'),
(46, 'ពិភពឆ័ត្រ', '', '', '', '', NULL, '2020-02-01 14:58:05', NULL, 'Y', 2, 0, 1, 'ពិភពឆ័ត្រ'),
(47, 'ពិភពសាច់អាំង១', '', '', '', '', NULL, '2020-02-01 14:58:24', NULL, 'Y', 2, 0, 1, 'ពិភពសាច់អាំង១'),
(48, 'លាភ ហេង', '', '', '', '', NULL, '2020-02-01 14:59:39', NULL, 'Y', 2, 0, 1, 'លាភ ហេង'),
(49, 'វណ្ណធា វាំងនន', '', '', '', '', NULL, '2020-02-01 15:00:01', NULL, 'Y', 2, 0, 1, 'វណ្ណធា វាំងនន'),
(50, 'សេង ម៉េងហ៊ាង', '', '', '', '', NULL, '2020-02-01 15:00:23', NULL, 'Y', 2, 0, 1, 'សេង ម៉េងហ៊ាង'),
(51, 'ឡិន​សិទ្ធារី', '', '', '', '', NULL, '2020-02-01 15:00:47', NULL, 'Y', 2, 0, 1, 'ឡិន​សិទ្ធារី'),
(52, 'អគ្គនាយកដ្ឋានពន្ធដារ', '', '', '', '', NULL, '2020-02-01 15:00:59', NULL, 'Y', 2, 0, 1, 'អគ្គនាយកដ្ឋានពន្ធដារ'),
(53, 'លី​ ស៊ីវលីង', '', '', '', '', NULL, '2020-02-01 15:28:20', NULL, 'Y', 2, 0, 1, 'លី​ ស៊ីវលីង');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
