-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 16, 2019 at 09:18 AM
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_branch`
--

INSERT INTO `tbl_branch` (`bra_id`, `bra_nm`, `bra_phone1`, `bra_phone2`, `bra_email`, `bra_addr`, `bra_des`, `regDt`, `upDt`, `useYn`, `regUsr`, `upUsr`, `bra_type_id`, `com_id`, `bra_nm_kh`) VALUES
(1, 'Galaxy11', '017661122', '09866112', 'galaxy-11@gmail.com', 'Phnom Penh', '', '2019-09-13 02:54:34', '2019-10-14 13:12:42', 'Y', 2, 3, 2, 1, 'ហ្គាឡាក់ស៊ី១១');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`cat_id`, `cat_nm`, `cat_nm_kh`, `cat_des`, `regDt`, `upDt`, `useYn`, `upUsr`, `regUsr`, `com_id`, `cat_photo`) VALUES
(1, 'Villa', 'វីឡាទោល', '', '2019-09-13 02:55:02', '2019-10-25 14:22:28', 'Y', 3, 2, 1, '/stock/category/2019-10-25-14-22-28_1_3.jpg'),
(2, 'Villa Hybrid', 'វីឡាកូនកាត់', '', '2019-09-13 02:55:07', '2019-09-17 14:57:05', 'N', 3, 2, 1, ''),
(3, 'Shop House', 'ផ្ទះអាជីវកម្ម', '', '2019-09-17 14:54:22', '2019-10-25 14:22:52', 'Y', 3, 3, 1, '/stock/category/2019-10-25-14-22-52_1_3.jpg'),
(4, 'Villa Prince', 'វីឡាព្រីនស៍', '', '2019-09-17 14:54:49', '2019-10-25 14:23:13', 'Y', 3, 3, 1, '/stock/category/2019-10-25-14-23-13_1_3.jpg');

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
  `commi_amt_approve` double DEFAULT NULL,
  PRIMARY KEY (`commi_id`)
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_commission`
--

INSERT INTO `tbl_commission` (`commi_id`, `commi_amt`, `commi_type`, `commi_is_approve`, `commi_approve_date`, `commi_approve_des`, `sell_id`, `regDt`, `upDt`, `useYn`, `regUsr`, `upUsr`, `com_id`, `commi_amt_approve`) VALUES
(1, 400, 'S', 'P', NULL, NULL, 1, '2019-10-22 16:38:03', NULL, 'Y', 2, NULL, 1, NULL),
(2, 100, 'A', 'P', NULL, NULL, 1, '2019-10-22 16:38:03', NULL, 'Y', 2, NULL, 1, NULL),
(3, 800, 'S', 'P', NULL, NULL, 2, '2019-10-23 14:21:16', NULL, 'Y', 3, NULL, 1, NULL),
(4, 200, 'A', 'P', NULL, NULL, 2, '2019-10-23 14:21:16', NULL, 'Y', 3, NULL, 1, NULL),
(5, 800, 'S', 'P', NULL, NULL, 3, '2019-10-23 14:58:36', NULL, 'Y', 3, NULL, 1, NULL),
(6, 200, 'A', 'P', NULL, NULL, 3, '2019-10-23 14:58:36', NULL, 'Y', 3, NULL, 1, NULL),
(7, 800, 'S', 'P', NULL, NULL, 4, '2019-10-23 15:14:17', NULL, 'Y', 3, NULL, 1, NULL),
(8, 200, 'A', 'P', NULL, NULL, 4, '2019-10-23 15:14:17', NULL, 'Y', 3, NULL, 1, NULL),
(9, 800, 'S', 'P', NULL, NULL, 5, '2019-10-23 15:35:16', NULL, 'Y', 3, NULL, 1, NULL),
(10, 200, 'A', 'P', NULL, NULL, 5, '2019-10-23 15:35:16', NULL, 'Y', 3, NULL, 1, NULL),
(11, 800, 'S', 'P', NULL, NULL, 6, '2019-10-23 15:45:36', NULL, 'Y', 3, NULL, 1, NULL),
(12, 200, 'A', 'P', NULL, NULL, 6, '2019-10-23 15:45:36', NULL, 'Y', 3, NULL, 1, NULL),
(13, 800, 'S', 'P', NULL, NULL, 7, '2019-10-24 09:35:08', NULL, 'Y', 3, NULL, 1, NULL),
(14, 200, 'A', 'P', NULL, NULL, 7, '2019-10-24 09:35:08', NULL, 'Y', 3, NULL, 1, NULL),
(15, 800, 'S', 'P', NULL, NULL, 8, '2019-10-24 09:56:48', NULL, 'Y', 3, NULL, 1, NULL),
(16, 200, 'A', 'P', NULL, NULL, 8, '2019-10-24 09:56:48', NULL, 'Y', 3, NULL, 1, NULL),
(17, 800, 'S', 'P', NULL, NULL, 9, '2019-10-24 10:08:19', NULL, 'Y', 3, NULL, 1, NULL),
(18, 200, 'A', 'P', NULL, NULL, 9, '2019-10-24 10:08:19', NULL, 'Y', 3, NULL, 1, NULL),
(19, 800, 'S', 'P', NULL, NULL, 10, '2019-10-24 10:20:40', NULL, 'Y', 3, NULL, 1, NULL),
(20, 200, 'A', 'P', NULL, NULL, 10, '2019-10-24 10:20:40', NULL, 'Y', 3, NULL, 1, NULL),
(21, 800, 'S', 'P', NULL, NULL, 11, '2019-10-24 10:43:30', NULL, 'Y', 3, NULL, 1, NULL),
(22, 200, 'A', 'P', NULL, NULL, 11, '2019-10-24 10:43:30', NULL, 'Y', 3, NULL, 1, NULL),
(23, 1600, 'S', 'P', NULL, NULL, 12, '2019-10-24 11:10:08', NULL, 'Y', 3, NULL, 1, NULL),
(24, 400, 'A', 'P', NULL, NULL, 12, '2019-10-24 11:10:08', NULL, 'Y', 3, NULL, 1, NULL),
(25, 1600, 'S', 'P', NULL, NULL, 13, '2019-10-24 11:20:33', NULL, 'Y', 3, NULL, 1, NULL),
(26, 400, 'A', 'P', NULL, NULL, 13, '2019-10-24 11:20:33', NULL, 'Y', 3, NULL, 1, NULL),
(27, 800, 'S', 'P', NULL, NULL, 14, '2019-10-24 11:43:01', NULL, 'Y', 3, NULL, 1, NULL),
(28, 200, 'A', 'P', NULL, NULL, 14, '2019-10-24 11:43:01', NULL, 'Y', 3, NULL, 1, NULL),
(29, 800, 'S', 'P', NULL, NULL, 15, '2019-10-24 11:59:51', NULL, 'Y', 3, NULL, 1, NULL),
(30, 200, 'A', 'P', NULL, NULL, 15, '2019-10-24 11:59:51', NULL, 'Y', 3, NULL, 1, NULL),
(31, 800, 'S', 'P', NULL, NULL, 16, '2019-10-24 12:12:49', NULL, 'Y', 3, NULL, 1, NULL),
(32, 200, 'A', 'P', NULL, NULL, 16, '2019-10-24 12:12:49', NULL, 'Y', 3, NULL, 1, NULL),
(33, 800, 'S', 'P', NULL, NULL, 17, '2019-10-24 14:52:59', NULL, 'Y', 3, NULL, 1, NULL),
(34, 200, 'A', 'P', NULL, NULL, 17, '2019-10-24 14:52:59', NULL, 'Y', 3, NULL, 1, NULL),
(35, 800, 'S', 'P', NULL, NULL, 18, '2019-10-24 15:07:13', NULL, 'Y', 3, NULL, 1, NULL),
(36, 200, 'A', 'P', NULL, NULL, 18, '2019-10-24 15:07:13', NULL, 'Y', 3, NULL, 1, NULL),
(37, 800, 'S', 'P', NULL, NULL, 19, '2019-10-24 15:27:27', NULL, 'Y', 3, NULL, 1, NULL),
(38, 200, 'A', 'P', NULL, NULL, 19, '2019-10-24 15:27:27', NULL, 'Y', 3, NULL, 1, NULL),
(39, 400, 'S', 'P', NULL, NULL, 20, '2019-10-28 15:25:33', NULL, 'Y', 3, NULL, 1, NULL),
(40, 100, 'A', 'P', NULL, NULL, 20, '2019-10-28 15:25:33', NULL, 'Y', 3, NULL, 1, NULL),
(41, 400, 'S', 'P', NULL, NULL, 21, '2019-10-28 15:40:02', NULL, 'Y', 3, NULL, 1, NULL),
(42, 100, 'A', 'P', NULL, NULL, 21, '2019-10-28 15:40:02', NULL, 'Y', 3, NULL, 1, NULL),
(43, 400, 'S', 'P', NULL, NULL, 22, '2019-10-28 15:53:55', NULL, 'Y', 3, NULL, 1, NULL),
(44, 100, 'A', 'P', NULL, NULL, 22, '2019-10-28 15:53:55', NULL, 'Y', 3, NULL, 1, NULL),
(45, 300, 'S', 'P', NULL, NULL, 23, '2019-10-28 16:08:43', NULL, 'Y', 3, NULL, 1, NULL),
(46, 100, 'A', 'P', NULL, NULL, 23, '2019-10-28 16:08:43', NULL, 'Y', 3, NULL, 1, NULL),
(47, 300, 'S', 'P', NULL, NULL, 24, '2019-10-28 16:14:32', NULL, 'Y', 3, NULL, 1, NULL),
(48, 100, 'A', 'P', NULL, NULL, 24, '2019-10-28 16:14:32', NULL, 'Y', 3, NULL, 1, NULL),
(49, 400, 'S', 'P', NULL, NULL, 25, '2019-10-28 16:33:40', NULL, 'Y', 3, NULL, 1, NULL),
(50, 100, 'A', 'P', NULL, NULL, 25, '2019-10-28 16:33:40', NULL, 'Y', 3, NULL, 1, NULL),
(51, 400, 'S', 'P', NULL, NULL, 26, '2019-10-28 16:36:19', NULL, 'Y', 3, NULL, 1, NULL),
(52, 100, 'A', 'P', NULL, NULL, 26, '2019-10-28 16:36:19', NULL, 'Y', 3, NULL, 1, NULL),
(53, 400, 'S', 'P', NULL, NULL, 27, '2019-10-29 11:42:25', NULL, 'Y', 3, NULL, 1, NULL),
(54, 100, 'A', 'P', NULL, NULL, 27, '2019-10-29 11:42:25', NULL, 'Y', 3, NULL, 1, NULL),
(55, 800, 'S', 'P', NULL, NULL, 28, '2019-11-06 16:01:40', NULL, 'Y', 3, NULL, 1, NULL),
(56, 200, 'A', 'P', NULL, NULL, 28, '2019-11-06 16:01:40', NULL, 'Y', 3, NULL, 1, NULL);

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
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_commission_setting`
--

INSERT INTO `tbl_commission_setting` (`comset_id`, `comset_salary_yn`, `comset_commi_yn`, `regDt`, `upDt`, `useYn`, `regUsr`, `upUsr`, `pos_id`, `bra_id`, `com_id`) VALUES
(1, 'N', 'N', '2019-09-17 15:24:10', NULL, 'Y', 3, 0, 5, 1, 1),
(2, 'N', 'N', '2019-09-17 15:29:27', NULL, 'Y', 3, 0, 2, 1, 1),
(3, 'N', 'N', '2019-10-14 13:06:25', '2019-10-14 13:06:25', 'Y', 2, 3, 4, 1, 1),
(4, 'N', 'N', '2019-10-14 15:23:42', NULL, 'Y', 3, 0, 6, 1, 1),
(5, 'N', 'N', '2019-10-14 16:11:20', NULL, 'Y', 3, 0, 7, 1, 1),
(6, 'N', 'N', '2019-10-16 14:20:45', NULL, 'Y', 3, 0, 8, 1, 1),
(7, 'N', 'N', '2019-10-21 16:39:37', NULL, 'Y', 3, 0, 9, 1, 1);

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
(1, 1, 'M', 1000, 'P', 20, '2019-09-17 15:24:10', NULL, 'Y', 3, 0, 1),
(1, 3, 'M', 500, 'P', 20, '2019-09-17 15:24:10', NULL, 'Y', 3, 0, 1),
(1, 4, 'M', 2000, 'P', 20, '2019-09-17 15:24:10', NULL, 'Y', 3, 0, 1),
(2, 1, 'M', 500, 'P', 20, '2019-09-17 15:29:27', NULL, 'Y', 3, 0, 1),
(2, 3, 'M', 400, 'M', 100, '2019-09-17 15:29:27', NULL, 'Y', 3, 0, 1),
(2, 4, 'M', 1000, 'M', 200, '2019-09-17 15:29:27', NULL, 'Y', 3, 0, 1),
(3, 4, 'M', 1000, 'M', 200, '2019-10-14 13:06:25', NULL, 'Y', 3, 0, 1),
(3, 3, 'M', 400, 'M', 100, '2019-10-14 13:06:25', NULL, 'Y', 3, 0, 1),
(3, 1, 'M', 500, 'P', 20, '2019-10-14 13:06:25', NULL, 'Y', 3, 0, 1),
(4, 1, 'M', 1000, 'M', 200, '2019-10-14 15:23:42', NULL, 'Y', 3, 0, 1),
(4, 3, 'M', 500, 'M', 100, '2019-10-14 15:23:42', NULL, 'Y', 3, 0, 1),
(4, 4, 'M', 2000, 'M', 400, '2019-10-14 15:23:42', NULL, 'Y', 3, 0, 1),
(5, 1, 'M', 1000, 'M', 200, '2019-10-14 16:11:20', NULL, 'Y', 3, 0, 1),
(5, 3, 'M', 500, 'M', 100, '2019-10-14 16:11:20', NULL, 'Y', 3, 0, 1),
(5, 4, 'M', 2000, 'M', 400, '2019-10-14 16:11:20', NULL, 'Y', 3, 0, 1),
(6, 1, 'M', 1000, 'M', 200, '2019-10-16 14:20:45', NULL, 'Y', 3, 0, 1),
(6, 3, 'M', 500, 'M', 100, '2019-10-16 14:20:45', NULL, 'Y', 3, 0, 1),
(6, 4, 'M', 2000, 'M', 400, '2019-10-16 14:20:45', NULL, 'Y', 3, 0, 1),
(7, 1, 'M', 1000, 'M', 200, '2019-10-21 16:39:37', NULL, 'Y', 3, 0, 1),
(7, 3, 'M', 500, 'M', 100, '2019-10-21 16:39:37', NULL, 'Y', 3, 0, 1),
(7, 4, 'M', 2000, 'M', 400, '2019-10-21 16:39:37', NULL, 'Y', 3, 0, 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_company`
--

INSERT INTO `tbl_company` (`com_id`, `com_nm`, `com_phone`, `com_email`, `com_addr`, `com_des`, `regDt`, `upDt`, `useYn`) VALUES
(1, 'បុរីកាឡាក់ស៊ី១១', '01023456', NULL, NULL, NULL, '2019-09-13 09:50:01', NULL, 'Y');

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
  `com_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `rec_id` int(11) NOT NULL,
  `con_code` varchar(12) DEFAULT NULL,
  `con_pay_met` int(11) DEFAULT NULL,
  `con_tran_id` varchar(100) DEFAULT NULL,
  `con_pro_price` double DEFAULT NULL,
  `con_type_id` int(11) DEFAULT NULL,
  `con_total_price_desc` text,
  PRIMARY KEY (`con_id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_contract`
--

INSERT INTO `tbl_contract` (`con_id`, `con_total_price`, `con_date`, `con_date_exp`, `con_des`, `con_sta`, `regDt`, `upDt`, `useYn`, `regUsr`, `upUsr`, `com_id`, `seller_id`, `rec_id`, `con_code`, `con_pay_met`, `con_tran_id`, `con_pro_price`, `con_type_id`, `con_total_price_desc`) VALUES
(1, 2000, '2019-10-21', '2019-10-28', 'បន្ថែម : ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង ទូរទស្សន៍', 'B', '2019-10-21 13:51:03', '2019-11-06 15:55:42', 'N', 3, 3, 1, 14, 2, '000001', 1, '', NULL, 1, 'ពីពាន់ដុល្លារអាមេរិកគត់'),
(2, 1000, '2019-06-14', '2019-06-22', 'បន្ថែម : ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង ទូរទូរទស្សន៍', 'C', '2019-10-21 16:25:12', '2019-10-28 14:41:44', 'Y', 3, 3, 1, 8, 8, '000002', 1, '', NULL, 2, 'មួយពាន់ដុល្លារអាមេរិកគត់'),
(3, 1000, '2019-06-14', '2019-06-22', 'បន្ថែម : ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  ទូរទូរទស្សន៍', 'C', '2019-10-21 16:34:01', '2019-10-28 14:44:19', 'Y', 3, 3, 1, 8, 2, '000003', 1, '', NULL, 2, 'មួយពាន់ដុល្លារអាមេរិកគត់'),
(4, 1000, '2019-03-18', '2019-03-25', 'បន្ថែម : ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង   ទូរទូរទស្សន៍', 'C', '2019-10-21 17:01:50', '2019-10-28 14:44:28', 'Y', 3, 3, 1, 9, 5, '000004', 1, '', NULL, 2, 'មួយពាន់ដុល្លារអាមេរិកគត់'),
(5, 2000, '2019-07-01', '2019-07-08', 'បន្ថែម : ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង ទូរទូរទស្សន៍', 'S', '2019-10-21 17:07:49', '2019-10-28 16:14:32', 'Y', 3, 3, 1, 8, 5, '000005', 1, '', NULL, 2, 'ពីរពាន់ដុល្លារអាមេរិកគត់'),
(6, 2000, '2019-07-17', '2019-07-24', 'បន្ថែម:ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែងទូរទូរទស្សន៍           ', 'C', '2019-10-22 14:58:42', '2019-10-28 14:44:43', 'Y', 3, 3, 1, 7, 5, '000006', 1, '', NULL, 2, 'ពីរពាន់ដុល្លារអាមេរិកគត់'),
(7, 2000, '2019-07-31', '2019-08-07', 'បន្ថែម:ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែងទូរទូរទស្សន៍           ', 'S', '2019-10-22 15:40:13', '2019-10-22 16:38:04', 'Y', 3, 2, 1, 7, 2, '000007', 1, '', NULL, 1, 'ពីរពាន់ដុល្លារអាមេរិកគត់'),
(8, 2000, '2019-09-06', '2019-10-22', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែងទូរទូរទស្សន៍', 'S', '2019-10-22 16:15:51', '2019-10-28 15:25:33', 'Y', 3, 3, 1, 13, 5, '000008', 1, '', NULL, 1, 'ពីរពាន់ដុល្លារអាមេរិកគត់'),
(9, 2000, '2019-06-24', '2019-07-03', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'B', '2019-10-23 15:32:32', '2019-10-23 15:39:58', 'N', 3, 3, 1, 5, 5, '000009', 2, '', NULL, 1, 'ពីរពាន់'),
(10, 2000, '2019-06-24', '2019-07-04', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'S', '2019-10-23 15:43:24', '2019-10-23 15:45:36', 'Y', 3, 3, 1, 7, 5, '000010', 2, '', NULL, 1, 'ពីរពាន់'),
(11, 2000, '2019-06-21', '2019-06-29', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'S', '2019-10-24 09:21:14', '2019-10-24 09:35:08', 'Y', 3, 3, 1, 7, 5, '000011', 2, '', NULL, 1, 'ពីរពាន់'),
(12, 2000, '2019-06-20', '2019-06-28', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'B', '2019-10-24 09:47:18', '2019-10-24 09:49:51', 'N', 3, 3, 1, 7, 5, '000012', 2, '', NULL, 1, 'ពីរពាន់'),
(13, 2000, '2019-06-20', '2019-06-27', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'S', '2019-10-24 09:53:17', '2019-10-24 09:56:48', 'Y', 3, 3, 1, 7, 5, '000013', 2, '', NULL, 1, 'ពីរពាន់'),
(14, 2000, '2019-06-23', '2019-06-30', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'S', '2019-10-24 10:06:08', '2019-10-24 10:08:19', 'Y', 3, 3, 1, 7, 5, '000014', 2, '', NULL, 1, 'ពីរពាន់'),
(15, 2000, '2019-06-26', '2019-07-04', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'S', '2019-10-24 10:17:19', '2019-10-24 10:20:40', 'Y', 3, 3, 1, 7, 5, '000015', 2, '', NULL, 1, 'ពីរពាន់'),
(16, 2000, '2019-07-23', '2019-07-31', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'S', '2019-10-24 11:34:55', '2019-10-24 11:43:01', 'Y', 3, 3, 1, 16, 5, '000016', 2, '', NULL, 2, 'ពីរពាន់'),
(17, 2000, '2019-07-25', '2019-08-01', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'S', '2019-10-24 12:08:00', '2019-10-24 12:12:49', 'Y', 3, 3, 1, 16, 2, '000017', 2, '', NULL, 1, 'ពីរពាន់'),
(18, 2000, '2019-07-31', '2019-08-07', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'S', '2019-10-24 14:48:47', '2019-10-24 14:52:59', 'Y', 3, 3, 1, 17, 2, '000018', 2, '', NULL, 1, 'ពីរពាន់'),
(19, 2000, '2019-10-03', '2019-10-10', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'S', '2019-10-24 15:22:45', '2019-10-24 15:27:27', 'Y', 3, 3, 1, 14, 2, '000019', 1, '', NULL, 1, 'ពីរពាន់'),
(20, 4000, '2019-10-25', '2019-11-15', 'បង់ប្រាក់កក់2,000$ និងបន្ថែមបង់ប្រាក់កក់2,000$ ទៀតនៅខែបន្ទាប់', 'B', '2019-10-26 10:00:30', NULL, 'Y', 3, 0, 1, 10, 2, '000020', 2, '', NULL, 2, 'បួនពាន់'),
(21, 2000, '2019-10-18', '2019-10-25', ' ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី  ម៉ាស៊ីនបឺតផ្សែង  ទូរទូរទស្សន៍', 'B', '2019-10-26 10:24:46', NULL, 'Y', 3, 0, 1, 6, 2, '000021', 2, '', NULL, 2, 'ពីរពាន់'),
(22, 2000, '2019-07-15', '2019-07-22', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង ទូរទូរទស្សន៍', 'S', '2019-10-28 16:28:45', '2019-10-28 16:33:40', 'Y', 3, 3, 1, 7, 2, '000022', 2, '', NULL, 1, 'ពីរពាន់'),
(23, 2000, '2019-07-15', '2019-07-22', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង ទូរទូរទស្សន៍', 'S', '2019-10-28 16:30:57', '2019-10-28 16:36:19', 'Y', 3, 3, 1, 7, 2, '000023', 2, '', NULL, 1, 'ពីរពាន់'),
(24, 2000, '2019-08-09', '2019-08-16', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែងទូរទូរទស្សន៍', 'S', '2019-10-29 11:39:49', '2019-10-29 11:42:25', 'Y', 3, 3, 1, 7, 2, '000024', 2, '', NULL, 1, 'ពីរពាន់'),
(25, 2000, '2019-10-21', '2019-11-01', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'S', '2019-11-06 15:58:49', '2019-11-06 16:01:40', 'Y', 3, 3, 1, 14, 2, '000025', 2, '', NULL, 1, 'ពីរពាន់');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_contract_customer`
--

DROP TABLE IF EXISTS `tbl_contract_customer`;
CREATE TABLE IF NOT EXISTS `tbl_contract_customer` (
  `con_id` int(11) NOT NULL,
  `cus_id` int(11) NOT NULL,
  `regDt` datetime DEFAULT NULL,
  `upDt` datetime DEFAULT NULL,
  `useYn` varchar(1) NOT NULL,
  `regUsr` int(11) NOT NULL,
  `upUsr` int(11) NOT NULL,
  `com_id` int(11) NOT NULL,
  `con_cus_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`con_id`,`cus_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_contract_customer`
--

INSERT INTO `tbl_contract_customer` (`con_id`, `cus_id`, `regDt`, `upDt`, `useYn`, `regUsr`, `upUsr`, `com_id`, `con_cus_order`) VALUES
(1, 8, '2019-10-21 13:51:03', NULL, 'Y', 3, 0, 1, 1),
(2, 5, '2019-10-21 16:25:12', NULL, 'Y', 3, 0, 1, 1),
(3, 5, '2019-10-21 16:34:01', NULL, 'Y', 3, 0, 1, 1),
(4, 9, '2019-10-21 17:01:50', NULL, 'Y', 3, 0, 1, 1),
(5, 10, '2019-10-21 17:07:49', NULL, 'Y', 3, 0, 1, 1),
(6, 11, '2019-10-22 14:58:42', NULL, 'Y', 3, 0, 1, 1),
(6, 12, '2019-10-22 14:58:42', NULL, 'Y', 3, 0, 1, 2),
(7, 13, '2019-10-22 15:40:13', NULL, 'Y', 3, 0, 1, 1),
(8, 15, '2019-10-22 16:15:51', NULL, 'Y', 3, 0, 1, 1),
(9, 25, '2019-10-23 15:32:32', NULL, 'Y', 3, 0, 1, 1),
(10, 25, '2019-10-23 15:43:24', NULL, 'Y', 3, 0, 1, 1),
(11, 26, '2019-10-24 09:21:14', NULL, 'Y', 3, 0, 1, 1),
(12, 27, '2019-10-24 09:47:19', NULL, 'Y', 3, 0, 1, 1),
(13, 27, '2019-10-24 09:53:17', NULL, 'Y', 3, 0, 1, 1),
(14, 28, '2019-10-24 10:06:08', NULL, 'Y', 3, 0, 1, 1),
(15, 29, '2019-10-24 10:17:19', NULL, 'Y', 3, 0, 1, 1),
(16, 35, '2019-10-24 11:34:56', NULL, 'Y', 3, 0, 1, 1),
(17, 36, '2019-10-24 12:08:00', NULL, 'Y', 3, 0, 1, 1),
(17, 37, '2019-10-24 12:08:00', NULL, 'Y', 3, 0, 1, 2),
(18, 45, '2019-10-24 14:48:47', NULL, 'Y', 3, 0, 1, 1),
(19, 46, '2019-10-24 15:22:45', NULL, 'Y', 3, 0, 1, 1),
(19, 47, '2019-10-24 15:22:45', NULL, 'Y', 3, 0, 1, 2),
(20, 49, '2019-10-26 10:00:30', NULL, 'Y', 3, 0, 1, 1),
(21, 48, '2019-10-26 10:24:46', NULL, 'Y', 3, 0, 1, 1),
(22, 14, '2019-10-28 16:28:45', NULL, 'Y', 3, 0, 1, 1),
(23, 14, '2019-10-28 16:30:58', NULL, 'Y', 3, 0, 1, 1),
(24, 50, '2019-10-29 11:39:49', NULL, 'Y', 3, 0, 1, 1),
(25, 51, '2019-11-06 15:58:49', NULL, 'Y', 3, 0, 1, 1),
(25, 8, '2019-11-06 15:58:49', NULL, 'Y', 3, 0, 1, 2);

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
  `pro_book_price_desc` text,
  PRIMARY KEY (`con_id`,`pro_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_contract_detail`
--

INSERT INTO `tbl_contract_detail` (`con_id`, `pro_id`, `pro_unit_price`, `pro_dis_per`, `pro_dis_amt`, `pro_book_price`, `regDt`, `upDt`, `useYn`, `regUsr`, `upUsr`, `com_id`, `pro_book_price_desc`) VALUES
(1, 139, NULL, NULL, NULL, 129000, '2019-10-21 13:51:03', NULL, 'Y', 3, 0, 1, 'ដប់ពីរម៉ឺនប្រាំបួនពាន់'),
(2, 1, NULL, NULL, NULL, 130000, '2019-10-21 16:25:12', NULL, 'Y', 3, 0, 1, 'ដប់បីម៉ឺន'),
(10, 114, NULL, NULL, NULL, 99000, '2019-10-23 15:43:24', NULL, 'Y', 3, 0, 1, 'ប្រាំបួនម៉ឺនប្រាំបួនពាន់'),
(3, 2, NULL, NULL, NULL, 90000, '2019-10-21 16:34:01', NULL, 'Y', 3, 0, 1, 'ប្រាំបួនម៉ឺន'),
(4, 3, NULL, NULL, NULL, 85900, '2019-10-21 17:01:50', NULL, 'Y', 3, 0, 1, 'ប្រាំបីម៉ឺនប្រាំពាន់ប្រាំបួនរយ'),
(5, 5, NULL, NULL, NULL, 130000, '2019-10-21 17:07:49', NULL, 'Y', 3, 0, 1, 'ដប់បីម៉ឺន'),
(6, 6, NULL, NULL, NULL, 93900, '2019-10-22 14:58:42', NULL, 'Y', 3, 0, 1, 'ប្រាំបួនម៉ឺនបីពាន់ប្រាំបួនរយ'),
(7, 8, NULL, NULL, NULL, 159000, '2019-10-22 15:40:13', NULL, 'Y', 3, 0, 1, 'ដប់ប្រាំម៉ឺនប្រាំបួនពាន់'),
(8, 9, NULL, NULL, NULL, 135000, '2019-10-22 16:15:51', NULL, 'Y', 3, 0, 1, 'ដប់បីម៉ឺនប្រាំពាន់'),
(9, 114, NULL, NULL, NULL, 99000, '2019-10-23 15:32:32', NULL, 'Y', 3, 0, 1, 'ប្រាំបួនម៉ឺនប្រាំបួនពាន់'),
(11, 115, NULL, NULL, NULL, 99000, '2019-10-24 09:21:14', NULL, 'Y', 3, 0, 1, 'ប្រាំបួនម៉ឺនប្រាំបួនពាន់'),
(12, 116, NULL, NULL, NULL, 99000, '2019-10-24 09:47:18', NULL, 'Y', 3, 0, 1, 'ប្រាំបួនម៉ឺនប្រាំបួនពាន់'),
(13, 116, NULL, NULL, NULL, 122500, '2019-10-24 09:53:17', NULL, 'Y', 3, 0, 1, 'ដប់ពីរម៉ឺនពីរពាន់ប្រាំរយ'),
(14, 117, NULL, NULL, NULL, 99000, '2019-10-24 10:06:08', NULL, 'Y', 3, 0, 1, 'ប្រាំបួនម៉ឺនប្រាំបួនពាន់'),
(15, 118, NULL, NULL, NULL, 99000, '2019-10-24 10:17:19', NULL, 'Y', 3, 0, 1, 'ប្រាំបួនម៉ឺនប្រាំបួនពាន់'),
(16, 128, NULL, NULL, NULL, 125000, '2019-10-24 11:34:55', NULL, 'Y', 3, 0, 1, 'ដប់ពីរម៉ឺនប្រាំពាន់'),
(17, 129, NULL, NULL, NULL, 115000, '2019-10-24 12:08:00', NULL, 'Y', 3, 0, 1, 'ដប់មួយម៉ឺនប្រាំពាន់'),
(18, 134, NULL, NULL, NULL, 125000, '2019-10-24 14:48:47', NULL, 'Y', 3, 0, 1, 'ដប់ពីរម៉ឺនប្រាំពាន់'),
(19, 137, NULL, NULL, NULL, 135000, '2019-10-24 15:22:45', NULL, 'Y', 3, 0, 1, 'ដប់បីម៉ឺនប្រាំពាន់'),
(20, 150, NULL, NULL, NULL, 298000, '2019-10-26 10:00:30', NULL, 'Y', 3, 0, 1, 'ម្ភៃប្រាំបួនម៉ឺនប្រាំបីពាន់'),
(21, 138, NULL, NULL, NULL, 139000, '2019-10-26 10:24:46', NULL, 'Y', 3, 0, 1, 'ដប់បីម៉ឺនប្រាំបួនពាន់'),
(22, 14, NULL, NULL, NULL, 129000, '2019-10-28 16:28:45', NULL, 'Y', 3, 0, 1, 'ដប់ពីរម៉ឺនប្រាំបួនពាន់'),
(23, 15, NULL, NULL, NULL, 129000, '2019-10-28 16:30:57', NULL, 'Y', 3, 0, 1, 'ដប់ពីរម៉ឺនប្រាំបួនពាន់'),
(24, 12, NULL, NULL, NULL, 129000, '2019-10-29 11:39:49', NULL, 'Y', 3, 0, 1, 'ដប់ពីរម៉ឺនប្រាំបួនពាន់'),
(25, 139, NULL, NULL, NULL, 129000, '2019-11-06 15:58:49', NULL, 'Y', 3, 0, 1, 'ដប់ពីរម៉ឺនប្រាំបួនពាន់');

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
(1, 'រំលស់ជាមួយក្រុមហ៊ុន', 'រំលស់ជាមួយក្រុមហ៊ុន', 'Y'),
(2, 'រំលស់ជាមួយធនាគារ', 'រំលស់ជាមួយធនាគារ', 'N'),
(3, 'បង់១០០%', 'បង់១០០%', 'N'),
(4, 'រំលស់ជាមួយឥណទាន', 'រំលស់ជាមួយឥណទាន', 'N');

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
  `cus_indt_date` date DEFAULT NULL,
  PRIMARY KEY (`cus_id`)
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_customer`
--

INSERT INTO `tbl_customer` (`cus_id`, `cus_nm`, `cus_nm_kh`, `cus_gender`, `cus_dob`, `cus_photo`, `cus_phone1`, `cus_phone2`, `cus_email`, `cus_fb_name`, `cus_addr`, `cus_des`, `cus_idnt_num`, `cus_idnt_type`, `regDt`, `upDt`, `useYn`, `regUsr`, `upUsr`, `com_id`, `cus_indt_date`) VALUES
(1, NULL, 'មិត្ត', 'Male', '1992-01-01', '', '0102365456', '', '', '', 'Phnom Penh', 'sadfnsabfm', '123456789', NULL, '2019-09-17 15:13:56', '2019-10-14 13:08:08', 'N', 3, '2', 1, NULL),
(2, NULL, 'ថ្នីថ្នី', 'Female', '1992-01-01', '', '010258963', '', '', '', 'Phnom Penh', '', '123654789', NULL, '2019-09-17 15:26:27', '2019-10-14 13:08:08', 'N', 3, '2', 1, NULL),
(3, NULL, 'ទេស ដារ៉ាវិចិត្រ', 'Male', '1992-05-05', '', '012222523', '', '', '', '', 'A5', '01210000', NULL, '2019-09-17 16:47:37', '2019-10-14 13:08:08', 'N', 3, '2', 1, NULL),
(4, NULL, 'KerKer', 'Male', '2019-01-01', '', '012000506', '0965855543', '', '', 'pp', '', '1221111', NULL, '2019-09-17 17:18:23', '2019-10-14 13:08:08', 'N', 3, '2', 1, NULL),
(5, NULL, 'ឡាង វណ្ណវឌ្ឍនា', 'Male', '1980-11-26', '', '012877168', '', '', '', 'ផ្ទះ២០E0E1E2ផ្លូវលេខ៤ ភូមិ សង្កាត់និរេាធ ខណ្ឌច្បារអំពៅ រាជធានីភ្នំពេញ', '', '010239841(01)', NULL, '2019-10-14 15:00:09', '2019-10-21 16:35:30', 'Y', 3, '3', 1, '2019-06-21'),
(6, NULL, 'រុន ណារ៉ង', 'Female', '1988-10-30', '', '0968687288', '', '', '', ' ផ្លូវលំ ភូមិស្វាយមានលក្ខណ៍ សង្កាត់ស្ពានថ្ម ខណ្ឌដង្កោ ភ្នំពេញ', '', '011084939', NULL, '2019-10-14 15:51:58', NULL, 'Y', 3, '', 1, '2015-11-18'),
(7, NULL, 'តូច សុខន', 'Female', '1976-01-01', '', '011999314', '', '', '', 'ផ្ទះ៤០៤ ផ្លូវ៦១បេតេ ភូមិត្នោតជ្រុំ សង្កាត់បឹងទំពុន ខណ្ឌមានជ័យ ភ្នំពេញ', '', '010140000(01)', NULL, '2019-10-16 14:17:34', '2019-10-16 14:27:39', 'Y', 3, '3', 1, '1970-01-01'),
(8, NULL, 'ហេង សុវិច្ឆិកា', 'Female', '1978-11-09', '', '012849689', '081818188', '', '', 'ភូមិទី៦ សង្កាត់វាលវង់ ក្រុងកំពង់ចាម កំពង់ចាម', '', '061799533', NULL, '2019-10-21 13:44:25', '2019-11-06 16:04:24', 'Y', 3, '3', 1, '2015-05-20'),
(9, NULL, 'រុន ណារ៉ង', 'Female', '1988-10-30', '', '0968687288', '', '', '', 'ផ្លូវលំ ភូមិស្វាយមានល័ក្ខណ៍ សង្កាត់ស្ពានថ្ម ខណ្ឌដង្កោ ភំ្នពេញ', '', '011084939', NULL, '2019-10-21 14:21:07', NULL, 'Y', 3, '', 1, '2015-11-18'),
(10, NULL, 'ទេស ដារ៉ាវិចិត្រ', 'Male', '1989-10-27', '', '015718608', '', '', '', 'ភូមិទន្លេបាទី ឃុំក្រាំងធ្មង់ ស្រុកបាទី ខេត្តតាកែវ', '', '100646562', NULL, '2019-10-21 14:31:19', NULL, 'Y', 3, '', 1, '2012-03-04'),
(11, NULL, 'គឹម ដារា', 'Male', '1984-12-15', '', '012650075', '016933336', '', '', 'ផ្ទះ១៨ដេ ផ្លូវលំ ភូមិទួលសង្កែ សង្កាត់ទួលសង្កែ ខណ្ឌឫស្សីកែវ ភំ្នពេញ', '', '010463053', NULL, '2019-10-21 14:39:06', NULL, 'Y', 3, '', 1, '2014-08-13'),
(12, NULL, 'លឹម បូផាណា', 'Female', '1984-12-06', '', '012650075', '085933336', '', '', 'ផ្ទះ១៩៥អឺ០ ផ្លូវ២១៧ ភូមិ៣ សង្កាត់អូរឫស្សីទី៣ ខណ្ឌ៧មករា ភំ្នពេញ', '', '010793056', NULL, '2019-10-21 14:43:10', NULL, 'Y', 3, '', 1, '2012-08-27'),
(13, NULL, 'ហ៊ាន សុធារី', 'Female', '1985-08-25', '', '01788180', '', '', '', 'ផ្ទះ០៧ ផ្លូវH០៨ ភូមិបឹងឈូក សង្កាត់និរោធ ខណ្ឌច្បារអំពៅ ភំ្នពេញ', '', '011317594', NULL, '2019-10-21 14:49:04', NULL, 'Y', 3, '', 1, '2018-06-14'),
(14, NULL, 'វេង ផល្លី', 'Female', '1984-12-02', '', '012346687', '', '', '', 'ផ្ទះ១៥ ផ្លូវ១០៥ ភូមិតាខ្មៅ សង្កាត់តាខ្មៅ ក្រុងតាខ្មៅ កណ្តាល', '', '020553503(01)', NULL, '2019-10-21 14:53:29', NULL, 'Y', 3, '', 1, '2015-11-10'),
(15, NULL, 'តូច សុខន', 'Female', '1976-01-01', '', '011999314', '', '', '', 'ផ្ទះ៤០៤ ផ្លូវ៦១បេតេ ភូមិត្មោតជ្រុំ សង្កាត់បឹងទំពុន ខណ្ឌមានជ័យ ភំ្នពេញ', '', '010140000(01)', NULL, '2019-10-21 14:58:29', NULL, 'Y', 3, '', 1, '2015-02-13'),
(16, NULL, 'ប៊ៀវ ឈុនហៀង', 'Female', '1983-09-10', '', '099606666', '', '', '', 'ផ្ទះ៥១អឺ០ហ្សិត ផ្លូវ៦៤ ភូមិ២ សង្កាត់អូរឫស្សីទី២ ខណ្ឌ៧មករា ភ្នំពេញ', '', '011232070', NULL, '2019-10-21 15:06:28', NULL, 'Y', 3, '', 1, '2016-06-14'),
(17, NULL, 'គង់ ធីតា', 'Female', '1992-01-05', '', '010383894', '', '', '', 'ផ្ទះ២០២ ផ្លូវ៣៧១ ភូមិក្បាលទំនប់ សង្កាត់បឹងទំពុន ខណ្ឌមានជ័យ ភ្នំពេញ', '', '010689610(01)', NULL, '2019-10-21 15:19:03', NULL, 'Y', 3, '', 1, '2016-03-10'),
(18, NULL, 'គង់ ឌីណា', 'Male', '1989-12-28', '', '010383894', '', '', '', 'ផ្ទះ២០២ ផ្លូវ៣៧១ ភូមិក្បាលទំនប់ សង្កាត់បឹងទំពុន ខណ្ឌមានជ័យ ភ្នំពេញ', '', '010649175(01)', NULL, '2019-10-21 15:21:11', NULL, 'Y', 3, '', 1, '2017-07-13'),
(19, NULL, 'ឡុង ម៉ៅ', 'Male', '1984-09-21', '', '012800076', '', '', '', 'ផ្លូវជាតិលេខ៦A ភូមិបាក់ខែង សង្កាត់ព្រែកលៀប ខណ្ឌឫស្សីកែវ ក្រុងភ្នំពេញ', '', '010564358', NULL, '2019-10-21 15:28:40', NULL, 'Y', 3, '', 1, '2006-09-04'),
(20, NULL, 'លក សុវណ្ណារិទ្ធ', 'Male', '1968-01-18', '', '016300207', '', '', '', 'ផ្ទះ១០០៤​ ផ្លូវ២១៧ ភូមិកណ្តាល សង្កាត់រលួស ខណ្ឌដង្កោ ភ្នំពេញ', '', '011005399', NULL, '2019-10-21 15:33:52', NULL, 'Y', 3, '', 1, '2015-07-06'),
(21, NULL, 'ហេង គីមហ៊ុយ', 'Female', '1979-04-02', '', '012883526', '', '', '', 'ផ្ទះ១៤   ផ្លូវ ភូមិចំរើនផល១ សង្កាត់បឹងទំពុន ខណ្ឌមានជ័យ រាជធានីភ្នំពេញ', '', '010957800', NULL, '2019-10-23 10:31:18', NULL, 'Y', 3, '', 1, '2019-04-10'),
(22, NULL, 'មៀម វណ្ណះ', 'Male', '1977-04-15', '', '0974723333', '', '', '', 'ភូមិ៣ សង្កាត់៣  ក្រុងព្រះសីហនុ ខេត្ត ព្រះសីហនុ', '', '130187641', NULL, '2019-10-23 10:35:25', NULL, 'Y', 3, '', 1, '2015-12-09'),
(23, NULL, 'កៀង វុឌ្ឍិន', 'Male', '1980-07-04', '', '099606666', '', '', '', 'ផ្ទះលេខ៥អាអឺ0អឺ១ ផ្លូវ២៦៥ ភូមិ៧ សង្កាត់ទឹកល្អក់ទី១ ខណ្ឌទួលគោក  ភ្នំពេញ', '', '010369262', NULL, '2019-10-23 10:38:09', NULL, 'Y', 3, '', 1, '2019-04-05'),
(24, NULL, 'ង៉េង មិថុនា', 'Male', '1986-06-28', '', '0767779777', '', '', '', 'ផ្ទះលេខ១៨ ផ្លូវ១០១ ភូមិ8 សង្កាត់បឹងត្របែក ខណ្ឌចំការមន  ភ្នំពេញ ', '', '011283336', NULL, '2019-10-23 10:40:36', NULL, 'Y', 3, '', 1, '2016-12-29'),
(25, NULL, 'ផល ម៉ារ៉ានី', 'Female', '1980-04-19', '', '011733030', '012950661', '', '', 'អាស័យដ្ឋាន  ផ្ទះលេខ១២L ផ្លូវលំ ភូមិតាងៅក្រោម សង្កាត់និរោធ ខណ្ឌច្បារអំពៅ  ភ្នំពេញ', '', '011082334', NULL, '2019-10-23 10:46:25', NULL, 'Y', 3, '', 1, '2015-11-12'),
(26, NULL, 'ថាវី', 'Female', '1950-05-16', '', '012550099', '', '', '', 'ផ្ទះលេខ៦៣អាអឺ០ ផ្លូវមុនីរ៉េត ភូមិ១០ សង្កាត់ផ្សារដើមគរ ខណ្ឌទួលគោក  ភ្នំពេញ', '', '010225675(01)', NULL, '2019-10-23 10:49:49', NULL, 'Y', 3, '', 1, '2014-12-12'),
(27, NULL, 'ឡាង វណ្ណបូណ៍មី', 'Female', '1981-10-24', '', '012279277', '', '', '', 'ផ្ទះលេខ២១៨សេអឺ០ ផ្លូវ១៣៩ ភូមិ៥ សង្កាត់មិត្តភាព ខណ្ឌ៧មករា  ភ្នំពេញ ', '', '010462764(01)', NULL, '2019-10-23 10:52:42', NULL, 'Y', 3, '', 1, '2015-08-03'),
(28, NULL, 'ស៊ គឹមស៊ាង', 'Female', '1980-03-05', '', '077788889', '', '', '', 'ផ្ទះលេខ៣៩៤ ផ្លូវ២៩៨ ភូមិ៣ សង្កាត់អូឡាំពិក ខណ្ឌចំការមន  ភ្នំពេញ ', '', '011172011', NULL, '2019-10-23 10:54:43', NULL, 'Y', 3, '', 1, '2016-02-25'),
(29, NULL, 'លាង ​រៃ', 'Male', '1978-07-11', '', '012833550', '', '', '', 'ផ្ទះលេខ១៦៨អិន ផ្លូវ៤៥បេតេ ភូមិត្នោតជ្រំ សង្កាត់បឹងទំពុន ខណ្ឌមានជ័យ  ភ្នំពេញ', '', '011323832', NULL, '2019-10-23 10:57:53', NULL, 'Y', 3, '', 1, '2018-08-23'),
(30, NULL, 'គឹម ឈុនឆាយ៉ាវត្តី', 'Female', '1968-03-24', '', '0962807708', '', '', '', 'ផ្ទះលេខ ១សេ ផ្លូវ ១៣២ ភូមិ ២២ សង្កាត់ បឹងកក់ទី២ ខណ្ឌ ទួលគោក  ភ្នំពេញ', '', '010115649(01)', NULL, '2019-10-23 11:01:21', NULL, 'Y', 3, '', 1, '2017-09-01'),
(31, NULL, 'តាំង ស៊ីវស្រេង', 'Male', '1981-05-02', '', '012404009', '', '', '', 'ដ្ឋាន  ផ្ទះលេខ ១៧បេអឺ០ ផ្លូវ២៩៦ ភូមិ១០ សង្កាត់ទួលស្វាយព្រៃទី២ ខណ្ឌចំការមន  ភ្នំពេញ ', '', '010045500(01)', NULL, '2019-10-23 11:03:50', NULL, 'Y', 3, '', 1, '2014-12-12'),
(32, NULL, 'លីម មួយឡេង', 'Male', '1993-08-15', '', '092340222', '', '', '', 'ភូមិ១ សង្កាត់២ ក្រុងព្រះសីហនុ ខេត្តព្រះសីហនុ', '', '130152075', NULL, '2019-10-23 11:07:54', NULL, 'Y', 3, '', 1, '2014-08-27'),
(33, NULL, 'ឡាយ រដ្ឋធានី', 'Female', '1983-05-23', '', '0889999940', '', '', '', 'ផ្ទះលេខ18 ផ្លូវ101 ភូមិ8 សង្កាត់បឹងត្របែក ខណ្ឌចំការមន  ភ្នំពេញ ', '', '010482907(01)', NULL, '2019-10-23 11:11:45', NULL, 'Y', 3, '', 1, '2016-05-28'),
(34, NULL, 'ជួន ប៊ុនស៊ីម', 'Male', '1982-08-18', '', '012567448', '012791415', '', '', '', '', 'N00240329', NULL, '2019-10-23 11:14:27', NULL, 'Y', 3, '', 1, '2015-07-09'),
(35, NULL, 'យ៉ុន ប៊ុនណា', 'Male', '1991-01-01', '', '012220420', '', '', '', 'ផ្ទះលេខ១៤០ ផ្លូវលំ ភូមិពោធិ៍តាមុំ ឃុំសា្វយជ្រុំ ស្រុកមេសាង  ព្រៃវែង', '', '050846887', NULL, '2019-10-23 11:16:28', NULL, 'Y', 3, '', 1, '2016-04-05'),
(36, NULL, 'ជា គឹមហាក់', 'Male', '1982-04-12', '', '011333360', '', '', '', 'ភូមិកោះស្វាយ ឃុំត្រពាំងជង ស្រុកបាកាន  ពោធិ៍សាត់ ', '', '160314522', NULL, '2019-10-23 11:19:51', NULL, 'Y', 3, '', 1, '2016-02-04'),
(37, NULL, 'ចេង ស៊ុនឡាយ', 'Female', '1986-03-23', '', '011333360', '', '', '', 'ភូមិកោះស្វាយ ឃុំត្រពាំងជង ស្រុកបាកាន  ពោធិ៍សាត់', '', '160443262', NULL, '2019-10-23 11:22:41', '2019-10-23 11:23:09', 'Y', 3, '3', 1, '2015-11-07'),
(38, NULL, 'ចេង ប៉េងហាប់', 'Male', '1982-06-12', '', '012671111', '', '', '', 'ផ្ទះលេខF07.04 ភូមិឃ្មួញ សង្កាត់ឃ្មួញ ខណ្ឌសែនសុខ  ភ្នំពេញ ', '', '160092574(01)', NULL, '2019-10-23 11:25:25', NULL, 'Y', 3, '', 1, '2018-11-12'),
(39, NULL, 'ឥដ្ឋិមា សូលីនដា', 'Female', '1993-06-27', '', '012671111', '', '', '', 'ផ្ទះលេខអេហ្វ០៧ ០៤ ផ្លូវបេតុង ភូមិឃ្មួញ សង្កាត់ឃ្មួញ ខណ្ឌសែនសុខ  ភ្នំពេញ ', '', '011046824', NULL, '2019-10-23 11:27:53', '2019-10-24 11:51:07', 'Y', 3, '3', 1, '2015-09-11'),
(40, NULL, 'សារិក ពិសិដ្ឋ', 'Male', '1982-10-25', '', '012378585', '', '', '', 'ផ្ទះលេខ៧៧ ផ្លូវ១៧៧ ភូមិចំរើនផល សង្កាត់បឹងទំពុន ខណ្ឌមានជ័យ ភ្នំពេញ ', '', '010860321', NULL, '2019-10-23 11:30:47', NULL, 'Y', 3, '', 1, '2013-12-25'),
(41, NULL, 'សោម ចិន្តា', 'Female', '1988-12-25', '', '012378585', '', '', '', '  ផ្ទះ ផ្លូវ ភូមិចំរើនផល សង្កាត់បឹងទំពុន ខណ្ឌមានជ័យ  ភ្នំពេញ', '', '010933845', NULL, '2019-10-23 11:32:28', NULL, 'Y', 3, '', 1, '2015-02-13'),
(42, NULL, 'សេង សម្បត្តិ', 'Male', '1986-05-24', '', '017716780', '', '', '', 'ផ្ទះ១២ ផ្លូវសហពន្ធ័រុស្សី ភូមិចុងថ្នល់ សង្កាត់ទឹកថ្លា ខណ្ឌសែនសុខ ភ្នំពេញ', '', '010846442', NULL, '2019-10-23 11:34:42', NULL, 'Y', 3, '', 1, '2013-08-22'),
(43, NULL, 'សូត្រ ឆេងលៀង', 'Female', '1987-04-04', '', '017716780', '', '', '', 'ផ្ទះA174 ភូមិផ្សារលើ សង្កាត់ផ្សារឆ្នាំង ក្រុងកំពង់ឆ្នាំង កំពង់ឆ្នាំង', '', '040368592', NULL, '2019-10-23 11:36:50', NULL, 'Y', 3, '', 1, '2012-12-24'),
(44, NULL, 'សូត្រ ប៊ុនឆាយ', 'Male', '1993-02-12', '', '017716780', '', '', '', 'ផ្ទះA174 ភូមិផ្សារលើ សង្កាត់ផ្សារឆ្នាំង ក្រុងកំពង់ឆ្នាំង កំពង់ឆ្នាំង', '', '040340312', NULL, '2019-10-23 11:38:31', NULL, 'Y', 3, '', 1, '2012-09-25'),
(45, NULL, 'គឹម រត្ម័ណារ៉ុង', 'Male', '1993-05-18', '', '077352222', '', '', '', 'ផ្ទះបេ៥ ផ្លូវ៣៧១ ភូមិទ្រា៤ សង្កាត់ស្ទឹងមានជ័យ ខណ្ឌមានជ័យ  ភ្នំពេញ', '', '011106290', NULL, '2019-10-23 11:40:30', NULL, 'Y', 3, '', 1, '2015-12-31'),
(46, NULL, 'ឈឹម វុត្ថា', 'Male', '1970-02-26', '', '012219067', '', '', '', 'ផ្ទះ១៦៣អា ក្រុម១១ ភូមិ សន្សំកុសល១ សង្កាត់បឹងទំពុន ខណ្ឌមានជយ័ រាជធានី ភំ្នពេញ ', '', '010204032', NULL, '2019-10-23 11:42:47', '2019-10-26 17:14:41', 'Y', 3, '3', 1, '2010-04-05'),
(47, NULL, 'ស៊ុន វាសនា', 'Female', '1979-10-10', '', '012219067', '', '', '', 'ផ្ទះ០៦E ផ្លូវបេតុង ភូមិសំបូរ សង្កាត់ដង្កោ ខណ្ឌដង្កោ ភំ្នពេញ ', '', '011143036', NULL, '2019-10-23 11:44:34', NULL, 'Y', 3, '', 1, '2016-02-05'),
(48, NULL, 'នុត សុម៉ាលីម', 'Female', '1960-01-15', '', '012828603', '', '', '', 'ផ្ទះ៩សេ ផ្លូវ៤៥៦ ភូមិ៥ សង្កាត់ទួលទំពូងទី១ ខណ្ឌចំការមន ភ្នំពេញ', '', '010860667', NULL, '2019-10-25 14:31:42', NULL, 'Y', 3, '', 1, '2013-12-27'),
(49, NULL, 'ស្វាយ វិចិត្រ', 'Male', '1974-12-12', '', '092707070', '', '', '', 'ផ្ទះ៣២ហ្សិត ផ្លូវ២១ ភូមិ៤ សង្កាត់ទន្លេបាសាក់ ខណ្ឌចំការមន ភំ្នពេញ', '', '010449185(01)', NULL, '2019-10-25 14:36:11', NULL, 'Y', 3, '', 1, '2015-11-05'),
(50, NULL, 'ហ៊ាន សោភណ្ឌ័', 'Female', '1980-08-10', '', '077607617', '', '', '', 'ផ្ទះ៤១E0E១ ផ្លូវ២៧១ ភូមិ១  សង្កាត់ផ្សារដើមថ្កូវ ខណ្ឌចំការមន  ភ្នំពេញ ', '', '011169206', NULL, '2019-10-28 17:10:43', NULL, 'Y', 3, '', 1, '2016-02-24'),
(51, NULL, 'លាង សារី', 'Male', '1969-02-05', '', '081818188', '', '', '', 'ផ្ទះ៣៦ ផ្លូវ២៧៣ ភូមិ៨ សង្កាត់បឺងកក់១ ខណ្ឌទួលគោក ភ្នំពេញ', '', '010861456', NULL, '2019-11-06 15:53:27', '2019-11-06 15:55:02', 'Y', 3, '3', 1, '2019-01-14');

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
  `exp_image` text,
  `regDt` datetime DEFAULT NULL,
  `upDt` datetime DEFAULT NULL,
  `useYn` varchar(1) NOT NULL,
  `regUsr` int(11) NOT NULL,
  `upUsr` int(11) NOT NULL,
  `sta_id` int(11) DEFAULT NULL,
  `sup_id` int(11) NOT NULL,
  `com_id` int(11) NOT NULL,
  `bra_id` int(11) NOT NULL,
  PRIMARY KEY (`exp_id`)
) ENGINE=MyISAM DEFAULT CHARSET=armscii8;

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
  `inst_paid_yn` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`inst_id`)
) ENGINE=MyISAM AUTO_INCREMENT=498 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_installment`
--

INSERT INTO `tbl_installment` (`inst_id`, `inst_loan_amount`, `inst_interest_rate`, `inst_period_month`, `inst_first_installment_date`, `inst_date`, `inst_num`, `inst_amt_pay`, `inst_amt_principle`, `inst_amt_interest`, `inst_amt_balance`, `inst_amt_penalty`, `inst_cancel_yn`, `sell_id`, `regDt`, `upDt`, `useYn`, `regUsr`, `upUsr`, `com_id`, `inst_type`, `inst_pay_per`, `inst_dis_amt`, `inst_dis_per`, `inst_loan_amount_per`, `inst_paid_yn`) VALUES
(1, 2000, 0, 1, '2019-09-01', '2019-07-31', 1, 2000, 2000, 0, 157000, NULL, NULL, 1, '2019-10-22 16:38:03', NULL, 'Y', 2, NULL, 1, 'BOOK', 0, 0, 0, NULL, 'Y'),
(2, 47700, 0, 3, '2019-09-01', '2019-08-06', 2, 13900, 13900, 0, 143100, NULL, NULL, 1, '2019-10-22 16:38:04', '2019-10-28 15:18:08', 'Y', 2, 3, 1, 'ADV', 10, 0, 0, NULL, 'Y'),
(3, 47700, 0, 3, '2019-09-01', '2019-09-01', 3, 15900, 15900, 0, 127200, NULL, NULL, 1, '2019-10-22 16:38:04', '2019-10-28 15:18:58', 'Y', 2, 3, 1, 'ADV', 10, 0, 0, NULL, 'Y'),
(4, 47700, 0, 3, '2019-09-01', '2019-10-01', 4, 15900, 15900, 0, 111300, NULL, NULL, 1, '2019-10-22 16:38:04', '2019-10-28 15:19:28', 'Y', 2, 3, 1, 'ADV', 10, 0, 0, NULL, 'Y'),
(5, 111300, 0, 15, '2019-09-01', '2019-11-01', 5, 7420, 7420, 0, 103880, NULL, NULL, 1, '2019-10-22 16:38:04', NULL, 'Y', 2, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(6, 111300, 0, 15, '2019-09-01', '2019-12-01', 6, 7420, 7420, 0, 96460, NULL, NULL, 1, '2019-10-22 16:38:04', NULL, 'Y', 2, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(7, 111300, 0, 15, '2019-09-01', '2020-01-01', 7, 7420, 7420, 0, 89040, NULL, NULL, 1, '2019-10-22 16:38:04', NULL, 'Y', 2, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(8, 111300, 0, 15, '2019-09-01', '2020-02-01', 8, 7420, 7420, 0, 81620, NULL, NULL, 1, '2019-10-22 16:38:04', NULL, 'Y', 2, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(9, 111300, 0, 15, '2019-09-01', '2020-03-01', 9, 7420, 7420, 0, 74200, NULL, NULL, 1, '2019-10-22 16:38:04', NULL, 'Y', 2, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(10, 111300, 0, 15, '2019-09-01', '2020-04-01', 10, 7420, 7420, 0, 66780, NULL, NULL, 1, '2019-10-22 16:38:04', NULL, 'Y', 2, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(11, 111300, 0, 15, '2019-09-01', '2020-05-01', 11, 7420, 7420, 0, 59360, NULL, NULL, 1, '2019-10-22 16:38:04', NULL, 'Y', 2, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(12, 111300, 0, 15, '2019-09-01', '2020-06-01', 12, 7420, 7420, 0, 51940, NULL, NULL, 1, '2019-10-22 16:38:04', NULL, 'Y', 2, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(13, 111300, 0, 15, '2019-09-01', '2020-07-01', 13, 7420, 7420, 0, 44520, NULL, NULL, 1, '2019-10-22 16:38:04', NULL, 'Y', 2, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(14, 111300, 0, 15, '2019-09-01', '2020-08-01', 14, 7420, 7420, 0, 37100, NULL, NULL, 1, '2019-10-22 16:38:04', NULL, 'Y', 2, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(15, 111300, 0, 15, '2019-09-01', '2020-09-01', 15, 7420, 7420, 0, 29680, NULL, NULL, 1, '2019-10-22 16:38:04', NULL, 'Y', 2, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(16, 111300, 0, 15, '2019-09-01', '2020-10-01', 16, 7420, 7420, 0, 22260, NULL, NULL, 1, '2019-10-22 16:38:04', NULL, 'Y', 2, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(17, 111300, 0, 15, '2019-09-01', '2020-11-01', 17, 7420, 7420, 0, 14840, NULL, NULL, 1, '2019-10-22 16:38:04', NULL, 'Y', 2, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(18, 111300, 0, 15, '2019-09-01', '2020-12-01', 18, 7420, 7420, 0, 7420, NULL, NULL, 1, '2019-10-22 16:38:04', NULL, 'Y', 2, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(19, 111300, 0, 15, '2019-09-01', '2021-01-01', 19, 7420, 7420, 0, 0, NULL, NULL, 1, '2019-10-22 16:38:04', NULL, 'Y', 2, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(20, 29700, 0, 1, '2019-08-01', '2019-06-17', 1, 29106, 29106, 0, 69300, NULL, NULL, 2, '2019-10-23 14:21:16', '2019-10-23 14:41:10', 'Y', 3, 3, 1, 'ADV', 30, 594, 2, NULL, 'Y'),
(21, 69300, 0, 18, '2019-08-01', '2019-08-01', 2, 3850, 3850, 0, 65450, NULL, NULL, 2, '2019-10-23 14:21:16', '2019-10-23 14:48:56', 'Y', 3, 3, 1, 'LOAN', 0, 0, 0, NULL, 'Y'),
(22, 69300, 0, 18, '2019-08-01', '2019-09-01', 3, 3850, 3850, 0, 61600, NULL, NULL, 2, '2019-10-23 14:21:16', '2019-10-23 14:50:31', 'Y', 3, 3, 1, 'LOAN', 0, 0, 0, NULL, 'Y'),
(23, 69300, 0, 18, '2019-08-01', '2019-10-01', 4, 3850, 3850, 0, 57750, NULL, NULL, 2, '2019-10-23 14:21:16', '2019-10-23 14:51:26', 'Y', 3, 3, 1, 'LOAN', 0, 0, 0, NULL, 'Y'),
(24, 69300, 0, 18, '2019-08-01', '2019-11-01', 5, 3850, 3850, 0, 53900, NULL, NULL, 2, '2019-10-23 14:21:16', '2019-11-02 11:10:42', 'Y', 3, 3, 1, 'LOAN', 0, 0, 0, NULL, 'Y'),
(25, 69300, 0, 18, '2019-08-01', '2019-12-01', 6, 3850, 3850, 0, 50050, NULL, NULL, 2, '2019-10-23 14:21:16', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(26, 69300, 0, 18, '2019-08-01', '2020-01-01', 7, 3850, 3850, 0, 46200, NULL, NULL, 2, '2019-10-23 14:21:16', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(27, 69300, 0, 18, '2019-08-01', '2020-02-01', 8, 3850, 3850, 0, 42350, NULL, NULL, 2, '2019-10-23 14:21:16', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(28, 69300, 0, 18, '2019-08-01', '2020-03-01', 9, 3850, 3850, 0, 38500, NULL, NULL, 2, '2019-10-23 14:21:16', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(29, 69300, 0, 18, '2019-08-01', '2020-04-01', 10, 3850, 3850, 0, 34650, NULL, NULL, 2, '2019-10-23 14:21:16', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(30, 69300, 0, 18, '2019-08-01', '2020-05-01', 11, 3850, 3850, 0, 30800, NULL, NULL, 2, '2019-10-23 14:21:16', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(31, 69300, 0, 18, '2019-08-01', '2020-06-01', 12, 3850, 3850, 0, 26950, NULL, NULL, 2, '2019-10-23 14:21:16', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(32, 69300, 0, 18, '2019-08-01', '2020-07-01', 13, 3850, 3850, 0, 23100, NULL, NULL, 2, '2019-10-23 14:21:16', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(33, 69300, 0, 18, '2019-08-01', '2020-08-01', 14, 3850, 3850, 0, 19250, NULL, NULL, 2, '2019-10-23 14:21:16', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(34, 69300, 0, 18, '2019-08-01', '2020-09-01', 15, 3850, 3850, 0, 15400, NULL, NULL, 2, '2019-10-23 14:21:16', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(35, 69300, 0, 18, '2019-08-01', '2020-10-01', 16, 3850, 3850, 0, 11550, NULL, NULL, 2, '2019-10-23 14:21:16', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(36, 69300, 0, 18, '2019-08-01', '2020-11-01', 17, 3850, 3850, 0, 7700, NULL, NULL, 2, '2019-10-23 14:21:16', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(37, 69300, 0, 18, '2019-08-01', '2020-12-01', 18, 3850, 3850, 0, 3850, NULL, NULL, 2, '2019-10-23 14:21:16', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(38, 69300, 0, 18, '2019-08-01', '2021-01-01', 19, 3850, 3850, 0, 0, NULL, NULL, 2, '2019-10-23 14:21:16', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(39, 29700, 0, 3, '2019-08-01', '2019-06-17', 1, 9900, 9900, 0, 89100, NULL, NULL, 3, '2019-10-23 14:58:37', '2019-10-23 15:02:51', 'Y', 3, 3, 1, 'ADV', 10, 0, 0, NULL, 'Y'),
(40, 29700, 0, 3, '2019-08-01', '2019-08-01', 2, 9900, 9900, 0, 79200, NULL, NULL, 3, '2019-10-23 14:58:37', '2019-10-23 15:05:28', 'Y', 3, 3, 1, 'ADV', 10, 0, 0, NULL, 'Y'),
(41, 29700, 0, 3, '2019-08-01', '2019-09-01', 3, 9900, 9900, 0, 69300, NULL, NULL, 3, '2019-10-23 14:58:37', '2019-10-23 15:06:18', 'Y', 3, 3, 1, 'ADV', 10, 0, 0, NULL, 'Y'),
(42, 69300, 0, 18, '2019-08-01', '2019-10-01', 4, 3850, 3850, 0, 65450, NULL, NULL, 3, '2019-10-23 14:58:37', '2019-10-23 15:07:10', 'Y', 3, 3, 1, 'LOAN', 0, 0, 0, NULL, 'Y'),
(43, 69300, 0, 18, '2019-08-01', '2019-11-01', 5, 3850, 3850, 0, 61600, NULL, NULL, 3, '2019-10-23 14:58:37', '2019-11-01 12:49:41', 'Y', 3, 3, 1, 'LOAN', 0, 0, 0, NULL, 'Y'),
(44, 69300, 0, 18, '2019-08-01', '2019-12-01', 6, 3850, 3850, 0, 57750, NULL, NULL, 3, '2019-10-23 14:58:37', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(45, 69300, 0, 18, '2019-08-01', '2020-01-01', 7, 3850, 3850, 0, 53900, NULL, NULL, 3, '2019-10-23 14:58:37', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(46, 69300, 0, 18, '2019-08-01', '2020-02-01', 8, 3850, 3850, 0, 50050, NULL, NULL, 3, '2019-10-23 14:58:37', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(47, 69300, 0, 18, '2019-08-01', '2020-03-01', 9, 3850, 3850, 0, 46200, NULL, NULL, 3, '2019-10-23 14:58:37', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(48, 69300, 0, 18, '2019-08-01', '2020-04-01', 10, 3850, 3850, 0, 42350, NULL, NULL, 3, '2019-10-23 14:58:37', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(49, 69300, 0, 18, '2019-08-01', '2020-05-01', 11, 3850, 3850, 0, 38500, NULL, NULL, 3, '2019-10-23 14:58:37', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(50, 69300, 0, 18, '2019-08-01', '2020-06-01', 12, 3850, 3850, 0, 34650, NULL, NULL, 3, '2019-10-23 14:58:37', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(51, 69300, 0, 18, '2019-08-01', '2020-07-01', 13, 3850, 3850, 0, 30800, NULL, NULL, 3, '2019-10-23 14:58:37', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(52, 69300, 0, 18, '2019-08-01', '2020-08-01', 14, 3850, 3850, 0, 26950, NULL, NULL, 3, '2019-10-23 14:58:37', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(53, 69300, 0, 18, '2019-08-01', '2020-09-01', 15, 3850, 3850, 0, 23100, NULL, NULL, 3, '2019-10-23 14:58:37', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(54, 69300, 0, 18, '2019-08-01', '2020-10-01', 16, 3850, 3850, 0, 19250, NULL, NULL, 3, '2019-10-23 14:58:37', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(55, 69300, 0, 18, '2019-08-01', '2020-11-01', 17, 3850, 3850, 0, 15400, NULL, NULL, 3, '2019-10-23 14:58:37', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(56, 69300, 0, 18, '2019-08-01', '2020-12-01', 18, 3850, 3850, 0, 11550, NULL, NULL, 3, '2019-10-23 14:58:37', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(57, 69300, 0, 18, '2019-08-01', '2021-01-01', 19, 3850, 3850, 0, 7700, NULL, NULL, 3, '2019-10-23 14:58:37', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(58, 69300, 0, 18, '2019-08-01', '2021-02-01', 20, 3850, 3850, 0, 3850, NULL, NULL, 3, '2019-10-23 14:58:37', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(59, 69300, 0, 18, '2019-08-01', '2021-03-01', 21, 3850, 3850, 0, 0, NULL, NULL, 3, '2019-10-23 14:58:37', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(60, 29700, 0, 3, '2019-08-01', '2019-06-17', 1, 9900, 9900, 0, 89100, NULL, NULL, 4, '2019-10-23 15:14:18', '2019-10-23 15:20:44', 'Y', 3, 3, 1, 'ADV', 10, 0, 0, NULL, 'Y'),
(61, 29700, 0, 3, '2019-08-01', '2019-08-01', 2, 9900, 9900, 0, 79200, NULL, NULL, 4, '2019-10-23 15:14:18', '2019-10-23 15:21:43', 'Y', 3, 3, 1, 'ADV', 10, 0, 0, NULL, 'Y'),
(62, 29700, 0, 3, '2019-08-01', '2019-09-01', 3, 9900, 9900, 0, 69300, NULL, NULL, 4, '2019-10-23 15:14:18', '2019-10-23 15:22:36', 'Y', 3, 3, 1, 'ADV', 10, 0, 0, NULL, 'Y'),
(63, 69300, 0, 18, '2019-08-01', '2019-10-01', 4, 3850, 3850, 0, 65450, NULL, NULL, 4, '2019-10-23 15:14:18', '2019-10-23 15:23:32', 'Y', 3, 3, 1, 'LOAN', 0, 0, 0, NULL, 'Y'),
(64, 69300, 0, 18, '2019-08-01', '2019-11-01', 5, 3850, 3850, 0, 61600, NULL, NULL, 4, '2019-10-23 15:14:18', '2019-11-02 11:24:36', 'Y', 3, 3, 1, 'LOAN', 0, 0, 0, NULL, 'Y'),
(65, 69300, 0, 18, '2019-08-01', '2019-12-01', 6, 3850, 3850, 0, 57750, NULL, NULL, 4, '2019-10-23 15:14:18', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(66, 69300, 0, 18, '2019-08-01', '2020-01-01', 7, 3850, 3850, 0, 53900, NULL, NULL, 4, '2019-10-23 15:14:18', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(67, 69300, 0, 18, '2019-08-01', '2020-02-01', 8, 3850, 3850, 0, 50050, NULL, NULL, 4, '2019-10-23 15:14:18', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(68, 69300, 0, 18, '2019-08-01', '2020-03-01', 9, 3850, 3850, 0, 46200, NULL, NULL, 4, '2019-10-23 15:14:18', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(69, 69300, 0, 18, '2019-08-01', '2020-04-01', 10, 3850, 3850, 0, 42350, NULL, NULL, 4, '2019-10-23 15:14:18', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(70, 69300, 0, 18, '2019-08-01', '2020-05-01', 11, 3850, 3850, 0, 38500, NULL, NULL, 4, '2019-10-23 15:14:18', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(71, 69300, 0, 18, '2019-08-01', '2020-06-01', 12, 3850, 3850, 0, 34650, NULL, NULL, 4, '2019-10-23 15:14:18', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(72, 69300, 0, 18, '2019-08-01', '2020-07-01', 13, 3850, 3850, 0, 30800, NULL, NULL, 4, '2019-10-23 15:14:18', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(73, 69300, 0, 18, '2019-08-01', '2020-08-01', 14, 3850, 3850, 0, 26950, NULL, NULL, 4, '2019-10-23 15:14:18', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(74, 69300, 0, 18, '2019-08-01', '2020-09-01', 15, 3850, 3850, 0, 23100, NULL, NULL, 4, '2019-10-23 15:14:18', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(75, 69300, 0, 18, '2019-08-01', '2020-10-01', 16, 3850, 3850, 0, 19250, NULL, NULL, 4, '2019-10-23 15:14:18', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(76, 69300, 0, 18, '2019-08-01', '2020-11-01', 17, 3850, 3850, 0, 15400, NULL, NULL, 4, '2019-10-23 15:14:18', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(77, 69300, 0, 18, '2019-08-01', '2020-12-01', 18, 3850, 3850, 0, 11550, NULL, NULL, 4, '2019-10-23 15:14:18', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(78, 69300, 0, 18, '2019-08-01', '2021-01-01', 19, 3850, 3850, 0, 7700, NULL, NULL, 4, '2019-10-23 15:14:18', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(79, 69300, 0, 18, '2019-08-01', '2021-02-01', 20, 3850, 3850, 0, 3850, NULL, NULL, 4, '2019-10-23 15:14:18', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(80, 69300, 0, 18, '2019-08-01', '2021-03-01', 21, 3850, 3850, 0, 0, NULL, NULL, 4, '2019-10-23 15:14:18', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(81, 2000, 0, 1, '2019-08-01', '2019-06-24', 1, 2000, 2000, 0, 97000, NULL, NULL, 5, '2019-10-23 15:35:16', NULL, 'Y', 3, NULL, 1, 'BOOK', 0, 0, 0, NULL, 'Y'),
(82, 29700, 0, 3, '2019-08-01', '2019-07-01', 2, 7900, 7900, 0, 89100, NULL, NULL, 5, '2019-10-23 15:35:16', NULL, 'Y', 3, NULL, 1, 'ADV', 10, 0, 0, NULL, 'N'),
(83, 29700, 0, 3, '2019-08-01', '2019-08-01', 3, 9900, 9900, 0, 79200, NULL, NULL, 5, '2019-10-23 15:35:16', NULL, 'Y', 3, NULL, 1, 'ADV', 10, 0, 0, NULL, 'N'),
(84, 29700, 0, 3, '2019-08-01', '2019-09-01', 4, 9900, 9900, 0, 69300, NULL, NULL, 5, '2019-10-23 15:35:16', NULL, 'Y', 3, NULL, 1, 'ADV', 10, 0, 0, NULL, 'N'),
(85, 69300, 0, 18, '2019-08-01', '2019-10-01', 5, 3850, 3850, 0, 65450, NULL, NULL, 5, '2019-10-23 15:35:16', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(86, 69300, 0, 18, '2019-08-01', '2019-11-01', 6, 3850, 3850, 0, 61600, NULL, NULL, 5, '2019-10-23 15:35:16', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(87, 69300, 0, 18, '2019-08-01', '2019-12-01', 7, 3850, 3850, 0, 57750, NULL, NULL, 5, '2019-10-23 15:35:16', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(88, 69300, 0, 18, '2019-08-01', '2020-01-01', 8, 3850, 3850, 0, 53900, NULL, NULL, 5, '2019-10-23 15:35:16', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(89, 69300, 0, 18, '2019-08-01', '2020-02-01', 9, 3850, 3850, 0, 50050, NULL, NULL, 5, '2019-10-23 15:35:16', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(90, 69300, 0, 18, '2019-08-01', '2020-03-01', 10, 3850, 3850, 0, 46200, NULL, NULL, 5, '2019-10-23 15:35:16', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(91, 69300, 0, 18, '2019-08-01', '2020-04-01', 11, 3850, 3850, 0, 42350, NULL, NULL, 5, '2019-10-23 15:35:16', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(92, 69300, 0, 18, '2019-08-01', '2020-05-01', 12, 3850, 3850, 0, 38500, NULL, NULL, 5, '2019-10-23 15:35:16', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(93, 69300, 0, 18, '2019-08-01', '2020-06-01', 13, 3850, 3850, 0, 34650, NULL, NULL, 5, '2019-10-23 15:35:16', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(94, 69300, 0, 18, '2019-08-01', '2020-07-01', 14, 3850, 3850, 0, 30800, NULL, NULL, 5, '2019-10-23 15:35:16', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(95, 69300, 0, 18, '2019-08-01', '2020-08-01', 15, 3850, 3850, 0, 26950, NULL, NULL, 5, '2019-10-23 15:35:16', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(96, 69300, 0, 18, '2019-08-01', '2020-09-01', 16, 3850, 3850, 0, 23100, NULL, NULL, 5, '2019-10-23 15:35:16', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(97, 69300, 0, 18, '2019-08-01', '2020-10-01', 17, 3850, 3850, 0, 19250, NULL, NULL, 5, '2019-10-23 15:35:16', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(98, 69300, 0, 18, '2019-08-01', '2020-11-01', 18, 3850, 3850, 0, 15400, NULL, NULL, 5, '2019-10-23 15:35:16', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(99, 69300, 0, 18, '2019-08-01', '2020-12-01', 19, 3850, 3850, 0, 11550, NULL, NULL, 5, '2019-10-23 15:35:16', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(100, 69300, 0, 18, '2019-08-01', '2021-01-01', 20, 3850, 3850, 0, 7700, NULL, NULL, 5, '2019-10-23 15:35:16', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(101, 69300, 0, 18, '2019-08-01', '2021-02-01', 21, 3850, 3850, 0, 3850, NULL, NULL, 5, '2019-10-23 15:35:16', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(102, 69300, 0, 18, '2019-08-01', '2021-03-01', 22, 3850, 3850, 0, 0, NULL, NULL, 5, '2019-10-23 15:35:16', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(103, 2000, 0, 1, '2019-08-01', '2019-06-24', 1, 2000, 2000, 0, 97000, NULL, NULL, 6, '2019-10-23 15:45:36', NULL, 'Y', 3, NULL, 1, 'BOOK', 0, 0, 0, NULL, 'Y'),
(104, 29700, 0, 3, '2019-08-01', '2019-07-01', 2, 7900, 7900, 0, 89100, NULL, NULL, 6, '2019-10-23 15:45:36', '2019-10-24 09:07:45', 'Y', 3, 3, 1, 'ADV', 10, 0, 0, NULL, 'Y'),
(105, 29700, 0, 3, '2019-08-01', '2019-08-01', 3, 9900, 9900, 0, 79200, NULL, NULL, 6, '2019-10-23 15:45:36', '2019-10-24 09:08:59', 'Y', 3, 3, 1, 'ADV', 10, 0, 0, NULL, 'Y'),
(106, 29700, 0, 3, '2019-08-01', '2019-09-01', 4, 9900, 9900, 0, 69300, NULL, NULL, 6, '2019-10-23 15:45:36', '2019-10-24 09:10:07', 'Y', 3, 3, 1, 'ADV', 10, 0, 0, NULL, 'Y'),
(107, 69300, 0, 18, '2019-08-01', '2019-10-01', 5, 3850, 3850, 0, 65450, NULL, NULL, 6, '2019-10-23 15:45:36', '2019-10-24 09:15:25', 'Y', 3, 3, 1, 'LOAN', 0, 0, 0, NULL, 'Y'),
(108, 69300, 0, 18, '2019-08-01', '2019-11-01', 6, 3850, 3850, 0, 61600, NULL, NULL, 6, '2019-10-23 15:45:36', '2019-11-05 14:43:03', 'Y', 3, 3, 1, 'LOAN', 0, 0, 0, NULL, 'Y'),
(109, 69300, 0, 18, '2019-08-01', '2019-12-01', 7, 3850, 3850, 0, 57750, NULL, NULL, 6, '2019-10-23 15:45:36', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(110, 69300, 0, 18, '2019-08-01', '2020-01-01', 8, 3850, 3850, 0, 53900, NULL, NULL, 6, '2019-10-23 15:45:36', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(111, 69300, 0, 18, '2019-08-01', '2020-02-01', 9, 3850, 3850, 0, 50050, NULL, NULL, 6, '2019-10-23 15:45:36', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(112, 69300, 0, 18, '2019-08-01', '2020-03-01', 10, 3850, 3850, 0, 46200, NULL, NULL, 6, '2019-10-23 15:45:36', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(113, 69300, 0, 18, '2019-08-01', '2020-04-01', 11, 3850, 3850, 0, 42350, NULL, NULL, 6, '2019-10-23 15:45:36', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(114, 69300, 0, 18, '2019-08-01', '2020-05-01', 12, 3850, 3850, 0, 38500, NULL, NULL, 6, '2019-10-23 15:45:36', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(115, 69300, 0, 18, '2019-08-01', '2020-06-01', 13, 3850, 3850, 0, 34650, NULL, NULL, 6, '2019-10-23 15:45:36', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(116, 69300, 0, 18, '2019-08-01', '2020-07-01', 14, 3850, 3850, 0, 30800, NULL, NULL, 6, '2019-10-23 15:45:36', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(117, 69300, 0, 18, '2019-08-01', '2020-08-01', 15, 3850, 3850, 0, 26950, NULL, NULL, 6, '2019-10-23 15:45:36', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(118, 69300, 0, 18, '2019-08-01', '2020-09-01', 16, 3850, 3850, 0, 23100, NULL, NULL, 6, '2019-10-23 15:45:36', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(119, 69300, 0, 18, '2019-08-01', '2020-10-01', 17, 3850, 3850, 0, 19250, NULL, NULL, 6, '2019-10-23 15:45:36', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(120, 69300, 0, 18, '2019-08-01', '2020-11-01', 18, 3850, 3850, 0, 15400, NULL, NULL, 6, '2019-10-23 15:45:36', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(121, 69300, 0, 18, '2019-08-01', '2020-12-01', 19, 3850, 3850, 0, 11550, NULL, NULL, 6, '2019-10-23 15:45:36', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(122, 69300, 0, 18, '2019-08-01', '2021-01-01', 20, 3850, 3850, 0, 7700, NULL, NULL, 6, '2019-10-23 15:45:36', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(123, 69300, 0, 18, '2019-08-01', '2021-02-01', 21, 3850, 3850, 0, 3850, NULL, NULL, 6, '2019-10-23 15:45:36', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(124, 69300, 0, 18, '2019-08-01', '2021-03-01', 22, 3850, 3850, 0, 0, NULL, NULL, 6, '2019-10-23 15:45:36', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(125, 2000, 0, 1, '2019-08-01', '2019-06-21', 1, 2000, 2000, 0, 97000, NULL, NULL, 7, '2019-10-24 09:35:08', NULL, 'Y', 3, NULL, 1, 'BOOK', 0, 0, 0, NULL, 'Y'),
(126, 49500, 0, 1, '2019-08-01', '2019-06-24', 2, 45520, 45520, 0, 49500, NULL, NULL, 7, '2019-10-24 09:35:08', '2019-10-24 09:38:15', 'Y', 3, 3, 1, 'ADV', 50, 1980, 4, NULL, 'Y'),
(127, 49500, 0, 10, '2019-08-01', '2019-08-01', 3, 4950, 4950, 0, 44550, NULL, NULL, 7, '2019-10-24 09:35:08', '2019-10-24 09:39:50', 'Y', 3, 3, 1, 'LOAN', 0, 0, 0, NULL, 'Y'),
(128, 49500, 0, 10, '2019-08-01', '2019-09-01', 4, 4950, 4950, 0, 39600, NULL, NULL, 7, '2019-10-24 09:35:08', '2019-10-24 09:41:10', 'Y', 3, 3, 1, 'LOAN', 0, 0, 0, NULL, 'Y'),
(129, 49500, 0, 10, '2019-08-01', '2019-10-01', 5, 4950, 4950, 0, 34650, NULL, NULL, 7, '2019-10-24 09:35:08', '2019-10-24 09:41:54', 'Y', 3, 3, 1, 'LOAN', 0, 0, 0, NULL, 'Y'),
(130, 49500, 0, 10, '2019-08-01', '2019-11-01', 6, 4950, 4950, 0, 29700, NULL, NULL, 7, '2019-10-24 09:35:08', '2019-11-04 15:38:48', 'Y', 3, 3, 1, 'LOAN', 0, 0, 0, NULL, 'Y'),
(131, 49500, 0, 10, '2019-08-01', '2019-12-01', 7, 4950, 4950, 0, 24750, NULL, NULL, 7, '2019-10-24 09:35:08', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(132, 49500, 0, 10, '2019-08-01', '2020-01-01', 8, 4950, 4950, 0, 19800, NULL, NULL, 7, '2019-10-24 09:35:08', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(133, 49500, 0, 10, '2019-08-01', '2020-02-01', 9, 4950, 4950, 0, 14850, NULL, NULL, 7, '2019-10-24 09:35:08', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(134, 49500, 0, 10, '2019-08-01', '2020-03-01', 10, 4950, 4950, 0, 9900, NULL, NULL, 7, '2019-10-24 09:35:08', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(135, 49500, 0, 10, '2019-08-01', '2020-04-01', 11, 4950, 4950, 0, 4950, NULL, NULL, 7, '2019-10-24 09:35:08', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(136, 49500, 0, 10, '2019-08-01', '2020-05-01', 12, 4950, 4950, 0, 0, NULL, NULL, 7, '2019-10-24 09:35:08', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(137, 2000, 0, 1, '2019-08-01', '2019-06-20', 1, 2000, 2000, 0, 120500, NULL, NULL, 8, '2019-10-24 09:56:48', NULL, 'Y', 3, NULL, 1, 'BOOK', 0, 0, 0, NULL, 'Y'),
(138, 36750, 0, 3, '2019-08-01', '2019-06-26', 2, 10250, 10250, 0, 110250, NULL, NULL, 8, '2019-10-24 09:56:48', '2019-10-24 09:59:57', 'Y', 3, 3, 1, 'ADV', 10, 0, 0, NULL, 'Y'),
(139, 36750, 0, 3, '2019-08-01', '2019-08-01', 3, 12250, 12250, 0, 98000, NULL, NULL, 8, '2019-10-24 09:56:48', '2019-10-24 10:00:38', 'Y', 3, 3, 1, 'ADV', 10, 0, 0, NULL, 'Y'),
(140, 36750, 0, 3, '2019-08-01', '2019-09-01', 4, 12250, 12250, 0, 85750, NULL, NULL, 8, '2019-10-24 09:56:48', '2019-10-24 10:01:29', 'Y', 3, 3, 1, 'ADV', 10, 0, 0, NULL, 'Y'),
(141, 85750, 0, 15, '2019-08-01', '2019-10-01', 5, 5716.67, 5716.67, 0, 80033.33, NULL, NULL, 8, '2019-10-24 09:56:48', '2019-10-24 10:02:08', 'Y', 3, 3, 1, 'LOAN', 0, 0, 0, NULL, 'Y'),
(142, 85750, 0, 15, '2019-08-01', '2019-11-01', 6, 5716.67, 5716.67, 0, 74316.66, NULL, NULL, 8, '2019-10-24 09:56:48', '2019-11-05 14:46:49', 'Y', 3, 3, 1, 'LOAN', 0, 0, 0, NULL, 'Y'),
(143, 85750, 0, 15, '2019-08-01', '2019-12-01', 7, 5716.67, 5716.67, 0, 68599.99, NULL, NULL, 8, '2019-10-24 09:56:48', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(144, 85750, 0, 15, '2019-08-01', '2020-01-01', 8, 5716.67, 5716.67, 0, 62883.32, NULL, NULL, 8, '2019-10-24 09:56:48', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(145, 85750, 0, 15, '2019-08-01', '2020-02-01', 9, 5716.67, 5716.67, 0, 57166.65, NULL, NULL, 8, '2019-10-24 09:56:48', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(146, 85750, 0, 15, '2019-08-01', '2020-03-01', 10, 5716.67, 5716.67, 0, 51449.98, NULL, NULL, 8, '2019-10-24 09:56:48', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(147, 85750, 0, 15, '2019-08-01', '2020-04-01', 11, 5716.67, 5716.67, 0, 45733.31, NULL, NULL, 8, '2019-10-24 09:56:48', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(148, 85750, 0, 15, '2019-08-01', '2020-05-01', 12, 5716.67, 5716.67, 0, 40016.64, NULL, NULL, 8, '2019-10-24 09:56:48', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(149, 85750, 0, 15, '2019-08-01', '2020-06-01', 13, 5716.67, 5716.67, 0, 34299.97, NULL, NULL, 8, '2019-10-24 09:56:48', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(150, 85750, 0, 15, '2019-08-01', '2020-07-01', 14, 5716.67, 5716.67, 0, 28583.3, NULL, NULL, 8, '2019-10-24 09:56:48', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(151, 85750, 0, 15, '2019-08-01', '2020-08-01', 15, 5716.67, 5716.67, 0, 22866.63, NULL, NULL, 8, '2019-10-24 09:56:48', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(152, 85750, 0, 15, '2019-08-01', '2020-09-01', 16, 5716.67, 5716.67, 0, 17149.96, NULL, NULL, 8, '2019-10-24 09:56:48', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(153, 85750, 0, 15, '2019-08-01', '2020-10-01', 17, 5716.67, 5716.67, 0, 11433.29, NULL, NULL, 8, '2019-10-24 09:56:48', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(154, 85750, 0, 15, '2019-08-01', '2020-11-01', 18, 5716.67, 5716.67, 0, 5716.62, NULL, NULL, 8, '2019-10-24 09:56:48', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(155, 85750, 0, 15, '2019-08-01', '2020-12-01', 19, 5716.67, 5716.67, 0, 0, NULL, NULL, 8, '2019-10-24 09:56:48', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(156, 2000, 0, 1, '2019-08-01', '2019-06-23', 1, 2000, 2000, 0, 97000, NULL, NULL, 9, '2019-10-24 10:08:19', NULL, 'Y', 3, NULL, 1, 'BOOK', 0, 0, 0, NULL, 'Y'),
(157, 29700, 0, 3, '2019-08-01', '2019-07-03', 2, 7900, 7900, 0, 89100, NULL, NULL, 9, '2019-10-24 10:08:19', '2019-10-24 10:09:22', 'Y', 3, 3, 1, 'ADV', 10, 0, 0, NULL, 'Y'),
(158, 29700, 0, 3, '2019-08-01', '2019-08-01', 3, 9900, 9900, 0, 79200, NULL, NULL, 9, '2019-10-24 10:08:19', '2019-10-24 10:10:10', 'Y', 3, 3, 1, 'ADV', 10, 0, 0, NULL, 'Y'),
(159, 29700, 0, 3, '2019-08-01', '2019-09-01', 4, 9900, 9900, 0, 69300, NULL, NULL, 9, '2019-10-24 10:08:19', '2019-10-24 10:11:35', 'Y', 3, 3, 1, 'ADV', 10, 0, 0, NULL, 'Y'),
(160, 69300, 0, 18, '2019-08-01', '2019-10-01', 5, 3850, 3850, 0, 65450, NULL, NULL, 9, '2019-10-24 10:08:19', '2019-10-24 10:13:02', 'Y', 3, 3, 1, 'LOAN', 0, 0, 0, NULL, 'Y'),
(161, 69300, 0, 18, '2019-08-01', '2019-11-01', 6, 3850, 3850, 0, 61600, NULL, NULL, 9, '2019-10-24 10:08:19', '2019-11-05 14:48:55', 'Y', 3, 3, 1, 'LOAN', 0, 0, 0, NULL, 'Y'),
(162, 69300, 0, 18, '2019-08-01', '2019-12-01', 7, 3850, 3850, 0, 57750, NULL, NULL, 9, '2019-10-24 10:08:19', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(163, 69300, 0, 18, '2019-08-01', '2020-01-01', 8, 3850, 3850, 0, 53900, NULL, NULL, 9, '2019-10-24 10:08:19', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(164, 69300, 0, 18, '2019-08-01', '2020-02-01', 9, 3850, 3850, 0, 50050, NULL, NULL, 9, '2019-10-24 10:08:19', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(165, 69300, 0, 18, '2019-08-01', '2020-03-01', 10, 3850, 3850, 0, 46200, NULL, NULL, 9, '2019-10-24 10:08:19', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(166, 69300, 0, 18, '2019-08-01', '2020-04-01', 11, 3850, 3850, 0, 42350, NULL, NULL, 9, '2019-10-24 10:08:19', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(167, 69300, 0, 18, '2019-08-01', '2020-05-01', 12, 3850, 3850, 0, 38500, NULL, NULL, 9, '2019-10-24 10:08:19', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(168, 69300, 0, 18, '2019-08-01', '2020-06-01', 13, 3850, 3850, 0, 34650, NULL, NULL, 9, '2019-10-24 10:08:19', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(169, 69300, 0, 18, '2019-08-01', '2020-07-01', 14, 3850, 3850, 0, 30800, NULL, NULL, 9, '2019-10-24 10:08:19', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(170, 69300, 0, 18, '2019-08-01', '2020-08-01', 15, 3850, 3850, 0, 26950, NULL, NULL, 9, '2019-10-24 10:08:19', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(171, 69300, 0, 18, '2019-08-01', '2020-09-01', 16, 3850, 3850, 0, 23100, NULL, NULL, 9, '2019-10-24 10:08:19', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(172, 69300, 0, 18, '2019-08-01', '2020-10-01', 17, 3850, 3850, 0, 19250, NULL, NULL, 9, '2019-10-24 10:08:19', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(173, 69300, 0, 18, '2019-08-01', '2020-11-01', 18, 3850, 3850, 0, 15400, NULL, NULL, 9, '2019-10-24 10:08:19', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(174, 69300, 0, 18, '2019-08-01', '2020-12-01', 19, 3850, 3850, 0, 11550, NULL, NULL, 9, '2019-10-24 10:08:19', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(175, 69300, 0, 18, '2019-08-01', '2021-01-01', 20, 3850, 3850, 0, 7700, NULL, NULL, 9, '2019-10-24 10:08:19', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(176, 69300, 0, 18, '2019-08-01', '2021-02-01', 21, 3850, 3850, 0, 3850, NULL, NULL, 9, '2019-10-24 10:08:19', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(177, 69300, 0, 18, '2019-08-01', '2021-03-01', 22, 3850, 3850, 0, 0, NULL, NULL, 9, '2019-10-24 10:08:19', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(178, 2000, 0, 1, '2019-08-01', '2019-06-26', 1, 2000, 2000, 0, 97000, NULL, NULL, 10, '2019-10-24 10:20:40', NULL, 'Y', 3, NULL, 1, 'BOOK', 0, 0, 0, NULL, 'Y'),
(179, 29700, 0, 3, '2019-08-01', '2019-07-01', 2, 7900, 7900, 0, 89100, NULL, NULL, 10, '2019-10-24 10:20:40', '2019-10-24 10:25:17', 'Y', 3, 3, 1, 'ADV', 10, 0, 0, NULL, 'Y'),
(180, 29700, 0, 3, '2019-08-01', '2019-08-01', 3, 9900, 9900, 0, 79200, NULL, NULL, 10, '2019-10-24 10:20:40', '2019-10-24 10:27:26', 'Y', 3, 3, 1, 'ADV', 10, 0, 0, NULL, 'Y'),
(181, 29700, 0, 3, '2019-08-01', '2019-09-01', 4, 9900, 9900, 0, 69300, NULL, NULL, 10, '2019-10-24 10:20:40', '2019-10-24 10:28:13', 'Y', 3, 3, 1, 'ADV', 10, 0, 0, NULL, 'Y'),
(182, 69300, 0, 15, '2019-08-01', '2019-10-01', 5, 4620, 4620, 0, 64680, NULL, NULL, 10, '2019-10-24 10:20:40', '2019-10-24 10:30:25', 'Y', 3, 3, 1, 'LOAN', 0, 0, 0, NULL, 'Y'),
(183, 69300, 0, 15, '2019-08-01', '2019-11-01', 6, 4620, 4620, 0, 60060, NULL, NULL, 10, '2019-10-24 10:20:40', '2019-11-04 10:41:11', 'Y', 3, 3, 1, 'LOAN', 0, 0, 0, NULL, 'Y'),
(184, 69300, 0, 15, '2019-08-01', '2019-12-01', 7, 4620, 4620, 0, 55440, NULL, NULL, 10, '2019-10-24 10:20:40', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(185, 69300, 0, 15, '2019-08-01', '2020-01-01', 8, 4620, 4620, 0, 50820, NULL, NULL, 10, '2019-10-24 10:20:40', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(186, 69300, 0, 15, '2019-08-01', '2020-02-01', 9, 4620, 4620, 0, 46200, NULL, NULL, 10, '2019-10-24 10:20:40', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(187, 69300, 0, 15, '2019-08-01', '2020-03-01', 10, 4620, 4620, 0, 41580, NULL, NULL, 10, '2019-10-24 10:20:40', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(188, 69300, 0, 15, '2019-08-01', '2020-04-01', 11, 4620, 4620, 0, 36960, NULL, NULL, 10, '2019-10-24 10:20:40', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(189, 69300, 0, 15, '2019-08-01', '2020-05-01', 12, 4620, 4620, 0, 32340, NULL, NULL, 10, '2019-10-24 10:20:40', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(190, 69300, 0, 15, '2019-08-01', '2020-06-01', 13, 4620, 4620, 0, 27720, NULL, NULL, 10, '2019-10-24 10:20:40', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(191, 69300, 0, 15, '2019-08-01', '2020-07-01', 14, 4620, 4620, 0, 23100, NULL, NULL, 10, '2019-10-24 10:20:40', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(192, 69300, 0, 15, '2019-08-01', '2020-08-01', 15, 4620, 4620, 0, 18480, NULL, NULL, 10, '2019-10-24 10:20:40', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(193, 69300, 0, 15, '2019-08-01', '2020-09-01', 16, 4620, 4620, 0, 13860, NULL, NULL, 10, '2019-10-24 10:20:40', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(194, 69300, 0, 15, '2019-08-01', '2020-10-01', 17, 4620, 4620, 0, 9240, NULL, NULL, 10, '2019-10-24 10:20:40', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(195, 69300, 0, 15, '2019-08-01', '2020-11-01', 18, 4620, 4620, 0, 4620, NULL, NULL, 10, '2019-10-24 10:20:40', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(196, 69300, 0, 15, '2019-08-01', '2020-12-01', 19, 4620, 4620, 0, 0, NULL, NULL, 10, '2019-10-24 10:20:40', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(197, 33300, 0, 3, '2019-08-01', '2019-06-24', 1, 11100, 11100, 0, 99900, NULL, NULL, 11, '2019-10-24 10:43:31', '2019-10-24 10:44:49', 'Y', 3, 3, 1, 'ADV', 10, 0, 0, NULL, 'Y'),
(198, 33300, 0, 3, '2019-08-01', '2019-08-01', 2, 11100, 11100, 0, 88800, NULL, NULL, 11, '2019-10-24 10:43:31', '2019-10-24 10:45:20', 'Y', 3, 3, 1, 'ADV', 10, 0, 0, NULL, 'Y'),
(199, 33300, 0, 3, '2019-08-01', '2019-09-01', 3, 11100, 11100, 0, 77700, NULL, NULL, 11, '2019-10-24 10:43:31', '2019-10-24 10:46:14', 'Y', 3, 3, 1, 'ADV', 10, 0, 0, NULL, 'Y'),
(200, 77700, 0, 15, '2019-08-01', '2019-10-01', 4, 5180, 5180, 0, 72520, NULL, NULL, 11, '2019-10-24 10:43:31', '2019-10-24 10:48:04', 'Y', 3, 3, 1, 'LOAN', 0, 0, 0, NULL, 'Y'),
(201, 77700, 0, 15, '2019-08-01', '2019-11-01', 5, 5180, 5180, 0, 67340, NULL, NULL, 11, '2019-10-24 10:43:31', '2019-11-04 15:40:19', 'Y', 3, 3, 1, 'LOAN', 0, 0, 0, NULL, 'Y'),
(202, 77700, 0, 15, '2019-08-01', '2019-12-01', 6, 5180, 5180, 0, 62160, NULL, NULL, 11, '2019-10-24 10:43:31', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(203, 77700, 0, 15, '2019-08-01', '2020-01-01', 7, 5180, 5180, 0, 56980, NULL, NULL, 11, '2019-10-24 10:43:31', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(204, 77700, 0, 15, '2019-08-01', '2020-02-01', 8, 5180, 5180, 0, 51800, NULL, NULL, 11, '2019-10-24 10:43:31', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(205, 77700, 0, 15, '2019-08-01', '2020-03-01', 9, 5180, 5180, 0, 46620, NULL, NULL, 11, '2019-10-24 10:43:31', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(206, 77700, 0, 15, '2019-08-01', '2020-04-01', 10, 5180, 5180, 0, 41440, NULL, NULL, 11, '2019-10-24 10:43:31', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(207, 77700, 0, 15, '2019-08-01', '2020-05-01', 11, 5180, 5180, 0, 36260, NULL, NULL, 11, '2019-10-24 10:43:31', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(208, 77700, 0, 15, '2019-08-01', '2020-06-01', 12, 5180, 5180, 0, 31080, NULL, NULL, 11, '2019-10-24 10:43:31', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(209, 77700, 0, 15, '2019-08-01', '2020-07-01', 13, 5180, 5180, 0, 25900, NULL, NULL, 11, '2019-10-24 10:43:31', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(210, 77700, 0, 15, '2019-08-01', '2020-08-01', 14, 5180, 5180, 0, 20720, NULL, NULL, 11, '2019-10-24 10:43:31', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(211, 77700, 0, 15, '2019-08-01', '2020-09-01', 15, 5180, 5180, 0, 15540, NULL, NULL, 11, '2019-10-24 10:43:31', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(212, 77700, 0, 15, '2019-08-01', '2020-10-01', 16, 5180, 5180, 0, 10360, NULL, NULL, 11, '2019-10-24 10:43:31', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(213, 77700, 0, 15, '2019-08-01', '2020-11-01', 17, 5180, 5180, 0, 5180, NULL, NULL, 11, '2019-10-24 10:43:31', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(214, 77700, 0, 15, '2019-08-01', '2020-12-01', 18, 5180, 5180, 0, 0, NULL, NULL, 11, '2019-10-24 10:43:31', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(215, 59400, 0, 3, '2019-08-01', '2019-06-26', 1, 19800, 19800, 0, 178200, NULL, NULL, 12, '2019-10-24 11:10:08', '2019-10-28 14:31:29', 'Y', 3, 3, 1, 'ADV', 10, 0, 0, NULL, 'Y'),
(216, 59400, 0, 3, '2019-08-01', '2019-08-01', 2, 19800, 19800, 0, 158400, NULL, NULL, 12, '2019-10-24 11:10:08', '2019-10-28 14:32:38', 'Y', 3, 3, 1, 'ADV', 10, 0, 0, NULL, 'Y'),
(217, 59400, 0, 3, '2019-08-01', '2019-09-01', 3, 19800, 19800, 0, 138600, NULL, NULL, 12, '2019-10-24 11:10:08', '2019-10-28 14:33:34', 'Y', 3, 3, 1, 'ADV', 10, 0, 0, NULL, 'Y'),
(218, 138600, 0, 18, '2019-08-01', '2019-10-01', 4, 7700, 7700, 0, 130900, NULL, NULL, 12, '2019-10-24 11:10:08', '2019-10-28 14:34:23', 'Y', 3, 3, 1, 'LOAN', 0, 0, 0, NULL, 'Y'),
(219, 138600, 0, 18, '2019-08-01', '2019-11-01', 5, 7700, 7700, 0, 123200, NULL, NULL, 12, '2019-10-24 11:10:08', '2019-11-04 14:18:01', 'Y', 3, 3, 1, 'LOAN', 0, 0, 0, NULL, 'Y'),
(220, 138600, 0, 18, '2019-08-01', '2019-12-01', 6, 7700, 7700, 0, 115500, NULL, NULL, 12, '2019-10-24 11:10:08', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(221, 138600, 0, 18, '2019-08-01', '2020-01-01', 7, 7700, 7700, 0, 107800, NULL, NULL, 12, '2019-10-24 11:10:08', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(222, 138600, 0, 18, '2019-08-01', '2020-02-01', 8, 7700, 7700, 0, 100100, NULL, NULL, 12, '2019-10-24 11:10:08', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(223, 138600, 0, 18, '2019-08-01', '2020-03-01', 9, 7700, 7700, 0, 92400, NULL, NULL, 12, '2019-10-24 11:10:08', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(224, 138600, 0, 18, '2019-08-01', '2020-04-01', 10, 7700, 7700, 0, 84700, NULL, NULL, 12, '2019-10-24 11:10:08', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(225, 138600, 0, 18, '2019-08-01', '2020-05-01', 11, 7700, 7700, 0, 77000, NULL, NULL, 12, '2019-10-24 11:10:08', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(226, 138600, 0, 18, '2019-08-01', '2020-06-01', 12, 7700, 7700, 0, 69300, NULL, NULL, 12, '2019-10-24 11:10:08', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(227, 138600, 0, 18, '2019-08-01', '2020-07-01', 13, 7700, 7700, 0, 61600, NULL, NULL, 12, '2019-10-24 11:10:08', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(228, 138600, 0, 18, '2019-08-01', '2020-08-01', 14, 7700, 7700, 0, 53900, NULL, NULL, 12, '2019-10-24 11:10:08', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(229, 138600, 0, 18, '2019-08-01', '2020-09-01', 15, 7700, 7700, 0, 46200, NULL, NULL, 12, '2019-10-24 11:10:08', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(230, 138600, 0, 18, '2019-08-01', '2020-10-01', 16, 7700, 7700, 0, 38500, NULL, NULL, 12, '2019-10-24 11:10:08', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(231, 138600, 0, 18, '2019-08-01', '2020-11-01', 17, 7700, 7700, 0, 30800, NULL, NULL, 12, '2019-10-24 11:10:08', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(232, 138600, 0, 18, '2019-08-01', '2020-12-01', 18, 7700, 7700, 0, 23100, NULL, NULL, 12, '2019-10-24 11:10:08', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(233, 138600, 0, 18, '2019-08-01', '2021-01-01', 19, 7700, 7700, 0, 15400, NULL, NULL, 12, '2019-10-24 11:10:08', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(234, 138600, 0, 18, '2019-08-01', '2021-02-01', 20, 7700, 7700, 0, 7700, NULL, NULL, 12, '2019-10-24 11:10:08', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(235, 138600, 0, 18, '2019-08-01', '2021-03-01', 21, 7700, 7700, 0, 0, NULL, NULL, 12, '2019-10-24 11:10:08', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(236, 65700, 0, 3, '2019-08-01', '2019-06-24', 1, 21900, 21900, 0, 197100, NULL, NULL, 13, '2019-10-24 11:20:33', '2019-10-24 11:22:11', 'Y', 3, 3, 1, 'ADV', 10, 0, 0, NULL, 'Y'),
(237, 65700, 0, 3, '2019-08-01', '2019-08-01', 2, 21900, 21900, 0, 175200, NULL, NULL, 13, '2019-10-24 11:20:33', '2019-10-24 11:22:43', 'Y', 3, 3, 1, 'ADV', 10, 0, 0, NULL, 'Y'),
(238, 65700, 0, 3, '2019-08-01', '2019-09-01', 3, 21900, 21900, 0, 153300, NULL, NULL, 13, '2019-10-24 11:20:33', '2019-10-24 11:23:29', 'Y', 3, 3, 1, 'ADV', 10, 0, 0, NULL, 'Y'),
(239, 153300, 0, 15, '2019-08-01', '2019-10-01', 4, 10220, 10220, 0, 143080, NULL, NULL, 13, '2019-10-24 11:20:33', '2019-10-24 11:24:49', 'Y', 3, 3, 1, 'LOAN', 0, 0, 0, NULL, 'Y'),
(240, 153300, 0, 15, '2019-08-01', '2019-11-01', 5, 10220, 10220, 0, 132860, NULL, NULL, 13, '2019-10-24 11:20:33', '2019-11-01 12:51:03', 'Y', 3, 3, 1, 'LOAN', 0, 0, 0, NULL, 'Y'),
(241, 153300, 0, 15, '2019-08-01', '2019-12-01', 6, 10220, 10220, 0, 122640, NULL, NULL, 13, '2019-10-24 11:20:33', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(242, 153300, 0, 15, '2019-08-01', '2020-01-01', 7, 10220, 10220, 0, 112420, NULL, NULL, 13, '2019-10-24 11:20:33', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(243, 153300, 0, 15, '2019-08-01', '2020-02-01', 8, 10220, 10220, 0, 102200, NULL, NULL, 13, '2019-10-24 11:20:33', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(244, 153300, 0, 15, '2019-08-01', '2020-03-01', 9, 10220, 10220, 0, 91980, NULL, NULL, 13, '2019-10-24 11:20:33', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(245, 153300, 0, 15, '2019-08-01', '2020-04-01', 10, 10220, 10220, 0, 81760, NULL, NULL, 13, '2019-10-24 11:20:33', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(246, 153300, 0, 15, '2019-08-01', '2020-05-01', 11, 10220, 10220, 0, 71540, NULL, NULL, 13, '2019-10-24 11:20:33', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(247, 153300, 0, 15, '2019-08-01', '2020-06-01', 12, 10220, 10220, 0, 61320, NULL, NULL, 13, '2019-10-24 11:20:33', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(248, 153300, 0, 15, '2019-08-01', '2020-07-01', 13, 10220, 10220, 0, 51100, NULL, NULL, 13, '2019-10-24 11:20:33', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(249, 153300, 0, 15, '2019-08-01', '2020-08-01', 14, 10220, 10220, 0, 40880, NULL, NULL, 13, '2019-10-24 11:20:33', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(250, 153300, 0, 15, '2019-08-01', '2020-09-01', 15, 10220, 10220, 0, 30660, NULL, NULL, 13, '2019-10-24 11:20:33', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(251, 153300, 0, 15, '2019-08-01', '2020-10-01', 16, 10220, 10220, 0, 20440, NULL, NULL, 13, '2019-10-24 11:20:33', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(252, 153300, 0, 15, '2019-08-01', '2020-11-01', 17, 10220, 10220, 0, 10220, NULL, NULL, 13, '2019-10-24 11:20:33', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(253, 153300, 0, 15, '2019-08-01', '2020-12-01', 18, 10220, 10220, 0, 0, NULL, NULL, 13, '2019-10-24 11:20:33', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(254, 2000, 0, 1, '2019-09-01', '2019-07-23', 1, 2000, 2000, 0, 123000, NULL, NULL, 14, '2019-10-24 11:43:01', NULL, 'Y', 3, NULL, 1, 'BOOK', 0, 0, 0, NULL, 'Y'),
(255, 37500, 0, 3, '2019-09-01', '2019-07-30', 2, 10500, 10500, 0, 112500, NULL, NULL, 14, '2019-10-24 11:43:01', '2019-10-24 11:47:08', 'Y', 3, 3, 1, 'ADV', 10, 0, 0, NULL, 'Y'),
(256, 37500, 0, 3, '2019-09-01', '2019-09-01', 3, 12500, 12500, 0, 100000, NULL, NULL, 14, '2019-10-24 11:43:01', '2019-10-24 11:47:45', 'Y', 3, 3, 1, 'ADV', 10, 0, 0, NULL, 'Y'),
(257, 37500, 0, 3, '2019-09-01', '2019-10-01', 4, 12500, 12500, 0, 87500, NULL, NULL, 14, '2019-10-24 11:43:01', '2019-10-24 11:48:33', 'Y', 3, 3, 1, 'ADV', 10, 0, 0, NULL, 'Y'),
(258, 87500, 0, 1, '2019-09-01', '2019-11-01', 5, 87500, 87500, 0, 0, NULL, NULL, 14, '2019-10-24 11:43:01', NULL, 'Y', 3, NULL, 1, 'LEFT', 70, 0, 0, NULL, 'N'),
(259, 135000, 0, 1, '2019-07-25', '2019-07-25', 1, 124200, 124200, 0, 0, NULL, NULL, 15, '2019-10-24 11:59:51', '2019-10-24 12:03:00', 'Y', 3, 3, 1, 'ADV', 100, 10800, 8, NULL, 'Y'),
(260, 2000, 0, 1, '2019-09-01', '2019-07-25', 1, 2000, 2000, 0, 113000, NULL, NULL, 16, '2019-10-24 12:12:49', NULL, 'Y', 3, NULL, 1, 'BOOK', 0, 0, 0, NULL, 'Y'),
(261, 34500, 0, 3, '2019-09-01', '2019-08-01', 2, 9500, 9500, 0, 103500, NULL, NULL, 16, '2019-10-24 12:12:49', '2019-10-24 12:14:45', 'Y', 3, 3, 1, 'ADV', 10, 0, 0, NULL, 'Y'),
(262, 34500, 0, 3, '2019-09-01', '2019-09-01', 3, 11500, 11500, 0, 92000, NULL, NULL, 16, '2019-10-24 12:12:49', '2019-10-24 12:15:47', 'Y', 3, 3, 1, 'ADV', 10, 0, 0, NULL, 'Y'),
(263, 34500, 0, 3, '2019-09-01', '2019-10-01', 4, 11500, 11500, 0, 80500, NULL, NULL, 16, '2019-10-24 12:12:49', '2019-10-24 12:17:41', 'Y', 3, 3, 1, 'ADV', 10, 0, 0, NULL, 'Y'),
(264, 80500, 0, 15, '2019-09-01', '2019-11-01', 5, 5366.67, 5366.67, 0, 75133.33, NULL, NULL, 16, '2019-10-24 12:12:49', '2019-11-05 14:53:36', 'Y', 3, 3, 1, 'LOAN', 0, 0, 0, NULL, 'Y'),
(265, 80500, 0, 15, '2019-09-01', '2019-12-01', 6, 5366.67, 5366.67, 0, 69766.66, NULL, NULL, 16, '2019-10-24 12:12:49', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(266, 80500, 0, 15, '2019-09-01', '2020-01-01', 7, 5366.67, 5366.67, 0, 64399.99, NULL, NULL, 16, '2019-10-24 12:12:49', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(267, 80500, 0, 15, '2019-09-01', '2020-02-01', 8, 5366.67, 5366.67, 0, 59033.32, NULL, NULL, 16, '2019-10-24 12:12:49', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(268, 80500, 0, 15, '2019-09-01', '2020-03-01', 9, 5366.67, 5366.67, 0, 53666.65, NULL, NULL, 16, '2019-10-24 12:12:49', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(269, 80500, 0, 15, '2019-09-01', '2020-04-01', 10, 5366.67, 5366.67, 0, 48299.98, NULL, NULL, 16, '2019-10-24 12:12:49', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(270, 80500, 0, 15, '2019-09-01', '2020-05-01', 11, 5366.67, 5366.67, 0, 42933.31, NULL, NULL, 16, '2019-10-24 12:12:49', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(271, 80500, 0, 15, '2019-09-01', '2020-06-01', 12, 5366.67, 5366.67, 0, 37566.64, NULL, NULL, 16, '2019-10-24 12:12:49', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(272, 80500, 0, 15, '2019-09-01', '2020-07-01', 13, 5366.67, 5366.67, 0, 32199.97, NULL, NULL, 16, '2019-10-24 12:12:49', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(273, 80500, 0, 15, '2019-09-01', '2020-08-01', 14, 5366.67, 5366.67, 0, 26833.3, NULL, NULL, 16, '2019-10-24 12:12:49', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(274, 80500, 0, 15, '2019-09-01', '2020-09-01', 15, 5366.67, 5366.67, 0, 21466.63, NULL, NULL, 16, '2019-10-24 12:12:49', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(275, 80500, 0, 15, '2019-09-01', '2020-10-01', 16, 5366.67, 5366.67, 0, 16099.96, NULL, NULL, 16, '2019-10-24 12:12:49', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(276, 80500, 0, 15, '2019-09-01', '2020-11-01', 17, 5366.67, 5366.67, 0, 10733.29, NULL, NULL, 16, '2019-10-24 12:12:49', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(277, 80500, 0, 15, '2019-09-01', '2020-12-01', 18, 5366.67, 5366.67, 0, 5366.62, NULL, NULL, 16, '2019-10-24 12:12:49', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(278, 80500, 0, 15, '2019-09-01', '2021-01-01', 19, 5366.67, 5366.67, 0, 0, NULL, NULL, 16, '2019-10-24 12:12:49', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(279, 2000, 0, 1, '2019-09-01', '2019-07-31', 1, 2000, 2000, 0, 123000, NULL, NULL, 17, '2019-10-24 14:52:59', NULL, 'Y', 3, NULL, 1, 'BOOK', 0, 0, 0, NULL, 'Y'),
(280, 37500, 0, 3, '2019-09-01', '2019-08-07', 2, 10500, 10500, 0, 112500, NULL, NULL, 17, '2019-10-24 14:52:59', '2019-10-24 14:55:22', 'Y', 3, 3, 1, 'ADV', 10, 0, 0, NULL, 'Y'),
(281, 37500, 0, 3, '2019-09-01', '2019-09-01', 3, 12500, 12500, 0, 100000, NULL, NULL, 17, '2019-10-24 14:52:59', '2019-10-24 14:56:11', 'Y', 3, 3, 1, 'ADV', 10, 0, 0, NULL, 'Y'),
(282, 37500, 0, 3, '2019-09-01', '2019-10-01', 4, 12500, 12500, 0, 87500, NULL, NULL, 17, '2019-10-24 14:52:59', '2019-10-24 14:57:25', 'Y', 3, 3, 1, 'ADV', 10, 0, 0, NULL, 'Y'),
(283, 87500, 0, 15, '2019-09-01', '2019-11-01', 5, 5833.33, 5833.33, 0, 81666.67, NULL, NULL, 17, '2019-10-24 14:52:59', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(284, 87500, 0, 15, '2019-09-01', '2019-12-01', 6, 5833.33, 5833.33, 0, 75833.34, NULL, NULL, 17, '2019-10-24 14:52:59', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(285, 87500, 0, 15, '2019-09-01', '2020-01-01', 7, 5833.33, 5833.33, 0, 70000.01, NULL, NULL, 17, '2019-10-24 14:52:59', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(286, 87500, 0, 15, '2019-09-01', '2020-02-01', 8, 5833.33, 5833.33, 0, 64166.68, NULL, NULL, 17, '2019-10-24 14:52:59', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(287, 87500, 0, 15, '2019-09-01', '2020-03-01', 9, 5833.33, 5833.33, 0, 58333.35, NULL, NULL, 17, '2019-10-24 14:52:59', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(288, 87500, 0, 15, '2019-09-01', '2020-04-01', 10, 5833.33, 5833.33, 0, 52500.02, NULL, NULL, 17, '2019-10-24 14:52:59', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(289, 87500, 0, 15, '2019-09-01', '2020-05-01', 11, 5833.33, 5833.33, 0, 46666.69, NULL, NULL, 17, '2019-10-24 14:52:59', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(290, 87500, 0, 15, '2019-09-01', '2020-06-01', 12, 5833.33, 5833.33, 0, 40833.36, NULL, NULL, 17, '2019-10-24 14:52:59', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(291, 87500, 0, 15, '2019-09-01', '2020-07-01', 13, 5833.33, 5833.33, 0, 35000.03, NULL, NULL, 17, '2019-10-24 14:52:59', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(292, 87500, 0, 15, '2019-09-01', '2020-08-01', 14, 5833.33, 5833.33, 0, 29166.7, NULL, NULL, 17, '2019-10-24 14:52:59', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(293, 87500, 0, 15, '2019-09-01', '2020-09-01', 15, 5833.33, 5833.33, 0, 23333.37, NULL, NULL, 17, '2019-10-24 14:52:59', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(294, 87500, 0, 15, '2019-09-01', '2020-10-01', 16, 5833.33, 5833.33, 0, 17500.04, NULL, NULL, 17, '2019-10-24 14:52:59', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(295, 87500, 0, 15, '2019-09-01', '2020-11-01', 17, 5833.33, 5833.33, 0, 11666.71, NULL, NULL, 17, '2019-10-24 14:52:59', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(296, 87500, 0, 15, '2019-09-01', '2020-12-01', 18, 5833.33, 5833.33, 0, 5833.38, NULL, NULL, 17, '2019-10-24 14:52:59', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(297, 87500, 0, 15, '2019-09-01', '2021-01-01', 19, 5833.33, 5833.33, 0, 0, NULL, NULL, 17, '2019-10-24 14:52:59', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(298, 34500, 0, 1, '2019-09-01', '2019-08-05', 1, 34500, 34500, 0, 80500, NULL, NULL, 18, '2019-10-24 15:07:13', '2019-10-24 15:09:02', 'Y', 3, 3, 1, 'ADV', 30, 0, 0, NULL, 'Y');
INSERT INTO `tbl_installment` (`inst_id`, `inst_loan_amount`, `inst_interest_rate`, `inst_period_month`, `inst_first_installment_date`, `inst_date`, `inst_num`, `inst_amt_pay`, `inst_amt_principle`, `inst_amt_interest`, `inst_amt_balance`, `inst_amt_penalty`, `inst_cancel_yn`, `sell_id`, `regDt`, `upDt`, `useYn`, `regUsr`, `upUsr`, `com_id`, `inst_type`, `inst_pay_per`, `inst_dis_amt`, `inst_dis_per`, `inst_loan_amount_per`, `inst_paid_yn`) VALUES
(299, 80500, 0, 17, '2019-09-01', '2019-09-01', 2, 4735.29, 4735.29, 0, 75764.71, NULL, NULL, 18, '2019-10-24 15:07:13', '2019-10-24 15:11:14', 'Y', 3, 3, 1, 'LOAN', 0, 0, 0, NULL, 'Y'),
(300, 80500, 0, 17, '2019-09-01', '2019-10-01', 3, 4735.29, 4735.29, 0, 71029.42, NULL, NULL, 18, '2019-10-24 15:07:13', '2019-10-24 15:13:23', 'Y', 3, 3, 1, 'LOAN', 0, 0, 0, NULL, 'Y'),
(301, 80500, 0, 17, '2019-09-01', '2019-11-01', 4, 4735.29, 4735.29, 0, 66294.13, NULL, NULL, 18, '2019-10-24 15:07:13', '2019-11-05 14:54:41', 'Y', 3, 3, 1, 'LOAN', 0, 0, 0, NULL, 'Y'),
(302, 80500, 0, 17, '2019-09-01', '2019-12-01', 5, 4735.29, 4735.29, 0, 61558.84, NULL, NULL, 18, '2019-10-24 15:07:13', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(303, 80500, 0, 17, '2019-09-01', '2020-01-01', 6, 4735.29, 4735.29, 0, 56823.55, NULL, NULL, 18, '2019-10-24 15:07:13', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(304, 80500, 0, 17, '2019-09-01', '2020-02-01', 7, 4735.29, 4735.29, 0, 52088.26, NULL, NULL, 18, '2019-10-24 15:07:13', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(305, 80500, 0, 17, '2019-09-01', '2020-03-01', 8, 4735.29, 4735.29, 0, 47352.97, NULL, NULL, 18, '2019-10-24 15:07:13', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(306, 80500, 0, 17, '2019-09-01', '2020-04-01', 9, 4735.29, 4735.29, 0, 42617.68, NULL, NULL, 18, '2019-10-24 15:07:13', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(307, 80500, 0, 17, '2019-09-01', '2020-05-01', 10, 4735.29, 4735.29, 0, 37882.39, NULL, NULL, 18, '2019-10-24 15:07:13', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(308, 80500, 0, 17, '2019-09-01', '2020-06-01', 11, 4735.29, 4735.29, 0, 33147.1, NULL, NULL, 18, '2019-10-24 15:07:13', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(309, 80500, 0, 17, '2019-09-01', '2020-07-01', 12, 4735.29, 4735.29, 0, 28411.81, NULL, NULL, 18, '2019-10-24 15:07:13', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(310, 80500, 0, 17, '2019-09-01', '2020-08-01', 13, 4735.29, 4735.29, 0, 23676.52, NULL, NULL, 18, '2019-10-24 15:07:13', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(311, 80500, 0, 17, '2019-09-01', '2020-09-01', 14, 4735.29, 4735.29, 0, 18941.23, NULL, NULL, 18, '2019-10-24 15:07:13', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(312, 80500, 0, 17, '2019-09-01', '2020-10-01', 15, 4735.29, 4735.29, 0, 14205.94, NULL, NULL, 18, '2019-10-24 15:07:13', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(313, 80500, 0, 17, '2019-09-01', '2020-11-01', 16, 4735.29, 4735.29, 0, 9470.65, NULL, NULL, 18, '2019-10-24 15:07:13', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(314, 80500, 0, 17, '2019-09-01', '2020-12-01', 17, 4735.29, 4735.29, 0, 4735.36, NULL, NULL, 18, '2019-10-24 15:07:13', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(315, 80500, 0, 17, '2019-09-01', '2021-01-01', 18, 4735.29, 4735.29, 0, 0, NULL, NULL, 18, '2019-10-24 15:07:13', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(316, 2000, 0, 1, '2019-11-01', '2019-10-03', 1, 2000, 2000, 0, 133000, NULL, NULL, 19, '2019-10-24 15:27:27', NULL, 'Y', 3, NULL, 1, 'BOOK', 0, 0, 0, NULL, 'Y'),
(317, 40500, 0, 6, '2019-11-01', '2019-10-05', 2, 4750, 4750, 0, 128250, NULL, NULL, 19, '2019-10-24 15:27:27', '2019-10-24 15:44:59', 'Y', 3, 3, 1, 'ADV', 5, 0, 0, NULL, 'Y'),
(318, 40500, 0, 6, '2019-11-01', '2019-11-01', 3, 6750, 6750, 0, 121500, NULL, NULL, 19, '2019-10-24 15:27:27', '2019-10-24 15:50:43', 'Y', 3, 3, 1, 'ADV', 5, 0, 0, NULL, 'Y'),
(319, 40500, 0, 6, '2019-11-01', '2019-12-01', 4, 6750, 6750, 0, 114750, NULL, NULL, 19, '2019-10-24 15:27:27', '2019-10-24 15:57:07', 'Y', 3, 3, 1, 'ADV', 5, 0, 0, NULL, 'Y'),
(320, 40500, 0, 6, '2019-11-01', '2020-01-01', 5, 6750, 6750, 0, 108000, NULL, NULL, 19, '2019-10-24 15:27:27', NULL, 'Y', 3, NULL, 1, 'ADV', 5, 0, 0, NULL, 'N'),
(321, 40500, 0, 6, '2019-11-01', '2020-02-01', 6, 6750, 6750, 0, 101250, NULL, NULL, 19, '2019-10-24 15:27:27', NULL, 'Y', 3, NULL, 1, 'ADV', 5, 0, 0, NULL, 'N'),
(322, 40500, 0, 6, '2019-11-01', '2020-03-01', 7, 6750, 6750, 0, 94500, NULL, NULL, 19, '2019-10-24 15:27:27', NULL, 'Y', 3, NULL, 1, 'ADV', 5, 0, 0, NULL, 'N'),
(323, 94500, 0, 21, '2019-11-01', '2020-04-01', 8, 4500, 4500, 0, 90000, NULL, NULL, 19, '2019-10-24 15:27:27', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(324, 94500, 0, 21, '2019-11-01', '2020-05-01', 9, 4500, 4500, 0, 85500, NULL, NULL, 19, '2019-10-24 15:27:27', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(325, 94500, 0, 21, '2019-11-01', '2020-06-01', 10, 4500, 4500, 0, 81000, NULL, NULL, 19, '2019-10-24 15:27:27', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(326, 94500, 0, 21, '2019-11-01', '2020-07-01', 11, 4500, 4500, 0, 76500, NULL, NULL, 19, '2019-10-24 15:27:27', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(327, 94500, 0, 21, '2019-11-01', '2020-08-01', 12, 4500, 4500, 0, 72000, NULL, NULL, 19, '2019-10-24 15:27:27', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(328, 94500, 0, 21, '2019-11-01', '2020-09-01', 13, 4500, 4500, 0, 67500, NULL, NULL, 19, '2019-10-24 15:27:27', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(329, 94500, 0, 21, '2019-11-01', '2020-10-01', 14, 4500, 4500, 0, 63000, NULL, NULL, 19, '2019-10-24 15:27:27', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(330, 94500, 0, 21, '2019-11-01', '2020-11-01', 15, 4500, 4500, 0, 58500, NULL, NULL, 19, '2019-10-24 15:27:27', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(331, 94500, 0, 21, '2019-11-01', '2020-12-01', 16, 4500, 4500, 0, 54000, NULL, NULL, 19, '2019-10-24 15:27:27', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(332, 94500, 0, 21, '2019-11-01', '2021-01-01', 17, 4500, 4500, 0, 49500, NULL, NULL, 19, '2019-10-24 15:27:27', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(333, 94500, 0, 21, '2019-11-01', '2021-02-01', 18, 4500, 4500, 0, 45000, NULL, NULL, 19, '2019-10-24 15:27:27', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(334, 94500, 0, 21, '2019-11-01', '2021-03-01', 19, 4500, 4500, 0, 40500, NULL, NULL, 19, '2019-10-24 15:27:27', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(335, 94500, 0, 21, '2019-11-01', '2021-04-01', 20, 4500, 4500, 0, 36000, NULL, NULL, 19, '2019-10-24 15:27:27', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(336, 94500, 0, 21, '2019-11-01', '2021-05-01', 21, 4500, 4500, 0, 31500, NULL, NULL, 19, '2019-10-24 15:27:27', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(337, 94500, 0, 21, '2019-11-01', '2021-06-01', 22, 4500, 4500, 0, 27000, NULL, NULL, 19, '2019-10-24 15:27:27', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(338, 94500, 0, 21, '2019-11-01', '2021-07-01', 23, 4500, 4500, 0, 22500, NULL, NULL, 19, '2019-10-24 15:27:27', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(339, 94500, 0, 21, '2019-11-01', '2021-08-01', 24, 4500, 4500, 0, 18000, NULL, NULL, 19, '2019-10-24 15:27:27', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(340, 94500, 0, 21, '2019-11-01', '2021-09-01', 25, 4500, 4500, 0, 13500, NULL, NULL, 19, '2019-10-24 15:27:27', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(341, 94500, 0, 21, '2019-11-01', '2021-10-01', 26, 4500, 4500, 0, 9000, NULL, NULL, 19, '2019-10-24 15:27:27', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(342, 94500, 0, 21, '2019-11-01', '2021-11-01', 27, 4500, 4500, 0, 4500, NULL, NULL, 19, '2019-10-24 15:27:27', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(343, 94500, 0, 21, '2019-11-01', '2021-12-01', 28, 4500, 4500, 0, 0, NULL, NULL, 19, '2019-10-24 15:27:27', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(344, 2000, 0, 1, '2019-11-01', '2019-09-06', 1, 2000, 2000, 0, 133000, NULL, NULL, 20, '2019-10-28 15:25:33', NULL, 'Y', 3, NULL, 1, 'BOOK', 0, 0, 0, NULL, 'Y'),
(345, 67500, 0, 1, '2019-11-01', '2019-10-11', 2, 62800, 62800, 0, 67500, NULL, NULL, 20, '2019-10-28 15:25:33', '2019-10-28 15:29:12', 'Y', 3, 3, 1, 'ADV', 50, 2700, 4, NULL, 'Y'),
(346, 67500, 0, 17, '2019-11-01', '2019-11-01', 3, 3970.59, 3970.59, 0, 63529.41, NULL, NULL, 20, '2019-10-28 15:25:33', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(347, 67500, 0, 17, '2019-11-01', '2019-12-01', 4, 3970.59, 3970.59, 0, 59558.82, NULL, NULL, 20, '2019-10-28 15:25:33', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(348, 67500, 0, 17, '2019-11-01', '2020-01-01', 5, 3970.59, 3970.59, 0, 55588.23, NULL, NULL, 20, '2019-10-28 15:25:33', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(349, 67500, 0, 17, '2019-11-01', '2020-02-01', 6, 3970.59, 3970.59, 0, 51617.64, NULL, NULL, 20, '2019-10-28 15:25:33', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(350, 67500, 0, 17, '2019-11-01', '2020-03-01', 7, 3970.59, 3970.59, 0, 47647.05, NULL, NULL, 20, '2019-10-28 15:25:33', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(351, 67500, 0, 17, '2019-11-01', '2020-04-01', 8, 3970.59, 3970.59, 0, 43676.46, NULL, NULL, 20, '2019-10-28 15:25:33', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(352, 67500, 0, 17, '2019-11-01', '2020-05-01', 9, 3970.59, 3970.59, 0, 39705.87, NULL, NULL, 20, '2019-10-28 15:25:33', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(353, 67500, 0, 17, '2019-11-01', '2020-06-01', 10, 3970.59, 3970.59, 0, 35735.28, NULL, NULL, 20, '2019-10-28 15:25:33', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(354, 67500, 0, 17, '2019-11-01', '2020-07-01', 11, 3970.59, 3970.59, 0, 31764.69, NULL, NULL, 20, '2019-10-28 15:25:33', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(355, 67500, 0, 17, '2019-11-01', '2020-08-01', 12, 3970.59, 3970.59, 0, 27794.1, NULL, NULL, 20, '2019-10-28 15:25:33', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(356, 67500, 0, 17, '2019-11-01', '2020-09-01', 13, 3970.59, 3970.59, 0, 23823.51, NULL, NULL, 20, '2019-10-28 15:25:33', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(357, 67500, 0, 17, '2019-11-01', '2020-10-01', 14, 3970.59, 3970.59, 0, 19852.92, NULL, NULL, 20, '2019-10-28 15:25:33', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(358, 67500, 0, 17, '2019-11-01', '2020-11-01', 15, 3970.59, 3970.59, 0, 15882.33, NULL, NULL, 20, '2019-10-28 15:25:33', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(359, 67500, 0, 17, '2019-11-01', '2020-12-01', 16, 3970.59, 3970.59, 0, 11911.74, NULL, NULL, 20, '2019-10-28 15:25:33', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(360, 67500, 0, 17, '2019-11-01', '2021-01-01', 17, 3970.59, 3970.59, 0, 7941.15, NULL, NULL, 20, '2019-10-28 15:25:33', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(361, 67500, 0, 17, '2019-11-01', '2021-02-01', 18, 3970.59, 3970.59, 0, 3970.56, NULL, NULL, 20, '2019-10-28 15:25:33', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(362, 67500, 0, 17, '2019-11-01', '2021-03-01', 19, 3970.59, 3970.59, 0, 0, NULL, NULL, 20, '2019-10-28 15:25:33', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(363, 36000, 0, 3, '2019-11-01', '2019-10-01', 1, 12000, 12000, 0, 108000, NULL, NULL, 21, '2019-10-28 15:40:02', '2019-10-29 15:27:04', 'Y', 3, 3, 1, 'ADV', 10, 0, 0, NULL, 'Y'),
(364, 36000, 0, 3, '2019-11-01', '2019-11-01', 2, 12000, 12000, 0, 96000, NULL, NULL, 21, '2019-10-28 15:40:02', '2019-11-01 12:45:21', 'Y', 3, 3, 1, 'ADV', 10, 0, 0, NULL, 'Y'),
(365, 36000, 0, 3, '2019-11-01', '2019-12-01', 3, 12000, 12000, 0, 84000, NULL, NULL, 21, '2019-10-28 15:40:02', NULL, 'Y', 3, NULL, 1, 'ADV', 10, 0, 0, NULL, 'N'),
(366, 84000, 0, 18, '2019-11-01', '2020-01-01', 4, 4666.67, 4666.67, 0, 79333.33, NULL, NULL, 21, '2019-10-28 15:40:02', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(367, 84000, 0, 18, '2019-11-01', '2020-02-01', 5, 4666.67, 4666.67, 0, 74666.66, NULL, NULL, 21, '2019-10-28 15:40:02', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(368, 84000, 0, 18, '2019-11-01', '2020-03-01', 6, 4666.67, 4666.67, 0, 69999.99, NULL, NULL, 21, '2019-10-28 15:40:02', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(369, 84000, 0, 18, '2019-11-01', '2020-04-01', 7, 4666.67, 4666.67, 0, 65333.32, NULL, NULL, 21, '2019-10-28 15:40:02', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(370, 84000, 0, 18, '2019-11-01', '2020-05-01', 8, 4666.67, 4666.67, 0, 60666.65, NULL, NULL, 21, '2019-10-28 15:40:02', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(371, 84000, 0, 18, '2019-11-01', '2020-06-01', 9, 4666.67, 4666.67, 0, 55999.98, NULL, NULL, 21, '2019-10-28 15:40:02', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(372, 84000, 0, 18, '2019-11-01', '2020-07-01', 10, 4666.67, 4666.67, 0, 51333.31, NULL, NULL, 21, '2019-10-28 15:40:02', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(373, 84000, 0, 18, '2019-11-01', '2020-08-01', 11, 4666.67, 4666.67, 0, 46666.64, NULL, NULL, 21, '2019-10-28 15:40:02', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(374, 84000, 0, 18, '2019-11-01', '2020-09-01', 12, 4666.67, 4666.67, 0, 41999.97, NULL, NULL, 21, '2019-10-28 15:40:02', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(375, 84000, 0, 18, '2019-11-01', '2020-10-01', 13, 4666.67, 4666.67, 0, 37333.3, NULL, NULL, 21, '2019-10-28 15:40:02', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(376, 84000, 0, 18, '2019-11-01', '2020-11-01', 14, 4666.67, 4666.67, 0, 32666.63, NULL, NULL, 21, '2019-10-28 15:40:02', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(377, 84000, 0, 18, '2019-11-01', '2020-12-01', 15, 4666.67, 4666.67, 0, 27999.96, NULL, NULL, 21, '2019-10-28 15:40:02', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(378, 84000, 0, 18, '2019-11-01', '2021-01-01', 16, 4666.67, 4666.67, 0, 23333.29, NULL, NULL, 21, '2019-10-28 15:40:02', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(379, 84000, 0, 18, '2019-11-01', '2021-02-01', 17, 4666.67, 4666.67, 0, 18666.62, NULL, NULL, 21, '2019-10-28 15:40:02', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(380, 84000, 0, 18, '2019-11-01', '2021-03-01', 18, 4666.67, 4666.67, 0, 13999.95, NULL, NULL, 21, '2019-10-28 15:40:02', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(381, 84000, 0, 18, '2019-11-01', '2021-04-01', 19, 4666.67, 4666.67, 0, 9333.28, NULL, NULL, 21, '2019-10-28 15:40:02', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(382, 84000, 0, 18, '2019-11-01', '2021-05-01', 20, 4666.67, 4666.67, 0, 4666.61, NULL, NULL, 21, '2019-10-28 15:40:02', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(383, 84000, 0, 18, '2019-11-01', '2021-06-01', 21, 4666.67, 4666.67, 0, 0, NULL, NULL, 21, '2019-10-28 15:40:02', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(384, 36000, 0, 3, '2019-11-01', '2019-10-01', 1, 12000, 12000, 0, 108000, NULL, NULL, 22, '2019-10-28 15:53:55', '2019-10-29 15:27:33', 'Y', 3, 3, 1, 'ADV', 10, 0, 0, NULL, 'Y'),
(385, 36000, 0, 3, '2019-11-01', '2019-11-01', 2, 12000, 12000, 0, 96000, NULL, NULL, 22, '2019-10-28 15:53:55', '2019-11-01 12:47:52', 'Y', 3, 3, 1, 'ADV', 10, 0, 0, NULL, 'Y'),
(386, 36000, 0, 3, '2019-11-01', '2019-12-01', 3, 12000, 12000, 0, 84000, NULL, NULL, 22, '2019-10-28 15:53:55', NULL, 'Y', 3, NULL, 1, 'ADV', 10, 0, 0, NULL, 'N'),
(387, 84000, 0, 18, '2019-11-01', '2020-01-01', 4, 4666.67, 4666.67, 0, 79333.33, NULL, NULL, 22, '2019-10-28 15:53:55', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(388, 84000, 0, 18, '2019-11-01', '2020-02-01', 5, 4666.67, 4666.67, 0, 74666.66, NULL, NULL, 22, '2019-10-28 15:53:55', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(389, 84000, 0, 18, '2019-11-01', '2020-03-01', 6, 4666.67, 4666.67, 0, 69999.99, NULL, NULL, 22, '2019-10-28 15:53:55', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(390, 84000, 0, 18, '2019-11-01', '2020-04-01', 7, 4666.67, 4666.67, 0, 65333.32, NULL, NULL, 22, '2019-10-28 15:53:55', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(391, 84000, 0, 18, '2019-11-01', '2020-05-01', 8, 4666.67, 4666.67, 0, 60666.65, NULL, NULL, 22, '2019-10-28 15:53:55', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(392, 84000, 0, 18, '2019-11-01', '2020-06-01', 9, 4666.67, 4666.67, 0, 55999.98, NULL, NULL, 22, '2019-10-28 15:53:55', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(393, 84000, 0, 18, '2019-11-01', '2020-07-01', 10, 4666.67, 4666.67, 0, 51333.31, NULL, NULL, 22, '2019-10-28 15:53:55', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(394, 84000, 0, 18, '2019-11-01', '2020-08-01', 11, 4666.67, 4666.67, 0, 46666.64, NULL, NULL, 22, '2019-10-28 15:53:55', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(395, 84000, 0, 18, '2019-11-01', '2020-09-01', 12, 4666.67, 4666.67, 0, 41999.97, NULL, NULL, 22, '2019-10-28 15:53:55', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(396, 84000, 0, 18, '2019-11-01', '2020-10-01', 13, 4666.67, 4666.67, 0, 37333.3, NULL, NULL, 22, '2019-10-28 15:53:55', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(397, 84000, 0, 18, '2019-11-01', '2020-11-01', 14, 4666.67, 4666.67, 0, 32666.63, NULL, NULL, 22, '2019-10-28 15:53:55', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(398, 84000, 0, 18, '2019-11-01', '2020-12-01', 15, 4666.67, 4666.67, 0, 27999.96, NULL, NULL, 22, '2019-10-28 15:53:55', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(399, 84000, 0, 18, '2019-11-01', '2021-01-01', 16, 4666.67, 4666.67, 0, 23333.29, NULL, NULL, 22, '2019-10-28 15:53:55', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(400, 84000, 0, 18, '2019-11-01', '2021-02-01', 17, 4666.67, 4666.67, 0, 18666.62, NULL, NULL, 22, '2019-10-28 15:53:55', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(401, 84000, 0, 18, '2019-11-01', '2021-03-01', 18, 4666.67, 4666.67, 0, 13999.95, NULL, NULL, 22, '2019-10-28 15:53:55', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(402, 84000, 0, 18, '2019-11-01', '2021-04-01', 19, 4666.67, 4666.67, 0, 9333.28, NULL, NULL, 22, '2019-10-28 15:53:55', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(403, 84000, 0, 18, '2019-11-01', '2021-05-01', 20, 4666.67, 4666.67, 0, 4666.61, NULL, NULL, 22, '2019-10-28 15:53:55', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(404, 84000, 0, 18, '2019-11-01', '2021-06-01', 21, 4666.67, 4666.67, 0, 0, NULL, NULL, 22, '2019-10-28 15:53:55', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(405, 2000, 0, 1, '2019-07-08', '2019-07-01', 1, 2000, 2000, 0, 128000, NULL, NULL, 23, '2019-10-28 16:08:43', NULL, 'Y', 3, NULL, 1, 'BOOK', 0, 0, 0, NULL, 'Y'),
(406, 26000, 0, 2, '2019-07-08', '2019-07-01', 2, 11000, 11000, 0, 117000, NULL, NULL, 23, '2019-10-28 16:08:43', NULL, 'Y', 3, NULL, 1, 'ADV', 10, 0, 0, NULL, 'N'),
(407, 26000, 0, 2, '2019-07-08', '2019-07-08', 3, 13000, 13000, 0, 104000, NULL, NULL, 23, '2019-10-28 16:08:43', NULL, 'Y', 3, NULL, 1, 'ADV', 10, 0, 0, NULL, 'N'),
(408, 104000, 0, 1, '2019-07-08', '2019-08-08', 4, 104000, 104000, 0, 0, NULL, NULL, 23, '2019-10-28 16:08:43', NULL, 'Y', 3, NULL, 1, 'LEFT', 80, 0, 0, NULL, 'N'),
(409, 2000, 0, 1, '2019-08-01', '2019-07-01', 1, 2000, 2000, 0, 128000, NULL, NULL, 24, '2019-10-28 16:14:32', NULL, 'Y', 3, NULL, 1, 'BOOK', 0, 0, 0, NULL, 'Y'),
(410, 26000, 0, 2, '2019-08-01', '2019-07-08', 2, 11000, 11000, 0, 117000, NULL, NULL, 24, '2019-10-28 16:14:32', '2019-10-28 16:15:43', 'Y', 3, 3, 1, 'ADV', 10, 0, 0, NULL, 'Y'),
(411, 26000, 0, 2, '2019-08-01', '2019-08-01', 3, 13000, 13000, 0, 104000, NULL, NULL, 24, '2019-10-28 16:14:32', '2019-10-28 16:16:34', 'Y', 3, 3, 1, 'ADV', 10, 0, 0, NULL, 'Y'),
(412, 104000, 0, 1, '2019-08-01', '2019-09-01', 4, 104000, 104000, 0, 0, NULL, NULL, 24, '2019-10-28 16:14:32', NULL, 'Y', 3, NULL, 1, 'LEFT', 80, 0, 0, NULL, 'N'),
(413, 2000, 0, 1, '2019-08-01', '2019-07-15', 1, 2000, 2000, 0, 127000, NULL, NULL, 25, '2019-10-28 16:33:40', NULL, 'Y', 3, NULL, 1, 'BOOK', 0, 0, 0, NULL, 'Y'),
(414, 38700, 0, 3, '2019-08-01', '2019-07-21', 2, 10900, 10900, 0, 116100, NULL, NULL, 25, '2019-10-28 16:33:40', '2019-10-28 16:40:01', 'Y', 3, 3, 1, 'ADV', 10, 0, 0, NULL, 'Y'),
(415, 38700, 0, 3, '2019-08-01', '2019-08-01', 3, 12900, 12900, 0, 103200, NULL, NULL, 25, '2019-10-28 16:33:40', '2019-10-28 16:40:49', 'Y', 3, 3, 1, 'ADV', 10, 0, 0, NULL, 'Y'),
(416, 38700, 0, 3, '2019-08-01', '2019-09-01', 4, 12900, 12900, 0, 90300, NULL, NULL, 25, '2019-10-28 16:33:40', '2019-10-28 16:42:34', 'Y', 3, 3, 1, 'ADV', 10, 0, 0, NULL, 'Y'),
(417, 90300, 0, 18, '2019-08-01', '2019-10-01', 5, 5016.67, 5016.67, 0, 85283.33, NULL, NULL, 25, '2019-10-28 16:33:40', '2019-10-29 15:25:30', 'Y', 3, 3, 1, 'LOAN', 0, 0, 0, NULL, 'Y'),
(418, 90300, 0, 18, '2019-08-01', '2019-11-01', 6, 5016.67, 5016.67, 0, 80266.66, NULL, NULL, 25, '2019-10-28 16:33:40', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(419, 90300, 0, 18, '2019-08-01', '2019-12-01', 7, 5016.67, 5016.67, 0, 75249.99, NULL, NULL, 25, '2019-10-28 16:33:40', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(420, 90300, 0, 18, '2019-08-01', '2020-01-01', 8, 5016.67, 5016.67, 0, 70233.32, NULL, NULL, 25, '2019-10-28 16:33:40', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(421, 90300, 0, 18, '2019-08-01', '2020-02-01', 9, 5016.67, 5016.67, 0, 65216.65, NULL, NULL, 25, '2019-10-28 16:33:40', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(422, 90300, 0, 18, '2019-08-01', '2020-03-01', 10, 5016.67, 5016.67, 0, 60199.98, NULL, NULL, 25, '2019-10-28 16:33:40', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(423, 90300, 0, 18, '2019-08-01', '2020-04-01', 11, 5016.67, 5016.67, 0, 55183.31, NULL, NULL, 25, '2019-10-28 16:33:40', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(424, 90300, 0, 18, '2019-08-01', '2020-05-01', 12, 5016.67, 5016.67, 0, 50166.64, NULL, NULL, 25, '2019-10-28 16:33:40', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(425, 90300, 0, 18, '2019-08-01', '2020-06-01', 13, 5016.67, 5016.67, 0, 45149.97, NULL, NULL, 25, '2019-10-28 16:33:40', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(426, 90300, 0, 18, '2019-08-01', '2020-07-01', 14, 5016.67, 5016.67, 0, 40133.3, NULL, NULL, 25, '2019-10-28 16:33:40', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(427, 90300, 0, 18, '2019-08-01', '2020-08-01', 15, 5016.67, 5016.67, 0, 35116.63, NULL, NULL, 25, '2019-10-28 16:33:40', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(428, 90300, 0, 18, '2019-08-01', '2020-09-01', 16, 5016.67, 5016.67, 0, 30099.96, NULL, NULL, 25, '2019-10-28 16:33:40', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(429, 90300, 0, 18, '2019-08-01', '2020-10-01', 17, 5016.67, 5016.67, 0, 25083.29, NULL, NULL, 25, '2019-10-28 16:33:40', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(430, 90300, 0, 18, '2019-08-01', '2020-11-01', 18, 5016.67, 5016.67, 0, 20066.62, NULL, NULL, 25, '2019-10-28 16:33:40', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(431, 90300, 0, 18, '2019-08-01', '2020-12-01', 19, 5016.67, 5016.67, 0, 15049.95, NULL, NULL, 25, '2019-10-28 16:33:40', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(432, 90300, 0, 18, '2019-08-01', '2021-01-01', 20, 5016.67, 5016.67, 0, 10033.28, NULL, NULL, 25, '2019-10-28 16:33:40', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(433, 90300, 0, 18, '2019-08-01', '2021-02-01', 21, 5016.67, 5016.67, 0, 5016.61, NULL, NULL, 25, '2019-10-28 16:33:40', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(434, 90300, 0, 18, '2019-08-01', '2021-03-01', 22, 5016.67, 5016.67, 0, 0, NULL, NULL, 25, '2019-10-28 16:33:40', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(435, 2000, 0, 1, '2019-08-15', '2019-07-15', 1, 2000, 2000, 0, 127000, NULL, NULL, 26, '2019-10-28 16:36:19', NULL, 'Y', 3, NULL, 1, 'BOOK', 0, 0, 0, NULL, 'Y'),
(436, 38700, 0, 3, '2019-08-15', '2019-07-21', 2, 10900, 10900, 0, 116100, NULL, NULL, 26, '2019-10-28 16:36:19', '2019-10-28 16:56:58', 'Y', 3, 3, 1, 'ADV', 10, 0, 0, NULL, 'Y'),
(437, 38700, 0, 3, '2019-08-15', '2019-08-15', 3, 12900, 12900, 0, 103200, NULL, NULL, 26, '2019-10-28 16:36:19', '2019-10-28 16:57:45', 'Y', 3, 3, 1, 'ADV', 10, 0, 0, NULL, 'Y'),
(438, 38700, 0, 3, '2019-08-15', '2019-09-15', 4, 12900, 12900, 0, 90300, NULL, NULL, 26, '2019-10-28 16:36:19', '2019-10-28 16:58:23', 'Y', 3, 3, 1, 'ADV', 10, 0, 0, NULL, 'Y'),
(439, 90300, 0, 18, '2019-08-15', '2019-10-15', 5, 5016.67, 5016.67, 0, 85283.33, NULL, NULL, 26, '2019-10-28 16:36:19', '2019-10-28 16:59:04', 'Y', 3, 3, 1, 'LOAN', 0, 0, 0, NULL, 'Y'),
(440, 90300, 0, 18, '2019-08-15', '2019-11-15', 6, 5016.67, 5016.67, 0, 80266.66, NULL, NULL, 26, '2019-10-28 16:36:19', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(441, 90300, 0, 18, '2019-08-15', '2019-12-15', 7, 5016.67, 5016.67, 0, 75249.99, NULL, NULL, 26, '2019-10-28 16:36:19', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(442, 90300, 0, 18, '2019-08-15', '2020-01-15', 8, 5016.67, 5016.67, 0, 70233.32, NULL, NULL, 26, '2019-10-28 16:36:19', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(443, 90300, 0, 18, '2019-08-15', '2020-02-15', 9, 5016.67, 5016.67, 0, 65216.65, NULL, NULL, 26, '2019-10-28 16:36:19', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(444, 90300, 0, 18, '2019-08-15', '2020-03-15', 10, 5016.67, 5016.67, 0, 60199.98, NULL, NULL, 26, '2019-10-28 16:36:19', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(445, 90300, 0, 18, '2019-08-15', '2020-04-15', 11, 5016.67, 5016.67, 0, 55183.31, NULL, NULL, 26, '2019-10-28 16:36:19', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(446, 90300, 0, 18, '2019-08-15', '2020-05-15', 12, 5016.67, 5016.67, 0, 50166.64, NULL, NULL, 26, '2019-10-28 16:36:19', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(447, 90300, 0, 18, '2019-08-15', '2020-06-15', 13, 5016.67, 5016.67, 0, 45149.97, NULL, NULL, 26, '2019-10-28 16:36:19', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(448, 90300, 0, 18, '2019-08-15', '2020-07-15', 14, 5016.67, 5016.67, 0, 40133.3, NULL, NULL, 26, '2019-10-28 16:36:19', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(449, 90300, 0, 18, '2019-08-15', '2020-08-15', 15, 5016.67, 5016.67, 0, 35116.63, NULL, NULL, 26, '2019-10-28 16:36:19', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(450, 90300, 0, 18, '2019-08-15', '2020-09-15', 16, 5016.67, 5016.67, 0, 30099.96, NULL, NULL, 26, '2019-10-28 16:36:19', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(451, 90300, 0, 18, '2019-08-15', '2020-10-15', 17, 5016.67, 5016.67, 0, 25083.29, NULL, NULL, 26, '2019-10-28 16:36:19', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(452, 90300, 0, 18, '2019-08-15', '2020-11-15', 18, 5016.67, 5016.67, 0, 20066.62, NULL, NULL, 26, '2019-10-28 16:36:19', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(453, 90300, 0, 18, '2019-08-15', '2020-12-15', 19, 5016.67, 5016.67, 0, 15049.95, NULL, NULL, 26, '2019-10-28 16:36:19', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(454, 90300, 0, 18, '2019-08-15', '2021-01-15', 20, 5016.67, 5016.67, 0, 10033.28, NULL, NULL, 26, '2019-10-28 16:36:19', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(455, 90300, 0, 18, '2019-08-15', '2021-02-15', 21, 5016.67, 5016.67, 0, 5016.61, NULL, NULL, 26, '2019-10-28 16:36:19', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(456, 90300, 0, 18, '2019-08-15', '2021-03-15', 22, 5016.67, 5016.67, 0, 0, NULL, NULL, 26, '2019-10-28 16:36:19', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(457, 2000, 0, 1, '2019-10-15', '2019-08-09', 1, 2000, 2000, 0, 127000, NULL, NULL, 27, '2019-10-29 11:42:25', NULL, 'Y', 3, NULL, 1, 'BOOK', 0, 0, 0, NULL, 'Y'),
(458, 38700, 0, 3, '2019-10-15', '2019-11-15', 2, 10900, 10900, 0, 116100, NULL, NULL, 27, '2019-10-29 11:42:25', '2019-10-29 12:07:52', 'Y', 3, 3, 1, 'ADV', 10, 0, 0, NULL, 'Y'),
(459, 38700, 0, 3, '2019-10-15', '2019-10-15', 3, 12900, 12900, 0, 103200, NULL, NULL, 27, '2019-10-29 11:42:25', '2019-10-29 12:08:27', 'Y', 3, 3, 1, 'ADV', 10, 0, 0, NULL, 'Y'),
(460, 38700, 0, 3, '2019-10-15', '2019-11-15', 4, 12900, 12900, 0, 90300, NULL, NULL, 27, '2019-10-29 11:42:25', NULL, 'Y', 3, NULL, 1, 'ADV', 10, 0, 0, NULL, 'N'),
(461, 90300, 0, 15, '2019-10-15', '2019-12-15', 5, 6020, 6020, 0, 84280, NULL, NULL, 27, '2019-10-29 11:42:25', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(462, 90300, 0, 15, '2019-10-15', '2020-01-15', 6, 6020, 6020, 0, 78260, NULL, NULL, 27, '2019-10-29 11:42:25', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(463, 90300, 0, 15, '2019-10-15', '2020-02-15', 7, 6020, 6020, 0, 72240, NULL, NULL, 27, '2019-10-29 11:42:25', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(464, 90300, 0, 15, '2019-10-15', '2020-03-15', 8, 6020, 6020, 0, 66220, NULL, NULL, 27, '2019-10-29 11:42:25', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(465, 90300, 0, 15, '2019-10-15', '2020-04-15', 9, 6020, 6020, 0, 60200, NULL, NULL, 27, '2019-10-29 11:42:25', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(466, 90300, 0, 15, '2019-10-15', '2020-05-15', 10, 6020, 6020, 0, 54180, NULL, NULL, 27, '2019-10-29 11:42:25', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(467, 90300, 0, 15, '2019-10-15', '2020-06-15', 11, 6020, 6020, 0, 48160, NULL, NULL, 27, '2019-10-29 11:42:25', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(468, 90300, 0, 15, '2019-10-15', '2020-07-15', 12, 6020, 6020, 0, 42140, NULL, NULL, 27, '2019-10-29 11:42:25', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(469, 90300, 0, 15, '2019-10-15', '2020-08-15', 13, 6020, 6020, 0, 36120, NULL, NULL, 27, '2019-10-29 11:42:25', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(470, 90300, 0, 15, '2019-10-15', '2020-09-15', 14, 6020, 6020, 0, 30100, NULL, NULL, 27, '2019-10-29 11:42:25', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(471, 90300, 0, 15, '2019-10-15', '2020-10-15', 15, 6020, 6020, 0, 24080, NULL, NULL, 27, '2019-10-29 11:42:25', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(472, 90300, 0, 15, '2019-10-15', '2020-11-15', 16, 6020, 6020, 0, 18060, NULL, NULL, 27, '2019-10-29 11:42:25', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(473, 90300, 0, 15, '2019-10-15', '2020-12-15', 17, 6020, 6020, 0, 12040, NULL, NULL, 27, '2019-10-29 11:42:25', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(474, 90300, 0, 15, '2019-10-15', '2021-01-15', 18, 6020, 6020, 0, 6020, NULL, NULL, 27, '2019-10-29 11:42:25', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(475, 90300, 0, 15, '2019-10-15', '2021-02-15', 19, 6020, 6020, 0, 0, NULL, NULL, 27, '2019-10-29 11:42:25', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(476, 2000, 0, 1, '2019-12-01', '2019-10-21', 1, 2000, 2000, 0, 127000, NULL, NULL, 28, '2019-11-06 16:01:40', NULL, 'Y', 3, NULL, 1, 'BOOK', 0, 0, 0, NULL, 'Y'),
(477, 64500, 0, 1, '2019-12-01', '2019-11-05', 2, 59920, 59920, 0, 64500, NULL, NULL, 28, '2019-11-06 16:01:40', NULL, 'Y', 3, NULL, 1, 'ADV', 50, 2580, 4, NULL, 'N'),
(478, 64500, 0, 20, '2019-12-01', '2019-12-01', 3, 3225, 3225, 0, 61275, NULL, NULL, 28, '2019-11-06 16:01:40', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(479, 64500, 0, 20, '2019-12-01', '2020-01-01', 4, 3225, 3225, 0, 58050, NULL, NULL, 28, '2019-11-06 16:01:40', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(480, 64500, 0, 20, '2019-12-01', '2020-02-01', 5, 3225, 3225, 0, 54825, NULL, NULL, 28, '2019-11-06 16:01:40', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(481, 64500, 0, 20, '2019-12-01', '2020-03-01', 6, 3225, 3225, 0, 51600, NULL, NULL, 28, '2019-11-06 16:01:40', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(482, 64500, 0, 20, '2019-12-01', '2020-04-01', 7, 3225, 3225, 0, 48375, NULL, NULL, 28, '2019-11-06 16:01:40', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(483, 64500, 0, 20, '2019-12-01', '2020-05-01', 8, 3225, 3225, 0, 45150, NULL, NULL, 28, '2019-11-06 16:01:40', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(484, 64500, 0, 20, '2019-12-01', '2020-06-01', 9, 3225, 3225, 0, 41925, NULL, NULL, 28, '2019-11-06 16:01:40', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(485, 64500, 0, 20, '2019-12-01', '2020-07-01', 10, 3225, 3225, 0, 38700, NULL, NULL, 28, '2019-11-06 16:01:40', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(486, 64500, 0, 20, '2019-12-01', '2020-08-01', 11, 3225, 3225, 0, 35475, NULL, NULL, 28, '2019-11-06 16:01:40', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(487, 64500, 0, 20, '2019-12-01', '2020-09-01', 12, 3225, 3225, 0, 32250, NULL, NULL, 28, '2019-11-06 16:01:40', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(488, 64500, 0, 20, '2019-12-01', '2020-10-01', 13, 3225, 3225, 0, 29025, NULL, NULL, 28, '2019-11-06 16:01:40', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(489, 64500, 0, 20, '2019-12-01', '2020-11-01', 14, 3225, 3225, 0, 25800, NULL, NULL, 28, '2019-11-06 16:01:40', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(490, 64500, 0, 20, '2019-12-01', '2020-12-01', 15, 3225, 3225, 0, 22575, NULL, NULL, 28, '2019-11-06 16:01:40', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(491, 64500, 0, 20, '2019-12-01', '2021-01-01', 16, 3225, 3225, 0, 19350, NULL, NULL, 28, '2019-11-06 16:01:40', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(492, 64500, 0, 20, '2019-12-01', '2021-02-01', 17, 3225, 3225, 0, 16125, NULL, NULL, 28, '2019-11-06 16:01:40', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(493, 64500, 0, 20, '2019-12-01', '2021-03-01', 18, 3225, 3225, 0, 12900, NULL, NULL, 28, '2019-11-06 16:01:40', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(494, 64500, 0, 20, '2019-12-01', '2021-04-01', 19, 3225, 3225, 0, 9675, NULL, NULL, 28, '2019-11-06 16:01:40', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(495, 64500, 0, 20, '2019-12-01', '2021-05-01', 20, 3225, 3225, 0, 6450, NULL, NULL, 28, '2019-11-06 16:01:40', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(496, 64500, 0, 20, '2019-12-01', '2021-06-01', 21, 3225, 3225, 0, 3225, NULL, NULL, 28, '2019-11-06 16:01:40', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(497, 64500, 0, 20, '2019-12-01', '2021-07-01', 22, 3225, 3225, 0, 0, NULL, NULL, 28, '2019-11-06 16:01:40', NULL, 'Y', 3, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N');

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
  `inst_paid_status` varchar(5) DEFAULT NULL,
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
  `inst_paid_penalty` double DEFAULT NULL,
  `inst_paid_inv_code` varchar(10) DEFAULT NULL,
  `inst_paid_code` varchar(10) DEFAULT NULL,
  `inst_paid_tran_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`inst_paid_id`)
) ENGINE=MyISAM AUTO_INCREMENT=113 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_installment_payment`
--

INSERT INTO `tbl_installment_payment` (`inst_paid_id`, `inst_total_paid_amount`, `inst_paid_yn`, `inst_paid_date`, `inst_paid_des`, `inst_paid_status`, `inst_cancel_yn`, `rec_id`, `met_id`, `inst_id`, `regDt`, `upDt`, `useYn`, `regUsr`, `upUsr`, `com_id`, `inst_paid_penalty`, `inst_paid_inv_code`, `inst_paid_code`, `inst_paid_tran_id`) VALUES
(1, 2000, 'Y', '2019-07-31', NULL, 'BOOK', NULL, 2, 1, 1, '2019-10-22 16:38:03', NULL, 'Y', 2, NULL, 1, NULL, '000001', NULL, NULL),
(2, 29106, 'N', '2019-10-23', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'ADV', NULL, 5, 2, 20, '2019-10-23 14:38:34', '2019-10-23 14:39:57', 'N', 3, 3, 1, 0, '000001', '000002', ''),
(3, 29106, 'Y', '2019-06-17', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'ADV', NULL, 5, 2, 20, '2019-10-23 14:41:10', NULL, 'Y', 3, NULL, 1, 0, '000001', '000003', ''),
(4, 3850, 'Y', '2019-08-02', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'LOAN', NULL, 5, 2, 21, '2019-10-23 14:48:56', NULL, 'Y', 3, NULL, 1, 0, '000002', '000004', ''),
(5, 3850, 'Y', '2019-09-03', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'LOAN', NULL, 2, 2, 22, '2019-10-23 14:50:31', NULL, 'Y', 3, NULL, 1, 0, '000003', '000005', ''),
(6, 3850, 'Y', '2019-10-02', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'LOAN', NULL, 2, 2, 23, '2019-10-23 14:51:26', NULL, 'Y', 3, NULL, 1, 0, '000004', '000006', ''),
(7, 9900, 'Y', '2019-06-17', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'ADV', NULL, 5, 2, 39, '2019-10-23 15:02:51', NULL, 'Y', 3, NULL, 1, 0, '000001', '000007', ''),
(8, 9900, 'Y', '2019-07-27', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'ADV', NULL, 5, 2, 40, '2019-10-23 15:05:28', NULL, 'Y', 3, NULL, 1, 0, '000002', '000008', ''),
(9, 9900, 'Y', '2019-09-01', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'ADV', NULL, 2, 2, 41, '2019-10-23 15:06:18', NULL, 'Y', 3, NULL, 1, 0, '000003', '000009', ''),
(10, 3850, 'Y', '2019-10-01', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'LOAN', NULL, 2, 2, 42, '2019-10-23 15:07:10', NULL, 'Y', 3, NULL, 1, 0, '000004', '000010', ''),
(11, 9900, 'Y', '2019-06-17', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'ADV', NULL, 5, 2, 60, '2019-10-23 15:20:44', NULL, 'Y', 3, NULL, 1, 0, '000001', '000011', ''),
(12, 9900, 'Y', '2019-08-02', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'ADV', NULL, 5, 2, 61, '2019-10-23 15:21:43', NULL, 'Y', 3, NULL, 1, 0, '000002', '000012', ''),
(13, 9900, 'Y', '2019-09-03', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'ADV', NULL, 5, 2, 62, '2019-10-23 15:22:36', NULL, 'Y', 3, NULL, 1, 0, '000003', '000013', ''),
(14, 3850, 'Y', '2019-10-02', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'LOAN', NULL, 2, 2, 63, '2019-10-23 15:23:32', NULL, 'Y', 3, NULL, 1, 0, '000004', '000014', ''),
(15, 2000, 'Y', '2019-06-24', NULL, 'BOOK', NULL, 5, 2, 81, '2019-10-23 15:35:16', NULL, 'Y', 3, NULL, 1, NULL, '000001', NULL, NULL),
(16, 2000, 'Y', '2019-06-24', NULL, 'BOOK', NULL, 5, 2, 103, '2019-10-23 15:45:36', NULL, 'Y', 3, NULL, 1, NULL, '000001', NULL, NULL),
(17, 7900, 'Y', '2019-07-01', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'ADV', NULL, 5, 2, 104, '2019-10-24 09:07:45', NULL, 'Y', 3, NULL, 1, 0, '000002', '000017', ''),
(18, 9900, 'Y', '2019-08-01', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'ADV', NULL, 5, 2, 105, '2019-10-24 09:08:59', NULL, 'Y', 3, NULL, 1, 0, '000003', '000018', ''),
(19, 9900, 'Y', '2019-09-01', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'ADV', NULL, 5, 2, 106, '2019-10-24 09:10:07', NULL, 'Y', 3, NULL, 1, 0, '000004', '000019', ''),
(20, 3850, 'Y', '2019-10-04', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'LOAN', NULL, 2, 2, 107, '2019-10-24 09:15:25', NULL, 'Y', 3, NULL, 1, 0, '000005', '000020', ''),
(21, 2000, 'Y', '2019-06-21', NULL, 'BOOK', NULL, 5, 2, 125, '2019-10-24 09:35:08', NULL, 'Y', 3, NULL, 1, NULL, '000001', NULL, NULL),
(22, 45520, 'Y', '2019-06-24', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'ADV', NULL, 5, 2, 126, '2019-10-24 09:38:15', NULL, 'Y', 3, NULL, 1, 0, '000002', '000022', ''),
(23, 4950, 'Y', '2019-08-03', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'LOAN', NULL, 5, 2, 127, '2019-10-24 09:39:50', NULL, 'Y', 3, NULL, 1, 0, '000003', '000023', ''),
(24, 4950, 'Y', '2019-09-06', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'LOAN', NULL, 5, 2, 128, '2019-10-24 09:41:10', NULL, 'Y', 3, NULL, 1, 0, '000004', '000024', ''),
(25, 4950, 'Y', '2019-10-04', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'LOAN', NULL, 2, 2, 129, '2019-10-24 09:41:54', NULL, 'Y', 3, NULL, 1, 0, '000005', '000025', ''),
(26, 2000, 'Y', '2019-06-20', NULL, 'BOOK', NULL, 5, 2, 137, '2019-10-24 09:56:48', NULL, 'Y', 3, NULL, 1, NULL, '000001', NULL, NULL),
(27, 10250, 'Y', '2019-06-26', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'ADV', NULL, 5, 2, 138, '2019-10-24 09:59:57', NULL, 'Y', 3, NULL, 1, 0, '000002', '000027', ''),
(28, 12250, 'Y', '2019-08-01', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'ADV', NULL, 5, 2, 139, '2019-10-24 10:00:38', NULL, 'Y', 3, NULL, 1, 0, '000003', '000028', ''),
(29, 12250, 'Y', '2019-09-04', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'ADV', NULL, 2, 2, 140, '2019-10-24 10:01:29', NULL, 'Y', 3, NULL, 1, 0, '000004', '000029', ''),
(30, 5716.67, 'Y', '2019-10-01', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'LOAN', NULL, 2, 2, 141, '2019-10-24 10:02:08', NULL, 'Y', 3, NULL, 1, 0, '000005', '000030', ''),
(31, 2000, 'Y', '2019-06-23', NULL, 'BOOK', NULL, 5, 2, 156, '2019-10-24 10:08:19', NULL, 'Y', 3, NULL, 1, NULL, '000001', NULL, NULL),
(32, 7900, 'Y', '2019-07-01', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'ADV', NULL, 5, 2, 157, '2019-10-24 10:09:22', NULL, 'Y', 3, NULL, 1, 0, '000002', '000032', ''),
(33, 9900, 'Y', '2019-07-31', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'ADV', NULL, 5, 2, 158, '2019-10-24 10:10:10', NULL, 'Y', 3, NULL, 1, 0, '000003', '000033', ''),
(34, 9900, 'Y', '2019-09-01', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'ADV', NULL, 2, 2, 159, '2019-10-24 10:11:35', NULL, 'Y', 3, NULL, 1, 0, '000004', '000034', ''),
(35, 3850, 'Y', '2019-10-01', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'LOAN', NULL, 2, 2, 160, '2019-10-24 10:13:02', NULL, 'Y', 3, NULL, 1, 0, '000005', '000035', ''),
(36, 2000, 'Y', '2019-06-26', NULL, 'BOOK', NULL, 5, 2, 178, '2019-10-24 10:20:40', NULL, 'Y', 3, NULL, 1, NULL, '000001', NULL, NULL),
(37, 7900, 'Y', '2019-07-01', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'ADV', NULL, 5, 1, 179, '2019-10-24 10:25:17', NULL, 'Y', 3, NULL, 1, 0, '000002', '000037', ''),
(38, 9900, 'Y', '2019-08-02', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'ADV', NULL, 5, 1, 180, '2019-10-24 10:27:26', NULL, 'Y', 3, NULL, 1, 0, '000003', '000038', ''),
(39, 9900, 'Y', '2019-09-04', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'ADV', NULL, 2, 1, 181, '2019-10-24 10:28:13', NULL, 'Y', 3, NULL, 1, 0, '000004', '000039', ''),
(40, 4620, 'Y', '2019-10-04', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'LOAN', NULL, 2, 1, 182, '2019-10-24 10:30:25', NULL, 'Y', 3, NULL, 1, 0, '000005', '000040', ''),
(41, 11100, 'Y', '2019-06-24', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'ADV', NULL, 5, 2, 197, '2019-10-24 10:44:49', NULL, 'Y', 3, NULL, 1, 0, '000001', '000041', ''),
(42, 11100, 'Y', '2019-08-01', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'ADV', NULL, 5, 2, 198, '2019-10-24 10:45:20', NULL, 'Y', 3, NULL, 1, 0, '000002', '000042', ''),
(43, 11100, 'Y', '2019-09-01', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'ADV', NULL, 5, 2, 199, '2019-10-24 10:46:14', NULL, 'Y', 3, NULL, 1, 0, '000003', '000043', ''),
(44, 5180, 'Y', '2019-10-04', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'LOAN', NULL, 2, 2, 200, '2019-10-24 10:48:04', NULL, 'Y', 3, NULL, 1, 0, '000004', '000044', ''),
(45, 21900, 'Y', '2019-06-24', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'ADV', NULL, 5, 2, 236, '2019-10-24 11:22:11', NULL, 'Y', 3, NULL, 1, 0, '000001', '000045', ''),
(46, 21900, 'Y', '2019-08-01', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'ADV', NULL, 5, 2, 237, '2019-10-24 11:22:43', NULL, 'Y', 3, NULL, 1, 0, '000002', '000046', ''),
(47, 21900, 'Y', '2019-09-01', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'ADV', NULL, 5, 2, 238, '2019-10-24 11:23:29', NULL, 'Y', 3, NULL, 1, 0, '000003', '000047', ''),
(48, 10220, 'Y', '2019-10-17', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'LOAN', NULL, 2, 2, 239, '2019-10-24 11:24:49', NULL, 'Y', 3, NULL, 1, 0, '000004', '000048', ''),
(49, 2000, 'Y', '2019-07-23', NULL, 'BOOK', NULL, 5, 2, 254, '2019-10-24 11:43:01', NULL, 'Y', 3, NULL, 1, NULL, '000001', NULL, NULL),
(50, 10500, 'Y', '2019-07-31', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'ADV', NULL, 2, 2, 255, '2019-10-24 11:47:08', NULL, 'Y', 3, NULL, 1, 0, '000002', '000050', ''),
(51, 12500, 'Y', '2019-09-03', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'ADV', NULL, 2, 2, 256, '2019-10-24 11:47:45', NULL, 'Y', 3, NULL, 1, 0, '000003', '000051', ''),
(52, 12500, 'Y', '2019-10-14', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'ADV', NULL, 2, 2, 257, '2019-10-24 11:48:33', NULL, 'Y', 3, NULL, 1, 0, '000004', '000052', ''),
(53, 124200, 'Y', '2019-07-25', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'ADV', NULL, 2, 2, 259, '2019-10-24 12:03:00', NULL, 'Y', 3, NULL, 1, 0, '000001', '000053', ''),
(54, 2000, 'Y', '2019-07-25', NULL, 'BOOK', NULL, 2, 2, 260, '2019-10-24 12:12:49', NULL, 'Y', 3, NULL, 1, NULL, '000001', NULL, NULL),
(55, 9500, 'Y', '2019-08-05', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'ADV', NULL, 2, 2, 261, '2019-10-24 12:14:45', NULL, 'Y', 3, NULL, 1, 0, '000002', '000055', ''),
(56, 11500, 'Y', '2019-09-05', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'ADV', NULL, 2, 2, 262, '2019-10-24 12:15:47', NULL, 'Y', 3, NULL, 1, 0, '000003', '000056', ''),
(57, 11500, 'Y', '2019-10-07', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'ADV', NULL, 2, 2, 263, '2019-10-24 12:17:41', NULL, 'Y', 3, NULL, 1, 0, '000004', '000057', ''),
(58, 2000, 'Y', '2019-07-31', NULL, 'BOOK', NULL, 2, 2, 279, '2019-10-24 14:52:59', NULL, 'Y', 3, NULL, 1, NULL, '000001', NULL, NULL),
(59, 10500, 'Y', '2019-08-09', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'ADV', NULL, 2, 2, 280, '2019-10-24 14:55:22', NULL, 'Y', 3, NULL, 1, 0, '000002', '000059', ''),
(60, 12500, 'Y', '2019-09-03', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'ADV', NULL, 2, 2, 281, '2019-10-24 14:56:11', NULL, 'Y', 3, NULL, 1, 0, '000003', '000060', ''),
(61, 12500, 'Y', '2019-10-05', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'ADV', NULL, 2, 2, 282, '2019-10-24 14:57:25', NULL, 'Y', 3, NULL, 1, 0, '000004', '000061', ''),
(62, 34500, 'Y', '2019-08-05', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'ADV', NULL, 2, 2, 298, '2019-10-24 15:09:02', NULL, 'Y', 3, NULL, 1, 0, '000001', '000062', ''),
(63, 4735.29, 'Y', '2019-09-05', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'LOAN', NULL, 2, 2, 299, '2019-10-24 15:11:14', NULL, 'Y', 3, NULL, 1, 0, '000002', '000063', ''),
(64, 4735.29, 'Y', '2019-10-07', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'LOAN', NULL, 2, 2, 300, '2019-10-24 15:13:23', NULL, 'Y', 3, NULL, 1, 0, '000003', '000064', ''),
(65, 2000, 'Y', '2019-10-03', NULL, 'BOOK', NULL, 2, 1, 316, '2019-10-24 15:27:27', NULL, 'Y', 3, NULL, 1, NULL, '000001', NULL, NULL),
(66, 4750, 'Y', '2019-10-05', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'ADV', NULL, 2, 1, 317, '2019-10-24 15:44:59', NULL, 'Y', 3, NULL, 1, 0, '000002', '000066', ''),
(67, 6750, 'Y', '2019-10-05', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'ADV', NULL, 2, 1, 318, '2019-10-24 15:50:43', NULL, 'Y', 3, NULL, 1, 0, '000003', '000067', ''),
(68, 6750, 'Y', '2019-10-05', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'ADV', NULL, 2, 1, 319, '2019-10-24 15:57:07', NULL, 'Y', 3, NULL, 1, 0, '000004', '000068', ''),
(69, 19800, 'Y', '2019-06-26', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'ADV', NULL, 5, 1, 215, '2019-10-28 14:31:29', NULL, 'Y', 3, NULL, 1, 0, '000001', '000069', ''),
(70, 19800, 'Y', '2019-08-02', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'ADV', NULL, 5, 1, 216, '2019-10-28 14:32:38', NULL, 'Y', 3, NULL, 1, 0, '000002', '000070', ''),
(71, 19800, 'Y', '2019-09-02', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'ADV', NULL, 2, 1, 217, '2019-10-28 14:33:34', NULL, 'Y', 3, NULL, 1, 0, '000003', '000071', ''),
(72, 7700, 'Y', '2019-10-04', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'LOAN', NULL, 2, 1, 218, '2019-10-28 14:34:23', NULL, 'Y', 3, NULL, 1, 0, '000004', '000072', ''),
(73, 13900, 'Y', '2019-08-07', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង ទូរទូរទស្សន៍', 'ADV', NULL, 5, 2, 2, '2019-10-28 15:18:07', NULL, 'Y', 3, NULL, 1, 0, '000002', '000073', ''),
(74, 15900, 'Y', '2019-09-03', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង ទូរទូរទស្សន៍', 'ADV', NULL, 2, 2, 3, '2019-10-28 15:18:58', NULL, 'Y', 3, NULL, 1, 0, '000003', '000074', ''),
(75, 15900, 'Y', '2019-10-03', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  ទូរទូរទស្សន៍', 'ADV', NULL, 2, 2, 4, '2019-10-28 15:19:28', NULL, 'Y', 3, NULL, 1, 0, '000004', '000075', ''),
(76, 2000, 'Y', '2019-09-06', NULL, 'BOOK', NULL, 5, 1, 344, '2019-10-28 15:25:33', NULL, 'Y', 3, NULL, 1, NULL, '000001', NULL, NULL),
(77, 62800, 'Y', '2019-10-11', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង ទូរទូរទស្សន៍', 'ADV', NULL, 2, 2, 345, '2019-10-28 15:29:12', NULL, 'Y', 3, NULL, 1, 0, '000002', '000077', ''),
(78, 2000, 'Y', '2019-07-01', NULL, 'BOOK', NULL, 5, 1, 405, '2019-10-28 16:08:43', NULL, 'Y', 3, NULL, 1, NULL, '000001', NULL, NULL),
(79, 2000, 'Y', '2019-07-01', NULL, 'BOOK', NULL, 5, 1, 409, '2019-10-28 16:14:32', NULL, 'Y', 3, NULL, 1, NULL, '000001', NULL, NULL),
(80, 11000, 'Y', '2019-07-08', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង ទូរទូរទស្សន៍', 'ADV', NULL, 2, 1, 410, '2019-10-28 16:15:43', NULL, 'Y', 3, NULL, 1, 0, '000002', '000080', ''),
(81, 13000, 'Y', '2019-08-06', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង ទូរទូរទស្សន៍', 'ADV', NULL, 2, 2, 411, '2019-10-28 16:16:34', NULL, 'Y', 3, NULL, 1, 0, '000003', '000081', ''),
(82, 2000, 'Y', '2019-07-15', NULL, 'BOOK', NULL, 2, 2, 413, '2019-10-28 16:33:40', NULL, 'Y', 3, NULL, 1, NULL, '000001', NULL, NULL),
(83, 2000, 'Y', '2019-07-15', NULL, 'BOOK', NULL, 2, 2, 435, '2019-10-28 16:36:19', NULL, 'Y', 3, NULL, 1, NULL, '000001', NULL, NULL),
(84, 10900, 'Y', '2019-07-21', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង ទូរទូរទស្សន៍', 'ADV', NULL, 2, 2, 414, '2019-10-28 16:40:01', NULL, 'Y', 3, NULL, 1, 0, '000002', '000084', ''),
(85, 12900, 'Y', '2019-08-18', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង ទូរទូរទស្សន៍', 'ADV', NULL, 2, 2, 415, '2019-10-28 16:40:49', NULL, 'Y', 3, NULL, 1, 0, '000003', '000085', ''),
(86, 12900, 'Y', '2019-09-18', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង ទូរទូរទស្សន៍', 'ADV', NULL, 2, 2, 416, '2019-10-28 16:42:34', NULL, 'Y', 3, NULL, 1, 0, '000004', '000086', ''),
(87, 10900, 'Y', '2019-07-21', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង ទូរទូរទស្សន៍', 'ADV', NULL, 2, 2, 436, '2019-10-28 16:56:58', NULL, 'Y', 3, NULL, 1, 0, '000002', '000087', ''),
(88, 12900, 'Y', '2019-08-18', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង ទូរទូរទស្សន៍', 'ADV', NULL, 2, 2, 437, '2019-10-28 16:57:45', NULL, 'Y', 3, NULL, 1, 0, '000003', '000088', ''),
(89, 12900, 'Y', '2019-09-18', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង ទូរទូរទស្សន៍', 'ADV', NULL, 2, 2, 438, '2019-10-28 16:58:23', NULL, 'Y', 3, NULL, 1, 0, '000004', '000089', ''),
(90, 5016.67, 'Y', '2019-10-16', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង ទូរទូរទស្សន៍', 'LOAN', NULL, 2, 2, 439, '2019-10-28 16:59:04', NULL, 'Y', 3, NULL, 1, 0, '000005', '000090', ''),
(91, 2000, 'Y', '2019-08-09', NULL, 'BOOK', NULL, 2, 2, 457, '2019-10-29 11:42:25', NULL, 'Y', 3, NULL, 1, NULL, '000001', NULL, NULL),
(92, 10900, 'Y', '2019-09-20', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែងទូរទូរទស្សន៍', 'ADV', NULL, 2, 2, 458, '2019-10-29 12:07:52', NULL, 'Y', 3, NULL, 1, 0, '000002', '000092', ''),
(93, 12900, 'Y', '2019-10-17', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែងទូរទូរទស្សន៍', 'ADV', NULL, 2, 2, 459, '2019-10-29 12:08:27', NULL, 'Y', 3, NULL, 1, 0, '000003', '000093', ''),
(94, 5016.67, 'Y', '2019-10-16', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែងទូរទូរទស្សន៍', 'LOAN', NULL, 2, 2, 417, '2019-10-29 15:25:30', NULL, 'Y', 3, NULL, 1, 0, '000005', '000094', ''),
(95, 12000, 'Y', '2019-10-01', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែងទូរទូរទស្សន៍', 'ADV', NULL, 2, 2, 363, '2019-10-29 15:27:04', NULL, 'Y', 3, NULL, 1, 0, '000001', '000095', ''),
(96, 12000, 'Y', '2019-10-01', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែងទូរទូរទស្សន៍', 'ADV', NULL, 2, 2, 384, '2019-10-29 15:27:33', NULL, 'Y', 3, NULL, 1, 0, '000001', '000096', ''),
(97, 12000, 'Y', '2019-11-01', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  ទូរទូរទស្សន៍', 'ADV', NULL, 2, 2, 364, '2019-11-01 12:45:20', NULL, 'Y', 3, NULL, 1, 0, '000002', '000097', ''),
(98, 12000, 'Y', '2019-11-01', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'ADV', NULL, 2, 2, 385, '2019-11-01 12:47:52', NULL, 'Y', 3, NULL, 1, 0, '000002', '000098', ''),
(99, 3850, 'Y', '2019-11-01', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'LOAN', NULL, 2, 2, 43, '2019-11-01 12:49:41', NULL, 'Y', 3, NULL, 1, 0, '000005', '000099', ''),
(100, 10220, 'Y', '2019-11-01', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'LOAN', NULL, 2, 2, 240, '2019-11-01 12:51:03', NULL, 'Y', 3, NULL, 1, 0, '000005', '000100', ''),
(101, 3850, 'Y', '2019-11-01', 'ទូរចង្រ្កានលើ-ក្រោម ចង្រ្កានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង ទូរទូរស្សន៍', 'LOAN', NULL, 2, 2, 24, '2019-11-02 11:10:42', NULL, 'Y', 3, NULL, 1, 0, '000005', '000101', ''),
(102, 3850, 'Y', '2019-11-01', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'LOAN', NULL, 2, 2, 64, '2019-11-02 11:24:36', NULL, 'Y', 3, NULL, 1, 0, '000005', '000102', ''),
(103, 4620, 'Y', '2019-11-04', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'LOAN', NULL, 2, 1, 183, '2019-11-04 10:41:11', NULL, 'Y', 3, NULL, 1, 0, '000006', '000103', ''),
(104, 7700, 'Y', '2019-11-04', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី  ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'LOAN', NULL, 2, 1, 219, '2019-11-04 14:18:01', NULL, 'Y', 3, NULL, 1, 0, '000005', '000104', ''),
(105, 4950, 'Y', '2019-11-04', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'LOAN', NULL, 2, 2, 130, '2019-11-04 15:38:48', NULL, 'Y', 3, NULL, 1, 0, '000006', '000105', ''),
(106, 5180, 'Y', '2019-11-04', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'LOAN', NULL, 2, 2, 201, '2019-11-04 15:40:19', NULL, 'Y', 3, NULL, 1, 0, '000005', '000106', ''),
(107, 3850, 'Y', '2019-11-03', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'LOAN', NULL, 2, 2, 108, '2019-11-05 14:43:03', NULL, 'Y', 3, NULL, 1, 0, '000006', '000107', ''),
(108, 5716.67, 'Y', '2019-11-02', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'LOAN', NULL, 2, 2, 142, '2019-11-05 14:46:49', NULL, 'Y', 3, NULL, 1, 0, '000006', '000108', ''),
(109, 3850, 'Y', '2019-11-01', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'LOAN', NULL, 2, 2, 161, '2019-11-05 14:48:54', NULL, 'Y', 3, NULL, 1, 0, '000006', '000109', ''),
(110, 5366.67, 'Y', '2019-11-05', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'LOAN', NULL, 2, 2, 264, '2019-11-05 14:53:36', NULL, 'Y', 3, NULL, 1, 0, '000005', '000110', ''),
(111, 4735.29, 'Y', '2019-11-05', 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', 'LOAN', NULL, 2, 2, 301, '2019-11-05 14:54:41', NULL, 'Y', 3, NULL, 1, 0, '000004', '000111', ''),
(112, 2000, 'Y', '2019-10-21', NULL, 'BOOK', NULL, 2, 2, 476, '2019-11-06 16:01:40', NULL, 'Y', 3, NULL, 1, NULL, '000001', NULL, NULL);

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
(7, 'Category', 'ប្រភេទអចលនទ្រព្យ', '2018-08-24 02:59:23', 'fa fa-tags', NULL, 3, 1),
(8, 'House', 'អចលនទ្រព្យ', '2018-08-24 02:59:23', 'fa fa-building-o', NULL, 10, 2),
(9, 'Contract', 'កក់ប្រាក់', '2018-08-24 02:59:23', 'fa fa-handshake-o', NULL, 11, 3),
(10, 'Sell', 'លក់ចេញ', '2018-08-24 02:59:23', 'fa fa-shopping-cart', NULL, 12, 3),
(11, 'Installment Payment', 'បង់ប្រាក់', '2018-08-24 02:59:23', 'fa fa-line-chart', NULL, 13, 3),
(12, 'Dashboard', 'ផ្ទាំងគ្រប់គ្រង', '2018-08-24 03:02:26', 'fa fa-dashboard', NULL, 1, 0),
(13, 'Commission Report', 'កំរៃជើងសារ', '2019-07-10 11:09:02', 'fa fa-pie-chart', NULL, 16, 3),
(14, 'Expend', 'ការចំណាយ', '2019-07-10 11:15:28', 'fa fa-bar-chart', NULL, 17, 3),
(15, 'Payment Report', 'ទិន្នន័យបង់ប្រាក់', '2019-07-10 11:15:28', 'fa fa-area-chart', NULL, 14, 3),
(16, 'Salary', 'ប្រាក់ខែបុគ្គលិក', '2019-07-10 11:15:28', 'fa fa-university', NULL, 15, 3),
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
(1, 1, NULL, '2019-09-13 09:50:01', 'Y'),
(3, 1, NULL, '2019-09-13 09:50:01', 'Y'),
(4, 1, NULL, '2019-09-13 09:50:01', 'Y'),
(5, 1, NULL, '2019-09-13 09:50:01', 'Y'),
(6, 1, NULL, '2019-09-13 09:50:01', 'Y'),
(7, 1, NULL, '2019-09-13 09:50:01', 'Y'),
(8, 1, NULL, '2019-09-13 09:50:01', 'Y'),
(9, 1, NULL, '2019-09-13 09:50:01', 'Y'),
(10, 1, NULL, '2019-09-13 09:50:01', 'Y'),
(11, 1, NULL, '2019-09-13 09:50:01', 'Y'),
(12, 1, NULL, '2019-09-13 09:50:01', 'Y'),
(13, 1, NULL, '2019-09-13 09:50:01', 'Y'),
(14, 1, NULL, '2019-09-13 09:50:01', 'Y'),
(15, 1, NULL, '2019-09-13 09:50:01', 'Y'),
(16, 1, NULL, '2019-09-13 09:50:01', 'Y'),
(17, 1, NULL, '2019-09-13 09:50:01', 'Y'),
(18, 1, NULL, '2019-09-13 09:50:01', 'Y'),
(19, 1, NULL, '2019-09-13 09:50:01', 'Y');

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
(1, 2, NULL, '2019-09-13 09:50:01', 'Y'),
(1, 3, NULL, '2019-09-17 14:39:48', 'Y'),
(3, 2, NULL, '2019-09-13 09:50:01', 'Y'),
(3, 3, NULL, '2019-09-17 14:39:48', 'Y'),
(4, 2, NULL, '2019-09-13 09:50:01', 'Y'),
(4, 3, NULL, '2019-09-17 14:39:48', 'Y'),
(5, 2, NULL, '2019-09-13 09:50:01', 'Y'),
(5, 3, NULL, '2019-09-17 14:39:48', 'Y'),
(6, 2, NULL, '2019-09-13 09:50:01', 'Y'),
(6, 3, NULL, '2019-09-17 14:39:48', 'Y'),
(7, 2, NULL, '2019-09-13 09:50:01', 'Y'),
(7, 3, NULL, '2019-09-17 14:39:48', 'Y'),
(8, 2, NULL, '2019-09-13 09:50:01', 'Y'),
(8, 3, NULL, '2019-09-17 14:39:48', 'Y'),
(9, 2, NULL, '2019-09-13 09:50:01', 'Y'),
(9, 3, NULL, '2019-09-17 14:39:48', 'Y'),
(10, 2, NULL, '2019-09-13 09:50:01', 'Y'),
(10, 3, NULL, '2019-09-17 14:39:48', 'Y'),
(11, 2, NULL, '2019-09-13 09:50:01', 'Y'),
(11, 3, NULL, '2019-09-17 14:39:48', 'Y'),
(12, 2, NULL, '2019-09-13 09:50:01', 'Y'),
(12, 3, NULL, '2019-09-17 14:39:48', 'Y'),
(13, 2, NULL, '2019-09-13 09:50:01', 'Y'),
(13, 3, NULL, '2019-09-17 14:39:48', 'Y'),
(14, 2, NULL, '2019-09-13 09:50:01', 'Y'),
(14, 3, NULL, '2019-09-17 14:39:48', 'Y'),
(15, 2, NULL, '2019-09-13 09:50:01', 'Y'),
(15, 3, NULL, '2019-09-17 14:39:48', 'Y'),
(16, 2, NULL, '2019-09-13 09:50:01', 'Y'),
(16, 3, NULL, '2019-09-17 14:39:48', 'Y'),
(17, 2, NULL, '2019-09-13 09:50:01', 'Y'),
(18, 2, NULL, '2019-09-13 09:50:01', 'Y'),
(18, 3, NULL, '2019-09-17 14:39:48', 'Y'),
(19, 2, NULL, '2019-09-13 09:50:01', 'Y'),
(19, 3, NULL, '2019-09-17 14:39:48', 'Y');

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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_payment_method`
--

INSERT INTO `tbl_payment_method` (`met_id`, `met_nm`, `met_nm_kh`) VALUES
(1, 'Cash', 'សាច់ប្រាក់'),
(2, 'ABA Bank', 'ធនាគារ ABA'),
(3, 'សែក', 'សែក');

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
  `pos_get_yn` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`pos_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_position`
--

INSERT INTO `tbl_position` (`pos_id`, `pos_nm`, `pos_nm_kh`, `pos_des`, `regDt`, `upDt`, `useYn`, `regUsr`, `upUsr`, `com_id`, `pos_get_yn`) VALUES
(1, 'Admin', 'ម្ចាស់ក្រុមហ៊ុន', NULL, '2019-09-13 09:50:01', NULL, 'Y', 0, 0, 1, 'N'),
(2, 'Accountant', 'គណនី', '', '2019-09-13 04:43:11', '2019-10-14 13:03:55', 'Y', 2, 0, 1, 'Y'),
(3, 'Engineer ', 'វិស្វករ', '', '2019-09-13 04:45:51', '2019-09-15 00:34:28', 'N', 2, 0, 1, 'Y'),
(4, 'Seller', 'អ្នកលក់', '', '2019-09-13 04:46:24', NULL, 'Y', 2, 0, 1, 'Y'),
(5, 'Agency', 'ភ្នាក់ងារ', '', '2019-09-17 15:18:07', NULL, 'Y', 3, 0, 1, 'Y'),
(6, 'Chief Financial Officer', 'ប្រធានហិរញ្ញវត្ថុ', '', '2019-10-14 15:07:10', NULL, 'Y', 3, 0, 1, 'Y'),
(7, 'Sale Manager ', 'ប្រធានផ្នែកលក់', '', '2019-10-14 16:09:14', NULL, 'Y', 3, 0, 1, 'Y'),
(8, 'Senior Sale', 'អ្នកលក់ជាន់ខ្ពស់', '', '2019-10-16 13:26:03', NULL, 'Y', 3, 0, 1, 'Y'),
(9, 'Deputy Financial Manager', 'អនុប្រធានហិរញ្ញវត្ថុ', '', '2019-10-16 13:30:56', NULL, 'Y', 3, 0, 1, 'Y');

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
  `pro_floor` double DEFAULT NULL,
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
  `pro_land_width` double DEFAULT NULL,
  `pro_land_height` double DEFAULT NULL,
  PRIMARY KEY (`pro_id`)
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_product`
--

INSERT INTO `tbl_product` (`pro_id`, `pro_code`, `pro_price`, `pro_sale_price`, `pro_number`, `pro_street`, `pro_photo`, `pro_length`, `pro_width`, `pro_area`, `pro_room`, `pro_toilet`, `pro_floor`, `pro_des`, `pro_status`, `regDt`, `upDt`, `useYn`, `regUsr`, `upUsr`, `com_id`, `cat_id`, `bra_id`, `pro_land_width`, `pro_land_height`) VALUES
(1, 'AA1', 159000, NULL, '', '', '', 15, 4.2, 172.2, 3, 4, 2.5, '', 'B', '2019-10-14 13:20:35', '2019-10-14 13:38:59', 'Y', 3, 3, 1, 3, 1, 4.2, 23),
(2, 'A2', 149000, NULL, '', '', '', 15, 4.2, 172.2, 3, 4, 2.5, '', 'B', '2019-10-14 13:23:35', '2019-10-14 13:38:52', 'Y', 3, 3, 1, 3, 1, 4.2, 23),
(3, 'A3', 149000, NULL, '', '', '', 15, 4.2, 172.2, 3, 4, 2.5, '', 'B', '2019-10-14 13:31:01', '2019-10-14 13:38:45', 'Y', 3, 3, 1, 3, 1, 4.2, 23),
(4, 'AA4', 159000, NULL, '', '', '', 15, 4.2, 172.2, 3, 4, 2.5, '', 'F', '2019-10-14 13:32:07', '2019-10-14 13:38:35', 'Y', 3, 3, 1, 3, 1, 4.2, 23),
(5, 'AA5', 159000, 0, '', '', '', 15, 4.2, 172.2, 3, 4, 2.5, '', 'S', '2019-10-14 13:33:16', '2019-10-28 16:14:32', 'Y', 3, 3, 1, 3, 1, 4.2, 23),
(6, 'A6', 149000, NULL, '', '', '', 15, 4.2, 172.2, 3, 4, 2.5, '', 'B', '2019-10-14 13:33:32', '2019-10-14 13:38:07', 'Y', 3, 3, 1, 3, 1, 4.2, 23),
(7, 'AA7', 159000, NULL, '', '', '', 15, 4.2, 172.2, 3, 4, 2.5, '', 'F', '2019-10-14 13:34:11', '2019-10-14 13:37:58', 'Y', 3, 3, 1, 3, 1, 4.2, 23),
(8, 'AA8', 159000, 0, NULL, '', '', 15, 4.2, 172.2, 3, 4, 2.5, '', 'S', '2019-10-14 13:40:07', '2019-10-22 16:38:03', 'Y', 3, 2, 1, 3, 1, 4.2, 23),
(9, 'A9', 149000, 0, '', '', '', 15, 4.2, 172.2, 3, 4, 2.5, '', 'S', '2019-10-14 13:40:24', '2019-10-28 15:25:33', 'Y', 3, 3, 1, 3, 1, 4.2, 23),
(10, 'A10', 149000, NULL, NULL, '', '', 15, 4.2, 172.2, 3, 4, 2.5, '', 'F', '2019-10-14 13:49:10', NULL, 'Y', 3, 0, 1, 3, 1, 4.2, 23),
(11, 'A11', 149000, NULL, NULL, '', '', 15, 4.2, 172.2, 3, 4, 2.5, '', 'F', '2019-10-14 13:49:11', NULL, 'Y', 3, 0, 1, 3, 1, 4.2, 23),
(12, 'A12', 149000, 0, NULL, '', '', 15, 4.2, 172.2, 3, 4, 2.5, '', 'S', '2019-10-14 13:49:11', '2019-10-29 11:42:24', 'Y', 3, 3, 1, 3, 1, 4.2, 23),
(13, 'A13', 149000, NULL, NULL, '', '', 15, 4.2, 172.2, 3, 4, 2.5, '', 'F', '2019-10-14 13:49:11', NULL, 'Y', 3, 0, 1, 3, 1, 4.2, 23),
(14, 'A14', 149000, 0, NULL, '', '', 15, 4.2, 172.2, 3, 4, 2.5, '', 'S', '2019-10-14 13:49:11', '2019-10-28 16:33:40', 'Y', 3, 3, 1, 3, 1, 4.2, 23),
(15, 'A15', 149000, 0, NULL, '', '', 15, 4.2, 172.2, 3, 4, 2.5, '', 'S', '2019-10-14 13:49:11', '2019-10-28 16:36:19', 'Y', 3, 3, 1, 3, 1, 4.2, 23),
(16, 'A16', 149000, 0, NULL, '', '', 15, 4.2, 172.2, 3, 4, 2.5, '', 'S', '2019-10-14 13:49:11', '2019-10-28 15:40:02', 'Y', 3, 3, 1, 3, 1, 4.2, 23),
(17, 'A17', 149000, 0, NULL, '', '', 15, 4.2, 172.2, 3, 4, 2.5, '', 'S', '2019-10-14 13:49:11', '2019-10-28 15:53:55', 'Y', 3, 3, 1, 3, 1, 4.2, 23),
(18, 'A18', 149000, NULL, NULL, '', '', 15, 4.2, 172.2, 3, 4, 2.5, '', 'F', '2019-10-14 13:49:11', NULL, 'Y', 3, 0, 1, 3, 1, 4.2, 23),
(19, 'A19', 149000, NULL, NULL, '', '', 15, 4.2, 172.2, 3, 4, 2.5, '', 'F', '2019-10-14 13:49:11', NULL, 'Y', 3, 0, 1, 3, 1, 4.2, 23),
(20, 'A20', 149000, NULL, NULL, '', '', 15, 4.2, 172.2, 3, 4, 2.5, '', 'F', '2019-10-14 13:49:11', NULL, 'Y', 3, 0, 1, 3, 1, 4.2, 23),
(21, 'A21', 149000, NULL, NULL, '', '', 15, 4.2, 172.2, 3, 4, 2.5, '', 'F', '2019-10-14 13:49:11', NULL, 'Y', 3, 0, 1, 3, 1, 4.2, 23),
(22, 'A22', 149000, NULL, NULL, '', '', 15, 4.2, 172.2, 3, 4, 2.5, '', 'F', '2019-10-14 13:49:11', NULL, 'Y', 3, 0, 1, 3, 1, 4.2, 23),
(23, 'A23', 149000, NULL, '', '', '', 15, 4.2, 172.2, 3, 4, 2.5, 'មិនចេញលក់', 'F', '2019-10-14 13:50:11', '2019-10-14 13:51:03', 'Y', 3, 3, 1, 3, 1, 4.2, 23),
(24, 'BB1', 125415, NULL, '', '', '', 12, 4.2, 159, 4, 5, 3, '', 'F', '2019-10-14 13:52:53', '2019-10-14 13:55:26', 'Y', 3, 3, 1, 3, 1, 4.2, 17.5),
(25, 'B2', 92900, NULL, '', '', '', 12, 4.2, 159, 4, 5, 3, '', 'F', '2019-10-14 13:55:37', '2019-10-14 13:56:13', 'Y', 3, 3, 1, 3, 1, 4.2, 17.5),
(26, 'B3', 92900, NULL, NULL, '', '', 12, 4.2, 159, 4, 5, 3, '', 'F', '2019-10-14 13:56:32', NULL, 'Y', 3, 0, 1, 3, 1, 4.2, 17.5),
(27, 'B4', 92900, NULL, NULL, '', '', 12, 4.2, 159, 4, 5, 3, '', 'F', '2019-10-14 13:56:32', NULL, 'Y', 3, 0, 1, 3, 1, 4.2, 17.5),
(28, 'B5', 92900, NULL, NULL, '', '', 12, 4.2, 159, 4, 5, 3, '', 'F', '2019-10-14 13:56:32', NULL, 'Y', 3, 0, 1, 3, 1, 4.2, 17.5),
(29, 'B6', 92900, NULL, NULL, '', '', 12, 4.2, 159, 4, 5, 3, '', 'F', '2019-10-14 13:56:32', NULL, 'Y', 3, 0, 1, 3, 1, 4.2, 17.5),
(30, 'B7', 92900, NULL, NULL, '', '', 12, 4.2, 159, 4, 5, 3, '', 'F', '2019-10-14 13:56:32', NULL, 'Y', 3, 0, 1, 3, 1, 4.2, 17.5),
(31, 'B8', 92900, NULL, NULL, '', '', 12, 4.2, 159, 4, 5, 3, '', 'F', '2019-10-14 13:56:32', NULL, 'Y', 3, 0, 1, 3, 1, 4.2, 17.5),
(32, 'B9', 92900, NULL, NULL, '', '', 12, 4.2, 159, 4, 5, 3, '', 'F', '2019-10-14 13:56:33', NULL, 'Y', 3, 0, 1, 3, 1, 4.2, 17.5),
(33, 'B10', 92900, NULL, NULL, '', '', 12, 4.2, 159, 4, 5, 3, '', 'F', '2019-10-14 13:56:33', NULL, 'Y', 3, 0, 1, 3, 1, 4.2, 17.5),
(34, 'BB12', 92900, NULL, '', '', '', 12, 4.2, 159, 4, 5, 3, '', 'F', '2019-10-14 13:56:33', '2019-10-14 13:56:53', 'Y', 3, 3, 1, 3, 1, 4.2, 17.5),
(35, 'BB13', 92900, NULL, NULL, '', '', 12, 4.2, 159, 4, 5, 3, '', 'F', '2019-10-14 13:57:06', NULL, 'Y', 3, 0, 1, 3, 1, 4.2, 17.5),
(36, 'B14', 92900, NULL, '', '', '', 12, 4.2, 159, 4, 5, 3, '', 'F', '2019-10-14 13:57:52', '2019-10-14 13:58:10', 'Y', 3, 3, 1, 3, 1, 4.2, 17.5),
(37, 'B15', 92900, NULL, NULL, '', '', 12, 4.2, 159, 4, 5, 3, '', 'F', '2019-10-14 13:58:26', NULL, 'Y', 3, 0, 1, 3, 1, 4.2, 17.5),
(38, 'B16', 92900, NULL, NULL, '', '', 12, 4.2, 159, 4, 5, 3, '', 'F', '2019-10-14 13:58:26', NULL, 'Y', 3, 0, 1, 3, 1, 4.2, 17.5),
(39, 'B17', 92900, NULL, NULL, '', '', 12, 4.2, 159, 4, 5, 3, '', 'F', '2019-10-14 13:58:27', NULL, 'Y', 3, 0, 1, 3, 1, 4.2, 17.5),
(40, 'B18', 92900, NULL, NULL, '', '', 12, 4.2, 159, 4, 5, 3, '', 'F', '2019-10-14 13:58:27', NULL, 'Y', 3, 0, 1, 3, 1, 4.2, 17.5),
(41, 'B19', 92900, NULL, NULL, '', '', 12, 4.2, 159, 4, 5, 3, '', 'F', '2019-10-14 13:58:27', NULL, 'Y', 3, 0, 1, 3, 1, 4.2, 17.5),
(42, 'B20', 92900, NULL, NULL, '', '', 12, 4.2, 159, 4, 5, 3, '', 'F', '2019-10-14 13:58:27', NULL, 'Y', 3, 0, 1, 3, 1, 4.2, 17.5),
(43, 'B21', 92900, NULL, NULL, '', '', 12, 4.2, 159, 4, 5, 3, '', 'F', '2019-10-14 13:58:27', NULL, 'Y', 3, 0, 1, 3, 1, 4.2, 17.5),
(44, 'B22', 92900, NULL, NULL, '', '', 12, 4.2, 159, 4, 5, 3, '', 'F', '2019-10-14 13:58:27', NULL, 'Y', 3, 0, 1, 3, 1, 4.2, 17.5),
(45, 'B23', 92900, NULL, NULL, '', '', 12, 4.2, 159, 4, 5, 3, '', 'F', '2019-10-14 13:58:27', NULL, 'Y', 3, 0, 1, 3, 1, 4.2, 17.5),
(46, 'B24', 92900, NULL, NULL, '', '', 12, 4.2, 159, 4, 5, 3, '', 'F', '2019-10-14 13:58:27', NULL, 'Y', 3, 0, 1, 3, 1, 4.2, 17.5),
(47, 'B25', 92900, NULL, NULL, '', '', 12, 4.2, 159, 4, 5, 3, '', 'F', '2019-10-14 13:58:27', NULL, 'Y', 3, 0, 1, 3, 1, 4.2, 17.5),
(48, 'BB26', 125415, NULL, '', '', '', 12, 4.2, 159, 4, 5, 3, '', 'F', '2019-10-14 13:58:41', '2019-10-14 13:59:34', 'Y', 3, 3, 1, 3, 1, 4.2, 17.5),
(49, 'BB27', 125415, NULL, NULL, '', '', 12, 4.2, 159, 4, 5, 3, '', 'F', '2019-10-14 13:59:48', NULL, 'Y', 3, 0, 1, 3, 1, 4.2, 17.5),
(50, 'B28', 92900, NULL, '', '', '', 12, 4.2, 159, 4, 5, 3, '', 'F', '2019-10-14 14:00:05', '2019-10-14 14:00:24', 'Y', 3, 3, 1, 3, 1, 4.2, 17.5),
(51, 'B29', 92900, NULL, NULL, '', '', 12, 4.2, 159, 4, 5, 3, '', 'F', '2019-10-14 14:00:49', NULL, 'Y', 3, 0, 1, 3, 1, 4.2, 17.5),
(52, 'B30', 92900, NULL, NULL, '', '', 12, 4.2, 159, 4, 5, 3, '', 'F', '2019-10-14 14:00:49', NULL, 'Y', 3, 0, 1, 3, 1, 4.2, 17.5),
(53, 'B31', 92900, NULL, NULL, '', '', 12, 4.2, 159, 4, 5, 3, '', 'F', '2019-10-14 14:00:49', NULL, 'Y', 3, 0, 1, 3, 1, 4.2, 17.5),
(54, 'B32', 92900, NULL, NULL, '', '', 12, 4.2, 159, 4, 5, 3, '', 'F', '2019-10-14 14:00:49', NULL, 'Y', 3, 0, 1, 3, 1, 4.2, 17.5),
(55, 'B33', 92900, NULL, NULL, '', '', 12, 4.2, 159, 4, 5, 3, '', 'F', '2019-10-14 14:00:49', NULL, 'Y', 3, 0, 1, 3, 1, 4.2, 17.5),
(56, 'B34', 92900, NULL, NULL, '', '', 12, 4.2, 159, 4, 5, 3, '', 'F', '2019-10-14 14:00:49', NULL, 'Y', 3, 0, 1, 3, 1, 4.2, 17.5),
(57, 'B35', 92900, NULL, NULL, '', '', 12, 4.2, 159, 4, 5, 3, '', 'F', '2019-10-14 14:00:49', NULL, 'Y', 3, 0, 1, 3, 1, 4.2, 17.5),
(58, 'B36', 92900, NULL, NULL, '', '', 12, 4.2, 159, 4, 5, 3, '', 'F', '2019-10-14 14:00:49', NULL, 'Y', 3, 0, 1, 3, 1, 4.2, 17.5),
(59, 'B37', 92900, NULL, NULL, '', '', 12, 4.2, 159, 4, 5, 3, '', 'F', '2019-10-14 14:00:49', NULL, 'Y', 3, 0, 1, 3, 1, 4.2, 17.5),
(60, 'B38', 92900, NULL, NULL, '', '', 12, 4.2, 159, 4, 5, 3, '', 'F', '2019-10-14 14:00:49', NULL, 'Y', 3, 0, 1, 3, 1, 4.2, 17.5),
(61, 'B39', 92900, NULL, NULL, '', '', 12, 4.2, 159, 4, 5, 3, '', 'F', '2019-10-14 14:00:49', NULL, 'Y', 3, 0, 1, 3, 1, 4.2, 17.5),
(62, 'B40', 92900, NULL, NULL, '', '', 12, 4.2, 159, 4, 5, 3, '', 'F', '2019-10-14 14:00:49', NULL, 'Y', 3, 0, 1, 3, 1, 4.2, 17.5),
(63, 'B41', 92900, NULL, NULL, '', '', 12, 4.2, 159, 4, 5, 3, '', 'F', '2019-10-14 14:00:49', NULL, 'Y', 3, 0, 1, 3, 1, 4.2, 17.5),
(64, 'B42', 92900, NULL, NULL, '', '', 12, 4.2, 159, 4, 5, 3, '', 'F', '2019-10-14 14:00:49', NULL, 'Y', 3, 0, 1, 3, 1, 4.2, 17.5),
(65, 'BB43', 0, NULL, '', '', '', 12, 4.2, 159, 4, 5, 3, 'មិនទាន់ចេញលក់', 'F', '2019-10-14 14:01:14', '2019-10-14 14:01:43', 'Y', 3, 3, 1, 3, 1, 4.2, 17.5),
(66, 'CC1', 120015, NULL, '', '', '', 12, 4.2, 159, 4, 5, 3, '', 'F', '2019-10-14 14:02:01', '2019-10-14 14:03:12', 'Y', 3, 3, 1, 3, 1, 4.2, 17.5),
(67, 'C2', 88900, NULL, '', '', '', 12, 4.2, 159, 4, 5, 3, '', 'F', '2019-10-14 14:02:48', '2019-10-14 14:03:04', 'Y', 3, 3, 1, 3, 1, 4.2, 17.5),
(68, 'C3', 88900, NULL, NULL, '', '', 12, 4.2, 159, 4, 5, 3, '', 'F', '2019-10-14 14:03:27', NULL, 'Y', 3, 0, 1, 3, 1, 4.2, 17.5),
(69, 'C4', 88900, NULL, NULL, '', '', 12, 4.2, 159, 4, 5, 3, '', 'F', '2019-10-14 14:03:27', NULL, 'Y', 3, 0, 1, 3, 1, 4.2, 17.5),
(70, 'C5', 88900, NULL, NULL, '', '', 12, 4.2, 159, 4, 5, 3, '', 'F', '2019-10-14 14:03:27', NULL, 'Y', 3, 0, 1, 3, 1, 4.2, 17.5),
(71, 'C6', 88900, NULL, NULL, '', '', 12, 4.2, 159, 4, 5, 3, '', 'F', '2019-10-14 14:03:27', NULL, 'Y', 3, 0, 1, 3, 1, 4.2, 17.5),
(72, 'C7', 88900, NULL, NULL, '', '', 12, 4.2, 159, 4, 5, 3, '', 'F', '2019-10-14 14:03:27', NULL, 'Y', 3, 0, 1, 3, 1, 4.2, 17.5),
(73, 'C8', 88900, NULL, NULL, '', '', 12, 4.2, 159, 4, 5, 3, '', 'F', '2019-10-14 14:03:27', NULL, 'Y', 3, 0, 1, 3, 1, 4.2, 17.5),
(74, 'C9', 88900, NULL, NULL, '', '', 12, 4.2, 159, 4, 5, 3, '', 'F', '2019-10-14 14:03:27', NULL, 'Y', 3, 0, 1, 3, 1, 4.2, 17.5),
(75, 'C10', 88900, NULL, NULL, '', '', 12, 4.2, 159, 4, 5, 3, '', 'F', '2019-10-14 14:03:27', NULL, 'Y', 3, 0, 1, 3, 1, 4.2, 17.5),
(76, 'C11', 88900, NULL, NULL, '', '', 12, 4.2, 159, 4, 5, 3, '', 'F', '2019-10-14 14:03:27', NULL, 'Y', 3, 0, 1, 3, 1, 4.2, 17.5),
(77, 'CC12', 120015, NULL, '', '', '', 12, 4.2, 159, 4, 5, 3, '', 'F', '2019-10-14 14:03:27', '2019-10-14 14:03:45', 'Y', 3, 3, 1, 3, 1, 4.2, 17.5),
(78, 'CC13', 120015, NULL, NULL, '', '', 12, 4.2, 159, 4, 5, 3, '', 'F', '2019-10-14 14:03:57', NULL, 'Y', 3, 0, 1, 3, 1, 4.2, 17.5),
(79, 'C14', 88900, NULL, '', '', '', 12, 4.2, 159, 4, 5, 3, '', 'F', '2019-10-14 14:07:48', '2019-10-14 14:08:07', 'Y', 3, 3, 1, 3, 1, 4.2, 17.5),
(80, 'C15', 88900, NULL, NULL, '', '', 12, 4.2, 159, 4, 5, 3, '', 'F', '2019-10-14 14:08:25', NULL, 'Y', 3, 0, 1, 3, 1, 4.2, 17.5),
(81, 'C16', 88900, NULL, NULL, '', '', 12, 4.2, 159, 4, 5, 3, '', 'F', '2019-10-14 14:08:25', NULL, 'Y', 3, 0, 1, 3, 1, 4.2, 17.5),
(82, 'C17', 88900, NULL, NULL, '', '', 12, 4.2, 159, 4, 5, 3, '', 'F', '2019-10-14 14:08:25', NULL, 'Y', 3, 0, 1, 3, 1, 4.2, 17.5),
(83, 'C18', 88900, NULL, NULL, '', '', 12, 4.2, 159, 4, 5, 3, '', 'F', '2019-10-14 14:08:26', NULL, 'Y', 3, 0, 1, 3, 1, 4.2, 17.5),
(84, 'C19', 88900, NULL, NULL, '', '', 12, 4.2, 159, 4, 5, 3, '', 'F', '2019-10-14 14:08:26', NULL, 'Y', 3, 0, 1, 3, 1, 4.2, 17.5),
(85, 'C20', 88900, NULL, NULL, '', '', 12, 4.2, 159, 4, 5, 3, '', 'F', '2019-10-14 14:08:26', NULL, 'Y', 3, 0, 1, 3, 1, 4.2, 17.5),
(86, 'C21', 88900, NULL, NULL, '', '', 12, 4.2, 159, 4, 5, 3, '', 'F', '2019-10-14 14:08:26', NULL, 'Y', 3, 0, 1, 3, 1, 4.2, 17.5),
(87, 'C22', 88900, NULL, NULL, '', '', 12, 4.2, 159, 4, 5, 3, '', 'F', '2019-10-14 14:08:26', NULL, 'Y', 3, 0, 1, 3, 1, 4.2, 17.5),
(88, 'C23', 88900, NULL, NULL, '', '', 12, 4.2, 159, 4, 5, 3, '', 'F', '2019-10-14 14:08:26', NULL, 'Y', 3, 0, 1, 3, 1, 4.2, 17.5),
(89, 'C24', 88900, NULL, NULL, '', '', 12, 4.2, 159, 4, 5, 3, '', 'F', '2019-10-14 14:08:26', NULL, 'Y', 3, 0, 1, 3, 1, 4.2, 17.5),
(90, 'C25', 88900, NULL, NULL, '', '', 12, 4.2, 159, 4, 5, 3, '', 'F', '2019-10-14 14:08:26', NULL, 'Y', 3, 0, 1, 3, 1, 4.2, 17.5),
(91, 'CC26', 120015, NULL, '', '', '', 12, 4.2, 159, 4, 5, 3, '', 'F', '2019-10-14 14:08:26', '2019-10-14 14:08:44', 'Y', 3, 3, 1, 3, 1, 4.2, 17.5),
(92, 'DD1', 120015, NULL, '', '', '', 12, 4.2, 159, 4, 5, 3, '', 'F', '2019-10-14 14:17:16', '2019-10-14 14:17:45', 'Y', 3, 3, 1, 3, 1, 4.2, 17.5),
(93, 'D2', 0, NULL, '', '', '', 12, 4.2, 159, 4, 5, 3, '', 'F', '2019-10-14 14:17:56', '2019-10-14 14:18:27', 'Y', 3, 3, 1, 3, 1, 4.2, 17.5),
(94, 'D3', 88900, NULL, '', '', '', 12, 4.2, 159, 4, 5, 3, '', 'F', '2019-10-14 14:18:35', '2019-10-14 14:18:46', 'Y', 3, 3, 1, 3, 1, 4.2, 17.5),
(95, 'D4', 88900, NULL, NULL, '', '', 12, 4.2, 159, 4, 5, 3, '', 'F', '2019-10-14 14:19:04', NULL, 'Y', 3, 0, 1, 3, 1, 4.2, 17.5),
(96, 'D5', 88900, NULL, NULL, '', '', 12, 4.2, 159, 4, 5, 3, '', 'F', '2019-10-14 14:19:05', NULL, 'Y', 3, 0, 1, 3, 1, 4.2, 17.5),
(97, 'D6', 88900, NULL, NULL, '', '', 12, 4.2, 159, 4, 5, 3, '', 'F', '2019-10-14 14:19:05', NULL, 'Y', 3, 0, 1, 3, 1, 4.2, 17.5),
(98, 'D7', 88900, NULL, NULL, '', '', 12, 4.2, 159, 4, 5, 3, '', 'F', '2019-10-14 14:19:05', NULL, 'Y', 3, 0, 1, 3, 1, 4.2, 17.5),
(99, 'D8', 88900, NULL, NULL, '', '', 12, 4.2, 159, 4, 5, 3, '', 'F', '2019-10-14 14:19:05', NULL, 'Y', 3, 0, 1, 3, 1, 4.2, 17.5),
(100, 'D9', 88900, NULL, NULL, '', '', 12, 4.2, 159, 4, 5, 3, '', 'F', '2019-10-14 14:19:05', NULL, 'Y', 3, 0, 1, 3, 1, 4.2, 17.5),
(101, 'D10', 88900, NULL, NULL, '', '', 12, 4.2, 159, 4, 5, 3, '', 'F', '2019-10-14 14:19:05', NULL, 'Y', 3, 0, 1, 3, 1, 4.2, 17.5),
(102, 'D11', 88900, NULL, NULL, '', '', 12, 4.2, 159, 4, 5, 3, '', 'F', '2019-10-14 14:19:05', NULL, 'Y', 3, 0, 1, 3, 1, 4.2, 17.5),
(103, 'D12', 88900, NULL, NULL, '', '', 12, 4.2, 159, 4, 5, 3, '', 'F', '2019-10-14 14:19:05', NULL, 'Y', 3, 0, 1, 3, 1, 4.2, 17.5),
(104, 'D13', 88900, NULL, NULL, '', '', 12, 4.2, 159, 4, 5, 3, '', 'F', '2019-10-14 14:19:05', NULL, 'Y', 3, 0, 1, 3, 1, 4.2, 17.5),
(105, 'D14', 88900, NULL, NULL, '', '', 12, 4.2, 159, 4, 5, 3, '', 'F', '2019-10-14 14:19:05', NULL, 'Y', 3, 0, 1, 3, 1, 4.2, 17.5),
(106, 'D15', 88900, NULL, NULL, '', '', 12, 4.2, 159, 4, 5, 3, '', 'F', '2019-10-14 14:19:05', NULL, 'Y', 3, 0, 1, 3, 1, 4.2, 17.5),
(107, 'DD16', 143640, NULL, '', '', '', 12, 4.2, 159, 4, 5, 3, '', 'F', '2019-10-14 14:19:05', '2019-10-14 14:19:32', 'Y', 3, 3, 1, 3, 1, 4.2, 17.5),
(108, 'DD17', 143640, NULL, NULL, '', '', 12, 4.2, 159, 4, 5, 3, '', 'F', '2019-10-14 14:24:49', '2019-10-14 14:25:11', 'N', 3, 3, 1, 3, 1, 4.2, 17.5),
(109, 'VV1', 159000, NULL, '', '', '', 11, 8, 88, 4, 3, 2, '', 'F', '2019-10-14 14:27:32', NULL, 'Y', 3, 0, 1, 1, 1, 10, 20),
(110, 'V2', 149000, NULL, '', '', '', 11, 8, 88, 4, 3, 2, '', 'F', '2019-10-14 14:27:43', '2019-10-14 14:28:01', 'Y', 3, 3, 1, 1, 1, 10, 20),
(111, 'V-3A', 149000, 0, '', '', '', 11, 8, 88, 4, 3, 2, '', 'S', '2019-10-14 14:28:24', '2019-10-24 14:18:07', 'Y', 3, 3, 1, 1, 1, 10, 20),
(112, 'V-3B', 149000, 0, '', '', '', 11, 8, 88, 4, 3, 2, '', 'S', '2019-10-14 14:28:24', '2019-10-24 14:18:21', 'Y', 3, 3, 1, 1, 1, 10, 20),
(113, 'V-3C', 149000, 0, '', '', '', 11, 8, 88, 4, 3, 2, 'V-3C', 'S', '2019-10-14 14:28:24', '2019-10-24 14:18:38', 'Y', 3, 3, 1, 1, 1, 10, 20),
(114, 'V6', 149000, 0, NULL, '', '', 11, 8, 88, 4, 3, 2, '', 'S', '2019-10-14 14:28:24', '2019-10-23 15:45:36', 'Y', 3, 3, 1, 1, 1, 10, 20),
(115, 'V7', 149000, 0, NULL, '', '', 11, 8, 88, 4, 3, 2, '', 'S', '2019-10-14 14:28:24', '2019-10-24 09:35:08', 'Y', 3, 3, 1, 1, 1, 10, 20),
(116, 'VV8', 166000, 0, '', '', '', 11, 8, 88, 4, 3, 2, '', 'S', '2019-10-14 14:28:24', '2019-10-24 09:56:48', 'Y', 3, 3, 1, 1, 1, 10, 20),
(117, 'VV9', 159000, 0, '', '', '', 11, 8, 88, 4, 3, 2, '', 'S', '2019-10-14 14:28:24', '2019-10-24 10:08:18', 'Y', 3, 3, 1, 1, 1, 10, 20),
(118, 'V10', 149000, 0, '', '', '', 11, 8, 88, 4, 3, 2, '', 'S', '2019-10-14 14:29:50', '2019-10-24 10:20:40', 'Y', 3, 3, 1, 1, 1, 10, 20),
(119, 'V11', 149000, NULL, NULL, '', '', 11, 8, 88, 4, 3, 2, '', 'F', '2019-10-14 14:30:21', NULL, 'Y', 3, 0, 1, 1, 1, 10, 20),
(120, 'V12', 149000, 0, NULL, '', '', 11, 8, 88, 4, 3, 2, '', 'S', '2019-10-14 14:30:21', '2019-10-24 10:43:30', 'Y', 3, 3, 1, 1, 1, 10, 20),
(121, 'V13/14', 198000, 0, '', '', '', 12, 11, 132, 4, 5, 2, 'វីឡាទោល២ផ្ទះ បញ្ជូលធ្វើវិឡាព្រីនស៍១ផ្ទះ', 'S', '2019-10-14 14:30:21', '2019-10-24 14:16:05', 'Y', 3, 3, 1, 4, 1, 20, 20),
(122, 'V14', 149000, NULL, NULL, '', '', 11, 8, 88, 4, 3, 2, '', 'F', '2019-10-14 14:30:21', '2019-10-24 12:22:55', 'N', 3, 3, 1, 1, 1, 10, 20),
(123, 'V15/16', 219000, 0, '', '', '', 12, 11, 132, 4, 5, 2, 'វីឡាទោល២ផ្ទះ បញ្ជូលធ្វើវិឡាព្រីនស៍១ផ្ទះ', 'S', '2019-10-14 14:30:21', '2019-10-25 14:22:07', 'Y', 3, 3, 1, 4, 1, 20, 20),
(124, 'V16', 149000, NULL, NULL, '', '', 11, 8, 88, 4, 3, 2, '', 'F', '2019-10-14 14:30:21', '2019-10-24 12:22:55', 'N', 3, 3, 1, 1, 1, 10, 20),
(125, 'V17', 149000, NULL, NULL, '', '', 11, 8, 88, 4, 3, 2, '', 'F', '2019-10-14 14:30:21', NULL, 'Y', 3, 0, 1, 1, 1, 10, 20),
(126, 'VV18', 159000, NULL, '', '', '', 11, 8, 88, 4, 3, 2, '', 'F', '2019-10-14 14:30:30', '2019-10-14 14:31:58', 'Y', 3, 3, 1, 1, 1, 10, 20),
(127, 'VVV19', 322400, NULL, '', '', '', 11, 12, 132, 4, 5, 2, '', 'F', '2019-10-14 14:34:33', NULL, 'Y', 3, 0, 1, 4, 1, 20, 20),
(128, 'V20', 149000, 0, '', '', '', 11, 8, 88, 4, 3, 2, '', 'S', '2019-10-14 14:34:49', '2019-10-24 11:43:01', 'Y', 3, 3, 1, 1, 1, 10, 20),
(129, 'V21', 149000, 0, NULL, '', '', 11, 8, 88, 4, 3, 2, '', 'S', '2019-10-14 14:36:18', '2019-10-24 12:12:49', 'Y', 3, 3, 1, 1, 1, 10, 20),
(130, 'VV22', 159000, 0, '', '', '', 11, 8, 88, 4, 3, 2, '', 'S', '2019-10-14 14:36:35', '2019-10-24 11:59:51', 'Y', 3, 3, 1, 1, 1, 10, 20),
(131, 'VV23/24', 268000, NULL, '', '', '', 12, 11, 132, 4, 5, 2, ' វីឡាទោល2ផ្ទះ បញ្ជូលធ្វើវីឡាព្រីនស៍១ផ្ទះ', 'F', '2019-10-14 14:37:11', '2019-10-25 14:21:50', 'Y', 3, 3, 1, 4, 1, 20, 20),
(132, 'V24', 149000, NULL, '', '', '', 11, 8, 88, 4, 3, 2, '', 'F', '2019-10-14 14:37:23', '2019-10-24 12:22:55', 'N', 3, 3, 1, 1, 1, 10, 20),
(133, 'V25', 149000, NULL, NULL, '', '', 11, 8, 88, 4, 3, 2, '', 'F', '2019-10-14 14:37:53', NULL, 'Y', 3, 0, 1, 1, 1, 10, 20),
(134, 'V26', 149000, 0, NULL, '', '', 11, 8, 88, 4, 3, 2, '', 'S', '2019-10-14 14:37:53', '2019-10-24 14:52:59', 'Y', 3, 3, 1, 1, 1, 10, 20),
(135, 'V27', 149000, 0, NULL, '', '', 11, 8, 88, 4, 3, 2, '', 'S', '2019-10-14 14:37:53', '2019-10-24 15:07:13', 'Y', 3, 3, 1, 1, 1, 10, 20),
(136, 'V28', 177400, NULL, '', '', '', 11, 8, 88, 4, 3, 2, '', 'F', '2019-10-14 14:37:53', '2019-10-14 14:41:01', 'Y', 3, 3, 1, 1, 1, 10, 20),
(137, 'V29', 149000, 0, NULL, '', '', 11, 8, 88, 4, 3, 2, '', 'S', '2019-10-14 14:37:53', '2019-10-24 15:27:27', 'Y', 3, 3, 1, 1, 1, 10, 20),
(138, 'V30', 149000, NULL, NULL, '', '', 11, 8, 88, 4, 3, 2, '', 'B', '2019-10-14 14:37:53', NULL, 'Y', 3, 0, 1, 1, 1, 10, 20),
(139, 'V31', 149000, 0, NULL, '', '', 11, 8, 88, 4, 3, 2, '', 'S', '2019-10-14 14:37:53', '2019-11-06 16:01:40', 'Y', 3, 3, 1, 1, 1, 10, 20),
(140, 'VV32', 159000, NULL, '', '', '', 11, 8, 88, 4, 3, 2, '', 'F', '2019-10-14 14:38:05', '2019-10-14 14:38:22', 'Y', 3, 3, 1, 1, 1, 10, 20),
(141, 'VVV33', 381000, NULL, '', '', '', 11, 12, 132, 4, 5, 2, '', 'F', '2019-10-14 14:39:03', '2019-10-14 14:40:36', 'Y', 3, 3, 1, 4, 1, 20, 20),
(142, 'V34', 169500, NULL, '', '', '', 11, 8, 88, 4, 3, 2, '', 'F', '2019-10-14 14:42:08', '2019-10-14 14:42:49', 'Y', 3, 3, 1, 1, 1, 10, 20),
(143, 'V35', 169500, NULL, '', '', '', 11, 8, 88, 4, 3, 2, '', 'F', '2019-10-14 14:43:17', '2019-10-14 14:43:35', 'Y', 3, 3, 1, 1, 1, 10, 20),
(144, 'V36', 158500, NULL, '', '', '', 11, 8, 88, 4, 3, 2, '', 'F', '2019-10-14 14:43:17', '2019-10-14 14:43:53', 'Y', 3, 3, 1, 1, 1, 10, 20),
(145, 'V37', 153000, NULL, '', '', '', 11, 8, 88, 4, 3, 2, '', 'F', '2019-10-14 14:43:17', '2019-10-14 14:44:31', 'Y', 3, 3, 1, 1, 1, 10, 20),
(146, 'V38', 145000, NULL, '', '', '', 11, 8, 88, 4, 3, 2, '', 'F', '2019-10-14 14:43:17', '2019-10-14 14:44:15', 'Y', 3, 3, 1, 1, 1, 10, 20),
(147, 'V39', 149000, NULL, '', '', '', 11, 8, 88, 4, 3, 2, '', 'F', '2019-10-14 14:43:17', '2019-10-14 14:44:50', 'Y', 3, 3, 1, 1, 1, 10, 20),
(148, 'VV40', 159000, NULL, '', '', '', 11, 8, 88, 4, 3, 2, '', 'F', '2019-10-14 14:45:03', '2019-10-14 14:45:48', 'Y', 3, 3, 1, 1, 1, 10, 20),
(149, 'VV41', 159000, NULL, NULL, '', '', 11, 8, 88, 4, 3, 2, '', 'F', '2019-10-14 14:45:57', '2019-10-25 14:21:29', 'N', 3, 3, 1, 1, 1, 10, 20),
(150, 'VV41/42', 298000, NULL, '', '', '', 12, 11, 132, 4, 5, 2, 'ផ្ទះវីឡាទោល២ បញ្ជូលធ្វើវីឡាព្រីនស៍១', 'B', '2019-10-14 14:46:14', '2019-10-25 14:21:11', 'Y', 3, 3, 1, 4, 1, 20, 20),
(151, 'V43', 149000, NULL, NULL, '', '', 11, 8, 88, 4, 3, 2, '', 'F', '2019-10-14 14:46:51', NULL, 'Y', 3, 0, 1, 1, 1, 10, 20),
(152, 'V44', 149000, NULL, NULL, '', '', 11, 8, 88, 4, 3, 2, '', 'F', '2019-10-14 14:47:02', NULL, 'Y', 3, 0, 1, 1, 1, 10, 20),
(153, 'V45', 149000, NULL, '', '', '', 11, 8, 88, 4, 3, 2, '', 'F', '2019-10-14 14:47:02', '2019-10-25 14:20:47', 'Y', 3, 3, 1, 1, 1, 10, 20);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_salary`
--

DROP TABLE IF EXISTS `tbl_salary`;
CREATE TABLE IF NOT EXISTS `tbl_salary` (
  `sal_id` int(11) NOT NULL AUTO_INCREMENT,
  `sal_start_dt` date DEFAULT NULL,
  `sal_end_dt` date DEFAULT NULL,
  `sal_month` date DEFAULT NULL,
  `sal_amt` double DEFAULT NULL,
  `sal_comm` double DEFAULT NULL,
  `sal_overtime` double DEFAULT NULL,
  `sal_get_date` date DEFAULT NULL,
  `sta_id` int(11) DEFAULT NULL,
  `sal_status` varchar(1) DEFAULT NULL,
  `regDt` datetime DEFAULT NULL,
  `upDt` datetime DEFAULT NULL,
  `useYn` varchar(1) DEFAULT NULL,
  `regUsr` int(11) DEFAULT NULL,
  `upUsr` int(11) DEFAULT NULL,
  `com_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`sal_id`)
) ENGINE=MyISAM DEFAULT CHARSET=armscii8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
  `con_type_id` int(11) DEFAULT NULL,
  `sell_inst_yn` varchar(1) DEFAULT NULL,
  `sell_tran_price` double DEFAULT NULL,
  PRIMARY KEY (`sell_id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_sell`
--

INSERT INTO `tbl_sell` (`sell_id`, `sell_date`, `sell_total_price`, `sell_dis_per`, `sell_dis_amt`, `sell_price_before_dis`, `sell_des`, `sell_code`, `con_id`, `rec_id`, `seller_id`, `regDt`, `upDt`, `useYn`, `regUsr`, `upUsr`, `com_id`, `con_type_id`, `sell_inst_yn`, `sell_tran_price`) VALUES
(1, '2019-08-06', 159000, NULL, NULL, NULL, 'បន្ថែម:ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែងទូរទូរទស្សន៍           ', '000001', 7, NULL, 7, '2019-10-22 16:38:03', NULL, 'Y', 2, NULL, 1, 1, 'Y', 300),
(2, '2019-06-17', 99000, NULL, NULL, NULL, 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', '000002', 0, NULL, 15, '2019-10-23 14:21:16', NULL, 'Y', 3, NULL, 1, 1, 'Y', 300),
(3, '2019-06-17', 99000, NULL, NULL, NULL, 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', '000003', 0, NULL, 15, '2019-10-23 14:58:36', NULL, 'Y', 3, NULL, 1, 1, 'Y', 300),
(4, '2019-06-17', 99000, NULL, NULL, NULL, 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', '000004', 0, NULL, 15, '2019-10-23 15:14:17', NULL, 'Y', 3, NULL, 1, 1, 'Y', 300),
(5, '2019-07-01', 99000, NULL, NULL, NULL, 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', '000005', 9, NULL, 5, '2019-10-23 15:35:16', '2019-10-23 15:39:44', 'N', 3, 3, 1, 1, 'Y', 300),
(6, '2019-07-01', 99000, NULL, NULL, NULL, 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', '000006', 10, NULL, 7, '2019-10-23 15:45:36', NULL, 'Y', 3, NULL, 1, 1, 'Y', 300),
(7, '2019-06-24', 99000, NULL, NULL, NULL, 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', '000007', 11, NULL, 7, '2019-10-24 09:35:08', NULL, 'Y', 3, NULL, 1, 1, 'Y', 300),
(8, '2019-06-26', 122500, NULL, NULL, NULL, 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', '000008', 13, NULL, 7, '2019-10-24 09:56:48', NULL, 'Y', 3, NULL, 1, 1, 'Y', 300),
(9, '2019-07-03', 99000, NULL, NULL, NULL, 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', '000009', 14, NULL, 7, '2019-10-24 10:08:18', NULL, 'Y', 3, NULL, 1, 1, 'Y', 300),
(10, '2019-07-01', 99000, NULL, NULL, NULL, 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', '000010', 15, NULL, 7, '2019-10-24 10:20:40', NULL, 'Y', 3, NULL, 1, 1, 'Y', 300),
(11, '2019-06-24', 111000, NULL, NULL, NULL, 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', '000011', 0, NULL, 7, '2019-10-24 10:43:30', NULL, 'Y', 3, NULL, 1, 1, 'Y', 300),
(12, '2019-06-26', 198000, NULL, NULL, NULL, 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', '000012', 0, NULL, 15, '2019-10-24 11:10:08', NULL, 'Y', 3, NULL, 1, 1, 'Y', 500),
(13, '2019-06-24', 219000, NULL, NULL, NULL, ': ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី            	     ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', '000013', 0, NULL, 7, '2019-10-24 11:20:33', NULL, 'Y', 3, NULL, 1, 1, 'Y', 500),
(14, '2019-07-30', 125000, NULL, NULL, NULL, 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', '000014', 16, NULL, 16, '2019-10-24 11:43:01', NULL, 'Y', 3, NULL, 1, 2, 'N', 500),
(15, '2019-07-25', 135000, NULL, NULL, NULL, 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', '000015', 0, NULL, 15, '2019-10-24 11:59:51', NULL, 'Y', 3, NULL, 1, 3, 'N', 500),
(16, '2019-08-01', 115000, NULL, NULL, NULL, 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', '000016', 17, NULL, 16, '2019-10-24 12:12:49', NULL, 'Y', 3, NULL, 1, 1, 'Y', 500),
(17, '2019-08-07', 125000, NULL, NULL, NULL, 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', '000017', 18, NULL, 17, '2019-10-24 14:52:59', NULL, 'Y', 3, NULL, 1, 1, 'Y', 500),
(18, '2019-08-05', 115000, NULL, NULL, NULL, '', '000018', 0, NULL, 16, '2019-10-24 15:07:13', NULL, 'Y', 3, NULL, 1, 1, 'Y', 500),
(19, '2019-10-05', 135000, NULL, NULL, NULL, 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', '000019', 19, NULL, 14, '2019-10-24 15:27:27', NULL, 'Y', 3, NULL, 1, 1, 'Y', 500),
(20, '2019-10-11', 135000, NULL, NULL, NULL, 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែងទូរទូរទស្សន៍', '000020', 8, NULL, 13, '2019-10-28 15:25:33', NULL, 'Y', 3, NULL, 1, 1, 'Y', 300),
(21, '2019-10-01', 120000, NULL, NULL, NULL, 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង ទូរទូរទស្សន៍', '000021', 0, NULL, 15, '2019-10-28 15:40:02', NULL, 'Y', 3, NULL, 1, 1, 'Y', 300),
(22, '2019-10-01', 120000, NULL, NULL, NULL, 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង ទូរទូរទស្សន៍', '000022', 0, NULL, 15, '2019-10-28 15:53:55', NULL, 'Y', 3, NULL, 1, 1, 'Y', 300),
(23, '2019-07-01', 130000, NULL, NULL, NULL, 'បន្ថែម : ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង ទូរទូរទស្សន៍', '000023', 5, NULL, 8, '2019-10-28 16:08:43', '2019-10-28 16:13:23', 'N', 3, 3, 1, 4, 'N', 300),
(24, '2019-07-08', 130000, NULL, NULL, NULL, 'បន្ថែម : ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង ទូរទូរទស្សន៍', '000024', 5, NULL, 8, '2019-10-28 16:14:32', NULL, 'Y', 3, NULL, 1, 4, 'N', 300),
(25, '2019-07-21', 129000, NULL, NULL, NULL, 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង ទូរទូរទស្សន៍', '000025', 22, NULL, 7, '2019-10-28 16:33:40', NULL, 'Y', 3, NULL, 1, 1, 'Y', 300),
(26, '2019-07-21', 129000, NULL, NULL, NULL, 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង ទូរទូរទស្សន៍', '000026', 23, NULL, 7, '2019-10-28 16:36:19', NULL, 'Y', 3, NULL, 1, 1, 'Y', 300),
(27, '2019-11-15', 129000, NULL, NULL, NULL, 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែងទូរទូរទស្សន៍', '000027', 24, NULL, 7, '2019-10-29 11:42:24', NULL, 'Y', 3, NULL, 1, 1, 'Y', 300),
(28, '2019-11-05', 129000, NULL, NULL, NULL, 'ទូរចង្ក្រានលើ-ក្រោម ចង្ក្រានអគ្គីសនី ម៉ាស៊ីនបឺតផ្សែង  Minibar  ទូរទូរទស្សន៍', '000028', 25, NULL, 14, '2019-11-06 16:01:40', NULL, 'Y', 3, NULL, 1, 1, 'Y', 500);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sell_customer`
--

DROP TABLE IF EXISTS `tbl_sell_customer`;
CREATE TABLE IF NOT EXISTS `tbl_sell_customer` (
  `sell_id` int(11) NOT NULL,
  `cus_id` int(11) NOT NULL,
  `regDt` datetime DEFAULT NULL,
  `upDt` datetime DEFAULT NULL,
  `useYn` varchar(1) NOT NULL,
  `regUsr` int(11) NOT NULL,
  `upUsr` int(11) NOT NULL,
  `com_id` int(11) NOT NULL,
  `sell_cus_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`sell_id`,`cus_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_sell_customer`
--

INSERT INTO `tbl_sell_customer` (`sell_id`, `cus_id`, `regDt`, `upDt`, `useYn`, `regUsr`, `upUsr`, `com_id`, `sell_cus_order`) VALUES
(1, 13, '2019-10-22 16:38:03', NULL, 'Y', 2, 0, 1, 1),
(2, 22, '2019-10-23 14:21:16', NULL, 'Y', 3, 0, 1, 1),
(3, 23, '2019-10-23 14:58:36', NULL, 'Y', 3, 0, 1, 1),
(4, 24, '2019-10-23 15:14:17', NULL, 'Y', 3, 0, 1, 1),
(5, 25, '2019-10-23 15:35:16', NULL, 'Y', 3, 0, 1, 1),
(6, 25, '2019-10-23 15:45:36', NULL, 'Y', 3, 0, 1, 1),
(7, 26, '2019-10-24 09:35:08', NULL, 'Y', 3, 0, 1, 1),
(8, 27, '2019-10-24 09:56:48', NULL, 'Y', 3, 0, 1, 1),
(9, 28, '2019-10-24 10:08:19', NULL, 'Y', 3, 0, 1, 1),
(10, 29, '2019-10-24 10:20:40', NULL, 'Y', 3, 0, 1, 1),
(11, 31, '2019-10-24 10:43:30', NULL, 'Y', 3, 0, 1, 1),
(12, 32, '2019-10-24 11:10:08', NULL, 'Y', 3, 0, 1, 1),
(13, 33, '2019-10-24 11:20:33', NULL, 'Y', 3, 0, 1, 1),
(14, 35, '2019-10-24 11:43:01', NULL, 'Y', 3, 0, 1, 1),
(15, 38, '2019-10-24 11:59:51', NULL, 'Y', 3, 0, 1, 1),
(15, 39, '2019-10-24 11:59:51', NULL, 'Y', 3, 0, 1, 2),
(16, 36, '2019-10-24 12:12:49', NULL, 'Y', 3, 0, 1, 1),
(16, 37, '2019-10-24 12:12:49', NULL, 'Y', 3, 0, 1, 2),
(17, 45, '2019-10-24 14:52:59', NULL, 'Y', 3, 0, 1, 1),
(18, 36, '2019-10-24 15:07:13', NULL, 'Y', 3, 0, 1, 1),
(18, 37, '2019-10-24 15:07:13', NULL, 'Y', 3, 0, 1, 2),
(19, 46, '2019-10-24 15:27:27', NULL, 'Y', 3, 0, 1, 1),
(19, 47, '2019-10-24 15:27:27', NULL, 'Y', 3, 0, 1, 2),
(20, 15, '2019-10-28 15:25:33', NULL, 'Y', 3, 0, 1, 1),
(21, 16, '2019-10-28 15:40:02', NULL, 'Y', 3, 0, 1, 1),
(22, 16, '2019-10-28 15:53:55', NULL, 'Y', 3, 0, 1, 1),
(23, 10, '2019-10-28 16:08:43', NULL, 'Y', 3, 0, 1, 1),
(24, 10, '2019-10-28 16:14:32', NULL, 'Y', 3, 0, 1, 1),
(25, 14, '2019-10-28 16:33:40', NULL, 'Y', 3, 0, 1, 1),
(26, 14, '2019-10-28 16:36:19', NULL, 'Y', 3, 0, 1, 1),
(27, 50, '2019-10-29 11:42:25', NULL, 'Y', 3, 0, 1, 1),
(28, 8, '2019-11-06 16:01:40', NULL, 'Y', 3, 0, 1, 1),
(28, 51, '2019-11-06 16:01:40', NULL, 'Y', 3, 0, 1, 2);

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
  `pro_sell_price_desc` text,
  `pro_sell_balance_price_desc` text,
  `pro_sell_adv_price_desc` text,
  `pro_sell_time_build` int(11) DEFAULT NULL,
  PRIMARY KEY (`pro_id`,`sell_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_sell_detail`
--

INSERT INTO `tbl_sell_detail` (`sell_id`, `pro_id`, `pro_price`, `pro_sell_price`, `regDt`, `upDt`, `useYn`, `regUsr`, `upUsr`, `com_id`, `pro_sell_price_desc`, `pro_sell_balance_price_desc`, `pro_sell_adv_price_desc`, `pro_sell_time_build`) VALUES
(1, 8, NULL, 159000, '2019-10-22 16:38:03', NULL, 'Y', 2, NULL, 1, 'ដប់ប្រាំម៉ឺនប្រាំបួនពាន់', NULL, NULL, 21),
(2, 111, NULL, 99000, '2019-10-23 14:21:16', NULL, 'Y', 3, NULL, 1, 'ប្រាំបួនម៉ឺនប្រាំបួនពាន់', NULL, NULL, 18),
(3, 112, NULL, 99000, '2019-10-23 14:58:36', NULL, 'Y', 3, NULL, 1, 'ប្រាំបួនម៉ឺនប្រាំបួនពាន់', NULL, NULL, 18),
(4, 113, NULL, 99000, '2019-10-23 15:14:17', NULL, 'Y', 3, NULL, 1, 'ប្រាំបួនម៉ឺនប្រាំបួនពាន់', NULL, NULL, 18),
(5, 114, NULL, 99000, '2019-10-23 15:35:16', NULL, 'Y', 3, NULL, 1, 'ប្រាំបួនម៉ឺនប្រាំបួនពាន់', NULL, NULL, 18),
(6, 114, NULL, 99000, '2019-10-23 15:45:36', NULL, 'Y', 3, NULL, 1, 'ប្រាំបួនម៉ឺនប្រាំបួនពាន់', NULL, NULL, 18),
(7, 115, NULL, 99000, '2019-10-24 09:35:08', NULL, 'Y', 3, NULL, 1, 'ប្រាំបួនម៉ឺនប្រាំបួនពាន់', NULL, NULL, 18),
(8, 116, NULL, 122500, '2019-10-24 09:56:48', NULL, 'Y', 3, NULL, 1, 'ដប់ពីរម៉ឺនពីរពាន់ប្រាំរយ', NULL, NULL, 18),
(9, 117, NULL, 99000, '2019-10-24 10:08:18', NULL, 'Y', 3, NULL, 1, 'ប្រាំបួនម៉ឺនប្រាំបួនពាន់', NULL, NULL, 18),
(10, 118, NULL, 99000, '2019-10-24 10:20:40', NULL, 'Y', 3, NULL, 1, 'ប្រាំបួនម៉ឺនប្រាំបួនពាន់', NULL, NULL, 18),
(11, 120, NULL, 111000, '2019-10-24 10:43:30', NULL, 'Y', 3, NULL, 1, 'ដប់មួយម៉ឺនមួយពាន់', NULL, NULL, 18),
(12, 121, NULL, 198000, '2019-10-24 11:10:08', NULL, 'Y', 3, NULL, 1, 'ដប់ប្រាំបួនម៉ឺនប្រាំបីពាន់', NULL, NULL, 18),
(13, 123, NULL, 219000, '2019-10-24 11:20:33', NULL, 'Y', 3, NULL, 1, 'ម្ភៃមួយម៉ឺនប្រាំបួនពាន់', NULL, NULL, 18),
(14, 128, NULL, 125000, '2019-10-24 11:43:01', NULL, 'Y', 3, NULL, 1, 'ដប់ពីរម៉ឺនប្រាំពាន់', NULL, NULL, 18),
(15, 130, NULL, 135000, '2019-10-24 11:59:51', NULL, 'Y', 3, NULL, 1, 'ដប់បីម៉ឺនប្រាំពាន់', NULL, NULL, 21),
(16, 129, NULL, 115000, '2019-10-24 12:12:49', NULL, 'Y', 3, NULL, 1, 'ដប់មួយម៉ឺនប្រាំពាន់', NULL, NULL, 21),
(17, 134, NULL, 125000, '2019-10-24 14:52:59', NULL, 'Y', 3, NULL, 1, 'ដប់ពីរម៉ឺនប្រាំពាន់', NULL, NULL, 21),
(18, 135, NULL, 115000, '2019-10-24 15:07:13', NULL, 'Y', 3, NULL, 1, 'ដប់មួយម៉ឺនប្រាំពាន់', NULL, NULL, 21),
(19, 137, NULL, 135000, '2019-10-24 15:27:27', NULL, 'Y', 3, NULL, 1, 'ដប់បីម៉ឺនប្រាំពាន់', NULL, NULL, 21),
(20, 9, NULL, 135000, '2019-10-28 15:25:33', NULL, 'Y', 3, NULL, 1, 'ដប់បីម៉ឺនប្រាំពាន់', NULL, NULL, 21),
(21, 16, NULL, 120000, '2019-10-28 15:40:02', NULL, 'Y', 3, NULL, 1, 'ដប់ពីរម៉ឺន', NULL, NULL, 21),
(22, 17, NULL, 120000, '2019-10-28 15:53:55', NULL, 'Y', 3, NULL, 1, 'ដប់ពីរម៉ឺន', NULL, NULL, 21),
(23, 5, NULL, 130000, '2019-10-28 16:08:43', NULL, 'Y', 3, NULL, 1, 'ដប់បីម៉ឺន', NULL, NULL, 18),
(24, 5, NULL, 130000, '2019-10-28 16:14:32', NULL, 'Y', 3, NULL, 1, 'ដប់បីម៉ឺន', NULL, NULL, 18),
(25, 14, NULL, 129000, '2019-10-28 16:33:40', NULL, 'Y', 3, NULL, 1, 'ដប់ពីរម៉ឺនប្រាំបួនពាន់', NULL, NULL, 21),
(26, 15, NULL, 129000, '2019-10-28 16:36:19', NULL, 'Y', 3, NULL, 1, 'ដប់ពីរម៉ឺនប្រាំបួនពាន់', NULL, NULL, 21),
(27, 12, NULL, 129000, '2019-10-29 11:42:24', NULL, 'Y', 3, NULL, 1, 'ដប់ពីរម៉ឺនប្រាំបួនពាន់', NULL, NULL, 21),
(28, 139, NULL, 129000, '2019-11-06 16:01:40', NULL, 'Y', 3, NULL, 1, 'ដប់ពីរម៉ឺនប្រាំបួនពាន់', NULL, NULL, 21);

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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_staff`
--

INSERT INTO `tbl_staff` (`sta_id`, `sta_nm`, `sta_nm_kh`, `sta_gender`, `sta_dob`, `sta_photo`, `sta_phone1`, `sta_phone2`, `sta_email`, `sta_addr`, `sta_des`, `sta_start_dt`, `sta_end_dt`, `regDt`, `upDt`, `useYn`, `regUsr`, `upUsr`, `pos_id`, `bra_id`, `com_id`) VALUES
(1, 'admin', NULL, '', NULL, NULL, '01023456', NULL, NULL, NULL, NULL, NULL, NULL, '2019-09-13 09:50:01', NULL, 'Y', 0, 0, 1, NULL, 1),
(2, 'Khem Narong', 'ខែមណារ៉ុង', 'F', '1998-01-05', '', '0968795226', '', '', 'Phnom Penh', '', '2019-01-07', '1970-01-01', '2019-09-13 04:47:48', '2019-09-17 14:28:41', 'Y', 2, 2, 2, 0, 1),
(3, 'Test', 'តេសតេ', 'F', '1992-01-01', '', '098767676', '', '', '', '', '2019-06-09', '1970-01-01', '2019-09-13 11:39:22', '2019-09-17 14:28:48', 'N', 2, 2, 2, 0, 1),
(4, 'EamSocheat', 'សុជាតិ', 'F', '1992-01-01', '', '010527752', '', '', 'Phnom Penh', '', '2019-01-09', '1970-01-01', '2019-09-17 15:19:31', NULL, 'Y', 3, 0, 5, 0, 1),
(5, 'Hou Sovannary', 'ហ៊ូ សុវណ្ណារី', 'F', '1994-07-02', '', '0713596209', '0966034659', '', 'Phnom Penh', '', '2019-01-04', '1970-01-01', '2019-09-17 16:35:00', '2019-10-16 13:32:39', 'Y', 3, 3, 9, 0, 1),
(6, 'Sao Nakry', 'សៅ ណាគ្រី', 'F', '1999-04-07', '', '069899800', '089553533', '', '', '', '2018-10-01', '1970-01-01', '2019-10-14 13:11:34', NULL, 'Y', 3, 0, 4, 0, 1),
(7, 'Sok Molika', 'សុខ មលិ្លកា', 'F', '1985-08-15', '', '077788889', '', '', '', '', '2018-02-01', '1970-01-01', '2019-10-14 15:10:52', '2019-10-14 15:13:03', 'Y', 3, 3, 6, 0, 1),
(8, 'Staff', 'បុគ្គលិក', 'F', '2010-01-01', '', '0962327317', '', '', '', '', '2019-01-01', '1970-01-01', '2019-10-14 15:36:29', NULL, 'Y', 3, 0, 4, 0, 1),
(9, 'Heng Channary', 'ហេង ចាន់ណារី', 'F', '2009-07-15', '', '096555555', '', '', '', '', '2019-10-01', '1970-01-01', '2019-10-14 15:58:24', NULL, 'Y', 3, 0, 5, 0, 1),
(10, 'Sok Limheng', 'សុខ លីមហេង', 'M', '1999-04-15', '', '086722664', '089855646', '', '', '', '2019-04-01', '1970-01-01', '2019-10-14 16:04:33', NULL, 'Y', 3, 0, 4, 0, 1),
(11, 'Chea Chansreyneang', 'ជា ចាន់ស្រីនាង', 'F', '1999-01-01', '', '093465468', '092465468', '', '', '', '2019-11-01', '1970-01-01', '2019-10-14 16:07:04', '2019-10-14 16:07:28', 'Y', 3, 3, 4, 0, 1),
(12, 'Heang Senghour', 'ហ៊ាង សេងហួរ', 'F', '1998-08-07', '', '0962256504', '017615049', '', 'pp', '', '2019-07-22', '1970-01-01', '2019-10-16 13:23:05', NULL, 'Y', 3, 0, 4, 0, 1),
(13, 'Ung Vuthy', 'អ៊ឹង វុទ្ធី', 'M', '1989-01-01', '', '0962188878', '011939979', '', '', '', '2019-09-02', '1970-01-01', '2019-10-16 13:27:56', NULL, 'Y', 3, 0, 8, 0, 1),
(14, 'Chea Chanheng', 'ជា ចាន់ហេង', 'M', '1992-01-01', '', '0967640609', '0767640609', '', '', '', '2019-09-02', '1970-01-01', '2019-10-16 13:36:26', NULL, 'Y', 3, 0, 7, 0, 1),
(15, 'ngeng Mothona', 'ង៉េង មិថុនា', 'M', '1977-04-15', '', '0974723333', '', '', 'ភ្នំពេញ', '', '2019-01-01', '1970-01-01', '2019-10-23 14:10:19', NULL, 'Y', 3, 0, 5, 0, 1),
(16, 'Cheng Penghab', 'ចេង ប៉េងហាប់', 'M', '1982-06-12', '', '012671111', '', '', 'ភ្នំពេញ', '', '2019-01-01', '1970-01-01', '2019-10-24 11:31:32', NULL, 'Y', 3, 0, 5, 0, 1),
(17, 'Yong Bunna', 'យ៉ុន ប៉ុនណា', 'M', '1991-01-01', '', '012220420', '', '', 'ភ្នំពេញ', '', '2019-01-01', '1970-01-01', '2019-10-24 14:46:32', NULL, 'Y', 3, 0, 5, 0, 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_supplier`
--

INSERT INTO `tbl_supplier` (`sup_id`, `sup_nm`, `sup_phone`, `sup_email`, `sup_addr`, `sup_des`, `sup_cont`, `regDt`, `upDt`, `useYn`, `regUsr`, `upUsr`, `com_id`, `sup_nm_kh`) VALUES
(1, 'Garden 168', '010234567', '', 'Phnom Penh', 'A', NULL, '2019-09-13 16:26:22', '2019-09-15 00:07:48', 'Y', 2, 0, 1, 'សួនផ្ការ១៦៨');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`usr_id`, `usr_nm`, `usr_pwd`, `usr_wri_yn`, `usr_menu`, `regDt`, `upDt`, `useYn`, `regUsr`, `upUsr`, `sta_id`, `com_id`, `usr_str`, `usr_edit_yn`) VALUES
(1, 'admin', 'jrwt8jhu+GKexkqTwm9oJ4v0BFvopM86nBjcOqTUQb+Fcawzq8ur/n5JR85YHGbFu/oCHUs5x6ykhqGwYMmCHA==', 'Y', NULL, '2019-09-13 09:38:22', NULL, 'N', 0, 0, 12, 1, 'Y', 'Y'),
(2, 'admin', 'cdbzgZxByB1c//uZmctwwk8JSLgJDZSuDjpSUhhhVotNkdfAHL/U9x4D9+dvXeauf65b+vA2dcEegeE/41H69Q==', 'Y', NULL, '2019-09-13 09:50:01', NULL, 'Y', 0, 0, 1, 1, 'Y', 'Y'),
(3, 'narong', 'Fmxr+LlNoCMFtKr6KNVRKiBgmTBdFO1DCFdG99v7ZrFmXjuKkyhE019VbONN6l5g9hcwA6HIZ0o4k5K2kREHYw==', 'Y', NULL, '2019-09-17 14:39:48', '2019-09-17 14:39:48', 'Y', 2, 2, 2, 1, 'Y', 'Y');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
