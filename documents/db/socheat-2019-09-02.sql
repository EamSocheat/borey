-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 01, 2019 at 05:13 PM
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
-- Table structure for table `tbl_branch`
--

DROP TABLE IF EXISTS `tbl_branch`;
CREATE TABLE IF NOT EXISTS `tbl_branch` (
  `bra_id` int(11) NOT NULL AUTO_INCREMENT,
  `bra_nm` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `bra_phone1` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bra_phone2` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bra_email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bra_addr` text COLLATE utf8_unicode_ci,
  `bra_des` text COLLATE utf8_unicode_ci,
  `regDt` datetime DEFAULT NULL,
  `upDt` datetime DEFAULT NULL,
  `useYn` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `regUsr` int(11) NOT NULL,
  `upUsr` int(11) NOT NULL,
  `bra_type_id` int(11) NOT NULL,
  `com_id` int(11) NOT NULL,
  `bra_nm_kh` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`bra_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_branch`
--

INSERT INTO `tbl_branch` (`bra_id`, `bra_nm`, `bra_phone1`, `bra_phone2`, `bra_email`, `bra_addr`, `bra_des`, `regDt`, `upDt`, `useYn`, `regUsr`, `upUsr`, `bra_type_id`, `com_id`, `bra_nm_kh`) VALUES
(1, 'Tulip DNUUUUU', '0123467822', '0123456789', 'eamsocheat@gmail.com', 'AAA', 'AAA', '2018-09-15 09:04:07', '2018-09-17 04:49:04', 'N', 5, 5, 2, 5, 'តេស'),
(2, 'Tulip AOEN', '0123467822', '0123456789', 'eamsocheat@gmail.com', '', '', '2018-09-13 08:46:37', '2018-10-23 07:11:12', 'N', 5, 5, 2, 5, 'តេស១'),
(3, '2333pppppp', '2', '2', '', '2', '2', '2018-09-15 09:09:22', '2018-10-25 04:45:02', 'Y', 5, 5, 1, 5, '2'),
(4, '3', '3', '3', '', '3', '3', '2018-09-15 08:51:43', '2018-10-25 04:46:49', 'N', 5, 5, 1, 5, '3'),
(5, '4u', '4444444', '', '', '', '', '2018-09-15 08:08:11', NULL, 'Y', 5, 5, 1, 5, '4'),
(6, '5', '5', '', '', '', '', '2018-09-13 08:47:19', NULL, 'Y', 5, 0, 1, 5, '5'),
(7, '6', '6', '', '', '', '', '2018-09-15 09:03:50', NULL, 'Y', 5, 5, 1, 5, '6'),
(8, '7up', '7', '7', '', 'AA', 'AAA', '2018-09-15 09:11:28', '2018-09-17 05:01:28', 'N', 5, 5, 1, 5, '7'),
(9, '8', '8', '', '', '', '', '2018-09-13 08:47:39', NULL, 'Y', 5, 0, 1, 5, '8'),
(10, '9', '9', '', '', '', '', '2018-09-13 08:47:44', '2018-10-25 04:47:44', 'N', 5, 5, 1, 5, '9'),
(11, '1155', '11', '11', '', '', '', '2018-09-13 08:47:52', '2018-10-23 07:22:14', 'Y', 5, 5, 1, 5, '1'),
(12, '22', '22', '22', '', '', '', '2018-09-13 08:47:58', NULL, 'Y', 5, 0, 1, 5, '22'),
(13, '33llllllll', '33', '3333333', '', '', '', '2018-09-13 08:48:04', '2018-10-25 04:45:37', 'Y', 5, 5, 1, 5, '33'),
(14, '4444', '444', '44', '', '', '', '2018-09-13 08:48:11', '2018-09-17 04:52:25', 'N', 5, 5, 1, 5, '44'),
(15, '55', '555555555', '5', '', '', '', '2018-09-13 08:48:17', '2018-09-17 04:52:25', 'N', 5, 5, 1, 5, '55'),
(16, 'Tulip DN', '01234678223333', '0123456789', 'eamsocheat@gmail.com', 'AAA', 'AAA', '2018-09-15 04:55:41', NULL, 'Y', 5, 0, 2, 5, 'តេស'),
(17, 'Tulip DNAA', '0123467822', '0123456789', 'eamsocheat@gmail.com', 'AAA', 'AAA', '2018-09-15 04:59:04', '2018-09-17 05:01:38', 'N', 5, 5, 2, 5, 'តេស'),
(18, '33WWWWW', '3', '33', '', '33', '33', '2018-10-22 08:32:55', '2018-10-23 02:46:51', 'Y', 5, 5, 1, 5, '333'),
(19, 'ttt99999', '0123467822', '0123456789', '', '', '', '2018-10-22 08:45:00', '2018-10-23 03:01:56', 'Y', 5, 5, 1, 5, 'AAAAAAAAAA'),
(20, '111RRRRRRRRRR', '111', '111', '', '', '', '2018-10-23 04:40:15', '2018-10-25 04:46:07', 'Y', 5, 5, 1, 5, '111'),
(21, 'a', '555555555', '', '', '', '', '2018-10-23 04:44:08', '2018-10-23 07:33:23', 'Y', 5, 5, 1, 5, 'AAA'),
(22, '5555', '555', '555', '', '', '', '2018-10-23 06:56:24', '2018-10-25 04:47:53', 'N', 5, 5, 1, 5, '5555'),
(23, 'ttttttyyy', '0987654321', '', '', '', '', '2018-10-23 06:57:06', NULL, 'Y', 5, 0, 1, 5, 'yyyy'),
(24, '99999', '9999', '99999', '', '', '', '2018-10-23 06:58:36', NULL, 'Y', 5, 0, 1, 5, '99999'),
(25, 'iiiii', '0987654321', '', '', '', '', '2018-10-23 07:05:35', NULL, 'Y', 5, 0, 1, 5, 'iiii'),
(26, 'uuu', '899999', '99', '', '', '', '2018-10-23 07:33:05', NULL, 'Y', 5, 0, 1, 5, 'uuu'),
(27, 'ww', '111', '1111', '', '', '', '2019-01-06 07:06:14', NULL, 'Y', 5, 0, 1, 5, 'ww'),
(28, 'Galaxy11', '010527752', '010527752', '', '', '', '2019-07-15 02:14:38', '2019-07-22 07:01:50', 'Y', 6, 6, 1, 9, 'កាឡាក់ស៊ី១១'),
(29, 'Galaxy11A', '០១០១២៣៤៥៦៧៨', '០១០១២៣៤៥៦៧៨', '', '', '', '2019-07-22 07:16:42', NULL, 'Y', 6, 0, 1, 9, 'កាឡាក់ស៊ី១១-អា');

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

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

DROP TABLE IF EXISTS `tbl_category`;
CREATE TABLE IF NOT EXISTS `tbl_category` (
  `cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_nm` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `cat_nm_kh` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cat_des` text COLLATE utf8_unicode_ci,
  `regDt` datetime DEFAULT NULL,
  `upDt` datetime DEFAULT NULL,
  `useYn` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `upUsr` int(11) NOT NULL,
  `regUsr` int(11) NOT NULL,
  `com_id` int(11) NOT NULL,
  `cat_photo` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`cat_id`, `cat_nm`, `cat_nm_kh`, `cat_des`, `regDt`, `upDt`, `useYn`, `upUsr`, `regUsr`, `com_id`, `cat_photo`) VALUES
(1, 'aaaaa', 'aaaaaaa', 'aaaaaaaa', '2019-07-11 09:02:20', NULL, 'Y', 0, 6, 9, ''),
(2, 'Villa', 'វីឡា', '', '2019-07-20 06:12:27', NULL, 'Y', 0, 6, 9, ''),
(3, 'ttt', 'ttt', 'tttt', '2019-08-26 17:59:27', NULL, 'Y', 0, 6, 9, '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_commission`
--

DROP TABLE IF EXISTS `tbl_commission`;
CREATE TABLE IF NOT EXISTS `tbl_commission` (
  `commi_id` int(11) NOT NULL AUTO_INCREMENT,
  `commi_amt` double DEFAULT NULL,
  `commi_type` varchar(1) DEFAULT NULL,
  `commi_is_approve` varchar(1) DEFAULT NULL,
  `commi_approve_date` date DEFAULT NULL,
  `commi_approve_des` varchar(500) DEFAULT NULL,
  `sell_id` int(11) DEFAULT NULL,
  `regDt` datetime DEFAULT NULL,
  `upDt` datetime DEFAULT NULL,
  `useYn` varchar(1) DEFAULT NULL,
  `regUsr` int(11) DEFAULT NULL,
  `upUsr` int(11) DEFAULT NULL,
  `com_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`commi_id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_commission`
--

INSERT INTO `tbl_commission` (`commi_id`, `commi_amt`, `commi_type`, `commi_is_approve`, `commi_approve_date`, `commi_approve_des`, `sell_id`, `regDt`, `upDt`, `useYn`, `regUsr`, `upUsr`, `com_id`) VALUES
(1, 400, 'S', NULL, NULL, NULL, 17, '2019-08-27 20:26:00', NULL, 'Y', 6, NULL, 9),
(2, 80, 'A', NULL, NULL, NULL, 17, '2019-08-27 20:26:00', NULL, 'Y', 6, NULL, 9),
(3, 400, 'S', NULL, NULL, NULL, 18, '2019-08-27 20:29:20', NULL, 'Y', 6, NULL, 9),
(4, 80, 'A', NULL, NULL, NULL, 18, '2019-08-27 20:29:20', NULL, 'Y', 6, NULL, 9),
(5, 400, 'S', NULL, NULL, NULL, 19, '2019-08-27 22:15:31', NULL, 'Y', 6, NULL, 9),
(6, 80, 'A', NULL, NULL, NULL, 19, '2019-08-27 22:15:31', NULL, 'Y', 6, NULL, 9),
(7, 400, 'S', NULL, NULL, NULL, 20, '2019-08-31 18:19:05', NULL, 'Y', 6, NULL, 9),
(8, 80, 'A', NULL, NULL, NULL, 20, '2019-08-31 18:19:05', NULL, 'Y', 6, NULL, 9),
(9, 400, 'S', NULL, NULL, NULL, 21, '2019-09-01 11:07:21', NULL, 'Y', 6, NULL, 9),
(10, 80, 'A', NULL, NULL, NULL, 21, '2019-09-01 11:07:21', NULL, 'Y', 6, NULL, 9),
(11, 400, 'S', NULL, NULL, NULL, 22, '2019-09-01 11:09:51', NULL, 'Y', 6, NULL, 9),
(12, 80, 'A', NULL, NULL, NULL, 22, '2019-09-01 11:09:51', NULL, 'Y', 6, NULL, 9),
(13, 400, 'S', NULL, NULL, NULL, 23, '2019-09-01 11:17:05', NULL, 'Y', 6, NULL, 9),
(14, 80, 'A', NULL, NULL, NULL, 23, '2019-09-01 11:17:05', NULL, 'Y', 6, NULL, 9),
(15, 400, 'S', NULL, NULL, NULL, 24, '2019-09-01 11:22:50', NULL, 'Y', 6, NULL, 9),
(16, 80, 'A', NULL, NULL, NULL, 24, '2019-09-01 11:22:50', NULL, 'Y', 6, NULL, 9),
(17, 400, 'S', NULL, NULL, NULL, 25, '2019-09-01 11:52:22', NULL, 'Y', 6, NULL, 9),
(18, 80, 'A', NULL, NULL, NULL, 25, '2019-09-01 11:52:22', NULL, 'Y', 6, NULL, 9),
(19, 400, 'S', NULL, NULL, NULL, 26, '2019-09-01 13:32:34', NULL, 'Y', 6, NULL, 9),
(20, 80, 'A', NULL, NULL, NULL, 26, '2019-09-01 13:32:34', NULL, 'Y', 6, NULL, 9),
(21, 400, 'S', NULL, NULL, NULL, 27, '2019-09-01 13:33:53', NULL, 'Y', 6, NULL, 9),
(22, 80, 'A', NULL, NULL, NULL, 27, '2019-09-01 13:33:53', NULL, 'Y', 6, NULL, 9),
(23, 300, 'S', NULL, NULL, NULL, 28, '2019-09-01 14:07:18', NULL, 'Y', 6, NULL, 9),
(24, 60, 'A', NULL, NULL, NULL, 28, '2019-09-01 14:07:18', NULL, 'Y', 6, NULL, 9),
(25, 300, 'S', NULL, NULL, NULL, 29, '2019-09-01 14:44:12', NULL, 'Y', 6, NULL, 9),
(26, 60, 'A', NULL, NULL, NULL, 29, '2019-09-01 14:44:12', NULL, 'Y', 6, NULL, 9),
(27, 400, 'S', NULL, NULL, NULL, 30, '2019-09-01 17:04:03', NULL, 'Y', 6, NULL, 9),
(28, 80, 'A', NULL, NULL, NULL, 30, '2019-09-01 17:04:03', NULL, 'Y', 6, NULL, 9),
(29, 400, 'S', NULL, NULL, NULL, 31, '2019-09-01 17:07:45', NULL, 'Y', 6, NULL, 9),
(30, 80, 'A', NULL, NULL, NULL, 31, '2019-09-01 17:07:45', NULL, 'Y', 6, NULL, 9);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_commission_setting`
--

DROP TABLE IF EXISTS `tbl_commission_setting`;
CREATE TABLE IF NOT EXISTS `tbl_commission_setting` (
  `comset_id` int(11) NOT NULL AUTO_INCREMENT,
  `comset_salary_yn` varchar(1) DEFAULT NULL,
  `comset_commi_yn` varchar(1) DEFAULT NULL,
  `regDt` datetime DEFAULT NULL,
  `upDt` datetime DEFAULT NULL,
  `useYn` varchar(1) NOT NULL,
  `regUsr` int(11) NOT NULL,
  `upUsr` int(11) NOT NULL,
  `pos_id` int(11) NOT NULL,
  `bra_id` int(11) NOT NULL,
  `com_id` int(11) NOT NULL,
  PRIMARY KEY (`comset_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_commission_setting`
--

INSERT INTO `tbl_commission_setting` (`comset_id`, `comset_salary_yn`, `comset_commi_yn`, `regDt`, `upDt`, `useYn`, `regUsr`, `upUsr`, `pos_id`, `bra_id`, `com_id`) VALUES
(7, 'N', 'N', '2019-07-22 17:45:46', '2019-07-22 17:45:46', 'Y', 6, 6, 13, 29, 9),
(6, 'Y', 'N', '2019-07-21 20:34:57', '2019-07-22 14:41:44', 'N', 6, 6, 12, 28, 9),
(8, 'Y', 'Y', '2019-07-22 17:16:44', '2019-07-22 17:45:40', 'N', 6, 6, 13, 29, 9),
(9, 'Y', 'Y', '2019-07-22 17:33:39', '2019-07-22 17:45:40', 'N', 6, 6, 13, 29, 9),
(10, 'Y', 'Y', '2019-07-22 17:33:50', '2019-07-22 17:45:40', 'N', 6, 6, 13, 29, 9),
(11, 'Y', 'Y', '2019-07-22 17:35:02', '2019-07-22 17:45:40', 'N', 6, 6, 13, 29, 9);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_commission_setting_detail`
--

DROP TABLE IF EXISTS `tbl_commission_setting_detail`;
CREATE TABLE IF NOT EXISTS `tbl_commission_setting_detail` (
  `comset_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `comset_type` varchar(1) DEFAULT NULL,
  `comset_amt` double DEFAULT NULL,
  `comset_type_ex` varchar(1) DEFAULT NULL,
  `comset_amt_ex` double DEFAULT NULL,
  `regDt` datetime DEFAULT NULL,
  `upDt` datetime DEFAULT NULL,
  `useYn` varchar(1) NOT NULL,
  `regUsr` int(11) NOT NULL,
  `upUsr` int(11) NOT NULL,
  `com_id` int(11) NOT NULL,
  PRIMARY KEY (`comset_id`,`cat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_commission_setting_detail`
--

INSERT INTO `tbl_commission_setting_detail` (`comset_id`, `cat_id`, `comset_type`, `comset_amt`, `comset_type_ex`, `comset_amt_ex`, `regDt`, `upDt`, `useYn`, `regUsr`, `upUsr`, `com_id`) VALUES
(6, 2, 'M', 500, 'P', 20, '0000-00-00 00:00:00', '2019-07-22 14:41:44', 'N', 2019, 6, 9),
(6, 1, 'M', 200, 'P', 20, '0000-00-00 00:00:00', '2019-07-22 14:41:44', 'N', 2019, 6, 9),
(7, 1, 'M', 300, 'P', 20, '2019-07-22 17:45:46', NULL, 'Y', 6, 0, 9),
(7, 2, 'M', 400, 'P', 20, '2019-07-22 17:45:46', NULL, 'Y', 6, 0, 9),
(8, 1, 'M', 300, 'P', 20, '2019-07-22 17:16:44', '2019-07-22 17:45:40', 'N', 6, 6, 9),
(8, 2, 'M', 400, 'P', 20, '2019-07-22 17:16:44', '2019-07-22 17:45:40', 'N', 6, 6, 9),
(9, 1, 'M', 300, 'P', 20, '2019-07-22 17:33:39', '2019-07-22 17:45:40', 'N', 6, 6, 9),
(9, 2, 'M', 400, 'P', 20, '2019-07-22 17:33:39', '2019-07-22 17:45:40', 'N', 6, 6, 9),
(10, 1, 'M', 300, 'P', 20, '2019-07-22 17:33:50', '2019-07-22 17:45:40', 'N', 6, 6, 9),
(10, 2, 'M', 400, 'P', 20, '2019-07-22 17:33:50', '2019-07-22 17:45:40', 'N', 6, 6, 9),
(11, 1, 'M', 300, 'P', 20, '2019-07-22 17:35:02', '2019-07-22 17:45:40', 'N', 6, 6, 9),
(11, 2, 'M', 400, 'P', 20, '2019-07-22 17:35:02', '2019-07-22 17:45:40', 'N', 6, 6, 9);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_company`
--

DROP TABLE IF EXISTS `tbl_company`;
CREATE TABLE IF NOT EXISTS `tbl_company` (
  `com_id` int(11) NOT NULL AUTO_INCREMENT,
  `com_nm` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `com_phone` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `com_email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `com_addr` text COLLATE utf8_unicode_ci,
  `com_des` text COLLATE utf8_unicode_ci,
  `regDt` datetime DEFAULT NULL,
  `upDt` datetime DEFAULT NULL,
  `useYn` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`com_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_company`
--

INSERT INTO `tbl_company` (`com_id`, `com_nm`, `com_phone`, `com_email`, `com_addr`, `com_des`, `regDt`, `upDt`, `useYn`) VALUES
(1, '1', '1', NULL, NULL, NULL, '2018-09-12 11:50:39', NULL, 'Y'),
(2, '2', '2', NULL, NULL, NULL, '2018-09-12 11:54:03', NULL, 'N'),
(3, '3', '3', NULL, NULL, NULL, '2018-09-12 12:04:03', NULL, 'Y'),
(4, '4', '4', NULL, NULL, NULL, '2018-09-12 13:05:35', NULL, 'Y'),
(5, '5', '5', NULL, NULL, NULL, '2018-09-12 13:14:32', NULL, 'Y'),
(9, 'Galaxy', '010527752', NULL, NULL, NULL, '2019-07-10 11:29:12', NULL, 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_contract`
--

DROP TABLE IF EXISTS `tbl_contract`;
CREATE TABLE IF NOT EXISTS `tbl_contract` (
  `con_id` int(11) NOT NULL AUTO_INCREMENT,
  `con_total_price` double DEFAULT NULL,
  `con_date` date NOT NULL,
  `con_date_exp` date NOT NULL,
  `con_des` text,
  `con_sta` varchar(1) DEFAULT NULL,
  `regDt` datetime DEFAULT NULL,
  `upDt` datetime DEFAULT NULL,
  `useYn` varchar(1) NOT NULL,
  `regUsr` int(11) NOT NULL,
  `upUsr` int(11) NOT NULL,
  `cus_id` int(11) NOT NULL,
  `com_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `rec_id` int(11) NOT NULL,
  `con_code` varchar(12) DEFAULT NULL,
  `con_pay_met` int(11) DEFAULT NULL,
  `con_tran_id` varchar(100) DEFAULT NULL,
  `con_pro_price` double DEFAULT NULL,
  `con_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`con_id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_contract`
--

INSERT INTO `tbl_contract` (`con_id`, `con_total_price`, `con_date`, `con_date_exp`, `con_des`, `con_sta`, `regDt`, `upDt`, `useYn`, `regUsr`, `upUsr`, `cus_id`, `com_id`, `seller_id`, `rec_id`, `con_code`, `con_pay_met`, `con_tran_id`, `con_pro_price`, `con_type_id`) VALUES
(1, 2000, '2019-08-06', '2019-08-29', '', NULL, '2019-08-06 04:38:30', NULL, 'Y', 6, 0, 13, 9, 13, 13, '0000000002', NULL, NULL, NULL, NULL),
(2, 3000, '2019-08-06', '2019-08-20', 'aaaa', NULL, '2019-08-06 04:39:52', NULL, 'Y', 6, 0, 14, 9, 13, 13, '0000000003', NULL, NULL, NULL, NULL),
(3, 6000, '2019-08-06', '2019-08-31', '', NULL, '2019-08-06 05:00:55', NULL, 'Y', 6, 0, 15, 9, 12, 12, '0000003', NULL, NULL, NULL, NULL),
(4, 4000, '2019-08-06', '2019-08-07', '0000', NULL, '2019-08-06 05:01:58', NULL, 'Y', 6, 0, 14, 9, 13, 13, '0000004', NULL, NULL, NULL, NULL),
(5, 4444, '2019-08-06', '2019-08-06', '', NULL, '2019-08-06 06:41:42', NULL, 'Y', 6, 0, 15, 9, 13, 13, '0000005', NULL, NULL, NULL, NULL),
(6, 3000, '2019-08-06', '2019-08-13', '', NULL, '2019-08-06 06:48:44', NULL, 'Y', 6, 0, 15, 9, 12, 12, '0000006', NULL, NULL, NULL, NULL),
(7, 3333, '2019-08-06', '2019-08-21', '', NULL, '2019-08-06 06:53:15', NULL, 'Y', 6, 0, 13, 9, 13, 13, '0000007', NULL, NULL, NULL, NULL),
(8, 0, '2019-08-06', '2019-08-06', '', 'C', '2019-08-06 09:51:35', '2019-08-09 22:46:17', 'Y', 6, 6, 15, 9, 13, 13, '0000008', 2, '677777', NULL, NULL),
(9, 2000, '2019-08-06', '2019-08-07', '111111111', 'S', '2019-08-06 16:54:55', NULL, 'Y', 6, 0, 14, 9, 13, 13, '0000009', 1, '1000', NULL, NULL),
(10, 2222, '2019-08-06', '2019-08-20', '', 'E', '2019-08-06 17:22:06', NULL, 'Y', 6, 0, 14, 9, 13, 13, '0000010', 1, '22', NULL, NULL),
(11, 5555, '2019-08-06', '2019-08-06', '', 'B', '2019-08-06 17:27:44', NULL, 'Y', 6, 0, 14, 9, 13, 13, '0000011', 1, '', NULL, NULL),
(12, 2000, '2019-08-11', '2019-08-31', '', 'B', '2019-08-11 11:39:00', NULL, 'Y', 6, 0, 15, 9, 12, 12, '0000012', 1, '', NULL, NULL),
(13, 2000, '2019-08-11', '2019-08-29', 'gggggggg', 'F', '2019-08-11 11:40:11', '2019-08-11 12:37:14', 'Y', 6, 6, 13, 9, 12, 13, '0000013', 2, 'aaaaaaaaa', NULL, NULL),
(14, 6000, '2019-08-11', '2019-08-18', '', 'B', '2019-08-11 14:27:29', NULL, 'Y', 6, 0, 13, 9, 13, 13, '0000014', 1, '', NULL, NULL),
(15, 2000, '2019-08-11', '2019-08-17', '', 'B', '2019-08-11 15:21:12', NULL, 'Y', 6, 0, 14, 9, 12, 12, '0000015', 2, '', NULL, NULL),
(16, 77777, '2019-08-11', '2019-08-12', '', 'B', '2019-08-11 15:24:04', NULL, 'Y', 6, 0, 15, 9, 13, 13, '0000016', 1, '', NULL, NULL),
(17, 2000, '2019-08-11', '2019-08-31', 'ttttt', 'B', '2019-08-11 15:27:56', NULL, 'Y', 6, 0, 14, 9, 13, 12, '0000017', 2, 'dfgdsgdfs', NULL, NULL),
(18, 2000, '2019-08-18', '2019-08-25', 'aaaaa', 'B', '2019-08-18 15:28:30', NULL, 'Y', 6, 0, 15, 9, 13, 13, '0000018', 1, 'dsgadgfa', NULL, 3),
(19, 4000, '2019-08-18', '2019-08-18', '', 'B', '2019-08-18 17:20:22', NULL, 'Y', 6, 0, 14, 9, 13, 13, '0000019', 1, '', NULL, 1),
(20, 2000.22, '2019-08-19', '2019-08-25', 'ttttttt', 'B', '2019-08-19 00:55:26', NULL, 'Y', 6, 0, 14, 9, 13, 13, '0000020', 1, 'tttttt', NULL, 1),
(21, 50000, '2019-08-19', '2019-08-25', 'ggggggggggggggggggggggggggggggg', 'B', '2019-08-19 01:02:00', NULL, 'Y', 6, 0, 13, 9, 12, 12, '0000021', 1, '', NULL, 2),
(22, 7000, '2019-08-19', '2019-08-31', '', 'B', '2019-08-19 01:03:21', NULL, 'Y', 6, 0, 15, 9, 13, 13, '0000022', 1, '33333', NULL, 1),
(23, 3000, '2019-08-19', '2019-08-31', '', 'B', '2019-08-19 01:04:12', NULL, 'Y', 6, 0, 14, 9, 13, 13, '0000023', 1, '22222', NULL, 1),
(24, 7000, '2019-08-19', '2019-08-25', '0000', 'B', '2019-08-19 01:05:14', NULL, 'Y', 6, 0, 15, 9, 13, 13, '0000024', 1, '666', NULL, 3),
(25, 5000, '2019-08-19', '2019-08-31', 'hhhhhhh', 'E', '2019-08-19 01:09:22', '2019-08-19 14:08:39', 'Y', 6, 6, 15, 9, 13, 13, '0000025', 1, '7777', NULL, 3),
(26, 2000, '2019-08-24', '2019-08-31', '', 'B', '2019-08-24 12:29:01', '2019-08-25 14:31:33', 'Y', 6, 6, 13, 9, 13, 13, '0000026', 1, '', NULL, 3);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_contract_detail`
--

DROP TABLE IF EXISTS `tbl_contract_detail`;
CREATE TABLE IF NOT EXISTS `tbl_contract_detail` (
  `con_id` int(11) NOT NULL,
  `pro_id` int(11) NOT NULL,
  `pro_unit_price` double DEFAULT NULL,
  `pro_dis_per` double DEFAULT NULL,
  `pro_dis_amt` double DEFAULT NULL,
  `pro_book_price` double DEFAULT NULL,
  `regDt` datetime DEFAULT NULL,
  `upDt` datetime DEFAULT NULL,
  `useYn` varchar(1) NOT NULL,
  `regUsr` int(11) NOT NULL,
  `upUsr` int(11) NOT NULL,
  `com_id` int(11) NOT NULL,
  PRIMARY KEY (`con_id`,`pro_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_contract_detail`
--

INSERT INTO `tbl_contract_detail` (`con_id`, `pro_id`, `pro_unit_price`, `pro_dis_per`, `pro_dis_amt`, `pro_book_price`, `regDt`, `upDt`, `useYn`, `regUsr`, `upUsr`, `com_id`) VALUES
(2, 2, NULL, NULL, NULL, NULL, '2019-08-06 04:39:52', NULL, 'Y', 6, 0, 9),
(3, 2, NULL, NULL, NULL, NULL, '2019-08-06 05:00:55', NULL, 'Y', 6, 0, 9),
(4, 2, NULL, NULL, NULL, NULL, '2019-08-06 05:01:58', NULL, 'Y', 6, 0, 9),
(5, 2, NULL, NULL, NULL, NULL, '2019-08-06 06:41:42', NULL, 'Y', 6, 0, 9),
(7, 2, NULL, NULL, NULL, NULL, '2019-08-06 06:53:15', NULL, 'Y', 6, 0, 9),
(7, 1, NULL, NULL, NULL, NULL, '2019-08-06 06:53:15', NULL, 'Y', 6, 0, 9),
(8, 0, NULL, NULL, NULL, NULL, '2019-08-06 09:51:35', NULL, 'Y', 6, 0, 9),
(9, 2, NULL, NULL, NULL, NULL, '2019-08-06 16:54:55', NULL, 'Y', 6, 0, 9),
(9, 1, NULL, NULL, NULL, NULL, '2019-08-06 16:54:56', NULL, 'Y', 6, 0, 9),
(10, 0, NULL, NULL, NULL, NULL, '2019-08-06 17:22:06', NULL, 'Y', 6, 0, 9),
(11, 1, NULL, NULL, NULL, NULL, '2019-08-06 17:27:44', NULL, 'Y', 6, 0, 9),
(12, 2, NULL, NULL, NULL, NULL, '2019-08-11 11:39:00', NULL, 'Y', 6, 0, 9),
(12, 1, NULL, NULL, NULL, NULL, '2019-08-11 11:39:00', NULL, 'Y', 6, 0, 9),
(13, 1, NULL, NULL, NULL, NULL, '2019-08-11 11:40:11', NULL, 'Y', 6, 0, 9),
(14, 2, NULL, NULL, NULL, NULL, '2019-08-11 14:27:29', NULL, 'Y', 6, 0, 9),
(15, 2, NULL, NULL, NULL, 0, '2019-08-11 15:21:12', NULL, 'Y', 6, 0, 9),
(16, 2, NULL, NULL, NULL, 0, '2019-08-11 15:24:04', NULL, 'Y', 6, 0, 9),
(17, 1, NULL, NULL, NULL, 10000, '2019-08-11 15:27:56', NULL, 'Y', 6, 0, 9),
(18, 1, NULL, NULL, NULL, 10000, '2019-08-18 15:28:30', NULL, 'Y', 6, 0, 9),
(19, 2, NULL, NULL, NULL, 11111, '2019-08-18 17:20:22', NULL, 'Y', 6, 0, 9),
(20, 1, NULL, NULL, NULL, 10000, '2019-08-19 00:55:26', NULL, 'Y', 6, 0, 9),
(21, 1, NULL, NULL, NULL, 10000, '2019-08-19 01:02:00', NULL, 'Y', 6, 0, 9),
(22, 1, NULL, NULL, NULL, 10000, '2019-08-19 01:03:21', NULL, 'Y', 6, 0, 9),
(23, 2, NULL, NULL, NULL, 11111, '2019-08-19 01:04:12', NULL, 'Y', 6, 0, 9),
(24, 2, NULL, NULL, NULL, 11111, '2019-08-19 01:05:14', NULL, 'Y', 6, 0, 9),
(25, 1, NULL, NULL, NULL, 10000, '2019-08-19 01:09:22', NULL, 'Y', 6, 0, 9),
(26, 2, NULL, NULL, NULL, 120000, '2019-08-24 12:29:01', NULL, 'Y', 6, 0, 9);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_contract_type`
--

DROP TABLE IF EXISTS `tbl_contract_type`;
CREATE TABLE IF NOT EXISTS `tbl_contract_type` (
  `con_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `con_type_nm_kh` varchar(500) DEFAULT NULL,
  `con_type_nm` varchar(500) DEFAULT NULL,
  `con_type_inst_com_yn` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`con_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_contract_type`
--

INSERT INTO `tbl_contract_type` (`con_type_id`, `con_type_nm_kh`, `con_type_nm`, `con_type_inst_com_yn`) VALUES
(1, 'បង់ជាមួយក្រុមហ៊ុនរយៈពេល១៨ខែដោយឥតការប្រាក់', 'បង់ជាមួយក្រុមហ៊ុនរយៈពេល១៨ខែដោយឥតការប្រាក់', 'Y'),
(2, 'រំលស់70%ជាមួយក្រុមហ៊ុនរយៈពេល៣ឆ្នាំ( ការប្រាក់ក្នុង១ខែ 1.2%)', 'រំលស់70%ជាមួយក្រុមហ៊ុនរយៈពេល៣ឆ្នាំ( ការប្រាក់ក្នុង១ខែ 1.2%)', 'Y'),
(3, 'រំលស់70%ជាមួយធនាគារ', 'រំលស់70%ជាមួយធនាគារ', 'N'),
(4, 'រំលស់95%ជាមួយឥណទាន', 'រំលស់95%ជាមួយឥណទាន', 'N');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer`
--

DROP TABLE IF EXISTS `tbl_customer`;
CREATE TABLE IF NOT EXISTS `tbl_customer` (
  `cus_id` int(11) NOT NULL AUTO_INCREMENT,
  `cus_nm` varchar(30) DEFAULT NULL,
  `cus_nm_kh` varchar(30) DEFAULT NULL,
  `cus_gender` varchar(10) DEFAULT NULL,
  `cus_dob` date DEFAULT NULL,
  `cus_photo` text,
  `cus_phone1` varchar(15) DEFAULT NULL,
  `cus_phone2` varchar(15) DEFAULT NULL,
  `cus_email` varchar(50) DEFAULT NULL,
  `cus_fb_name` varchar(50) CHARACTER SET armscii8 NOT NULL,
  `cus_addr` text,
  `cus_des` text,
  `cus_idnt_num` varchar(20) DEFAULT NULL,
  `cus_idnt_type` varchar(4) DEFAULT NULL,
  `regDt` datetime DEFAULT NULL,
  `upDt` datetime DEFAULT NULL,
  `useYn` varchar(1) DEFAULT NULL,
  `regUsr` int(11) DEFAULT NULL,
  `upUsr` varchar(100) CHARACTER SET armscii8 NOT NULL,
  `com_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`cus_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_customer`
--

INSERT INTO `tbl_customer` (`cus_id`, `cus_nm`, `cus_nm_kh`, `cus_gender`, `cus_dob`, `cus_photo`, `cus_phone1`, `cus_phone2`, `cus_email`, `cus_fb_name`, `cus_addr`, `cus_des`, `cus_idnt_num`, `cus_idnt_type`, `regDt`, `upDt`, `useYn`, `regUsr`, `upUsr`, `com_id`) VALUES
(1, 'customer 00001', 'អតិថិជន 00001', 'Female', '2019-01-01', '/loan/customer/2019-01-26-09-46-29_1_1.jpg', '092333344', '092888822', 'customer00001@gmail.com', '', 'customer str.', 'customer detail', '123321212', NULL, '2019-01-25 00:00:00', '2019-01-26 09:46:29', 'Y', 1, '1', 1),
(2, 'customer 00002', 'អតិថិជន 00002', 'Male', '1970-01-01', '/loan/customer/2019-01-26-09-46-39_1_1.jpg', '091222233', '098111122', 'staff00002@gmail.com', '', 'customer 00002 str.', 'customer 00002 description', '112222222', NULL, '2019-01-26 05:06:15', '2019-01-26 09:46:39', 'Y', 1, '1', 1),
(3, 'customer 00003', 'អតិថិជន 00003', 'Male', '1990-01-07', '/loan/customer/2019-01-26-10-08-47_1_1.jpg', '012222233', '012333344', 'customer00003@gmail.com', '', 'customer 00003 str.', 'customer 00003 detail', '999888809', NULL, '2019-01-26 05:30:50', '2019-01-26 10:08:47', 'Y', 1, '1', 1),
(4, 'customer 00004', 'អតិថិជន 00004', 'Female', '1989-06-02', '', '012223344', '092335577', 'staff00004@gmail.com', '', 'customer 00004 str.', 'customer 00004 description', '757456445', NULL, '2019-01-26 05:31:55', '2019-02-28 08:04:17', 'Y', 1, '1', 1),
(5, 'customer 00005', 'អតិថិជន 00005', 'Female', '1999-08-12', '/loan/customer/2019-01-26-09-47-15_1_1.jpg', '091222333', '012333444', 'customer00005@gmail.com', '', 'customer 00005 str.', 'customer 00005 description', '999888877', NULL, '2019-01-26 05:37:09', '2019-01-26 09:47:20', 'Y', 1, '1', 1),
(6, 'customer 00006', 'អតិថិជន 00006', 'Male', '1990-06-02', '/loan/customer/2019-01-26-09-47-04_1_1.jpg', '092222233', '098777766', 'customer00006@gmail.com', '', 'customer 00006 str.', 'customer 00006 description', '123455321', NULL, '2019-01-26 07:51:18', '2019-01-26 09:47:04', 'Y', 1, '1', 1),
(7, 'customer add on contract', 'បញ្ចូលពី contract', 'Male', '1991-06-03', '/loan/customer/2019-03-02-08-04-41_1_1.png', '092929292', '012121212', 'customerlast@gmail.com', '', 'customer last str.', 'added from contract', '999888177', NULL, '2019-03-02 08:04:41', '2019-03-02 08:20:11', 'N', 1, '1', 1),
(8, 'added on contract', 'អតិថិជន from contract', 'Male', '1970-01-01', '/loan/customer/2019-03-02-08-19-21_1_1.png', '091212121', '012323232', 'customercontract@gmail.com', '', 'customer contract.....', 'customer contract', '999888000', NULL, '2019-03-02 08:19:21', '2019-03-02 08:20:11', 'N', 1, '1', 1),
(9, 'resrkkkkkk', 'kkkkkkkkkkk', 'Male', '1970-01-01', '/loan/customer/2019-03-02-08-20-55_1_1.png', '023923834', '098888880', 'customer00006@gmail.com', '', 'customer 00004 str.', 'customer 00006 description', '876867867', NULL, '2019-03-02 08:20:55', '2019-03-02 08:34:34', 'N', 1, '1', 1),
(10, 'wwwwwwwwwwwww', 'wwwwwwwwwww', 'Male', '2000-07-02', '/loan/customer/2019-03-02-08-33-55_1_1.png', '091212121', '012211212', 'customer00006@gmail.com', '', 'customer 00003 str.', 'customer 00006 description', '123888192', NULL, '2019-03-02 08:33:55', '2019-03-02 08:34:34', 'N', 1, '1', 1),
(11, 'kkkkkk', 'kkkkkkk', 'Male', '2017-01-10', '/loan/customer/2019-03-02-08-39-13_1_1.png', '012121213', '098112112', 'customer00006@gmail.com', '', 'customer 00004 str.', 'customer 00006 description', '123123121', NULL, '2019-03-02 08:39:13', NULL, 'Y', 1, '', 1),
(12, '', 'សុខា', 'Female', '2009-01-11', '', '092221212', '092221133', '', '', 'Str....', 'testse', '12121212', NULL, '2019-05-06 11:19:14', NULL, 'Y', 1, '', 1),
(13, '', 'វង សុវណ្ណធឿន', 'Male', '1995-02-08', '/borey/customer/2019-07-12-02-08-47_9_6.jpg', '012363636', '012353535', 'sovanthoeun@gmail.com', 'facebook.com/sovanthoeun', 'No. 138, stree 231, Depo Market', 'TESTING developing', '123211134', NULL, '2019-07-12 01:41:12', '2019-07-12 02:11:06', 'Y', 6, '6', 9),
(14, '', 'សុភ័ក្រ្តា', 'Male', '1996-02-06', '', '012525252', '012545454', 'pheaktra@gmail.com', '', 'No. 30, street 543, Teuk Thla', 'TESTING', '123569745', NULL, '2019-07-12 02:00:08', '2019-07-12 02:02:53', 'Y', 6, '6', 9),
(15, '00000001', '00000001', 'Female', '1970-01-01', '', '012565656', '023565456', 'test@gmail.com', 'facebook.com/test', 'No, Test, street Test', 'TESTING', '111111111', NULL, '2019-07-12 02:13:04', NULL, 'Y', 6, '', 9);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_expend`
--

DROP TABLE IF EXISTS `tbl_expend`;
CREATE TABLE IF NOT EXISTS `tbl_expend` (
  `exp_id` int(11) NOT NULL AUTO_INCREMENT,
  `exp_total_price` double DEFAULT NULL,
  `exp_date` date NOT NULL,
  `exp_des` text,
  `regDt` datetime DEFAULT NULL,
  `upDt` datetime DEFAULT NULL,
  `useYn` varchar(1) NOT NULL,
  `regUsr` int(11) NOT NULL,
  `upUsr` int(11) NOT NULL,
  `sta_id` int(11) DEFAULT NULL,
  `sup_id` int(11) NOT NULL,
  `pro_id` int(11) NOT NULL,
  `com_id` int(11) NOT NULL,
  PRIMARY KEY (`exp_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_import`
--

DROP TABLE IF EXISTS `tbl_import`;
CREATE TABLE IF NOT EXISTS `tbl_import` (
  `imp_id` int(11) NOT NULL AUTO_INCREMENT,
  `imp_total_qty` int(11) DEFAULT NULL,
  `imp_total_price` double DEFAULT NULL,
  `imp_date` date NOT NULL,
  `imp_des` text COLLATE utf8_unicode_ci,
  `regDt` datetime DEFAULT NULL,
  `upDt` datetime DEFAULT NULL,
  `useYn` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `regUsr` int(11) NOT NULL,
  `upUsr` int(11) NOT NULL,
  `sup_id` int(11) NOT NULL,
  `com_id` int(11) NOT NULL,
  PRIMARY KEY (`imp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_import_detail`
--

DROP TABLE IF EXISTS `tbl_import_detail`;
CREATE TABLE IF NOT EXISTS `tbl_import_detail` (
  `imp_id` int(11) NOT NULL,
  `pro_id` int(11) NOT NULL,
  `pro_unit_price` double DEFAULT NULL,
  `pro_sale_price` double DEFAULT NULL,
  `regDt` datetime DEFAULT NULL,
  `upDt` datetime DEFAULT NULL,
  `useYn` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `regUsr` int(11) NOT NULL,
  `upUsr` int(11) NOT NULL,
  `com_id` int(11) NOT NULL,
  PRIMARY KEY (`imp_id`,`pro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_installment`
--

DROP TABLE IF EXISTS `tbl_installment`;
CREATE TABLE IF NOT EXISTS `tbl_installment` (
  `inst_id` int(11) NOT NULL AUTO_INCREMENT,
  `inst_loan_amount` double DEFAULT NULL,
  `inst_interest_rate` double DEFAULT NULL,
  `inst_period_month` int(11) DEFAULT NULL,
  `inst_first_installment_date` date DEFAULT NULL,
  `inst_date` date DEFAULT NULL,
  `inst_num` int(11) DEFAULT NULL,
  `inst_amt_pay` double DEFAULT NULL,
  `inst_amt_principle` double DEFAULT NULL,
  `inst_amt_interest` double DEFAULT NULL,
  `inst_amt_balance` double DEFAULT NULL,
  `inst_amt_penalty` double DEFAULT NULL,
  `inst_cancel_yn` varchar(1) DEFAULT NULL,
  `sell_id` int(11) DEFAULT NULL,
  `regDt` datetime DEFAULT NULL,
  `upDt` datetime DEFAULT NULL,
  `useYn` varchar(1) DEFAULT NULL,
  `regUsr` int(11) DEFAULT NULL,
  `upUsr` int(11) DEFAULT NULL,
  `com_id` int(11) DEFAULT NULL,
  `inst_type` varchar(5) DEFAULT NULL,
  `inst_pay_per` double DEFAULT NULL,
  `inst_dis_amt` double DEFAULT NULL,
  `inst_dis_per` double DEFAULT NULL,
  `inst_loan_amount_per` double DEFAULT NULL,
  PRIMARY KEY (`inst_id`)
) ENGINE=MyISAM AUTO_INCREMENT=116 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_installment`
--

INSERT INTO `tbl_installment` (`inst_id`, `inst_loan_amount`, `inst_interest_rate`, `inst_period_month`, `inst_first_installment_date`, `inst_date`, `inst_num`, `inst_amt_pay`, `inst_amt_principle`, `inst_amt_interest`, `inst_amt_balance`, `inst_amt_penalty`, `inst_cancel_yn`, `sell_id`, `regDt`, `upDt`, `useYn`, `regUsr`, `upUsr`, `com_id`, `inst_type`, `inst_pay_per`, `inst_dis_amt`, `inst_dis_per`, `inst_loan_amount_per`) VALUES
(1, 72000, 10, 12, '2019-09-01', '2019-09-01', 1, 6329.94, 5729.94, 600, 66270.06, NULL, NULL, 19, '2019-08-31 16:55:39', '2019-08-31 17:40:49', 'N', 6, 6, 9, NULL, NULL, NULL, NULL, NULL),
(2, 72000, 10, 12, '2019-09-01', '2019-10-01', 2, 6329.94, 5777.69, 552.25, 60492.37, NULL, NULL, 19, '2019-08-31 16:55:39', '2019-08-31 17:40:49', 'N', 6, 6, 9, NULL, NULL, NULL, NULL, NULL),
(3, 72000, 10, 12, '2019-09-01', '2019-11-01', 3, 6329.94, 5825.84, 504.1, 54666.53, NULL, NULL, 19, '2019-08-31 16:55:39', '2019-08-31 17:40:49', 'N', 6, 6, 9, NULL, NULL, NULL, NULL, NULL),
(4, 72000, 10, 12, '2019-09-01', '2019-12-01', 4, 6329.94, 5874.39, 455.55, 48792.14, NULL, NULL, 19, '2019-08-31 16:55:39', '2019-08-31 17:40:49', 'N', 6, 6, 9, NULL, NULL, NULL, NULL, NULL),
(5, 72000, 10, 12, '2019-09-01', '2020-01-01', 5, 6329.94, 5923.34, 406.6, 42868.8, NULL, NULL, 19, '2019-08-31 16:55:39', '2019-08-31 17:40:49', 'N', 6, 6, 9, NULL, NULL, NULL, NULL, NULL),
(6, 72000, 10, 12, '2019-09-01', '2020-02-01', 6, 6329.94, 5972.7, 357.24, 36896.1, NULL, NULL, 19, '2019-08-31 16:55:39', '2019-08-31 17:40:49', 'N', 6, 6, 9, NULL, NULL, NULL, NULL, NULL),
(7, 72000, 10, 12, '2019-09-01', '2020-03-01', 7, 6329.94, 6022.47, 307.47, 30873.63, NULL, NULL, 19, '2019-08-31 16:55:39', '2019-08-31 17:40:49', 'N', 6, 6, 9, NULL, NULL, NULL, NULL, NULL),
(8, 72000, 10, 12, '2019-09-01', '2020-04-01', 8, 6329.94, 6072.66, 257.28, 24800.97, NULL, NULL, 19, '2019-08-31 16:55:39', '2019-08-31 17:40:49', 'N', 6, 6, 9, NULL, NULL, NULL, NULL, NULL),
(9, 72000, 10, 12, '2019-09-01', '2020-05-01', 9, 6329.94, 6123.27, 206.67, 18677.7, NULL, NULL, 19, '2019-08-31 16:55:39', '2019-08-31 17:40:49', 'N', 6, 6, 9, NULL, NULL, NULL, NULL, NULL),
(10, 72000, 10, 12, '2019-09-01', '2020-06-01', 10, 6329.94, 6174.29, 155.65, 12503.41, NULL, NULL, 19, '2019-08-31 16:55:39', '2019-08-31 17:40:49', 'N', 6, 6, 9, NULL, NULL, NULL, NULL, NULL),
(11, 72000, 10, 12, '2019-09-01', '2020-07-01', 11, 6329.94, 6225.74, 104.2, 6277.67, NULL, NULL, 19, '2019-08-31 16:55:39', '2019-08-31 17:40:49', 'N', 6, 6, 9, NULL, NULL, NULL, NULL, NULL),
(12, 72000, 10, 12, '2019-09-01', '2020-08-01', 12, 6329.94, 6277.63, 52.31, 0, NULL, NULL, 19, '2019-08-31 16:55:39', '2019-08-31 17:40:49', 'N', 6, 6, 9, NULL, NULL, NULL, NULL, NULL),
(13, 72000, 10, 24, '2019-09-01', '2019-09-01', 1, 3322.43, 2722.43, 600, 69277.57, NULL, NULL, 19, '2019-08-31 17:39:26', '2019-08-31 17:40:49', 'N', 6, 6, 9, NULL, NULL, NULL, NULL, NULL),
(14, 72000, 10, 24, '2019-09-01', '2019-10-01', 2, 3322.43, 2745.12, 577.31, 66532.45, NULL, NULL, 19, '2019-08-31 17:39:26', '2019-08-31 17:40:49', 'N', 6, 6, 9, NULL, NULL, NULL, NULL, NULL),
(15, 72000, 10, 24, '2019-09-01', '2019-11-01', 3, 3322.43, 2767.99, 554.44, 63764.46, NULL, NULL, 19, '2019-08-31 17:39:26', '2019-08-31 17:40:49', 'N', 6, 6, 9, NULL, NULL, NULL, NULL, NULL),
(16, 72000, 10, 24, '2019-09-01', '2019-12-01', 4, 3322.43, 2791.06, 531.37, 60973.4, NULL, NULL, 19, '2019-08-31 17:39:26', '2019-08-31 17:40:49', 'N', 6, 6, 9, NULL, NULL, NULL, NULL, NULL),
(17, 72000, 10, 24, '2019-09-01', '2020-01-01', 5, 3322.43, 2814.32, 508.11, 58159.08, NULL, NULL, 19, '2019-08-31 17:39:26', '2019-08-31 17:40:49', 'N', 6, 6, 9, NULL, NULL, NULL, NULL, NULL),
(18, 72000, 10, 24, '2019-09-01', '2020-02-01', 6, 3322.43, 2837.77, 484.66, 55321.31, NULL, NULL, 19, '2019-08-31 17:39:26', '2019-08-31 17:40:49', 'N', 6, 6, 9, NULL, NULL, NULL, NULL, NULL),
(19, 72000, 10, 24, '2019-09-01', '2020-03-01', 7, 3322.43, 2861.42, 461.01, 52459.89, NULL, NULL, 19, '2019-08-31 17:39:26', '2019-08-31 17:40:49', 'N', 6, 6, 9, NULL, NULL, NULL, NULL, NULL),
(20, 72000, 10, 24, '2019-09-01', '2020-04-01', 8, 3322.43, 2885.26, 437.17, 49574.63, NULL, NULL, 19, '2019-08-31 17:39:26', '2019-08-31 17:40:49', 'N', 6, 6, 9, NULL, NULL, NULL, NULL, NULL),
(21, 72000, 10, 24, '2019-09-01', '2020-05-01', 9, 3322.43, 2909.31, 413.12, 46665.32, NULL, NULL, 19, '2019-08-31 17:39:26', '2019-08-31 17:40:49', 'N', 6, 6, 9, NULL, NULL, NULL, NULL, NULL),
(22, 72000, 10, 24, '2019-09-01', '2020-06-01', 10, 3322.43, 2933.55, 388.88, 43731.77, NULL, NULL, 19, '2019-08-31 17:39:26', '2019-08-31 17:40:49', 'N', 6, 6, 9, NULL, NULL, NULL, NULL, NULL),
(23, 72000, 10, 24, '2019-09-01', '2020-07-01', 11, 3322.43, 2958, 364.43, 40773.77, NULL, NULL, 19, '2019-08-31 17:39:26', '2019-08-31 17:40:49', 'N', 6, 6, 9, NULL, NULL, NULL, NULL, NULL),
(24, 72000, 10, 24, '2019-09-01', '2020-08-01', 12, 3322.43, 2982.65, 339.78, 37791.12, NULL, NULL, 19, '2019-08-31 17:39:26', '2019-08-31 17:40:49', 'N', 6, 6, 9, NULL, NULL, NULL, NULL, NULL),
(25, 72000, 10, 24, '2019-09-01', '2020-09-01', 13, 3322.43, 3007.5, 314.93, 34783.62, NULL, NULL, 19, '2019-08-31 17:39:26', '2019-08-31 17:40:49', 'N', 6, 6, 9, NULL, NULL, NULL, NULL, NULL),
(26, 72000, 10, 24, '2019-09-01', '2020-10-01', 14, 3322.43, 3032.57, 289.86, 31751.05, NULL, NULL, 19, '2019-08-31 17:39:26', '2019-08-31 17:40:49', 'N', 6, 6, 9, NULL, NULL, NULL, NULL, NULL),
(27, 72000, 10, 24, '2019-09-01', '2020-11-01', 15, 3322.43, 3057.84, 264.59, 28693.21, NULL, NULL, 19, '2019-08-31 17:39:26', '2019-08-31 17:40:49', 'N', 6, 6, 9, NULL, NULL, NULL, NULL, NULL),
(28, 72000, 10, 24, '2019-09-01', '2020-12-01', 16, 3322.43, 3083.32, 239.11, 25609.89, NULL, NULL, 19, '2019-08-31 17:39:26', '2019-08-31 17:40:49', 'N', 6, 6, 9, NULL, NULL, NULL, NULL, NULL),
(29, 72000, 10, 24, '2019-09-01', '2021-01-01', 17, 3322.43, 3109.01, 213.42, 22500.88, NULL, NULL, 19, '2019-08-31 17:39:26', '2019-08-31 17:40:49', 'N', 6, 6, 9, NULL, NULL, NULL, NULL, NULL),
(30, 72000, 10, 24, '2019-09-01', '2021-02-01', 18, 3322.43, 3134.92, 187.51, 19365.96, NULL, NULL, 19, '2019-08-31 17:39:26', '2019-08-31 17:40:49', 'N', 6, 6, 9, NULL, NULL, NULL, NULL, NULL),
(31, 72000, 10, 24, '2019-09-01', '2021-03-01', 19, 3322.43, 3161.05, 161.38, 16204.91, NULL, NULL, 19, '2019-08-31 17:39:26', '2019-08-31 17:40:49', 'N', 6, 6, 9, NULL, NULL, NULL, NULL, NULL),
(32, 72000, 10, 24, '2019-09-01', '2021-04-01', 20, 3322.43, 3187.39, 135.04, 13017.52, NULL, NULL, 19, '2019-08-31 17:39:26', '2019-08-31 17:40:49', 'N', 6, 6, 9, NULL, NULL, NULL, NULL, NULL),
(33, 72000, 10, 24, '2019-09-01', '2021-05-01', 21, 3322.43, 3213.95, 108.48, 9803.57, NULL, NULL, 19, '2019-08-31 17:39:26', '2019-08-31 17:40:49', 'N', 6, 6, 9, NULL, NULL, NULL, NULL, NULL),
(34, 72000, 10, 24, '2019-09-01', '2021-06-01', 22, 3322.43, 3240.73, 81.7, 6562.84, NULL, NULL, 19, '2019-08-31 17:39:26', '2019-08-31 17:40:49', 'N', 6, 6, 9, NULL, NULL, NULL, NULL, NULL),
(35, 72000, 10, 24, '2019-09-01', '2021-07-01', 23, 3322.43, 3267.74, 54.69, 3295.1, NULL, NULL, 19, '2019-08-31 17:39:26', '2019-08-31 17:40:49', 'N', 6, 6, 9, NULL, NULL, NULL, NULL, NULL),
(36, 72000, 10, 24, '2019-09-01', '2021-08-01', 24, 3322.43, 3294.97, 27.46, 0, NULL, NULL, 19, '2019-08-31 17:39:26', '2019-08-31 17:40:49', 'N', 6, 6, 9, NULL, NULL, NULL, NULL, NULL),
(37, 72000, 10, 24, '2019-09-01', '2019-09-01', 1, 3322.43, 2722.43, 600, 69277.57, NULL, NULL, 19, '2019-08-31 17:40:49', NULL, 'Y', 6, NULL, 9, NULL, NULL, NULL, NULL, NULL),
(38, 72000, 10, 24, '2019-09-01', '2019-10-01', 2, 3322.43, 2745.12, 577.31, 66532.45, NULL, NULL, 19, '2019-08-31 17:40:49', NULL, 'Y', 6, NULL, 9, NULL, NULL, NULL, NULL, NULL),
(39, 72000, 10, 24, '2019-09-01', '2019-11-01', 3, 3322.43, 2767.99, 554.44, 63764.46, NULL, NULL, 19, '2019-08-31 17:40:49', NULL, 'Y', 6, NULL, 9, NULL, NULL, NULL, NULL, NULL),
(40, 72000, 10, 24, '2019-09-01', '2019-12-01', 4, 3322.43, 2791.06, 531.37, 60973.4, NULL, NULL, 19, '2019-08-31 17:40:49', NULL, 'Y', 6, NULL, 9, NULL, NULL, NULL, NULL, NULL),
(41, 72000, 10, 24, '2019-09-01', '2020-01-01', 5, 3322.43, 2814.32, 508.11, 58159.08, NULL, NULL, 19, '2019-08-31 17:40:49', NULL, 'Y', 6, NULL, 9, NULL, NULL, NULL, NULL, NULL),
(42, 72000, 10, 24, '2019-09-01', '2020-02-01', 6, 3322.43, 2837.77, 484.66, 55321.31, NULL, NULL, 19, '2019-08-31 17:40:49', NULL, 'Y', 6, NULL, 9, NULL, NULL, NULL, NULL, NULL),
(43, 72000, 10, 24, '2019-09-01', '2020-03-01', 7, 3322.43, 2861.42, 461.01, 52459.89, NULL, NULL, 19, '2019-08-31 17:40:49', NULL, 'Y', 6, NULL, 9, NULL, NULL, NULL, NULL, NULL),
(44, 72000, 10, 24, '2019-09-01', '2020-04-01', 8, 3322.43, 2885.26, 437.17, 49574.63, NULL, NULL, 19, '2019-08-31 17:40:49', NULL, 'Y', 6, NULL, 9, NULL, NULL, NULL, NULL, NULL),
(45, 72000, 10, 24, '2019-09-01', '2020-05-01', 9, 3322.43, 2909.31, 413.12, 46665.32, NULL, NULL, 19, '2019-08-31 17:40:49', NULL, 'Y', 6, NULL, 9, NULL, NULL, NULL, NULL, NULL),
(46, 72000, 10, 24, '2019-09-01', '2020-06-01', 10, 3322.43, 2933.55, 388.88, 43731.77, NULL, NULL, 19, '2019-08-31 17:40:49', NULL, 'Y', 6, NULL, 9, NULL, NULL, NULL, NULL, NULL),
(47, 72000, 10, 24, '2019-09-01', '2020-07-01', 11, 3322.43, 2958, 364.43, 40773.77, NULL, NULL, 19, '2019-08-31 17:40:49', NULL, 'Y', 6, NULL, 9, NULL, NULL, NULL, NULL, NULL),
(48, 72000, 10, 24, '2019-09-01', '2020-08-01', 12, 3322.43, 2982.65, 339.78, 37791.12, NULL, NULL, 19, '2019-08-31 17:40:49', NULL, 'Y', 6, NULL, 9, NULL, NULL, NULL, NULL, NULL),
(49, 72000, 10, 24, '2019-09-01', '2020-09-01', 13, 3322.43, 3007.5, 314.93, 34783.62, NULL, NULL, 19, '2019-08-31 17:40:49', NULL, 'Y', 6, NULL, 9, NULL, NULL, NULL, NULL, NULL),
(50, 72000, 10, 24, '2019-09-01', '2020-10-01', 14, 3322.43, 3032.57, 289.86, 31751.05, NULL, NULL, 19, '2019-08-31 17:40:49', NULL, 'Y', 6, NULL, 9, NULL, NULL, NULL, NULL, NULL),
(51, 72000, 10, 24, '2019-09-01', '2020-11-01', 15, 3322.43, 3057.84, 264.59, 28693.21, NULL, NULL, 19, '2019-08-31 17:40:49', NULL, 'Y', 6, NULL, 9, NULL, NULL, NULL, NULL, NULL),
(52, 72000, 10, 24, '2019-09-01', '2020-12-01', 16, 3322.43, 3083.32, 239.11, 25609.89, NULL, NULL, 19, '2019-08-31 17:40:49', NULL, 'Y', 6, NULL, 9, NULL, NULL, NULL, NULL, NULL),
(53, 72000, 10, 24, '2019-09-01', '2021-01-01', 17, 3322.43, 3109.01, 213.42, 22500.88, NULL, NULL, 19, '2019-08-31 17:40:49', NULL, 'Y', 6, NULL, 9, NULL, NULL, NULL, NULL, NULL),
(54, 72000, 10, 24, '2019-09-01', '2021-02-01', 18, 3322.43, 3134.92, 187.51, 19365.96, NULL, NULL, 19, '2019-08-31 17:40:49', NULL, 'Y', 6, NULL, 9, NULL, NULL, NULL, NULL, NULL),
(55, 72000, 10, 24, '2019-09-01', '2021-03-01', 19, 3322.43, 3161.05, 161.38, 16204.91, NULL, NULL, 19, '2019-08-31 17:40:49', NULL, 'Y', 6, NULL, 9, NULL, NULL, NULL, NULL, NULL),
(56, 72000, 10, 24, '2019-09-01', '2021-04-01', 20, 3322.43, 3187.39, 135.04, 13017.52, NULL, NULL, 19, '2019-08-31 17:40:49', NULL, 'Y', 6, NULL, 9, NULL, NULL, NULL, NULL, NULL),
(57, 72000, 10, 24, '2019-09-01', '2021-05-01', 21, 3322.43, 3213.95, 108.48, 9803.57, NULL, NULL, 19, '2019-08-31 17:40:49', NULL, 'Y', 6, NULL, 9, NULL, NULL, NULL, NULL, NULL),
(58, 72000, 10, 24, '2019-09-01', '2021-06-01', 22, 3322.43, 3240.73, 81.7, 6562.84, NULL, NULL, 19, '2019-08-31 17:40:49', NULL, 'Y', 6, NULL, 9, NULL, NULL, NULL, NULL, NULL),
(59, 72000, 10, 24, '2019-09-01', '2021-07-01', 23, 3322.43, 3267.74, 54.69, 3295.1, NULL, NULL, 19, '2019-08-31 17:40:49', NULL, 'Y', 6, NULL, 9, NULL, NULL, NULL, NULL, NULL),
(60, 72000, 10, 24, '2019-09-01', '2021-08-01', 24, 3322.43, 3294.97, 27.46, 0, NULL, NULL, 19, '2019-08-31 17:40:49', NULL, 'Y', 6, NULL, 9, NULL, NULL, NULL, NULL, NULL),
(61, 0, 0, 0, '1970-01-01', '1970-01-01', 0, 0, 0, 0, 0, NULL, NULL, 23, '2019-09-01 11:17:05', NULL, 'Y', 6, NULL, 9, '[', NULL, NULL, NULL, NULL),
(62, 2000, 0, 1, '2019-10-01', '2019-08-24', 1, 2000, 2000, 0, 118000, NULL, NULL, 24, '2019-09-01 11:22:50', NULL, 'Y', 6, NULL, 9, 'BOOK', NULL, NULL, NULL, NULL),
(63, 36000, 0, 3, '2019-10-01', '2019-09-01', 2, 10000, 10000, 0, 106000, NULL, NULL, 24, '2019-09-01 11:22:50', NULL, 'Y', 6, NULL, 9, 'ADV', NULL, NULL, NULL, NULL),
(64, 36000, 0, 3, '2019-10-01', '2019-10-01', 3, 12000, 12000, 0, 94000, NULL, NULL, 24, '2019-09-01 11:22:50', NULL, 'Y', 6, NULL, 9, 'ADV', NULL, NULL, NULL, NULL),
(65, 36000, 0, 3, '2019-10-01', '2019-11-01', 4, 12000, 12000, 0, 82000, NULL, NULL, 24, '2019-09-01 11:22:50', NULL, 'Y', 6, NULL, 9, 'ADV', NULL, NULL, NULL, NULL),
(66, 2000, 0, 1, '2019-09-08', '2019-08-24', 1, 2000, 2000, 0, 118000, NULL, NULL, 25, '2019-09-01 11:52:22', NULL, 'Y', 6, NULL, 9, 'BOOK', NULL, NULL, NULL, NULL),
(67, 36000, 0, 1, '2019-09-08', '2019-09-01', 2, 34000, 34000, 0, 82000, NULL, NULL, 25, '2019-09-01 11:52:22', NULL, 'Y', 6, NULL, 9, 'ADV', NULL, NULL, NULL, NULL),
(68, 2000, 0, 1, '2019-10-01', '2019-08-24', 1, 2000, 2000, 0, 118000, NULL, NULL, 27, '2019-09-01 13:33:53', NULL, 'Y', 6, NULL, 9, 'BOOK', 0, 0, 0, NULL),
(69, 36000, 0, 3, '2019-10-01', '2019-09-01', 2, 10000, 10000, 0, 108000, NULL, NULL, 27, '2019-09-01 13:33:53', NULL, 'Y', 6, NULL, 9, 'ADV', 10, 0, 0, NULL),
(70, 36000, 0, 3, '2019-10-01', '2019-10-01', 3, 12000, 12000, 0, 96000, NULL, NULL, 27, '2019-09-01 13:33:53', NULL, 'Y', 6, NULL, 9, 'ADV', 10, 0, 0, NULL),
(71, 36000, 0, 3, '2019-10-01', '2019-11-01', 4, 12000, 12000, 0, 84000, NULL, NULL, 27, '2019-09-01 13:33:53', NULL, 'Y', 6, NULL, 9, 'ADV', 10, 0, 0, NULL),
(72, 27000, 0, 3, '2019-10-01', '2019-09-01', 1, 9000, 9000, 0, 81000, NULL, NULL, 28, '2019-09-01 14:07:18', NULL, 'Y', 6, NULL, 9, 'ADV', 10, 0, 0, NULL),
(73, 27000, 0, 3, '2019-10-01', '2019-10-01', 2, 9000, 9000, 0, 72000, NULL, NULL, 28, '2019-09-01 14:07:18', NULL, 'Y', 6, NULL, 9, 'ADV', 10, 0, 0, NULL),
(74, 27000, 0, 3, '2019-10-01', '2019-11-01', 3, 9000, 9000, 0, 63000, NULL, NULL, 28, '2019-09-01 14:07:18', NULL, 'Y', 6, NULL, 9, 'ADV', 10, 0, 0, NULL),
(75, 27000, 0, 3, '2019-10-01', '2019-09-01', 1, 9000, 9000, 0, 81000, NULL, NULL, 29, '2019-09-01 14:44:12', NULL, 'Y', 6, NULL, 9, 'ADV', 10, 0, 0, NULL),
(76, 27000, 0, 3, '2019-10-01', '2019-10-01', 2, 9000, 9000, 0, 72000, NULL, NULL, 29, '2019-09-01 14:44:12', NULL, 'Y', 6, NULL, 9, 'ADV', 10, 0, 0, NULL),
(77, 27000, 0, 3, '2019-10-01', '2019-11-01', 3, 9000, 9000, 0, 63000, NULL, NULL, 29, '2019-09-01 14:44:12', NULL, 'Y', 6, NULL, 9, 'ADV', 10, 0, 0, NULL),
(78, 63000, 0, 1, '2019-10-01', '2019-12-01', 4, 63000, 63000, 0, 0, NULL, NULL, 29, '2019-09-01 14:44:12', NULL, 'Y', 6, NULL, 9, 'LEFT', 70, 0, 0, NULL),
(79, 2000, 0, 1, '2019-10-01', '2019-08-24', 1, 2000, 2000, 0, 118000, NULL, NULL, 30, '2019-09-01 17:04:03', NULL, 'Y', 6, NULL, 9, 'BOOK', 0, 0, 0, NULL),
(80, 36000, 0, 3, '2019-10-01', '2019-09-01', 2, 10000, 10000, 0, 108000, NULL, NULL, 30, '2019-09-01 17:04:03', NULL, 'Y', 6, NULL, 9, 'ADV', 10, 0, 0, NULL),
(81, 36000, 0, 3, '2019-10-01', '2019-10-01', 3, 12000, 12000, 0, 96000, NULL, NULL, 30, '2019-09-01 17:04:03', NULL, 'Y', 6, NULL, 9, 'ADV', 10, 0, 0, NULL),
(82, 36000, 0, 3, '2019-10-01', '2019-11-01', 4, 12000, 12000, 0, 84000, NULL, NULL, 30, '2019-09-01 17:04:03', NULL, 'Y', 6, NULL, 9, 'ADV', 10, 0, 0, NULL),
(83, 84000, 0, 15, '2019-10-01', '2019-12-01', 5, 5600, 5600, 0, 78400, NULL, NULL, 30, '2019-09-01 17:04:03', NULL, 'Y', 6, NULL, 9, 'LOAN', 0, 0, 0, NULL),
(84, 84000, 0, 15, '2019-10-01', '2020-01-01', 6, 5600, 5600, 0, 72800, NULL, NULL, 30, '2019-09-01 17:04:03', NULL, 'Y', 6, NULL, 9, 'LOAN', 0, 0, 0, NULL),
(85, 84000, 0, 15, '2019-10-01', '2020-02-01', 7, 5600, 5600, 0, 67200, NULL, NULL, 30, '2019-09-01 17:04:03', NULL, 'Y', 6, NULL, 9, 'LOAN', 0, 0, 0, NULL),
(86, 84000, 0, 15, '2019-10-01', '2020-03-01', 8, 5600, 5600, 0, 61600, NULL, NULL, 30, '2019-09-01 17:04:03', NULL, 'Y', 6, NULL, 9, 'LOAN', 0, 0, 0, NULL),
(87, 84000, 0, 15, '2019-10-01', '2020-04-01', 9, 5600, 5600, 0, 56000, NULL, NULL, 30, '2019-09-01 17:04:03', NULL, 'Y', 6, NULL, 9, 'LOAN', 0, 0, 0, NULL),
(88, 84000, 0, 15, '2019-10-01', '2020-05-01', 10, 5600, 5600, 0, 50400, NULL, NULL, 30, '2019-09-01 17:04:03', NULL, 'Y', 6, NULL, 9, 'LOAN', 0, 0, 0, NULL),
(89, 84000, 0, 15, '2019-10-01', '2020-06-01', 11, 5600, 5600, 0, 44800, NULL, NULL, 30, '2019-09-01 17:04:03', NULL, 'Y', 6, NULL, 9, 'LOAN', 0, 0, 0, NULL),
(90, 84000, 0, 15, '2019-10-01', '2020-07-01', 12, 5600, 5600, 0, 39200, NULL, NULL, 30, '2019-09-01 17:04:03', NULL, 'Y', 6, NULL, 9, 'LOAN', 0, 0, 0, NULL),
(91, 84000, 0, 15, '2019-10-01', '2020-08-01', 13, 5600, 5600, 0, 33600, NULL, NULL, 30, '2019-09-01 17:04:03', NULL, 'Y', 6, NULL, 9, 'LOAN', 0, 0, 0, NULL),
(92, 84000, 0, 15, '2019-10-01', '2020-09-01', 14, 5600, 5600, 0, 28000, NULL, NULL, 30, '2019-09-01 17:04:03', NULL, 'Y', 6, NULL, 9, 'LOAN', 0, 0, 0, NULL),
(93, 84000, 0, 15, '2019-10-01', '2020-10-01', 15, 5600, 5600, 0, 22400, NULL, NULL, 30, '2019-09-01 17:04:03', NULL, 'Y', 6, NULL, 9, 'LOAN', 0, 0, 0, NULL),
(94, 84000, 0, 15, '2019-10-01', '2020-11-01', 16, 5600, 5600, 0, 16800, NULL, NULL, 30, '2019-09-01 17:04:03', NULL, 'Y', 6, NULL, 9, 'LOAN', 0, 0, 0, NULL),
(95, 84000, 0, 15, '2019-10-01', '2020-12-01', 17, 5600, 5600, 0, 11200, NULL, NULL, 30, '2019-09-01 17:04:03', NULL, 'Y', 6, NULL, 9, 'LOAN', 0, 0, 0, NULL),
(96, 84000, 0, 15, '2019-10-01', '2021-01-01', 18, 5600, 5600, 0, 5600, NULL, NULL, 30, '2019-09-01 17:04:03', NULL, 'Y', 6, NULL, 9, 'LOAN', 0, 0, 0, NULL),
(97, 84000, 0, 15, '2019-10-01', '2021-02-01', 19, 5600, 5600, 0, 0, NULL, NULL, 30, '2019-09-01 17:04:03', NULL, 'Y', 6, NULL, 9, 'LOAN', 0, 0, 0, NULL),
(98, 36000, 0, 1, '2019-10-01', '2019-09-01', 1, 35280, 35280, 0, 84000, NULL, NULL, 31, '2019-09-01 17:07:45', NULL, 'Y', 6, NULL, 9, 'ADV', 30, 720, 2, NULL),
(99, 84000, 0, 17, '2019-10-01', '2019-10-01', 2, 4941.18, 4941.18, 0, 79058.82, NULL, NULL, 31, '2019-09-01 17:07:45', NULL, 'Y', 6, NULL, 9, 'LOAN', 0, 0, 0, NULL),
(100, 84000, 0, 17, '2019-10-01', '2019-11-01', 3, 4941.18, 4941.18, 0, 74117.64, NULL, NULL, 31, '2019-09-01 17:07:45', NULL, 'Y', 6, NULL, 9, 'LOAN', 0, 0, 0, NULL),
(101, 84000, 0, 17, '2019-10-01', '2019-12-01', 4, 4941.18, 4941.18, 0, 69176.46, NULL, NULL, 31, '2019-09-01 17:07:45', NULL, 'Y', 6, NULL, 9, 'LOAN', 0, 0, 0, NULL),
(102, 84000, 0, 17, '2019-10-01', '2020-01-01', 5, 4941.18, 4941.18, 0, 64235.28, NULL, NULL, 31, '2019-09-01 17:07:45', NULL, 'Y', 6, NULL, 9, 'LOAN', 0, 0, 0, NULL),
(103, 84000, 0, 17, '2019-10-01', '2020-02-01', 6, 4941.18, 4941.18, 0, 59294.1, NULL, NULL, 31, '2019-09-01 17:07:45', NULL, 'Y', 6, NULL, 9, 'LOAN', 0, 0, 0, NULL),
(104, 84000, 0, 17, '2019-10-01', '2020-03-01', 7, 4941.18, 4941.18, 0, 54352.92, NULL, NULL, 31, '2019-09-01 17:07:45', NULL, 'Y', 6, NULL, 9, 'LOAN', 0, 0, 0, NULL),
(105, 84000, 0, 17, '2019-10-01', '2020-04-01', 8, 4941.18, 4941.18, 0, 49411.74, NULL, NULL, 31, '2019-09-01 17:07:45', NULL, 'Y', 6, NULL, 9, 'LOAN', 0, 0, 0, NULL),
(106, 84000, 0, 17, '2019-10-01', '2020-05-01', 9, 4941.18, 4941.18, 0, 44470.56, NULL, NULL, 31, '2019-09-01 17:07:45', NULL, 'Y', 6, NULL, 9, 'LOAN', 0, 0, 0, NULL),
(107, 84000, 0, 17, '2019-10-01', '2020-06-01', 10, 4941.18, 4941.18, 0, 39529.38, NULL, NULL, 31, '2019-09-01 17:07:45', NULL, 'Y', 6, NULL, 9, 'LOAN', 0, 0, 0, NULL),
(108, 84000, 0, 17, '2019-10-01', '2020-07-01', 11, 4941.18, 4941.18, 0, 34588.2, NULL, NULL, 31, '2019-09-01 17:07:45', NULL, 'Y', 6, NULL, 9, 'LOAN', 0, 0, 0, NULL),
(109, 84000, 0, 17, '2019-10-01', '2020-08-01', 12, 4941.18, 4941.18, 0, 29647.02, NULL, NULL, 31, '2019-09-01 17:07:45', NULL, 'Y', 6, NULL, 9, 'LOAN', 0, 0, 0, NULL),
(110, 84000, 0, 17, '2019-10-01', '2020-09-01', 13, 4941.18, 4941.18, 0, 24705.84, NULL, NULL, 31, '2019-09-01 17:07:45', NULL, 'Y', 6, NULL, 9, 'LOAN', 0, 0, 0, NULL),
(111, 84000, 0, 17, '2019-10-01', '2020-10-01', 14, 4941.18, 4941.18, 0, 19764.66, NULL, NULL, 31, '2019-09-01 17:07:45', NULL, 'Y', 6, NULL, 9, 'LOAN', 0, 0, 0, NULL),
(112, 84000, 0, 17, '2019-10-01', '2020-11-01', 15, 4941.18, 4941.18, 0, 14823.48, NULL, NULL, 31, '2019-09-01 17:07:45', NULL, 'Y', 6, NULL, 9, 'LOAN', 0, 0, 0, NULL),
(113, 84000, 0, 17, '2019-10-01', '2020-12-01', 16, 4941.18, 4941.18, 0, 9882.3, NULL, NULL, 31, '2019-09-01 17:07:45', NULL, 'Y', 6, NULL, 9, 'LOAN', 0, 0, 0, NULL),
(114, 84000, 0, 17, '2019-10-01', '2021-01-01', 17, 4941.18, 4941.18, 0, 4941.12, NULL, NULL, 31, '2019-09-01 17:07:45', NULL, 'Y', 6, NULL, 9, 'LOAN', 0, 0, 0, NULL),
(115, 84000, 0, 17, '2019-10-01', '2021-02-01', 18, 4941.18, 4941.18, 0, 0, NULL, NULL, 31, '2019-09-01 17:07:45', NULL, 'Y', 6, NULL, 9, 'LOAN', 0, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_installment_payment`
--

DROP TABLE IF EXISTS `tbl_installment_payment`;
CREATE TABLE IF NOT EXISTS `tbl_installment_payment` (
  `inst_paid_id` int(11) NOT NULL AUTO_INCREMENT,
  `inst_total_paid_amount` double DEFAULT NULL,
  `inst_paid_yn` varchar(1) DEFAULT NULL,
  `inst_paid_date` date DEFAULT NULL,
  `inst_paid_des` text,
  `inst_paid_status` varchar(1) DEFAULT NULL,
  `inst_cancel_yn` varchar(1) DEFAULT NULL,
  `rec_id` int(11) DEFAULT NULL,
  `met_id` int(11) DEFAULT NULL,
  `inst_id` int(11) DEFAULT NULL,
  `regDt` datetime DEFAULT NULL,
  `upDt` datetime DEFAULT NULL,
  `useYn` varchar(1) DEFAULT NULL,
  `regUsr` int(11) DEFAULT NULL,
  `upUsr` int(11) DEFAULT NULL,
  `com_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`inst_paid_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_menu`
--

DROP TABLE IF EXISTS `tbl_menu`;
CREATE TABLE IF NOT EXISTS `tbl_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_nm` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `menu_nm_kh` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `regDt` datetime DEFAULT NULL,
  `menu_icon_nm` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `menu_level` int(11) DEFAULT NULL,
  `menu_order` int(11) DEFAULT NULL,
  `menu_group` int(11) DEFAULT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_menu`
--

INSERT INTO `tbl_menu` (`menu_id`, `menu_nm`, `menu_nm_kh`, `regDt`, `menu_icon_nm`, `menu_level`, `menu_order`, `menu_group`) VALUES
(1, 'Branch', 'គំរោង', '2018-08-24 01:02:15', 'fa fa-home', NULL, 2, 1),
(3, 'Position', 'តួនាទីបុគ្គលិក', '2018-08-24 02:59:23', 'fa fa-user-plus', NULL, 4, 1),
(4, 'Staff', 'បុគ្គលិក', '2018-08-24 02:59:23', 'fa fa-users', 0, 8, 2),
(5, 'User Account', 'គណនី​អ្នកប្រើប្រាស់', '2018-08-24 02:59:23', 'fa fa-user-circle-o', NULL, 5, 1),
(6, 'Supplier', 'អ្នកផ្គត់ផ្គង់', '2018-08-24 02:59:23', 'fa fa-address-card-o', NULL, 7, 2),
(7, 'Category', 'ប្រភេទ', '2018-08-24 02:59:23', 'fa fa-tags', NULL, 3, 1),
(8, 'House', 'អចលនទ្រព្យ', '2018-08-24 02:59:23', 'fa fa-building-o', NULL, 10, 2),
(9, 'Contract', 'កក់ប្រាក់', '2018-08-24 02:59:23', 'fa fa-credit-card', NULL, 11, 3),
(10, 'Sell', 'លក់ចេញ', '2018-08-24 02:59:23', 'fa fa-shopping-cart', NULL, 12, 3),
(11, 'Installment Payment', 'បង់ប្រាក់រំលួស', '2018-08-24 02:59:23', 'fa fa-line-chart', NULL, 13, 3),
(12, 'Dashboard', 'ផ្ទាំងគ្រប់គ្រង', '2018-08-24 03:02:26', 'fa fa-dashboard', NULL, 1, 0),
(13, 'Commission Report', 'កំរៃជើងសារ', '2019-07-10 11:09:02', 'fa fa-pie-chart', NULL, 16, 3),
(14, 'Expend', 'ការចំណាយ', '2019-07-10 11:15:28', 'fa fa-bar-chart', NULL, 14, 3),
(15, 'Payment Report', 'ទិន្នន័យបង់ប្រាក់', '2019-07-10 11:15:28', 'fa fa-area-chart', NULL, 17, 3),
(16, 'Salary', 'ប្រាក់ខែបុគ្គលិក', '2019-07-10 11:15:28', 'fa fa-university', NULL, 15, 3),
(17, 'Income Expenses', 'ចំនូល-ចំណាយ', '2019-07-10 11:15:28', 'fa fa-battery-full', NULL, 18, 3),
(18, 'Commission Setting', 'កំណត់កំរៃជើងសារ', '2019-07-10 11:18:24', 'fa fa-money', NULL, 6, 1),
(19, 'Customer', 'អតិថិជន', '2019-07-11 14:40:11', 'fa fa-address-card', NULL, 9, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_menu_company`
--

DROP TABLE IF EXISTS `tbl_menu_company`;
CREATE TABLE IF NOT EXISTS `tbl_menu_company` (
  `menu_id` int(11) NOT NULL,
  `com_id` int(11) NOT NULL,
  `upDt` datetime DEFAULT NULL,
  `regDt` datetime DEFAULT NULL,
  `useYn` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`menu_id`,`com_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_menu_company`
--

INSERT INTO `tbl_menu_company` (`menu_id`, `com_id`, `upDt`, `regDt`, `useYn`) VALUES
(1, 1, NULL, '2018-09-12 04:54:29', 'Y'),
(1, 2, NULL, '2018-09-12 04:57:53', 'Y'),
(1, 3, NULL, '2018-09-12 05:07:53', 'Y'),
(1, 4, NULL, '2018-09-12 06:09:25', 'Y'),
(1, 5, NULL, '2018-09-12 06:18:22', 'Y'),
(1, 9, NULL, '2019-07-10 11:29:12', 'Y'),
(2, 1, NULL, '2018-09-12 04:54:29', 'Y'),
(2, 2, NULL, '2018-09-12 04:57:53', 'Y'),
(2, 3, NULL, '2018-09-12 05:07:53', 'Y'),
(2, 4, NULL, '2018-09-12 06:09:25', 'Y'),
(2, 5, NULL, '2018-09-12 06:18:22', 'Y'),
(3, 1, NULL, '2018-09-12 04:54:29', 'Y'),
(3, 2, NULL, '2018-09-12 04:57:53', 'Y'),
(3, 3, NULL, '2018-09-12 05:07:53', 'Y'),
(3, 4, NULL, '2018-09-12 06:09:25', 'Y'),
(3, 5, NULL, '2018-09-12 06:18:22', 'Y'),
(3, 9, NULL, '2019-07-10 11:29:12', 'Y'),
(4, 1, NULL, '2018-09-12 04:54:29', 'Y'),
(4, 2, NULL, '2018-09-12 04:57:53', 'Y'),
(4, 3, NULL, '2018-09-12 05:07:53', 'Y'),
(4, 4, NULL, '2018-09-12 06:09:25', 'Y'),
(4, 5, NULL, '2018-09-12 06:18:22', 'Y'),
(4, 9, NULL, '2019-07-10 11:29:12', 'Y'),
(5, 1, NULL, '2018-09-12 04:54:29', 'Y'),
(5, 2, NULL, '2018-09-12 04:57:53', 'Y'),
(5, 3, NULL, '2018-09-12 05:07:53', 'Y'),
(5, 4, NULL, '2018-09-12 06:09:25', 'Y'),
(5, 5, NULL, '2018-09-12 06:18:22', 'Y'),
(5, 9, NULL, '2019-07-10 11:29:12', 'Y'),
(6, 1, NULL, '2018-09-12 04:54:29', 'Y'),
(6, 2, NULL, '2018-09-12 04:57:53', 'Y'),
(6, 3, NULL, '2018-09-12 05:07:53', 'Y'),
(6, 4, NULL, '2018-09-12 06:09:25', 'Y'),
(6, 5, NULL, '2018-09-12 06:18:22', 'Y'),
(6, 9, NULL, '2019-07-10 11:29:12', 'Y'),
(7, 1, NULL, '2018-09-12 04:54:29', 'Y'),
(7, 2, NULL, '2018-09-12 04:57:53', 'Y'),
(7, 3, NULL, '2018-09-12 05:07:53', 'Y'),
(7, 4, NULL, '2018-09-12 06:09:25', 'Y'),
(7, 5, NULL, '2018-09-12 06:18:22', 'Y'),
(7, 9, NULL, '2019-07-10 11:29:12', 'Y'),
(8, 1, NULL, '2018-09-12 04:54:29', 'Y'),
(8, 2, NULL, '2018-09-12 04:57:53', 'Y'),
(8, 3, NULL, '2018-09-12 05:07:53', 'Y'),
(8, 4, NULL, '2018-09-12 06:09:25', 'Y'),
(8, 5, NULL, '2018-09-12 06:18:22', 'Y'),
(8, 9, NULL, '2019-07-10 11:29:12', 'Y'),
(9, 1, NULL, '2018-09-12 04:54:29', 'Y'),
(9, 2, NULL, '2018-09-12 04:57:53', 'Y'),
(9, 3, NULL, '2018-09-12 05:07:53', 'Y'),
(9, 4, NULL, '2018-09-12 06:09:25', 'Y'),
(9, 5, NULL, '2018-09-12 06:18:22', 'Y'),
(9, 9, NULL, '2019-07-10 11:29:12', 'Y'),
(10, 1, NULL, '2018-09-12 04:54:29', 'Y'),
(10, 2, NULL, '2018-09-12 04:57:53', 'Y'),
(10, 3, NULL, '2018-09-12 05:07:53', 'Y'),
(10, 4, NULL, '2018-09-12 06:09:25', 'Y'),
(10, 5, NULL, '2018-09-12 06:18:22', 'Y'),
(10, 9, NULL, '2019-07-10 11:29:12', 'Y'),
(11, 1, NULL, '2018-09-12 04:54:29', 'Y'),
(11, 2, NULL, '2018-09-12 04:57:53', 'Y'),
(11, 3, NULL, '2018-09-12 05:07:53', 'Y'),
(11, 4, NULL, '2018-09-12 06:09:25', 'Y'),
(11, 5, NULL, '2018-09-12 06:18:22', 'Y'),
(11, 9, NULL, '2019-07-10 11:29:12', 'Y'),
(12, 1, NULL, '2018-09-12 04:54:29', 'Y'),
(12, 2, NULL, '2018-09-12 04:57:53', 'Y'),
(12, 3, NULL, '2018-09-12 05:07:53', 'Y'),
(12, 4, NULL, '2018-09-12 06:09:25', 'Y'),
(12, 5, NULL, '2018-09-12 06:18:22', 'Y'),
(12, 9, NULL, '2019-07-10 11:29:12', 'Y'),
(13, 9, NULL, '2019-07-10 11:29:12', 'Y'),
(14, 9, NULL, '2019-07-10 11:29:12', 'Y'),
(15, 9, NULL, '2019-07-10 11:29:12', 'Y'),
(16, 9, NULL, '2019-07-10 11:29:12', 'Y'),
(17, 9, NULL, '2019-07-10 11:29:12', 'Y'),
(18, 9, NULL, '2019-07-10 11:29:12', 'Y'),
(19, 9, '2019-07-11 14:42:50', '2019-07-11 14:42:50', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_menu_user`
--

DROP TABLE IF EXISTS `tbl_menu_user`;
CREATE TABLE IF NOT EXISTS `tbl_menu_user` (
  `menu_id` int(11) NOT NULL,
  `usr_id` int(11) NOT NULL,
  `upDt` datetime DEFAULT NULL,
  `regDt` datetime DEFAULT NULL,
  `useYn` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`menu_id`,`usr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_menu_user`
--

INSERT INTO `tbl_menu_user` (`menu_id`, `usr_id`, `upDt`, `regDt`, `useYn`) VALUES
(1, 1, NULL, '2018-09-12 04:54:29', 'Y'),
(1, 2, NULL, '2018-09-12 04:57:53', 'Y'),
(1, 3, NULL, '2018-09-12 05:07:53', 'Y'),
(1, 4, NULL, '2018-09-12 06:09:25', 'Y'),
(1, 5, NULL, '2018-09-12 06:18:22', 'Y'),
(1, 6, NULL, '2019-07-10 11:29:12', 'Y'),
(1, 7, NULL, '2019-07-15 09:29:19', 'Y'),
(1, 10, NULL, '2019-07-18 14:40:36', 'Y'),
(1, 11, NULL, '2019-07-18 14:40:52', 'Y'),
(1, 12, NULL, '2019-07-22 21:37:29', 'Y'),
(1, 13, NULL, '2019-07-19 12:38:35', 'Y'),
(2, 1, NULL, '2018-09-12 04:54:29', 'Y'),
(2, 2, NULL, '2018-09-12 04:57:53', 'Y'),
(2, 3, NULL, '2018-09-12 05:07:53', 'Y'),
(2, 4, NULL, '2018-09-12 06:09:25', 'Y'),
(2, 5, NULL, '2018-09-12 06:18:22', 'Y'),
(3, 1, NULL, '2018-09-12 04:54:29', 'Y'),
(3, 2, NULL, '2018-09-12 04:57:53', 'Y'),
(3, 3, NULL, '2018-09-12 05:07:53', 'Y'),
(3, 4, NULL, '2018-09-12 06:09:25', 'Y'),
(3, 5, NULL, '2018-09-12 06:18:22', 'Y'),
(3, 6, NULL, '2019-07-10 11:29:12', 'Y'),
(3, 7, NULL, '2019-07-15 09:29:19', 'Y'),
(3, 10, NULL, '2019-07-18 14:40:36', 'Y'),
(3, 11, NULL, '2019-07-18 14:40:52', 'Y'),
(3, 13, NULL, '2019-07-19 12:38:35', 'Y'),
(4, 1, NULL, '2018-09-12 04:54:29', 'Y'),
(4, 2, NULL, '2018-09-12 04:57:53', 'Y'),
(4, 3, NULL, '2018-09-12 05:07:53', 'Y'),
(4, 4, NULL, '2018-09-12 06:09:25', 'Y'),
(4, 5, NULL, '2018-09-12 06:18:22', 'Y'),
(4, 6, NULL, '2019-07-10 11:29:12', 'Y'),
(4, 8, '2019-07-22 14:33:43', '2019-07-15 09:30:36', 'N'),
(4, 9, NULL, '2019-07-15 09:33:25', 'Y'),
(4, 10, NULL, '2019-07-18 14:40:36', 'Y'),
(4, 11, NULL, '2019-07-18 14:40:52', 'Y'),
(4, 12, NULL, '2019-07-22 21:37:29', 'Y'),
(4, 13, NULL, '2019-07-19 12:38:35', 'Y'),
(5, 1, NULL, '2018-09-12 04:54:29', 'Y'),
(5, 2, NULL, '2018-09-12 04:57:53', 'Y'),
(5, 3, NULL, '2018-09-12 05:07:53', 'Y'),
(5, 4, NULL, '2018-09-12 06:09:25', 'Y'),
(5, 5, NULL, '2018-09-12 06:18:22', 'Y'),
(5, 6, NULL, '2019-07-10 11:29:12', 'Y'),
(5, 7, NULL, '2019-07-15 09:29:19', 'Y'),
(5, 10, NULL, '2019-07-18 14:40:36', 'Y'),
(5, 11, NULL, '2019-07-18 14:40:52', 'Y'),
(5, 12, NULL, '2019-07-22 21:37:29', 'Y'),
(5, 13, NULL, '2019-07-19 12:38:35', 'Y'),
(6, 1, NULL, '2018-09-12 04:54:29', 'Y'),
(6, 2, NULL, '2018-09-12 04:57:53', 'Y'),
(6, 3, NULL, '2018-09-12 05:07:53', 'Y'),
(6, 4, NULL, '2018-09-12 06:09:25', 'Y'),
(6, 5, NULL, '2018-09-12 06:18:22', 'Y'),
(6, 6, NULL, '2019-07-10 11:29:12', 'Y'),
(6, 8, '2019-07-22 14:33:43', '2019-07-15 09:30:36', 'N'),
(6, 9, NULL, '2019-07-15 09:33:25', 'Y'),
(6, 10, NULL, '2019-07-18 14:40:36', 'Y'),
(6, 11, NULL, '2019-07-18 14:40:52', 'Y'),
(6, 12, NULL, '2019-07-22 21:37:29', 'Y'),
(6, 13, NULL, '2019-07-19 12:38:35', 'Y'),
(7, 1, NULL, '2018-09-12 04:54:29', 'Y'),
(7, 2, NULL, '2018-09-12 04:57:53', 'Y'),
(7, 3, NULL, '2018-09-12 05:07:53', 'Y'),
(7, 4, NULL, '2018-09-12 06:09:25', 'Y'),
(7, 5, NULL, '2018-09-12 06:18:22', 'Y'),
(7, 6, NULL, '2019-07-10 11:29:12', 'Y'),
(7, 7, NULL, '2019-07-15 09:29:19', 'Y'),
(7, 10, NULL, '2019-07-18 14:40:36', 'Y'),
(7, 11, NULL, '2019-07-18 14:40:52', 'Y'),
(7, 12, NULL, '2019-07-22 21:37:29', 'Y'),
(7, 13, NULL, '2019-07-19 12:38:35', 'Y'),
(8, 1, NULL, '2018-09-12 04:54:29', 'Y'),
(8, 2, NULL, '2018-09-12 04:57:53', 'Y'),
(8, 3, NULL, '2018-09-12 05:07:53', 'Y'),
(8, 4, NULL, '2018-09-12 06:09:25', 'Y'),
(8, 5, NULL, '2018-09-12 06:18:22', 'Y'),
(8, 6, NULL, '2019-07-10 11:29:12', 'Y'),
(8, 8, '2019-07-22 14:33:43', '2019-07-15 09:30:36', 'N'),
(8, 9, NULL, '2019-07-15 09:33:25', 'Y'),
(8, 10, NULL, '2019-07-18 14:40:36', 'Y'),
(8, 11, NULL, '2019-07-18 14:40:52', 'Y'),
(8, 12, NULL, '2019-07-22 21:37:29', 'Y'),
(8, 13, NULL, '2019-07-19 12:38:35', 'Y'),
(9, 1, NULL, '2018-09-12 04:54:29', 'Y'),
(9, 2, NULL, '2018-09-12 04:57:53', 'Y'),
(9, 3, NULL, '2018-09-12 05:07:53', 'Y'),
(9, 4, NULL, '2018-09-12 06:09:25', 'Y'),
(9, 5, NULL, '2018-09-12 06:18:22', 'Y'),
(9, 6, NULL, '2019-07-10 11:29:12', 'Y'),
(9, 8, '2019-07-22 14:33:43', '2019-07-15 09:30:36', 'N'),
(9, 11, NULL, '2019-07-18 14:40:52', 'Y'),
(9, 12, NULL, '2019-07-22 21:37:29', 'Y'),
(9, 13, NULL, '2019-07-19 12:38:35', 'Y'),
(9, 14, NULL, '2019-07-22 16:56:57', 'Y'),
(10, 1, NULL, '2018-09-12 04:54:29', 'Y'),
(10, 2, NULL, '2018-09-12 04:57:53', 'Y'),
(10, 3, NULL, '2018-09-12 05:07:53', 'Y'),
(10, 4, NULL, '2018-09-12 06:09:25', 'Y'),
(10, 5, NULL, '2018-09-12 06:18:22', 'Y'),
(10, 6, NULL, '2019-07-10 11:29:12', 'Y'),
(10, 8, '2019-07-22 14:33:43', '2019-07-15 09:30:36', 'N'),
(10, 11, NULL, '2019-07-18 14:40:52', 'Y'),
(10, 12, NULL, '2019-07-22 21:37:29', 'Y'),
(10, 13, NULL, '2019-07-19 12:38:35', 'Y'),
(10, 14, NULL, '2019-07-22 16:56:57', 'Y'),
(11, 1, NULL, '2018-09-12 04:54:29', 'Y'),
(11, 2, NULL, '2018-09-12 04:57:53', 'Y'),
(11, 3, NULL, '2018-09-12 05:07:53', 'Y'),
(11, 4, NULL, '2018-09-12 06:09:25', 'Y'),
(11, 5, NULL, '2018-09-12 06:18:22', 'Y'),
(11, 6, NULL, '2019-07-10 11:29:12', 'Y'),
(11, 8, '2019-07-22 14:33:43', '2019-07-15 09:30:36', 'N'),
(11, 11, NULL, '2019-07-18 14:40:52', 'Y'),
(11, 12, NULL, '2019-07-22 21:37:29', 'Y'),
(11, 13, NULL, '2019-07-19 12:38:35', 'Y'),
(11, 14, NULL, '2019-07-22 16:56:57', 'Y'),
(12, 1, NULL, '2018-09-12 04:54:29', 'Y'),
(12, 2, NULL, '2018-09-12 04:57:53', 'Y'),
(12, 3, NULL, '2018-09-12 05:07:53', 'Y'),
(12, 4, NULL, '2018-09-12 06:09:25', 'Y'),
(12, 5, NULL, '2018-09-12 06:18:22', 'Y'),
(12, 6, NULL, '2019-07-10 11:29:12', 'Y'),
(12, 7, NULL, '2019-07-15 09:29:19', 'Y'),
(12, 8, '2019-07-22 14:33:43', '2019-07-15 09:30:36', 'N'),
(12, 9, NULL, '2019-07-15 09:33:25', 'Y'),
(12, 10, NULL, '2019-07-18 14:40:36', 'Y'),
(12, 11, NULL, '2019-07-18 14:40:52', 'Y'),
(12, 12, NULL, '2019-07-22 21:37:29', 'Y'),
(12, 13, NULL, '2019-07-19 12:38:35', 'Y'),
(12, 14, NULL, '2019-07-22 16:56:57', 'Y'),
(13, 6, NULL, '2019-07-10 11:29:12', 'Y'),
(13, 8, '2019-07-22 14:33:43', '2019-07-15 09:30:36', 'N'),
(13, 11, NULL, '2019-07-18 14:40:52', 'Y'),
(13, 12, NULL, '2019-07-22 21:37:29', 'Y'),
(13, 13, NULL, '2019-07-19 12:38:35', 'Y'),
(13, 14, NULL, '2019-07-22 16:56:57', 'Y'),
(14, 6, NULL, '2019-07-10 11:29:12', 'Y'),
(14, 8, '2019-07-22 14:33:43', '2019-07-15 09:30:36', 'N'),
(14, 11, NULL, '2019-07-18 14:40:52', 'Y'),
(14, 12, NULL, '2019-07-22 21:37:29', 'Y'),
(14, 13, NULL, '2019-07-19 12:38:35', 'Y'),
(14, 14, NULL, '2019-07-22 16:56:57', 'Y'),
(15, 6, NULL, '2019-07-10 11:29:12', 'Y'),
(15, 8, '2019-07-22 14:33:43', '2019-07-15 09:30:36', 'N'),
(15, 11, NULL, '2019-07-18 14:40:52', 'Y'),
(15, 12, NULL, '2019-07-22 21:37:29', 'Y'),
(15, 13, NULL, '2019-07-19 12:38:35', 'Y'),
(15, 14, NULL, '2019-07-22 16:56:57', 'Y'),
(16, 6, NULL, '2019-07-10 11:29:12', 'Y'),
(16, 8, '2019-07-22 14:33:43', '2019-07-15 09:30:36', 'N'),
(16, 11, NULL, '2019-07-18 14:40:52', 'Y'),
(16, 12, NULL, '2019-07-22 21:37:29', 'Y'),
(16, 13, NULL, '2019-07-19 12:38:35', 'Y'),
(16, 14, NULL, '2019-07-22 16:56:57', 'Y'),
(17, 6, NULL, '2019-07-10 11:29:12', 'Y'),
(17, 8, '2019-07-22 14:33:43', '2019-07-15 09:30:36', 'N'),
(17, 11, NULL, '2019-07-18 14:40:52', 'Y'),
(17, 12, NULL, '2019-07-22 21:37:29', 'Y'),
(17, 13, NULL, '2019-07-19 12:38:35', 'Y'),
(17, 14, NULL, '2019-07-22 16:56:57', 'Y'),
(18, 6, NULL, '2019-07-10 11:29:12', 'Y'),
(18, 7, NULL, '2019-07-15 09:29:19', 'Y'),
(18, 10, NULL, '2019-07-18 14:40:36', 'Y'),
(18, 11, NULL, '2019-07-18 14:40:52', 'Y'),
(18, 12, NULL, '2019-07-22 21:37:29', 'Y'),
(18, 13, NULL, '2019-07-19 12:38:35', 'Y'),
(19, 6, '2019-07-11 14:47:29', '2019-07-11 14:47:29', 'Y'),
(19, 8, '2019-07-22 14:33:43', '2019-07-15 09:30:36', 'N'),
(19, 9, NULL, '2019-07-15 09:33:25', 'Y'),
(19, 10, NULL, '2019-07-18 14:40:36', 'Y'),
(19, 11, NULL, '2019-07-18 14:40:52', 'Y'),
(19, 12, NULL, '2019-07-22 21:37:29', 'Y'),
(19, 13, NULL, '2019-07-19 12:38:35', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_move`
--

DROP TABLE IF EXISTS `tbl_move`;
CREATE TABLE IF NOT EXISTS `tbl_move` (
  `mov_id` int(11) NOT NULL AUTO_INCREMENT,
  `mov_total_qty` int(11) NOT NULL,
  `mov_date` date NOT NULL,
  `mov_des` text COLLATE utf8_unicode_ci,
  `regDt` datetime DEFAULT NULL,
  `upDt` datetime DEFAULT NULL,
  `useYn` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sto_out_id` int(11) NOT NULL,
  `sto_in_id` int(11) NOT NULL,
  `sta_id` int(11) NOT NULL,
  `regUsr` int(11) NOT NULL,
  `upUsr` int(11) NOT NULL,
  `com_id` int(11) NOT NULL,
  PRIMARY KEY (`mov_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_move_detail`
--

DROP TABLE IF EXISTS `tbl_move_detail`;
CREATE TABLE IF NOT EXISTS `tbl_move_detail` (
  `mov_id` int(11) NOT NULL,
  `pro_id` int(11) NOT NULL,
  `pro_qty` int(11) NOT NULL,
  `regDt` datetime DEFAULT NULL,
  `upDt` datetime DEFAULT NULL,
  `useYn` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `regUsr` int(11) NOT NULL,
  `upUsr` int(11) NOT NULL,
  `com_id` int(11) NOT NULL,
  PRIMARY KEY (`mov_id`,`pro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_payment_method`
--

DROP TABLE IF EXISTS `tbl_payment_method`;
CREATE TABLE IF NOT EXISTS `tbl_payment_method` (
  `met_id` int(11) NOT NULL AUTO_INCREMENT,
  `met_nm` varchar(30) NOT NULL,
  `met_nm_kh` varchar(15) NOT NULL,
  PRIMARY KEY (`met_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_payment_method`
--

INSERT INTO `tbl_payment_method` (`met_id`, `met_nm`, `met_nm_kh`) VALUES
(1, 'Cash', 'សាច់ប្រាក់'),
(2, 'ABA Bank', 'ធនាគារ ABA');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_position`
--

DROP TABLE IF EXISTS `tbl_position`;
CREATE TABLE IF NOT EXISTS `tbl_position` (
  `pos_id` int(11) NOT NULL AUTO_INCREMENT,
  `pos_nm` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `pos_nm_kh` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pos_des` text COLLATE utf8_unicode_ci,
  `regDt` datetime DEFAULT NULL,
  `upDt` datetime DEFAULT NULL,
  `useYn` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `regUsr` int(11) NOT NULL,
  `upUsr` int(11) NOT NULL,
  `com_id` int(11) NOT NULL,
  PRIMARY KEY (`pos_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_position`
--

INSERT INTO `tbl_position` (`pos_id`, `pos_nm`, `pos_nm_kh`, `pos_des`, `regDt`, `upDt`, `useYn`, `regUsr`, `upUsr`, `com_id`) VALUES
(1, 'Admin', 'ម្ចាស់ក្រុមហ៊ុន', NULL, '2018-09-12 11:50:39', NULL, 'Y', 0, 0, 1),
(2, 'Admin', 'ម្ចាស់ក្រុមហ៊ុន', NULL, '2018-09-12 11:54:03', NULL, 'Y', 0, 0, 2),
(3, 'Admin', 'ម្ចាស់ក្រុមហ៊ុន', NULL, '2018-09-12 12:04:03', NULL, 'Y', 0, 0, 3),
(4, 'Admin', 'ម្ចាស់ក្រុមហ៊ុន', NULL, '2018-09-12 13:05:35', NULL, 'Y', 0, 0, 4),
(5, 'Admin', 'ម្ចាស់ក្រុមហ៊ុន', NULL, '2018-09-12 13:14:32', '2018-09-29 04:01:35', 'Y', 0, 0, 5),
(6, 'AAARRR', 'AAAAA', 'AAAAA', '2018-09-29 06:33:46', '2018-10-26 07:29:17', 'Y', 5, 0, 5),
(7, 'BBB', 'BBB', 'BBBB', '2018-09-29 06:37:02', '2018-10-26 08:15:59', 'N', 5, 0, 5),
(8, 'CCUpdate', 'CCCC', 'CCCC', '2018-09-29 06:38:17', '2018-09-29 06:39:03', 'Y', 5, 0, 5),
(9, 'kkk', 'kkkk', 'kkk', '2018-10-26 07:06:49', NULL, 'Y', 5, 0, 5),
(10, 'RRR', 'rRR', '', '2018-10-26 07:26:22', NULL, 'Y', 5, 0, 5),
(11, 'TTTT', 'ខ្មែរ', '', '2018-10-26 07:28:51', '2018-11-07 07:05:08', 'Y', 5, 0, 5),
(12, 'Admin', 'ម្ចាស់ក្រុមហ៊ុន', NULL, '2019-07-10 11:29:12', NULL, 'Y', 0, 0, 9),
(13, 'Account', 'គណនី', '', '2019-07-15 02:14:56', NULL, 'Y', 6, 0, 9);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product`
--

DROP TABLE IF EXISTS `tbl_product`;
CREATE TABLE IF NOT EXISTS `tbl_product` (
  `pro_id` int(11) NOT NULL AUTO_INCREMENT,
  `pro_code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pro_price` double DEFAULT NULL,
  `pro_sale_price` double DEFAULT NULL,
  `pro_number` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'house No;',
  `pro_street` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `pro_photo` text COLLATE utf8_unicode_ci,
  `pro_length` double DEFAULT NULL,
  `pro_width` double DEFAULT NULL,
  `pro_area` double DEFAULT NULL,
  `pro_room` int(11) DEFAULT NULL,
  `pro_toilet` int(11) DEFAULT NULL,
  `pro_floor` int(11) DEFAULT NULL,
  `pro_des` text COLLATE utf8_unicode_ci,
  `pro_status` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `regDt` datetime DEFAULT NULL,
  `upDt` datetime DEFAULT NULL,
  `useYn` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `regUsr` int(11) NOT NULL,
  `upUsr` int(11) NOT NULL,
  `com_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `bra_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`pro_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_product`
--

INSERT INTO `tbl_product` (`pro_id`, `pro_code`, `pro_price`, `pro_sale_price`, `pro_number`, `pro_street`, `pro_photo`, `pro_length`, `pro_width`, `pro_area`, `pro_room`, `pro_toilet`, `pro_floor`, `pro_des`, `pro_status`, `regDt`, `upDt`, `useYn`, `regUsr`, `upUsr`, `com_id`, `cat_id`, `bra_id`) VALUES
(1, 'CHV-01', 90000, 0, '14', '122', '', 12, 5, 60, 5, 3, 3, 'TESTING', 'S', '2019-07-22 16:20:10', '2019-09-01 14:44:12', 'Y', 6, 6, 9, 1, 28),
(2, 'CCCC', 120000, 0, '11', '111', '', 111, 11, 1111, 111, 111, 1111, '1111', 'S', '2019-07-22 16:27:43', '2019-09-01 17:07:45', 'Y', 6, 6, 9, 2, 29);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sale_payment`
--

DROP TABLE IF EXISTS `tbl_sale_payment`;
CREATE TABLE IF NOT EXISTS `tbl_sale_payment` (
  `sale_pay_id` int(11) NOT NULL AUTO_INCREMENT,
  `sale_pay_date` date DEFAULT NULL,
  `sale_pay_amt_cash` double DEFAULT NULL,
  `sale_pay_amt_per` double DEFAULT NULL,
  `sale_pay_tran_id` varchar(100) DEFAULT NULL,
  `sale_pay_met_id` int(11) DEFAULT NULL,
  `rec_id` int(11) DEFAULT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `sell_id` int(11) DEFAULT NULL,
  `regDt` datetime DEFAULT NULL,
  `upDt` datetime DEFAULT NULL,
  `useYn` varchar(1) DEFAULT NULL,
  `regUsr` int(11) DEFAULT NULL,
  `upUsr` int(11) DEFAULT NULL,
  `com_id` int(11) DEFAULT NULL,
  `sale_pay_code` varchar(10) DEFAULT NULL,
  `sale_pay_real_amount` double DEFAULT NULL,
  `sale_pay_dis_cash` double DEFAULT NULL,
  `sale_pay_dis_per` double DEFAULT NULL,
  `sale_pay_penalty` double DEFAULT NULL,
  PRIMARY KEY (`sale_pay_id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_sale_payment`
--

INSERT INTO `tbl_sale_payment` (`sale_pay_id`, `sale_pay_date`, `sale_pay_amt_cash`, `sale_pay_amt_per`, `sale_pay_tran_id`, `sale_pay_met_id`, `rec_id`, `seller_id`, `sell_id`, `regDt`, `upDt`, `useYn`, `regUsr`, `upUsr`, `com_id`, `sale_pay_code`, `sale_pay_real_amount`, `sale_pay_dis_cash`, `sale_pay_dis_per`, `sale_pay_penalty`) VALUES
(1, '2019-08-25', 34000, 30, '', 1, 13, NULL, 4, '2019-08-25 14:55:21', NULL, 'Y', 6, NULL, 9, '000002', NULL, NULL, NULL, NULL),
(2, '2019-08-25', 34000, 30, 'fgsfgsdgd', 2, 12, NULL, 5, '2019-08-25 15:10:13', NULL, 'Y', 6, NULL, 9, '000002', NULL, NULL, NULL, NULL),
(3, '2019-08-25', 34000, 30, '', 1, 13, NULL, 6, '2019-08-25 15:25:17', NULL, 'Y', 6, NULL, 9, '000002', NULL, NULL, NULL, NULL),
(4, '2019-08-25', 34000, 30, '', 1, 13, NULL, 7, '2019-08-25 15:29:10', NULL, 'Y', 6, NULL, 9, '000002', NULL, NULL, NULL, NULL),
(5, '2019-08-25', 10000, 10, 'dfadfdasf', 1, 13, NULL, 8, '2019-08-25 15:33:22', NULL, 'Y', 6, NULL, 9, '000001', NULL, NULL, NULL, NULL),
(6, '2019-08-25', 27000, 30, 'fgdhdhfdh', 1, 13, NULL, 9, '2019-08-25 21:08:52', NULL, 'Y', 6, NULL, 9, '000002', NULL, NULL, NULL, NULL),
(7, '2019-08-25', 34000, 30, 'rrrrrrrrrrrrr', 1, 12, NULL, 10, '2019-08-25 23:35:19', NULL, 'Y', 6, NULL, 9, '000001', NULL, NULL, NULL, NULL),
(9, '2019-08-26', 23320, 20, 'kkkkkkkkk', 2, 13, NULL, 10, '2019-08-26 21:52:00', NULL, 'Y', 6, NULL, 9, '000001', NULL, NULL, NULL, NULL),
(10, '2019-08-26', 34000, 30, 'eee34567', 2, 13, NULL, 11, '2019-08-26 21:59:11', NULL, 'Y', 6, NULL, 9, '000001', NULL, NULL, NULL, NULL),
(11, '2019-08-26', 23280, 20, '', 1, 12, NULL, 11, '2019-08-26 22:00:54', NULL, 'Y', 6, NULL, 9, '000001', NULL, NULL, NULL, NULL),
(12, '2019-08-26', 34000, 30, '', 1, 13, NULL, 12, '2019-08-26 22:25:39', NULL, 'Y', 6, NULL, 9, '000001', NULL, NULL, NULL, NULL),
(13, '2019-08-26', 36000, 30, 'ghjgfjfgj', 2, 12, NULL, 14, '2019-08-26 23:05:33', NULL, 'Y', 6, NULL, 9, '000001', 30400, 3600, 10, NULL),
(15, '2019-08-26', 24000, 20, '546456', 1, 13, NULL, 14, '2019-08-26 23:21:14', NULL, 'Y', 6, NULL, 9, '000001', 24000, NULL, NULL, NULL),
(16, '2019-08-27', 36000, 30, '', 1, 12, NULL, 15, '2019-08-27 20:24:29', NULL, 'Y', 6, NULL, 9, '000001', 33280, 720, 2, NULL),
(17, '2019-08-27', 36000, 30, '', 1, 12, NULL, 16, '2019-08-27 20:25:15', NULL, 'Y', 6, NULL, 9, '000001', 33280, 720, 2, NULL),
(18, '2019-08-27', 36000, 30, '', 1, 12, NULL, 17, '2019-08-27 20:26:00', NULL, 'Y', 6, NULL, 9, '000001', 33280, 720, 2, NULL),
(19, '2019-08-27', 36000, 30, '', 1, 13, NULL, 18, '2019-08-27 20:29:20', NULL, 'Y', 6, NULL, 9, '000001', 30400, 3600, 10, NULL),
(20, '2019-08-27', 12000, 10, 'aaaaaaaaa', 2, 12, NULL, 19, '2019-08-27 22:15:31', NULL, 'Y', 6, NULL, 9, '000002', 9760, 240, 2, NULL),
(21, '2019-08-27', 12000, 10, '', 1, 13, NULL, 19, '2019-08-27 23:50:23', NULL, 'Y', 6, NULL, 9, '000002', 12010, NULL, NULL, 10),
(22, '2019-08-27', 12000, 10, '', 2, 13, NULL, 19, '2019-08-27 23:53:58', NULL, 'Y', 6, NULL, 9, '000002', 11880, NULL, NULL, 0),
(23, '2019-08-27', 12000, 10, '', 1, 13, NULL, 19, '2019-08-27 23:55:06', NULL, 'Y', 6, NULL, 9, '000002', 12000, NULL, NULL, 0),
(24, '2019-08-31', 12000, 10, '123456789', 1, 13, NULL, 20, '2019-08-31 18:19:05', NULL, 'Y', 6, NULL, 9, '000002', 10000, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sell`
--

DROP TABLE IF EXISTS `tbl_sell`;
CREATE TABLE IF NOT EXISTS `tbl_sell` (
  `sell_id` int(11) NOT NULL AUTO_INCREMENT,
  `sell_date` date DEFAULT NULL,
  `sell_total_price` double DEFAULT NULL,
  `sell_dis_per` double DEFAULT NULL,
  `sell_dis_amt` double DEFAULT NULL,
  `sell_price_before_dis` double DEFAULT NULL,
  `sell_des` text,
  `sell_code` varchar(10) DEFAULT NULL,
  `con_id` int(11) DEFAULT NULL,
  `rec_id` int(11) DEFAULT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `regDt` datetime DEFAULT NULL,
  `upDt` datetime DEFAULT NULL,
  `useYn` varchar(1) DEFAULT NULL,
  `regUsr` int(11) DEFAULT NULL,
  `upUsr` int(11) DEFAULT NULL,
  `com_id` int(11) DEFAULT NULL,
  `cus_id` int(11) DEFAULT NULL,
  `con_type_id` int(11) DEFAULT NULL,
  `sell_inst_yn` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`sell_id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_sell`
--

INSERT INTO `tbl_sell` (`sell_id`, `sell_date`, `sell_total_price`, `sell_dis_per`, `sell_dis_amt`, `sell_price_before_dis`, `sell_des`, `sell_code`, `con_id`, `rec_id`, `seller_id`, `regDt`, `upDt`, `useYn`, `regUsr`, `upUsr`, `com_id`, `cus_id`, `con_type_id`, `sell_inst_yn`) VALUES
(1, '2019-08-25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13, NULL, '2019-08-25 14:51:48', NULL, 'Y', 6, NULL, 9, NULL, NULL, NULL),
(2, '2019-08-25', NULL, NULL, NULL, NULL, NULL, '000002', NULL, 13, NULL, '2019-08-25 14:53:12', NULL, 'Y', 6, NULL, 9, NULL, NULL, NULL),
(3, '2019-08-25', NULL, NULL, NULL, NULL, NULL, '000003', NULL, 13, NULL, '2019-08-25 14:54:14', NULL, 'Y', 6, NULL, 9, NULL, NULL, NULL),
(4, '2019-08-25', NULL, NULL, NULL, NULL, NULL, '000004', NULL, 13, NULL, '2019-08-25 14:55:21', NULL, 'Y', 6, NULL, 9, NULL, NULL, NULL),
(5, '2019-08-25', 0, NULL, NULL, NULL, '', '000005', NULL, 12, 13, '2019-08-25 15:10:13', NULL, 'Y', 6, NULL, 9, 13, 3, NULL),
(6, '2019-08-25', 120000, NULL, NULL, NULL, '', '000006', NULL, 13, 13, '2019-08-25 15:25:17', NULL, 'Y', 6, NULL, 9, 13, 3, NULL),
(7, '2019-08-25', 120000, NULL, NULL, NULL, '', '000007', NULL, 13, 13, '2019-08-25 15:29:10', NULL, 'Y', 6, NULL, 9, 13, 3, NULL),
(8, '2019-08-25', 120000, NULL, NULL, NULL, '', '000008', 26, 13, 13, '2019-08-25 15:33:22', NULL, 'Y', 6, NULL, 9, 13, 3, NULL),
(9, '2019-08-25', 89460, NULL, NULL, NULL, 'add on nonnon', '000009', 0, 13, 13, '2019-08-25 21:08:52', NULL, 'Y', 6, NULL, 9, 13, 1, NULL),
(10, '2019-08-25', 116600, 10, 3400, 120000, '', '000010', 26, 12, 13, '2019-08-25 23:35:19', NULL, 'Y', 6, NULL, 9, 13, 3, NULL),
(11, '2019-08-26', 116400, 10, 3600, 120000, '', '000011', 26, 13, 13, '2019-08-26 21:59:11', NULL, 'Y', 6, NULL, 9, 13, 3, NULL),
(12, '2019-08-26', 32400, 10, 3600, 120000, '', '000012', 26, 13, 13, '2019-08-26 22:25:39', NULL, 'Y', 6, NULL, 9, 13, 3, NULL),
(13, '2019-08-26', 120000, NULL, NULL, NULL, '', '000013', 26, 13, 13, '2019-08-26 23:04:12', NULL, 'Y', 6, NULL, 9, 13, 3, NULL),
(14, '2019-08-26', 120000, NULL, NULL, NULL, '', '000014', 26, 12, 13, '2019-08-26 23:05:33', NULL, 'Y', 6, NULL, 9, 13, 3, NULL),
(15, '2019-08-27', 120000, NULL, NULL, NULL, '', '000015', 26, 12, 13, '2019-08-27 20:24:29', NULL, 'Y', 6, NULL, 9, 13, 3, NULL),
(16, '2019-08-27', 120000, NULL, NULL, NULL, '', '000016', 26, 12, 13, '2019-08-27 20:25:15', NULL, 'Y', 6, NULL, 9, 13, 3, NULL),
(17, '2019-08-27', 120000, NULL, NULL, NULL, '', '000017', 26, 12, 13, '2019-08-27 20:26:00', NULL, 'Y', 6, NULL, 9, 13, 3, NULL),
(18, '2019-08-27', 120000, NULL, NULL, NULL, '', '000018', 26, 13, 13, '2019-08-27 20:29:20', NULL, 'Y', 6, NULL, 9, 13, 3, NULL),
(19, '2019-08-27', 120000, NULL, NULL, NULL, '', '000019', 26, 12, 13, '2019-08-27 22:15:31', NULL, 'Y', 6, NULL, 9, 13, 3, NULL),
(20, '2019-08-31', 120000, NULL, NULL, NULL, '', '000020', 26, 13, 13, '2019-08-31 18:19:05', NULL, 'Y', 6, NULL, 9, 13, 3, NULL),
(21, '2019-09-01', 120000, NULL, NULL, NULL, '', '000021', 26, NULL, 13, '2019-09-01 11:07:21', NULL, 'Y', 6, NULL, 9, 13, 3, 'N'),
(22, '2019-09-01', 120000, NULL, NULL, NULL, '', '000022', 26, NULL, 13, '2019-09-01 11:09:51', NULL, 'Y', 6, NULL, 9, 13, 3, 'N'),
(23, '2019-09-01', 120000, NULL, NULL, NULL, '', '000023', 26, NULL, 13, '2019-09-01 11:17:05', NULL, 'Y', 6, NULL, 9, 13, 3, 'N'),
(24, '2019-09-01', 120000, NULL, NULL, NULL, '', '000024', 26, NULL, 13, '2019-09-01 11:22:50', NULL, 'Y', 6, NULL, 9, 13, 3, 'N'),
(25, '2019-09-01', 120000, NULL, NULL, NULL, '', '000025', 26, NULL, 13, '2019-09-01 11:52:22', NULL, 'Y', 6, NULL, 9, 13, 3, 'N'),
(26, '2019-09-01', 120000, NULL, NULL, NULL, '', '000026', 26, NULL, 13, '2019-09-01 13:32:34', NULL, 'Y', 6, NULL, 9, 13, 3, 'N'),
(27, '2019-09-01', 120000, NULL, NULL, NULL, '', '000027', 26, NULL, 13, '2019-09-01 13:33:53', NULL, 'Y', 6, NULL, 9, 13, 3, 'N'),
(28, '2019-09-01', 90000, NULL, NULL, NULL, 'dsafdaf', '000028', 0, NULL, 13, '2019-09-01 14:07:18', NULL, 'Y', 6, NULL, 9, 13, 3, 'N'),
(29, '2019-09-01', 90000, NULL, NULL, NULL, 'dfgfsdgsgdsg', '000029', 0, NULL, 13, '2019-09-01 14:44:12', NULL, 'Y', 6, NULL, 9, 14, 3, 'N'),
(30, '2019-09-01', 120000, NULL, NULL, NULL, '', '000030', 26, NULL, 13, '2019-09-01 17:04:03', NULL, 'Y', 6, NULL, 9, 13, 3, 'Y'),
(31, '2019-09-01', 120000, NULL, NULL, NULL, '66666', '000031', 0, NULL, 13, '2019-09-01 17:07:45', NULL, 'Y', 6, NULL, 9, 15, 1, 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sell_detail`
--

DROP TABLE IF EXISTS `tbl_sell_detail`;
CREATE TABLE IF NOT EXISTS `tbl_sell_detail` (
  `sell_id` int(11) NOT NULL,
  `pro_id` int(11) NOT NULL,
  `pro_price` double DEFAULT NULL,
  `pro_sell_price` double DEFAULT NULL,
  `regDt` datetime DEFAULT NULL,
  `upDt` datetime DEFAULT NULL,
  `useYn` varchar(1) DEFAULT NULL,
  `regUsr` int(11) DEFAULT NULL,
  `upUsr` int(11) DEFAULT NULL,
  `com_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`pro_id`,`sell_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_sell_detail`
--

INSERT INTO `tbl_sell_detail` (`sell_id`, `pro_id`, `pro_price`, `pro_sell_price`, `regDt`, `upDt`, `useYn`, `regUsr`, `upUsr`, `com_id`) VALUES
(2, 2, NULL, 120000, '2019-08-25 14:53:12', NULL, 'Y', 6, NULL, 9),
(3, 2, NULL, 120000, '2019-08-25 14:54:14', NULL, 'Y', 6, NULL, 9),
(3, 0, NULL, 120000, '2019-08-25 14:54:14', NULL, 'Y', 6, NULL, 9),
(4, 2, NULL, 120000, '2019-08-25 14:55:21', NULL, 'Y', 6, NULL, 9),
(4, 0, NULL, 120000, '2019-08-25 14:55:21', NULL, 'Y', 6, NULL, 9),
(5, 2, NULL, 120000, '2019-08-25 15:10:13', NULL, 'Y', 6, NULL, 9),
(6, 2, NULL, 120000, '2019-08-25 15:25:17', NULL, 'Y', 6, NULL, 9),
(7, 2, NULL, 120000, '2019-08-25 15:29:10', NULL, 'Y', 6, NULL, 9),
(8, 2, NULL, 120000, '2019-08-25 15:33:22', NULL, 'Y', 6, NULL, 9),
(9, 1, NULL, 90000, '2019-08-25 21:08:52', NULL, 'Y', 6, NULL, 9),
(10, 2, NULL, 120000, '2019-08-25 23:35:19', NULL, 'Y', 6, NULL, 9),
(11, 2, NULL, 120000, '2019-08-26 21:59:11', NULL, 'Y', 6, NULL, 9),
(12, 2, NULL, 120000, '2019-08-26 22:25:39', NULL, 'Y', 6, NULL, 9),
(13, 2, NULL, 120000, '2019-08-26 23:04:12', NULL, 'Y', 6, NULL, 9),
(14, 2, NULL, 120000, '2019-08-26 23:05:33', NULL, 'Y', 6, NULL, 9),
(15, 2, NULL, 120000, '2019-08-27 20:24:29', NULL, 'Y', 6, NULL, 9),
(16, 2, NULL, 120000, '2019-08-27 20:25:15', NULL, 'Y', 6, NULL, 9),
(17, 2, NULL, 120000, '2019-08-27 20:26:00', NULL, 'Y', 6, NULL, 9),
(18, 2, NULL, 120000, '2019-08-27 20:29:20', NULL, 'Y', 6, NULL, 9),
(19, 2, NULL, 120000, '2019-08-27 22:15:31', NULL, 'Y', 6, NULL, 9),
(20, 2, NULL, 120000, '2019-08-31 18:19:05', NULL, 'Y', 6, NULL, 9),
(21, 2, NULL, 120000, '2019-09-01 11:07:21', NULL, 'Y', 6, NULL, 9),
(22, 2, NULL, 120000, '2019-09-01 11:09:51', NULL, 'Y', 6, NULL, 9),
(23, 2, NULL, 120000, '2019-09-01 11:17:05', NULL, 'Y', 6, NULL, 9),
(24, 2, NULL, 120000, '2019-09-01 11:22:50', NULL, 'Y', 6, NULL, 9),
(25, 2, NULL, 120000, '2019-09-01 11:52:22', NULL, 'Y', 6, NULL, 9),
(26, 2, NULL, 120000, '2019-09-01 13:32:34', NULL, 'Y', 6, NULL, 9),
(27, 2, NULL, 120000, '2019-09-01 13:33:53', NULL, 'Y', 6, NULL, 9),
(28, 1, NULL, 90000, '2019-09-01 14:07:18', NULL, 'Y', 6, NULL, 9),
(29, 1, NULL, 90000, '2019-09-01 14:44:12', NULL, 'Y', 6, NULL, 9),
(30, 2, NULL, 120000, '2019-09-01 17:04:03', NULL, 'Y', 6, NULL, 9),
(31, 2, NULL, 120000, '2019-09-01 17:07:45', NULL, 'Y', 6, NULL, 9);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_staff`
--

DROP TABLE IF EXISTS `tbl_staff`;
CREATE TABLE IF NOT EXISTS `tbl_staff` (
  `sta_id` int(11) NOT NULL AUTO_INCREMENT,
  `sta_nm` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `sta_nm_kh` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sta_gender` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `sta_dob` date DEFAULT NULL,
  `sta_photo` text COLLATE utf8_unicode_ci,
  `sta_phone1` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sta_phone2` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sta_email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sta_addr` text COLLATE utf8_unicode_ci,
  `sta_des` text COLLATE utf8_unicode_ci,
  `sta_start_dt` date DEFAULT NULL,
  `sta_end_dt` date DEFAULT NULL,
  `regDt` datetime DEFAULT NULL,
  `upDt` datetime DEFAULT NULL,
  `useYn` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `regUsr` int(11) NOT NULL,
  `upUsr` int(11) NOT NULL,
  `pos_id` int(11) NOT NULL,
  `bra_id` int(11) DEFAULT NULL,
  `com_id` int(11) NOT NULL,
  PRIMARY KEY (`sta_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_staff`
--

INSERT INTO `tbl_staff` (`sta_id`, `sta_nm`, `sta_nm_kh`, `sta_gender`, `sta_dob`, `sta_photo`, `sta_phone1`, `sta_phone2`, `sta_email`, `sta_addr`, `sta_des`, `sta_start_dt`, `sta_end_dt`, `regDt`, `upDt`, `useYn`, `regUsr`, `upUsr`, `pos_id`, `bra_id`, `com_id`) VALUES
(1, '1', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, '2018-09-12 11:50:39', NULL, 'Y', 0, 0, 1, NULL, 1),
(2, '2', NULL, '', NULL, NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, '2018-09-12 11:54:03', NULL, 'Y', 0, 0, 2, NULL, 2),
(3, '3', NULL, '', NULL, NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, '2018-09-12 12:04:03', NULL, 'Y', 0, 0, 3, NULL, 3),
(4, '4', NULL, '', NULL, NULL, '4', NULL, NULL, NULL, NULL, NULL, NULL, '2018-09-12 13:05:35', NULL, 'Y', 0, 0, 4, NULL, 4),
(5, '5', NULL, '', NULL, NULL, '5', NULL, NULL, NULL, NULL, NULL, NULL, '2018-09-12 13:14:32', NULL, 'Y', 0, 0, 5, NULL, 5),
(6, 'AAAA', 'aa', 'F', '0000-00-00', NULL, NULL, '999', 'AAAAAA@email.com', 'pp', 'A', '0000-00-00', NULL, '2018-10-29 08:39:46', '2018-11-07 07:41:50', 'N', 5, 5, 11, 26, 5),
(7, 'AAA4444', 'AAAA', 'F', '1992-01-01', '/stock/staff/2018-11-07-06-59-01_5_5.jpg', '1011222', '6565', '', 'TTT', '55', '2018-01-01', NULL, '2018-10-29 09:22:17', '2018-11-07 07:41:50', 'N', 5, 5, 11, 26, 5),
(8, '444', '444', 'F', '1992-01-01', '', '444', '4444', 'socheat@mail.com', '44', '333', '2018-01-01', '1970-01-01', '2018-11-06 07:54:50', '2019-01-06 07:09:25', 'Y', 5, 5, 10, 26, 5),
(9, 'AAA', 'AAAA', 'F', '1992-01-01', '/stock/staff/2018-11-06-08-48-55_5_5.jpg', '1011222', '6565', '', 'TTT', '55', '2018-01-01', NULL, '2018-11-06 08:48:55', '2018-11-07 07:35:55', 'N', 5, 5, 11, 26, 5),
(10, 'TTTTT', 'តេស', 'M', '1970-01-01', '', '012232401', '6565', 'socheat@mail.com', 'TTT', 'oooo', '2018-11-12', '1970-01-01', '2018-11-12 07:06:02', '2019-01-06 07:06:45', 'Y', 5, 5, 5, 24, 5),
(11, 'a', NULL, '', NULL, NULL, '010527752', NULL, NULL, NULL, NULL, NULL, NULL, '2019-07-10 11:29:12', NULL, 'Y', 0, 0, 12, NULL, 9),
(12, 'Narong Khem', 'ខេមណារ៉ុង', 'F', '1998-01-01', '', '0968795226', '', '', 'Phnom Penh', '', '2019-01-07', '1970-01-01', '2019-07-15 02:17:29', NULL, 'Y', 6, 0, 13, 28, 9),
(13, 'EAM SOCHEAT', 'សុជាតិ', 'M', '1992-01-01', '/stock/staff/2019-07-29-09-48-14_9_6.jpg', '010336699', '', '', 'aaaaa', '', '1970-01-01', '1970-01-01', '2019-07-19 06:03:53', '2019-07-29 09:48:15', 'Y', 6, 6, 13, 28, 9);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_stock`
--

DROP TABLE IF EXISTS `tbl_stock`;
CREATE TABLE IF NOT EXISTS `tbl_stock` (
  `sto_id` int(11) NOT NULL AUTO_INCREMENT,
  `sto_nm` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `sto_nm_kh` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sto_addr` text COLLATE utf8_unicode_ci,
  `sto_des` text COLLATE utf8_unicode_ci,
  `regDt` datetime DEFAULT NULL,
  `upDt` datetime DEFAULT NULL,
  `useYn` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `regUsr` int(11) NOT NULL,
  `upUsr` int(11) NOT NULL,
  `bra_id` int(11) NOT NULL,
  `com_id` int(11) NOT NULL,
  PRIMARY KEY (`sto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_stock_product`
--

DROP TABLE IF EXISTS `tbl_stock_product`;
CREATE TABLE IF NOT EXISTS `tbl_stock_product` (
  `sto_id` int(11) NOT NULL,
  `pro_id` int(11) NOT NULL,
  `imp_mov_id` int(11) NOT NULL,
  `imp_mov_status` int(11) NOT NULL,
  `pro_qty` int(11) DEFAULT NULL,
  `pro_unit_price` double DEFAULT NULL,
  `pro_sale_price` double DEFAULT NULL,
  `regDt` datetime DEFAULT NULL,
  `upDt` datetime DEFAULT NULL,
  `useYn` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `regUsr` int(11) NOT NULL,
  `upUsr` int(11) NOT NULL,
  `com_id` int(11) NOT NULL,
  PRIMARY KEY (`sto_id`,`pro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_supplier`
--

INSERT INTO `tbl_supplier` (`sup_id`, `sup_nm`, `sup_phone`, `sup_email`, `sup_addr`, `sup_des`, `sup_cont`, `regDt`, `upDt`, `useYn`, `regUsr`, `upUsr`, `com_id`, `sup_nm_kh`) VALUES
(1, 'AAAAAAUUUUUUU', '0123456789', 'eamsocheatsmart@gmail.com', 'AAAAAAAAAA', 'AAAAAAAAAAAAAAAAAA', NULL, '2018-10-29 03:32:42', '2018-10-29 03:38:26', 'N', 5, 0, 5, 'ខ្មែរ'),
(2, 'AAA', '454564563', '', 'tyutu', 'yuutru', NULL, '2019-08-09 17:10:08', NULL, 'Y', 6, 0, 9, 'dfdgfs'),
(3, 'sssss', '968795226', '', 'sssssss', '', NULL, '2019-08-09 17:11:35', NULL, 'Y', 6, 0, 9, 'sss'),
(4, 'ttttt', '968795226', '', 'ttttt', '', NULL, '2019-08-09 17:13:10', NULL, 'Y', 6, 0, 9, 'ttttt'),
(5, 'yy', '968795226', '', 'yyyyyyyy', '', NULL, '2019-08-09 17:13:49', NULL, 'Y', 6, 0, 9, 'yyyyyy'),
(6, 'gfsgdfsg', '10527752', '', 'ttttttt', '', NULL, '2019-08-09 17:14:28', NULL, 'Y', 6, 0, 9, 'dfgsdfg'),
(7, 'rrrrr', '968795226', '', 'rrrrrrrrrr', '', NULL, '2019-08-09 17:14:55', NULL, 'Y', 6, 0, 9, 'rrrrrrr'),
(8, 'dfadf', '3453455', 'dsafaf', 'sdfaf', '', NULL, '2019-08-09 17:15:13', NULL, 'Y', 6, 0, 9, 'sdfsafd');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_use`
--

DROP TABLE IF EXISTS `tbl_use`;
CREATE TABLE IF NOT EXISTS `tbl_use` (
  `use_id` int(11) NOT NULL AUTO_INCREMENT,
  `use_total_qty` int(11) NOT NULL,
  `use_date` date NOT NULL,
  `use_des` text COLLATE utf8_unicode_ci,
  `regDt` datetime DEFAULT NULL,
  `upDt` datetime DEFAULT NULL,
  `useYn` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sto_id` int(11) NOT NULL,
  `sta_id` int(11) NOT NULL,
  `regUsr` int(11) NOT NULL,
  `upUsr` int(11) NOT NULL,
  `com_id` int(11) NOT NULL,
  PRIMARY KEY (`use_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE IF NOT EXISTS `tbl_user` (
  `usr_id` int(11) NOT NULL AUTO_INCREMENT,
  `usr_nm` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `usr_pwd` text COLLATE utf8_unicode_ci NOT NULL,
  `usr_wri_yn` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `usr_menu` text COLLATE utf8_unicode_ci,
  `regDt` datetime DEFAULT NULL,
  `upDt` datetime DEFAULT NULL,
  `useYn` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `regUsr` int(11) NOT NULL,
  `upUsr` int(11) NOT NULL,
  `sta_id` int(11) NOT NULL,
  `com_id` int(11) NOT NULL,
  `usr_str` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `usr_edit_yn` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`usr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`usr_id`, `usr_nm`, `usr_pwd`, `usr_wri_yn`, `usr_menu`, `regDt`, `upDt`, `useYn`, `regUsr`, `upUsr`, `sta_id`, `com_id`, `usr_str`, `usr_edit_yn`) VALUES
(1, '1', 'X/Cf1cmof5aDa8iuIVN2oNgoJfmUQd8gqvPSGDMhgemDRsKhQYzdFHCzdqX3uQIBQIe0n79RnGMMMpynqvkTQg==', 'Y', NULL, '2018-09-12 11:50:39', NULL, 'Y', 0, 0, 1, 1, 'Y', NULL),
(2, '2', 'UFAmn6pBQ/wWmNHnGL7pQtAB/Sm2jRyrGFVGheCCGK6tzD4hB4GDw58ndNPZIJwSjLp1qNi5N+yVVL4El2TZ1Q==', 'Y', NULL, '2018-09-12 11:54:03', NULL, 'Y', 0, 0, 2, 2, 'Y', NULL),
(3, '3', '1AjILh2WSR7Js5Xkprm0kVoDnHvpMGVj2i3nKUfmb8M8Pa9USbFLZBej/uGxPOOLMPTfVc+l093D2WLdJkcHAg==', 'Y', NULL, '2018-09-12 12:04:03', NULL, 'Y', 0, 0, 3, 3, 'Y', NULL),
(4, '4', 'qis8su6y7KgIF9Dsm/QFsA2RMU8YiPtVwcGHmhW2vqXjxMOf7Z3PEv1jbUFx2QrgFsR/Pp9ORoraQDjb8LcofA==', 'Y', NULL, '2018-09-12 13:05:35', NULL, 'Y', 0, 0, 4, 4, 'Y', NULL),
(5, '5', 'N0UOR8kWY8jHrALGmJyhNaaP7eHlSTxz5Fxn1+YEIutetEJ/VmcuaNzU4lx9CRMwvcJSaXcakndkw/B9I0+GSQ==', 'Y', NULL, '2018-09-12 13:14:32', NULL, 'Y', 0, 0, 5, 5, 'Y', NULL),
(6, 'a', 'N0UOR8kWY8jHrALGmJyhNaaP7eHlSTxz5Fxn1+YEIutetEJ/VmcuaNzU4lx9CRMwvcJSaXcakndkw/B9I0+GSQ==', 'Y', NULL, '2019-07-10 11:29:12', NULL, 'Y', 0, 0, 11, 9, 'Y', 'Y'),
(7, 'na', 'TUYHumnQSCdt5hI/B3zMMvF5OO2KaMqK6WgepIBqpcPZHDEpjHNnkgwpMAyQvx/8f1qW4Ud4QboT/5nAa8vQAw==', 'Y', NULL, '2019-07-15 09:29:19', '2019-07-21 20:03:30', 'N', 6, 6, 12, 9, 'Y', 'N'),
(8, 'dd', 'sb3Qo30Ez4f/QSLXx860WZZ6AB4qsh3Btut/g0z7p56kl8UUKIfTPy82Sj9ButP5fFRYrRhvYm0BsTNI+Tz+ng==', 'Y', NULL, '2019-07-15 09:30:36', '2019-07-22 14:33:43', 'N', 6, 6, 12, 9, 'Y', 'N'),
(9, 'nn', '+23KzHl682nc2UDtv3aA4qi2S8mVSyCzPyJ6g8Z7J9UCuZU1FvUDQ51HEMWJ4FtRSDKY9vezhkbH4G3IcNyjow==', 'Y', NULL, '2019-07-15 09:33:25', '2019-07-19 13:26:48', 'N', 6, 6, 12, 9, 'Y', 'N'),
(10, 'nn', 'QPAcIGQc3hLSZ4N+Mysu7TEiKMeic53Dzdx5UStS/Rzc6Zt3R6aar7/+6RDa2ppY1QUWF45+3xxDI+9AbAVj5w==', 'Y', NULL, '2019-07-18 14:40:36', '2019-07-19 13:26:48', 'N', 6, 6, 12, 9, 'Y', 'N'),
(11, 'nn', '/E2sb9CXi3UFu8kdwVM8KwalJYmWtInwpCgz2vXqc1JSMDZgRgM3zcKF78Zfzmc0pda4OJN53khnIYQa2HYpRQ==', 'Y', NULL, '2019-07-18 14:40:52', '2019-07-19 13:26:48', 'N', 6, 6, 12, 9, 'Y', 'N'),
(12, 'nn', '1wDUhsIRPWlavQrr/If64ZtRUgfJ8MZq13j1+pX93FitvBO2xI0dFOC8ABC36LlR24w/9N3GWYNALFvDzzsA9g==', 'N', NULL, '2019-07-22 21:37:29', '2019-07-22 21:37:29', 'Y', 6, 6, 12, 9, 'Y', 'N'),
(13, 'nnn', '6bbUeFr6OdkrASBnv3tikUEMsJaRFmkIHk8KEcZ3iIGlIJ9I2l5H1kqT/Rdc3hSBdt/8h+4AbtOqIGxMeovk1Q==', 'Y', NULL, '2019-07-19 12:38:35', '2019-07-19 13:26:39', 'N', 6, 6, 12, 9, 'Y', 'N'),
(14, 'SS', 'ANACv2/yVXTN46mpq0LWV/SCHkm4KbxbX80k55cOWCzggkmPq6CEK5LJrVEmH5bMbps9BulewtALx0RHHxfZNA==', 'Y', NULL, '2019-07-22 16:56:57', '2019-07-22 16:56:57', 'Y', 6, 6, 13, 9, 'Y', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_use_detail`
--

DROP TABLE IF EXISTS `tbl_use_detail`;
CREATE TABLE IF NOT EXISTS `tbl_use_detail` (
  `use_id` int(11) NOT NULL,
  `pro_id` int(11) NOT NULL,
  `pro_qty` int(11) DEFAULT NULL,
  `use_status` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `regDt` datetime DEFAULT NULL,
  `upDt` datetime DEFAULT NULL,
  `useYn` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `regUsr` int(11) NOT NULL,
  `upUsr` int(11) NOT NULL,
  `com_id` int(11) NOT NULL,
  PRIMARY KEY (`use_id`,`pro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_use_detail_status`
--

DROP TABLE IF EXISTS `tbl_use_detail_status`;
CREATE TABLE IF NOT EXISTS `tbl_use_detail_status` (
  `use_stat_id` int(11) NOT NULL AUTO_INCREMENT,
  `use_id` int(11) NOT NULL,
  `pro_id` int(11) NOT NULL,
  `use_stat_des` text COLLATE utf8_unicode_ci,
  `regDt` datetime DEFAULT NULL,
  `upDt` datetime DEFAULT NULL,
  `useYn` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `regUsr` int(11) NOT NULL,
  `upUsr` int(11) NOT NULL,
  `com_id` int(11) NOT NULL,
  PRIMARY KEY (`use_stat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
