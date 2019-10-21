-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 14, 2019 at 06:48 AM
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
(1, 'Villa', 'វីឡាទោល', '', '2019-09-13 02:55:02', '2019-09-17 16:31:15', 'Y', 3, 2, 1, ''),
(2, 'Villa Hybrid', 'វីឡាកូនកាត់', '', '2019-09-13 02:55:07', '2019-09-17 14:57:05', 'N', 3, 2, 1, ''),
(3, 'Shop House', 'ផ្ទះអាជីវកម្ម', '', '2019-09-17 14:54:22', NULL, 'Y', 0, 3, 1, ''),
(4, 'Villa Prince', 'វីឡាព្រីសន៍', '', '2019-09-17 14:54:49', '2019-09-17 16:31:42', 'Y', 3, 3, 1, '');

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_commission_setting`
--

INSERT INTO `tbl_commission_setting` (`comset_id`, `comset_salary_yn`, `comset_commi_yn`, `regDt`, `upDt`, `useYn`, `regUsr`, `upUsr`, `pos_id`, `bra_id`, `com_id`) VALUES
(1, 'N', 'N', '2019-09-17 15:24:10', NULL, 'Y', 3, 0, 5, 1, 1),
(2, 'N', 'N', '2019-09-17 15:29:27', NULL, 'Y', 3, 0, 2, 1, 1),
(3, 'N', 'N', '2019-10-14 13:06:25', '2019-10-14 13:06:25', 'Y', 2, 3, 4, 1, 1);

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
(3, 1, 'M', 500, 'P', 20, '2019-10-14 13:06:25', NULL, 'Y', 3, 0, 1);

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
  `con_total_price_desc` text,
  PRIMARY KEY (`con_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_contract_type`
--

INSERT INTO `tbl_contract_type` (`con_type_id`, `con_type_nm_kh`, `con_type_nm`, `con_type_inst_com_yn`) VALUES
(1, 'រំលស់ជាមួយក្រុមហ៊ុន', 'រំលស់ជាមួយក្រុមហ៊ុន', 'Y'),
(2, 'រំលស់ជាមួយធនាគារ', 'រំលស់ជាមួយធនាគារ', 'N'),
(3, 'បង់១០០%', 'បង់១០០%', 'N');

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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_customer`
--

INSERT INTO `tbl_customer` (`cus_id`, `cus_nm`, `cus_nm_kh`, `cus_gender`, `cus_dob`, `cus_photo`, `cus_phone1`, `cus_phone2`, `cus_email`, `cus_fb_name`, `cus_addr`, `cus_des`, `cus_idnt_num`, `cus_idnt_type`, `regDt`, `upDt`, `useYn`, `regUsr`, `upUsr`, `com_id`, `cus_indt_date`) VALUES
(1, NULL, 'មិត្ត', 'Male', '1992-01-01', '', '0102365456', '', '', '', 'Phnom Penh', 'sadfnsabfm', '123456789', NULL, '2019-09-17 15:13:56', '2019-10-14 13:08:08', 'N', 3, '2', 1, NULL),
(2, NULL, 'ថ្នីថ្នី', 'Female', '1992-01-01', '', '010258963', '', '', '', 'Phnom Penh', '', '123654789', NULL, '2019-09-17 15:26:27', '2019-10-14 13:08:08', 'N', 3, '2', 1, NULL),
(3, NULL, 'ទេស ដារ៉ាវិចិត្រ', 'Male', '1992-05-05', '', '012222523', '', '', '', '', 'A5', '01210000', NULL, '2019-09-17 16:47:37', '2019-10-14 13:08:08', 'N', 3, '2', 1, NULL),
(4, NULL, 'KerKer', 'Male', '2019-01-01', '', '012000506', '0965855543', '', '', 'pp', '', '1221111', NULL, '2019-09-17 17:18:23', '2019-10-14 13:08:08', 'N', 3, '2', 1, NULL);

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_position`
--

INSERT INTO `tbl_position` (`pos_id`, `pos_nm`, `pos_nm_kh`, `pos_des`, `regDt`, `upDt`, `useYn`, `regUsr`, `upUsr`, `com_id`, `pos_get_yn`) VALUES
(1, 'Admin', 'ម្ចាស់ក្រុមហ៊ុន', NULL, '2019-09-13 09:50:01', NULL, 'Y', 0, 0, 1, 'N'),
(2, 'Accountant', 'គណនី', '', '2019-09-13 04:43:11', '2019-10-14 13:03:55', 'Y', 2, 0, 1, 'Y'),
(3, 'Engineer ', 'វិស្វករ', '', '2019-09-13 04:45:51', '2019-09-15 00:34:28', 'N', 2, 0, 1, 'Y'),
(4, 'Seller', 'អ្នកលក់', '', '2019-09-13 04:46:24', NULL, 'Y', 2, 0, 1, 'Y'),
(5, 'Agency', 'ភ្នាក់ងារ', '', '2019-09-17 15:18:07', NULL, 'Y', 3, 0, 1, 'Y');

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_product`
--

INSERT INTO `tbl_product` (`pro_id`, `pro_code`, `pro_price`, `pro_sale_price`, `pro_number`, `pro_street`, `pro_photo`, `pro_length`, `pro_width`, `pro_area`, `pro_room`, `pro_toilet`, `pro_floor`, `pro_des`, `pro_status`, `regDt`, `upDt`, `useYn`, `regUsr`, `upUsr`, `com_id`, `cat_id`, `bra_id`, `pro_land_width`, `pro_land_height`) VALUES
(1, 'AA1', 159000, NULL, '', '', '', 15, 4.2, 63, 3, 4, 2.5, '', 'F', '2019-10-14 13:20:35', '2019-10-14 13:38:59', 'Y', 3, 3, 1, 3, 1, 4.2, 23),
(2, 'A2', 149000, NULL, '', '', '', 15, 4.2, 63, 3, 4, 2.5, '', 'F', '2019-10-14 13:23:35', '2019-10-14 13:38:52', 'Y', 3, 3, 1, 3, 1, 4.2, 23),
(3, 'A3', 149000, NULL, '', '', '', 15, 4.2, 63, 3, 4, 2.5, '', 'F', '2019-10-14 13:31:01', '2019-10-14 13:38:45', 'Y', 3, 3, 1, 3, 1, 4.2, 23),
(4, 'AA4', 159000, NULL, '', '', '', 15, 4.2, 63, 3, 4, 2.5, '', 'F', '2019-10-14 13:32:07', '2019-10-14 13:38:35', 'Y', 3, 3, 1, 3, 1, 4.2, 23),
(5, 'AA5', 159000, NULL, '', '', '', 15, 4.2, 63, 3, 4, 2.5, '', 'F', '2019-10-14 13:33:16', '2019-10-14 13:38:15', 'Y', 3, 3, 1, 3, 1, 4.2, 23),
(6, 'A6', 149000, NULL, '', '', '', 15, 4.2, 63, 3, 4, 2.5, '', 'F', '2019-10-14 13:33:32', '2019-10-14 13:38:07', 'Y', 3, 3, 1, 3, 1, 4.2, 23),
(7, 'AA7', 159000, NULL, '', '', '', 15, 4.2, 63, 3, 4, 2.5, '', 'F', '2019-10-14 13:34:11', '2019-10-14 13:37:58', 'Y', 3, 3, 1, 3, 1, 4.2, 23),
(8, 'AA8', 159000, NULL, NULL, '', '', 15, 4.2, 63, 3, 4, 2.5, '', 'F', '2019-10-14 13:40:07', NULL, 'Y', 3, 0, 1, 3, 1, 4.2, 23),
(9, 'A9', 149000, NULL, '', '', '', 15, 4.2, 63, 3, 4, 2.5, '', 'F', '2019-10-14 13:40:24', '2019-10-14 13:40:45', 'Y', 3, 3, 1, 3, 1, 4.2, 23);

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
  `cus_id` int(11) DEFAULT NULL,
  `con_type_id` int(11) DEFAULT NULL,
  `sell_inst_yn` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`sell_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_staff`
--

INSERT INTO `tbl_staff` (`sta_id`, `sta_nm`, `sta_nm_kh`, `sta_gender`, `sta_dob`, `sta_photo`, `sta_phone1`, `sta_phone2`, `sta_email`, `sta_addr`, `sta_des`, `sta_start_dt`, `sta_end_dt`, `regDt`, `upDt`, `useYn`, `regUsr`, `upUsr`, `pos_id`, `bra_id`, `com_id`) VALUES
(1, 'admin', NULL, '', NULL, NULL, '01023456', NULL, NULL, NULL, NULL, NULL, NULL, '2019-09-13 09:50:01', NULL, 'Y', 0, 0, 1, NULL, 1),
(2, 'Khem Narong', 'ខែមណារ៉ុង', 'F', '1998-01-05', '', '0968795226', '', '', 'Phnom Penh', '', '2019-01-07', '1970-01-01', '2019-09-13 04:47:48', '2019-09-17 14:28:41', 'Y', 2, 2, 2, 0, 1),
(3, 'Test', 'តេសតេ', 'F', '1992-01-01', '', '098767676', '', '', '', '', '2019-06-09', '1970-01-01', '2019-09-13 11:39:22', '2019-09-17 14:28:48', 'N', 2, 2, 2, 0, 1),
(4, 'EamSocheat', 'សុជាតិ', 'F', '1992-01-01', '', '010527752', '', '', 'Phnom Penh', '', '2019-01-09', '1970-01-01', '2019-09-17 15:19:31', NULL, 'Y', 3, 0, 5, 0, 1),
(5, 'Hou Sovannary', 'ហ៊ូ សុវណ្ណារី', 'F', '1994-07-02', '', '0713596209', '0966034659', '', 'Phnom Penh', '', '2019-01-04', '1970-01-01', '2019-09-17 16:35:00', '2019-09-17 16:36:15', 'Y', 3, 3, 2, 0, 1),
(6, 'Sao Nakry', 'សៅ ណាគ្រី', 'F', '1999-04-07', '', '069899800', '089553533', '', '', '', '2018-10-01', '1970-01-01', '2019-10-14 13:11:34', NULL, 'Y', 3, 0, 4, 0, 1);

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
(1, 'admin', 'jrwt8jhu+GKexkqTwm9oJ4v0BFvopM86nBjcOqTUQb+Fcawzq8ur/n5JR85YHGbFu/oCHUs5x6ykhqGwYMmCHA==', 'Y', NULL, '2019-09-13 09:38:22', NULL, 'Y', 0, 0, 12, 1, 'Y', 'Y'),
(2, 'admin', 'cdbzgZxByB1c//uZmctwwk8JSLgJDZSuDjpSUhhhVotNkdfAHL/U9x4D9+dvXeauf65b+vA2dcEegeE/41H69Q==', 'Y', NULL, '2019-09-13 09:50:01', NULL, 'Y', 0, 0, 1, 1, 'Y', 'Y'),
(3, 'narong', 'Fmxr+LlNoCMFtKr6KNVRKiBgmTBdFO1DCFdG99v7ZrFmXjuKkyhE019VbONN6l5g9hcwA6HIZ0o4k5K2kREHYw==', 'Y', NULL, '2019-09-17 14:39:48', '2019-09-17 14:39:48', 'Y', 2, 2, 2, 1, 'Y', 'Y');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
