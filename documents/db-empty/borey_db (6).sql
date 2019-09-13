-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 13, 2019 at 02:32 AM
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
  `color_code` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
