-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 16, 2022 at 06:19 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `real_estate`
--

-- --------------------------------------------------------

--
-- Table structure for table `attachment_employees`
--

CREATE TABLE `attachment_employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `comment_employee_cycle_id` bigint(20) UNSIGNED DEFAULT NULL,
  `path` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attachment_employees`
--

INSERT INTO `attachment_employees` (`id`, `comment_employee_cycle_id`, `path`, `created_at`, `updated_at`) VALUES
(1, 2, '38781.png', NULL, NULL),
(2, 3, '71562.png', NULL, NULL),
(3, 13, 'employee__code_32022-02-22 06:16:15_step_9736102', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `attachment_letter_cycles`
--

CREATE TABLE `attachment_letter_cycles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attachment_matrial_cycles`
--

CREATE TABLE `attachment_matrial_cycles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `comment_matrial_cycle_id` bigint(20) UNSIGNED DEFAULT NULL,
  `path` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attachment_matrial_cycles`
--

INSERT INTO `attachment_matrial_cycles` (`id`, `comment_matrial_cycle_id`, `path`, `created_at`, `updated_at`) VALUES
(1, 14, '82895.pdf', NULL, NULL),
(2, 15, '99801.png', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `attachment_petty_cash_cycles`
--

CREATE TABLE `attachment_petty_cash_cycles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `comment_petty_cash_cycle_id` bigint(20) UNSIGNED DEFAULT NULL,
  `path` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attachment_purchase_cycles`
--

CREATE TABLE `attachment_purchase_cycles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `comment_purchase_cycle_id` bigint(20) UNSIGNED DEFAULT NULL,
  `path` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attachment_purchase_cycles`
--

INSERT INTO `attachment_purchase_cycles` (`id`, `comment_purchase_cycle_id`, `path`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL, NULL),
(2, 7, '86386.png', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `attachment_rfq_cycles`
--

CREATE TABLE `attachment_rfq_cycles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `comment_rfq_cycle_id` bigint(20) UNSIGNED DEFAULT NULL,
  `path` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attachment_rfq_cycles`
--

INSERT INTO `attachment_rfq_cycles` (`id`, `comment_rfq_cycle_id`, `path`, `created_at`, `updated_at`) VALUES
(1, 1, '82742.pdf', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `attachment_site_cycles`
--

CREATE TABLE `attachment_site_cycles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `comment_site_cycle_id` bigint(20) UNSIGNED DEFAULT NULL,
  `path` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attachment_site_cycles`
--

INSERT INTO `attachment_site_cycles` (`id`, `comment_site_cycle_id`, `path`, `created_at`, `updated_at`) VALUES
(1, 1, '63924.png', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `attachment_subcontractor_cycles`
--

CREATE TABLE `attachment_subcontractor_cycles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `comment_subcontractor_cycle_id` bigint(20) UNSIGNED DEFAULT NULL,
  `path` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attachment_subcontractor_cycles`
--

INSERT INTO `attachment_subcontractor_cycles` (`id`, `comment_subcontractor_cycle_id`, `path`, `created_at`, `updated_at`) VALUES
(1, 1, '50490.pdf', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `comment_employee_cycles`
--

CREATE TABLE `comment_employee_cycles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_cycle_id` bigint(20) UNSIGNED DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comment_employee_cycles`
--

INSERT INTO `comment_employee_cycles` (`id`, `employee_cycle_id`, `content`, `user_id`, `created_at`, `updated_at`) VALUES
(2, 1, '\"68868\"', 1, '2022-02-22 00:36:33', '2022-02-22 00:36:33'),
(3, 4, '\"6565\"', 1, '2022-02-22 00:56:45', '2022-02-22 00:56:45'),
(13, 5, '\"5656\"', 1, '2022-02-22 04:16:15', '2022-02-22 04:16:15');

-- --------------------------------------------------------

--
-- Table structure for table `comment_letter_cycles`
--

CREATE TABLE `comment_letter_cycles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comment_matrial_cycles`
--

CREATE TABLE `comment_matrial_cycles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `matrial_request_cycle_id` bigint(20) UNSIGNED DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comment_matrial_cycles`
--

INSERT INTO `comment_matrial_cycles` (`id`, `matrial_request_cycle_id`, `content`, `user_id`, `created_at`, `updated_at`) VALUES
(14, 1, '\"6565\"', 1, '2022-02-08 02:19:20', '2022-02-08 02:19:20'),
(15, 13, '\"454\"', 1, '2022-02-26 03:49:56', '2022-02-26 03:49:56');

-- --------------------------------------------------------

--
-- Table structure for table `comment_petty_cash_cycles`
--

CREATE TABLE `comment_petty_cash_cycles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `petty_cash_cycle_id` bigint(20) UNSIGNED DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comment_purchase_cycles`
--

CREATE TABLE `comment_purchase_cycles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_order_cycle_id` bigint(20) UNSIGNED DEFAULT NULL,
  `step` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `flowwork_step_id` bigint(20) UNSIGNED DEFAULT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comment_purchase_cycles`
--

INSERT INTO `comment_purchase_cycles` (`id`, `purchase_order_cycle_id`, `step`, `status`, `flowwork_step_id`, `role_id`, `created_at`, `updated_at`, `content`, `user_id`) VALUES
(28, 1, NULL, NULL, NULL, NULL, '2022-02-13 04:11:18', '2022-02-13 04:11:18', '\"6655\"', 1),
(32, 1, NULL, NULL, NULL, NULL, '2022-02-14 23:10:31', '2022-02-14 23:10:31', '\"6565\"', 1),
(44, 1, NULL, NULL, NULL, NULL, '2022-02-14 23:45:36', '2022-02-14 23:45:36', '\"6565\"', 1),
(57, 1, NULL, NULL, NULL, NULL, '2022-02-15 01:13:51', '2022-02-15 01:13:51', '\"5454\"', 1),
(60, 1, NULL, NULL, NULL, NULL, '2022-02-15 01:21:31', '2022-02-15 01:21:31', '\"655\"', 1),
(62, 1, NULL, NULL, NULL, NULL, '2022-02-15 01:27:03', '2022-02-15 01:27:03', '\"565\"', 1),
(63, 1, NULL, NULL, NULL, NULL, '2022-02-15 01:28:39', '2022-02-15 01:28:39', '\"6565\"', 1),
(71, 1, NULL, NULL, NULL, NULL, '2022-02-15 01:39:03', '2022-02-15 01:39:03', '\"656565\"', 1),
(73, 1, NULL, NULL, NULL, NULL, '2022-02-16 23:43:13', '2022-02-16 23:43:13', '\"5545\"', 1),
(74, 131, NULL, NULL, NULL, NULL, '2022-02-17 04:13:54', '2022-02-17 04:13:54', '\"545454\"', 1),
(80, 133, NULL, NULL, NULL, NULL, '2022-02-18 10:43:26', '2022-02-18 10:43:26', '\"565\"', 1),
(81, 142, NULL, NULL, NULL, NULL, '2022-03-19 12:16:48', '2022-03-19 12:16:48', '\"565\"', 4),
(82, 152, NULL, NULL, NULL, NULL, '2022-04-06 09:09:56', '2022-04-06 09:09:56', '\"54\"', 4),
(83, 181, NULL, NULL, NULL, NULL, '2022-04-10 08:19:25', '2022-04-10 08:19:25', '\"56\"', 4),
(84, 154, NULL, NULL, NULL, NULL, '2022-04-10 08:20:53', '2022-04-10 08:20:53', '\"6565\"', 4),
(85, 155, NULL, NULL, NULL, NULL, '2022-05-08 05:47:02', '2022-05-08 05:47:02', '\"65656\"', 4);

-- --------------------------------------------------------

--
-- Table structure for table `comment_rfq_cycles`
--

CREATE TABLE `comment_rfq_cycles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `rfq_cycle_id` bigint(20) UNSIGNED DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comment_rfq_cycles`
--

INSERT INTO `comment_rfq_cycles` (`id`, `rfq_cycle_id`, `content`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, '\"5454\"', 1, '2022-02-09 01:41:43', '2022-02-09 01:41:43');

-- --------------------------------------------------------

--
-- Table structure for table `comment_site_cycles`
--

CREATE TABLE `comment_site_cycles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `site_cycle_id` bigint(20) UNSIGNED DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comment_site_cycles`
--

INSERT INTO `comment_site_cycles` (`id`, `site_cycle_id`, `content`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, '\"56565\"', 1, '2022-02-21 23:45:50', '2022-02-21 23:45:50');

-- --------------------------------------------------------

--
-- Table structure for table `comment_subcontractor_cycles`
--

CREATE TABLE `comment_subcontractor_cycles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subcontractor_request_cycle_id` bigint(20) UNSIGNED DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `path` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comment_subcontractor_cycles`
--

INSERT INTO `comment_subcontractor_cycles` (`id`, `subcontractor_request_cycle_id`, `content`, `user_id`, `created_at`, `updated_at`, `path`) VALUES
(1, 1, '\"878\"', 1, '2022-02-08 22:07:01', '2022-02-08 22:07:01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `ref` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `to` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `project_id`, `user_id`, `status`, `ref`, `date`, `subject`, `content`, `created_at`, `updated_at`, `to`) VALUES
(1, 1, 1, 0, '55', '2022-02-07', '555', '5555', '2022-02-03 01:06:11', '2022-02-03 01:06:11', '55'),
(4, 1, 4, 0, '+6698', '2022-03-07', '6565', '46565', '2022-03-18 20:03:21', '2022-03-18 20:03:21', '6565'),
(5, 2, 4, 0, '656', '2022-04-20', '65', 'With reference to the above subject,', '2022-04-10 08:16:11', '2022-04-10 08:16:11', '45');

-- --------------------------------------------------------

--
-- Table structure for table `employee_cycles`
--

CREATE TABLE `employee_cycles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED DEFAULT NULL,
  `step` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `flowwork_step_id` bigint(20) UNSIGNED DEFAULT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employee_cycles`
--

INSERT INTO `employee_cycles` (`id`, `employee_id`, `step`, `status`, `flowwork_step_id`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 3, 1, 1, 42, 58, NULL, '2022-02-22 00:36:33'),
(4, 3, 2, 1, 43, 57, NULL, '2022-02-22 00:56:45'),
(5, 3, 3, 1, 44, 55, NULL, '2022-02-22 04:16:15'),
(6, 4, 1, 0, 42, 58, NULL, NULL),
(7, 5, 1, 0, 42, 58, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employee_user`
--

CREATE TABLE `employee_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employee_user`
--

INSERT INTO `employee_user` (`id`, `employee_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 3, 1, NULL, NULL),
(3, 5, 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flowwork_steps`
--

CREATE TABLE `flowwork_steps` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `step` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `work_flow_id` bigint(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flowwork_steps`
--

INSERT INTO `flowwork_steps` (`id`, `role_id`, `step`, `created_at`, `updated_at`, `work_flow_id`) VALUES
(26, 50, 1, '2022-02-12 22:01:27', '2022-02-12 22:01:27', 10),
(27, 57, 2, '2022-02-12 22:01:27', '2022-02-12 22:01:27', 10),
(28, 62, 3, '2022-02-12 22:01:27', '2022-02-12 22:01:27', 10),
(29, 57, 1, '2022-02-12 22:01:27', '2022-02-12 22:01:27', 11),
(30, 55, 2, '2022-02-12 22:01:27', '2022-02-12 22:01:27', 11),
(31, 62, 3, '2022-02-12 22:01:27', '2022-02-12 22:01:27', 11),
(32, 57, 1, '2022-02-12 22:01:27', '2022-02-12 22:01:27', 12),
(33, 55, 2, '2022-02-12 22:01:27', '2022-02-12 22:01:27', 12),
(34, 62, 3, '2022-02-12 22:01:27', '2022-02-12 22:01:27', 12),
(35, 57, 1, '2022-02-12 22:01:27', '2022-02-12 22:01:27', 13),
(36, 58, 1, '2022-02-12 22:01:27', '2022-02-12 22:01:27', 14),
(37, 57, 1, '2022-02-12 22:01:27', '2022-02-12 22:01:27', 15),
(38, 55, 2, '2022-02-12 22:01:27', '2022-02-12 22:01:27', 15),
(39, 50, 1, '2022-02-12 22:01:27', '2022-02-12 22:01:27', 16),
(40, 57, 2, '2022-02-12 22:01:27', '2022-02-12 22:01:27', 16),
(41, 62, 2, '2022-02-12 22:01:27', '2022-02-12 22:01:27', 16),
(42, 58, 1, NULL, NULL, 17),
(43, 57, 2, NULL, NULL, 17),
(44, 55, 3, NULL, NULL, 17);

-- --------------------------------------------------------

--
-- Table structure for table `letter_cycles`
--

CREATE TABLE `letter_cycles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `matrial_attrs`
--

CREATE TABLE `matrial_attrs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` double(8,2) DEFAULT NULL,
  `unit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_price` double(8,2) DEFAULT NULL,
  `total` double(8,2) DEFAULT NULL,
  `matrial_request_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `matrial_attrs`
--

INSERT INTO `matrial_attrs` (`id`, `name`, `qty`, `unit`, `unit_price`, `total`, `matrial_request_id`, `created_at`, `updated_at`) VALUES
(6, '45', 45.00, '45', 45.00, 2025.00, 6, NULL, NULL),
(7, '44545', 45.00, '45', 45.00, 2025.00, 7, NULL, NULL),
(8, '44545', 45.00, '45', 45.00, 2025.00, 8, NULL, NULL),
(9, '44545', 45.00, '45', 45.00, 2025.00, 9, NULL, NULL),
(11, '44545', 45.00, '45', 45.00, 2025.00, 12, NULL, NULL),
(14, '6565', 45.00, '45', 4.00, 180.00, 15, NULL, NULL),
(18, 'xgh', 45.00, 'cbh', 45.00, 2025.00, 20, NULL, NULL),
(19, '545', 45.00, '45', 45.00, 2025.00, 21, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `matrial_conditions`
--

CREATE TABLE `matrial_conditions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `dis` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `matrial_request_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `matrial_conditions`
--

INSERT INTO `matrial_conditions` (`id`, `dis`, `matrial_request_id`, `created_at`, `updated_at`) VALUES
(1, '455', 6, NULL, NULL),
(2, '5454', 7, NULL, NULL),
(3, '5454', 8, NULL, NULL),
(4, '5454', 9, NULL, NULL),
(6, '5454', 12, NULL, NULL),
(7, '4545', 15, NULL, NULL),
(8, 'vfhh', 20, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `matrial_requests`
--

CREATE TABLE `matrial_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `ref` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total` float DEFAULT NULL,
  `vat` float DEFAULT NULL,
  `to` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `matrial_requests`
--

INSERT INTO `matrial_requests` (`id`, `project_id`, `user_id`, `status`, `ref`, `date`, `subject`, `content`, `created_at`, `updated_at`, `total`, `vat`, `to`) VALUES
(6, 1, 1, 0, NULL, '2022-02-22', '545', '55', '2022-02-04 22:41:23', '2022-02-04 22:41:23', NULL, NULL, NULL),
(7, 1, 1, 0, 'ghh', '2022-02-07', '554', '554', '2022-02-07 23:47:25', '2022-02-07 23:47:25', 2328.75, 303.75, NULL),
(8, 1, 1, 0, 'ghh', '2022-02-07', '554', '554', '2022-02-07 23:48:23', '2022-02-07 23:48:23', 2328.75, 303.75, NULL),
(9, 1, 1, 0, 'ghh', '2022-02-07', '554', '554', '2022-02-07 23:48:54', '2022-02-07 23:48:54', 2328.75, 303.75, NULL),
(12, 1, 1, NULL, 'ghh', '2022-02-07', '554', '554', '2022-02-07 23:50:58', '2022-02-08 02:19:20', 2328.75, 303.75, '787'),
(15, 1, 1, NULL, 'gfgf', '2022-02-15', '4545', '6565', '2022-02-21 21:54:42', '2022-03-04 16:41:45', 207, 27, '232'),
(20, 3, 4, 0, 'xgg', '2022-03-23', 'cgg', 'xfrg', '2022-03-18 19:51:03', '2022-03-18 19:51:03', 2328.75, 303.75, 'xffgg'),
(21, 3, 4, 0, '5454', '2022-04-19', '45', 'With reference to the above subject, With reference to the above subject, your quotation No xgg (Rev.0) Dated on 2022-03-23, we would like to place the purchase order for MATERIAL NAME & Delivery for Materials is two days to job site OR Exclude all transportation costs.', '2022-04-10 08:18:56', '2022-04-10 08:18:56', 2328.75, 303.75, '45');

-- --------------------------------------------------------

--
-- Table structure for table `matrial_request_cycles`
--

CREATE TABLE `matrial_request_cycles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `matrial_request_id` bigint(20) UNSIGNED DEFAULT NULL,
  `step` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `flowwork_step_id` bigint(20) UNSIGNED DEFAULT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `matrial_request_cycles`
--

INSERT INTO `matrial_request_cycles` (`id`, `matrial_request_id`, `step`, `status`, `created_at`, `updated_at`, `flowwork_step_id`, `role_id`) VALUES
(1, 12, 1, NULL, NULL, '2022-02-08 02:19:20', 10, 25),
(13, 15, 1, 1, NULL, '2022-02-26 03:49:56', 26, 50),
(14, 15, 2, NULL, NULL, '2022-03-04 16:41:45', 27, 57),
(22, 20, 1, 0, NULL, NULL, 26, 50),
(23, 21, 1, 0, NULL, NULL, 26, 50);

-- --------------------------------------------------------

--
-- Table structure for table `matrial_request_user`
--

CREATE TABLE `matrial_request_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `matrial_request_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `matrial_request_user`
--

INSERT INTO `matrial_request_user` (`id`, `matrial_request_id`, `user_id`, `created_at`, `updated_at`) VALUES
(3, 7, 1, NULL, NULL),
(4, 8, 1, NULL, NULL),
(5, 9, 1, NULL, NULL),
(7, 12, 1, NULL, NULL),
(8, 15, 1, NULL, NULL),
(9, 21, 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2022_01_25_013902_create_projects_table', 1),
(5, '2022_01_25_014008_create_purchase_orders_table', 1),
(6, '2022_01_25_014239_create_workflows_table', 1),
(7, '2022_01_25_014358_create_purchase_order_attrs_table', 1),
(8, '2022_01_25_014410_create_purchase_order_notes_table', 1),
(9, '2022_01_25_014745_create_roles_table', 1),
(10, '2022_01_25_015009_create_speeches_table', 1),
(11, '2022_01_25_015231_create_permissions_table', 1),
(12, '2022_01_25_015420_create_vacation_requests_table', 1),
(13, '2022_02_01_082004_create_subcontractors_table', 2),
(14, '2022_02_01_083153_create_subcontractor_attrs_table', 2),
(15, '2022_02_01_083505_create_subcontractor_files_table', 2),
(16, '2022_02_01_084325_user_subcontractor', 3),
(17, '2022_02_02_035919_create_rfqs_table', 4),
(18, '2022_02_02_041452_purchase_order__user', 5),
(19, '2022_02_02_041754_rfq__user', 5),
(20, '2022_02_03_020344_create_employees_table', 6),
(21, '2022_02_03_020438_employee__user', 6),
(22, '2022_02_03_032428_create_sites_table', 7),
(23, '2022_02_03_034932_site_user', 7),
(24, '2022_02_04_141012_create_petty_cashes_table', 8),
(25, '2022_02_04_144906_create_petty_attrs_table', 8),
(26, '2022_02_04_144942_petty_cash_user', 8),
(27, '2022_02_04_233027_create_matrial_requests_table', 9),
(28, '2022_02_04_233203_create_matrial_attrs_table', 9),
(29, '2022_02_04_233328_create_matrial_conditions_table', 9),
(30, '2022_02_04_233634_matrial_request_user', 9),
(31, '2022_02_10_014239_create_workflows_table', 10),
(32, '2022_02_10_014745_create_roles_table', 10),
(33, '2022_02_10_143443_create_flowwork_steps_table', 10),
(34, '2022_02_10_153249_create_matrial_request_cycles_table', 10),
(35, '2022_02_07_205327_create_notifications_table', 11),
(36, '2022_02_07_205537_create_attachment_matrial_cycles_table', 11),
(37, '2022_02_07_205850_create_comment_matrial_cycles_table', 11),
(38, '2022_02_08_064837_create_subcontractor_request_cycles_table', 12),
(39, '2022_02_08_064924_create_comment_subcontractor_cycles_table', 12),
(40, '2022_02_08_065032_create_attachment_subcontractor_cycles_table', 12),
(41, '2022_02_09_005648_create_petty_cash_cycles_table', 13),
(42, '2022_02_09_005722_create_comment_petty_cash_cycles_table', 13),
(43, '2022_02_09_005903_create_attachment_petty_cash_cycles_table', 13),
(44, '2022_02_09_023815_create_letter_cycles_table', 14),
(45, '2022_02_09_023943_create_comment_letter_cycles_table', 14),
(46, '2022_02_09_024054_create_attachment_letter_cycles_table', 14),
(47, '2022_02_09_025241_create_rfq_cycles_table', 14),
(48, '2022_02_09_025324_create_comment_rfq_cycles_table', 14),
(49, '2022_02_09_025402_create_attachment_rfq_cycles_table', 14),
(50, '2022_02_13_000158_create_purchase_order_cycles_table', 15),
(51, '2022_02_13_000256_create_comment_purchase_cycles_table', 15),
(52, '2022_02_13_001006_create_attachment_purchase_cycles_table', 15),
(53, '2022_02_13_000257_create_comment_purchase_cycles_table', 16),
(54, '2022_02_17_014454_create_purchase_order_attachments_table', 17),
(55, '2022_02_22_010621_create_site_cycles_table', 18),
(56, '2022_02_22_010800_create_comment_site_cycles_table', 18),
(57, '2022_02_22_010919_create_attachment_site_cycles_table', 18),
(58, '2022_02_22_015300_create_employee_cycles_table', 19),
(59, '2022_02_22_015415_create_comment_employee_cycles_table', 19),
(60, '2022_02_22_015508_create_attachment_employees_table', 19),
(61, '2022_03_27_205327_create_notifications_table', 20);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` int(255) DEFAULT NULL,
  `read` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id_to` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id_from` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `read`, `name`, `user_id_to`, `user_id_from`, `created_at`, `updated_at`) VALUES
(1, 4, 1, 'New purchase Request', 1, 4, '2022-03-22 10:46:32', '2022-03-22 10:46:32'),
(2, 4, 1, 'New purchase Request', 2, 4, '2022-03-22 10:46:32', '2022-03-22 10:46:32'),
(3, 4, 2, 'New purchase Request', 4, 4, '2022-03-22 10:46:32', '2022-03-22 12:15:56'),
(4, 4, 1, 'New purchase Request', 1, 4, '2022-03-24 10:10:07', '2022-03-24 10:10:07'),
(5, 4, 1, 'New purchase Request', 2, 4, '2022-03-24 10:10:07', '2022-03-24 10:10:07'),
(6, 4, 1, 'New purchase Request', 4, 4, '2022-03-24 10:10:07', '2022-03-24 10:10:07'),
(7, 4, 1, 'New purchase Request', 1, 4, '2022-03-24 10:16:52', '2022-03-24 10:16:52'),
(8, 4, 1, 'New purchase Request', 2, 4, '2022-03-24 10:16:52', '2022-03-24 10:16:52'),
(9, 4, 1, 'New purchase Request', 4, 4, '2022-03-24 10:16:52', '2022-03-24 10:16:52'),
(10, 4, 1, 'New purchase Request', 1, 4, '2022-03-25 15:17:18', '2022-03-25 15:17:18'),
(11, 4, 1, 'New purchase Request', 2, 4, '2022-03-25 15:17:18', '2022-03-25 15:17:18'),
(12, 4, 1, 'New purchase Request', 4, 4, '2022-03-25 15:17:18', '2022-03-25 15:17:18'),
(13, 4, 1, 'New purchase Request', 1, 4, '2022-03-27 11:40:36', '2022-03-27 11:40:36'),
(14, 4, 1, 'New purchase Request', 2, 4, '2022-03-27 11:40:36', '2022-03-27 11:40:36'),
(15, 4, 1, 'New purchase Request', 4, 4, '2022-03-27 11:40:36', '2022-03-27 11:40:36'),
(16, 4, 1, 'New purchase Request', 1, 6, '2022-03-30 21:47:46', '2022-03-30 21:47:46'),
(17, 4, 1, 'New purchase Request', 2, 6, '2022-03-30 21:47:46', '2022-03-30 21:47:46'),
(18, 4, 1, 'New purchase Request', 4, 6, '2022-03-30 21:47:46', '2022-03-30 21:47:46'),
(19, 4, 2, 'New purchase Request', 6, 6, '2022-03-30 21:47:46', '2022-03-30 21:54:09'),
(20, 4, 1, 'New purchase Request', 1, 4, '2022-04-04 09:47:10', '2022-04-04 09:47:10'),
(21, 4, 1, 'New purchase Request', 2, 4, '2022-04-04 09:47:10', '2022-04-04 09:47:10'),
(22, 4, 1, 'New purchase Request', 4, 4, '2022-04-04 09:47:10', '2022-04-04 09:47:10'),
(23, 4, 1, 'New purchase Request', 6, 4, '2022-04-04 09:47:10', '2022-04-04 09:47:10'),
(24, 4, 1, 'Yourref125has been approved ', 4, 4, '2022-04-06 08:56:07', '2022-04-06 08:56:07'),
(25, 4, 1, 'Your15has been approved ', 4, 4, '2022-04-06 09:03:08', '2022-04-06 09:03:08'),
(26, 4, 1, 'Your POPO-80has been approved ', 4, 4, '2022-04-06 09:09:56', '2022-04-06 09:09:56'),
(27, 4, 1, 'New purchase Request', 1, 4, '2022-04-06 23:38:06', '2022-04-06 23:38:06'),
(28, 4, 1, 'New purchase Request', 2, 4, '2022-04-06 23:38:06', '2022-04-06 23:38:06'),
(29, 4, 1, 'New purchase Request', 4, 4, '2022-04-06 23:38:06', '2022-04-06 23:38:06'),
(30, 4, 1, 'New purchase Request', 6, 4, '2022-04-06 23:38:06', '2022-04-06 23:38:06'),
(31, 4, 1, 'Your POPO-110has been approved ', 4, 4, '2022-04-06 23:49:21', '2022-04-06 23:49:21'),
(32, 4, 1, 'New purchase Request', 1, 4, '2022-04-07 08:18:46', '2022-04-07 08:18:46'),
(33, 4, 1, 'New purchase Request', 2, 4, '2022-04-07 08:18:46', '2022-04-07 08:18:46'),
(34, 4, 1, 'New purchase Request', 4, 4, '2022-04-07 08:18:46', '2022-04-07 08:18:46'),
(35, 4, 1, 'New purchase Request', 6, 4, '2022-04-07 08:18:46', '2022-04-07 08:18:46'),
(36, 4, 1, 'New purchase Request', 1, 6, '2022-04-07 16:05:45', '2022-04-07 16:05:45'),
(37, 4, 1, 'New purchase Request', 2, 6, '2022-04-07 16:05:45', '2022-04-07 16:05:45'),
(38, 4, 1, 'New purchase Request', 4, 6, '2022-04-07 16:05:45', '2022-04-07 16:05:45'),
(39, 4, 1, 'New purchase Request', 6, 6, '2022-04-07 16:05:45', '2022-04-07 16:05:45'),
(40, 4, 1, 'New purchase Request', 1, 4, '2022-04-07 16:42:36', '2022-04-07 16:42:36'),
(41, 4, 1, 'New purchase Request', 2, 4, '2022-04-07 16:42:36', '2022-04-07 16:42:36'),
(42, 4, 1, 'New purchase Request', 4, 4, '2022-04-07 16:42:36', '2022-04-07 16:42:36'),
(43, 4, 1, 'New purchase Request', 6, 4, '2022-04-07 16:42:36', '2022-04-07 16:42:36'),
(44, 4, 1, 'New purchase Request', 1, 6, '2022-04-07 17:04:43', '2022-04-07 17:04:43'),
(45, 4, 1, 'New purchase Request', 2, 6, '2022-04-07 17:04:43', '2022-04-07 17:04:43'),
(46, 4, 1, 'New purchase Request', 4, 6, '2022-04-07 17:04:43', '2022-04-07 17:04:43'),
(47, 4, 1, 'New purchase Request', 6, 6, '2022-04-07 17:04:43', '2022-04-07 17:04:43'),
(48, 4, 1, 'Your POPO-105has been approved ', 6, 6, '2022-04-07 17:09:06', '2022-04-07 17:09:06'),
(49, 4, 1, 'New purchase Request', 1, 6, '2022-04-07 17:14:36', '2022-04-07 17:14:36'),
(50, 4, 1, 'New purchase Request', 2, 6, '2022-04-07 17:14:36', '2022-04-07 17:14:36'),
(51, 4, 1, 'New purchase Request', 4, 6, '2022-04-07 17:14:36', '2022-04-07 17:14:36'),
(52, 4, 1, 'New purchase Request', 6, 6, '2022-04-07 17:14:36', '2022-04-07 17:14:36'),
(53, 4, 1, 'Your POPO-106has been approved ', 6, 6, '2022-04-07 17:15:11', '2022-04-07 17:15:11'),
(54, 4, 1, 'YourPO-105has been rejected by', 7, 7, '2022-04-07 17:35:55', '2022-04-07 17:35:55'),
(55, 4, 1, 'YourPO-110has been rejected by', 7, 7, '2022-04-07 17:39:24', '2022-04-07 17:39:24'),
(56, 4, 1, 'YourPO-106has been rejected by', 6, 7, '2022-04-07 17:43:07', '2022-04-07 17:43:07'),
(64, 4, 1, 'New purchase Request', 1, 4, '2022-04-10 07:31:13', '2022-04-10 07:31:13'),
(65, 4, 1, 'New purchase Request', 2, 4, '2022-04-10 07:31:13', '2022-04-10 07:31:13'),
(66, 4, 1, 'New purchase Request', 4, 4, '2022-04-10 07:31:13', '2022-04-10 07:31:13'),
(67, 4, 1, 'New purchase Request', 6, 4, '2022-04-10 07:31:13', '2022-04-10 07:31:13'),
(77, 4, 1, 'New purchase Request', 1, 4, '2022-04-10 07:45:58', '2022-04-10 07:45:58'),
(78, 4, 1, 'New purchase Request', 2, 4, '2022-04-10 07:45:59', '2022-04-10 07:45:59'),
(79, 4, 1, 'New purchase Request', 4, 4, '2022-04-10 07:46:00', '2022-04-10 07:46:00'),
(80, 4, 1, 'New purchase Request', 6, 4, '2022-04-10 07:46:01', '2022-04-10 07:46:01'),
(81, 6, 1, 'New RFQ Request', 3, 4, '2022-04-10 08:15:32', '2022-04-10 08:15:32'),
(82, 6, 1, 'New RFQ Request', 7, 4, '2022-04-10 08:15:33', '2022-04-10 08:15:33'),
(83, 1, 1, 'New Employee Request', 3, 4, '2022-04-10 08:16:11', '2022-04-10 08:16:11'),
(84, 1, 1, 'New Employee Request', 7, 4, '2022-04-10 08:16:12', '2022-04-10 08:16:12'),
(85, 2, 1, 'New Matrial Request', 1, 4, '2022-04-10 08:18:56', '2022-04-10 08:18:56'),
(86, 2, 1, 'New Matrial Request', 2, 4, '2022-04-10 08:18:56', '2022-04-10 08:18:56'),
(87, 2, 1, 'New Matrial Request', 4, 4, '2022-04-10 08:18:56', '2022-04-10 08:18:56'),
(88, 2, 1, 'New Matrial Request', 6, 4, '2022-04-10 08:18:56', '2022-04-10 08:18:56'),
(89, 4, 1, 'Your PO565has been approved ', 4, 4, '2022-04-10 08:19:25', '2022-04-10 08:19:25'),
(90, 4, 1, 'Your POPO-90has been approved ', 1, 4, '2022-04-10 08:20:53', '2022-04-10 08:20:53'),
(91, 4, 1, 'Your POPO-91has been approved ', 1, 4, '2022-05-08 05:47:02', '2022-05-08 05:47:02');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_terms`
--

CREATE TABLE `payment_terms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `dis` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_terms`
--

INSERT INTO `payment_terms` (`id`, `purchase_order_id`, `dis`, `created_at`, `updated_at`) VALUES
(4, 55, '545', NULL, NULL),
(5, 64, '656', NULL, NULL),
(6, 68, '465', NULL, NULL),
(10, 71, '50% With PO', NULL, NULL),
(11, 71, '50% After Delivery', NULL, NULL),
(12, 73, '50% With PO', NULL, NULL),
(13, 73, '50% Upon Delivery', NULL, NULL),
(14, 82, '50% With PO', NULL, NULL),
(15, 82, '50% After Delivery', NULL, NULL),
(16, 83, '50% with PO', NULL, NULL),
(17, 83, '50% After Delivery', NULL, NULL),
(18, 84, '50% Down payment', NULL, NULL),
(19, 84, '50% After Delivery', NULL, NULL),
(20, 85, '50% With PO', NULL, NULL),
(21, 85, '50% After Delivery', NULL, NULL),
(22, 86, '50% With PO', NULL, NULL),
(23, 86, '50% After Delivery', NULL, NULL),
(24, 87, '50% With Po', NULL, NULL),
(25, 87, '50% After Delivery', NULL, NULL),
(26, 88, '50% With Po', NULL, NULL),
(27, 88, '50% after Delivery', NULL, NULL),
(28, 89, '50% With PO', NULL, NULL),
(29, 89, '50% After Delivery', NULL, NULL),
(30, 106, '50% With PO', NULL, NULL),
(31, 106, '50% After Payment', NULL, NULL),
(32, 108, '100% With PO', NULL, NULL),
(33, 110, '50% With PO', NULL, NULL),
(34, 110, '50% After Delivery', NULL, NULL),
(35, 114, '50% With PO', NULL, NULL),
(36, 114, '50% After Delivery', NULL, NULL),
(37, 116, '50% Down Payment', NULL, NULL),
(38, 116, '50% After Delivery', NULL, NULL),
(39, 118, '50% With PO', NULL, NULL),
(40, 118, '50% After Delivery', NULL, NULL),
(41, 119, '50% With PO ', NULL, NULL),
(42, 119, '50% After Delivery', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `petty_attrs`
--

CREATE TABLE `petty_attrs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` double(8,2) DEFAULT NULL,
  `unit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_price` double(8,2) DEFAULT NULL,
  `total` double(8,2) DEFAULT NULL,
  `petty_cash_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `petty_attrs`
--

INSERT INTO `petty_attrs` (`id`, `name`, `qty`, `unit`, `unit_price`, `total`, `petty_cash_id`, `created_at`, `updated_at`) VALUES
(1, '545', 55.00, '55', 55.00, 3025.00, 3, NULL, NULL),
(5, '554', 45.00, '45', 45.00, 2025.00, 7, NULL, NULL),
(8, '454', 45.00, '54', 45.00, 2025.00, 10, NULL, NULL),
(9, '454', 45.00, '45', 45.00, 2025.00, 11, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `petty_cashes`
--

CREATE TABLE `petty_cashes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quotation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `project_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `total` double(8,2) DEFAULT NULL,
  `vat` double(8,2) DEFAULT NULL,
  `date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `material_avalibility` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transportation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `to` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `petty_cashes`
--

INSERT INTO `petty_cashes` (`id`, `quotation`, `project_id`, `user_id`, `status`, `total`, `vat`, `date`, `subject`, `material_avalibility`, `transportation`, `delivery_date`, `cc`, `ref`, `to`, `content`, `created_at`, `updated_at`) VALUES
(10, NULL, 1, 4, 0, 2025.00, 303.75, '2022-03-08', '65', NULL, NULL, NULL, NULL, NULL, '45', NULL, '2022-03-18 18:32:28', '2022-03-18 18:32:28'),
(11, NULL, 2, 4, 0, 2025.00, 303.75, '2022-04-05', '45', NULL, NULL, NULL, NULL, NULL, '45', NULL, '2022-04-10 08:18:17', '2022-04-10 08:18:17');

-- --------------------------------------------------------

--
-- Table structure for table `petty_cash_cycles`
--

CREATE TABLE `petty_cash_cycles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `petty_cash_id` bigint(20) UNSIGNED DEFAULT NULL,
  `step` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `flowwork_step_id` bigint(20) UNSIGNED DEFAULT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `petty_cash_cycles`
--

INSERT INTO `petty_cash_cycles` (`id`, `petty_cash_id`, `step`, `status`, `flowwork_step_id`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 7, 1, 1, 24, 44, NULL, '2022-02-09 00:26:48'),
(2, 7, 2, 0, 25, 42, NULL, NULL),
(3, 10, 1, 0, 37, 57, NULL, NULL),
(4, 11, 1, 0, 37, 57, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `petty_cash_user`
--

CREATE TABLE `petty_cash_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `petty_cash_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `petty_cash_user`
--

INSERT INTO `petty_cash_user` (`id`, `petty_cash_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 3, 1, NULL, NULL),
(5, 7, 1, NULL, NULL),
(6, 10, 3, NULL, NULL),
(7, 11, 4, NULL, NULL),
(8, 11, 6, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `name`, `created_at`, `updated_at`) VALUES
(2, 'KAFD', NULL, '2022-03-12 19:01:43'),
(3, 'WADI SEFAR', NULL, NULL),
(4, '69', '2022-03-23 08:04:21', '2022-03-23 08:04:21');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_orders`
--

CREATE TABLE `purchase_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quotation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `project_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `total` double(8,2) DEFAULT NULL,
  `vat` double(8,2) DEFAULT NULL,
  `date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `material_avalibility` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transportation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `to` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_for` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_orders`
--

INSERT INTO `purchase_orders` (`id`, `quotation`, `project_id`, `user_id`, `status`, `total`, `vat`, `date`, `subject`, `material_avalibility`, `transportation`, `delivery_date`, `cc`, `ref`, `to`, `order_for`, `created_at`, `updated_at`) VALUES
(34, '5', 1, 1, 0, 632.50, 82.50, '2022-01-19', '5', '5', '5', '2022-01-19', '5', '55', '55', '5', '2022-01-31 07:18:17', '2022-01-31 07:18:17'),
(55, '5656', 1, 4, 2, 28255.50, 3685.50, '2022-02-14', '656', '6565', '465', '2022-02-14', NULL, '6565', '665', '4655655', '2022-02-12 23:01:31', '2022-03-19 12:34:57'),
(64, NULL, 1, 1, 0, 3542.00, 462.00, '2022-02-14', '5656', '595', '454', '2022-02-15', NULL, '9898', '554', '565655', '2022-02-17 00:46:51', '2022-02-17 00:46:51'),
(67, NULL, 1, 1, 0, 2328.75, 303.75, '2022-02-14', 'test', '565', 'test', '2022-02-15', NULL, 'test', 'test', NULL, '2022-02-18 10:29:42', '2022-02-18 10:43:26'),
(68, NULL, 1, 1, NULL, 2328.75, 303.75, '2022-02-16', 'test', '5', '56', '2022-02-08', NULL, 'test', 'test', NULL, '2022-02-26 13:08:52', '2022-02-26 13:08:52'),
(69, NULL, 1, 4, 2, 2328.75, 303.75, '2022-02-14', 'test', '5', '5', '2022-02-28', NULL, 'test', 'test', NULL, '2022-02-26 13:13:59', '2022-03-19 12:16:48'),
(71, NULL, 1, 4, 2, 5750.00, 750.00, '2022-03-06', 'AIR OUTLET', 'Ex-Stock', 'Not included', '2022-03-07', NULL, 'KAFD51', 'GCC', NULL, '2022-03-06 06:46:57', '2022-03-19 12:35:15'),
(73, NULL, 2, 4, 2, 1.15, 0.15, '2022-03-06', 'VALVES', 'Ex-stock', 'Excluded', '2022-03-08', NULL, 'KAFD/51', 'MECH', 'Reference to your Quotation no.xxx find below ..............', '2022-03-06 17:02:28', '2022-03-25 14:53:32'),
(75, NULL, 1, 4, 0, 2328.75, 303.75, '2022-03-08', 'fgh', '656', '656', '2022-03-17', NULL, 'te', 'df', '555', '2022-03-06 17:33:54', '2022-03-19 13:46:55'),
(81, NULL, 2, 4, 0, 2328.75, 303.75, '2022-03-15', '54', '45', '46', '2022-03-15', NULL, '15', '54', '455', '2022-03-07 01:01:07', '2022-04-06 09:03:07'),
(82, NULL, 2, 1, 0, 862.50, 112.50, '2022-03-08', 'VALVES', 'Ex-Stock', 'Included', '2022-03-09', NULL, 'PO-31', 'Raya', 'Dear Sir, \r\n\r\nReference to your quotation no. xxxx , kdsjfdfljkfml;fdafl;,......................\r\nyufegc hjkdhsf   hdjkjhf jkh  hbdsjkf\r\ndvhfbaFkl   nlkdanfkF KLDFLKL', '2022-03-07 04:25:41', '2022-03-07 04:25:41'),
(83, NULL, 2, 4, 0, 2875.00, 375.00, '2022-03-07', 'VALVES', 'Ex- Stock', 'Included', '2022-03-09', NULL, 'PO-80', 'IMCO', 'Reference to your Quotation No. 121 , we are pleased to place our PO mnvxcjhv \r\n\r\nsfdhhjksdhgds\r\n\r\n dfsjkfsdg', '2022-03-07 15:05:04', '2022-04-06 09:09:55'),
(84, NULL, 2, 1, 0, 7877.50, 1027.50, '2022-03-09', 'Valves', 'Ex-Stock', 'Included', '2022-03-12', NULL, 'PO-83', 'IMCO', 'Reference to your quotation no .21542  , we are pleased to place our PO NSVKDhjadf \r\n\r\ndgjhfvsdj bkjbnvlknsdvnv  vnkfvl;', '2022-03-08 16:13:14', '2022-03-08 16:13:14'),
(85, NULL, 2, 1, 0, 1725.00, 225.00, '2022-03-09', 'Valves', 'Ex- Stock', 'Included', '2022-03-10', NULL, 'PO-90', 'IMCO', 'In reference to the above subject project, kindly find enclosed herewith our quotation for your kind review and consideration.\r\nWe would like to express our deepest gratitude for the kind opportunity extended to Quwa Al-Tameer Co to submit a bid for the MEP works needed for your interesting project.\r\nWe look forward to have a very successful, positive and transparent relationship with your esteemed firm.\r\nOur bid package is made of two annexures; Annexure I which provides the basis of estimate in developing our bid, and Annexure II which includes the MEP Bid Price Schedules.\r\nWe hope that you will find our bid both responsive and responsible.', '2022-03-09 08:26:41', '2022-03-09 08:26:41'),
(86, NULL, 2, 1, 0, 2875.00, 375.00, '2022-03-10', 'Valves', 'Ex-Stock', 'Included', '2022-03-10', NULL, 'PO-91', 'IMCO', 'In reference to the above subject project, kindly find enclosed herewith our quotation for your kind review and consideration.', '2022-03-09 08:29:29', '2022-03-09 08:29:29'),
(87, NULL, 2, 1, 0, 2875.00, 375.00, '2022-03-09', 'valves', 'Ex-Stock', 'Included', '2022-03-10', NULL, 'PO-92', 'IMCO', 'In reference to the above subject project, kindly find enclosed herewith our PO for your kind review and consideration.', '2022-03-09 08:51:14', '2022-03-09 08:51:14'),
(88, NULL, 2, 1, 0, 6536.60, 852.60, '2022-03-10', 'Valves', 'Ex-Stock', 'Included', '2022-03-12', NULL, 'PO-83', 'Ali Market', 'Reference to your Quotation no. 45454 , we are pleased to place our PO', '2022-03-10 19:07:02', '2022-03-10 19:07:02'),
(89, NULL, 3, 1, 0, 8625.00, 1125.00, '2022-03-12', 'VALVES', 'Ex-Stock', 'Included', '2022-03-13', NULL, 'PO-90', 'MSL', 'Reference to your Quotation no.4545 , we are pleased to placed our order', '2022-03-12 19:15:10', '2022-03-12 19:15:10'),
(90, NULL, 3, 4, 0, 3542.00, 462.00, '2022-03-22', '55', '656', '6565', '2022-03-14', NULL, 'n', '6565', 'wuth reference to the above subject your quotation no 5656(rev.0) Dated on 555, we would like to place the purchase order for Below Items.', '2022-03-18 19:08:08', '2022-03-18 19:08:08'),
(105, NULL, 3, 4, 0, 25088.40, 3272.40, '2022-03-02', '545', '4', '54', '2022-03-08', NULL, '4554', '545', 'wuth reference to the above subject your quotation no xxxxxx (rev.0) Dated on XXXXX , we would like to place the purchase order for Below Items.', '2022-03-22 10:46:32', '2022-03-22 10:46:32'),
(106, NULL, 2, 4, 2, 57528.75, 7503.75, '2022-03-26', 'VALVES', 'Ex-Stock', 'Included', '2022-03-26', NULL, 'PO-97', 'RAYA', 'wuth reference to the above subject your quotation no xxxxxx (rev.0) Dated on XXXXX , we would like to place the purchase order for Below Items.', '2022-03-24 10:10:07', '2022-03-25 14:55:35'),
(107, NULL, 2, 4, 0, 367758.50, 47968.50, '2022-03-14', '6565', '656', '656', '2022-03-15', NULL, '6556', '6565', 'wuth reference to the above subject your quotation no xxxxxx (rev.0) Dated on XXXXX , we would like to place the purchase order for Below Items.', '2022-03-24 10:16:52', '2022-03-24 10:16:52'),
(108, NULL, 3, 4, 0, 14605.00, 1905.00, '2022-03-25', 'MANHOLE', 'Ex-Stock', 'Included', '2022-03-26', NULL, 'PO-100', 'RAYA', 'with reference to the above subject your quotation no xxxxxx (rev.0) Dated on XXXXX , we would like to place the purchase order for Below Items.', '2022-03-25 15:17:18', '2022-03-25 15:17:18'),
(109, NULL, 3, 4, 0, 8704.35, 1135.35, '2022-03-15', '54', '787', '8787', '2022-03-15', NULL, '54', '54', 'wuth reference to the above subject your887 quotation no xxxxxx (rev.0) Dated on XXXXX , we would like to place the purchase order for Below Items.', '2022-03-27 11:40:36', '2022-03-27 11:40:36'),
(110, NULL, 2, 4, 2, 9200.00, 1200.00, '2022-04-01', 'MANHOLE', 'Ex-Stock', 'Included', '2022-04-02', NULL, 'PO-101', 'WSP', 'wuth reference to the above subject your quotation no xxxxxx (rev.0) Dated on XXXXX , we would like to place the purchase order for Below Items.', '2022-03-30 21:47:46', '2022-04-03 20:44:20'),
(113, NULL, 2, 4, 0, 2328.75, 303.75, '2022-04-12', '4545', '45', '54', '2022-04-19', NULL, 'ref125', '54', 'with reference to the above subject your quotation no xxxxxx (rev.0) Dated on XXXXX , we would like to place the purchase order for Below Items.', '2022-04-04 09:47:10', '2022-04-06 08:56:05'),
(114, NULL, 2, 7, 2, 48875.00, 6375.00, '2022-04-07', 'Mobile', 'Ex-Stock', 'Included', '2022-04-09', NULL, 'PO-110', 'Raya', 'with reference to the above subject your quotation no xxxxxx (rev.0) Dated on XXXXX , we would like to place the purchase order for Below Items.', '2022-04-06 23:38:06', '2022-04-07 17:39:24'),
(115, NULL, 2, 4, 0, 4186.00, 546.00, '2022-04-06', '655', '65', '655', '2022-04-19', NULL, 'gh', '55', 'with reference to the above subject your quotation no xxxxxx (rev.0) Dated on XXXXX , we would like to place the purchase order for Below Items.', '2022-04-07 08:18:44', '2022-04-07 08:18:44'),
(116, NULL, 2, 6, 0, 4025.00, 525.00, '2022-04-07', 'LAPTOP', 'Ex-Stock', 'Excluded', '2022-04-08', NULL, 'PO-102', 'APPLE', 'with reference to the above subject your quotation no xxxxxx (rev.0) Dated on XXXXX , we would like to place the purchase order for Below Items.', '2022-04-07 16:05:45', '2022-04-07 16:05:45'),
(117, NULL, 2, 4, 0, 4186.00, 546.00, '2022-04-12', 'dg', '45', '545', '2022-04-11', NULL, 'tt', '254', 'with reference to the above subject your quotation no xxxxxx (rev.0) Dated on XXXXX , we would like to place the purchase order for Below Items.', '2022-04-07 16:42:33', '2022-04-07 16:42:33'),
(118, NULL, 2, 7, 2, 43125.00, 5625.00, '2022-04-08', 'IPHONE', 'Ex-Stock', 'Included', '2022-04-09', NULL, 'PO-105', 'WSP', 'with reference to the above subject your quotation no xxxxxx (rev.0) Dated on XXXXX , we would like to place the purchase order for Below Items.', '2022-04-07 17:04:43', '2022-04-07 17:35:55'),
(119, NULL, 2, 6, 2, 11500.00, 1500.00, '2022-04-08', 'CAR', 'Stock', 'Included', '2022-04-09', NULL, 'PO-106', 'WSP', 'with reference to the above subject your quotation no xxxxxx (rev.0) Dated on XXXXX , we would like to place the purchase order for Below Items.', '2022-04-07 17:14:36', '2022-04-07 17:43:07'),
(128, NULL, 3, 4, 0, 316.25, 41.25, '2022-04-05', '65', '56', '65', '2022-04-13', NULL, 'cg', '65', 'with reference to the above subject your quotation no xxxxxx (rev.0) Dated on XXXXX , we would like to place the purchase order for Below Items.', '2022-04-10 07:31:12', '2022-04-10 07:31:12'),
(138, NULL, 3, 4, 0, 42246.40, 5510.40, '2022-04-11', '56', '55', '65', '2022-04-19', NULL, '565', '565', 'with reference to the above subject your quotation no xxxxxx (rev.0) Dated on XXXXX , we would like to place the purchase order for Below Items.', '2022-04-10 07:45:57', '2022-04-10 07:45:57');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order_attachments`
--

CREATE TABLE `purchase_order_attachments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_id` bigint(20) UNSIGNED DEFAULT NULL,
  `path` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_order_attachments`
--

INSERT INTO `purchase_order_attachments` (`id`, `purchase_id`, `path`, `created_at`, `updated_at`) VALUES
(1, 64, 'purchase_order__code_641390345', NULL, NULL),
(4, 67, 'purchase_order__code_673614897', NULL, NULL),
(5, 68, 'purchase_order__code_689688868', NULL, NULL),
(6, 70, 'purchase_order__code_7010397', NULL, NULL),
(7, 71, 'purchase_order__code_712153816', NULL, NULL),
(9, 73, 'purchase_order__code_731888407', NULL, NULL),
(14, 81, 'purchase_order__code_811971221', NULL, NULL),
(15, 82, 'purchase_order__code_828599581', NULL, NULL),
(16, 84, 'purchase_order__code_848346024', NULL, NULL),
(17, 85, 'purchase_order__code_855222769', NULL, NULL),
(18, 86, 'purchase_order__code_866440984', NULL, NULL),
(19, 87, 'purchase_order__code_877880721', NULL, NULL),
(20, 88, 'purchase_order__code_883566013', NULL, NULL),
(21, 90, 'purchase_order__code_902137538', NULL, NULL),
(35, 105, 'purchase_order__code_1052064487', NULL, NULL),
(36, 107, 'purchase_order__code_1073871664', NULL, NULL),
(37, 109, 'purchase_order__code_1095105073', NULL, NULL),
(38, 110, 'purchase_order__code_110223177', NULL, NULL),
(39, 116, 'xlsx', NULL, NULL),
(40, 116, 'xlsx', NULL, NULL),
(41, 118, 'xlsx', NULL, NULL),
(42, 118, 'xlsx', NULL, NULL),
(43, 118, 'xlsx', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order_attrs`
--

CREATE TABLE `purchase_order_attrs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` double(8,2) DEFAULT NULL,
  `unit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_price` double(8,2) DEFAULT NULL,
  `total` double(8,2) DEFAULT NULL,
  `purchase_order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_order_attrs`
--

INSERT INTO `purchase_order_attrs` (`id`, `name`, `qty`, `unit`, `unit_price`, `total`, `purchase_order_id`, `created_at`, `updated_at`) VALUES
(5, '556', 10.00, '55', 55.00, 550.00, 34, NULL, NULL),
(13, '54554', 455.00, '45', 54.00, 24570.00, 55, NULL, NULL),
(14, '65656', 56.00, '45', 55.00, 3080.00, 64, NULL, NULL),
(17, 'test', 45.00, '45', 45.00, 2025.00, 67, NULL, NULL),
(18, '45', 45.00, '45', 45.00, 2025.00, 68, NULL, NULL),
(19, 'test', 45.00, '45', 45.00, 2025.00, 69, NULL, NULL),
(21, 'AIR OUTLET', 1.00, 'NO', 5000.00, 5000.00, 71, NULL, NULL),
(22, '01', 1.00, 'valves', 1.00, 1.00, 73, NULL, NULL),
(24, '65', 45.00, '45', 45.00, 2025.00, 75, NULL, NULL),
(30, '45', 45.00, '45', 45.00, 2025.00, 81, NULL, NULL),
(31, 'Valves', 1.00, 'no', 750.00, 750.00, 82, NULL, NULL),
(32, 'valves', 1.00, 'no', 2500.00, 2500.00, 83, NULL, NULL),
(33, 'Valves', 1.00, 'no', 6850.00, 6850.00, 84, NULL, NULL),
(34, 'Valves', 1.00, 'no', 1500.00, 1500.00, 85, NULL, NULL),
(35, 'Valves', 1.00, 'no', 2500.00, 2500.00, 86, NULL, NULL),
(36, 'Valves', 1.00, 'no', 2500.00, 2500.00, 87, NULL, NULL),
(37, 'Valves', 1.00, 'no', 5684.00, 5684.00, 88, NULL, NULL),
(38, 'Valves', 1.00, 'no', 7500.00, 7500.00, 89, NULL, NULL),
(39, '656', 56.00, '65', 55.00, 3080.00, 90, NULL, NULL),
(53, '5454', 5454.00, '5454', 4.00, 21816.00, 105, NULL, NULL),
(54, 'VALVES', 1.00, 'NO', 50025.00, 50025.00, 106, NULL, NULL),
(55, '656', 565.00, '565', 566.00, 319790.00, 107, NULL, NULL),
(56, 'MANHOLE', 5.00, 'NO', 2540.00, 12700.00, 108, NULL, NULL),
(57, '8787', 87.00, '878', 87.00, 7569.00, 109, NULL, NULL),
(58, 'MANHOLE', 1.00, 'NO', 6000.00, 6000.00, 110, NULL, NULL),
(59, 'COVER', 1.00, 'NO', 2000.00, 2000.00, 110, NULL, NULL),
(62, '45', 45.00, '45', 45.00, 2025.00, 113, NULL, NULL),
(63, 'Mobile', 17.00, 'no', 2500.00, 42500.00, 114, NULL, NULL),
(64, 'fg', 65.00, '56', 56.00, 3640.00, 115, NULL, NULL),
(65, 'LAPTOP', 1.00, 'No', 3500.00, 3500.00, 116, NULL, NULL),
(66, 'cgh', 56.00, '55', 65.00, 3640.00, 117, NULL, NULL),
(67, 'IPHONE', 25.00, 'NO', 1500.00, 37500.00, 118, NULL, NULL),
(68, 'CAR', 2.00, 'NO', 5000.00, 10000.00, 119, NULL, NULL),
(77, '56', 55.00, '65', 5.00, 275.00, 128, NULL, NULL),
(87, '65', 656.00, '65', 56.00, 36736.00, 138, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order_cycles`
--

CREATE TABLE `purchase_order_cycles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `step` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `flowwork_step_id` bigint(20) UNSIGNED DEFAULT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_order_cycles`
--

INSERT INTO `purchase_order_cycles` (`id`, `purchase_order_id`, `step`, `status`, `flowwork_step_id`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 55, 1, 1, 39, 50, NULL, '2022-02-16 23:43:13'),
(130, 55, 2, 2, 40, 58, NULL, '2022-03-19 12:34:57'),
(131, 64, 1, 1, 39, 50, NULL, '2022-02-17 04:13:54'),
(132, 64, 2, 0, 40, 58, NULL, NULL),
(133, 67, 1, 1, 39, 50, NULL, '2022-02-18 10:43:26'),
(140, 67, 2, 0, 40, 58, NULL, NULL),
(141, 68, 1, 1, 39, 50, NULL, '2022-02-26 13:22:16'),
(142, 69, 1, 2, 39, 50, NULL, '2022-03-19 12:16:48'),
(145, 68, 2, 0, 40, 58, NULL, NULL),
(146, 70, 1, 0, 39, 50, NULL, NULL),
(147, 71, 1, 2, 39, 50, NULL, '2022-03-19 12:35:15'),
(148, 73, 1, 2, 39, 50, NULL, '2022-03-25 14:53:32'),
(149, 75, 1, 1, 39, 50, NULL, '2022-03-19 13:46:56'),
(150, 81, 1, 1, 39, 50, NULL, '2022-04-06 09:03:07'),
(151, 82, 1, 0, 39, 50, NULL, NULL),
(152, 83, 1, 1, 39, 50, NULL, '2022-04-06 09:09:55'),
(153, 84, 1, 0, 39, 50, NULL, NULL),
(154, 85, 1, 1, 39, 50, NULL, '2022-04-10 08:20:52'),
(155, 86, 1, 1, 39, 50, NULL, '2022-05-08 05:47:00'),
(156, 87, 1, 0, 39, 50, NULL, NULL),
(157, 88, 1, 0, 39, 50, NULL, NULL),
(158, 89, 1, 0, 39, 50, NULL, NULL),
(159, 90, 1, 0, 39, 50, NULL, NULL),
(160, 75, 2, 0, 40, 58, NULL, NULL),
(161, 105, 1, 0, 39, 50, NULL, NULL),
(162, 106, 1, 2, 39, 50, NULL, '2022-03-25 14:55:35'),
(163, 107, 1, 0, 39, 50, NULL, NULL),
(164, 108, 1, 0, 39, 50, NULL, NULL),
(165, 109, 1, 0, 39, 50, NULL, NULL),
(166, 110, 1, 2, 39, 50, NULL, '2022-03-30 22:03:07'),
(167, 113, 1, 1, 39, 50, NULL, '2022-04-06 08:56:05'),
(168, 113, 2, 0, 40, 58, NULL, NULL),
(169, 81, 2, 0, 40, 58, NULL, NULL),
(170, 83, 2, 0, 40, 58, NULL, NULL),
(171, 114, 1, 1, 39, 50, NULL, '2022-04-06 23:49:20'),
(172, 114, 2, 2, 40, 58, NULL, '2022-04-07 17:39:23'),
(173, 115, 1, 0, 39, 50, NULL, NULL),
(174, 116, 1, 0, 39, 50, NULL, NULL),
(175, 117, 1, 0, 39, 50, NULL, NULL),
(176, 118, 1, 1, 39, 50, NULL, '2022-04-07 17:09:05'),
(177, 118, 2, 2, 40, 58, NULL, '2022-04-07 17:35:54'),
(178, 119, 1, 1, 39, 50, NULL, '2022-04-07 17:15:10'),
(179, 119, 2, 2, 40, 58, NULL, '2022-04-07 17:43:06'),
(180, 128, 1, 0, 39, 50, NULL, NULL),
(181, 138, 1, 1, 39, 50, NULL, '2022-04-10 08:19:23'),
(182, 138, 2, 0, 40, 57, NULL, NULL),
(183, 85, 2, 0, 40, 57, NULL, NULL),
(184, 86, 2, 0, 40, 57, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order_user`
--

CREATE TABLE `purchase_order_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `Purchase_order_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_order_user`
--

INSERT INTO `purchase_order_user` (`id`, `user_id`, `Purchase_order_id`) VALUES
(4, 1, 55),
(5, 1, 64),
(8, 1, 67),
(9, 1, 68),
(10, 1, 69),
(11, 1, 81),
(12, 3, 84),
(15, 6, 115),
(16, 4, 115),
(17, 6, 117),
(18, 4, 117),
(20, 4, 128),
(30, 6, 138);

-- --------------------------------------------------------

--
-- Table structure for table `rfqs`
--

CREATE TABLE `rfqs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `ref` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `to` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rfqs`
--

INSERT INTO `rfqs` (`id`, `project_id`, `user_id`, `status`, `date`, `subject`, `content`, `created_at`, `updated_at`, `ref`, `to`) VALUES
(5, 1, 1, 0, '2022-02-06', '545', '5454', '2022-02-09 01:22:39', '2022-02-09 01:22:39', '5656', '565'),
(9, 2, 4, 0, '2022-03-14', '56', '455', '2022-03-18 22:03:47', '2022-03-18 22:03:47', '65', '45'),
(10, 3, 4, 0, '2022-04-19', '65', '6565', '2022-04-10 08:15:31', '2022-04-10 08:15:31', '655', '45');

-- --------------------------------------------------------

--
-- Table structure for table `rfq_cycles`
--

CREATE TABLE `rfq_cycles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `rfq_id` bigint(20) UNSIGNED DEFAULT NULL,
  `step` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `flowwork_step_id` bigint(20) UNSIGNED DEFAULT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rfq_cycles`
--

INSERT INTO `rfq_cycles` (`id`, `rfq_id`, `step`, `status`, `flowwork_step_id`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 8, 1, 1, 23, 45, NULL, '2022-02-09 01:41:43'),
(2, 9, 1, 0, 36, 58, NULL, NULL),
(3, 10, 1, 0, 36, 58, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `rfq_user`
--

CREATE TABLE `rfq_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `rfq_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rfq_user`
--

INSERT INTO `rfq_user` (`id`, `user_id`, `rfq_id`) VALUES
(1, 1, 3),
(2, 1, 4),
(3, 1, 5),
(6, 1, 8),
(7, 3, 10);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(50, 'Procurement Manger', '2022-02-12 22:01:27', '2022-02-12 22:01:27'),
(51, 'Mechanical Section Head Manger', '2022-02-12 22:01:27', '2022-02-12 22:01:27'),
(52, 'Electrical Section Head Manger', '2022-02-12 22:01:27', '2022-02-12 22:01:27'),
(53, 'MEP Manger', '2022-02-12 22:01:27', '2022-02-12 22:01:27'),
(54, 'HR Manger', '2022-02-12 22:01:27', '2022-02-12 22:01:27'),
(55, 'General Manager', '2022-02-12 22:01:27', '2022-02-12 22:01:27'),
(56, 'Executive Manger', '2022-02-12 22:01:27', '2022-02-12 22:01:27'),
(57, 'Projects Director', '2022-02-12 22:01:27', '2022-02-12 22:01:27'),
(58, 'Projects Manger', '2022-02-12 22:01:27', '2022-02-12 22:01:27'),
(59, 'Business Development Manger', '2022-02-12 22:01:27', '2022-02-12 22:01:27'),
(60, 'Technical Manger', '2022-02-12 22:01:27', '2022-02-12 22:01:27'),
(61, 'Document Controller', '2022-02-12 22:01:27', '2022-02-12 22:01:27'),
(62, 'Financial manager', '2022-02-12 22:01:27', '2022-02-12 22:01:27');

-- --------------------------------------------------------

--
-- Table structure for table `sites`
--

CREATE TABLE `sites` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `ref` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `to` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sites`
--

INSERT INTO `sites` (`id`, `project_id`, `user_id`, `status`, `ref`, `date`, `subject`, `content`, `created_at`, `updated_at`, `to`) VALUES
(5, 3, 4, 0, 'df', '2022-03-16', 'dfd', NULL, '2022-03-18 19:29:56', '2022-03-18 19:29:56', 'xv'),
(8, 4, 4, 0, '65', '2022-04-13', '654', 'With reference to the above subject,', '2022-04-10 08:17:32', '2022-04-10 08:17:32', '45');

-- --------------------------------------------------------

--
-- Table structure for table `site_cycles`
--

CREATE TABLE `site_cycles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `site_id` bigint(20) UNSIGNED DEFAULT NULL,
  `step` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `flowwork_step_id` bigint(20) UNSIGNED DEFAULT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `site_cycles`
--

INSERT INTO `site_cycles` (`id`, `site_id`, `step`, `status`, `flowwork_step_id`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 4, 1, 1, 32, 57, NULL, '2022-02-21 23:45:50'),
(4, 4, 2, 0, 33, 55, NULL, NULL),
(5, 5, 1, 0, 32, 57, NULL, NULL),
(8, 8, 1, 0, 32, 57, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `site_user`
--

CREATE TABLE `site_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `site_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `site_user`
--

INSERT INTO `site_user` (`id`, `site_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 4, 1, NULL, NULL),
(2, 8, 4, NULL, NULL),
(3, 8, 6, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `speeches`
--

CREATE TABLE `speeches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subcontractors`
--

CREATE TABLE `subcontractors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `total` double(8,2) DEFAULT NULL,
  `vat` double(8,2) DEFAULT NULL,
  `date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `to` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contract_no` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `ref` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subcontractors`
--

INSERT INTO `subcontractors` (`id`, `project_id`, `user_id`, `status`, `total`, `vat`, `date`, `subject`, `to`, `contract_no`, `created_at`, `updated_at`, `ref`) VALUES
(2, 1, 1, 0, 3025.00, 453.75, '2022-02-07', '55', '5665', NULL, '2022-02-01 09:27:15', '2022-02-01 09:27:15', NULL),
(3, 1, 1, 0, NULL, NULL, '2022-02-07', '555', '656', NULL, '2022-02-02 00:27:17', '2022-02-02 00:27:17', NULL),
(6, 1, 1, 0, NULL, NULL, '2022-02-08', '55', '6565', NULL, '2022-02-08 21:41:14', '2022-02-08 22:07:01', NULL),
(8, 1, 1, 0, 2025.00, 303.75, '2022-02-15', '5454', '98', NULL, '2022-02-08 22:23:30', '2022-02-08 22:23:30', NULL),
(10, 1, 1, 0, 2025.00, 303.75, '2022-02-15', '45', NULL, NULL, '2022-02-26 13:18:14', '2022-02-26 13:18:14', NULL),
(11, 2, 4, 0, 3080.00, 462.00, '2022-03-16', '6565', '5665', NULL, '2022-03-18 19:40:13', '2022-03-18 19:40:13', NULL),
(17, 3, 4, 0, 176.00, 26.40, '2022-04-12', '65', NULL, NULL, '2022-04-10 08:14:53', '2022-04-10 08:14:53', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subcontractor_attrs`
--

CREATE TABLE `subcontractor_attrs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` double(8,2) DEFAULT NULL,
  `unit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_price` double(8,2) DEFAULT NULL,
  `total` double(8,2) DEFAULT NULL,
  `subcontractor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subcontractor_attrs`
--

INSERT INTO `subcontractor_attrs` (`id`, `name`, `qty`, `unit`, `unit_price`, `total`, `subcontractor_id`, `created_at`, `updated_at`) VALUES
(1, '555', 55.00, '555', 55.00, 3025.00, 2, NULL, NULL),
(2, '656', 55.00, '55', 55.00, 3025.00, 3, NULL, NULL),
(5, '45', 45.00, '45', 45.00, 2025.00, 6, NULL, NULL),
(7, '4848', 45.00, '45', 45.00, 2025.00, 8, NULL, NULL),
(8, '45', 45.00, '45', 45.00, 2025.00, 10, NULL, NULL),
(9, '56', 56.00, '656', 55.00, 3080.00, 11, NULL, NULL),
(14, '656', 44.00, '4', 4.00, 176.00, 17, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subcontractor_files`
--

CREATE TABLE `subcontractor_files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subcontractor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subcontractor_request_cycles`
--

CREATE TABLE `subcontractor_request_cycles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subcontractor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `step` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `flowwork_step_id` bigint(20) UNSIGNED DEFAULT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subcontractor_request_cycles`
--

INSERT INTO `subcontractor_request_cycles` (`id`, `subcontractor_id`, `step`, `status`, `flowwork_step_id`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 6, 1, 1, 16, 44, NULL, '2022-02-08 22:16:34'),
(3, 6, 2, 0, 17, 42, NULL, NULL),
(4, 8, 1, 0, 16, 44, NULL, NULL),
(5, 10, 1, 0, 29, 57, NULL, NULL),
(6, 11, 1, 0, 29, 57, NULL, NULL),
(7, 17, 1, 0, 29, 57, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subcontractor_user`
--

CREATE TABLE `subcontractor_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `subcontractor_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subcontractor_user`
--

INSERT INTO `subcontractor_user` (`id`, `user_id`, `subcontractor_id`) VALUES
(1, 1, 3),
(4, 1, 6),
(5, 1, 10),
(6, 4, 11),
(7, 4, 17);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sign` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin` int(11) DEFAULT 0,
  `manager` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `role_id`, `sign`, `admin`, `manager`) VALUES
(1, 'Procurement Manger', 'ghthfzg@yahoo.com', NULL, '$2y$10$Xw2hNEw4WIfpr3Rijf6p2OIel8iiLIlnthF1uw6APfaUygzRErN8S', 'sHdUeIQFJhA2meUvJUE29iYbKYDkWROiiPDrduZkHAmi7G1o1FeOk7J5yEvC', '2022-01-31 04:13:34', '2022-03-12 19:17:37', 50, '75471.png', 1, 1),
(2, '556', 'ghthfg@yahoo.com', NULL, '$2y$10$LzS6.HnOx4O4VsJ97PBrnuEU/9u5EF.gOZOlCXZ8yHZiEiVojLfH.', NULL, '2022-02-17 05:14:23', '2022-03-19 12:55:16', 50, '24883.png', 1, 0),
(3, 'ed@yahoo.com', 'ed@yahoo.com', NULL, '$2y$10$PyYMnj/zMYpHO6WWIgR.rODO3HyGcPbfMqTAVcrhkhnxCk0JYwWqi', NULL, '2022-03-01 15:47:40', '2022-03-01 15:47:40', 58, '82278.png', 0, 0),
(4, 'hussein', 'bondbond796@yahoo.com', NULL, '$2y$10$VXaNvkFh0Qc1HDSx5SwmSOMHpg37VHuuD8BCZNto6eWXp8vx6L0ia', 'lyuN6TWF1DvjRyTujgSpBJnN3quI009mpq9ZhlPPXLgzwicigutFOY8HGgxO', '2022-03-16 05:44:26', '2022-03-19 12:56:19', 50, '90852.png', 1, 1),
(5, 'vvv', 'bondbond79226@yahoo.com', NULL, '$2y$10$cGUk196A/n4a5fvI5hyqNuqnYpXfV4o1Wr08hkdq47zZuI2.4szh2', NULL, '2022-03-30 10:58:00', '2022-03-30 10:58:00', 60, NULL, 0, 0),
(6, 'Mohamed Ghazaly', 'mohamed.ghazaly@cp-sa.com', NULL, '$2y$10$05PdlZQxqbI5EcETY00fX.U2Z3OW4spO.UTlk.oqrwwSI3tri1MeG', NULL, '2022-03-30 21:41:27', '2022-04-07 17:12:05', 50, '2206.png', 1, 1),
(7, 'Construction Power', 'info@cp-sa.com', NULL, '$2y$10$MAv7UXcnW3fyo.dD4eP95.edZ9Co78H1yDjWyzB9E9CKp691aJ7Qm', NULL, '2022-04-07 16:59:42', '2022-04-07 17:34:09', 58, '93758.png', 0, 1),
(8, 'Ali Samy', 'Ali.samy@cp-sa.com', NULL, '$2y$10$cOACsMxlpJ4r7CsKZ6Mzau0kV27xHWPQJa0rcZ7RkTC7SedwaxMC6', NULL, '2022-04-07 17:00:47', '2022-04-07 17:20:28', 62, NULL, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vacation_requests`
--

CREATE TABLE `vacation_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `workflows`
--

CREATE TABLE `workflows` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `workflows`
--

INSERT INTO `workflows` (`id`, `name`, `created_at`, `updated_at`) VALUES
(10, 'matrial_request', '2022-02-12 22:01:27', '2022-02-12 22:01:27'),
(11, 'subcontractor', '2022-02-12 22:01:27', '2022-02-12 22:01:27'),
(12, 'site_request', '2022-02-12 22:01:27', '2022-02-12 22:01:27'),
(13, 'letter_work', '2022-02-12 22:01:27', '2022-02-12 22:01:27'),
(14, 'rfq', '2022-02-12 22:01:27', '2022-02-12 22:01:27'),
(15, 'petty_cash', '2022-02-12 22:01:27', '2022-02-12 22:01:27'),
(16, 'purchase_order', '2022-02-12 22:01:27', '2022-02-12 22:01:27'),
(17, 'employee', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attachment_employees`
--
ALTER TABLE `attachment_employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attachment_letter_cycles`
--
ALTER TABLE `attachment_letter_cycles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attachment_matrial_cycles`
--
ALTER TABLE `attachment_matrial_cycles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attachment_petty_cash_cycles`
--
ALTER TABLE `attachment_petty_cash_cycles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attachment_purchase_cycles`
--
ALTER TABLE `attachment_purchase_cycles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attachment_rfq_cycles`
--
ALTER TABLE `attachment_rfq_cycles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attachment_site_cycles`
--
ALTER TABLE `attachment_site_cycles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attachment_subcontractor_cycles`
--
ALTER TABLE `attachment_subcontractor_cycles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment_employee_cycles`
--
ALTER TABLE `comment_employee_cycles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment_letter_cycles`
--
ALTER TABLE `comment_letter_cycles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment_matrial_cycles`
--
ALTER TABLE `comment_matrial_cycles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment_petty_cash_cycles`
--
ALTER TABLE `comment_petty_cash_cycles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment_purchase_cycles`
--
ALTER TABLE `comment_purchase_cycles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment_rfq_cycles`
--
ALTER TABLE `comment_rfq_cycles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment_site_cycles`
--
ALTER TABLE `comment_site_cycles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment_subcontractor_cycles`
--
ALTER TABLE `comment_subcontractor_cycles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employees_project_id_foreign` (`project_id`),
  ADD KEY `employees_user_id_foreign` (`user_id`);

--
-- Indexes for table `employee_cycles`
--
ALTER TABLE `employee_cycles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_user`
--
ALTER TABLE `employee_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flowwork_steps`
--
ALTER TABLE `flowwork_steps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `letter_cycles`
--
ALTER TABLE `letter_cycles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `matrial_attrs`
--
ALTER TABLE `matrial_attrs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `matrial_conditions`
--
ALTER TABLE `matrial_conditions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `matrial_requests`
--
ALTER TABLE `matrial_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `matrial_requests_project_id_foreign` (`project_id`),
  ADD KEY `matrial_requests_user_id_foreign` (`user_id`);

--
-- Indexes for table `matrial_request_cycles`
--
ALTER TABLE `matrial_request_cycles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `matrial_request_user`
--
ALTER TABLE `matrial_request_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payment_terms`
--
ALTER TABLE `payment_terms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_terms_purchase_order_id_foreign` (`purchase_order_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `petty_attrs`
--
ALTER TABLE `petty_attrs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `petty_attrs_petty_cash_id_foreign` (`petty_cash_id`);

--
-- Indexes for table `petty_cashes`
--
ALTER TABLE `petty_cashes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `petty_cashes_project_id_foreign` (`project_id`),
  ADD KEY `petty_cashes_user_id_foreign` (`user_id`);

--
-- Indexes for table `petty_cash_cycles`
--
ALTER TABLE `petty_cash_cycles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `petty_cash_user`
--
ALTER TABLE `petty_cash_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_orders`
--
ALTER TABLE `purchase_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_orders_project_id_foreign` (`project_id`),
  ADD KEY `purchase_orders_user_id_foreign` (`user_id`);

--
-- Indexes for table `purchase_order_attachments`
--
ALTER TABLE `purchase_order_attachments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_order_attrs`
--
ALTER TABLE `purchase_order_attrs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_order_attrs_purchase_order_id_foreign` (`purchase_order_id`);

--
-- Indexes for table `purchase_order_cycles`
--
ALTER TABLE `purchase_order_cycles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_order_user`
--
ALTER TABLE `purchase_order_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_order_user_user_id_foreign` (`user_id`),
  ADD KEY `purchase_order_user_purchase_order_id_foreign` (`Purchase_order_id`);

--
-- Indexes for table `rfqs`
--
ALTER TABLE `rfqs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rfqs_project_id_foreign` (`project_id`),
  ADD KEY `rfqs_user_id_foreign` (`user_id`);

--
-- Indexes for table `rfq_cycles`
--
ALTER TABLE `rfq_cycles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rfq_user`
--
ALTER TABLE `rfq_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rfq_user_user_id_foreign` (`user_id`),
  ADD KEY `rfq_user_rfq_id_foreign` (`rfq_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sites`
--
ALTER TABLE `sites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sites_project_id_foreign` (`project_id`),
  ADD KEY `sites_user_id_foreign` (`user_id`);

--
-- Indexes for table `site_cycles`
--
ALTER TABLE `site_cycles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `site_user`
--
ALTER TABLE `site_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `speeches`
--
ALTER TABLE `speeches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcontractors`
--
ALTER TABLE `subcontractors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subcontractors_project_id_foreign` (`project_id`),
  ADD KEY `subcontractors_user_id_foreign` (`user_id`);

--
-- Indexes for table `subcontractor_attrs`
--
ALTER TABLE `subcontractor_attrs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subcontractor_attrs_subcontractor_id_foreign` (`subcontractor_id`);

--
-- Indexes for table `subcontractor_files`
--
ALTER TABLE `subcontractor_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subcontractor_files_subcontractor_id_foreign` (`subcontractor_id`);

--
-- Indexes for table `subcontractor_request_cycles`
--
ALTER TABLE `subcontractor_request_cycles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcontractor_user`
--
ALTER TABLE `subcontractor_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subcontractor_user_user_id_foreign` (`user_id`),
  ADD KEY `subcontractor_user_subcontractor_id_foreign` (`subcontractor_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `vacation_requests`
--
ALTER TABLE `vacation_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `workflows`
--
ALTER TABLE `workflows`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attachment_employees`
--
ALTER TABLE `attachment_employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `attachment_letter_cycles`
--
ALTER TABLE `attachment_letter_cycles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attachment_matrial_cycles`
--
ALTER TABLE `attachment_matrial_cycles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `attachment_petty_cash_cycles`
--
ALTER TABLE `attachment_petty_cash_cycles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attachment_purchase_cycles`
--
ALTER TABLE `attachment_purchase_cycles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `attachment_rfq_cycles`
--
ALTER TABLE `attachment_rfq_cycles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attachment_site_cycles`
--
ALTER TABLE `attachment_site_cycles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attachment_subcontractor_cycles`
--
ALTER TABLE `attachment_subcontractor_cycles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `comment_employee_cycles`
--
ALTER TABLE `comment_employee_cycles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `comment_letter_cycles`
--
ALTER TABLE `comment_letter_cycles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comment_matrial_cycles`
--
ALTER TABLE `comment_matrial_cycles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `comment_petty_cash_cycles`
--
ALTER TABLE `comment_petty_cash_cycles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comment_purchase_cycles`
--
ALTER TABLE `comment_purchase_cycles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `comment_rfq_cycles`
--
ALTER TABLE `comment_rfq_cycles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `comment_site_cycles`
--
ALTER TABLE `comment_site_cycles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `comment_subcontractor_cycles`
--
ALTER TABLE `comment_subcontractor_cycles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `employee_cycles`
--
ALTER TABLE `employee_cycles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `employee_user`
--
ALTER TABLE `employee_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `flowwork_steps`
--
ALTER TABLE `flowwork_steps`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `letter_cycles`
--
ALTER TABLE `letter_cycles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `matrial_attrs`
--
ALTER TABLE `matrial_attrs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `matrial_conditions`
--
ALTER TABLE `matrial_conditions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `matrial_requests`
--
ALTER TABLE `matrial_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `matrial_request_cycles`
--
ALTER TABLE `matrial_request_cycles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `matrial_request_user`
--
ALTER TABLE `matrial_request_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `payment_terms`
--
ALTER TABLE `payment_terms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `petty_attrs`
--
ALTER TABLE `petty_attrs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `petty_cashes`
--
ALTER TABLE `petty_cashes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `petty_cash_cycles`
--
ALTER TABLE `petty_cash_cycles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `petty_cash_user`
--
ALTER TABLE `petty_cash_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `purchase_orders`
--
ALTER TABLE `purchase_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;

--
-- AUTO_INCREMENT for table `purchase_order_attachments`
--
ALTER TABLE `purchase_order_attachments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `purchase_order_attrs`
--
ALTER TABLE `purchase_order_attrs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `purchase_order_cycles`
--
ALTER TABLE `purchase_order_cycles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=185;

--
-- AUTO_INCREMENT for table `purchase_order_user`
--
ALTER TABLE `purchase_order_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `rfqs`
--
ALTER TABLE `rfqs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `rfq_cycles`
--
ALTER TABLE `rfq_cycles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `rfq_user`
--
ALTER TABLE `rfq_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `sites`
--
ALTER TABLE `sites`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `site_cycles`
--
ALTER TABLE `site_cycles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `site_user`
--
ALTER TABLE `site_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `speeches`
--
ALTER TABLE `speeches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subcontractors`
--
ALTER TABLE `subcontractors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `subcontractor_attrs`
--
ALTER TABLE `subcontractor_attrs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `subcontractor_files`
--
ALTER TABLE `subcontractor_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subcontractor_request_cycles`
--
ALTER TABLE `subcontractor_request_cycles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `subcontractor_user`
--
ALTER TABLE `subcontractor_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `vacation_requests`
--
ALTER TABLE `vacation_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `workflows`
--
ALTER TABLE `workflows`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `matrial_requests`
--
ALTER TABLE `matrial_requests`
  ADD CONSTRAINT `matrial_requests_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `payment_terms`
--
ALTER TABLE `payment_terms`
  ADD CONSTRAINT `payment_terms_purchase_order_id_foreign` FOREIGN KEY (`purchase_order_id`) REFERENCES `purchase_orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `petty_cashes`
--
ALTER TABLE `petty_cashes`
  ADD CONSTRAINT `petty_cashes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `purchase_orders`
--
ALTER TABLE `purchase_orders`
  ADD CONSTRAINT `purchase_orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `purchase_order_attrs`
--
ALTER TABLE `purchase_order_attrs`
  ADD CONSTRAINT `purchase_order_attrs_purchase_order_id_foreign` FOREIGN KEY (`purchase_order_id`) REFERENCES `purchase_orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `purchase_order_user`
--
ALTER TABLE `purchase_order_user`
  ADD CONSTRAINT `purchase_order_user_purchase_order_id_foreign` FOREIGN KEY (`Purchase_order_id`) REFERENCES `purchase_orders` (`id`);

--
-- Constraints for table `sites`
--
ALTER TABLE `sites`
  ADD CONSTRAINT `sites_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `subcontractors`
--
ALTER TABLE `subcontractors`
  ADD CONSTRAINT `subcontractors_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `subcontractor_attrs`
--
ALTER TABLE `subcontractor_attrs`
  ADD CONSTRAINT `subcontractor_attrs_subcontractor_id_foreign` FOREIGN KEY (`subcontractor_id`) REFERENCES `subcontractors` (`id`);

--
-- Constraints for table `subcontractor_files`
--
ALTER TABLE `subcontractor_files`
  ADD CONSTRAINT `subcontractor_files_subcontractor_id_foreign` FOREIGN KEY (`subcontractor_id`) REFERENCES `subcontractors` (`id`);

--
-- Constraints for table `subcontractor_user`
--
ALTER TABLE `subcontractor_user`
  ADD CONSTRAINT `subcontractor_user_subcontractor_id_foreign` FOREIGN KEY (`subcontractor_id`) REFERENCES `subcontractors` (`id`),
  ADD CONSTRAINT `subcontractor_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
