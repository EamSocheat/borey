-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 12, 2019 at 01:13 AM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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

CREATE TABLE `tbl_branch` (
  `bra_id` int(11) NOT NULL,
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
  `bra_nm_kh` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
(27, 'ww', '111', '1111', '', '', '', '2019-01-06 07:06:14', NULL, 'Y', 5, 0, 1, 5, 'ww');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_branch_type`
--

CREATE TABLE `tbl_branch_type` (
  `bra_type_id` int(11) NOT NULL,
  `bra_nm` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bra_des` text COLLATE utf8_unicode_ci,
  `regDt` datetime DEFAULT NULL,
  `upDt` datetime DEFAULT NULL,
  `useYn` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `regUsr` int(11) DEFAULT NULL,
  `upUsr` int(11) DEFAULT NULL,
  `com_id` int(11) DEFAULT NULL,
  `bra_nm_kh` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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

CREATE TABLE `tbl_category` (
  `cat_id` int(11) NOT NULL,
  `cat_nm` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `cat_nm_kh` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cat_des` text COLLATE utf8_unicode_ci,
  `regDt` datetime DEFAULT NULL,
  `upDt` datetime DEFAULT NULL,
  `useYn` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `upUsr` int(11) NOT NULL,
  `regUsr` int(11) NOT NULL,
  `com_id` int(11) NOT NULL,
  `cat_photo` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`cat_id`, `cat_nm`, `cat_nm_kh`, `cat_des`, `regDt`, `upDt`, `useYn`, `upUsr`, `regUsr`, `com_id`, `cat_photo`) VALUES
(1, 'aaaaa', 'aaaaaaa', 'aaaaaaaa', '2019-07-11 09:02:20', NULL, 'Y', 0, 6, 9, '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_company`
--

CREATE TABLE `tbl_company` (
  `com_id` int(11) NOT NULL,
  `com_nm` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `com_phone` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `com_email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `com_addr` text COLLATE utf8_unicode_ci,
  `com_des` text COLLATE utf8_unicode_ci,
  `regDt` datetime DEFAULT NULL,
  `upDt` datetime DEFAULT NULL,
  `useYn` varchar(1) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
-- Table structure for table `tbl_customer`
--

CREATE TABLE `tbl_customer` (
  `cus_id` int(11) NOT NULL,
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
  `com_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
(12, '', 'សុខា', 'Female', '2009-01-11', '', '092221212', '092221133', '', '', 'Str....', 'testse', '12121212', NULL, '2019-05-06 11:19:14', NULL, 'Y', 1, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_import`
--

CREATE TABLE `tbl_import` (
  `imp_id` int(11) NOT NULL,
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
  `com_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_import_detail`
--

CREATE TABLE `tbl_import_detail` (
  `imp_id` int(11) NOT NULL,
  `pro_id` int(11) NOT NULL,
  `pro_unit_price` double DEFAULT NULL,
  `pro_sale_price` double DEFAULT NULL,
  `regDt` datetime DEFAULT NULL,
  `upDt` datetime DEFAULT NULL,
  `useYn` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `regUsr` int(11) NOT NULL,
  `upUsr` int(11) NOT NULL,
  `com_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_menu`
--

CREATE TABLE `tbl_menu` (
  `menu_id` int(11) NOT NULL,
  `menu_nm` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `menu_nm_kh` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `regDt` datetime DEFAULT NULL,
  `menu_icon_nm` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `menu_level` int(11) DEFAULT NULL,
  `menu_order` int(11) DEFAULT NULL,
  `menu_group` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
(9, 'Reservation', 'កក់ប្រាក់', '2018-08-24 02:59:23', 'fa fa-credit-card', NULL, 11, 3),
(10, 'Sell', 'លក់ចេញ', '2018-08-24 02:59:23', 'fa fa-shopping-cart', NULL, 12, 3),
(11, 'Installment Payment', 'បង់ប្រាក់រំលួស', '2018-08-24 02:59:23', 'fa fa-line-chart', NULL, 13, 3),
(12, 'Dashboard', 'ផ្ទាំងគ្រប់គ្រង', '2018-08-24 03:02:26', 'fa fa-dashboard', NULL, 1, 0),
(13, 'Commission Report', 'កំរៃជើងសារ', '2019-07-10 11:09:02', 'fa fa-pie-chart', NULL, 16, 3),
(14, 'Expend', 'ការចំណាយ', '2019-07-10 11:15:28', 'fa fa-bar-chart', NULL, 14, 3),
(15, 'Payment Report', 'របាយការណ៏បង់ប្រាក់', '2019-07-10 11:15:28', 'fa fa-area-chart', NULL, 17, 3),
(16, 'Salary', 'ប្រាក់ខែបុគ្គលិក', '2019-07-10 11:15:28', 'fa fa-university', NULL, 15, 3),
(17, 'Income Expenses', 'ចំនូល-ចំណាយ', '2019-07-10 11:15:28', 'fa fa-battery-full', NULL, 18, 3),
(18, 'Commission Setting', 'កំណត់កំរៃជើងសារ', '2019-07-10 11:18:24', 'fa fa-money', NULL, 6, 1),
(19, 'Customer', 'អតិថិជន', '2019-07-11 14:40:11', 'fa fa-address-card', NULL, 9, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_menu_company`
--

CREATE TABLE `tbl_menu_company` (
  `menu_id` int(11) NOT NULL,
  `com_id` int(11) NOT NULL,
  `upDt` datetime DEFAULT NULL,
  `regDt` datetime DEFAULT NULL,
  `useYn` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL
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

CREATE TABLE `tbl_menu_user` (
  `menu_id` int(11) NOT NULL,
  `usr_id` int(11) NOT NULL,
  `upDt` datetime DEFAULT NULL,
  `regDt` datetime DEFAULT NULL,
  `useYn` varchar(1) COLLATE utf8_unicode_ci NOT NULL
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
(4, 1, NULL, '2018-09-12 04:54:29', 'Y'),
(4, 2, NULL, '2018-09-12 04:57:53', 'Y'),
(4, 3, NULL, '2018-09-12 05:07:53', 'Y'),
(4, 4, NULL, '2018-09-12 06:09:25', 'Y'),
(4, 5, NULL, '2018-09-12 06:18:22', 'Y'),
(4, 6, NULL, '2019-07-10 11:29:12', 'Y'),
(5, 1, NULL, '2018-09-12 04:54:29', 'Y'),
(5, 2, NULL, '2018-09-12 04:57:53', 'Y'),
(5, 3, NULL, '2018-09-12 05:07:53', 'Y'),
(5, 4, NULL, '2018-09-12 06:09:25', 'Y'),
(5, 5, NULL, '2018-09-12 06:18:22', 'Y'),
(5, 6, NULL, '2019-07-10 11:29:12', 'Y'),
(6, 1, NULL, '2018-09-12 04:54:29', 'Y'),
(6, 2, NULL, '2018-09-12 04:57:53', 'Y'),
(6, 3, NULL, '2018-09-12 05:07:53', 'Y'),
(6, 4, NULL, '2018-09-12 06:09:25', 'Y'),
(6, 5, NULL, '2018-09-12 06:18:22', 'Y'),
(6, 6, NULL, '2019-07-10 11:29:12', 'Y'),
(7, 1, NULL, '2018-09-12 04:54:29', 'Y'),
(7, 2, NULL, '2018-09-12 04:57:53', 'Y'),
(7, 3, NULL, '2018-09-12 05:07:53', 'Y'),
(7, 4, NULL, '2018-09-12 06:09:25', 'Y'),
(7, 5, NULL, '2018-09-12 06:18:22', 'Y'),
(7, 6, NULL, '2019-07-10 11:29:12', 'Y'),
(8, 1, NULL, '2018-09-12 04:54:29', 'Y'),
(8, 2, NULL, '2018-09-12 04:57:53', 'Y'),
(8, 3, NULL, '2018-09-12 05:07:53', 'Y'),
(8, 4, NULL, '2018-09-12 06:09:25', 'Y'),
(8, 5, NULL, '2018-09-12 06:18:22', 'Y'),
(8, 6, NULL, '2019-07-10 11:29:12', 'Y'),
(9, 1, NULL, '2018-09-12 04:54:29', 'Y'),
(9, 2, NULL, '2018-09-12 04:57:53', 'Y'),
(9, 3, NULL, '2018-09-12 05:07:53', 'Y'),
(9, 4, NULL, '2018-09-12 06:09:25', 'Y'),
(9, 5, NULL, '2018-09-12 06:18:22', 'Y'),
(9, 6, NULL, '2019-07-10 11:29:12', 'Y'),
(10, 1, NULL, '2018-09-12 04:54:29', 'Y'),
(10, 2, NULL, '2018-09-12 04:57:53', 'Y'),
(10, 3, NULL, '2018-09-12 05:07:53', 'Y'),
(10, 4, NULL, '2018-09-12 06:09:25', 'Y'),
(10, 5, NULL, '2018-09-12 06:18:22', 'Y'),
(10, 6, NULL, '2019-07-10 11:29:12', 'Y'),
(11, 1, NULL, '2018-09-12 04:54:29', 'Y'),
(11, 2, NULL, '2018-09-12 04:57:53', 'Y'),
(11, 3, NULL, '2018-09-12 05:07:53', 'Y'),
(11, 4, NULL, '2018-09-12 06:09:25', 'Y'),
(11, 5, NULL, '2018-09-12 06:18:22', 'Y'),
(11, 6, NULL, '2019-07-10 11:29:12', 'Y'),
(12, 1, NULL, '2018-09-12 04:54:29', 'Y'),
(12, 2, NULL, '2018-09-12 04:57:53', 'Y'),
(12, 3, NULL, '2018-09-12 05:07:53', 'Y'),
(12, 4, NULL, '2018-09-12 06:09:25', 'Y'),
(12, 5, NULL, '2018-09-12 06:18:22', 'Y'),
(12, 6, NULL, '2019-07-10 11:29:12', 'Y'),
(13, 6, NULL, '2019-07-10 11:29:12', 'Y'),
(14, 6, NULL, '2019-07-10 11:29:12', 'Y'),
(15, 6, NULL, '2019-07-10 11:29:12', 'Y'),
(16, 6, NULL, '2019-07-10 11:29:12', 'Y'),
(17, 6, NULL, '2019-07-10 11:29:12', 'Y'),
(18, 6, NULL, '2019-07-10 11:29:12', 'Y'),
(19, 6, '2019-07-11 14:47:29', '2019-07-11 14:47:29', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_move`
--

CREATE TABLE `tbl_move` (
  `mov_id` int(11) NOT NULL,
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
  `com_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_move_detail`
--

CREATE TABLE `tbl_move_detail` (
  `mov_id` int(11) NOT NULL,
  `pro_id` int(11) NOT NULL,
  `pro_qty` int(11) NOT NULL,
  `regDt` datetime DEFAULT NULL,
  `upDt` datetime DEFAULT NULL,
  `useYn` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `regUsr` int(11) NOT NULL,
  `upUsr` int(11) NOT NULL,
  `com_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_position`
--

CREATE TABLE `tbl_position` (
  `pos_id` int(11) NOT NULL,
  `pos_nm` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `pos_nm_kh` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pos_des` text COLLATE utf8_unicode_ci,
  `regDt` datetime DEFAULT NULL,
  `upDt` datetime DEFAULT NULL,
  `useYn` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `regUsr` int(11) NOT NULL,
  `upUsr` int(11) NOT NULL,
  `com_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
(12, 'Admin', 'ម្ចាស់ក្រុមហ៊ុន', NULL, '2019-07-10 11:29:12', NULL, 'Y', 0, 0, 9);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product`
--

CREATE TABLE `tbl_product` (
  `pro_id` int(11) NOT NULL,
  `pro_nm` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `pro_nm_kh` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pro_vol` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pro_price` double DEFAULT NULL,
  `pro_sale_price` double DEFAULT NULL,
  `pro_qty` int(11) DEFAULT NULL,
  `pro_des` text COLLATE utf8_unicode_ci,
  `regDt` datetime DEFAULT NULL,
  `upDt` datetime DEFAULT NULL,
  `useYn` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `regUsr` int(11) NOT NULL,
  `upUsr` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `com_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_staff`
--

CREATE TABLE `tbl_staff` (
  `sta_id` int(11) NOT NULL,
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
  `com_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
(11, 'a', NULL, '', NULL, NULL, '010527752', NULL, NULL, NULL, NULL, NULL, NULL, '2019-07-10 11:29:12', NULL, 'Y', 0, 0, 12, NULL, 9);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_stock`
--

CREATE TABLE `tbl_stock` (
  `sto_id` int(11) NOT NULL,
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
  `com_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_stock_product`
--

CREATE TABLE `tbl_stock_product` (
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
  `com_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_supplier`
--

CREATE TABLE `tbl_supplier` (
  `sup_id` int(11) NOT NULL,
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
  `sup_nm_kh` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_supplier`
--

INSERT INTO `tbl_supplier` (`sup_id`, `sup_nm`, `sup_phone`, `sup_email`, `sup_addr`, `sup_des`, `sup_cont`, `regDt`, `upDt`, `useYn`, `regUsr`, `upUsr`, `com_id`, `sup_nm_kh`) VALUES
(1, 'AAAAAAUUUUUUU', '0123456789', 'eamsocheatsmart@gmail.com', 'AAAAAAAAAA', 'AAAAAAAAAAAAAAAAAA', NULL, '2018-10-29 03:32:42', '2018-10-29 03:38:26', 'N', 5, 0, 5, 'ខ្មែរ');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_use`
--

CREATE TABLE `tbl_use` (
  `use_id` int(11) NOT NULL,
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
  `com_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `usr_id` int(11) NOT NULL,
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
  `usr_str` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`usr_id`, `usr_nm`, `usr_pwd`, `usr_wri_yn`, `usr_menu`, `regDt`, `upDt`, `useYn`, `regUsr`, `upUsr`, `sta_id`, `com_id`, `usr_str`) VALUES
(1, '1', 'X/Cf1cmof5aDa8iuIVN2oNgoJfmUQd8gqvPSGDMhgemDRsKhQYzdFHCzdqX3uQIBQIe0n79RnGMMMpynqvkTQg==', 'Y', NULL, '2018-09-12 11:50:39', NULL, 'Y', 0, 0, 1, 1, 'Y'),
(2, '2', 'UFAmn6pBQ/wWmNHnGL7pQtAB/Sm2jRyrGFVGheCCGK6tzD4hB4GDw58ndNPZIJwSjLp1qNi5N+yVVL4El2TZ1Q==', 'Y', NULL, '2018-09-12 11:54:03', NULL, 'Y', 0, 0, 2, 2, 'Y'),
(3, '3', '1AjILh2WSR7Js5Xkprm0kVoDnHvpMGVj2i3nKUfmb8M8Pa9USbFLZBej/uGxPOOLMPTfVc+l093D2WLdJkcHAg==', 'Y', NULL, '2018-09-12 12:04:03', NULL, 'Y', 0, 0, 3, 3, 'Y'),
(4, '4', 'qis8su6y7KgIF9Dsm/QFsA2RMU8YiPtVwcGHmhW2vqXjxMOf7Z3PEv1jbUFx2QrgFsR/Pp9ORoraQDjb8LcofA==', 'Y', NULL, '2018-09-12 13:05:35', NULL, 'Y', 0, 0, 4, 4, 'Y'),
(5, '5', 'N0UOR8kWY8jHrALGmJyhNaaP7eHlSTxz5Fxn1+YEIutetEJ/VmcuaNzU4lx9CRMwvcJSaXcakndkw/B9I0+GSQ==', 'Y', NULL, '2018-09-12 13:14:32', NULL, 'Y', 0, 0, 5, 5, 'Y'),
(6, 'a', 'N0UOR8kWY8jHrALGmJyhNaaP7eHlSTxz5Fxn1+YEIutetEJ/VmcuaNzU4lx9CRMwvcJSaXcakndkw/B9I0+GSQ==', 'Y', NULL, '2019-07-10 11:29:12', NULL, 'Y', 0, 0, 11, 9, 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_use_detail`
--

CREATE TABLE `tbl_use_detail` (
  `use_id` int(11) NOT NULL,
  `pro_id` int(11) NOT NULL,
  `pro_qty` int(11) DEFAULT NULL,
  `use_status` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `regDt` datetime DEFAULT NULL,
  `upDt` datetime DEFAULT NULL,
  `useYn` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `regUsr` int(11) NOT NULL,
  `upUsr` int(11) NOT NULL,
  `com_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_use_detail_status`
--

CREATE TABLE `tbl_use_detail_status` (
  `use_stat_id` int(11) NOT NULL,
  `use_id` int(11) NOT NULL,
  `pro_id` int(11) NOT NULL,
  `use_stat_des` text COLLATE utf8_unicode_ci,
  `regDt` datetime DEFAULT NULL,
  `upDt` datetime DEFAULT NULL,
  `useYn` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `regUsr` int(11) NOT NULL,
  `upUsr` int(11) NOT NULL,
  `com_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_branch`
--
ALTER TABLE `tbl_branch`
  ADD PRIMARY KEY (`bra_id`);

--
-- Indexes for table `tbl_branch_type`
--
ALTER TABLE `tbl_branch_type`
  ADD PRIMARY KEY (`bra_type_id`);

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `tbl_company`
--
ALTER TABLE `tbl_company`
  ADD PRIMARY KEY (`com_id`);

--
-- Indexes for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  ADD PRIMARY KEY (`cus_id`);

--
-- Indexes for table `tbl_import`
--
ALTER TABLE `tbl_import`
  ADD PRIMARY KEY (`imp_id`);

--
-- Indexes for table `tbl_import_detail`
--
ALTER TABLE `tbl_import_detail`
  ADD PRIMARY KEY (`imp_id`,`pro_id`);

--
-- Indexes for table `tbl_menu`
--
ALTER TABLE `tbl_menu`
  ADD PRIMARY KEY (`menu_id`);

--
-- Indexes for table `tbl_menu_company`
--
ALTER TABLE `tbl_menu_company`
  ADD PRIMARY KEY (`menu_id`,`com_id`);

--
-- Indexes for table `tbl_menu_user`
--
ALTER TABLE `tbl_menu_user`
  ADD PRIMARY KEY (`menu_id`,`usr_id`);

--
-- Indexes for table `tbl_move`
--
ALTER TABLE `tbl_move`
  ADD PRIMARY KEY (`mov_id`);

--
-- Indexes for table `tbl_move_detail`
--
ALTER TABLE `tbl_move_detail`
  ADD PRIMARY KEY (`mov_id`,`pro_id`);

--
-- Indexes for table `tbl_position`
--
ALTER TABLE `tbl_position`
  ADD PRIMARY KEY (`pos_id`);

--
-- Indexes for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`pro_id`);

--
-- Indexes for table `tbl_staff`
--
ALTER TABLE `tbl_staff`
  ADD PRIMARY KEY (`sta_id`);

--
-- Indexes for table `tbl_stock`
--
ALTER TABLE `tbl_stock`
  ADD PRIMARY KEY (`sto_id`);

--
-- Indexes for table `tbl_stock_product`
--
ALTER TABLE `tbl_stock_product`
  ADD PRIMARY KEY (`sto_id`,`pro_id`);

--
-- Indexes for table `tbl_supplier`
--
ALTER TABLE `tbl_supplier`
  ADD PRIMARY KEY (`sup_id`);

--
-- Indexes for table `tbl_use`
--
ALTER TABLE `tbl_use`
  ADD PRIMARY KEY (`use_id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`usr_id`);

--
-- Indexes for table `tbl_use_detail`
--
ALTER TABLE `tbl_use_detail`
  ADD PRIMARY KEY (`use_id`,`pro_id`);

--
-- Indexes for table `tbl_use_detail_status`
--
ALTER TABLE `tbl_use_detail_status`
  ADD PRIMARY KEY (`use_stat_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_branch`
--
ALTER TABLE `tbl_branch`
  MODIFY `bra_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `tbl_branch_type`
--
ALTER TABLE `tbl_branch_type`
  MODIFY `bra_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tbl_company`
--
ALTER TABLE `tbl_company`
  MODIFY `com_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  MODIFY `cus_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `tbl_import`
--
ALTER TABLE `tbl_import`
  MODIFY `imp_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_menu`
--
ALTER TABLE `tbl_menu`
  MODIFY `menu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `tbl_move`
--
ALTER TABLE `tbl_move`
  MODIFY `mov_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_position`
--
ALTER TABLE `tbl_position`
  MODIFY `pos_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `pro_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_staff`
--
ALTER TABLE `tbl_staff`
  MODIFY `sta_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `tbl_stock`
--
ALTER TABLE `tbl_stock`
  MODIFY `sto_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_supplier`
--
ALTER TABLE `tbl_supplier`
  MODIFY `sup_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tbl_use`
--
ALTER TABLE `tbl_use`
  MODIFY `use_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `usr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tbl_use_detail_status`
--
ALTER TABLE `tbl_use_detail_status`
  MODIFY `use_stat_id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
