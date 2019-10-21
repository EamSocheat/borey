-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 21, 2019 at 04:43 AM
-- Server version: 5.7.19
-- PHP Version: 7.0.23

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
(1, 'Galaxy11', '017661122', '098661122', 'galaxy-11@gmail.com', 'Phnom Penh', '', '2019-09-13 02:54:34', '2019-09-13 02:54:46', 'Y', 2, 2, 2, 1, 'កាឡាក់ស៊ី១១');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`cat_id`, `cat_nm`, `cat_nm_kh`, `cat_des`, `regDt`, `upDt`, `useYn`, `upUsr`, `regUsr`, `com_id`, `cat_photo`) VALUES
(1, 'Villa', 'វីឡា', '', '2019-09-13 02:55:02', NULL, 'Y', 0, 2, 1, ''),
(2, 'Villa Hybrid', 'វីឡាកូនកាត់', '', '2019-09-13 02:55:07', NULL, 'Y', 0, 2, 1, '');

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
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_commission`
--

INSERT INTO `tbl_commission` (`commi_id`, `commi_amt`, `commi_type`, `commi_is_approve`, `commi_approve_date`, `commi_approve_des`, `sell_id`, `regDt`, `upDt`, `useYn`, `regUsr`, `upUsr`, `com_id`, `commi_amt_approve`) VALUES
(1, 600, 'S', 'P', NULL, NULL, 2, '2019-09-13 17:27:37', NULL, 'Y', 2, NULL, 1, NULL),
(2, 120, 'A', 'P', '2019-09-13', 'aaaaddddd', 2, '2019-09-13 17:27:37', '2019-09-13 16:13:28', 'Y', 2, 2, 1, 120),
(3, 600, 'S', 'Y', '2019-09-13', '4444', 3, '2019-09-13 16:05:19', NULL, 'Y', 2, NULL, 1, 900),
(4, 120, 'A', 'Y', '2019-10-09', 'aaaaa', 3, '2019-09-13 16:03:37', '2019-10-09 17:44:40', 'Y', 2, 2, 1, 120),
(5, 480, 'S', 'P', NULL, NULL, 4, '2019-09-23 14:24:36', NULL, 'Y', 2, NULL, 1, NULL),
(6, 120, 'A', 'P', NULL, NULL, 4, '2019-09-23 14:24:36', NULL, 'Y', 2, NULL, 1, NULL),
(7, 480, 'S', 'P', NULL, NULL, 6, '2019-10-10 15:36:51', NULL, 'Y', 2, NULL, 1, NULL),
(8, 120, 'A', 'P', NULL, NULL, 6, '2019-10-10 15:36:51', NULL, 'Y', 2, NULL, 1, NULL),
(9, 480, 'S', 'P', NULL, NULL, 7, '2019-10-10 15:41:44', NULL, 'Y', 2, NULL, 1, NULL),
(10, 120, 'A', 'P', NULL, NULL, 7, '2019-10-10 15:41:44', NULL, 'Y', 2, NULL, 1, NULL),
(11, 480, 'S', 'P', NULL, NULL, 8, '2019-10-10 15:55:36', NULL, 'Y', 2, NULL, 1, NULL),
(12, 120, 'A', 'P', NULL, NULL, 8, '2019-10-10 15:55:36', NULL, 'Y', 2, NULL, 1, NULL);

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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_commission_setting`
--

INSERT INTO `tbl_commission_setting` (`comset_id`, `comset_salary_yn`, `comset_commi_yn`, `regDt`, `upDt`, `useYn`, `regUsr`, `upUsr`, `pos_id`, `bra_id`, `com_id`) VALUES
(1, 'Y', 'Y', '2019-09-13 17:19:12', NULL, 'Y', 2, 0, 4, 1, 1);

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
(1, 1, 'M', 600, 'P', 20, '2019-09-13 17:19:12', NULL, 'Y', 2, 0, 1),
(1, 2, 'M', 300, 'M', 20, '2019-09-13 17:19:12', NULL, 'Y', 2, 0, 1);

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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_contract`
--

INSERT INTO `tbl_contract` (`con_id`, `con_total_price`, `con_date`, `con_date_exp`, `con_des`, `con_sta`, `regDt`, `upDt`, `useYn`, `regUsr`, `upUsr`, `cus_id`, `com_id`, `seller_id`, `rec_id`, `con_code`, `con_pay_met`, `con_tran_id`, `con_pro_price`, `con_type_id`) VALUES
(1, 2000, '2019-09-13', '2019-09-15', '', 'S', '2019-09-13 15:10:18', '2019-09-13 15:11:30', 'Y', 2, 2, 1, 1, 2, 2, '000001', 1, '', NULL, 2),
(2, 2000, '2019-09-23', '2019-09-30', '123', 'S', '2019-09-23 14:22:39', '2019-09-23 14:24:36', 'Y', 2, 2, 1, 1, 2, 2, '000002', 1, '', NULL, 1),
(3, 2000, '2019-10-09', '2019-10-16', 'yes yes yes ', 'B', '2019-10-09 17:34:37', NULL, 'Y', 2, 0, 2, 1, 2, 2, '000003', 1, '', NULL, 1),
(4, 2000, '2019-10-09', '2019-10-16', '', 'B', '2019-10-09 17:36:25', NULL, 'Y', 2, 0, 2, 1, 2, 2, '000004', 1, '', NULL, 1),
(5, 2000, '2019-10-09', '2019-10-16', '', 'B', '2019-10-09 17:38:42', '2019-10-09 17:39:21', 'N', 2, 2, 2, 1, 2, 2, '000005', 1, '', NULL, 1),
(6, 2000, '2019-10-09', '2019-10-16', '', 'B', '2019-10-09 17:39:41', NULL, 'Y', 2, 0, 2, 1, 2, 2, '000006', 1, '', NULL, 1);

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
(1, 6, NULL, NULL, NULL, 150000, '2019-09-13 15:10:18', NULL, 'Y', 2, 0, 1, NULL),
(2, 5, NULL, NULL, NULL, 150000, '2019-09-23 14:22:39', NULL, 'Y', 2, 0, 1, NULL),
(3, 8, NULL, NULL, NULL, 150000, '2019-10-09 17:34:37', NULL, 'Y', 2, 0, 1, ''),
(4, 7, NULL, NULL, NULL, 150000, '2019-10-09 17:36:25', NULL, 'Y', 2, 0, 1, ''),
(5, 4, NULL, NULL, NULL, 150000, '2019-10-09 17:38:42', NULL, 'Y', 2, 0, 1, ''),
(6, 4, NULL, NULL, NULL, 150000, '2019-10-09 17:39:41', NULL, 'Y', 2, 0, 1, 'ដប់ប្រាំម៉ឺនដុល្លាគត់');

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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_contract_type`
--

INSERT INTO `tbl_contract_type` (`con_type_id`, `con_type_nm_kh`, `con_type_nm`, `con_type_inst_com_yn`) VALUES
(1, 'រំលស់ជាមួយក្រុមហ៊ុន', 'រំលស់ជាមួយក្រុមហ៊ុន', 'Y'),
(2, 'រំលស់ជាមួយធនាគារ', 'រំលស់ជាមួយធនាគារ', 'N');

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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_customer`
--

INSERT INTO `tbl_customer` (`cus_id`, `cus_nm`, `cus_nm_kh`, `cus_gender`, `cus_dob`, `cus_photo`, `cus_phone1`, `cus_phone2`, `cus_email`, `cus_fb_name`, `cus_addr`, `cus_des`, `cus_idnt_num`, `cus_idnt_type`, `regDt`, `upDt`, `useYn`, `regUsr`, `upUsr`, `com_id`, `cus_indt_date`) VALUES
(1, NULL, 'ជាតិ​ & ណារ៉ុង', 'MaleFemale', '1992-01-01', '', '010123456', '012345678', '', '', '', '', '01234567', NULL, '2019-09-13 07:43:02', NULL, 'Y', 2, '', 1, '2019-01-01'),
(2, NULL, 'សីហាសីហា', 'Male', '1992-01-01', '', '098765431', '', '', '', 'Phnom Penh Phnom Penh Phnom Penh Phnom Penh2 Phnom Penh3Phnom Penh4', '', '87654321', NULL, '2019-09-13 11:25:03', '2019-10-18 17:26:10', 'Y', 2, '2', 1, '2019-03-02');

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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=armscii8;

--
-- Dumping data for table `tbl_expend`
--

INSERT INTO `tbl_expend` (`exp_id`, `exp_total_price`, `exp_date`, `exp_des`, `exp_image`, `regDt`, `upDt`, `useYn`, `regUsr`, `upUsr`, `sta_id`, `sup_id`, `com_id`, `bra_id`) VALUES
(1, 90000, '2019-09-14', 'kkkkkkkkkkkkkppp', '', '2019-09-13 17:00:04', '2019-09-13 17:11:04', 'Y', 2, 2, 2, 1, 1, 1);

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
) ENGINE=MyISAM AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_installment`
--

INSERT INTO `tbl_installment` (`inst_id`, `inst_loan_amount`, `inst_interest_rate`, `inst_period_month`, `inst_first_installment_date`, `inst_date`, `inst_num`, `inst_amt_pay`, `inst_amt_principle`, `inst_amt_interest`, `inst_amt_balance`, `inst_amt_penalty`, `inst_cancel_yn`, `sell_id`, `regDt`, `upDt`, `useYn`, `regUsr`, `upUsr`, `com_id`, `inst_type`, `inst_pay_per`, `inst_dis_amt`, `inst_dis_per`, `inst_loan_amount_per`, `inst_paid_yn`) VALUES
(1, 2000, 0, 1, '2019-10-01', '2019-09-13', 1, 2000, 2000, 0, 148000, NULL, NULL, 1, '2019-09-13 15:11:30', NULL, 'Y', 2, NULL, 1, 'BOOK', 0, 0, 0, NULL, 'Y'),
(2, 45000, 0, 3, '2019-10-01', '2019-09-13', 2, 13000, 13000, 0, 135000, NULL, NULL, 1, '2019-09-13 15:11:30', '2019-09-13 15:18:29', 'Y', 2, 2, 1, 'ADV', 10, 0, 0, NULL, 'Y'),
(3, 45000, 0, 3, '2019-10-01', '2019-10-01', 3, 15000, 15000, 0, 120000, NULL, NULL, 1, '2019-09-13 15:11:30', NULL, 'Y', 2, NULL, 1, 'ADV', 10, 0, 0, NULL, 'N'),
(4, 45000, 0, 3, '2019-10-01', '2019-11-01', 4, 15000, 15000, 0, 105000, NULL, NULL, 1, '2019-09-13 15:11:30', NULL, 'Y', 2, NULL, 1, 'ADV', 10, 0, 0, NULL, 'N'),
(5, 105000, 0, 1, '2019-10-01', '2019-12-01', 5, 105000, 105000, 0, 0, NULL, NULL, 1, '2019-09-13 15:11:30', NULL, 'Y', 2, NULL, 1, 'LEFT', 70, 0, 0, NULL, 'N'),
(6, 45000, 0, 1, '2019-10-01', '2019-09-13', 1, 44100, 44100, 0, 105000, NULL, NULL, 2, '2019-09-13 17:27:37', '2019-09-13 17:29:55', 'Y', 2, 2, 1, 'ADV', 30, 900, 2, NULL, 'Y'),
(7, 105000, 0, 18, '2019-10-01', '2019-10-01', 2, 5833.33, 5833.33, 0, 99166.67, NULL, NULL, 2, '2019-09-13 17:27:37', '2019-09-23 15:03:00', 'Y', 2, 2, 1, 'LOAN', 0, 0, 0, NULL, 'Y'),
(8, 105000, 0, 18, '2019-10-01', '2019-11-01', 3, 5833.33, 5833.33, 0, 93333.34, NULL, NULL, 2, '2019-09-13 17:27:37', NULL, 'Y', 2, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(9, 105000, 0, 18, '2019-10-01', '2019-12-01', 4, 5833.33, 5833.33, 0, 87500.01, NULL, NULL, 2, '2019-09-13 17:27:37', NULL, 'Y', 2, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(10, 105000, 0, 18, '2019-10-01', '2020-01-01', 5, 5833.33, 5833.33, 0, 81666.68, NULL, NULL, 2, '2019-09-13 17:27:37', NULL, 'Y', 2, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(11, 105000, 0, 18, '2019-10-01', '2020-02-01', 6, 5833.33, 5833.33, 0, 75833.35, NULL, NULL, 2, '2019-09-13 17:27:37', NULL, 'Y', 2, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(12, 105000, 0, 18, '2019-10-01', '2020-03-01', 7, 5833.33, 5833.33, 0, 70000.02, NULL, NULL, 2, '2019-09-13 17:27:37', NULL, 'Y', 2, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(13, 105000, 0, 18, '2019-10-01', '2020-04-01', 8, 5833.33, 5833.33, 0, 64166.69, NULL, NULL, 2, '2019-09-13 17:27:37', NULL, 'Y', 2, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(14, 105000, 0, 18, '2019-10-01', '2020-05-01', 9, 5833.33, 5833.33, 0, 58333.36, NULL, NULL, 2, '2019-09-13 17:27:37', NULL, 'Y', 2, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(15, 105000, 0, 18, '2019-10-01', '2020-06-01', 10, 5833.33, 5833.33, 0, 52500.03, NULL, NULL, 2, '2019-09-13 17:27:37', NULL, 'Y', 2, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(16, 105000, 0, 18, '2019-10-01', '2020-07-01', 11, 5833.33, 5833.33, 0, 46666.7, NULL, NULL, 2, '2019-09-13 17:27:37', NULL, 'Y', 2, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(17, 105000, 0, 18, '2019-10-01', '2020-08-01', 12, 5833.33, 5833.33, 0, 40833.37, NULL, NULL, 2, '2019-09-13 17:27:37', NULL, 'Y', 2, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(18, 105000, 0, 18, '2019-10-01', '2020-09-01', 13, 5833.33, 5833.33, 0, 35000.04, NULL, NULL, 2, '2019-09-13 17:27:37', NULL, 'Y', 2, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(19, 105000, 0, 18, '2019-10-01', '2020-10-01', 14, 5833.33, 5833.33, 0, 29166.71, NULL, NULL, 2, '2019-09-13 17:27:37', NULL, 'Y', 2, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(20, 105000, 0, 18, '2019-10-01', '2020-11-01', 15, 5833.33, 5833.33, 0, 23333.38, NULL, NULL, 2, '2019-09-13 17:27:37', NULL, 'Y', 2, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(21, 105000, 0, 18, '2019-10-01', '2020-12-01', 16, 5833.33, 5833.33, 0, 17500.05, NULL, NULL, 2, '2019-09-13 17:27:37', NULL, 'Y', 2, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(22, 105000, 0, 18, '2019-10-01', '2021-01-01', 17, 5833.33, 5833.33, 0, 11666.72, NULL, NULL, 2, '2019-09-13 17:27:37', NULL, 'Y', 2, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(23, 105000, 0, 18, '2019-10-01', '2021-02-01', 18, 5833.33, 5833.33, 0, 5833.39, NULL, NULL, 2, '2019-09-13 17:27:37', NULL, 'Y', 2, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(24, 105000, 0, 18, '2019-10-01', '2021-03-01', 19, 5833.33, 5833.33, 0, 0, NULL, NULL, 2, '2019-09-13 17:27:37', NULL, 'Y', 2, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(25, 45000, 0, 3, '2019-09-15', '2019-09-13', 1, 15000, 15000, 0, 135000, NULL, NULL, 3, '2019-09-13 18:26:26', '2019-09-13 18:28:40', 'Y', 2, 2, 1, 'ADV', 10, 0, 0, NULL, 'Y'),
(26, 45000, 0, 3, '2019-09-15', '2019-09-15', 2, 15000, 15000, 0, 120000, NULL, NULL, 3, '2019-09-13 18:26:26', NULL, 'Y', 2, NULL, 1, 'ADV', 10, 0, 0, NULL, 'N'),
(27, 45000, 0, 3, '2019-09-15', '2019-10-15', 3, 15000, 15000, 0, 105000, NULL, NULL, 3, '2019-09-13 18:26:26', NULL, 'Y', 2, NULL, 1, 'ADV', 10, 0, 0, NULL, 'N'),
(28, 105000, 0, 15, '2019-09-15', '2019-11-15', 4, 7000, 7000, 0, 98000, NULL, NULL, 3, '2019-09-13 18:26:26', NULL, 'Y', 2, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(29, 105000, 0, 15, '2019-09-15', '2019-12-15', 5, 7000, 7000, 0, 91000, NULL, NULL, 3, '2019-09-13 18:26:26', NULL, 'Y', 2, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(30, 105000, 0, 15, '2019-09-15', '2020-01-15', 6, 7000, 7000, 0, 84000, NULL, NULL, 3, '2019-09-13 18:26:26', NULL, 'Y', 2, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(31, 105000, 0, 15, '2019-09-15', '2020-02-15', 7, 7000, 7000, 0, 77000, NULL, NULL, 3, '2019-09-13 18:26:26', NULL, 'Y', 2, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(32, 105000, 0, 15, '2019-09-15', '2020-03-15', 8, 7000, 7000, 0, 70000, NULL, NULL, 3, '2019-09-13 18:26:26', NULL, 'Y', 2, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(33, 105000, 0, 15, '2019-09-15', '2020-04-15', 9, 7000, 7000, 0, 63000, NULL, NULL, 3, '2019-09-13 18:26:26', NULL, 'Y', 2, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(34, 105000, 0, 15, '2019-09-15', '2020-05-15', 10, 7000, 7000, 0, 56000, NULL, NULL, 3, '2019-09-13 18:26:26', NULL, 'Y', 2, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(35, 105000, 0, 15, '2019-09-15', '2020-06-15', 11, 7000, 7000, 0, 49000, NULL, NULL, 3, '2019-09-13 18:26:26', NULL, 'Y', 2, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(36, 105000, 0, 15, '2019-09-15', '2020-07-15', 12, 7000, 7000, 0, 42000, NULL, NULL, 3, '2019-09-13 18:26:26', NULL, 'Y', 2, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(37, 105000, 0, 15, '2019-09-15', '2020-08-15', 13, 7000, 7000, 0, 35000, NULL, NULL, 3, '2019-09-13 18:26:26', NULL, 'Y', 2, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(38, 105000, 0, 15, '2019-09-15', '2020-09-15', 14, 7000, 7000, 0, 28000, NULL, NULL, 3, '2019-09-13 18:26:26', NULL, 'Y', 2, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(39, 105000, 0, 15, '2019-09-15', '2020-10-15', 15, 7000, 7000, 0, 21000, NULL, NULL, 3, '2019-09-13 18:26:26', NULL, 'Y', 2, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(40, 105000, 0, 15, '2019-09-15', '2020-11-15', 16, 7000, 7000, 0, 14000, NULL, NULL, 3, '2019-09-13 18:26:26', NULL, 'Y', 2, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(41, 105000, 0, 15, '2019-09-15', '2020-12-15', 17, 7000, 7000, 0, 7000, NULL, NULL, 3, '2019-09-13 18:26:26', NULL, 'Y', 2, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(42, 105000, 0, 15, '2019-09-15', '2021-01-15', 18, 7000, 7000, 0, 0, NULL, NULL, 3, '2019-09-13 18:26:26', NULL, 'Y', 2, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(43, 2000, 0, 1, '2019-10-01', '2019-09-23', 1, 2000, 2000, 0, 148000, NULL, NULL, 4, '2019-09-23 14:24:36', NULL, 'Y', 2, NULL, 1, 'BOOK', 0, 0, 0, NULL, 'Y'),
(44, 45000, 0, 3, '2019-10-01', '2019-09-23', 2, 13000, 13000, 0, 135000, NULL, NULL, 4, '2019-09-23 14:24:36', '2019-09-23 14:58:36', 'Y', 2, 2, 1, 'ADV', 10, 0, 0, NULL, 'Y'),
(45, 45000, 0, 3, '2019-10-01', '2019-10-01', 3, 15000, 15000, 0, 120000, NULL, NULL, 4, '2019-09-23 14:24:36', NULL, 'Y', 2, NULL, 1, 'ADV', 10, 0, 0, NULL, 'N'),
(46, 45000, 0, 3, '2019-10-01', '2019-11-01', 4, 15000, 15000, 0, 105000, NULL, NULL, 4, '2019-09-23 14:24:36', NULL, 'Y', 2, NULL, 1, 'ADV', 10, 0, 0, NULL, 'N'),
(47, 105000, 0, 15, '2019-10-01', '2019-12-01', 5, 7000, 7000, 0, 98000, NULL, NULL, 4, '2019-09-23 14:24:36', NULL, 'Y', 2, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(48, 105000, 0, 15, '2019-10-01', '2020-01-01', 6, 7000, 7000, 0, 91000, NULL, NULL, 4, '2019-09-23 14:24:36', NULL, 'Y', 2, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(49, 105000, 0, 15, '2019-10-01', '2020-02-01', 7, 7000, 7000, 0, 84000, NULL, NULL, 4, '2019-09-23 14:24:36', NULL, 'Y', 2, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(50, 105000, 0, 15, '2019-10-01', '2020-03-01', 8, 7000, 7000, 0, 77000, NULL, NULL, 4, '2019-09-23 14:24:36', NULL, 'Y', 2, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(51, 105000, 0, 15, '2019-10-01', '2020-04-01', 9, 7000, 7000, 0, 70000, NULL, NULL, 4, '2019-09-23 14:24:36', NULL, 'Y', 2, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(52, 105000, 0, 15, '2019-10-01', '2020-05-01', 10, 7000, 7000, 0, 63000, NULL, NULL, 4, '2019-09-23 14:24:36', NULL, 'Y', 2, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(53, 105000, 0, 15, '2019-10-01', '2020-06-01', 11, 7000, 7000, 0, 56000, NULL, NULL, 4, '2019-09-23 14:24:36', NULL, 'Y', 2, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(54, 105000, 0, 15, '2019-10-01', '2020-07-01', 12, 7000, 7000, 0, 49000, NULL, NULL, 4, '2019-09-23 14:24:36', NULL, 'Y', 2, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(55, 105000, 0, 15, '2019-10-01', '2020-08-01', 13, 7000, 7000, 0, 42000, NULL, NULL, 4, '2019-09-23 14:24:36', NULL, 'Y', 2, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(56, 105000, 0, 15, '2019-10-01', '2020-09-01', 14, 7000, 7000, 0, 35000, NULL, NULL, 4, '2019-09-23 14:24:36', NULL, 'Y', 2, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(57, 105000, 0, 15, '2019-10-01', '2020-10-01', 15, 7000, 7000, 0, 28000, NULL, NULL, 4, '2019-09-23 14:24:36', NULL, 'Y', 2, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(58, 105000, 0, 15, '2019-10-01', '2020-11-01', 16, 7000, 7000, 0, 21000, NULL, NULL, 4, '2019-09-23 14:24:36', NULL, 'Y', 2, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(59, 105000, 0, 15, '2019-10-01', '2020-12-01', 17, 7000, 7000, 0, 14000, NULL, NULL, 4, '2019-09-23 14:24:36', NULL, 'Y', 2, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(60, 105000, 0, 15, '2019-10-01', '2021-01-01', 18, 7000, 7000, 0, 7000, NULL, NULL, 4, '2019-09-23 14:24:36', NULL, 'Y', 2, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(61, 105000, 0, 15, '2019-10-01', '2021-02-01', 19, 7000, 7000, 0, 0, NULL, NULL, 4, '2019-09-23 14:24:36', NULL, 'Y', 2, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(62, 45000, 0, 1, '2019-11-01', '2019-10-10', 1, 45000, 45000, 0, 105000, NULL, NULL, 6, '2019-10-10 15:36:51', NULL, 'Y', 2, NULL, 1, 'ADV', 30, 0, 0, NULL, 'N'),
(63, 105000, 0, 18, '2019-11-01', '2019-11-01', 2, 5833.33, 5833.33, 0, 99166.67, NULL, NULL, 6, '2019-10-10 15:36:51', NULL, 'Y', 2, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(64, 105000, 0, 18, '2019-11-01', '2019-12-01', 3, 5833.33, 5833.33, 0, 93333.34, NULL, NULL, 6, '2019-10-10 15:36:51', NULL, 'Y', 2, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(65, 105000, 0, 18, '2019-11-01', '2020-01-01', 4, 5833.33, 5833.33, 0, 87500.01, NULL, NULL, 6, '2019-10-10 15:36:51', NULL, 'Y', 2, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(66, 105000, 0, 18, '2019-11-01', '2020-02-01', 5, 5833.33, 5833.33, 0, 81666.68, NULL, NULL, 6, '2019-10-10 15:36:51', NULL, 'Y', 2, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(67, 105000, 0, 18, '2019-11-01', '2020-03-01', 6, 5833.33, 5833.33, 0, 75833.35, NULL, NULL, 6, '2019-10-10 15:36:51', NULL, 'Y', 2, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(68, 105000, 0, 18, '2019-11-01', '2020-04-01', 7, 5833.33, 5833.33, 0, 70000.02, NULL, NULL, 6, '2019-10-10 15:36:51', NULL, 'Y', 2, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(69, 105000, 0, 18, '2019-11-01', '2020-05-01', 8, 5833.33, 5833.33, 0, 64166.69, NULL, NULL, 6, '2019-10-10 15:36:51', NULL, 'Y', 2, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(70, 105000, 0, 18, '2019-11-01', '2020-06-01', 9, 5833.33, 5833.33, 0, 58333.36, NULL, NULL, 6, '2019-10-10 15:36:51', NULL, 'Y', 2, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(71, 105000, 0, 18, '2019-11-01', '2020-07-01', 10, 5833.33, 5833.33, 0, 52500.03, NULL, NULL, 6, '2019-10-10 15:36:51', NULL, 'Y', 2, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(72, 105000, 0, 18, '2019-11-01', '2020-08-01', 11, 5833.33, 5833.33, 0, 46666.7, NULL, NULL, 6, '2019-10-10 15:36:51', NULL, 'Y', 2, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(73, 105000, 0, 18, '2019-11-01', '2020-09-01', 12, 5833.33, 5833.33, 0, 40833.37, NULL, NULL, 6, '2019-10-10 15:36:51', NULL, 'Y', 2, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(74, 105000, 0, 18, '2019-11-01', '2020-10-01', 13, 5833.33, 5833.33, 0, 35000.04, NULL, NULL, 6, '2019-10-10 15:36:51', NULL, 'Y', 2, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(75, 105000, 0, 18, '2019-11-01', '2020-11-01', 14, 5833.33, 5833.33, 0, 29166.71, NULL, NULL, 6, '2019-10-10 15:36:51', NULL, 'Y', 2, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(76, 105000, 0, 18, '2019-11-01', '2020-12-01', 15, 5833.33, 5833.33, 0, 23333.38, NULL, NULL, 6, '2019-10-10 15:36:51', NULL, 'Y', 2, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(77, 105000, 0, 18, '2019-11-01', '2021-01-01', 16, 5833.33, 5833.33, 0, 17500.05, NULL, NULL, 6, '2019-10-10 15:36:51', NULL, 'Y', 2, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(78, 105000, 0, 18, '2019-11-01', '2021-02-01', 17, 5833.33, 5833.33, 0, 11666.72, NULL, NULL, 6, '2019-10-10 15:36:51', NULL, 'Y', 2, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(79, 105000, 0, 18, '2019-11-01', '2021-03-01', 18, 5833.33, 5833.33, 0, 5833.39, NULL, NULL, 6, '2019-10-10 15:36:51', NULL, 'Y', 2, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(80, 105000, 0, 18, '2019-11-01', '2021-04-01', 19, 5833.33, 5833.33, 0, 0, NULL, NULL, 6, '2019-10-10 15:36:51', NULL, 'Y', 2, NULL, 1, 'LOAN', 0, 0, 0, NULL, 'N'),
(81, 45000, 0, 1, '2019-11-01', '2019-10-10', 1, 45000, 45000, 0, 105000, NULL, NULL, 7, '2019-10-10 15:41:44', NULL, 'Y', 2, NULL, 1, 'ADV', 30, 0, 0, NULL, 'N'),
(82, 105000, 0, 1, '2019-11-01', '2019-11-01', 2, 105000, 105000, 0, 0, NULL, NULL, 7, '2019-10-10 15:41:44', NULL, 'Y', 2, NULL, 1, 'LEFT', 70, 0, 0, NULL, 'N'),
(83, 45000, 0, 3, '2019-11-01', '2019-10-10', 1, 15000, 15000, 0, 135000, NULL, NULL, 8, '2019-10-10 15:55:36', NULL, 'Y', 2, NULL, 1, 'ADV', 10, 0, 0, NULL, 'N'),
(84, 45000, 0, 3, '2019-11-01', '2019-11-01', 2, 15000, 15000, 0, 120000, NULL, NULL, 8, '2019-10-10 15:55:36', NULL, 'Y', 2, NULL, 1, 'ADV', 10, 0, 0, NULL, 'N'),
(85, 45000, 0, 3, '2019-11-01', '2019-12-01', 3, 15000, 15000, 0, 105000, NULL, NULL, 8, '2019-10-10 15:55:36', NULL, 'Y', 2, NULL, 1, 'ADV', 10, 0, 0, NULL, 'N'),
(86, 105000, 0, 1, '2019-11-01', '2020-01-01', 4, 105000, 105000, 0, 0, NULL, NULL, 8, '2019-10-10 15:55:36', NULL, 'Y', 2, NULL, 1, 'LEFT', 70, 0, 0, NULL, 'N');

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
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_installment_payment`
--

INSERT INTO `tbl_installment_payment` (`inst_paid_id`, `inst_total_paid_amount`, `inst_paid_yn`, `inst_paid_date`, `inst_paid_des`, `inst_paid_status`, `inst_cancel_yn`, `rec_id`, `met_id`, `inst_id`, `regDt`, `upDt`, `useYn`, `regUsr`, `upUsr`, `com_id`, `inst_paid_penalty`, `inst_paid_inv_code`, `inst_paid_code`, `inst_paid_tran_id`) VALUES
(1, 2000, 'Y', '2019-09-13', NULL, 'BOOK', NULL, 2, 1, 1, '2019-09-13 15:11:30', NULL, 'Y', 2, NULL, 1, NULL, '000001', NULL, NULL),
(2, 13000, 'Y', '2019-09-13', '', 'ADV', NULL, 2, 1, 2, '2019-09-13 15:18:29', NULL, 'Y', 2, NULL, 1, 0, '000002', '000002', ''),
(3, 44100, 'Y', '2019-09-13', '', 'ADV', NULL, 2, 2, 6, '2019-09-13 17:29:55', NULL, 'Y', 2, NULL, 1, 0, '000001', '000003', '12345678'),
(4, 15000, 'Y', '2019-09-13', '', 'ADV', NULL, 2, 1, 25, '2019-09-13 18:28:40', NULL, 'Y', 2, NULL, 1, 0, '000001', '000004', ''),
(5, 2000, 'Y', '2019-09-23', NULL, 'BOOK', NULL, 2, 1, 43, '2019-09-23 14:24:36', NULL, 'Y', 2, NULL, 1, NULL, '000001', NULL, NULL),
(6, 13000, 'Y', '2019-09-23', '', 'ADV', NULL, 2, 1, 44, '2019-09-23 14:58:36', NULL, 'Y', 2, NULL, 1, 0, '000002', '000006', ''),
(7, 5833.33, 'Y', '2019-09-23', '', 'LOAN', NULL, 2, 1, 7, '2019-09-23 15:03:00', NULL, 'Y', 2, NULL, 1, 10, '000002', '000007', '');

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
(3, 2, NULL, '2019-09-13 09:50:01', 'Y'),
(4, 2, NULL, '2019-09-13 09:50:01', 'Y'),
(5, 2, NULL, '2019-09-13 09:50:01', 'Y'),
(6, 2, NULL, '2019-09-13 09:50:01', 'Y'),
(7, 2, NULL, '2019-09-13 09:50:01', 'Y'),
(8, 2, NULL, '2019-09-13 09:50:01', 'Y'),
(9, 2, NULL, '2019-09-13 09:50:01', 'Y'),
(10, 2, NULL, '2019-09-13 09:50:01', 'Y'),
(11, 2, NULL, '2019-09-13 09:50:01', 'Y'),
(12, 2, NULL, '2019-09-13 09:50:01', 'Y'),
(13, 2, NULL, '2019-09-13 09:50:01', 'Y'),
(14, 2, NULL, '2019-09-13 09:50:01', 'Y'),
(15, 2, NULL, '2019-09-13 09:50:01', 'Y'),
(16, 2, NULL, '2019-09-13 09:50:01', 'Y'),
(17, 2, NULL, '2019-09-13 09:50:01', 'Y'),
(18, 2, NULL, '2019-09-13 09:50:01', 'Y'),
(19, 2, NULL, '2019-09-13 09:50:01', 'Y');

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
  `pos_get_yn` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`pos_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_position`
--

INSERT INTO `tbl_position` (`pos_id`, `pos_nm`, `pos_nm_kh`, `pos_des`, `regDt`, `upDt`, `useYn`, `regUsr`, `upUsr`, `com_id`, `pos_get_yn`) VALUES
(1, 'Admin', 'ម្ចាស់ក្រុមហ៊ុន', NULL, '2019-09-13 09:50:01', NULL, 'Y', 0, 0, 1, 'N'),
(2, 'Account', 'គណនី', '', '2019-09-13 04:43:11', NULL, 'Y', 2, 0, 1, 'Y'),
(3, 'Engineer ', 'វិស្វករ', '', '2019-09-13 04:45:51', NULL, 'Y', 2, 0, 1, 'Y'),
(4, 'Seller', 'អ្នកលក់', '', '2019-09-13 04:46:24', NULL, 'Y', 2, 0, 1, 'Y');

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
  `pro_land_width` double DEFAULT NULL,
  `pro_land_height` double DEFAULT NULL,
  PRIMARY KEY (`pro_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_product`
--

INSERT INTO `tbl_product` (`pro_id`, `pro_code`, `pro_price`, `pro_sale_price`, `pro_number`, `pro_street`, `pro_photo`, `pro_length`, `pro_width`, `pro_area`, `pro_room`, `pro_toilet`, `pro_floor`, `pro_des`, `pro_status`, `regDt`, `upDt`, `useYn`, `regUsr`, `upUsr`, `com_id`, `cat_id`, `bra_id`, `pro_land_width`, `pro_land_height`) VALUES
(1, 'C1', 150000, 0, '1', '1', '', 20, 30, 600, 4, 5, 2, '', 'S', '2019-09-13 04:52:15', '2019-09-13 18:26:25', 'Y', 2, 2, 1, 1, 1, NULL, NULL),
(2, '12', 150000, 0, NULL, '1', NULL, 20, 30, 600, 4, 5, 2, '', 'S', '2019-09-13 13:30:18', '2019-10-10 15:36:51', 'Y', 2, 2, 1, 1, 1, NULL, NULL),
(3, 'C2', 150000, 0, NULL, '1', '', 20, 30, 600, 4, 5, 2, '', 'S', '2019-09-13 13:34:32', '2019-09-13 17:27:37', 'Y', 2, 2, 1, 1, 1, NULL, NULL),
(4, '2', 150000, NULL, '', '1', '', 20, 30, 600, 4, 5, 2, '', 'B', '2019-09-13 13:34:50', '2019-10-09 17:06:15', 'Y', 2, 2, 1, 1, 1, 10, 10),
(5, '3', 150000, 0, NULL, '1', '', 20, 30, 600, 4, 5, 2, '', 'S', '2019-09-13 13:38:29', '2019-09-23 14:24:36', 'Y', 2, 2, 1, 1, 1, NULL, NULL),
(6, 'C3', 150000, 0, '', '1', '', 20, 30, 600, 4, 5, 0, '', 'S', '2019-09-13 13:39:25', '2019-10-09 16:48:18', 'Y', 2, 2, 1, 1, 1, NULL, NULL),
(7, '4', 150000, NULL, NULL, '1', '', 20, 30, 600, 4, 5, 2, '', 'B', '2019-10-09 17:07:39', NULL, 'Y', 2, 0, 1, 1, 1, 10, 10),
(8, '5', 150000, NULL, NULL, '1', '', 20, 30, 600, 4, 5, 2, '', 'B', '2019-10-09 17:07:39', NULL, 'Y', 2, 0, 1, 1, 1, 10, 10),
(9, '6', 150000, NULL, NULL, '1', '', 20, 30, 600, 4, 5, 2, '', 'F', '2019-10-10 15:41:08', NULL, 'Y', 2, 0, 1, 1, 1, 10, 10),
(10, '7', 150000, NULL, NULL, '1', '', 20, 30, 600, 4, 5, 2, '', 'F', '2019-10-10 15:41:08', NULL, 'Y', 2, 0, 1, 1, 1, 10, 10),
(11, '8', 150000, NULL, NULL, '1', '', 20, 30, 600, 4, 5, 2, '', 'F', '2019-10-10 15:41:08', NULL, 'Y', 2, 0, 1, 1, 1, 10, 10),
(12, '9', 150000, 0, NULL, '1', '', 20, 30, 600, 4, 5, 2, '', 'S', '2019-10-10 15:41:08', '2019-10-10 15:55:36', 'Y', 2, 2, 1, 1, 1, 10, 30),
(13, '10', 150000, 0, NULL, '1', '', 20, 30, 600, 4, 5, 2, '', 'S', '2019-10-10 15:41:09', '2019-10-10 15:41:44', 'Y', 2, 2, 1, 1, 1, 10, 10);

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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=armscii8;

--
-- Dumping data for table `tbl_salary`
--

INSERT INTO `tbl_salary` (`sal_id`, `sal_start_dt`, `sal_end_dt`, `sal_month`, `sal_amt`, `sal_comm`, `sal_overtime`, `sal_get_date`, `sta_id`, `sal_status`, `regDt`, `upDt`, `useYn`, `regUsr`, `upUsr`, `com_id`) VALUES
(1, '2019-09-01', '2019-10-01', '2019-09-01', 900, 20, 10, '2019-09-13', 2, 'G', '2019-09-13 17:16:28', '2019-09-13 17:16:38', 'Y', 2, 2, 1);

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
  `cus_id` int(11) DEFAULT NULL,
  `con_type_id` int(11) DEFAULT NULL,
  `sell_inst_yn` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`sell_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_sell`
--

INSERT INTO `tbl_sell` (`sell_id`, `sell_date`, `sell_total_price`, `sell_dis_per`, `sell_dis_amt`, `sell_price_before_dis`, `sell_des`, `sell_code`, `con_id`, `rec_id`, `seller_id`, `regDt`, `upDt`, `useYn`, `regUsr`, `upUsr`, `com_id`, `cus_id`, `con_type_id`, `sell_inst_yn`) VALUES
(1, '2019-09-13', 150000, NULL, NULL, NULL, '', '000001', 1, NULL, 2, '2019-09-13 15:11:30', NULL, 'Y', 2, NULL, 1, 1, 2, 'N'),
(2, '2019-09-13', 150000, NULL, NULL, NULL, 'បន្ថែម ទូរដាក់ចាន', '000002', 0, NULL, 2, '2019-09-13 17:27:37', NULL, 'Y', 2, NULL, 1, 1, 1, 'Y'),
(3, '2019-09-13', 150000, NULL, NULL, NULL, '', '000003', 0, NULL, 2, '2019-09-13 18:26:25', NULL, 'Y', 2, NULL, 1, 2, 1, 'Y'),
(4, '2019-09-23', 150000, NULL, NULL, NULL, '123', '000004', 2, NULL, 2, '2019-09-23 14:24:36', NULL, 'Y', 2, NULL, 1, 1, 1, 'Y'),
(7, '2019-10-10', 150000, NULL, NULL, NULL, '', '000007', 0, NULL, 2, '2019-10-10 15:41:44', NULL, 'Y', 2, NULL, 1, 2, 2, 'N'),
(6, '2019-10-10', 150000, NULL, NULL, NULL, '', '000006', 0, NULL, 2, '2019-10-10 15:36:51', NULL, 'Y', 2, NULL, 1, 1, 1, 'Y'),
(8, '2019-10-10', 150000, NULL, NULL, NULL, '', '000008', 0, NULL, 2, '2019-10-10 15:55:36', NULL, 'Y', 2, NULL, 1, 2, 2, 'N');

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
  PRIMARY KEY (`pro_id`,`sell_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_sell_detail`
--

INSERT INTO `tbl_sell_detail` (`sell_id`, `pro_id`, `pro_price`, `pro_sell_price`, `regDt`, `upDt`, `useYn`, `regUsr`, `upUsr`, `com_id`, `pro_sell_price_desc`) VALUES
(1, 6, NULL, 150000, '2019-09-13 15:11:30', NULL, 'Y', 2, NULL, 1, NULL),
(2, 3, NULL, 150000, '2019-09-13 17:27:37', NULL, 'Y', 2, NULL, 1, NULL),
(3, 1, NULL, 150000, '2019-09-13 18:26:25', NULL, 'Y', 2, NULL, 1, NULL),
(4, 5, NULL, 150000, '2019-09-23 14:24:36', NULL, 'Y', 2, NULL, 1, NULL),
(6, 2, NULL, 150000, '2019-10-10 15:36:51', NULL, 'Y', 2, NULL, 1, ''),
(7, 13, NULL, 150000, '2019-10-10 15:41:44', NULL, 'Y', 2, NULL, 1, ''),
(8, 12, NULL, 150000, '2019-10-10 15:55:36', NULL, 'Y', 2, NULL, 1, 'ដប់ប្រាំម៉ឺនដុល្លាគត់');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_staff`
--

INSERT INTO `tbl_staff` (`sta_id`, `sta_nm`, `sta_nm_kh`, `sta_gender`, `sta_dob`, `sta_photo`, `sta_phone1`, `sta_phone2`, `sta_email`, `sta_addr`, `sta_des`, `sta_start_dt`, `sta_end_dt`, `regDt`, `upDt`, `useYn`, `regUsr`, `upUsr`, `pos_id`, `bra_id`, `com_id`) VALUES
(1, 'admin', NULL, '', NULL, NULL, '01023456', NULL, NULL, NULL, NULL, NULL, NULL, '2019-09-13 09:50:01', NULL, 'Y', 0, 0, 1, NULL, 1),
(2, 'Eam Socheat', 'អ៊ាមសុជាតិ', 'M', '1992-01-01', '', '010527752', '', '', 'Phnom Penh', '', '2019-09-01', '1970-01-01', '2019-09-13 04:47:48', '2019-09-13 04:47:54', 'Y', 2, 2, 4, 0, 1),
(3, 'Test', 'តេសតេ', 'F', '1992-01-01', '', '098767676', '', '', '', '', '2019-06-09', '1970-01-01', '2019-09-13 11:39:22', NULL, 'Y', 2, 0, 2, 0, 1);

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
(1, 'Garden 168', '010234567', '', 'Phnom Penh', 'A', NULL, '2019-09-13 16:26:22', '2019-09-13 16:26:30', 'Y', 2, 0, 1, 'សួនផ្ការ១៦៨');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`usr_id`, `usr_nm`, `usr_pwd`, `usr_wri_yn`, `usr_menu`, `regDt`, `upDt`, `useYn`, `regUsr`, `upUsr`, `sta_id`, `com_id`, `usr_str`, `usr_edit_yn`) VALUES
(1, 'admin', 'jrwt8jhu+GKexkqTwm9oJ4v0BFvopM86nBjcOqTUQb+Fcawzq8ur/n5JR85YHGbFu/oCHUs5x6ykhqGwYMmCHA==', 'Y', NULL, '2019-09-13 09:38:22', NULL, 'Y', 0, 0, 12, 1, 'Y', 'Y'),
(2, 'admin', 'cdbzgZxByB1c//uZmctwwk8JSLgJDZSuDjpSUhhhVotNkdfAHL/U9x4D9+dvXeauf65b+vA2dcEegeE/41H69Q==', 'Y', NULL, '2019-09-13 09:50:01', NULL, 'Y', 0, 0, 1, 1, 'Y', 'Y');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
