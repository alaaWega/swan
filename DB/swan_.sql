-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 30, 2019 at 07:35 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `swan_`
--

-- --------------------------------------------------------

--
-- Table structure for table `air_types`
--

CREATE TABLE `air_types` (
  `id` int(11) NOT NULL,
  `type` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `air_types`
--

INSERT INTO `air_types` (`id`, `type`, `created_at`, `updated_at`) VALUES
(1, 'سبيليت', '2019-06-02 19:00:57', '2019-06-02 19:02:30'),
(2, 'سبيليت مخفي', '2019-06-02 19:01:28', '2019-06-02 19:02:32'),
(3, 'مركزي', '2019-06-02 19:01:38', '2019-06-02 19:02:34'),
(4, 'شباك', '2019-06-02 19:01:45', '2019-06-02 19:02:37'),
(5, 'دولاب (فريستاند)', '2019-06-02 19:01:56', '2019-06-02 19:02:39');

-- --------------------------------------------------------

--
-- Table structure for table `applications`
--

CREATE TABLE `applications` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `region` varchar(255) NOT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `status` enum('Pending','Accepted','Completed','Cancelled','Under_Appraisal','Hanging','Not_Assign','Sms_Not_Confirmed') NOT NULL DEFAULT 'Sms_Not_Confirmed',
  `reason` varchar(255) DEFAULT NULL,
  `cancellation_reason` varchar(250) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `hour_id` int(11) NOT NULL,
  `day` date NOT NULL,
  `confirmation_code` varchar(6) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `rate` enum('Rated','Opend_Not_Rated','Not_Opened') NOT NULL DEFAULT 'Not_Opened',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `applications`
--

INSERT INTO `applications` (`id`, `name`, `phone`, `region`, `latitude`, `longitude`, `status`, `reason`, `cancellation_reason`, `company_id`, `hour_id`, `day`, `confirmation_code`, `is_active`, `rate`, `created_at`, `updated_at`) VALUES
(7, 'application 1', '01013258874', '41', 123, 132, 'Under_Appraisal', NULL, NULL, 3, 8, '2019-05-28', '', 1, 'Rated', '2019-05-24 17:09:55', '2019-06-29 23:53:01'),
(8, 'application 2', '01013696652', '41', 123, 132, 'Sms_Not_Confirmed', NULL, NULL, 3, 7, '2019-05-22', '', 1, 'Rated', '2019-05-24 17:09:55', '2019-06-10 23:25:53'),
(9, 'application 3', '01254711112', '41', 123, 132, 'Accepted', NULL, NULL, 3, 7, '2019-05-22', '', 1, 'Not_Opened', '2019-05-24 17:09:55', '2019-05-29 02:16:14'),
(61, 'Hossam2', '50123654', '41', NULL, NULL, 'Accepted', NULL, NULL, NULL, 7, '2019-06-15', '249enf', 1, 'Not_Opened', '2019-06-06 03:30:10', '2019-06-10 23:25:48'),
(113, '123', '50123654', '41', NULL, NULL, 'Not_Assign', NULL, NULL, NULL, 7, '2019-06-07', '', 1, 'Not_Opened', '2019-06-11 00:51:24', '2019-06-11 01:58:41'),
(115, 'ss', '50123654', '41', NULL, NULL, 'Pending', NULL, NULL, NULL, 7, '2019-06-06', '', 1, 'Not_Opened', '2019-06-11 01:58:59', '2019-06-11 01:58:59'),
(116, 'jh', '05012366', 'العاصمه2', NULL, NULL, 'Hanging', '45', NULL, 3, 7, '2019-06-06', '104ayj', 1, 'Not_Opened', '2019-06-29 20:47:22', '2019-06-29 23:34:06'),
(117, '45', '454545', 'vvvvvvvvvv', NULL, NULL, 'Sms_Not_Confirmed', NULL, NULL, NULL, 7, '2019-06-07', '471bwk', 0, 'Not_Opened', '2019-06-30 13:33:58', '2019-06-30 13:33:58'),
(118, '78', '787878', 'العاصمه2', NULL, NULL, 'Sms_Not_Confirmed', NULL, NULL, NULL, 7, '2019-06-14', '954uqj', 0, 'Not_Opened', '2019-06-30 13:44:03', '2019-06-30 13:44:03'),
(119, '4545', '454454', 'bnbnbnb', NULL, NULL, 'Completed', NULL, NULL, NULL, 7, '2019-06-14', '', 1, 'Not_Opened', '2019-06-30 13:47:21', '2019-06-30 14:47:59'),
(120, 'sss', '1233333', 'bnbnjhhugu', NULL, NULL, 'Accepted', NULL, NULL, 3, 7, '2019-06-13', '726ami', 1, 'Not_Opened', '2019-06-30 13:48:26', '2019-06-30 14:40:36');

-- --------------------------------------------------------

--
-- Table structure for table `application_air_types_services`
--

CREATE TABLE `application_air_types_services` (
  `id` int(11) NOT NULL,
  `application_id` int(11) NOT NULL,
  `air_type_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `application_air_types_services`
--

INSERT INTO `application_air_types_services` (`id`, `application_id`, `air_type_id`, `service_id`, `number`, `created_at`, `updated_at`) VALUES
(153, 9, 3, 5, 10, '2019-06-29 23:16:40', '2019-06-29 23:16:40'),
(154, 117, 1, 1, 1, '2019-06-30 13:33:59', '2019-06-30 13:33:59'),
(155, 118, 1, 1, 1, '2019-06-30 13:44:03', '2019-06-30 13:44:03'),
(156, 119, 1, 1, 1, '2019-06-30 13:47:21', '2019-06-30 13:47:21'),
(158, 120, 1, 2, 1, '2019-06-30 14:40:36', '2019-06-30 14:40:36'),
(159, 120, 2, 3, 55, '2019-06-30 14:44:34', '2019-06-30 14:44:34'),
(160, 120, 2, 3, 55, '2019-06-30 14:44:42', '2019-06-30 14:44:42'),
(161, 120, 2, 3, 55, '2019-06-30 14:44:52', '2019-06-30 14:44:52');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `x` int(11) NOT NULL,
  `commission_more` double NOT NULL,
  `commission_less` double NOT NULL,
  `sort` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `x`, `commission_more`, `commission_less`, `sort`, `is_active`, `created_at`, `updated_at`) VALUES
(22, 'قسم 1', 300, 10, 20, 2, 1, '2019-05-24 13:44:34', '2019-06-09 22:05:59'),
(25, 'قسم 2', 300, 10, 20, 1, 1, '2019-05-24 13:44:34', '2019-06-09 22:05:59'),
(26, 'قسم 3', 300, 10, 20, 3, 1, '2019-05-24 13:44:34', '2019-06-11 01:57:51');

-- --------------------------------------------------------

--
-- Table structure for table `company_orders`
--

CREATE TABLE `company_orders` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `application_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `company_orders`
--

INSERT INTO `company_orders` (`id`, `company_id`, `application_id`, `category_id`, `created_at`, `updated_at`) VALUES
(73, 8, 115, 22, '2019-06-11 02:59:08', '2019-06-11 02:00:43'),
(74, 9, 115, 22, '2019-06-11 02:59:10', '2019-06-11 02:01:29'),
(75, 3, 115, 26, '2019-06-11 02:06:30', '2019-06-11 02:06:30'),
(76, 7, 115, 26, '2019-06-11 02:06:31', '2019-06-11 02:06:31');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'الرياض', '2019-04-29 12:48:09', '2019-05-08 03:01:41');

-- --------------------------------------------------------

--
-- Table structure for table `emails`
--

CREATE TABLE `emails` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `title` varchar(100) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emails`
--

INSERT INTO `emails` (`id`, `name`, `email`, `phone`, `title`, `message`, `created_at`, `updated_at`) VALUES
(2, 'Hossam2', 'admin@jowd.com', '010136966753', 'jj', 'f', '2019-06-07 03:03:35', '2019-06-07 03:03:35'),
(3, 'Hossam2', 'admin@jowd.com', '010136966753', 'jj', 'f', '2019-06-07 03:04:17', '2019-06-07 03:04:17');

-- --------------------------------------------------------

--
-- Table structure for table `hours`
--

CREATE TABLE `hours` (
  `id` int(11) NOT NULL,
  `hour` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hours`
--

INSERT INTO `hours` (`id`, `hour`, `created_at`, `updated_at`) VALUES
(7, '02:47', '2019-05-24 16:59:09', '2019-06-04 00:45:08'),
(8, '03:02', '2019-05-24 16:59:09', '2019-05-26 00:59:10'),
(9, '18:05', '2019-05-26 00:07:33', '2019-05-26 00:07:33'),
(10, '02:00', '2019-05-26 00:48:27', '2019-05-26 00:48:27');

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` int(11) NOT NULL,
  `invoice_number` varchar(50) NOT NULL,
  `application_id` int(11) NOT NULL,
  `export` enum('Company','Team_Work') NOT NULL,
  `export_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `status` enum('Paid','Unpaid') NOT NULL DEFAULT 'Unpaid',
  `commission` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `invoice_number`, `application_id`, `export`, `export_id`, `amount`, `status`, `commission`, `created_at`, `updated_at`) VALUES
(5, '#8-2019', 8, 'Team_Work', 4, 500, 'Unpaid', 5000, '2019-05-27 00:37:04', '2019-05-27 00:37:04'),
(6, '#7-2019', 7, 'Team_Work', 4, 500, 'Paid', 50, '2019-05-27 00:38:11', '2019-06-07 03:33:32');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(1, 'default', '{\"displayName\":\"App\\\\Jobs\\\\SendNotificationCompanies\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendNotificationCompanies\",\"command\":\"O:34:\\\"App\\\\Jobs\\\\SendNotificationCompanies\\\":8:{s:14:\\\"\\u0000*\\u0000application\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":3:{s:5:\\\"class\\\";s:22:\\\"App\\\\Models\\\\Application\\\";s:2:\\\"id\\\";i:116;s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1561841260, 1561841260);

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `entity` varchar(100) NOT NULL,
  `entity_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`id`, `user_id`, `entity`, `entity_id`, `description`, `created_at`) VALUES
(4, 1, 'Application', 120, ' تغيير حالة الطلب الي Pending', '2019-06-30 14:34:00'),
(5, 1, 'Application', 120, ' تم أسناد الشركة رقم 3', '2019-06-30 14:37:36'),
(6, 1, 'Application', 120, ' تم تعديل الطلب ', '2019-06-30 14:40:36'),
(7, 1, 'Application', 120, ' تم أضافة خدمة جديده رقم 161', '2019-06-30 14:44:52'),
(8, 1, 'Application', 119, ' تغيير حالة الطلب الي Completed', '2019-06-30 14:47:59');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `application_id` int(11) DEFAULT NULL,
  `type` enum('Application','ContactUs') NOT NULL,
  `text` text NOT NULL,
  `user_type` enum('Company','Team_Work','Admin') NOT NULL,
  `user_id` int(11) NOT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `application_id`, `type`, `text`, `user_type`, `user_id`, `seen`, `created_at`, `updated_at`) VALUES
(119, 9, 'Application', 'تم أسناد طلب جديد رقم 9', 'Company', 3, 0, '2019-05-28 21:24:06', '2019-05-28 21:24:06'),
(120, 9, 'Application', 'تم أسناد طلب جديد رقم 9', 'Company', 3, 0, '2019-05-28 21:24:14', '2019-05-28 21:24:14'),
(121, 9, 'Application', 'تم أسناد طلب جديد رقم 9', 'Company', 3, 0, '2019-05-28 21:30:01', '2019-05-28 21:30:01'),
(122, 7, 'Application', 'تم أسناد طلب جديد رقم 7', 'Company', 3, 0, '2019-05-28 21:31:29', '2019-05-28 21:31:29'),
(123, 7, 'Application', 'تم أسناد طلب جديد رقم 7', 'Company', 3, 0, '2019-05-28 21:31:38', '2019-05-28 21:31:38'),
(126, 8, 'Application', 'تم أسناد طلب جديد رقم 8', 'Company', 3, 0, '2019-05-28 21:49:13', '2019-05-28 21:49:13'),
(128, 7, 'Application', ' يتبقي أقل من 3 دقائق علي ميعاد الطلب ', 'Team_Work', 4, 0, '2019-05-29 00:59:19', '2019-05-29 00:59:19'),
(129, 7, 'Application', ' يتبقي أقل من 3 دقائق علي ميعاد الطلب ', 'Team_Work', 6, 0, '2019-05-29 00:59:21', '2019-05-29 00:59:21'),
(130, 7, 'Application', ' يتبقي أقل من 3 دقائق علي ميعاد الطلب ', 'Company', 3, 0, '2019-05-29 00:59:22', '2019-05-29 00:59:22'),
(205, 61, 'Application', 'تم أسناد طلب جديد رقم 61', 'Company', 3, 0, '2019-06-06 01:30:35', '2019-06-06 01:30:35'),
(206, 61, 'Application', 'تم أسناد طلب جديد رقم 61', 'Company', 7, 0, '2019-06-06 03:30:43', '2019-06-06 03:30:43'),
(236, NULL, 'ContactUs', 'رساله جديدة', 'Admin', 1, 0, '2019-06-07 01:04:17', '2019-06-07 01:04:17'),
(258, 113, 'Application', 'تم أسناد طلب جديد رقم 113', 'Company', 7, 0, '2019-06-11 00:51:33', '2019-06-11 00:51:33'),
(259, 113, 'Application', 'تم أسناد طلب جديد رقم 113', 'Company', 9, 0, '2019-06-11 00:51:34', '2019-06-11 00:51:34'),
(260, 113, 'Application', 'تم أسناد طلب جديد رقم 113', 'Company', 3, 0, '2019-06-11 00:54:50', '2019-06-11 00:54:50'),
(261, 113, 'Application', 'تم أسناد طلب جديد رقم 113', 'Company', 8, 0, '2019-06-11 00:54:51', '2019-06-11 00:54:51'),
(262, 113, 'Application', 'تم أسناد طلب جديد رقم 113', 'Company', 3, 0, '2019-06-11 00:55:37', '2019-06-11 00:55:37'),
(263, 113, 'Application', 'تم أسناد طلب جديد رقم 113', 'Company', 8, 0, '2019-06-11 00:55:39', '2019-06-11 00:55:39'),
(264, 113, 'Application', 'تم أسناد طلب جديد رقم 113', 'Company', 1, 0, '2019-06-11 01:00:32', '2019-06-11 01:00:32'),
(265, 113, 'Application', 'تم أسناد طلب جديد رقم 113', 'Company', 4, 0, '2019-06-11 01:00:34', '2019-06-11 01:00:34'),
(266, 113, 'Application', 'تم أسناد طلب جديد رقم 113', 'Company', 6, 0, '2019-06-11 01:00:35', '2019-06-11 01:00:35'),
(271, 115, 'Application', 'تم أسناد طلب جديد رقم 115', 'Company', 8, 0, '2019-06-11 01:59:09', '2019-06-11 01:59:09'),
(272, 115, 'Application', 'تم أسناد طلب جديد رقم 115', 'Company', 9, 0, '2019-06-11 01:59:10', '2019-06-11 01:59:10'),
(273, 115, 'Application', 'تم أسناد طلب جديد رقم 115', 'Company', 3, 0, '2019-06-11 02:06:30', '2019-06-11 02:06:30'),
(274, 115, 'Application', 'تم أسناد طلب جديد رقم 115', 'Company', 7, 0, '2019-06-11 02:06:31', '2019-06-11 02:06:31'),
(275, 116, 'Application', 'تم أسناد طلب جديد رقم 116', 'Company', 3, 0, '2019-06-29 21:33:53', '2019-06-29 21:33:53'),
(276, 116, 'Application', ' تم تعليق الطلب رقم 116', 'Company', 3, 0, '2019-06-29 21:34:05', '2019-06-29 21:34:05'),
(277, 120, 'Application', 'تم أسناد طلب جديد رقم 120', 'Company', 3, 0, '2019-06-30 12:37:34', '2019-06-30 12:37:34');

-- --------------------------------------------------------

--
-- Table structure for table `regions`
--

CREATE TABLE `regions` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `country_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `regions`
--

INSERT INTO `regions` (`id`, `name`, `country_id`, `created_at`, `updated_at`) VALUES
(41, 'حي 1', 1, '2019-05-24 15:44:54', '2019-05-24 15:44:54'),
(42, 'حي 2', 1, '2019-05-28 23:31:59', '2019-05-28 23:31:59');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text,
  `icon` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `name`, `description`, `icon`, `created_at`, `updated_at`) VALUES
(1, 'تنظيف داخلي وخارجي', 'قوم بتنظيف المكيف بضغط الماء العالي وهو في مكانه ، الطريقه الحديثه التي تقوم بإزالة كافة الأوساخ والحشرات المتراكمه داخل المكيف ، ولأننا نهتم بنظافة منزلكم فنقوم بوضع عوازل قبل أن نبدأ بالعمل.', '/images/uploads/1559501905d75c9c1683f075767ad4c1a8fa0e8186image.png', '2019-06-02 18:58:25', '2019-06-02 19:02:12'),
(2, 'تعبئة فريون', 'نقوم بفحص التمديدات في حالة كان هنالك تسريب للفريون وبعد ذلك نقوم بمعالجة التسريب إن وجد ، ومن ثم نقوم بتعبئة الفريون بالقدر المناسب.', '/images/uploads/15595019292af5f3af9a3f6420c245a009d34ff1c3image.png', '2019-06-02 18:58:49', '2019-06-02 19:02:15'),
(3, 'فك أو تركيب', 'في حال كان لديك مكيف وترغب بتركيبه ، لاتشيل هم نركبه لك ، وفي حال كنت ترغب في فك مكيف من مكان وتركيبه في مكان آخر أو في منزل آخر ، أيضاً لاتشيل هم بنقوم بالواجب.', '/images/uploads/15595019808201e8bbfac0e2fb973e628a3e684821image.png', '2019-06-02 18:59:40', '2019-06-02 19:02:17'),
(4, 'تسريب مياه', 'مكيفك يسرب ماء ؟ ، ولا يهمّك نقوم بفحص المشكلة ومعالجتها فوراً.', '/images/uploads/155950200282a690ccca581f60296d458d4c9f3474image.png', '2019-06-02 19:00:02', '2019-06-02 19:02:19'),
(5, 'عدم التبريد', 'مزعّلك المكيف لأنه مايبرد ؟ ، ولا يهمّك نفحص المشكلة ونفرّحك ببرودته.', '/images/uploads/1559502021259bc8297a2e410b63331c1b4353a5dcimage.png', '2019-06-02 19:00:21', '2019-06-02 19:02:21'),
(6, 'خدمات أخرى', 'مكيفك مبهذلك وماتدري وش علّته ؟ ، ولايهمّك خلّها علينا.', '/images/uploads/15595020393b113c4fd16e36e42fefc9114f3da6b6image.png', '2019-06-02 19:00:39', '2019-06-02 19:02:23');

-- --------------------------------------------------------

--
-- Table structure for table `servie_prices_details`
--

CREATE TABLE `servie_prices_details` (
  `id` int(11) NOT NULL,
  `air_type_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `range_from` int(11) NOT NULL,
  `range_to` int(11) NOT NULL,
  `price` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `servie_prices_details`
--

INSERT INTO `servie_prices_details` (`id`, `air_type_id`, `service_id`, `range_from`, `range_to`, `price`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 5, 150, '2019-06-06 04:51:27', '2019-06-06 04:51:27'),
(2, 1, 1, 6, 10, 80, '2019-06-06 04:51:27', '2019-06-06 04:51:27'),
(3, 1, 1, 11, 100, 50, '2019-06-06 04:51:44', '2019-06-06 04:51:44'),
(4, 4, 1, 1, 5, 150, '2019-06-06 04:51:27', '2019-06-06 04:51:27'),
(5, 4, 1, 6, 10, 55, '2019-06-06 04:51:27', '2019-06-29 20:58:16'),
(6, 4, 1, 11, 100, 50, '2019-06-06 04:51:44', '2019-06-06 04:51:44');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `twitter` varchar(100) NOT NULL,
  `instgram` varchar(100) NOT NULL,
  `location` varchar(255) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `informations` text NOT NULL,
  `waiting_order_time` int(11) NOT NULL,
  `notify_time` int(11) NOT NULL,
  `not_assign_late_time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `twitter`, `instgram`, `location`, `phone`, `email`, `informations`, `waiting_order_time`, `notify_time`, `not_assign_late_time`) VALUES
(1, 'https://twitter.com/getsawn', 'https://www.instagram.com/getsawn', 'https://goo.gl/maps/XcUCWUL1Wpa9ZDbB6', '0536600020', '55@ee.com', 'صون لخدمات التكييف صون هي منصة إلكترونية تجيب لك أفضل شركات خدمات التكييف لعند بيتك بضغطة زر! بواسطة شركات معتمدة ذات جودة عالية بإشراف مختصين سعوديين، ثق تماماً .. ستصلك أفضل شركات الرياض وبأفضل الأسعار وبضغطة زر .. هذا وعدنا', 3, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_blocked` tinyint(1) NOT NULL DEFAULT '0',
  `is_export` tinyint(1) NOT NULL DEFAULT '1',
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `type` enum('Admin','Company','Team_Work') COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `password`, `is_active`, `is_blocked`, `is_export`, `token`, `category_id`, `company_id`, `type`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'swan@swan.com', '1234569', '$2y$10$WmeLbczKuYFnEtCnOgm.ie3phaI4kG.lxAvjrC9bG2LViWv8TUxfW', 1, 0, 1, '', NULL, NULL, 'Admin', 'ZkJrnVDrBDElNhnwxHBOOBX25oce2kfe4xSAPHNM2PNEcxXm7xhlXH1PVmUI', '2017-10-24 09:30:04', '2019-04-12 19:15:10'),
(3, 'شركة 1', 'company1@swan.com', '123456', '$2y$10$J.nO0dPUmXpPy0zykNYUwOdOrKuLYECMwuCZfRre2tmdijv2jInNm', 1, 0, 1, 'NJD81PpDACjEMzQ3BYl+GMKNRo=', 26, NULL, 'Company', 'lXf2AxXHtjyt7dQFDRRznpgldISUDDCkT1yjCJKICCNjCSkyigtOvo0XZcuf', '2019-05-24 11:45:26', '2019-05-24 11:46:19'),
(4, 'hhh', 'wasl@wasl.com', '010136753', '$2y$10$9Y/9vrCZD7PzDG9FNEg/0ee1UrrnZen8R4qHOU2ic7tzylthvXdY.', 1, 1, 1, 'qfbvllCNAB1br6eeC0QvMdZp7Hk=', NULL, 3, 'Team_Work', 'IiDlBkivr8NV0EEQFsP5W0JujF1YBR2BOCJJrxOlytfSiU2yJxKzKuSN3ucC', '2019-05-24 16:35:07', '2019-05-25 12:21:43'),
(6, 'team2', 'team2@wasl.com', '0510136753', '$2y$10$9Y/9vrCZD7PzDG9FNEg/0ee1UrrnZen8R4qHOU2ic7tzylthvXdY.', 1, 1, 1, 'qfbvllCNAB1br6eeC0QvMdZp7Hk=', NULL, 3, 'Team_Work', 'bPwNbEKs5dKNlZwhyjuDJecyULnCYKUmkHrFw0zgSNtPtoDIrVeMg6hR8xp6', '2019-05-24 16:35:07', '2019-05-25 12:21:43'),
(7, 'شركة 2', 'company2@swan.com', '01013696655', '$2y$10$s3oUXU26j2qoLRawD5E8EO/5M.CDI95s2HCEHlyEa11JmhIXFcYti', 1, 0, 1, 'Q+7LQgnvhAJX1cv0Aou09qCqIos=', 26, NULL, 'Company', NULL, '2019-05-29 19:52:31', '2019-05-29 19:52:31'),
(8, 'شركة 33', 'company33@swan.com', '12345633', '$2y$10$J.nO0dPUmXpPy0zykNYUwOdOrKuLYECMwuCZfRre2tmdijv2jInNm', 1, 0, 1, 'NJD81PpDACjEMzQ3BYl+GMKNRo=', 25, NULL, 'Company', 'lXf2AxXHtjyt7dQFDRRznpgldISUDDCkT1yjCJKICCNjCSkyigtOvo0XZcuf', '2019-05-24 11:45:26', '2019-05-24 11:46:19'),
(9, 'شركة 44', 'company44@swan.com', '0101369665544', '$2y$10$s3oUXU26j2qoLRawD5E8EO/5M.CDI95s2HCEHlyEa11JmhIXFcYti', 1, 0, 1, 'Q+7LQgnvhAJX1cv0Aou09qCqIos=', 25, NULL, 'Company', NULL, '2019-05-29 19:52:31', '2019-05-29 19:52:31'),
(16, 'qq', 'qq@qq.com', '22222222', '$2y$10$gzg7rOesBDpEnnFilIMa6e1yItBC3NrjFdfMNNsrh0Hsa.lPXiXN.', 1, 1, 1, '9gbZpHz65MGINn6jZuC4hgXk7E=', 22, NULL, 'Company', NULL, '2019-06-30 14:12:21', '2019-06-30 15:07:14');

-- --------------------------------------------------------

--
-- Table structure for table `user_devices`
--

CREATE TABLE `user_devices` (
  `id` int(11) NOT NULL,
  `device_token` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_rates`
--

CREATE TABLE `user_rates` (
  `id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `rate` double NOT NULL,
  `application_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_rates`
--

INSERT INTO `user_rates` (`id`, `comment`, `rate`, `application_id`, `company_id`, `created_at`, `updated_at`) VALUES
(4, 'يي', 2, 7, 3, '2019-06-07 04:04:58', '2019-06-07 04:04:58');

-- --------------------------------------------------------

--
-- Table structure for table `user_region`
--

CREATE TABLE `user_region` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `region_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_region`
--

INSERT INTO `user_region` (`id`, `user_id`, `region_id`) VALUES
(9, 3, 41),
(10, 3, 42),
(14, 16, 41),
(15, 16, 42),
(16, 7, 41),
(17, 7, 42),
(18, 8, 42);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `air_types`
--
ALTER TABLE `air_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `applications`
--
ALTER TABLE `applications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `hour_id` (`hour_id`);

--
-- Indexes for table `application_air_types_services`
--
ALTER TABLE `application_air_types_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `application_id` (`application_id`),
  ADD KEY `air_type_id` (`air_type_id`),
  ADD KEY `service_id` (`service_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `company_orders`
--
ALTER TABLE `company_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `application_id` (`application_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emails`
--
ALTER TABLE `emails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hours`
--
ALTER TABLE `hours`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`export_id`),
  ADD KEY `application_id` (`application_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `application_id` (`application_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `regions`
--
ALTER TABLE `regions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `country_id` (`country_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `servie_prices_details`
--
ALTER TABLE `servie_prices_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `air_type_id` (`air_type_id`),
  ADD KEY `service_id` (`service_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phone` (`phone`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `user_devices`
--
ALTER TABLE `user_devices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user_rates`
--
ALTER TABLE `user_rates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `team_work_id` (`company_id`),
  ADD KEY `application_id` (`application_id`);

--
-- Indexes for table `user_region`
--
ALTER TABLE `user_region`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `region_id` (`region_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `air_types`
--
ALTER TABLE `air_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `applications`
--
ALTER TABLE `applications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT for table `application_air_types_services`
--
ALTER TABLE `application_air_types_services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=162;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `company_orders`
--
ALTER TABLE `company_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `emails`
--
ALTER TABLE `emails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `hours`
--
ALTER TABLE `hours`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=278;

--
-- AUTO_INCREMENT for table `regions`
--
ALTER TABLE `regions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `servie_prices_details`
--
ALTER TABLE `servie_prices_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `user_devices`
--
ALTER TABLE `user_devices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_rates`
--
ALTER TABLE `user_rates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user_region`
--
ALTER TABLE `user_region`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `applications`
--
ALTER TABLE `applications`
  ADD CONSTRAINT `applications_ibfk_2` FOREIGN KEY (`company_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `applications_ibfk_3` FOREIGN KEY (`hour_id`) REFERENCES `hours` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `application_air_types_services`
--
ALTER TABLE `application_air_types_services`
  ADD CONSTRAINT `application_air_types_services_ibfk_1` FOREIGN KEY (`air_type_id`) REFERENCES `air_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `application_air_types_services_ibfk_2` FOREIGN KEY (`application_id`) REFERENCES `applications` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `application_air_types_services_ibfk_3` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `company_orders`
--
ALTER TABLE `company_orders`
  ADD CONSTRAINT `company_orders_ibfk_1` FOREIGN KEY (`application_id`) REFERENCES `applications` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `company_orders_ibfk_2` FOREIGN KEY (`company_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `company_orders_ibfk_3` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_ibfk_1` FOREIGN KEY (`application_id`) REFERENCES `applications` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `invoices_ibfk_2` FOREIGN KEY (`export_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `logs`
--
ALTER TABLE `logs`
  ADD CONSTRAINT `logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notifications_ibfk_2` FOREIGN KEY (`application_id`) REFERENCES `applications` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `regions`
--
ALTER TABLE `regions`
  ADD CONSTRAINT `regions_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `servie_prices_details`
--
ALTER TABLE `servie_prices_details`
  ADD CONSTRAINT `servie_prices_details_ibfk_1` FOREIGN KEY (`air_type_id`) REFERENCES `air_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `servie_prices_details_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_3` FOREIGN KEY (`company_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_devices`
--
ALTER TABLE `user_devices`
  ADD CONSTRAINT `user_devices_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_rates`
--
ALTER TABLE `user_rates`
  ADD CONSTRAINT `user_rates_ibfk_1` FOREIGN KEY (`application_id`) REFERENCES `applications` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_rates_ibfk_2` FOREIGN KEY (`company_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_region`
--
ALTER TABLE `user_region`
  ADD CONSTRAINT `user_region_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `regions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_region_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
