-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 21, 2018 at 08:19 AM
-- Server version: 5.6.26
-- PHP Version: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gidc`
--

-- --------------------------------------------------------

--
-- Table structure for table `area`
--

CREATE TABLE IF NOT EXISTS `area` (
  `area_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `total_area` int(11) DEFAULT NULL,
  `rate` int(11) NOT NULL,
  `flag` tinyint(4) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `area`
--

INSERT INTO `area` (`area_id`, `name`, `total_area`, `rate`, `flag`) VALUES
(9, 'Verna Industrial Estate', 1677552, 0, 0),
(10, 'Cuncolim Industrial Estate', 15000, 0, 0),
(11, 'Test1', 99999, 99, 0),
(12, 'Test2', 88889, 889, 0),
(13, 'Test3', 77777, 77, 0),
(14, 'Verna Industrial Estate', 1677552, 7, 0),
(15, 'Margao', 7777799, 56, 0),
(16, 'Margao', 7777799, 57, 0),
(17, 'Verna Industrial Estate', 1677552, 8, 0),
(18, 'Margao', 0, 57, 0),
(19, 'Verna Industrial Estate', 1677552, 2430, 0),
(20, 'Margao', 0, 1830, 0),
(21, 'Verna Industrial Estate', 0, 2430, 0),
(22, 'Verna Industrial Estate', 1000, 2430, 0),
(23, 'Margao', 1000, 1830, 1),
(24, 'Verna Industrial Estate', 0, 2430, 1);

-- --------------------------------------------------------

--
-- Table structure for table `area_rate`
--

CREATE TABLE IF NOT EXISTS `area_rate` (
  `area_rate_id` int(11) NOT NULL,
  `area_id` int(11) DEFAULT NULL,
  `area_rate` int(11) NOT NULL,
  `start_date` date NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `area_rate`
--

INSERT INTO `area_rate` (`area_rate_id`, `area_id`, `area_rate`, `start_date`) VALUES
(1, 9, 1500, '2018-04-11'),
(2, 9, 2000, '2018-04-11'),
(3, 9, 2500, '2018-04-12'),
(4, 9, 3000, '2018-04-20'),
(5, 9, 3500, '2018-04-20'),
(6, 9, 35000, '2018-04-20'),
(7, 9, 500, '2018-04-20'),
(8, 9, 3000, '2018-04-20'),
(9, 9, 3000, '2018-04-26'),
(10, 11, 15000, '2018-04-28');

-- --------------------------------------------------------

--
-- Table structure for table `auth_assignment`
--

CREATE TABLE IF NOT EXISTS `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `auth_assignment`
--

INSERT INTO `auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('accounts', '30', 1528110464),
('admin', '1', 1528110464),
('admin', '43', 1528689573),
('company', '45', NULL),
('company', '46', 1528689667),
('company', '47', 1528868828),
('company', '48', 1528881048);

-- --------------------------------------------------------

--
-- Table structure for table `auth_item`
--

CREATE TABLE IF NOT EXISTS `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `auth_item`
--

INSERT INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('accounts', 1, NULL, NULL, NULL, 1528110463, 1528110463),
('admin', 1, NULL, NULL, NULL, 1528110463, 1528110463),
('changePassword', 2, 'Delete User', NULL, NULL, 1528110463, 1528110463),
('company', 1, NULL, NULL, NULL, 1528110463, 1528110463),
('createArea', 2, 'Create a Area', NULL, NULL, 1528110463, 1528110463),
('createCompany', 2, 'Create a Company', NULL, NULL, 1528110463, 1528110463),
('createInterest', 2, 'Create a Interest', NULL, NULL, 1528110463, 1528110463),
('createInvoice', 2, 'Create a Invoice', NULL, NULL, 1528110463, 1528110463),
('createLog', 2, 'Create Log', NULL, NULL, 1528110463, 1528110463),
('createOrders', 2, 'Create a Orders', NULL, NULL, 1528110463, 1528110463),
('createPayment', 2, 'Create a Payment', NULL, NULL, 1528110463, 1528110463),
('createPlot', 2, 'Create a Plot', NULL, NULL, 1528110463, 1528110463),
('createRate', 2, 'Create a Rate', NULL, NULL, 1528110463, 1528110463),
('createSite', 2, 'Create a Site', NULL, NULL, 1528110463, 1528110463),
('createTax', 2, 'Create a Tax', NULL, NULL, 1528110463, 1528110463),
('createUsers', 2, 'Create a User', NULL, NULL, 1528110463, 1528110463),
('deleteArea', 2, 'Delete Area', NULL, NULL, 1528110463, 1528110463),
('deleteCompany', 2, 'Delete Company', NULL, NULL, 1528110463, 1528110463),
('deleteInterest', 2, 'Delete Interest', NULL, NULL, 1528110463, 1528110463),
('deleteInvoice', 2, 'Delete Invoice', NULL, NULL, 1528110463, 1528110463),
('deleteLog', 2, 'Delete Log', NULL, NULL, 1528110463, 1528110463),
('deleteOrder', 2, 'Delete Order', NULL, NULL, 1528110463, 1528110463),
('deletePayment', 2, 'Delete Payment', NULL, NULL, 1528110463, 1528110463),
('deletePlot', 2, 'Delete Plot', NULL, NULL, 1528110463, 1528110463),
('deleteRate', 2, 'Delete Rate', NULL, NULL, 1528110463, 1528110463),
('deleteSite', 2, 'Delete Site', NULL, NULL, 1528110463, 1528110463),
('deleteTax', 2, 'Delete Site', NULL, NULL, 1528110463, 1528110463),
('deleteUsers', 2, 'Delete User', NULL, NULL, 1528110463, 1528110463),
('indexArea', 2, 'Index a Area', NULL, NULL, 1528110463, 1528110463),
('indexCompany', 2, 'Index a Company', NULL, NULL, 1528110463, 1528110463),
('indexInterest', 2, 'Index a Interest', NULL, NULL, 1528110463, 1528110463),
('indexInvoice', 2, 'Index a Invoice', NULL, NULL, 1528110463, 1528110463),
('indexOrders', 2, 'Index a Orders', NULL, NULL, 1528110463, 1528110463),
('indexPayment', 2, 'Index a Payment', NULL, NULL, 1528110463, 1528110463),
('indexPlot', 2, 'Index a Plot', NULL, NULL, 1528110463, 1528110463),
('indexRate', 2, 'Index a Rate', NULL, NULL, 1528110463, 1528110463),
('indexSite', 2, 'Index a Site', NULL, NULL, 1528110463, 1528110463),
('indexTax', 2, 'Index a Tax', NULL, NULL, 1528110463, 1528110463),
('indexUsers', 2, 'Index a User', NULL, NULL, 1528110463, 1528110463),
('searchInvoice', 2, 'Delete Invoice', NULL, NULL, 1528110463, 1528110463),
('staff', 1, NULL, NULL, NULL, 1528110463, 1528110463),
('updateArea', 2, 'Update Area', NULL, NULL, 1528110463, 1528110463),
('updateCompany', 2, 'Update Company', NULL, NULL, 1528110463, 1528110463),
('updateGst', 2, 'Update GST', NULL, NULL, 1528110463, 1528110463),
('updateInterest', 2, 'Update Interest', NULL, NULL, 1528110463, 1528110463),
('updateInvoice', 2, 'Update Invoice', NULL, NULL, 1528110463, 1528110463),
('updateLog', 2, 'Update Log', NULL, NULL, 1528110463, 1528110463),
('updateOrders', 2, 'Update Orders', NULL, NULL, 1528110463, 1528110463),
('updateOwnGst', 2, 'Update own GST', 'isGst', NULL, 1528110463, 1528110463),
('updateOwntds', 2, 'Update own TDS', 'isTds', NULL, 1528110463, 1528110463),
('updatePayment', 2, 'Update Payment', NULL, NULL, 1528110463, 1528110463),
('updatePlot', 2, 'Update Plot', NULL, NULL, 1528110463, 1528110463),
('updateRate', 2, 'Update Rate', NULL, NULL, 1528110463, 1528110463),
('updateSite', 2, 'Update Site', NULL, NULL, 1528110463, 1528110463),
('updateTax', 2, 'Update Tax', NULL, NULL, 1528110463, 1528110463),
('updateUsers', 2, 'Update User', NULL, NULL, 1528110463, 1528110463),
('uploadReport', 2, 'Upload Report file', NULL, NULL, 1528110463, 1528110463),
('uploadtds', 2, 'Upload tds file', NULL, NULL, 1528110463, 1528110463),
('viewArea', 2, 'View Area', NULL, NULL, 1528110463, 1528110463),
('viewCompany', 2, NULL, NULL, NULL, 1528110463, 1528110463),
('viewInterest', 2, 'View Interest', NULL, NULL, 1528110463, 1528110463),
('viewInvoice', 2, 'View Invoice', NULL, NULL, 1528110463, 1528110463),
('viewInvoiceReport', 2, 'Create a Report', NULL, NULL, 1528110463, 1528110463),
('viewLedgerReport', 2, 'View a ledger Report', NULL, NULL, 1528110463, 1528110463),
('viewLogReport', 2, 'View a log Report', NULL, NULL, 1528110463, 1528110463),
('viewOrders', 2, 'View Orders', NULL, NULL, 1528110463, 1528110463),
('viewOwnCompany', 2, 'Update own Company', 'isCompany', NULL, 1528110463, 1528110463),
('viewOwnInvoice', 2, 'View own Invoice', 'isInvoice', NULL, 1528110463, 1528110463),
('viewOwnLedgerReport', 2, 'view own ledger', 'isOwnLedger', NULL, 1528110463, 1528110463),
('viewOwnPayment', 2, 'View own Payment', 'isPayment', NULL, 1528110463, 1528110463),
('viewPayment', 2, 'View Payment', NULL, NULL, 1528110463, 1528110463),
('viewPlot', 2, 'View Plot', NULL, NULL, 1528110463, 1528110463),
('viewRate', 2, 'View Rate', NULL, NULL, 1528110463, 1528110463),
('viewSite', 2, 'View Site', NULL, NULL, 1528110463, 1528110463),
('viewTax', 2, 'View Tax', NULL, NULL, 1528110463, 1528110463),
('viewUsers', 2, 'View User', NULL, NULL, 1528110463, 1528110463);

-- --------------------------------------------------------

--
-- Table structure for table `auth_item_child`
--

CREATE TABLE IF NOT EXISTS `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `auth_item_child`
--

INSERT INTO `auth_item_child` (`parent`, `child`) VALUES
('accounts', 'changePassword'),
('admin', 'changePassword'),
('company', 'changePassword'),
('staff', 'changePassword'),
('admin', 'createArea'),
('admin', 'createCompany'),
('staff', 'createCompany'),
('admin', 'createInterest'),
('accounts', 'createInvoice'),
('admin', 'createInvoice'),
('admin', 'createLog'),
('admin', 'createOrders'),
('accounts', 'createPayment'),
('admin', 'createPayment'),
('admin', 'createPlot'),
('admin', 'createRate'),
('admin', 'createSite'),
('admin', 'createTax'),
('admin', 'createUsers'),
('admin', 'deleteArea'),
('admin', 'deleteCompany'),
('admin', 'deleteInterest'),
('admin', 'deleteInvoice'),
('admin', 'deleteLog'),
('admin', 'deleteOrder'),
('admin', 'deletePayment'),
('admin', 'deletePlot'),
('admin', 'deleteRate'),
('admin', 'deleteSite'),
('admin', 'deleteTax'),
('admin', 'deleteUsers'),
('admin', 'indexArea'),
('admin', 'indexCompany'),
('admin', 'indexInterest'),
('accounts', 'indexInvoice'),
('admin', 'indexInvoice'),
('admin', 'indexOrders'),
('accounts', 'indexPayment'),
('admin', 'indexPayment'),
('admin', 'indexPlot'),
('admin', 'indexRate'),
('admin', 'indexSite'),
('admin', 'indexTax'),
('admin', 'indexUsers'),
('accounts', 'searchInvoice'),
('admin', 'searchInvoice'),
('admin', 'updateArea'),
('admin', 'updateCompany'),
('admin', 'updateGst'),
('updateOwnGst', 'updateGst'),
('admin', 'updateInterest'),
('admin', 'updateInvoice'),
('admin', 'updateLog'),
('admin', 'updateOrders'),
('company', 'updateOwnGst'),
('company', 'updateOwntds'),
('admin', 'updatePayment'),
('admin', 'updatePlot'),
('admin', 'updateRate'),
('admin', 'updateSite'),
('admin', 'updateTax'),
('admin', 'updateUsers'),
('admin', 'uploadReport'),
('admin', 'uploadtds'),
('updateOwntds', 'uploadtds'),
('admin', 'viewArea'),
('admin', 'viewCompany'),
('staff', 'viewCompany'),
('viewOwnCompany', 'viewCompany'),
('admin', 'viewInterest'),
('accounts', 'viewInvoice'),
('admin', 'viewInvoice'),
('viewOwnInvoice', 'viewInvoice'),
('accounts', 'viewInvoiceReport'),
('admin', 'viewInvoiceReport'),
('accounts', 'viewLedgerReport'),
('admin', 'viewLedgerReport'),
('viewOwnLedgerReport', 'viewLedgerReport'),
('accounts', 'viewLogReport'),
('admin', 'viewLogReport'),
('admin', 'viewOrders'),
('company', 'viewOwnCompany'),
('company', 'viewOwnInvoice'),
('company', 'viewOwnLedgerReport'),
('company', 'viewOwnPayment'),
('accounts', 'viewPayment'),
('admin', 'viewPayment'),
('viewOwnPayment', 'viewPayment'),
('admin', 'viewPlot'),
('admin', 'viewRate'),
('admin', 'viewSite'),
('admin', 'viewTax'),
('admin', 'viewUsers');

-- --------------------------------------------------------

--
-- Table structure for table `auth_rule`
--

CREATE TABLE IF NOT EXISTS `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `auth_rule`
--

INSERT INTO `auth_rule` (`name`, `data`, `created_at`, `updated_at`) VALUES
('isCompany', 0x4f3a32303a226170705c726261635c436f6d70616e7952756c65223a333a7b733a343a226e616d65223b733a393a226973436f6d70616e79223b733a393a22637265617465644174223b693a313532383131303436333b733a393a22757064617465644174223b693a313532383131303436333b7d, 1528110463, 1528110463),
('isGst', 0x4f3a31363a226170705c726261635c47737452756c65223a333a7b733a343a226e616d65223b733a353a226973477374223b733a393a22637265617465644174223b693a313532383131303436333b733a393a22757064617465644174223b693a313532383131303436333b7d, 1528110463, 1528110463),
('isInvoice', 0x4f3a32303a226170705c726261635c496e766f69636552756c65223a333a7b733a343a226e616d65223b733a393a226973496e766f696365223b733a393a22637265617465644174223b693a313532383131303436333b733a393a22757064617465644174223b693a313532383131303436333b7d, 1528110463, 1528110463),
('isOwnLedger', 0x4f3a31393a226170705c726261635c4c656467657252756c65223a333a7b733a343a226e616d65223b733a31313a2269734f776e4c6564676572223b733a393a22637265617465644174223b693a313532383131303436333b733a393a22757064617465644174223b693a313532383131303436333b7d, 1528110463, 1528110463),
('isPayment', 0x4f3a32303a226170705c726261635c5061796d656e7452756c65223a333a7b733a343a226e616d65223b733a393a2269735061796d656e74223b733a393a22637265617465644174223b693a313532383131303436333b733a393a22757064617465644174223b693a313532383131303436333b7d, 1528110463, 1528110463),
('isTds', 0x4f3a31363a226170705c726261635c54647352756c65223a333a7b733a343a226e616d65223b733a353a226973546473223b733a393a22637265617465644174223b693a313532383131303436333b733a393a22757064617465644174223b693a313532383131303436333b7d, 1528110463, 1528110463);

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE IF NOT EXISTS `company` (
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(500) DEFAULT NULL,
  `remark` varchar(150) NOT NULL,
  `constitution` varchar(60) DEFAULT NULL,
  `products` varchar(60) DEFAULT NULL,
  `gstin` varchar(30) DEFAULT NULL,
  `owner_name` varchar(100) DEFAULT NULL,
  `owner_phone` varchar(10) DEFAULT NULL,
  `owner_mobile` varchar(10) DEFAULT NULL,
  `competent_name` varchar(100) DEFAULT NULL,
  `competent_email` varchar(100) DEFAULT NULL,
  `competent_mobile` varchar(10) DEFAULT NULL,
  `url` text,
  `remark_url` text,
  `tds_url` text
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`user_id`, `company_id`, `name`, `address`, `remark`, `constitution`, `products`, `gstin`, `owner_name`, `owner_phone`, `owner_mobile`, `competent_name`, `competent_email`, `competent_mobile`, `url`, `remark_url`, `tds_url`) VALUES
(48, 27, 'Google', 'Address', 'hello', 'Constitution', 'Products', '123', 'Owner Name', '9999999999', NULL, '7777777777', 'alt@gmail.com', '5555555555', 'gstfiles/CA3.odt', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `debit`
--

CREATE TABLE IF NOT EXISTS `debit` (
  `debit_id` int(11) NOT NULL,
  `penal` int(11) NOT NULL,
  `invoice_id` int(11) DEFAULT NULL,
  `payment_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `flag` int(11) NOT NULL DEFAULT '1',
  `start_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `interest`
--

CREATE TABLE IF NOT EXISTS `interest` (
  `interest_id` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `rate` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `flag` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `interest`
--

INSERT INTO `interest` (`interest_id`, `name`, `type`, `rate`, `start_date`, `flag`) VALUES
(1, 'Penal Interest', 'Penal Interest', 10, '0000-00-00', 0),
(2, 'Penal Interest', 'Penal Interest', 20, '2018-04-15', 0),
(3, 'Penal Interest', 'Penal Interest', 30, '2018-04-20', 0),
(4, 'Penal Interest', 'Penal Interest', 30, '2018-04-20', 0),
(5, 'Penal Interest', 'Penal Interest', 30, '2018-04-20', 0),
(6, 'Penal Interest', 'Penal Interest', 15, '2018-05-22', 0),
(7, 'Penal Interest', 'Penal Interest', 16, '2018-05-24', 0),
(8, 'Penal Interest', 'Penal Interest', 15, '2018-05-24', 1);

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE IF NOT EXISTS `invoice` (
  `invoice_id` int(11) NOT NULL,
  `tax_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `interest_id` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `prev_lease_rent` int(11) DEFAULT NULL,
  `prev_tax` int(11) NOT NULL,
  `prev_interest` int(11) NOT NULL,
  `prev_dues_total` int(11) NOT NULL,
  `current_lease_rent` int(11) NOT NULL,
  `current_tax` int(11) NOT NULL,
  `current_dues_total` int(11) NOT NULL,
  `due_date` date NOT NULL,
  `email_status` tinyint(4) DEFAULT NULL,
  `lease_current_start` date DEFAULT NULL,
  `lease_prev_start` date DEFAULT NULL,
  `total_amount` int(11) NOT NULL,
  `flag` tinyint(4) NOT NULL DEFAULT '1',
  `invoice_code` varchar(100) NOT NULL,
  `lease_prev_end` date NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=359 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`invoice_id`, `tax_id`, `order_id`, `interest_id`, `start_date`, `prev_lease_rent`, `prev_tax`, `prev_interest`, `prev_dues_total`, `current_lease_rent`, `current_tax`, `current_dues_total`, `due_date`, `email_status`, `lease_current_start`, `lease_prev_start`, `total_amount`, `flag`, `invoice_code`, `lease_prev_end`) VALUES
(357, 10, 128, 8, '2018-06-13', 0, 0, 0, 0, 10000, 1800, 11800, '2018-06-13', 0, '2018-06-13', '2018-06-13', 11800, 1, 'MAR/18-19/0001', '2018-06-13'),
(358, 10, 128, 8, '2018-06-13', 0, 0, 0, 0, 10000, 1800, 11800, '2019-06-13', NULL, '2019-06-13', '2018-06-13', 11800, 1, 'MAR/18-19/0358', '2019-06-12');

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE IF NOT EXISTS `log` (
  `log_id` int(11) NOT NULL,
  `type` varchar(100) NOT NULL,
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `old_value` text,
  `new_value` text,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `log`
--

INSERT INTO `log` (`log_id`, `type`, `create_date`, `updated_date`, `old_value`, `new_value`, `user_id`) VALUES
(2, 'asdass', '2018-04-20 10:29:45', '2018-04-20 05:00:01', 'dasd', 'asdasd', 1),
(3, 'Company', '2018-04-20 10:49:28', '2018-04-20 05:19:28', '[{"user_id":25,"company_id":9,"name":"MI","address":"Colmorod Residential Complex, Flat S2","remark":"","constitution":"Pvt. Ltd","products":"Mobile Phones","gstin":"BKJK123K1K23KsB","owner_name":"Aloysius","owner_phone":"9604107696","owner_mobile":"9604107696","competent_name":"Jan Doe","competent_email":"castorgodinho22@gmail.com","competent_mobile":"9604107696"}]', '[{"user_id":25,"company_id":9,"name":"MI","address":"Colmorod Residential Complex, Flat S2","remark":"","constitution":"Pvt. Ltd","products":"Mobile Phone","gstin":"BKJK123K1K23KsB","owner_name":"Aloysius","owner_phone":"9604107696","owner_mobile":"9604107696","competent_name":"Jan Doe","competent_email":"castorgodinho22@gmail.com","competent_mobile":"9604107696"}]', 1),
(4, 'Area', '2018-04-20 10:59:25', '2018-04-20 05:29:25', '[{"area_id":9,"name":"Vernw","total_area":1200000}]', '[{"area_id":9,"name":"Vernw","total_area":1200000}]', 1),
(5, 'Area', '2018-04-20 11:18:26', '2018-04-20 05:48:26', '[{"area_id":9,"name":"Vernw","total_area":1200000}]', '[{"area_id":9,"name":"Vernw","total_area":1200000}]', 1),
(6, 'Area', '2018-04-20 11:19:15', '2018-04-20 05:49:15', '[{"area_id":9,"name":"Vernw","total_area":1200000}]', '[{"area_id":9,"name":"Vernw","total_area":1200000}]', 1),
(7, 'Area', '2018-04-20 11:22:02', '2018-04-20 05:52:02', '{"area_id":9,"name":"Vernw","total_area":1200000}', '{"area_id":9,"name":"Vernw","total_area":1200000}', 1),
(8, 'Area', '2018-04-20 11:23:34', '2018-04-20 05:53:34', '{"area_id":9,"name":"Vernw","total_area":1200000}', '{"area_id":9,"name":"Verna","total_area":1200000}', 1),
(9, 'Rate', '2018-04-20 11:27:25', '2018-04-20 05:57:25', '[{"rate_id":2,"area_id":9,"from_area":0,"to_area":10000000,"rate":55,"date":"2018-04-15","flag":0}]', '[{"rate_id":2,"area_id":9,"from_area":0,"to_area":10000000,"rate":55,"date":"2018-04-15","flag":0}]', 1),
(10, 'Rate', '2018-04-20 11:30:04', '2018-04-20 06:00:04', '[{"rate_id":3,"area_id":9,"from_area":0,"to_area":10000000,"rate":150,"date":"2018-04-20","flag":0}]', '[{"rate_id":3,"area_id":9,"from_area":0,"to_area":10000000,"rate":150,"date":"2018-04-20","flag":0}]', 1),
(11, 'Rate', '2018-04-20 11:31:30', '2018-04-20 06:01:30', '[{"rate_id":5,"area_id":9,"from_area":0,"to_area":10000000,"rate":200,"date":"2018-04-20","flag":0}]', '[{"rate_id":5,"area_id":9,"from_area":0,"to_area":10000000,"rate":200,"date":"2018-04-20","flag":0}]', 1),
(12, 'Rate', '2018-04-20 11:34:48', '2018-04-20 06:04:48', '[{"rate_id":4,"area_id":9,"from_area":10000000,"to_area":20000000,"rate":20,"date":"2018-04-23","flag":1}]', '[{"rate_id":4,"area_id":9,"from_area":10000000,"to_area":20000000,"rate":20,"date":"2018-04-23","flag":0}]', 1),
(13, 'Rate', '2018-04-20 11:36:27', '2018-04-20 06:06:27', '[{"rate_id":6,"area_id":9,"from_area":0,"to_area":10000000,"rate":140,"date":"2018-04-20","flag":0}]', '[{"rate_id":9,"area_id":9,"from_area":0,"to_area":10000000,"rate":150,"date":"2018-04-20","flag":1}]', 1),
(14, 'Interest', '2018-04-20 11:43:02', '2018-04-20 06:13:02', '[{"interest_id":2,"name":"Penal Interest","type":"Penal Interest","rate":20,"start_date":"2018-04-15","flag":0}]', '[{"interest_id":5,"name":"Penal Interest","type":"Penal Interest","rate":30,"start_date":"2018-04-20","flag":1}]', 1),
(15, 'Users', '2018-04-20 11:54:57', '2018-04-20 06:24:57', '[{"user_id":7,"email":"castorgodin@gmail.com","password":"$2y$13$1ZrtybbgMgiz5vn4I0bGE.R731p41YSo8GNxQ0kAovKV64REZ4zvW","type":"accounts"}]', '[{"user_id":7,"email":"castorgodin@gmail.com","password":"$2y$13$1ZrtybbgMgiz5vn4I0bGE.R731p41YSo8GNxQ0kAovKV64REZ4zvW","type":"admin"}]', 1),
(16, 'GSTIN', '2018-04-20 15:07:48', '2018-04-20 09:37:48', '[{"user_id":1,"company_id":1,"name":"Google Developers Group","address":"Verna, Plot No. 35A, 66 B","remark":"","constitution":"Partnership","products":"M. S Barrels","gstin":"78SJABSJSBBA88","owner_name":"Micheal Jackson","owner_phone":"2706542","owner_mobile":"9885412565","competent_name":"John Doe","competent_email":"john@doe.com","competent_mobile":"9865214587","url":"gstfiles\\/Invoice.pdf"}]', '[{"user_id":1,"company_id":1,"name":"Google Developers Group","address":"Verna, Plot No. 35A, 66 B","remark":"","constitution":"Partnership","products":"M. S Barrels","gstin":"78SJABSJSBBA40","owner_name":"Micheal Jackson","owner_phone":"2706542","owner_mobile":"9885412565","competent_name":"John Doe","competent_email":"john@doe.com","competent_mobile":"9865214587","url":"gstfiles\\/GOA-IDC.pdf"}]', 1),
(17, 'Company', '2018-04-21 09:30:49', '2018-04-21 04:00:49', '[{"user_id":1,"company_id":1,"name":"Google Developers Group","address":"Verna, Plot No. 35A, 66 B","remark":"","constitution":"Partnership","products":"M. S Barrels","gstin":"78SJABSJSBBA40","owner_name":"Micheal Jackson","owner_phone":"2706542","owner_mobile":"9885412565","competent_name":"John Doe","competent_email":"john@doe.com","competent_mobile":"9865214587","url":"gstfiles\\/GOA-IDC.pdf","remark_url":null}]', '[{"user_id":1,"company_id":1,"name":"Google Developers Group","address":"Verna, Plot No. 35A, 66 B","remark":"","constitution":"Partnership","products":"M. S Barrels","gstin":"78SJABSJSBBA40","owner_name":"Micheal Jackson","owner_phone":"2706542","owner_mobile":"9885412565","competent_name":"John Doe","competent_email":"john@doe.com","competent_mobile":"9865214587","url":"gstfiles\\/GOA-IDC.pdf","remark_url":null}]', 1),
(18, 'Company', '2018-04-21 09:36:06', '2018-04-21 04:06:06', '[{"user_id":1,"company_id":1,"name":"Google Developers Group","address":"Verna, Plot No. 35A, 66 B","remark":"","constitution":"Partnership","products":"M. S Barrels","gstin":"78SJABSJSBBA40","owner_name":"Micheal Jackson","owner_phone":"2706542","owner_mobile":"9885412565","competent_name":"John Doe","competent_email":"john@doe.com","competent_mobile":"9865214587","url":"gstfiles\\/GOA-IDC.pdf","remark_url":null}]', '[{"user_id":1,"company_id":1,"name":"Google Developers Group","address":"Verna, Plot No. 35A, 66 B","remark":"","constitution":"Partnership","products":"M. S Barrels","gstin":"78SJABSJSBBA40","owner_name":"Micheal Jackson","owner_phone":"2706542","owner_mobile":"9885412565","competent_name":"John Doe","competent_email":"john@doe.com","competent_mobile":"9865214587","url":"gstfiles\\/GOA-IDC.pdf","remark_url":null}]', 1),
(19, 'Company', '2018-04-21 09:39:09', '2018-04-21 04:09:09', '[{"user_id":22,"company_id":8,"name":"Chowgules","address":"Colmorod Residential Complex, Flat S2","remark":"","constitution":"Pvt. Ltd","products":"Printed Corrugated Cartoons","gstin":"dasdasfsa234","owner_name":"Aloysius","owner_phone":"9604107696","owner_mobile":"9604107696","competent_name":"Jan Doe","competent_email":"castorgodinho22@gmail.com","competent_mobile":"9604107696","url":null,"remark_url":null}]', '[{"user_id":22,"company_id":8,"name":"Chowgules","address":"Colmorod Residential Complex, Flat S2","remark":"","constitution":"Pvt. Ltd","products":"Printed Corrugated Cartoons","gstin":"dasdasfsa234","owner_name":"Aloysius","owner_phone":"9604107696","owner_mobile":"9604107696","competent_name":"Jan Doe","competent_email":"castorgodinho22@gmail.com","competent_mobile":"9604107696","url":null,"remark_url":null}]', 1),
(20, 'Company', '2018-04-21 09:45:12', '2018-04-21 04:15:12', '[{"user_id":22,"company_id":8,"name":"Chowgules","address":"Colmorod Residential Complex, Flat S2","remark":"","constitution":"Pvt. Ltd","products":"Printed Corrugated Cartoons","gstin":"dasdasfsa234","owner_name":"Aloysius","owner_phone":"9604107696","owner_mobile":"9604107696","competent_name":"Jan Doe","competent_email":"castorgodinho22@gmail.com","competent_mobile":"9604107696","url":null,"remark_url":null}]', '[{"user_id":22,"company_id":8,"name":"Chowgules","address":"Colmorod Residential Complex, Flat S2","remark":"","constitution":"Pvt. Ltd","products":"Printed Corrugated Cartoons","gstin":"dasdasfsa234","owner_name":"Aloysius","owner_phone":"9604107696","owner_mobile":"9604107696","competent_name":"Jan Doe","competent_email":"castorgodinho22@gmail.com","competent_mobile":"9604107696","url":null,"remark_url":null}]', 1),
(21, 'Company', '2018-04-21 09:46:13', '2018-04-21 04:16:13', '[{"user_id":22,"company_id":8,"name":"Chowgules","address":"Colmorod Residential Complex, Flat S2","remark":"","constitution":"Pvt. Ltd","products":"Printed Corrugated Cartoons","gstin":"dasdasfsa234","owner_name":"Aloysius","owner_phone":"9604107696","owner_mobile":"9604107696","competent_name":"Jan Doe","competent_email":"castorgodinho22@gmail.com","competent_mobile":"9604107696","url":null,"remark_url":null}]', '[{"user_id":22,"company_id":8,"name":"Chowgules","address":"Colmorod Residential Complex, Flat S2","remark":"","constitution":"Pvt. Ltd","products":"Printed Corrugated Cartoons","gstin":"dasdasfsa234","owner_name":"Aloysius","owner_phone":"9604107696","owner_mobile":"9604107696","competent_name":"Jan Doe","competent_email":"castorgodinho22@gmail.com","competent_mobile":"9604107696","url":null,"remark_url":null}]', 1),
(22, 'Company', '2018-04-21 09:46:32', '2018-04-21 04:16:32', '[{"user_id":22,"company_id":8,"name":"Chowgules","address":"Colmorod Residential Complex, Flat S2","remark":"","constitution":"Pvt. Ltd","products":"Printed Corrugated Cartoons","gstin":"dasdasfsa234","owner_name":"Aloysius","owner_phone":"9604107696","owner_mobile":"9604107696","competent_name":"Jan Doe","competent_email":"castorgodinho22@gmail.com","competent_mobile":"9604107696","url":null,"remark_url":null}]', '[{"user_id":22,"company_id":8,"name":"Chowgules","address":"Colmorod Residential Complex, Flat S2","remark":"","constitution":"Pvt. Ltd","products":"Printed Corrugated Cartoons","gstin":"dasdasfsa234","owner_name":"Aloysius","owner_phone":"9604107696","owner_mobile":"9604107696","competent_name":"Jan Doe","competent_email":"castorgodinho22@gmail.com","competent_mobile":"9604107696","url":null,"remark_url":"remarkfiles\\/FOSS consultancy work.pdf"}]', 1),
(23, 'GSTIN', '2018-04-21 09:52:16', '2018-04-21 04:22:16', '[{"user_id":22,"company_id":8,"name":"Chowgules","address":"Colmorod Residential Complex, Flat S2","remark":"","constitution":"Pvt. Ltd","products":"Printed Corrugated Cartoons","gstin":"dasdasfsa234","owner_name":"Aloysius","owner_phone":"9604107696","owner_mobile":"9604107696","competent_name":"Jan Doe","competent_email":"castorgodinho22@gmail.com","competent_mobile":"9604107696","url":null,"remark_url":"remarkfiles\\/FOSS consultancy work.pdf"}]', '[{"user_id":22,"company_id":8,"name":"Chowgules","address":"Colmorod Residential Complex, Flat S2","remark":"","constitution":"Pvt. Ltd","products":"Printed Corrugated Cartoons","gstin":"dasdasfsa234","owner_name":"Aloysius","owner_phone":"9604107696","owner_mobile":"9604107696","competent_name":"Jan Doe","competent_email":"castorgodinho22@gmail.com","competent_mobile":"9604107696","url":null,"remark_url":"remarkfiles\\/FOSS consultancy work.pdf"}]', 1),
(24, 'GSTIN', '2018-04-21 09:52:50', '2018-04-21 04:22:50', '[{"user_id":22,"company_id":8,"name":"Chowgules","address":"Colmorod Residential Complex, Flat S2","remark":"","constitution":"Pvt. Ltd","products":"Printed Corrugated Cartoons","gstin":"dasdasfsa234","owner_name":"Aloysius","owner_phone":"9604107696","owner_mobile":"9604107696","competent_name":"Jan Doe","competent_email":"castorgodinho22@gmail.com","competent_mobile":"9604107696","url":null,"remark_url":"remarkfiles\\/FOSS consultancy work.pdf"}]', '[{"user_id":22,"company_id":8,"name":"Chowgules","address":"Colmorod Residential Complex, Flat S2","remark":"","constitution":"Pvt. Ltd","products":"Printed Corrugated Cartoons","gstin":"dasdasfsa234","owner_name":"Aloysius","owner_phone":"9604107696","owner_mobile":"9604107696","competent_name":"Jan Doe","competent_email":"castorgodinho22@gmail.com","competent_mobile":"9604107696","url":null,"remark_url":"remarkfiles\\/FOSS consultancy work.pdf"}]', 1),
(25, 'GSTIN', '2018-04-21 09:53:25', '2018-04-21 04:23:25', '[{"user_id":22,"company_id":8,"name":"Chowgules","address":"Colmorod Residential Complex, Flat S2","remark":"","constitution":"Pvt. Ltd","products":"Printed Corrugated Cartoons","gstin":"dasdasfsa234","owner_name":"Aloysius","owner_phone":"9604107696","owner_mobile":"9604107696","competent_name":"Jan Doe","competent_email":"castorgodinho22@gmail.com","competent_mobile":"9604107696","url":null,"remark_url":"remarkfiles\\/FOSS consultancy work.pdf"}]', '[{"user_id":22,"company_id":8,"name":"Chowgules","address":"Colmorod Residential Complex, Flat S2","remark":"","constitution":"Pvt. Ltd","products":"Printed Corrugated Cartoons","gstin":"dasdasfsa234","owner_name":"Aloysius","owner_phone":"9604107696","owner_mobile":"9604107696","competent_name":"Jan Doe","competent_email":"castorgodinho22@gmail.com","competent_mobile":"9604107696","url":null,"remark_url":"remarkfiles\\/FOSS consultancy work.pdf"}]', 1),
(26, 'GSTIN', '2018-04-21 09:54:08', '2018-04-21 04:24:08', '[{"user_id":22,"company_id":8,"name":"Chowgules","address":"Colmorod Residential Complex, Flat S2","remark":"","constitution":"Pvt. Ltd","products":"Printed Corrugated Cartoons","gstin":"dasdasfsa234","owner_name":"Aloysius","owner_phone":"9604107696","owner_mobile":"9604107696","competent_name":"Jan Doe","competent_email":"castorgodinho22@gmail.com","competent_mobile":"9604107696","url":null,"remark_url":"remarkfiles\\/FOSS consultancy work.pdf"}]', '[{"user_id":22,"company_id":8,"name":"Chowgules","address":"Colmorod Residential Complex, Flat S2","remark":"","constitution":"Pvt. Ltd","products":"Printed Corrugated Cartoons","gstin":"dasdasfsa234","owner_name":"Aloysius","owner_phone":"9604107696","owner_mobile":"9604107696","competent_name":"Jan Doe","competent_email":"castorgodinho22@gmail.com","competent_mobile":"9604107696","url":null,"remark_url":"remarkfiles\\/FOSS consultancy work.pdf"}]', 1),
(27, 'GSTIN', '2018-04-21 09:54:38', '2018-04-21 04:24:38', '[{"user_id":22,"company_id":8,"name":"Chowgules","address":"Colmorod Residential Complex, Flat S2","remark":"","constitution":"Pvt. Ltd","products":"Printed Corrugated Cartoons","gstin":"dasdasfsa234","owner_name":"Aloysius","owner_phone":"9604107696","owner_mobile":"9604107696","competent_name":"Jan Doe","competent_email":"castorgodinho22@gmail.com","competent_mobile":"9604107696","url":null,"remark_url":"remarkfiles\\/FOSS consultancy work.pdf"}]', '[{"user_id":22,"company_id":8,"name":"Chowgules","address":"Colmorod Residential Complex, Flat S2","remark":"","constitution":"Pvt. Ltd","products":"Printed Corrugated Cartoons","gstin":"dasdasfsa222","owner_name":"Aloysius","owner_phone":"9604107696","owner_mobile":"9604107696","competent_name":"Jan Doe","competent_email":"castorgodinho22@gmail.com","competent_mobile":"9604107696","url":"gstfiles\\/Data structures set b.pdf","remark_url":"remarkfiles\\/FOSS consultancy work.pdf"}]', 1),
(28, 'Company', '2018-04-21 10:02:23', '2018-04-21 04:32:23', '[{"user_id":1,"company_id":1,"name":"Google Developers Group","address":"Verna, Plot No. 35A, 66 B","remark":"","constitution":"Partnership","products":"M. S Barrels","gstin":"78SJABSJSBBA40","owner_name":"Micheal Jackson","owner_phone":"2706542","owner_mobile":"9885412565","competent_name":"John Doe","competent_email":"john@doe.com","competent_mobile":"9865214587","url":"gstfiles\\/GOA-IDC.pdf","remark_url":null}]', '[{"user_id":1,"company_id":1,"name":"Google Developers Group","address":"Verna, Plot No. 35A, 66 B","remark":"","constitution":"Partnership","products":"M. S Barrels","gstin":"78SJABSJSBBA40","owner_name":"Micheal Jackson","owner_phone":"2706542","owner_mobile":"9885412565","competent_name":"John Doe","competent_email":"john@doe.com","competent_mobile":"9865214587","url":"gstfiles\\/GOA-IDC.pdf","remark_url":"remarkfiles\\/FOSS consultancy work.pdf"}]', 1),
(29, 'Company', '2018-04-21 10:07:31', '2018-04-21 04:37:31', '[{"user_id":1,"company_id":1,"name":"Google Developers Group","address":"Verna, Plot No. 35A, 66 B","remark":"","constitution":"Partnership","products":"M. S Barrels","gstin":"78SJABSJSBBA40","owner_name":"Micheal Jackson","owner_phone":"2706542","owner_mobile":"9885412565","competent_name":"John Doe","competent_email":"john@doe.com","competent_mobile":"9865214587","url":"gstfiles\\/GOA-IDC.pdf","remark_url":"remarkfiles\\/FOSS consultancy work.pdf","tds_url":null}]', '[{"user_id":1,"company_id":1,"name":"Google Developers Group","address":"Verna, Plot No. 35A, 66 B","remark":"","constitution":"Partnership","products":"M. S Barrels","gstin":"78SJABSJSBBA40","owner_name":"Micheal Jackson","owner_phone":"2706542","owner_mobile":"9885412565","competent_name":"John Doe","competent_email":"john@doe.com","competent_mobile":"9865214587","url":"gstfiles\\/GOA-IDC.pdf","remark_url":"remarkfiles\\/Data structures set b.pdf","tds_url":null}]', 1),
(30, 'Company', '2018-04-21 10:08:21', '2018-04-21 04:38:21', '[{"user_id":1,"company_id":1,"name":"Google Developers Group","address":"Verna, Plot No. 35A, 66 B","remark":"","constitution":"Partnership","products":"M. S Barrels","gstin":"78SJABSJSBBA40","owner_name":"Micheal Jackson","owner_phone":"2706542","owner_mobile":"9885412565","competent_name":"John Doe","competent_email":"john@doe.com","competent_mobile":"9865214587","url":"gstfiles\\/GOA-IDC.pdf","remark_url":"remarkfiles\\/Data structures set b.pdf","tds_url":null}]', '[{"user_id":1,"company_id":1,"name":"Google Developers Group","address":"Verna, Plot No. 35A, 66 B","remark":"","constitution":"Partnership","products":"M. S Barrels","gstin":"78SJABSJSBBA40","owner_name":"Micheal Jackson","owner_phone":"2706542","owner_mobile":"9885412565","competent_name":"John Doe","competent_email":"john@doe.com","competent_mobile":"9865214587","url":"gstfiles\\/GOA-IDC.pdf","remark_url":"remarkfiles\\/Data structures set b.pdf","tds_url":null}]', 1),
(31, 'Company', '2018-04-21 10:09:09', '2018-04-21 04:39:09', '[{"user_id":1,"company_id":1,"name":"Google Developers Group","address":"Verna, Plot No. 35A, 66 B","remark":"","constitution":"Partnership","products":"M. S Barrels","gstin":"78SJABSJSBBA40","owner_name":"Micheal Jackson","owner_phone":"2706542","owner_mobile":"9885412565","competent_name":"John Doe","competent_email":"john@doe.com","competent_mobile":"9865214587","url":"gstfiles\\/GOA-IDC.pdf","remark_url":"remarkfiles\\/Data structures set b.pdf","tds_url":null}]', '[{"user_id":1,"company_id":1,"name":"Google Developers Group","address":"Verna, Plot No. 35A, 66 B","remark":"","constitution":"Partnership","products":"M. S Barrels","gstin":"78SJABSJSBBA40","owner_name":"Micheal Jackson","owner_phone":"2706542","owner_mobile":"9885412565","competent_name":"John Doe","competent_email":"john@doe.com","competent_mobile":"9865214587","url":"gstfiles\\/GOA-IDC.pdf","remark_url":"remarkfiles\\/Data structures set b.pdf","tds_url":null}]', 1),
(32, 'Company', '2018-04-21 10:10:10', '2018-04-21 04:40:10', '[{"user_id":1,"company_id":1,"name":"Google Developers Group","address":"Verna, Plot No. 35A, 66 B","remark":"","constitution":"Partnership","products":"M. S Barrels","gstin":"78SJABSJSBBA40","owner_name":"Micheal Jackson","owner_phone":"2706542","owner_mobile":"9885412565","competent_name":"John Doe","competent_email":"john@doe.com","competent_mobile":"9865214587","url":"gstfiles\\/GOA-IDC.pdf","remark_url":"remarkfiles\\/Data structures set b.pdf","tds_url":null}]', '[{"user_id":1,"company_id":1,"name":"Google Developers Group","address":"Verna, Plot No. 35A, 66 B","remark":"","constitution":"Partnership","products":"M. S Barrels","gstin":"78SJABSJSBBA40","owner_name":"Micheal Jackson","owner_phone":"2706542","owner_mobile":"9885412565","competent_name":"John Doe","competent_email":"john@doe.com","competent_mobile":"9865214587","url":"gstfiles\\/GOA-IDC.pdf","remark_url":"remarkfiles\\/Data structures set b.pdf","tds_url":"remarkfiles\\/FOSS consultancy work.pdf"}]', 1),
(33, 'Company', '2018-04-21 10:15:55', '2018-04-21 04:45:55', '[{"user_id":34,"company_id":14,"name":"Fosters","address":"Colmorod Residential Complex, Flat S2","remark":"dasd","constitution":"Pvt. Ltd","products":"Printed Corrugated Cartoons","gstin":"dasawqead221","owner_name":"Aloysius","owner_phone":"9604107696","owner_mobile":"9604107696","competent_name":"Jan Doe","competent_email":"castorgodinho22@gmail.com","competent_mobile":"9604107696","url":null,"remark_url":null,"tds_url":null}]', '[{"user_id":34,"company_id":14,"name":"Fosters","address":"Colmorod Residential Complex, Flat S2","remark":"dasd","constitution":"Pvt. Ltd","products":"Printed Corrugated Cartoons","gstin":"dasawqead221","owner_name":"Aloysius","owner_phone":"9604107696","owner_mobile":"9604107696","competent_name":"Jan Doe","competent_email":"castorgodinho22@gmail.com","competent_mobile":"9604107696","url":null,"remark_url":null,"tds_url":"remarkfiles\\/FOSS consultancy work.pdf"}]', 1),
(34, 'Company', '2018-04-21 10:17:37', '2018-04-21 04:47:37', '[{"user_id":35,"company_id":15,"name":"Sony","address":"Colmorod Residential Complex, Flat S2","remark":"asdad","constitution":"Pvt. Ltd","products":"Printed Corrugated Cartoons","gstin":"sadasd2321asd","owner_name":"Aloysius","owner_phone":"9604107696","owner_mobile":"9604107696","competent_name":"Jan Doe","competent_email":"castorgodinho22@gmail.com","competent_mobile":"9604107696","url":null,"remark_url":null,"tds_url":null}]', '[{"user_id":35,"company_id":15,"name":"Sony","address":"Colmorod Residential Complex, Flat S2","remark":"asdad","constitution":"Pvt. Ltd","products":"Printed Corrugated Cartoons","gstin":"sadasd2321asd","owner_name":"Aloysius","owner_phone":"9604107696","owner_mobile":"9604107696","competent_name":"Jan Doe","competent_email":"castorgodinho22@gmail.com","competent_mobile":"9604107696","url":null,"remark_url":null,"tds_url":"remarkfiles\\/Data structures set b.pdf"}]', 1),
(35, 'Company', '2018-04-21 10:18:58', '2018-04-21 04:48:58', '[{"user_id":35,"company_id":15,"name":"Sony","address":"Colmorod Residential Complex, Flat S2","remark":"asdad","constitution":"Pvt. Ltd","products":"Printed Corrugated Cartoons","gstin":"sadasd2321asd","owner_name":"Aloysius","owner_phone":"9604107696","owner_mobile":"9604107696","competent_name":"Jan Doe","competent_email":"castorgodinho22@gmail.com","competent_mobile":"9604107696","url":null,"remark_url":null,"tds_url":"remarkfiles\\/Data structures set b.pdf"}]', '[{"user_id":35,"company_id":15,"name":"Sony","address":"Colmorod Residential Complex, Flat S2","remark":"asdad","constitution":"Pvt. Ltd","products":"Printed Corrugated Cartoons","gstin":"sadasd2321asd","owner_name":"Aloysius","owner_phone":"9604107696","owner_mobile":"9604107696","competent_name":"Jan Doe","competent_email":"castorgodinho22@gmail.com","competent_mobile":"9604107696","url":null,"remark_url":null,"tds_url":"remarkfiles\\/Data structures set b.pdf"}]', 35),
(36, 'Users', '2018-04-26 07:15:35', '2018-04-26 01:45:35', '[{"user_id":1,"email":"castorgodinho@yahoo.in","password":"$2y$13$HJcuDsYRJKn5pqgpZwZ3.ekJwMT9RTL\\/ZAd2a3pkkOhQvNoVwh5e.","type":null}]', '[{"user_id":1,"email":"castorgodinho@yahoo.in","password":"$2y$13$HJcuDsYRJKn5pqgpZwZ3.ekJwMT9RTL\\/ZAd2a3pkkOhQvNoVwh5e.","type":"accounts"}]', 1),
(37, 'Company', '2018-04-26 07:23:00', '2018-04-26 01:53:00', '[{"user_id":36,"company_id":16,"name":"Fastrack","address":"Colmorod Residential Complex, Flat S2","remark":"asdasdasd","constitution":"Pvt. Ltd","products":"Printed Corrugated Cartoons","gstin":"sadasd2wq1asd","owner_name":"Aloysius","owner_phone":"9604107696","owner_mobile":"9604107696","competent_name":"Jan Doe","competent_email":"castorgodinho22@gmail.com","competent_mobile":"9604107696","url":null,"remark_url":null,"tds_url":null}]', '[{"user_id":36,"company_id":16,"name":"Fastrack","address":"Colmorod Residential Complex, Flat S2","remark":"asdasdasd","constitution":"public. Ltd","products":"Printed Corrugated Cartoons","gstin":"sadasd2wq1asd","owner_name":"Aloysius","owner_phone":"9604107696","owner_mobile":"9604107696","competent_name":"Jan Doe","competent_email":"castorgodinho22@gmail.com","competent_mobile":"9604107696","url":null,"remark_url":null,"tds_url":null}]', 1),
(38, 'Edited Company', '2018-04-26 07:32:01', '2018-04-26 02:02:01', '[{"user_id":36,"company_id":16,"name":"Fastrack","address":"Colmorod Residential Complex, Flat S2","remark":"asdasdasd","constitution":"public. Ltd","products":"Printed Corrugated Cartoons","gstin":"sadasd2wq1asd","owner_name":"Aloysius","owner_phone":"9604107696","owner_mobile":"9604107696","competent_name":"Jan Doe","competent_email":"castorgodinho22@gmail.com","competent_mobile":"9604107696","url":null,"remark_url":null,"tds_url":null}]', '[{"user_id":36,"company_id":16,"name":"Fastrack","address":"Colmorod Residential Complex, Flat S2","remark":"asdasdasd","constitution":"Pvt. Ltd","products":"Printed Corrugated Cartoons","gstin":"sadasd2wq1asd","owner_name":"Aloysius","owner_phone":"9604107696","owner_mobile":"9604107696","competent_name":"Jan Doe","competent_email":"castorgodinho22@gmail.com","competent_mobile":"9604107696","url":null,"remark_url":null,"tds_url":null}]', 1),
(39, 'Edited Rate', '2018-04-26 08:57:26', '2018-04-26 03:27:26', '[{"rate_id":7,"area_id":9,"from_area":10000000,"to_area":20000000,"rate":200,"date":"2018-04-20","flag":1}]', '[{"rate_id":10,"area_id":9,"from_area":10000000,"to_area":20000000,"rate":250,"date":"2018-04-26","flag":1}]', 1),
(40, 'Edited Tax', '2018-04-26 08:59:41', '2018-04-26 03:29:41', '[{"tax_id":6,"name":"GST","rate":18,"date":"2018-04-20","flag":1}]', '[{"tax_id":6,"name":"GST","rate":18,"date":"2018-04-20","flag":0}]', 1),
(41, 'Edited Tax', '2018-04-26 09:00:27', '2018-04-26 03:30:27', '[{"tax_id":7,"name":"GST","rate":20,"date":"2018-04-26","flag":1}]', '[{"tax_id":8,"name":"GST","rate":18,"date":"2018-04-26","flag":1}]', 1),
(42, 'Edited Industrial Area', '2018-04-26 11:59:36', '2018-04-26 06:29:36', '{"area_id":9,"name":"Verna","total_area":1200000}', '{"area_id":9,"name":"Verna Industrial Estate","total_area":1200000}', 1),
(43, 'Edited Company', '2018-04-30 06:41:41', '2018-04-30 01:11:41', '[{"user_id":38,"company_id":18,"name":"Honda","address":"Colmorod Residential Complex, Flat S2","remark":"dasdasdsa","constitution":"Pvt. Ltd","products":"Printed Corrugated Cartoons","gstin":"BKJK123ds1K23KB","owner_name":"Aloysius","owner_phone":"9604107696","owner_mobile":"9604107696","competent_name":"Jan Doe","competent_email":"castorgodinho22@gmail.com","competent_mobile":"9604107696","url":"remarkfiles\\/assignment_2 (1).html","remark_url":"remarkfiles\\/assignment_2 (1).html","tds_url":null}]', '[{"user_id":38,"company_id":18,"name":"Honda","address":"Colmorod Residential Complex, Flat S2","remark":"dasdasdads","constitution":"Pvt. Ltd","products":"Printed Corrugated Cartoons","gstin":"BKJK123ds1K23KB","owner_name":"Aloysius","owner_phone":"9604107696","owner_mobile":"9604107696","competent_name":"Jan Doe","competent_email":"castorgodinho22@gmail.com","competent_mobile":"9604107696","url":"remarkfiles\\/assignment_2 (1).html","remark_url":"remarkfiles\\/assignment_2 (1).html","tds_url":null}]', 1),
(44, 'Edited Company', '2018-04-30 06:42:20', '2018-04-30 01:12:20', '[{"user_id":38,"company_id":18,"name":"Honda","address":"Colmorod Residential Complex, Flat S2","remark":"dasdasdads","constitution":"Pvt. Ltd","products":"Printed Corrugated Cartoons","gstin":"BKJK123ds1K23KB","owner_name":"Aloysius","owner_phone":"9604107696","owner_mobile":"9604107696","competent_name":"Jan Doe","competent_email":"castorgodinho22@gmail.com","competent_mobile":"9604107696","url":"remarkfiles\\/assignment_2 (1).html","remark_url":"remarkfiles\\/assignment_2 (1).html","tds_url":null}]', '[{"user_id":38,"company_id":18,"name":"Honda","address":"Colmorod Residential Complex, Flat S2","remark":"dssadasdasdads","constitution":"Pvt. Ltd","products":"Printed Corrugated Cartoons","gstin":"BKJK123ds1K23KB","owner_name":"Aloysius","owner_phone":"9604107696","owner_mobile":"9604107696","competent_name":"Jan Doe","competent_email":"castorgodinho22@gmail.com","competent_mobile":"9604107696","url":"remarkfiles\\/assignment_2 (1).html","remark_url":"remarkfiles\\/assignment_2 (1).html","tds_url":null}]', 1),
(45, 'Edited Company', '2018-04-30 06:51:58', '2018-04-30 01:21:58', '[{"user_id":38,"company_id":18,"name":"Honda","address":"Colmorod Residential Complex, Flat S2","remark":"dssadasdasdads","constitution":"Pvt. Ltd","products":"Printed Corrugated Cartoons","gstin":"BKJK123ds1K23KB","owner_name":"Aloysius","owner_phone":"9604107696","owner_mobile":"9604107696","competent_name":"Jan Doe","competent_email":"castorgodinho22@gmail.com","competent_mobile":"9604107696","url":"remarkfiles\\/assignment_2 (1).html","remark_url":"remarkfiles\\/assignment_2 (1).html","tds_url":null}]', '[{"user_id":38,"company_id":18,"name":"Honda","address":"Colmorod Residential Complex, Flat S2","remark":"dssadasdasdads","constitution":"Pvt. Ltd","products":"Printed Corrugated Cartoons","gstin":"BKJK123ds1K23KB","owner_name":"Aloysius","owner_phone":"9604107696","owner_mobile":"9604107696","competent_name":"Jan Doe","competent_email":"castorgodinho22@gmail.com","competent_mobile":"9604107696","url":"remarkfiles\\/assignment_2 (1).html","remark_url":"remarkfiles\\/CA 3.pdf","tds_url":null}]', 1),
(46, 'Edited Interest', '2018-05-22 21:41:05', '2018-05-22 16:11:05', '[{"interest_id":5,"name":"Penal Interest","type":"Penal Interest","rate":30,"start_date":"2018-04-20","flag":0}]', '[{"interest_id":6,"name":"Penal Interest","type":"Penal Interest","rate":15,"start_date":"2018-05-22","flag":1}]', 1),
(47, 'Edited Tax', '2018-05-24 23:46:01', '2018-05-24 18:16:01', '[{"tax_id":8,"name":"GST","rate":18,"date":"2018-04-26","flag":1}]', '[{"tax_id":9,"name":"GST","rate":19,"date":"2018-05-24","flag":1}]', 1),
(48, 'Edited Tax', '2018-05-24 23:46:09', '2018-05-24 18:16:09', '[{"tax_id":9,"name":"GST","rate":19,"date":"2018-05-24","flag":1}]', '[{"tax_id":10,"name":"GST","rate":18,"date":"2018-05-24","flag":1}]', 1),
(49, 'Edited Interest', '2018-05-24 23:53:12', '2018-05-24 18:23:12', '[{"interest_id":6,"name":"Penal Interest","type":"Penal Interest","rate":15,"start_date":"2018-05-22","flag":0}]', '[{"interest_id":7,"name":"Penal Interest","type":"Penal Interest","rate":16,"start_date":"2018-05-24","flag":1}]', 1),
(50, 'Edited Interest', '2018-05-24 23:53:22', '2018-05-24 18:23:22', '[{"interest_id":7,"name":"Penal Interest","type":"Penal Interest","rate":16,"start_date":"2018-05-24","flag":0}]', '[{"interest_id":8,"name":"Penal Interest","type":"Penal Interest","rate":15,"start_date":"2018-05-24","flag":1}]', 1),
(51, 'Edited Users', '2018-06-01 16:19:04', '2018-06-01 10:49:04', '[{"user_id":1,"email":"castorgodinho@yahoo.in","password":"$2y$13$HJcuDsYRJKn5pqgpZwZ3.ekJwMT9RTL\\/ZAd2a3pkkOhQvNoVwh5e.","type":"admin","mobile":""}]', '[{"user_id":1,"email":"castorgodinho@yahoo.in","password":"$2y$13$n8dnaSlRSpeiazBu4Sfmnu1B36hUisf2LCDqYiD9\\/KVADxb6fpby.","type":"admin","mobile":""}]', 1),
(52, 'Edited Users', '2018-06-01 16:29:29', '2018-06-01 10:59:29', '[{"user_id":43,"email":"wendhadmgray@gmail.com","password":"$2y$13$dHHAWMtOG2w.3iiDr0KqNexsCeBomCkvY2U9U.5maXSJ0E..QHBlu","type":"company","mobile":"9823431003"}]', '[{"user_id":43,"email":"wendhamgray@gmail.com","password":"$2y$13$zRJe6KeRUWeVlOLBolfUN.Kut26psQbM5\\/IkeOjVibjoGsUvMjyw2","type":"admin","mobile":"9823431003"}]', 1),
(53, 'Edited Company', '2018-06-03 13:36:11', '2018-06-03 08:06:11', '[{"user_id":44,"company_id":23,"name":"Yahoo","address":"Address","remark":"Remark","constitution":"Constitution","products":"Products","gstin":"gstin","owner_name":"Contact Person","owner_phone":"9999999999","owner_mobile":null,"competent_name":"7777777777","competent_email":"alt@gmail.com","competent_mobile":"5555555555","url":null,"remark_url":null,"tds_url":null}]', '[{"user_id":44,"company_id":23,"name":"Yahoo","address":"Address","remark":"Remark","constitution":"Constitution","products":"Products","gstin":"gstin","owner_name":"Salah","owner_phone":"9999999999","owner_mobile":null,"competent_name":"7777777777","competent_email":"alt@gmail.com","competent_mobile":"5555555555","url":null,"remark_url":null,"tds_url":null}]', 1),
(54, 'Edited Company', '2018-06-03 13:38:06', '2018-06-03 08:08:06', '[{"user_id":44,"company_id":23,"name":"Yahoo","address":"Address","remark":"Remark","constitution":"Constitution","products":"Products","gstin":"gstin","owner_name":"Salah","owner_phone":"9999999999","owner_mobile":null,"competent_name":"7777777777","competent_email":"alt@gmail.com","competent_mobile":"5555555555","url":null,"remark_url":null,"tds_url":null}]', '[{"user_id":44,"company_id":23,"name":"Yahoo","address":"Address","remark":"Remark","constitution":"Constitution","products":"Products","gstin":"gstin","owner_name":"Rooney","owner_phone":"9999999999","owner_mobile":null,"competent_name":"7777777777","competent_email":"alt@gmail.com","competent_mobile":"5555555555","url":null,"remark_url":null,"tds_url":null}]', 1),
(55, 'Edited Unit', '2018-06-03 14:06:42', '2018-06-03 08:36:42', '[{"order_id":123,"order_number":"GIDC982231MARGA","company_id":23,"built_area":200,"shed_area":null,"godown_area":null,"start_date":"2018-06-01","end_date":"2020-06-04","shed_no":"","godown_no":"","area_id":18,"total_area":2000,"plots":"p222","document":null,"remark":"","status":1,"next_order_id":null,"transfer_url":null,"email_status":1}]', '[{"order_id":123,"order_number":"GIDC982231MARGA","company_id":23,"built_area":200,"shed_area":null,"godown_area":null,"start_date":"2018-06-01","end_date":"2020-06-04","shed_no":"","godown_no":"","area_id":18,"total_area":2000,"plots":"p222","document":null,"remark":"","status":1,"next_order_id":null,"transfer_url":null,"email_status":0}]', 1),
(56, 'Edited Users', '2018-06-04 10:12:01', '2018-06-04 04:42:01', '[{"user_id":44,"email":"email@gmail.com","password":"$2y$13$hbDvQpBSgHaEVJRV4Zm0CenkZlnojxgwTzU4Z8YXSIiBF0J7CC0.q","type":"company","mobile":"88888888888"}]', '[{"user_id":44,"email":"email@gmail.com","password":"$2y$13$b0XRnmAcOqIg7Ea\\/WjWF4eLUrYvDjzEngFMhOEsqiCTEGIioNYyFy","type":"admin","mobile":"88888888888"}]', 1),
(57, 'Edited Users', '2018-06-11 09:29:33', '2018-06-11 03:59:33', '[{"user_id":43,"email":"wendhamgray@gmail.com","password":"$2y$13$zRJe6KeRUWeVlOLBolfUN.Kut26psQbM5\\/IkeOjVibjoGsUvMjyw2","type":"admin","mobile":"9823431003"}]', '[{"user_id":43,"email":"wendhamgray@gmail.com","password":"$2y$13$weOugaPKVT4WmqAkmG6hP.4870gfXmpGa69W91ng4H.DBGzuq5Jdm","type":"admin","mobile":"9823431003"}]', 1),
(58, 'Edited Unit', '2018-06-13 11:19:30', '2018-06-13 05:49:30', '[{"order_id":126,"order_number":"GIDC272640VERNA","company_id":26,"built_area":null,"shed_area":null,"godown_area":null,"start_date":null,"end_date":null,"shed_no":"","godown_no":"","area_id":17,"total_area":15000,"plots":"plot4","document":null,"remark":"","status":1,"next_order_id":null,"transfer_url":null,"email_status":0}]', '[{"order_id":126,"order_number":"GIDC272640VERNA","company_id":26,"built_area":8000,"shed_area":null,"godown_area":null,"start_date":"2018-06-13","end_date":"2018-11-30","shed_no":"","godown_no":"","area_id":17,"total_area":15000,"plots":"plot4","document":null,"remark":"","status":1,"next_order_id":null,"transfer_url":null,"email_status":0}]', 1),
(59, 'Edited GSTIN', '2018-06-13 14:41:38', '2018-06-13 09:11:38', '[{"user_id":48,"company_id":27,"name":"Google","address":"Address","remark":"hello","constitution":"Constitution","products":"Products","gstin":"Gstin","owner_name":"Owner Name","owner_phone":"9999999999","owner_mobile":null,"competent_name":"7777777777","competent_email":"alt@gmail.com","competent_mobile":"5555555555","url":null,"remark_url":null,"tds_url":null}]', '[{"user_id":48,"company_id":27,"name":"Google","address":"Address","remark":"hello","constitution":"Constitution","products":"Products","gstin":"123","owner_name":"Owner Name","owner_phone":"9999999999","owner_mobile":null,"competent_name":"7777777777","competent_email":"alt@gmail.com","competent_mobile":"5555555555","url":"gstfiles\\/Untitled 1.pdf","remark_url":null,"tds_url":null}]', 48),
(60, 'Edited GSTIN', '2018-06-13 14:42:06', '2018-06-13 09:12:06', '[{"user_id":48,"company_id":27,"name":"Google","address":"Address","remark":"hello","constitution":"Constitution","products":"Products","gstin":"123","owner_name":"Owner Name","owner_phone":"9999999999","owner_mobile":null,"competent_name":"7777777777","competent_email":"alt@gmail.com","competent_mobile":"5555555555","url":"gstfiles\\/Untitled 1.pdf","remark_url":null,"tds_url":null}]', '[{"user_id":48,"company_id":27,"name":"Google","address":"Address","remark":"hello","constitution":"Constitution","products":"Products","gstin":"123","owner_name":"Owner Name","owner_phone":"9999999999","owner_mobile":null,"competent_name":"7777777777","competent_email":"alt@gmail.com","competent_mobile":"5555555555","url":"gstfiles\\/CA3.odt","remark_url":null,"tds_url":null}]', 48);

-- --------------------------------------------------------

--
-- Table structure for table `migration`
--

CREATE TABLE IF NOT EXISTS `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1523509687),
('m140506_102106_rbac_init', 1523509768),
('m170907_052038_rbac_add_index_on_auth_assignment_user_id', 1523509768);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `order_id` int(11) NOT NULL,
  `order_number` varchar(20) NOT NULL,
  `company_id` int(11) NOT NULL,
  `built_area` int(11) DEFAULT NULL,
  `shed_area` int(11) DEFAULT NULL,
  `godown_area` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `shed_no` varchar(50) DEFAULT NULL,
  `godown_no` varchar(50) DEFAULT NULL,
  `area_id` int(11) DEFAULT NULL,
  `total_area` int(11) DEFAULT NULL,
  `plots` varchar(100) NOT NULL,
  `document` text,
  `remark` text,
  `status` tinyint(4) DEFAULT '1',
  `next_order_id` int(11) DEFAULT NULL,
  `transfer_url` text,
  `email_status` tinyint(4) DEFAULT NULL,
  `due_date` date NOT NULL,
  `tansfer_date` date NOT NULL,
  `folio1` text,
  `folio2` text
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `order_number`, `company_id`, `built_area`, `shed_area`, `godown_area`, `start_date`, `end_date`, `shed_no`, `godown_no`, `area_id`, `total_area`, `plots`, `document`, `remark`, `status`, `next_order_id`, `transfer_url`, `email_status`, `due_date`, `tansfer_date`, `folio1`, `folio2`) VALUES
(128, 'GIDC273172MARGA', 27, 300, NULL, NULL, '2018-06-13', '2019-09-30', '', '', 18, 1000, 'p222', NULL, '', 1, NULL, NULL, 0, '0000-00-00', '0000-00-00', NULL, NULL),
(129, 'GIDC807639VERNA', 27, 1500, NULL, NULL, '2018-06-01', '2018-06-30', '', '', 24, 2000, 'p34', NULL, '', 1, NULL, NULL, 1, '0000-00-00', '0000-00-00', NULL, NULL),
(130, 'GIDC144936VERNA', 27, NULL, NULL, NULL, NULL, NULL, '', '', 24, NULL, '', NULL, '', 1, NULL, NULL, NULL, '0000-00-00', '0000-00-00', NULL, NULL),
(131, 'GIDC941636MARGA', 27, NULL, NULL, NULL, NULL, NULL, '', '', 23, NULL, '', NULL, '', 1, NULL, NULL, NULL, '2018-09-08', '2018-09-09', '1', '2');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE IF NOT EXISTS `order_details` (
  `plot_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `order_rate`
--

CREATE TABLE IF NOT EXISTS `order_rate` (
  `order_rate_id` int(11) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `amount1` int(11) DEFAULT NULL,
  `amount2` int(11) DEFAULT NULL,
  `flag` tinyint(4) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_rate`
--

INSERT INTO `order_rate` (`order_rate_id`, `start_date`, `end_date`, `amount1`, `amount2`, `flag`, `order_id`) VALUES
(69, '2018-06-13', '2018-06-30', 10000, 200, 1, 128),
(70, '2018-06-14', '2021-06-14', 10000, 1000, 1, 129),
(71, NULL, NULL, NULL, NULL, 1, 130),
(72, NULL, NULL, NULL, NULL, 1, 131);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE IF NOT EXISTS `payment` (
  `payment_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `mode` varchar(50) DEFAULT NULL,
  `invoice_id` int(11) DEFAULT NULL,
  `tds_rate` int(11) DEFAULT '0',
  `tds_amount` int(11) DEFAULT '0',
  `balance_amount` int(11) NOT NULL,
  `payment_no` varchar(100) NOT NULL,
  `penal` int(11) NOT NULL,
  `cheque_no` varchar(100) NOT NULL,
  `tax` int(11) NOT NULL,
  `lease_rent` int(11) NOT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `tds_file` text,
  `transaction_no` varchar(50) DEFAULT NULL,
  `transaction_details` text,
  `created_by` varchar(250) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment_id`, `order_id`, `amount`, `start_date`, `mode`, `invoice_id`, `tds_rate`, `tds_amount`, `balance_amount`, `payment_no`, `penal`, `cheque_no`, `tax`, `lease_rent`, `status`, `tds_file`, `transaction_no`, `transaction_details`, `created_by`) VALUES
(123, 128, 1800, '2018-06-13', 'cash', 357, 0, 0, 11800, 'GIDC/18-19/0001', 0, '', 275, 1525, 1, NULL, NULL, NULL, 'castorgodinho@yahoo.in'),
(124, 128, 10000, '2018-06-13', 'cash', 357, 0, 0, 10000, 'GIDC/18-19/0124', 0, '', 1525, 8475, 1, NULL, NULL, NULL, 'castorgodinho@yahoo.in');

-- --------------------------------------------------------

--
-- Table structure for table `plot`
--

CREATE TABLE IF NOT EXISTS `plot` (
  `plot_id` int(11) NOT NULL,
  `area_id` int(11) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `area_of_plot` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `plot`
--

INSERT INTO `plot` (`plot_id`, `area_id`, `name`, `area_of_plot`) VALUES
(6, NULL, '22', 0),
(7, NULL, '11', 0),
(8, NULL, '22', 0),
(9, NULL, '33', 0),
(10, NULL, '56', 0),
(11, NULL, '44', 0),
(12, NULL, '33', 0),
(13, 9, '10', 0),
(14, 9, '20', 0),
(15, 9, '43', 0),
(16, 9, '21', 0),
(17, 9, '10', 0),
(18, 9, '10', 0),
(19, 9, '12', 0),
(20, 9, '12', 0),
(21, 9, '12', 0),
(22, 9, '12', 0),
(23, 9, '22', 0),
(24, 9, '12', 0),
(25, 9, '22', 0),
(26, 9, '12', 0),
(27, 9, '12', 0),
(28, 9, '12', 0),
(29, 9, '12', 0),
(30, 9, '10', 0),
(31, 9, '22', 0),
(32, 9, '22', 0),
(33, 9, '22', 0),
(34, 9, '22', 0),
(35, 9, '22', 0),
(36, 9, '67', 0),
(37, 9, '54', 0),
(38, 9, '11', 0),
(39, 9, '12', 0),
(40, 9, '10', 0),
(41, 9, '10', 0),
(42, 9, '20', 0),
(43, 9, '30', 0),
(44, 9, '50', 0),
(45, 9, '60', 0),
(46, 9, '33', 0),
(47, 9, '22', 0),
(48, 9, '10', 0),
(49, 9, '11', 0),
(50, 9, '22', 0),
(51, 9, '10', 0),
(52, 9, '10', 0),
(53, 9, '10', 0),
(54, 9, '11', 0),
(55, 9, '22', 0),
(56, 9, '12', 0),
(57, 10, '11', 0),
(58, 10, '12', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tax`
--

CREATE TABLE IF NOT EXISTS `tax` (
  `tax_id` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `rate` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `flag` tinyint(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tax`
--

INSERT INTO `tax` (`tax_id`, `name`, `rate`, `date`, `flag`) VALUES
(2, 'GST', 10, '2018-04-14', 0),
(3, 'GST', 18, '2018-04-15', 0),
(4, 'GST', 20, '2018-04-15', 0),
(5, 'GST', 21, '2018-04-15', 0),
(6, 'GST', 18, '2018-04-20', 0),
(7, 'GST', 20, '2018-04-26', 0),
(8, 'GST', 18, '2018-04-26', 0),
(9, 'GST', 19, '2018-05-24', 0),
(10, 'GST', 18, '2018-05-24', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` text NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `mobile` varchar(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `email`, `password`, `type`, `mobile`) VALUES
(1, 'castorgodinho@yahoo.in', '$2y$13$n8dnaSlRSpeiazBu4Sfmnu1B36hUisf2LCDqYiD9/KVADxb6fpby.', 'admin', ''),
(35, 'sony@gmail.com', '$2y$13$lQxZrBJVc4CaVNdm.53SYeS1ZKnbHo.99cLMs3..DvGJKejzQzCx.', 'company', ''),
(43, 'wendhamgray@gmail.com', '$2y$13$weOugaPKVT4WmqAkmG6hP.4870gfXmpGa69W91ng4H.DBGzuq5Jdm', 'admin', '9823431003'),
(44, 'email@gmail.com', '$2y$13$b0XRnmAcOqIg7Ea/WjWF4eLUrYvDjzEngFMhOEsqiCTEGIioNYyFy', 'admin', '88888888888'),
(45, 'e@gmail.com', '$2y$13$TNEkpGccDtGu45qHNTxJ6eI7ZHH7trRwnyrICS.yTQExNk.L/zlcW', 'company', '1111111112'),
(46, 'mi@gmail.com', '$2y$13$yDUkaCZF64WUsmBLqUt4VewJCUknNwU7MXYPyLtJGiO2DCdrwneVq', 'company', '88888848888'),
(47, 'google@gmail.com', '$2y$13$dRdAarkRRBKdIRZsdDOLZuS18U55yfYTQhYrnM7pS3yGpKH6MjwCm', 'company', '88888888885'),
(48, 'g@gmail.com', '$2y$13$FTlktfMJ0h1qLiuouq4lwOxc438QSSTuB4wl7Tvv4kRqjzKtFyQfm', 'company', '8888888885');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`area_id`);

--
-- Indexes for table `area_rate`
--
ALTER TABLE `area_rate`
  ADD PRIMARY KEY (`area_rate_id`);

--
-- Indexes for table `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD PRIMARY KEY (`item_name`,`user_id`),
  ADD KEY `auth_assignment_user_id_idx` (`user_id`);

--
-- Indexes for table `auth_item`
--
ALTER TABLE `auth_item`
  ADD PRIMARY KEY (`name`),
  ADD KEY `rule_name` (`rule_name`),
  ADD KEY `idx-auth_item-type` (`type`);

--
-- Indexes for table `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD PRIMARY KEY (`parent`,`child`),
  ADD KEY `child` (`child`);

--
-- Indexes for table `auth_rule`
--
ALTER TABLE `auth_rule`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`company_id`),
  ADD KEY `company_fk_user_id` (`user_id`);

--
-- Indexes for table `debit`
--
ALTER TABLE `debit`
  ADD PRIMARY KEY (`debit_id`),
  ADD KEY `invoice_id` (`invoice_id`),
  ADD KEY `fk1` (`payment_id`),
  ADD KEY `fk_debit_order` (`order_id`);

--
-- Indexes for table `interest`
--
ALTER TABLE `interest`
  ADD PRIMARY KEY (`interest_id`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice_id`),
  ADD KEY `invoice_tax_id` (`tax_id`),
  ADD KEY `invoice_order` (`order_id`),
  ADD KEY `invoice_interest` (`interest_id`);

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `log_user_id` (`user_id`);

--
-- Indexes for table `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `orders_fk_company_id` (`company_id`),
  ADD KEY `orders_area_id` (`area_id`),
  ADD KEY `orders_fk1` (`next_order_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`plot_id`,`order_id`),
  ADD KEY `order_details_order_id` (`order_id`);

--
-- Indexes for table `order_rate`
--
ALTER TABLE `order_rate`
  ADD PRIMARY KEY (`order_rate_id`),
  ADD KEY `order_rate_fk` (`order_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `payment_order_id` (`order_id`),
  ADD KEY `payment_invoice_id` (`invoice_id`);

--
-- Indexes for table `plot`
--
ALTER TABLE `plot`
  ADD PRIMARY KEY (`plot_id`),
  ADD KEY `plot_fk_area_id` (`area_id`);

--
-- Indexes for table `tax`
--
ALTER TABLE `tax`
  ADD PRIMARY KEY (`tax_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `area`
--
ALTER TABLE `area`
  MODIFY `area_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `area_rate`
--
ALTER TABLE `area_rate`
  MODIFY `area_rate_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `company_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `debit`
--
ALTER TABLE `debit`
  MODIFY `debit_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `interest`
--
ALTER TABLE `interest`
  MODIFY `interest_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `invoice_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=359;
--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=61;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=132;
--
-- AUTO_INCREMENT for table `order_rate`
--
ALTER TABLE `order_rate`
  MODIFY `order_rate_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=73;
--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=125;
--
-- AUTO_INCREMENT for table `plot`
--
ALTER TABLE `plot`
  MODIFY `plot_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=59;
--
-- AUTO_INCREMENT for table `tax`
--
ALTER TABLE `tax`
  MODIFY `tax_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=49;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `auth_item`
--
ALTER TABLE `auth_item`
  ADD CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `company`
--
ALTER TABLE `company`
  ADD CONSTRAINT `company_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `debit`
--
ALTER TABLE `debit`
  ADD CONSTRAINT `debit_ibfk_1` FOREIGN KEY (`invoice_id`) REFERENCES `invoice` (`invoice_id`),
  ADD CONSTRAINT `fk1` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`payment_id`),
  ADD CONSTRAINT `fk_debit_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_interest` FOREIGN KEY (`interest_id`) REFERENCES `interest` (`interest_id`),
  ADD CONSTRAINT `invoice_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `invoice_tax_id` FOREIGN KEY (`tax_id`) REFERENCES `tax` (`tax_id`);

--
-- Constraints for table `log`
--
ALTER TABLE `log`
  ADD CONSTRAINT `log_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_area_id` FOREIGN KEY (`area_id`) REFERENCES `area` (`area_id`),
  ADD CONSTRAINT `orders_fk1` FOREIGN KEY (`next_order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `orders_fk_company_id` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`);

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `order_details_plot_id` FOREIGN KEY (`plot_id`) REFERENCES `plot` (`plot_id`);

--
-- Constraints for table `order_rate`
--
ALTER TABLE `order_rate`
  ADD CONSTRAINT `order_rate_fk` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_invoice_id` FOREIGN KEY (`invoice_id`) REFERENCES `invoice` (`invoice_id`),
  ADD CONSTRAINT `payment_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);

--
-- Constraints for table `plot`
--
ALTER TABLE `plot`
  ADD CONSTRAINT `plot_fk_area_id` FOREIGN KEY (`area_id`) REFERENCES `area` (`area_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
