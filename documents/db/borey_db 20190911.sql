-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 11, 2019 at 06:00 PM
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
  `bra_nm_kh` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
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
  `com_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_branch`
--

INSERT INTO `tbl_branch` (`bra_id`, `bra_nm`, `bra_nm_kh`, `bra_phone1`, `bra_phone2`, `bra_email`, `bra_addr`, `bra_des`, `regDt`, `upDt`, `useYn`, `regUsr`, `upUsr`, `bra_type_id`, `com_id`) VALUES
(1, 'Tulip DNUUUUU', 'តេស', '0123467822', '0123456789', 'eamsocheat@gmail.com', 'AAA', 'AAA', '2018-09-15 09:04:07', '2018-09-17 04:49:04', 'N', 5, 5, 2, 5),
(2, 'Tulip AOEN', 'តេស១', '0123467822', '0123456789', 'eamsocheat@gmail.com', '', '', '2018-09-13 08:46:37', '2018-10-23 07:11:12', 'N', 5, 5, 2, 5),
(3, 'Project 000001', '', '2', '2', '', '2', '2', '2018-09-15 09:09:22', '2018-10-25 04:45:02', 'Y', 5, 5, 1, 9),
(4, 'Project 000002', 'ប្រូជែក 000002', '3', '3', '', '3', '3', '2018-09-15 08:51:43', '2018-10-25 04:46:49', 'Y', 5, 5, 1, 9),
(5, 'Project 000003', 'ប្រូជែក 000003', '4444444', '', '', '', '', '2018-09-15 08:08:11', NULL, 'Y', 5, 5, 1, 9),
(6, 'Project 000004', '', '5', '', '', '', '', '2018-09-13 08:47:19', '2019-07-23 13:54:56', 'N', 5, 6, 1, 9),
(7, 'Project 000005', '', '6', '', '', '', '', '2018-09-15 09:03:50', NULL, 'Y', 5, 5, 1, 9),
(8, '7up', '7', '7', '7', '', 'AA', 'AAA', '2018-09-15 09:11:28', '2018-09-17 05:01:28', 'N', 5, 5, 1, 5),
(9, '8', '8', '8', '', '', '', '', '2018-09-13 08:47:39', NULL, 'Y', 5, 0, 1, 5),
(10, '9', '9', '9', '', '', '', '', '2018-09-13 08:47:44', '2018-10-25 04:47:44', 'N', 5, 5, 1, 5),
(11, '1155', '1', '11', '11', '', '', '', '2018-09-13 08:47:52', '2018-10-23 07:22:14', 'Y', 5, 5, 1, 5),
(12, '22', '22', '22', '22', '', '', '', '2018-09-13 08:47:58', NULL, 'Y', 5, 0, 1, 5),
(13, '33llllllll', '33', '33', '3333333', '', '', '', '2018-09-13 08:48:04', '2018-10-25 04:45:37', 'Y', 5, 5, 1, 5),
(14, '4444', '44', '444', '44', '', '', '', '2018-09-13 08:48:11', '2018-09-17 04:52:25', 'N', 5, 5, 1, 5),
(15, '55', '55', '555555555', '5', '', '', '', '2018-09-13 08:48:17', '2018-09-17 04:52:25', 'N', 5, 5, 1, 5),
(16, 'Tulip DN', 'តេស', '01234678223333', '0123456789', 'eamsocheat@gmail.com', 'AAA', 'AAA', '2018-09-15 04:55:41', NULL, 'Y', 5, 0, 2, 5),
(17, 'Tulip DNAA', 'តេស', '0123467822', '0123456789', 'eamsocheat@gmail.com', 'AAA', 'AAA', '2018-09-15 04:59:04', '2018-09-17 05:01:38', 'N', 5, 5, 2, 5),
(18, '33WWWWW', '333', '3', '33', '', '33', '33', '2018-10-22 08:32:55', '2018-10-23 02:46:51', 'Y', 5, 5, 1, 5),
(19, 'ttt99999', 'AAAAAAAAAA', '0123467822', '0123456789', '', '', '', '2018-10-22 08:45:00', '2018-10-23 03:01:56', 'Y', 5, 5, 1, 5),
(20, '111RRRRRRRRRR', '111', '111', '111', '', '', '', '2018-10-23 04:40:15', '2018-10-25 04:46:07', 'Y', 5, 5, 1, 5),
(21, 'a', 'AAA', '555555555', '', '', '', '', '2018-10-23 04:44:08', '2018-10-23 07:33:23', 'Y', 5, 5, 1, 5),
(22, '5555', '5555', '555', '555', '', '', '', '2018-10-23 06:56:24', '2018-10-25 04:47:53', 'N', 5, 5, 1, 5),
(23, 'ttttttyyy', 'yyyy', '0987654321', '', '', '', '', '2018-10-23 06:57:06', NULL, 'Y', 5, 0, 1, 5),
(24, '99999', '99999', '9999', '99999', '', '', '', '2018-10-23 06:58:36', NULL, 'Y', 5, 0, 1, 5),
(25, 'iiiii', 'iiii', '0987654321', '', '', '', '', '2018-10-23 07:05:35', NULL, 'Y', 5, 0, 1, 5),
(26, 'uuu', 'uuu', '899999', '99', '', '', '', '2018-10-23 07:33:05', NULL, 'Y', 5, 0, 1, 5),
(27, 'ww', 'ww', '111', '1111', '', '', '', '2019-01-06 07:06:14', NULL, 'Y', 5, 0, 1, 5),
(28, 'TEST BRANCH', 'kkkkk', '0976555566', '0976555562', 'sovan@gmail.com', 'adfadf', 'adfad', '2019-07-23 13:54:07', NULL, 'Y', 6, 0, 2, 9),
(29, 'TEST BRANCH 02', 'kkkkk 02', '0976555598', '0976559062', 'sovan@gmail.com', 'asdfads', 'asdfdsaf', '2019-07-23 13:54:45', NULL, 'Y', 6, 0, 2, 9);

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
  `cat_photo` text COLLATE utf8_unicode_ci,
  `cat_des` text COLLATE utf8_unicode_ci,
  `regDt` datetime DEFAULT NULL,
  `upDt` datetime DEFAULT NULL,
  `useYn` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `upUsr` int(11) NOT NULL,
  `regUsr` int(11) NOT NULL,
  `com_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`cat_id`, `cat_nm`, `cat_nm_kh`, `cat_photo`, `cat_des`, `regDt`, `upDt`, `useYn`, `upUsr`, `regUsr`, `com_id`) VALUES
(1, 'Villa 0001', 'ផ្ទះវីឡា', '', 'Single villa the platinuim', '2019-07-11 09:02:20', '2019-07-20 10:06:15', 'Y', 6, 6, 9),
(2, 'Link House', 'ផ្ទះភ្លោះ', '', 'Twin villa the platinuim.', '2019-07-11 09:02:20', NULL, 'Y', 0, 6, 9),
(3, 'Apartment', '', '', 'Apartment', '2019-07-20 09:11:30', '2019-07-22 15:00:37', 'Y', 6, 6, 9),
(4, 'Shop House', 'ផ្ទះធម្មតា', '/stock/category/2019-07-20-09-25-01_9_6.jpg', 'Shop House', '2019-07-20 09:25:01', NULL, 'Y', 0, 6, 9),
(5, 'Shop House 0001', 'ផ្ទះធម្មតា 0001', '/stock/category/2019-07-20-09-25-20_9_6.jpg', 'ផ្ទះធម្មតា 0001', '2019-07-20 09:25:20', NULL, 'Y', 0, 6, 9),
(6, 'Apartment 00001', 'ផ្ទះល្វែង Apartment 00001', '/stock/category/2019-07-20-09-46-40_9_6.jpg', 'Apartment 00001', '2019-07-20 09:46:40', NULL, 'Y', 0, 6, 9),
(7, 'Apartment 00002', 'ផ្ទះល្វែង Apartment 00002', '/stock/category/2019-07-20-09-47-03_9_6.jpg', 'ផ្ទះល្វែង Apartment 00002', '2019-07-20 09:47:03', NULL, 'Y', 0, 6, 9);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_commission`
--

CREATE TABLE `tbl_commission` (
  `commi_id` int(11) NOT NULL,
  `commi_amt` double DEFAULT NULL,
  `commi_type` varchar(1) DEFAULT NULL,
  `commi_amt_approve` double DEFAULT NULL,
  `commi_is_approve` varchar(1) DEFAULT NULL,
  `commi_approve_date` date DEFAULT NULL,
  `commi_approve_des` varchar(500) DEFAULT NULL,
  `sell_id` int(11) DEFAULT NULL,
  `regDt` datetime DEFAULT NULL,
  `upDt` datetime DEFAULT NULL,
  `useYn` varchar(1) DEFAULT NULL,
  `regUsr` int(11) DEFAULT NULL,
  `upUsr` int(11) DEFAULT NULL,
  `com_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_commission`
--

INSERT INTO `tbl_commission` (`commi_id`, `commi_amt`, `commi_type`, `commi_amt_approve`, `commi_is_approve`, `commi_approve_date`, `commi_approve_des`, `sell_id`, `regDt`, `upDt`, `useYn`, `regUsr`, `upUsr`, `com_id`) VALUES
(1, 400, 'S', NULL, NULL, NULL, NULL, 17, '2019-08-27 20:26:00', NULL, 'Y', 6, NULL, 9),
(2, 80, 'A', NULL, NULL, NULL, NULL, 17, '2019-08-27 20:26:00', NULL, 'Y', 6, NULL, 9),
(3, 400, 'S', NULL, NULL, NULL, NULL, 18, '2019-08-27 20:29:20', NULL, 'Y', 6, NULL, 9),
(4, 80, 'A', NULL, NULL, NULL, NULL, 18, '2019-08-27 20:29:20', NULL, 'Y', 6, NULL, 9),
(5, 400, 'S', NULL, NULL, NULL, NULL, 19, '2019-08-27 22:15:31', NULL, 'Y', 6, NULL, 9),
(6, 80, 'A', NULL, NULL, NULL, NULL, 19, '2019-08-27 22:15:31', NULL, 'Y', 6, NULL, 9),
(7, 400, 'S', NULL, NULL, NULL, NULL, 20, '2019-08-31 18:19:05', NULL, 'Y', 6, NULL, 9),
(8, 80, 'A', NULL, NULL, NULL, NULL, 20, '2019-08-31 18:19:05', NULL, 'Y', 6, NULL, 9),
(9, 400, 'S', NULL, NULL, NULL, NULL, 21, '2019-09-01 11:07:21', NULL, 'Y', 6, NULL, 9),
(10, 80, 'A', NULL, NULL, NULL, NULL, 21, '2019-09-01 11:07:21', NULL, 'Y', 6, NULL, 9),
(11, 400, 'S', NULL, NULL, NULL, NULL, 22, '2019-09-01 11:09:51', NULL, 'Y', 6, NULL, 9),
(12, 80, 'A', NULL, NULL, NULL, NULL, 22, '2019-09-01 11:09:51', NULL, 'Y', 6, NULL, 9),
(13, 400, 'S', NULL, NULL, NULL, NULL, 23, '2019-09-01 11:17:05', NULL, 'Y', 6, NULL, 9),
(14, 80, 'A', NULL, NULL, NULL, NULL, 23, '2019-09-01 11:17:05', NULL, 'Y', 6, NULL, 9),
(15, 400, 'S', NULL, NULL, NULL, NULL, 24, '2019-09-01 11:22:50', NULL, 'Y', 6, NULL, 9),
(16, 80, 'A', NULL, NULL, NULL, NULL, 24, '2019-09-01 11:22:50', NULL, 'Y', 6, NULL, 9),
(17, 400, 'S', NULL, NULL, NULL, NULL, 25, '2019-09-01 11:52:22', NULL, 'Y', 6, NULL, 9),
(18, 80, 'A', NULL, NULL, NULL, NULL, 25, '2019-09-01 11:52:22', NULL, 'Y', 6, NULL, 9),
(19, 400, 'S', NULL, NULL, NULL, NULL, 26, '2019-09-01 13:32:34', NULL, 'Y', 6, NULL, 9),
(20, 80, 'A', NULL, NULL, NULL, NULL, 26, '2019-09-01 13:32:34', NULL, 'Y', 6, NULL, 9),
(21, 400, 'S', NULL, NULL, NULL, NULL, 27, '2019-09-01 13:33:53', NULL, 'Y', 6, NULL, 9),
(22, 80, 'A', NULL, NULL, NULL, NULL, 27, '2019-09-01 13:33:53', NULL, 'Y', 6, NULL, 9),
(23, 300, 'S', NULL, NULL, NULL, NULL, 28, '2019-09-01 14:07:18', NULL, 'Y', 6, NULL, 9),
(24, 60, 'A', NULL, NULL, NULL, NULL, 28, '2019-09-01 14:07:18', NULL, 'Y', 6, NULL, 9),
(25, 300, 'S', NULL, NULL, NULL, NULL, 29, '2019-09-01 14:44:12', NULL, 'Y', 6, NULL, 9),
(26, 60, 'A', NULL, NULL, NULL, NULL, 29, '2019-09-01 14:44:12', NULL, 'Y', 6, NULL, 9),
(27, 400, 'S', NULL, NULL, NULL, NULL, 30, '2019-09-01 17:04:03', NULL, 'Y', 6, NULL, 9),
(28, 80, 'A', NULL, NULL, NULL, NULL, 30, '2019-09-01 17:04:03', NULL, 'Y', 6, NULL, 9),
(29, 400, 'S', NULL, NULL, NULL, NULL, 31, '2019-09-01 17:07:45', NULL, 'Y', 6, NULL, 9),
(30, 80, 'A', NULL, NULL, NULL, NULL, 31, '2019-09-01 17:07:45', '2019-09-11 17:18:19', 'N', 6, 6, 9);

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
-- Table structure for table `tbl_contract`
--

CREATE TABLE `tbl_contract` (
  `con_id` int(11) NOT NULL,
  `con_no` varchar(20) NOT NULL,
  `con_start_dt` datetime NOT NULL,
  `con_principle` double NOT NULL,
  `con_interest` double NOT NULL,
  `con_interest_type` varchar(10) NOT NULL,
  `con_per_year` int(11) NOT NULL,
  `con_per_month` int(11) NOT NULL,
  `con_total_principle` double NOT NULL,
  `con_total_interest` double NOT NULL,
  `con_status` varchar(1) NOT NULL,
  `con_end_dt` datetime DEFAULT NULL,
  `regDt` datetime DEFAULT NULL,
  `regUsr` varchar(100) DEFAULT NULL,
  `upDt` datetime DEFAULT NULL,
  `upUsr` varchar(30) DEFAULT NULL,
  `con_desc` varchar(100) DEFAULT NULL,
  `useYn` varchar(1) NOT NULL,
  `com_id` int(11) NOT NULL,
  `cus_id` int(11) DEFAULT NULL,
  `cur_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=armscii8;

--
-- Dumping data for table `tbl_contract`
--

INSERT INTO `tbl_contract` (`con_id`, `con_no`, `con_start_dt`, `con_principle`, `con_interest`, `con_interest_type`, `con_per_year`, `con_per_month`, `con_total_principle`, `con_total_interest`, `con_status`, `con_end_dt`, `regDt`, `regUsr`, `upDt`, `upUsr`, `con_desc`, `useYn`, `com_id`, `cus_id`, `cur_id`) VALUES
(38, '0000000033', '2019-04-28 00:00:00', 500, 10, 'M', 2, 1, 0, 0, '', NULL, '2019-04-28 13:19:07', '1', NULL, NULL, '', 'Y', 1, 5, 2),
(32, '0000000001', '2019-03-01 00:00:00', 100, 10, 'M', 0, 10, 0, 0, '1', '2019-03-10 00:00:00', '2019-03-09 17:12:18', '1', '2019-04-27 15:13:30', '1', '', 'Y', 1, 6, 2);

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
(12, '', 'សុខា', 'Female', '2009-01-11', '', '092221212', '092221133', '', '', 'Str....', 'testse', '12121212', NULL, '2019-05-06 11:19:14', NULL, 'Y', 1, '', 1),
(13, '', 'វង សុវណ្ណធឿន', 'Male', '1995-02-08', '/borey/customer/2019-07-12-02-08-47_9_6.jpg', '012363636', '012353535', 'sovanthoeun@gmail.com', 'facebook.com/sovanthoeun', 'No. 138, stree 231, Depo Market', 'TESTING developing', '123211134', NULL, '2019-07-12 01:41:12', '2019-07-12 02:11:06', 'Y', 6, '6', 9),
(14, '', 'សុភ័ក្រ្តា', 'Male', '1996-06-02', '', '012525252', '012545454', 'pheaktra@gmail.com', 'facebook.com/pheaktra', 'No. 30, street 543, Teuk Thla', 'TESTING', '123569745', NULL, '2019-07-12 02:00:08', '2019-07-12 05:01:26', 'Y', 6, '6', 9),
(15, '00000001', '00000001', 'Female', '1970-01-01', '', '012565656', '023565456', 'test@gmail.com', 'facebook.com/test', 'No, Test, street Test', 'TESTING', '111111111', NULL, '2019-07-12 02:13:04', '2019-07-12 03:27:50', 'Y', 6, '6', 9);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_expend`
--

CREATE TABLE `tbl_expend` (
  `exp_id` int(11) NOT NULL,
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
  `bra_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=armscii8;

--
-- Dumping data for table `tbl_expend`
--

INSERT INTO `tbl_expend` (`exp_id`, `exp_total_price`, `exp_date`, `exp_des`, `exp_image`, `regDt`, `upDt`, `useYn`, `regUsr`, `upUsr`, `sta_id`, `sup_id`, `com_id`, `bra_id`) VALUES
(1, 10099, '2019-01-07', 'ikkkkkkkk', '/borey/expend/2019-07-16-14-48-27_9_6.jpg', '2019-07-15 04:32:16', '2019-07-16 14:56:39', 'Y', 6, 6, 3, 2, 9, 7),
(2, 12556, '2019-07-02', 'ppppppp', '/borey/expend/2019-07-16-14-57-05_9_6.png', '2019-07-15 04:35:00', '2019-07-16 16:18:40', 'Y', 6, 6, 2, 3, 9, 7),
(3, 12345664.23, '2019-07-03', 'wwwwwwww', '/borey/expend/2019-07-15-04-43-13_9_6.png', '2019-07-15 04:43:13', '2019-07-16 14:49:09', 'Y', 6, 6, 1, 2, 9, 5),
(4, 125, '2019-07-02', 'kkkk', '/borey/expend/2019-07-15-04-35-00_9_6.png', '2019-07-15 14:46:21', NULL, 'Y', 6, 0, 2, 1, 9, 7),
(7, 121, '1970-01-01', '', '', '2019-07-17 08:22:41', NULL, 'Y', 6, 0, 11, 1, 9, 7),
(8, 1000, '1970-01-01', '', '/borey/expend/2019-07-22-16-25-25_9_6.png', '2019-07-22 16:25:25', NULL, 'Y', 6, 0, 6, 1, 9, 7);

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
  `bra_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_product`
--

INSERT INTO `tbl_product` (`pro_id`, `pro_code`, `pro_price`, `pro_sale_price`, `pro_number`, `pro_street`, `pro_photo`, `pro_length`, `pro_width`, `pro_area`, `pro_room`, `pro_toilet`, `pro_floor`, `pro_des`, `pro_status`, `regDt`, `upDt`, `useYn`, `regUsr`, `upUsr`, `com_id`, `cat_id`, `bra_id`) VALUES
(1, 'CHV-01', 10000, NULL, '14', '122', '', 12, 5, 60, 5, 3, 3, 'TESTING', NULL, '2019-07-22 16:20:10', NULL, 'Y', 6, 0, 9, 6, 4),
(5, 'CDH-01', 10000, NULL, '111', '122', '', 111, 111, 11111, 5, 3, 12, 'dsdfffff', NULL, '2019-07-23 14:19:42', NULL, 'Y', 6, 0, 9, 2, 4),
(6, 'VCH-01', 1222, NULL, '21', '12', '', 122, 12, 1222, 12, 22, 21, 'kkk', NULL, '2019-07-23 14:22:29', NULL, 'Y', 6, 0, 9, 2, 5),
(8, 'CHJ-02', 20000, NULL, '22', '122', '', 12, 21, 122, 12, 12, 22, 'kkkk', NULL, '2019-07-23 14:32:01', NULL, 'Y', 6, 0, 9, 6, 4),
(9, 'HJK-02', 30000, NULL, '22', '122', '', 12, 12, 124, 123, 12, 0, 'kkkk', NULL, '2019-07-23 14:34:44', '2019-08-04 07:23:18', 'Y', 6, 6, 9, 3, 0),
(11, 'CHJ-02b', 2222, NULL, '', '', '', 0, 0, 0, 0, 0, 0, '', NULL, '2019-07-27 14:45:32', '2019-07-28 06:17:45', 'N', 6, 6, 9, 1, 5),
(16, 'CHV-01', 2222, NULL, '', '', '', 0, 0, 0, 0, 0, 0, '', NULL, '2019-07-27 15:13:01', '2019-07-28 06:17:45', 'N', 6, 6, 9, 1, 29),
(18, 'CHV-01111', 22222, NULL, '', '', '', 0, 0, 0, 0, 0, 0, '', NULL, '2019-07-28 06:11:08', '2019-07-28 06:17:45', 'N', 6, 6, 9, 1, 28);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_salary`
--

CREATE TABLE `tbl_salary` (
  `sal_id` int(11) NOT NULL,
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
  `com_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=armscii8;

--
-- Dumping data for table `tbl_salary`
--

INSERT INTO `tbl_salary` (`sal_id`, `sal_start_dt`, `sal_end_dt`, `sal_month`, `sal_amt`, `sal_comm`, `sal_overtime`, `sal_get_date`, `sta_id`, `sal_status`, `regDt`, `upDt`, `useYn`, `regUsr`, `upUsr`, `com_id`) VALUES
(1, '2019-08-01', '2019-08-31', '2019-08-01', 1000, 100, 20, '2019-08-01', 1, 'P', '2019-08-24 00:00:00', '2019-08-29 03:22:31', 'Y', 6, 6, 9),
(2, '2019-09-01', '2019-09-30', '2019-09-01', 10000, 200, 20, '2019-09-01', 1, 'G', '2019-08-29 00:00:00', '2019-08-31 04:52:06', 'Y', 6, 6, 9),
(10, '2019-08-01', '2019-08-01', '2019-08-01', 5000, 0, 0, '0000-00-00', 0, 'P', '2019-08-31 05:20:58', NULL, 'Y', 6, NULL, 9),
(9, '2019-08-01', '2019-08-31', '2019-08-01', 6000, 0, 0, '0000-00-00', 1, 'P', '2019-08-31 05:16:32', NULL, 'Y', 6, NULL, 9),
(8, '2019-11-01', '2019-08-31', '2019-11-01', 9000, 0, 0, '0000-00-00', 1, 'G', '2019-08-31 04:06:07', '2019-08-31 04:51:53', 'Y', 6, 6, 9),
(11, '2019-08-01', '2019-08-01', '2019-08-01', 5000, 0, 0, '0000-00-00', 0, 'P', '2019-08-31 05:21:42', NULL, 'Y', 6, NULL, 9),
(12, '2019-08-31', '2019-09-01', '2019-08-01', 600, 0, 0, '0000-00-00', 3, 'G', '2019-08-31 05:22:19', '2019-09-02 16:55:44', 'Y', 6, 6, 9),
(13, '2019-08-31', '2019-09-29', '2019-08-01', 6000, 0, 0, '0000-00-00', 3, 'P', '2019-08-31 05:25:16', NULL, 'Y', 6, NULL, 9);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sell`
--

CREATE TABLE `tbl_sell` (
  `sell_id` int(11) NOT NULL,
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
  `sell_inst_yn` varchar(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_sell`
--

INSERT INTO `tbl_sell` (`sell_id`, `sell_date`, `sell_total_price`, `sell_dis_per`, `sell_dis_amt`, `sell_price_before_dis`, `sell_des`, `sell_code`, `con_id`, `rec_id`, `seller_id`, `regDt`, `upDt`, `useYn`, `regUsr`, `upUsr`, `com_id`, `cus_id`, `con_type_id`, `sell_inst_yn`) VALUES
(1, '2019-08-25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13, 1, '2019-08-25 14:51:48', NULL, 'Y', 6, NULL, 9, NULL, NULL, NULL),
(2, '2019-08-25', NULL, NULL, NULL, NULL, NULL, '000002', NULL, 13, 1, '2019-08-25 14:53:12', NULL, 'Y', 6, NULL, 9, NULL, NULL, NULL),
(3, '2019-08-25', NULL, NULL, NULL, NULL, NULL, '000003', NULL, 13, 1, '2019-08-25 14:54:14', NULL, 'Y', 6, NULL, 9, NULL, NULL, NULL),
(4, '2019-08-25', NULL, NULL, NULL, NULL, NULL, '000004', NULL, 13, 1, '2019-08-25 14:55:21', NULL, 'Y', 6, NULL, 9, NULL, NULL, NULL),
(5, '2019-08-25', 0, NULL, NULL, NULL, '', '000005', NULL, 12, 1, '2019-08-25 15:10:13', NULL, 'Y', 6, NULL, 9, 13, 3, NULL),
(6, '2019-08-25', 120000, NULL, NULL, NULL, '', '000006', NULL, 13, 1, '2019-08-25 15:25:17', NULL, 'Y', 6, NULL, 9, 13, 3, NULL),
(7, '2019-08-25', 120000, NULL, NULL, NULL, '', '000007', NULL, 13, 1, '2019-08-25 15:29:10', NULL, 'Y', 6, NULL, 9, 13, 3, NULL),
(8, '2019-08-25', 120000, NULL, NULL, NULL, '', '000008', 26, 13, 1, '2019-08-25 15:33:22', NULL, 'Y', 6, NULL, 9, 13, 3, NULL),
(9, '2019-08-25', 89460, NULL, NULL, NULL, 'add on nonnon', '000009', 0, 13, 1, '2019-08-25 21:08:52', NULL, 'Y', 6, NULL, 9, 13, 1, NULL),
(10, '2019-08-25', 116600, 10, 3400, 120000, '', '000010', 26, 12, 1, '2019-08-25 23:35:19', NULL, 'Y', 6, NULL, 9, 13, 3, NULL),
(11, '2019-08-26', 116400, 10, 3600, 120000, '', '000011', 26, 13, 1, '2019-08-26 21:59:11', NULL, 'Y', 6, NULL, 9, 13, 3, NULL),
(12, '2019-08-26', 32400, 10, 3600, 120000, '', '000012', 26, 13, 1, '2019-08-26 22:25:39', NULL, 'Y', 6, NULL, 9, 13, 3, NULL),
(13, '2019-08-26', 120000, NULL, NULL, NULL, '', '000013', 26, 13, 1, '2019-08-26 23:04:12', NULL, 'Y', 6, NULL, 9, 13, 3, NULL),
(14, '2019-08-26', 120000, NULL, NULL, NULL, '', '000014', 26, 12, 1, '2019-08-26 23:05:33', NULL, 'Y', 6, NULL, 9, 13, 3, NULL),
(15, '2019-08-27', 120000, NULL, NULL, NULL, '', '000015', 26, 12, 1, '2019-08-27 20:24:29', NULL, 'Y', 6, NULL, 9, 13, 3, NULL),
(16, '2019-08-27', 120000, NULL, NULL, NULL, '', '000016', 26, 12, 1, '2019-08-27 20:25:15', NULL, 'Y', 6, NULL, 9, 13, 3, NULL),
(17, '2019-08-27', 120000, NULL, NULL, NULL, '', '000017', 26, 12, 1, '2019-08-27 20:26:00', NULL, 'Y', 6, NULL, 9, 13, 3, NULL),
(18, '2019-08-27', 120000, NULL, NULL, NULL, '', '000018', 26, 13, 1, '2019-08-27 20:29:20', NULL, 'Y', 6, NULL, 9, 13, 3, NULL),
(19, '2019-08-27', 120000, NULL, NULL, NULL, '', '000019', 26, 12, 1, '2019-08-27 22:15:31', NULL, 'Y', 6, NULL, 9, 13, 3, NULL),
(20, '2019-08-31', 120000, NULL, NULL, NULL, '', '000020', 26, 13, 1, '2019-08-31 18:19:05', NULL, 'Y', 6, NULL, 9, 13, 3, NULL),
(21, '2019-09-01', 120000, NULL, NULL, NULL, '', '000021', 26, NULL, 1, '2019-09-01 11:07:21', NULL, 'Y', 6, NULL, 9, 13, 3, 'N'),
(22, '2019-09-01', 120000, NULL, NULL, NULL, '', '000022', 26, NULL, 1, '2019-09-01 11:09:51', NULL, 'Y', 6, NULL, 9, 13, 3, 'N'),
(23, '2019-09-01', 120000, NULL, NULL, NULL, '', '000023', 26, NULL, 1, '2019-09-01 11:17:05', NULL, 'Y', 6, NULL, 9, 13, 3, 'N'),
(24, '2019-09-01', 120000, NULL, NULL, NULL, '', '000024', 26, NULL, 1, '2019-09-01 11:22:50', NULL, 'Y', 6, NULL, 9, 13, 3, 'N'),
(25, '2019-09-01', 120000, NULL, NULL, NULL, '', '000025', 26, NULL, 1, '2019-09-01 11:52:22', NULL, 'Y', 6, NULL, 9, 13, 3, 'N'),
(26, '2019-09-01', 120000, NULL, NULL, NULL, '', '000026', 26, NULL, 1, '2019-09-01 13:32:34', NULL, 'Y', 6, NULL, 9, 13, 3, 'N'),
(27, '2019-09-01', 120000, NULL, NULL, NULL, '', '000027', 26, NULL, 1, '2019-09-01 13:33:53', NULL, 'Y', 6, NULL, 9, 13, 3, 'N'),
(28, '2019-09-01', 90000, NULL, NULL, NULL, 'dsafdaf', '000028', 0, NULL, 1, '2019-09-01 14:07:18', NULL, 'Y', 6, NULL, 9, 13, 3, 'N'),
(29, '2019-09-01', 90000, NULL, NULL, NULL, 'dfgfsdgsgdsg', '000029', 0, NULL, 1, '2019-09-01 14:44:12', NULL, 'Y', 6, NULL, 9, 14, 3, 'N'),
(30, '2019-09-01', 120000, NULL, NULL, NULL, '', '000030', 26, NULL, 1, '2019-09-01 17:04:03', NULL, 'Y', 6, NULL, 9, 13, 3, 'Y'),
(31, '2019-09-01', 120000, NULL, NULL, NULL, '66666', '000031', 0, NULL, 1, '2019-09-01 17:07:45', NULL, 'Y', 6, NULL, 9, 15, 1, 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sell_import_detail`
--

CREATE TABLE `tbl_sell_import_detail` (
  `sell_id` int(11) NOT NULL,
  `pro_id` int(11) NOT NULL,
  `pro_unit_price` double DEFAULT NULL,
  `pro_sale_price` double DEFAULT NULL,
  `regDt` datetime DEFAULT NULL,
  `upDt` datetime DEFAULT NULL,
  `useYn` varchar(1) NOT NULL,
  `regUsr` int(11) NOT NULL,
  `upUsr` int(11) NOT NULL,
  `com_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=armscii8;

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
(1, 'Staff 000001', 'បុគ្គលិក 00000១', '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, '2018-09-12 11:50:39', NULL, 'Y', 5, 0, 1, NULL, 9),
(2, 'Staff 000002', 'បុគ្គលិក 00000២', '', NULL, NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, '2018-09-12 11:54:03', NULL, 'Y', 5, 0, 2, NULL, 9),
(3, 'Staff 000003', NULL, '', NULL, NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, '2018-09-12 12:04:03', NULL, 'Y', 5, 0, 3, NULL, 9),
(4, '4', NULL, '', NULL, NULL, '4', NULL, NULL, NULL, NULL, NULL, NULL, '2018-09-12 13:05:35', NULL, 'Y', 0, 0, 4, NULL, 4),
(5, '5', NULL, '', NULL, NULL, '5', NULL, NULL, NULL, NULL, NULL, NULL, '2018-09-12 13:14:32', NULL, 'Y', 0, 0, 5, NULL, 5),
(6, 'AAAA', 'aa', 'F', '0000-00-00', NULL, NULL, '999', 'AAAAAA@email.com', 'pp', 'A', '0000-00-00', NULL, '2018-10-29 08:39:46', '2018-11-07 07:41:50', 'N', 5, 5, 11, 26, 5),
(7, 'AAA4444', 'AAAA', 'F', '1992-01-01', '/stock/staff/2018-11-07-06-59-01_5_5.jpg', '1011222', '6565', '', 'TTT', '55', '2018-01-01', NULL, '2018-10-29 09:22:17', '2018-11-07 07:41:50', 'N', 5, 5, 11, 26, 5),
(8, '444', '444', 'F', '1992-01-01', '', '444', '4444', 'socheat@mail.com', '44', '333', '2018-01-01', '1970-01-01', '2018-11-06 07:54:50', '2019-01-06 07:09:25', 'Y', 5, 5, 10, 26, 5),
(9, 'AAA', 'AAAA', 'F', '1992-01-01', '/stock/staff/2018-11-06-08-48-55_5_5.jpg', '1011222', '6565', '', 'TTT', '55', '2018-01-01', NULL, '2018-11-06 08:48:55', '2018-11-07 07:35:55', 'N', 5, 5, 11, 26, 5),
(10, 'TTTTT', 'តេស', 'M', '1970-01-01', '', '012232401', '6565', 'socheat@mail.com', 'TTT', 'oooo', '2018-11-12', '1970-01-01', '2018-11-12 07:06:02', '2019-01-06 07:06:45', 'Y', 5, 5, 5, 24, 5),
(11, 'Staffff', NULL, '', NULL, NULL, '010527752', NULL, NULL, NULL, NULL, NULL, NULL, '2019-07-10 11:29:12', NULL, 'Y', 5, 0, 12, NULL, 9);

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
  `sup_nm_kh` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
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
  `com_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_supplier`
--

INSERT INTO `tbl_supplier` (`sup_id`, `sup_nm`, `sup_nm_kh`, `sup_phone`, `sup_email`, `sup_addr`, `sup_des`, `sup_cont`, `regDt`, `upDt`, `useYn`, `regUsr`, `upUsr`, `com_id`) VALUES
(1, 'supplier 000001', 'ខ្មែរ', '0123456789', 'eamsocheatsmart@gmail.com', 'Siem Reap', 'supplier 00001', NULL, '2018-10-29 03:32:42', '2019-07-14 16:06:21', 'Y', 5, 0, 9),
(2, 'supplier 000002', 'supplier 000002', '092323323', 'supl@gmail.com', 'dddddd', 'ddddd', NULL, '2019-07-14 15:59:23', '2019-07-14 16:11:46', 'Y', 6, 0, 9),
(3, 'supplier 000003', 'អ្នកដឹកជញ្ជូន 000003', '098232563', 'supl@gmail.com', 'dddddd', 'ppppp', NULL, '2019-07-15 01:31:53', '2019-07-16 16:18:33', 'Y', 6, 0, 9);

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
  `usr_edit_yn` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
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

INSERT INTO `tbl_user` (`usr_id`, `usr_nm`, `usr_pwd`, `usr_wri_yn`, `usr_edit_yn`, `usr_menu`, `regDt`, `upDt`, `useYn`, `regUsr`, `upUsr`, `sta_id`, `com_id`, `usr_str`) VALUES
(1, '1', 'X/Cf1cmof5aDa8iuIVN2oNgoJfmUQd8gqvPSGDMhgemDRsKhQYzdFHCzdqX3uQIBQIe0n79RnGMMMpynqvkTQg==', 'Y', 'Y', NULL, '2018-09-12 11:50:39', NULL, 'Y', 0, 0, 1, 1, 'Y'),
(2, '2', 'UFAmn6pBQ/wWmNHnGL7pQtAB/Sm2jRyrGFVGheCCGK6tzD4hB4GDw58ndNPZIJwSjLp1qNi5N+yVVL4El2TZ1Q==', 'Y', 'Y', NULL, '2018-09-12 11:54:03', NULL, 'Y', 0, 0, 2, 2, 'Y'),
(3, '3', '1AjILh2WSR7Js5Xkprm0kVoDnHvpMGVj2i3nKUfmb8M8Pa9USbFLZBej/uGxPOOLMPTfVc+l093D2WLdJkcHAg==', 'Y', 'Y', NULL, '2018-09-12 12:04:03', NULL, 'Y', 0, 0, 3, 3, 'Y'),
(4, '4', 'qis8su6y7KgIF9Dsm/QFsA2RMU8YiPtVwcGHmhW2vqXjxMOf7Z3PEv1jbUFx2QrgFsR/Pp9ORoraQDjb8LcofA==', 'Y', 'Y', NULL, '2018-09-12 13:05:35', NULL, 'Y', 0, 0, 4, 4, 'Y'),
(5, '5', 'N0UOR8kWY8jHrALGmJyhNaaP7eHlSTxz5Fxn1+YEIutetEJ/VmcuaNzU4lx9CRMwvcJSaXcakndkw/B9I0+GSQ==', 'Y', 'Y', NULL, '2018-09-12 13:14:32', NULL, 'Y', 0, 0, 5, 5, 'Y'),
(6, 'a', 'N0UOR8kWY8jHrALGmJyhNaaP7eHlSTxz5Fxn1+YEIutetEJ/VmcuaNzU4lx9CRMwvcJSaXcakndkw/B9I0+GSQ==', 'Y', 'Y', NULL, '2019-07-10 11:29:12', NULL, 'Y', 0, 0, 11, 9, 'Y'),
(7, 'na', 'TUYHumnQSCdt5hI/B3zMMvF5OO2KaMqK6WgepIBqpcPZHDEpjHNnkgwpMAyQvx/8f1qW4Ud4QboT/5nAa8vQAw==', 'Y', 'N', NULL, '2019-07-15 09:29:19', '2019-07-21 20:03:30', 'N', 6, 6, 12, 9, 'Y'),
(8, 'dd', 'sb3Qo30Ez4f/QSLXx860WZZ6AB4qsh3Btut/g0z7p56kl8UUKIfTPy82Sj9ButP5fFRYrRhvYm0BsTNI+Tz+ng==', 'Y', 'N', NULL, '2019-07-15 09:30:36', '2019-07-22 14:33:43', 'N', 6, 6, 12, 9, 'Y'),
(9, 'nn', '+23KzHl682nc2UDtv3aA4qi2S8mVSyCzPyJ6g8Z7J9UCuZU1FvUDQ51HEMWJ4FtRSDKY9vezhkbH4G3IcNyjow==', 'Y', 'N', NULL, '2019-07-15 09:33:25', '2019-07-19 13:26:48', 'N', 6, 6, 12, 9, 'Y'),
(10, 'nn', 'QPAcIGQc3hLSZ4N+Mysu7TEiKMeic53Dzdx5UStS/Rzc6Zt3R6aar7/+6RDa2ppY1QUWF45+3xxDI+9AbAVj5w==', 'Y', 'N', NULL, '2019-07-18 14:40:36', '2019-07-19 13:26:48', 'N', 6, 6, 12, 9, 'Y'),
(11, 'nn', '/E2sb9CXi3UFu8kdwVM8KwalJYmWtInwpCgz2vXqc1JSMDZgRgM3zcKF78Zfzmc0pda4OJN53khnIYQa2HYpRQ==', 'Y', 'N', NULL, '2019-07-18 14:40:52', '2019-07-19 13:26:48', 'N', 6, 6, 12, 9, 'Y'),
(12, 'nn', '1wDUhsIRPWlavQrr/If64ZtRUgfJ8MZq13j1+pX93FitvBO2xI0dFOC8ABC36LlR24w/9N3GWYNALFvDzzsA9g==', 'N', 'N', NULL, '2019-07-22 21:37:29', '2019-07-22 21:37:29', 'Y', 6, 6, 12, 9, 'Y'),
(13, 'nnn', '6bbUeFr6OdkrASBnv3tikUEMsJaRFmkIHk8KEcZ3iIGlIJ9I2l5H1kqT/Rdc3hSBdt/8h+4AbtOqIGxMeovk1Q==', 'Y', 'N', NULL, '2019-07-19 12:38:35', '2019-07-19 13:26:39', 'N', 6, 6, 12, 9, 'Y'),
(14, 'SS', 'ANACv2/yVXTN46mpq0LWV/SCHkm4KbxbX80k55cOWCzggkmPq6CEK5LJrVEmH5bMbps9BulewtALx0RHHxfZNA==', 'Y', 'Y', NULL, '2019-07-22 16:56:57', '2019-07-22 16:56:57', 'Y', 6, 6, 13, 9, 'Y');

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
-- Indexes for table `tbl_commission`
--
ALTER TABLE `tbl_commission`
  ADD PRIMARY KEY (`commi_id`);

--
-- Indexes for table `tbl_company`
--
ALTER TABLE `tbl_company`
  ADD PRIMARY KEY (`com_id`);

--
-- Indexes for table `tbl_contract`
--
ALTER TABLE `tbl_contract`
  ADD PRIMARY KEY (`con_id`),
  ADD UNIQUE KEY `con_no` (`con_no`);

--
-- Indexes for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  ADD PRIMARY KEY (`cus_id`);

--
-- Indexes for table `tbl_expend`
--
ALTER TABLE `tbl_expend`
  ADD PRIMARY KEY (`exp_id`);

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
-- Indexes for table `tbl_salary`
--
ALTER TABLE `tbl_salary`
  ADD PRIMARY KEY (`sal_id`);

--
-- Indexes for table `tbl_sell`
--
ALTER TABLE `tbl_sell`
  ADD PRIMARY KEY (`sell_id`);

--
-- Indexes for table `tbl_sell_import_detail`
--
ALTER TABLE `tbl_sell_import_detail`
  ADD PRIMARY KEY (`sell_id`,`pro_id`);

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
  MODIFY `bra_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `tbl_branch_type`
--
ALTER TABLE `tbl_branch_type`
  MODIFY `bra_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `tbl_commission`
--
ALTER TABLE `tbl_commission`
  MODIFY `commi_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `tbl_company`
--
ALTER TABLE `tbl_company`
  MODIFY `com_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `tbl_contract`
--
ALTER TABLE `tbl_contract`
  MODIFY `con_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  MODIFY `cus_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `tbl_expend`
--
ALTER TABLE `tbl_expend`
  MODIFY `exp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
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
  MODIFY `pro_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `tbl_salary`
--
ALTER TABLE `tbl_salary`
  MODIFY `sal_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `tbl_sell`
--
ALTER TABLE `tbl_sell`
  MODIFY `sell_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
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
  MODIFY `sup_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tbl_use`
--
ALTER TABLE `tbl_use`
  MODIFY `use_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `usr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `tbl_use_detail_status`
--
ALTER TABLE `tbl_use_detail_status`
  MODIFY `use_stat_id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
