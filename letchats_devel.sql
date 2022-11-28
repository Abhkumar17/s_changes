-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 16, 2022 at 05:52 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `letchats_devel`
--

-- --------------------------------------------------------

--
-- Table structure for table `calendar_tbl`
--

CREATE TABLE `calendar_tbl` (
  `id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime DEFAULT NULL,
  `day` varchar(250) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `calendar_tbl`
--

INSERT INTO `calendar_tbl` (`id`, `title`, `start`, `end`, `day`, `created_at`, `updated_at`) VALUES
(15, 'Republic Day', '2020-01-26 00:00:00', '2020-01-27 00:00:00', '', '2020-12-28 06:45:41', NULL),
(16, 'Good Friday', '2020-04-10 00:00:00', '2020-04-11 00:00:00', '', '2020-12-28 06:45:41', NULL),
(17, 'Ambedkar Jayanti', '2020-04-14 00:00:00', '2020-04-15 00:00:00', '', '2020-12-28 06:45:41', NULL),
(18, 'Eid al-Fitr', '2020-05-25 00:00:00', '2020-05-26 00:00:00', '', '2020-12-28 06:45:41', NULL),
(19, 'Eid al-Adha', '2020-05-31 00:00:00', '2020-06-01 00:00:00', '', '2020-12-28 06:45:41', NULL),
(20, 'Indian Independence Day', '2020-08-15 00:00:00', '2020-08-16 00:00:00', '', '2020-12-28 06:45:41', NULL),
(22, 'Dussehra', '2020-10-25 00:00:00', '2020-10-26 00:00:00', '', '2020-12-28 06:45:41', NULL),
(160, 'Holiday', '2020-05-31 12:00:00', '2020-05-31 12:00:00', 'Sun', '2020-12-28 06:45:41', NULL),
(253, 'ravi', '2020-07-26 12:00:00', '2020-07-26 12:00:00', 'Sun', '2020-12-28 06:45:41', NULL),
(254, 'ds', '2020-07-28 00:00:00', '2020-07-30 00:00:00', '', '2020-12-28 06:45:41', NULL),
(255, 'holiday', '2020-12-25 00:00:00', '2020-12-26 00:00:00', '', '2020-12-28 06:45:41', NULL),
(257, 'Happy New Year', '2020-12-29 12:00:00', '2020-12-29 12:00:00', 'Tue', '2020-12-28 12:01:21', '2020-12-28 12:01:21'),
(260, 'dgdgdgd', '2020-12-30 12:00:00', '2020-12-30 12:00:00', 'Wed', '2020-12-29 08:07:42', '2020-12-29 08:07:42'),
(262, 'new year', '2020-12-31 00:00:00', '2021-01-01 00:00:00', '', '2020-12-29 08:43:30', '2020-12-29 08:43:30'),
(264, 'mm', '2021-01-05 00:00:00', '2021-01-06 00:00:00', '', '2020-12-29 10:23:35', '2020-12-29 10:23:35');

-- --------------------------------------------------------

--
-- Table structure for table `chat_messages`
--

CREATE TABLE `chat_messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `sender_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `receive_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sender_username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `read` tinyint(1) NOT NULL DEFAULT 0,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `agent_img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `text_type` enum('A','C') COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admn_seen` int(11) NOT NULL DEFAULT 0,
  `status` int(11) DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chat_messages`
--

INSERT INTO `chat_messages` (`id`, `sender_id`, `receive_id`, `sender_username`, `message`, `read`, `file`, `ext`, `agent_img`, `created_at`, `updated_at`, `text_type`, `color`, `admn_seen`, `status`) VALUES
(1, '498112', '52', 'Sunil', 'hello', 1, NULL, NULL, NULL, '2022-03-03 08:52:55', '2022-03-04 10:37:42', 'C', '#9400D3', 0, 1),
(2, '52', '498112', 'sunil kumar', 'hello', 1, NULL, NULL, NULL, '2022-03-03 09:46:18', '2022-03-04 10:37:41', 'A', NULL, 0, 1),
(3, '498112', '52', 'Sunil', 'ggggg', 1, NULL, NULL, NULL, '2022-03-03 09:46:43', '2022-03-04 10:37:42', 'C', '#9400D3', 0, 1),
(4, '52', '498112', 'sunil kumar', 'kkkkkkk', 1, NULL, NULL, NULL, '2022-03-03 09:46:54', '2022-03-04 10:37:41', 'A', NULL, 0, 1),
(5, '52', '498112', 'sunil kumar', 'ghghghg', 1, NULL, NULL, NULL, '2022-03-03 09:47:20', '2022-03-04 10:37:41', 'A', NULL, 0, 1),
(6, '498112', '52', 'Sunil', 'ddgdg', 1, NULL, NULL, NULL, '2022-03-03 09:47:28', '2022-03-04 10:37:42', 'C', '#9400D3', 0, 1),
(7, '498112', '52', 'Sunil', 'hghhjg', 1, NULL, NULL, NULL, '2022-03-03 09:47:48', '2022-03-04 10:37:42', 'C', '#9400D3', 0, 1),
(17, '52', '498112', 'sunil kumar', 'hello', 1, NULL, NULL, NULL, '2022-03-03 12:50:45', '2022-03-04 10:37:41', 'A', NULL, 0, 1),
(9, '52', '498112', 'sunil kumar', 'gdgdgdgdg', 1, NULL, NULL, NULL, '2022-03-03 10:55:35', '2022-03-04 10:37:41', 'A', NULL, 0, 1),
(10, '326376', '50', 'santosh', 'ASD', 1, NULL, NULL, NULL, '2022-03-03 10:56:02', '2022-03-31 11:18:00', 'C', '#9400D3', 0, 1),
(11, '326376', '50', 'santosh', 'SDX', 1, NULL, NULL, NULL, '2022-03-03 10:56:10', '2022-03-31 11:18:00', 'C', '#9400D3', 0, 1),
(12, '50', '326376', 'santosh', 'YTGUKUIL', 1, NULL, NULL, NULL, '2022-03-03 11:10:01', '2022-03-31 11:18:00', 'A', NULL, 0, 0),
(16, '498112', '52', 'Sunil', NULL, 1, '20220303175931.jpg', 'jpg', NULL, '2022-03-03 12:29:31', '2022-03-04 10:37:42', 'C', '#9400D3', 0, 1),
(18, '498112', '52', 'Sunil', 'Customer logout', 1, NULL, NULL, NULL, '2022-03-03 13:29:18', '2022-03-04 10:37:42', 'C', '#9400D3', 0, 1),
(19, '498112', '52', 'Sunil', 'Customer logout', 1, NULL, NULL, NULL, '2022-03-03 13:29:26', '2022-03-04 10:37:42', 'C', '#9400D3', 0, 1),
(20, '834685', '62', 'Deepak Elevate', 'hello', 1, NULL, NULL, NULL, '2022-03-04 06:09:23', '2022-03-15 13:21:40', 'C', '#228B22', 0, 1),
(21, '62', '834685', 'Deepak Kumar', 'Hi', 1, NULL, NULL, NULL, '2022-03-04 06:13:00', '2022-03-15 13:21:40', 'A', NULL, 0, 1),
(22, '834685', '62', 'Deepak Elevate', 'can i help me', 1, NULL, NULL, NULL, '2022-03-04 06:13:23', '2022-03-15 13:21:40', 'C', '#228B22', 0, 1),
(23, '834685', '62', 'Deepak Elevate', NULL, 1, '20220304114346.jpg', 'jpg', NULL, '2022-03-04 06:13:46', '2022-03-15 13:21:40', 'C', '#228B22', 0, 1),
(24, '62', '834685', 'Deepak Kumar', 'hghhg', 1, NULL, NULL, NULL, '2022-03-04 07:44:42', '2022-03-15 13:21:40', 'A', NULL, 0, 1),
(25, '50', '326376', 'santosh', 'fgjn', 1, NULL, NULL, NULL, '2022-03-04 10:29:28', '2022-03-31 11:18:00', 'A', NULL, 0, 0),
(26, '62', '834685', 'Deepak Kumar', 'hi', 1, NULL, NULL, NULL, '2022-03-04 14:37:01', '2022-03-15 13:21:40', 'A', NULL, 0, 0),
(27, '62', '834685', 'Deepak Kumar', 'ho', 1, NULL, NULL, NULL, '2022-03-11 13:19:31', '2022-03-15 13:21:40', 'A', NULL, 0, 0),
(28, '787263', '63', 'Krishan sir', 'status', 0, NULL, NULL, NULL, '2022-03-31 11:37:03', '2022-03-31 11:37:03', 'C', '#2F4F4F', 0, 1),
(29, '570199', '63', 'Krishan sir', 'status', 0, NULL, NULL, NULL, '2022-03-31 11:37:10', '2022-03-31 11:37:10', 'C', '#2F4F4F', 0, 1),
(30, '568623', '63', 'Krishan sir', 'status', 0, NULL, NULL, NULL, '2022-03-31 11:37:15', '2022-03-31 11:37:15', 'C', '#2F4F4F', 0, 1),
(31, '514597', '63', 'Krishan sir', 'status', 0, NULL, NULL, NULL, '2022-03-31 11:37:16', '2022-03-31 11:37:16', 'C', '#2F4F4F', 0, 1),
(32, '443188', '63', 'Krishan sir', 'status', 0, NULL, NULL, NULL, '2022-03-31 11:37:23', '2022-03-31 11:37:23', 'C', '#2F4F4F', 0, 1),
(33, '886443', '63', 'Krishan sir', 'status', 1, NULL, NULL, NULL, '2022-03-31 11:37:24', '2022-03-31 11:38:20', 'C', '#2F4F4F', 0, 1),
(34, '886443', '63', 'Krishan sir', 'hi', 1, NULL, NULL, NULL, '2022-03-31 11:37:35', '2022-03-31 11:38:20', 'C', '#2F4F4F', 0, 1),
(35, '63', '886443', 'pooja gupta', 'hello sir', 0, NULL, NULL, NULL, '2022-03-31 11:38:32', '2022-03-31 12:29:10', 'A', NULL, 0, 1),
(36, '237869', '63', 'Krishan sir', 'Hi', 0, NULL, NULL, NULL, '2022-03-31 11:39:21', '2022-03-31 11:39:21', 'C', '#2F4F4F', 0, 1),
(37, '653581', '63', 'Krishan sir', 'Hi', 1, NULL, NULL, NULL, '2022-03-31 11:39:34', '2022-03-31 12:29:10', 'C', '#2F4F4F', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `state_id` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `state_id`, `created_at`, `updated_at`) VALUES
(1, 'Noida', 'UP', '2021-11-11 23:39:13', '2021-11-23 06:01:08'),
(2, 'City first', 'State First', '2021-11-23 03:48:36', '2021-11-23 05:20:36');

-- --------------------------------------------------------

--
-- Table structure for table `color_code`
--

CREATE TABLE `color_code` (
  `id` int(11) NOT NULL,
  `alfa_name` varchar(250) NOT NULL,
  `alfa_color` varchar(250) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `color_code`
--

INSERT INTO `color_code` (`id`, `alfa_name`, `alfa_color`) VALUES
(2, 'A', '#8B0000'),
(3, 'B', '#FF0000'),
(4, 'C', '#B22222'),
(5, 'D', '#228B22'),
(6, 'E', '#8B4513'),
(7, 'F', '#D2691E'),
(8, 'G', '#006400'),
(9, 'H', '#DAA520'),
(10, 'I', '#008080'),
(11, 'J', '#BC8F8F'),
(12, 'K', '#2F4F4F'),
(13, 'L', '#696969'),
(14, 'M', '#C71585'),
(15, 'N', '#FF1493'),
(16, 'O', '#4B0082'),
(17, 'P', '#800080'),
(18, 'Q', '#8B008B'),
(19, 'R', '#ff00ff'),
(20, 'S', '#9400D3'),
(21, 'T', '#8A2BE2'),
(22, 'U', '#556B2F'),
(23, 'V', '#008B8B'),
(24, 'W', '#4c004c'),
(25, 'X', '#696969'),
(26, 'Y', '#FF00FF'),
(27, 'Z', '#BA55D3');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `phonecode` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `phonecode`, `created_at`, `updated_at`) VALUES
(1, 'India', 91, '2021-11-11 18:58:46', '2021-11-23 00:52:18'),
(2, 'US', 345, '2021-11-11 19:16:42', '2021-11-12 20:23:24'),
(3, 'Afghanistan', 345, '2021-11-23 02:25:59', '2021-11-23 04:43:17');

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`id`, `name`) VALUES
(1, 'India'),
(2, 'Iran'),
(3, 'Italy'),
(4, 'Japan');

-- --------------------------------------------------------

--
-- Table structure for table `create_level`
--

CREATE TABLE `create_level` (
  `id` int(11) NOT NULL,
  `process_name` varchar(250) NOT NULL,
  `level_name` varchar(250) NOT NULL,
  `level_dec` text DEFAULT NULL,
  `level_option` varchar(250) DEFAULT NULL,
  `date_level` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `create_level`
--

INSERT INTO `create_level` (`id`, `process_name`, `level_name`, `level_dec`, `level_option`, `date_level`) VALUES
(1, '0', 'Level_Fast', 'Login Desk', NULL, ''),
(2, '0', 'Level_Secound', 'Initial Login And CAM Maker', NULL, ''),
(4, '0', 'Level_third', 'Make Decision And DM Stage', NULL, ''),
(5, '0', 'level_fourth', 'Disbursal', NULL, ''),
(6, 'Ticket', 'start', 'Start', NULL, '0'),
(7, 'Ticket', 'TAT1', 'TAT1', '', '3'),
(8, 'Ticket', 'TAT2', 'TAT2', NULL, '5'),
(9, 'Ticket', 'TAT3', 'TAT3', NULL, '6'),
(10, 'Ticket', 'TAT4', 'TAT4', NULL, '7'),
(11, 'Ticket', 'Current_date', 'Current Date', NULL, '8');

-- --------------------------------------------------------

--
-- Table structure for table `degination`
--

CREATE TABLE `degination` (
  `id` int(10) NOT NULL,
  `designation` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `degination`
--

INSERT INTO `degination` (`id`, `designation`, `created_at`, `updated_at`) VALUES
(1, 'PHP DEVELOPER', '2021-11-26 23:44:54', NULL),
(2, 'CEO', '2021-11-27 00:50:11', '2021-11-27 00:50:11'),
(3, 'Sr. PHP Developer', '2021-11-27 00:50:35', '2021-11-27 00:50:35'),
(4, 'Support', '2021-11-28 07:05:15', '2021-11-28 07:37:47'),
(7, 'Director', '2021-11-29 01:09:02', '2021-11-29 01:09:02'),
(8, 'Account', '2021-11-29 01:12:28', '2021-11-29 01:12:28'),
(9, 'HR', '2021-11-29 01:15:14', '2021-11-29 01:15:14'),
(10, 'Team Leader', '2021-11-29 01:50:04', '2021-11-29 01:50:04'),
(11, 'Administration', '2021-12-28 02:29:58', '2021-12-28 02:29:58'),
(12, 'Marketing', '2021-12-29 11:52:45', '2021-12-29 11:52:45'),
(13, 'Manual testing', '2022-05-09 12:45:38', '2022-05-09 12:45:38');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `department_name` varchar(250) NOT NULL,
  `process_name` varchar(250) NOT NULL DEFAULT 'Ticket'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `created_at`, `updated_at`, `department_name`, `process_name`) VALUES
(9, '2021-11-24 08:42:42', '2021-11-24 08:42:42', 'Support', 'Ticket'),
(10, '2021-11-24 08:42:53', '2021-11-24 08:42:53', 'Sales', 'Ticket'),
(11, '2021-11-24 08:43:04', '2021-11-24 08:43:04', 'Development', 'Ticket'),
(12, '2021-11-24 08:43:12', '2021-11-24 08:43:12', 'HR', 'Ticket'),
(13, '2021-11-24 08:43:23', '2021-11-24 08:43:23', 'Account', 'Ticket'),
(14, '2021-11-24 08:44:08', '2021-11-24 08:44:08', 'Administration', 'Ticket'),
(15, '2021-11-24 08:46:36', '2021-11-24 08:46:36', 'Digtal Marketing', 'Ticket'),
(16, '2021-12-02 11:34:31', '2021-12-02 11:34:31', 'TL', 'Ticket'),
(17, '2021-12-31 06:46:20', '2021-12-31 07:00:15', 'Director', 'Ticket'),
(18, '2022-03-31 12:36:25', '2022-03-31 12:36:25', 'Demo', 'Ticket'),
(19, '2022-03-31 12:58:40', '2022-03-31 12:58:40', 'test', 'Ticket');

-- --------------------------------------------------------

--
-- Table structure for table `dispostion`
--

CREATE TABLE `dispostion` (
  `id` int(11) NOT NULL,
  `process_name` varchar(250) DEFAULT NULL,
  `status` varchar(250) DEFAULT NULL,
  `sub_status` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dispostion`
--

INSERT INTO `dispostion` (`id`, `process_name`, `status`, `sub_status`, `created_at`, `updated_at`) VALUES
(20, 'Ticket', 'Open', 'Open', '2020-10-22 10:02:38', NULL),
(34, 'Ticket', 'Follow-up', 'Follow', '2020-10-22 10:02:38', '2022-05-07 10:45:46'),
(35, 'Ticket', 'Open', 'In_process', '2020-10-22 10:02:38', '2021-06-24 13:27:12'),
(36, 'Ticket', 'Open', 'complicated', '2020-10-22 10:02:38', '2021-06-24 13:25:39'),
(37, 'Ticket', 'New', 'New', '2021-10-18 06:09:03', '2022-02-02 11:36:55'),
(38, 'Ticket', 'Closed', 'Closed', '2021-10-23 00:46:15', '2021-12-07 09:06:03'),
(40, 'Ticket', 'Open', 'Open', '2022-01-10 10:17:14', '2022-05-07 10:51:31'),
(44, 'Ticket', 'Follow-up', 'Working', '2022-05-07 11:04:33', '2022-05-07 11:04:33');

-- --------------------------------------------------------

--
-- Table structure for table `document_ticket`
--

CREATE TABLE `document_ticket` (
  `id` int(11) NOT NULL,
  `document_id` varchar(250) DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `document_type` varchar(250) DEFAULT NULL,
  `document_name` varchar(250) DEFAULT NULL,
  `document_size` varchar(250) DEFAULT NULL,
  `ticket_number` varchar(250) DEFAULT NULL,
  `process_name` varchar(250) DEFAULT NULL,
  `customer_id` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `document_ticket`
--

INSERT INTO `document_ticket` (`id`, `document_id`, `create_date`, `document_type`, `document_name`, `document_size`, `ticket_number`, `process_name`, `customer_id`, `created_at`, `updated_at`) VALUES
(1, 'DOC20220302023402258', '2022-03-02 09:04:02', 'jpg', '20220302143402.jpg', '0.00 MB', '20220224809', 'Ticket', NULL, '2022-03-02 09:04:02', '2022-03-02 09:04:02');

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
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `login_chat`
--

CREATE TABLE `login_chat` (
  `id` int(11) NOT NULL,
  `chat_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `ticket_number` varchar(255) NOT NULL,
  `department` varchar(255) DEFAULT NULL,
  `messages` text NOT NULL,
  `agent_typing` bigint(20) NOT NULL DEFAULT 0,
  `customer_typing` bigint(20) NOT NULL DEFAULT 0,
  `color` varchar(255) DEFAULT NULL,
  `chat_status` int(11) NOT NULL DEFAULT 0,
  `last_msg` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login_chat`
--

INSERT INTO `login_chat` (`id`, `chat_id`, `user_id`, `name`, `password`, `ticket_number`, `department`, `messages`, `agent_typing`, `customer_typing`, `color`, `chat_status`, `last_msg`, `created_at`, `updated_at`) VALUES
(1, 498112, 52, 'Sunil', '$2y$10$YmuQoimjgJdswKfxA1geT.MRmugbf6mUIUMXxa3505O/F9sBFQR0K', '20220207625', 'Development', 'hello', 0, 0, '#9400D3', 0, 'Customer logout', '2022-03-03 09:47:48', '2022-03-03 13:29:26'),
(2, 326376, 50, 'santosh', '$2y$10$t/v9C8DoukIfHRSbcoZOvOTIqkNBw46fsB7yI6/IZdNu8uVHtCJp6', '20220203587', 'Development', 'ASD', 0, 0, '#9400D3', 1, 'SDX', '2022-03-03 10:56:10', '2022-03-03 10:56:10'),
(3, 834685, 62, 'Deepak Elevate', '$2y$10$nh50uQFHAMydJeZMLXyT.ucJUxwv3bHSxlczX9MD0krTHo4GBx1sC', '20220204604', 'Support', 'hello', 0, 0, '#228B22', 1, 'can i help me', '2022-03-04 06:13:23', '2022-03-04 06:13:23'),
(4, 787263, 63, 'Krishan sir', '$2y$10$kefHYRkFokPB.lib93ELV.xj3tt9xyb.stNiY9qtyNz1NgCwUt2pG', '202203311095', 'Support', 'status', 0, 0, '#2F4F4F', 1, NULL, '2022-03-31 11:37:03', '2022-03-31 11:37:03'),
(5, 570199, 63, 'Krishan sir', '$2y$10$L1Bb8IDlKJOm0itjztmW9uDOABL7MBXwzJMRRRLoBRhq7fbOME9fq', '202203311095', 'Support', 'status', 0, 0, '#2F4F4F', 1, NULL, '2022-03-31 11:37:09', '2022-03-31 11:37:09'),
(6, 568623, 63, 'Krishan sir', '$2y$10$7.PhoeaIEAWZ2qL8LNHYieb0ITdztddotD/x34tjbRhWGcaQNZZom', '202203311095', 'Support', 'status', 0, 0, '#2F4F4F', 1, NULL, '2022-03-31 11:37:15', '2022-03-31 11:37:15'),
(7, 514597, 63, 'Krishan sir', '$2y$10$szsIPGTkdgG4JbYAKc6pa.pu.snvh2h4lWI8WllMfoTouLFQvlnja', '202203311095', 'Support', 'status', 0, 0, '#2F4F4F', 1, NULL, '2022-03-31 11:37:16', '2022-03-31 11:37:16'),
(8, 443188, 63, 'Krishan sir', '$2y$10$2cBK3XunotJAhDnUQARTXuuIotpyQBtG.5iXZ2EJ4JyonyRtOufEm', '202203311095', 'Support', 'status', 0, 0, '#2F4F4F', 1, NULL, '2022-03-31 11:37:23', '2022-03-31 11:37:23'),
(9, 886443, 63, 'Krishan sir', '$2y$10$jt0OUaS7ABT4t8WsBhH5BulLDg/UojgkAETzOrn2aFkgQvAv8LLki', '202203311095', 'Support', 'status', 0, 0, '#2F4F4F', 1, 'hi', '2022-03-31 11:37:35', '2022-03-31 11:37:35'),
(10, 237869, 63, 'Krishan sir', '$2y$10$m9j0k8YKoiNPUBh0zrFZMuEvR4w66Rs6h8L.NGvyxjgXGiKfYEK5.', '202203311095', 'Support', 'Hi', 0, 0, '#2F4F4F', 1, NULL, '2022-03-31 11:39:21', '2022-03-31 11:39:21'),
(11, 653581, 63, 'Krishan sir', '$2y$10$01A80LPZDsUnbKVLLFyCZ.zs1d67GCuQHQTSjnf7hAOJ01jfebiFe', '202203311095', 'Support', 'Hi', 0, 0, '#2F4F4F', 1, NULL, '2022-03-31 11:39:34', '2022-03-31 11:39:34');

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
(3, '2019_08_19_000000_create_failed_jobs_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'DaOvQTuCM6YtYiJ8NmPcJU1uac1v3NVBeAZDhWIq', NULL, 'http://localhost', 1, 0, 0, '2022-05-10 23:41:45', '2022-05-10 23:41:45'),
(2, NULL, 'Laravel Password Grant Client', '4hM6MkFbVruVkGWeck5ycgfs0v1C5d3wk4IKDyHo', 'users', 'http://localhost', 0, 1, 0, '2022-05-10 23:41:46', '2022-05-10 23:41:46');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2022-05-10 23:41:45', '2022-05-10 23:41:45');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `process_category`
--

CREATE TABLE `process_category` (
  `id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `process_name` varchar(250) NOT NULL DEFAULT 'Ticket',
  `category_name` varchar(250) NOT NULL,
  `sub_category` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `process_category`
--

INSERT INTO `process_category` (`id`, `created_at`, `updated_at`, `process_name`, `category_name`, `sub_category`) VALUES
(64, '2021-07-28 14:47:48', '2021-12-24 08:07:21', 'Ticket', 'Support', NULL),
(69, '2021-07-28 14:51:04', '2021-12-24 07:55:48', 'Ticket', 'Hardware Internal Issue', NULL),
(74, '2021-12-24 07:41:51', '2021-12-24 07:41:51', 'Ticket', 'Internal  Issues', NULL),
(75, '2021-12-24 07:47:26', '2021-12-24 07:47:26', 'Ticket', 'Development', NULL),
(76, '2021-12-31 06:53:40', '2021-12-31 06:53:40', 'Ticket', 'HR', NULL),
(77, '2022-01-03 08:44:26', '2022-01-03 08:44:26', 'Ticket', 'Licences', NULL),
(78, '2022-01-03 08:46:30', '2022-01-03 08:46:30', 'Ticket', 'WFH', NULL),
(79, '2022-01-03 08:47:10', '2022-01-03 08:47:10', 'Ticket', 'Invoice', NULL),
(80, '2022-03-31 13:02:32', '2022-03-31 13:02:32', 'Ticket', 'Mislenious', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `process_customer`
--

CREATE TABLE `process_customer` (
  `id` int(11) NOT NULL,
  `customer_id` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `owner` varchar(250) DEFAULT NULL,
  `customer_name` varchar(250) DEFAULT NULL,
  `mobile` varchar(250) DEFAULT NULL,
  `email_id` varchar(250) DEFAULT NULL,
  `message_id` varchar(355) DEFAULT NULL,
  `fax` varchar(250) DEFAULT NULL,
  `skype_Id` varchar(250) DEFAULT NULL,
  `country` varchar(250) DEFAULT NULL,
  `state` varchar(250) DEFAULT NULL,
  `city` varchar(250) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `company_name` varchar(250) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `process_customer`
--

INSERT INTO `process_customer` (`id`, `customer_id`, `created_at`, `owner`, `customer_name`, `mobile`, `email_id`, `message_id`, `fax`, `skype_Id`, `country`, `state`, `city`, `description`, `company_name`, `updated_at`) VALUES
(1, '202205091', '2022-05-09 08:00:48', 'santosh', 'sunil', '7275812453', 'sunil@vert-age.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-15 01:54:08'),
(2, '202205092', '2022-05-09 09:33:40', 'Deepak Swami', 'Sunil ', NULL, 'eticket@vert-age.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-09 11:39:07'),
(3, '202205093', '2022-05-09 09:50:22', 'Deepak Swami', 'Sunil ', NULL, 'eticket@vert-age.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-09 11:41:09'),
(4, '202205104', '2022-05-10 04:44:20', 'Siddharth Singh', 'sad', '1234567890', 'santosh@vert-age.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-14 06:29:09'),
(5, '202205105', '2022-05-10 07:07:06', 'Siddharth Singh', 'Sunil ', NULL, 'eticket@vert-age.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-10 07:21:01'),
(6, '202205106', '2022-05-10 09:30:51', 'aakash', 'AA', '211', '113', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-10 09:30:51'),
(7, '202205107', '2022-05-10 10:00:25', 'Siddharth Singh', 'Sunil', '98498494', 'eticket@vert-age.com', '<180ad697bdc.118c009371296095.592478051898459700@vert-age.com>', NULL, NULL, 'India', 'UP', 'Noida', 'testing', NULL, '2022-05-10 11:18:07'),
(8, '202205118', '2022-05-11 05:21:53', 'aakash', 'aakash', 'abc', 'aakashverma0213@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-11 05:21:53'),
(9, '202205119', '2022-05-11 10:10:19', 'Admin', 'Sunil ', NULL, 'eticket@vert-age.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-11 10:10:19'),
(10, '2022051110', '2022-05-11 10:15:59', 'Siddharth Singh', 'aakash', '6395079456', 'akashverma@vert-age.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-11 10:15:59'),
(11, '2022051211', '2022-05-12 10:42:05', 'Admin', 'Sunil ', NULL, 'eticket@vert-age.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-12 10:42:05'),
(12, '2022051212', '2022-05-12 10:42:06', 'Admin', 'Sunil ', NULL, 'eticket@vert-age.com', '<180b7dc5ce4.f8407b5a1911065.2683112911794287263@vert-age.com>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-12 10:42:06'),
(13, '2022051213', '2022-05-12 10:42:06', 'Admin', 'Sunil ', NULL, 'eticket@vert-age.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-12 10:42:06'),
(14, '2022051214', '2022-05-12 11:16:57', 'Admin', 'Sunil ', NULL, 'eticket@vert-age.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-12 11:16:57'),
(15, '2022051215', '2022-05-12 11:39:20', 'Siddharth Singh', 'Sunil ', NULL, 'eticket@vert-age.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-12 06:23:44'),
(18, '2022051315', '2022-05-13 05:31:45', 'Siddharth Singh', 'Sunil ', NULL, 'eticket@vert-age.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-13 00:19:29'),
(19, '2022051315', '2022-05-13 05:48:36', 'Siddharth Singh', 'Sunil ', NULL, 'eticket@vert-age.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-13 00:19:29');

-- --------------------------------------------------------

--
-- Table structure for table `process_email`
--

CREATE TABLE `process_email` (
  `id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `fromaddress` varchar(250) DEFAULT NULL,
  `from` varchar(250) DEFAULT NULL,
  `reply_toaddress` varchar(250) DEFAULT NULL,
  `reply_to` varchar(250) DEFAULT NULL,
  `senderaddress` varchar(250) DEFAULT NULL,
  `sender` varchar(250) DEFAULT NULL,
  `from_personal` varchar(250) DEFAULT NULL,
  `from_mailbox` varchar(250) DEFAULT NULL,
  `from_host` varchar(250) DEFAULT NULL,
  `reply_to_personal` varchar(250) DEFAULT NULL,
  `reply_to_mailbox` varchar(250) DEFAULT NULL,
  `reply_to_host` varchar(250) DEFAULT NULL,
  `sender_personal` varchar(250) DEFAULT NULL,
  `sender_mailbox` varchar(250) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `process_email`
--

INSERT INTO `process_email` (`id`, `created_at`, `fromaddress`, `from`, `reply_toaddress`, `reply_to`, `senderaddress`, `sender`, `from_personal`, `from_mailbox`, `from_host`, `reply_to_personal`, `reply_to_mailbox`, `reply_to_host`, `sender_personal`, `sender_mailbox`, `updated_at`) VALUES
(1, '2020-06-25 05:48:36', 'eticket@vert-age.com', 'eticket@vert-age.com', 'eticket@vert-age.com', '', 'vert-age<info@vert-age.com>', 'eticket@vert-age.com', 'vert-age', 'info', 'vert-age.com', 'vert-age', 'info', 'vert-age.com', 'vert-age', 'info', '2022-04-21 07:14:28');

-- --------------------------------------------------------

--
-- Table structure for table `process_email2`
--

CREATE TABLE `process_email2` (
  `id` int(11) NOT NULL,
  `uid` varchar(100) NOT NULL,
  `rid` bigint(20) DEFAULT 0,
  `ticket_number` varchar(255) DEFAULT NULL,
  `subject` varchar(250) DEFAULT NULL,
  `toaddress` varchar(250) DEFAULT NULL,
  `from1` varchar(250) DEFAULT NULL,
  `to1` varchar(250) DEFAULT NULL,
  `cc_address` varchar(500) DEFAULT NULL,
  `attachment` varchar(500) DEFAULT NULL,
  `date1` varchar(100) DEFAULT NULL,
  `message_id` varchar(250) DEFAULT NULL,
  `references` varchar(500) DEFAULT NULL,
  `in_reply_to` varchar(500) DEFAULT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `page` varchar(50) DEFAULT NULL,
  `send_type` varchar(255) DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL,
  `msgno` bigint(20) DEFAULT NULL,
  `recent` varchar(250) DEFAULT NULL,
  `flagged` varchar(250) DEFAULT NULL,
  `answered` varchar(250) DEFAULT NULL,
  `deleted` varchar(100) DEFAULT NULL,
  `seen` varchar(100) DEFAULT NULL,
  `draft` varchar(100) DEFAULT NULL,
  `udate` varchar(100) DEFAULT NULL,
  `fromaddress` varchar(250) DEFAULT NULL,
  `reply_toaddress` varchar(250) DEFAULT NULL,
  `reply_to` varchar(250) DEFAULT NULL,
  `senderaddress` varchar(250) DEFAULT NULL,
  `sender` varchar(250) DEFAULT NULL,
  `unseen` varchar(250) DEFAULT NULL,
  `to_mailbox` varchar(250) DEFAULT NULL,
  `to_host` varchar(250) DEFAULT NULL,
  `from_personal` varchar(250) DEFAULT NULL,
  `from_mailbox` varchar(250) DEFAULT NULL,
  `from_host` varchar(250) DEFAULT NULL,
  `reply_to_personal` varchar(255) DEFAULT NULL,
  `reply_to_mailbox` varchar(250) DEFAULT NULL,
  `reply_to_host` varchar(250) DEFAULT NULL,
  `sender_personal` varchar(250) DEFAULT NULL,
  `sender_mailbox` varchar(250) DEFAULT NULL,
  `starred` int(11) NOT NULL DEFAULT 0,
  `important` int(11) NOT NULL DEFAULT 0,
  `email_send` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `process_email2`
--

INSERT INTO `process_email2` (`id`, `uid`, `rid`, `ticket_number`, `subject`, `toaddress`, `from1`, `to1`, `cc_address`, `attachment`, `date1`, `message_id`, `references`, `in_reply_to`, `message`, `page`, `send_type`, `size`, `msgno`, `recent`, `flagged`, `answered`, `deleted`, `seen`, `draft`, `udate`, `fromaddress`, `reply_toaddress`, `reply_to`, `senderaddress`, `sender`, `unseen`, `to_mailbox`, `to_host`, `from_personal`, `from_mailbox`, `from_host`, `reply_to_personal`, `reply_to_mailbox`, `reply_to_host`, `sender_personal`, `sender_mailbox`, `starred`, `important`, `email_send`, `created_at`, `updated_at`) VALUES
(1, '495', 0, '2022051316', 'Testing Mail', NULL, 'Sunil <sunil@vert-age.com>', 'eticket@vert-age.com', '', NULL, '', '<180bbd501d6.1126938af142837.4083233628397392169@vert-age.com>', NULL, NULL, '<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\"><html><head><meta content=\"text/html;charset=UTF-8\" http-equiv=\"Content-Type\"></head><body ><div style=\"font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10pt;\"><div>Test...<br></div><div><br></div><div><br></div><div><br></div><div class=\"zmail_signature_below\"><div id=\"\" data-zbluepencil-ignore=\"true\" data-sigid=\"6073782000000411002\"><div style=\"color: rgb(0, 0, 0); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13.3333px; font-style: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; background-color: rgb(255, 255, 255)\"><b>Thanks &amp; Regards&nbsp;</b><br></div><div style=\"color: rgb(0, 0, 0); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13.3333px; font-style: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; background-color: rgb(255, 255, 255)\"><b>Sunil Rathore</b><br></div><div style=\"color: rgb(0, 0, 0); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13.3333px; font-style: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; background-color: rgb(255, 255, 255)\"><b>Sr PHP Developer </b><br></div><div style=\"color: rgb(0, 0, 0); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13.3333px; font-style: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; background-color: rgb(255, 255, 255)\"><b>XENOTTABYTE SERVICES PVT LTD</b><br></div><div style=\"color: rgb(0, 0, 0); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13.3333px; font-style: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; background-color: rgb(255, 255, 255)\"><b><br></b><span class=\"size\" style=\"font-size: 12pt; margin: 0px;\"><b><span class=\"font\" style=\"font-family:Verdana, &quot;sans-serif&quot;\"><span class=\"size\" style=\"font-size:10pt\">Landline No. -&nbsp;<span class=\"x_-1040127744size\"><span class=\"highlight\" style=\"background-color:white\"><span class=\"colour\" style=\"color: black; background-size: initial;\">+911206967401/Ext.-8010</span></span></span></span></span></b><br></span></div><div style=\"color: rgb(0, 0, 0); font-family: &quot;Lato 2&quot;, sans-serif; font-size: 14px; font-style: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; background-color: rgb(255, 255, 255)\"><p style=\"margin: 0px\" class=\"\"><span class=\"size\" style=\"font-size: 12pt; margin: 0px;\"><b><span class=\"font\" style=\"font-family:Verdana, &quot;sans-serif&quot;\"><span class=\"size\" style=\"font-size:10pt\">Email :-<span>&nbsp;</span></span></span></b><span class=\"font\" style=\"font-family:Verdana, &quot;sans-serif&quot;\"><span class=\"size\" style=\"font-size:10pt\"><a style=\"color: blue; cursor: pointer; text-decoration: underline\" target=\"_blank\" href=\"mailto:sunil@vert-age.com\">sunil@vert-age.com</a><b>//Web:<span>&nbsp;</span></b><a style=\"color: blue; cursor: pointer; text-decoration: underline\" target=\"_blank\" href=\"http://www.vert-age.com/\"><b>www.vert-age.com</b></a><b>&nbsp;</b></span></span><br></span></p></div><div style=\"color: rgb(0, 0, 0); font-family: &quot;Lato 2&quot;, sans-serif; font-size: 14px; font-style: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; background-color: rgb(255, 255, 255)\"><p style=\"margin: 0px\" class=\"\"><span class=\"size\" style=\"font-size: 12pt; margin: 0px;\"><b><span class=\"font\" style=\"font-family:Verdana, &quot;sans-serif&quot;\"><span class=\"size\" style=\"font-size:10pt\">Address :- 1st Floor|| H-201 Sec-62|| Noida-201301</span></span></b><br></span></p></div><div style=\"color: rgb(0, 0, 0); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13.3333px; font-style: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; background-color: rgb(255, 255, 255)\"><br></div></div></div><div><br></div></div><br></body></html>', 'IN', NULL, '7399', 1, '1', '0', '0', '0', '1', '0', '1652418741', 'Sunil <sunil@vert-age.com>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2022-05-13 05:13:05', '2022-05-13 05:37:01'),
(2, '496', 0, '2022051315', 'Cron Job Test', NULL, 'Sunil <sunil@vert-age.com>', 'eticket@vert-age.com', '', NULL, '', '<180bbe68e70.f2a68436146153.1820298954940331993@vert-age.com>', NULL, NULL, '<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\"><html><head><meta content=\"text/html;charset=UTF-8\" http-equiv=\"Content-Type\"></head><body ><div style=\"font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10pt;\"><div>Testing...<br></div><div><br></div><div><br></div><div class=\"zmail_signature_below\"><div id=\"\" data-zbluepencil-ignore=\"true\" data-sigid=\"6073782000000411002\"><div style=\"color: rgb(0, 0, 0); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13.3333px; font-style: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; background-color: rgb(255, 255, 255)\"><b>Thanks &amp; Regards&nbsp;</b><br></div><div style=\"color: rgb(0, 0, 0); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13.3333px; font-style: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; background-color: rgb(255, 255, 255)\"><b>Sunil Rathore</b><br></div><div style=\"color: rgb(0, 0, 0); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13.3333px; font-style: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; background-color: rgb(255, 255, 255)\"><b>Sr PHP Developer </b><br></div><div style=\"color: rgb(0, 0, 0); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13.3333px; font-style: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; background-color: rgb(255, 255, 255)\"><b>XENOTTABYTE SERVICES PVT LTD</b><br></div><div style=\"color: rgb(0, 0, 0); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13.3333px; font-style: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; background-color: rgb(255, 255, 255)\"><b><br></b><span class=\"size\" style=\"font-size: 12pt; margin: 0px;\"><b><span class=\"font\" style=\"font-family:Verdana, &quot;sans-serif&quot;\"><span class=\"size\" style=\"font-size:10pt\">Landline No. -&nbsp;<span class=\"x_-1040127744size\"><span class=\"highlight\" style=\"background-color:white\"><span class=\"colour\" style=\"color: black; background-size: initial;\">+911206967401/Ext.-8010</span></span></span></span></span></b><br></span></div><div style=\"color: rgb(0, 0, 0); font-family: &quot;Lato 2&quot;, sans-serif; font-size: 14px; font-style: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; background-color: rgb(255, 255, 255)\"><p style=\"margin: 0px\" class=\"\"><span class=\"size\" style=\"font-size: 12pt; margin: 0px;\"><b><span class=\"font\" style=\"font-family:Verdana, &quot;sans-serif&quot;\"><span class=\"size\" style=\"font-size:10pt\">Email :-<span>&nbsp;</span></span></span></b><span class=\"font\" style=\"font-family:Verdana, &quot;sans-serif&quot;\"><span class=\"size\" style=\"font-size:10pt\"><a style=\"color: blue; cursor: pointer; text-decoration: underline\" target=\"_blank\" href=\"mailto:sunil@vert-age.com\">sunil@vert-age.com</a><b>//Web:<span>&nbsp;</span></b><a style=\"color: blue; cursor: pointer; text-decoration: underline\" target=\"_blank\" href=\"http://www.vert-age.com/\"><b>www.vert-age.com</b></a><b>&nbsp;</b></span></span><br></span></p></div><div style=\"color: rgb(0, 0, 0); font-family: &quot;Lato 2&quot;, sans-serif; font-size: 14px; font-style: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; background-color: rgb(255, 255, 255)\"><p style=\"margin: 0px\" class=\"\"><span class=\"size\" style=\"font-size: 12pt; margin: 0px;\"><b><span class=\"font\" style=\"font-family:Verdana, &quot;sans-serif&quot;\"><span class=\"size\" style=\"font-size:10pt\">Address :- 1st Floor|| H-201 Sec-62|| Noida-201301</span></span></b><br></span></p></div><div style=\"color: rgb(0, 0, 0); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13.3333px; font-style: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; background-color: rgb(255, 255, 255)\"><br></div></div></div><div><br></div></div><br></body></html>', 'IN', NULL, '7386', 2, '1', '0', '0', '0', '1', '0', '1652419892', 'Sunil <sunil@vert-age.com>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2022-05-13 00:01:45', '2022-05-13 05:36:55'),
(3, '497', 0, '2022051319', 'Re: Successfully Register Ticket', NULL, 'Sunil <sunil@vert-age.com>', 'eticket@vert-age.com', '', NULL, '', '<180bbec5b2d.1053b9357147343.3884064222116298158@vert-age.com>', '<1cd82848a4d9ef38dcb3a9da74e631d9@swift.generated>', '<1cd82848a4d9ef38dcb3a9da74e631d9@swift.generated>', '<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\"><html><head><meta content=\"text/html;charset=UTF-8\" http-equiv=\"Content-Type\"></head><body ><div style=\"font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10pt;\"><div>Reopen Ticket...</div><br><div id=\"Zm-_Id_-Sgn\" data-zbluepencil-ignore=\"true\" data-sigid=\"6073782000000411002\"><div style=\"color: rgb(0, 0, 0); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13.3333px; font-style: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; background-color: rgb(255, 255, 255)\"><b>Thanks &amp; Regards&nbsp;</b><br></div><div style=\"color: rgb(0, 0, 0); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13.3333px; font-style: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; background-color: rgb(255, 255, 255)\"><b>Sunil Rathore</b><br></div><div style=\"color: rgb(0, 0, 0); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13.3333px; font-style: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; background-color: rgb(255, 255, 255)\"><b>Sr PHP Developer </b><br></div><div style=\"color: rgb(0, 0, 0); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13.3333px; font-style: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; background-color: rgb(255, 255, 255)\"><b>XENOTTABYTE SERVICES PVT LTD</b><br></div><div style=\"color: rgb(0, 0, 0); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13.3333px; font-style: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; background-color: rgb(255, 255, 255)\"><b><br></b><span class=\"size\" style=\"font-size: 12pt; margin: 0px;\"><b><span class=\"font\" style=\"font-family:Verdana, &quot;sans-serif&quot;\"><span class=\"size\" style=\"font-size:10pt\">Landline No. -&nbsp;<span class=\"x_-1040127744size\"><span class=\"highlight\" style=\"background-color:white\"><span class=\"colour\" style=\"color: black; background-size: initial;\">+911206967401/Ext.-8010</span></span></span></span></span></b><br></span></div><div style=\"color: rgb(0, 0, 0); font-family: &quot;Lato 2&quot;, sans-serif; font-size: 14px; font-style: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; background-color: rgb(255, 255, 255)\"><p style=\"margin: 0px\" class=\"\"><span class=\"size\" style=\"font-size: 12pt; margin: 0px;\"><b><span class=\"font\" style=\"font-family:Verdana, &quot;sans-serif&quot;\"><span class=\"size\" style=\"font-size:10pt\">Email :-<span>&nbsp;</span></span></span></b><span class=\"font\" style=\"font-family:Verdana, &quot;sans-serif&quot;\"><span class=\"size\" style=\"font-size:10pt\"><a style=\"color: blue; cursor: pointer; text-decoration: underline\" target=\"_blank\" href=\"mailto:sunil@vert-age.com\">sunil@vert-age.com</a><b>//Web:<span>&nbsp;</span></b><a style=\"color: blue; cursor: pointer; text-decoration: underline\" target=\"_blank\" href=\"http://www.vert-age.com/\"><b>www.vert-age.com</b></a><b>&nbsp;</b></span></span><br></span></p></div><div style=\"color: rgb(0, 0, 0); font-family: &quot;Lato 2&quot;, sans-serif; font-size: 14px; font-style: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; background-color: rgb(255, 255, 255)\"><p style=\"margin: 0px\" class=\"\"><span class=\"size\" style=\"font-size: 12pt; margin: 0px;\"><b><span class=\"font\" style=\"font-family:Verdana, &quot;sans-serif&quot;\"><span class=\"size\" style=\"font-size:10pt\">Address :- 1st Floor|| H-201 Sec-62|| Noida-201301</span></span></b><br></span></p></div><div style=\"color: rgb(0, 0, 0); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13.3333px; font-style: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; background-color: rgb(255, 255, 255)\"><br></div></div><br><div class=\"zmail_extra_hr\" style=\"border-top: 1px solid rgb(204, 204, 204); height: 0px; margin-top: 10px; margin-bottom: 10px; line-height: 0px;\"><br></div><div class=\"zmail_extra\" data-zbluepencil-ignore=\"true\"><div><br></div><div id=\"Zm-_Id_-Sgn1\">---- On Fri, 13 May 2022 11:01:45 +0530 <b>Ticket-Management-System &lt;eticket@vert-age.com&gt;</b> wrote ----<br></div><div><br></div><blockquote style=\"margin: 0px;\"><div><table align=\"center\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"margin :  0; padding :  10px 0 0 0;\" bgcolor=\"F8F8F8\"><tbody><tr><td align=\"center\"><table align=\"center\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse :  separate; border-spacing :  2px 5px; border :  1px solid #b7afaf; border-radius :  6px;\" bgcolor=\"#FFFFFF\"><tbody><tr><td align=\"center\" style=\"padding :  3px 5px 3px 5px; border-bottom :  1px solid #b7afaf;\"><a href=\"http://vert-age.com\" target=\"_blank\" style=\"float: left; color: rgb(0, 0, 238);\" data-zeanchor=\"true\"><img id=\"1652419913106110003_imgsrc_url_0\" alt=\"Logo\" src=\"http://letchats.com/socail_media/logo.png\"> </a><br></td></tr><tr><td bgcolor=\"#ffffff\" style=\"padding :  0px 8px 10px 8px;\"><table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\"><tbody><tr><td style=\"padding :  0px 0px 0px 0px; font-family :  Avenir,  sans-serif; font-size :  16px; color :  #000;\"><p style=\"line-height: 20px;\"><span class=\"colour\" style=\"color:rgb(0, 0, 0)\"><span class=\"size\" style=\"font-size: 13px; line-height: 20px;\">Hi <b>Sunil ,</b></span></span><br></p><p style=\"line-height: 20px;\"><span class=\"colour\" style=\"color:rgb(0, 0, 0)\"><span class=\"size\" style=\"font-size: 13px; line-height: 20px;\">Thanks for your Query. Our Support Team has received your ticket <b>2022051315,</b> We have assigned it and we are working on its resolution. You will  receive update as soon as possible.</span></span><br></p><p style=\"line-height: 20px;\"><span class=\"colour\" style=\"color:rgb(0, 0, 0)\"><span class=\"size\" style=\"font-size: 13px; line-height: 20px;\">Thank You.</span></span><br></p><p style=\"line-height: 0px;\"><span class=\"colour\" style=\"color:rgb(0, 0, 0)\"><span class=\"size\" style=\"font-size: 14px; line-height: 0px;\"><b>Xenottabyte Services Pvt. Ltd</b></span></span><br></p></td></tr></tbody></table></td></tr><tr><td bgcolor=\"#0179a9\" style=\"padding :  10px 10px 10px 10px;\"><table cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td width=\"360\" align=\"left\"><table cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td width=\"190\"><p style=\"margin: 0px;\"><span class=\"colour\" style=\"color:white\"><span class=\"size\" style=\"font-size: 14px; margin: 0px;\">H-201, Sector 63,<br> Noida, (U.P), 201301</span></span></p></td><td style=\"font-size :  0; line-height :  0;\" width=\"10\">&nbsp;&nbsp;&nbsp;&nbsp;<br></td><td style=\"font-size :  0; line-height :  0;\" width=\"10\">&nbsp;<br></td><td><a href=\"mailto:support@vert-age.com\" target=\"_blank\" style=\"color :  white; font-size :  14px;\">support@vert-age.com</a><br></td></tr></tbody></table></td><td align=\"right\" width=\"170\"><table cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td><a href=\"https://www.facebook.com/predictivedialersoftware\" target=\"_blank\" data-zeanchor=\"true\" style=\"color: rgb(0, 0, 238);\"><img id=\"1652419913106110003_imgsrc_url_1\" alt=\"facebook\" width=\"30\" height=\"30\" style=\"display :  block;\" src=\"http://letchats.com/socail_media/facebook.png\"></a></td><td style=\"font-size :  0; line-height :  0;\" width=\"10\">&nbsp;<br></td><td><a href=\"https://www.linkedin.com/company/vert-age-xenottabyte\" target=\"_blank\" data-zeanchor=\"true\" style=\"color: rgb(0, 0, 238);\"><img id=\"1652419913106110003_imgsrc_url_2\" alt=\"LinkedIn\" width=\"30\" height=\"30\" style=\"display :  block;\" src=\"http://letchats.com/socail_media/linkedin.png\"></a></td><td style=\"font-size :  0; line-height :  0;\" width=\"10\">&nbsp;<br></td><td><a href=\"https://twitter.com/age_vert\" target=\"_blank\" data-zeanchor=\"true\" style=\"color: rgb(0, 0, 238);\"><img id=\"1652419913106110003_imgsrc_url_3\" alt=\"Twitter\" width=\"30\" height=\"30\" style=\"display :  block;\" src=\"http://letchats.com/socail_media/twitter.png\"></a></td><td style=\"font-size :  0; line-height :  0;\" width=\"10\">&nbsp;<br></td><td><a href=\"https://www.instagram.com/vertage64/\" target=\"_blank\" data-zeanchor=\"true\" style=\"color: rgb(0, 0, 238);\"><img id=\"1652419913106110003_imgsrc_url_4\" alt=\"Linkedin\" width=\"30\" height=\"30\" style=\"display :  block;\" src=\"http://letchats.com/socail_media/instagram.png\"></a></td></tr></tbody></table></td></tr></tbody></table></td></tr></tbody></table></td></tr></tbody></table></div></blockquote></div></div><br></body></html>', 'IN', NULL, '13315', 3, '1', '0', '0', '0', '1', '0', '1652420272', 'Sunil <sunil@vert-age.com>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2022-05-13 00:08:06', '2022-05-13 05:36:48'),
(4, '498', 0, '2022051315', 'Testing....', NULL, 'Sunil <sunil@vert-age.com>', 'eticket@vert-age.com', '', NULL, '', '<180bbf5f63d.eec9125e149400.8475932264321457581@vert-age.com>', NULL, NULL, 'hi<br><br>\r\n								<hr>\r\n								<meta content=\"text/html;charset=UTF-8\" http-equiv=\"Content-Type\"><div style=\"font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10pt;\"><div>test<br></div><div><br></div><div><br></div><div class=\"zmail_signature_below\"><div id=\"\" data-zbluepencil-ignore=\"true\" data-sigid=\"6073782000000411002\"><div style=\"color: rgb(0, 0, 0); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13.3333px; font-style: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; background-color: rgb(255, 255, 255)\"><b>Thanks &amp; Regards&nbsp;</b><br></div><div style=\"color: rgb(0, 0, 0); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13.3333px; font-style: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; background-color: rgb(255, 255, 255)\"><b>Sunil Rathore</b><br></div><div style=\"color: rgb(0, 0, 0); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13.3333px; font-style: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; background-color: rgb(255, 255, 255)\"><b>Sr PHP Developer </b><br></div><div style=\"color: rgb(0, 0, 0); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13.3333px; font-style: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; background-color: rgb(255, 255, 255)\"><b>XENOTTABYTE SERVICES PVT LTD</b><br></div><div style=\"color: rgb(0, 0, 0); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13.3333px; font-style: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; background-color: rgb(255, 255, 255)\"><b><br></b><span class=\"size\" style=\"font-size: 12pt; margin: 0px;\"><b><span class=\"font\" style=\"font-family:Verdana, \" sans-serif\"\"=\"\"><span class=\"size\" style=\"font-size:10pt\">Landline No. -&nbsp;<span class=\"x_-1040127744size\"><span class=\"highlight\" style=\"background-color:white\"><span class=\"colour\" style=\"color: black; background-size: initial;\">+911206967401/Ext.-8010</span></span></span></span></span></b><br></span></div><div style=\"color: rgb(0, 0, 0); font-family: \" lato=\"\" 2\",=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255)\"=\"\"><p style=\"margin: 0px\" class=\"\"><span class=\"size\" style=\"font-size: 12pt; margin: 0px;\"><b><span class=\"font\" style=\"font-family:Verdana, \" sans-serif\"\"=\"\"><span class=\"size\" style=\"font-size:10pt\">Email :-<span>&nbsp;</span></span></span></b><span class=\"font\" style=\"font-family:Verdana, \" sans-serif\"\"=\"\"><span class=\"size\" style=\"font-size:10pt\"><a style=\"color: blue; cursor: pointer; text-decoration: underline\" target=\"_blank\" href=\"mailto:sunil@vert-age.com\">sunil@vert-age.com</a><b>//Web:<span>&nbsp;</span></b><a style=\"color: blue; cursor: pointer; text-decoration: underline\" target=\"_blank\" href=\"http://www.vert-age.com/\"><b>www.vert-age.com</b></a><b>&nbsp;</b></span></span><br></span></p></div><div style=\"color: rgb(0, 0, 0); font-family: \" lato=\"\" 2\",=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255)\"=\"\"><p style=\"margin: 0px\" class=\"\"><span class=\"size\" style=\"font-size: 12pt; margin: 0px;\"><b><span class=\"font\" style=\"font-family:Verdana, \" sans-serif\"\"=\"\"><span class=\"size\" style=\"font-size:10pt\">Address :- 1st Floor|| H-201 Sec-62|| Noida-201301</span></span></b><br></span></p></div><div style=\"color: rgb(0, 0, 0); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13.3333px; font-style: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; background-color: rgb(255, 255, 255)\"><br></div></div></div><div><br></div></div><br>', 'SEN', NULL, '7372', 4, '1', '0', '0', '0', '1', '0', '1652420900', 'Sunil <sunil@vert-age.com>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, '2022-05-13 00:18:36', '2022-05-13 05:36:06'),
(5, '499', 0, '2022051320', 'Re: Successfully Register Ticket', NULL, 'Sunil <sunil@vert-age.com>', 'eticket@vert-age.com', '', NULL, '', '<180bbfc6f18.c6755ac8150720.2519823443257106673@vert-age.com>', '<22699ee421035e79fde05ac4dd005c4f@swift.generated>', '<22699ee421035e79fde05ac4dd005c4f@swift.generated>', '<br>gfdfd<br>\r\n								<hr>\r\n								<br>gjgjg<br>\r\n								<hr>\r\n								<meta content=\"text/html;charset=UTF-8\" http-equiv=\"Content-Type\"><div style=\"font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10pt;\"><div>reopen</div><br><div id=\"Zm-_Id_-Sgn\" data-zbluepencil-ignore=\"true\" data-sigid=\"6073782000000411002\"><div style=\"color: rgb(0, 0, 0); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13.3333px; font-style: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; background-color: rgb(255, 255, 255)\"><b>Thanks &amp; Regards&nbsp;</b><br></div><div style=\"color: rgb(0, 0, 0); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13.3333px; font-style: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; background-color: rgb(255, 255, 255)\"><b>Sunil Rathore</b><br></div><div style=\"color: rgb(0, 0, 0); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13.3333px; font-style: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; background-color: rgb(255, 255, 255)\"><b>Sr PHP Developer </b><br></div><div style=\"color: rgb(0, 0, 0); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13.3333px; font-style: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; background-color: rgb(255, 255, 255)\"><b>XENOTTABYTE SERVICES PVT LTD</b><br></div><div style=\"color: rgb(0, 0, 0); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13.3333px; font-style: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; background-color: rgb(255, 255, 255)\"><b><br></b><span class=\"size\" style=\"font-size: 12pt; margin: 0px;\"><b><span class=\"font\" style=\"font-family:Verdana, \" sans-serif\"\"=\"\"><span class=\"size\" style=\"font-size:10pt\">Landline No. -&nbsp;<span class=\"x_-1040127744size\"><span class=\"highlight\" style=\"background-color:white\"><span class=\"colour\" style=\"color: black; background-size: initial;\">+911206967401/Ext.-8010</span></span></span></span></span></b><br></span></div><div style=\"color: rgb(0, 0, 0); font-family: \" lato=\"\" 2\",=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255)\"=\"\"><p style=\"margin: 0px\" class=\"\"><span class=\"size\" style=\"font-size: 12pt; margin: 0px;\"><b><span class=\"font\" style=\"font-family:Verdana, \" sans-serif\"\"=\"\"><span class=\"size\" style=\"font-size:10pt\">Email :-<span>&nbsp;</span></span></span></b><span class=\"font\" style=\"font-family:Verdana, \" sans-serif\"\"=\"\"><span class=\"size\" style=\"font-size:10pt\"><a style=\"color: blue; cursor: pointer; text-decoration: underline\" target=\"_blank\" href=\"mailto:sunil@vert-age.com\">sunil@vert-age.com</a><b>//Web:<span>&nbsp;</span></b><a style=\"color: blue; cursor: pointer; text-decoration: underline\" target=\"_blank\" href=\"http://www.vert-age.com/\"><b>www.vert-age.com</b></a><b>&nbsp;</b></span></span><br></span></p></div><div style=\"color: rgb(0, 0, 0); font-family: \" lato=\"\" 2\",=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255)\"=\"\"><p style=\"margin: 0px\" class=\"\"><span class=\"size\" style=\"font-size: 12pt; margin: 0px;\"><b><span class=\"font\" style=\"font-family:Verdana, \" sans-serif\"\"=\"\"><span class=\"size\" style=\"font-size:10pt\">Address :- 1st Floor|| H-201 Sec-62|| Noida-201301</span></span></b><br></span></p></div><div style=\"color: rgb(0, 0, 0); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13.3333px; font-style: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; background-color: rgb(255, 255, 255)\"><br></div></div><br><div class=\"zmail_extra_hr\" style=\"border-top: 1px solid rgb(204, 204, 204); height: 0px; margin-top: 10px; margin-bottom: 10px; line-height: 0px;\"><br></div><div class=\"zmail_extra\" data-zbluepencil-ignore=\"true\"><div><br></div><div id=\"Zm-_Id_-Sgn1\">---- On Fri, 13 May 2022 11:18:36 +0530 <b>Ticket-Management-System <eticket@vert-age.com></eticket@vert-age.com></b> wrote ----<br></div><div><br></div><blockquote style=\"margin: 0px;\"><div><table align=\"center\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"margin :  0; padding :  10px 0 0 0;\" bgcolor=\"F8F8F8\"><tbody><tr><td align=\"center\"><table align=\"center\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse :  separate; border-spacing :  2px 5px; border :  1px solid #b7afaf; border-radius :  6px;\" bgcolor=\"#FFFFFF\"><tbody><tr><td align=\"center\" style=\"padding :  3px 5px 3px 5px; border-bottom :  1px solid #b7afaf;\"><a href=\"http://vert-age.com\" target=\"_blank\" style=\"float: left; color: rgb(0, 0, 238);\" data-zeanchor=\"true\"><img id=\"1652420924420110003_imgsrc_url_0\" alt=\"Logo\" src=\"http://letchats.com/socail_media/logo.png\"> </a><br></td></tr><tr><td bgcolor=\"#ffffff\" style=\"padding :  0px 8px 10px 8px;\"><table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\"><tbody><tr><td style=\"padding :  0px 0px 0px 0px; font-family :  Avenir,  sans-serif; font-size :  16px; color :  #000;\"><p style=\"line-height: 20px;\"><span class=\"colour\" style=\"color:rgb(0, 0, 0)\"><span class=\"size\" style=\"font-size: 13px; line-height: 20px;\">Hi <b>Sunil ,</b></span></span><br></p><p style=\"line-height: 20px;\"><span class=\"colour\" style=\"color:rgb(0, 0, 0)\"><span class=\"size\" style=\"font-size: 13px; line-height: 20px;\">Thanks for your Query. Our Support Team has received your ticket <b>2022051315,</b> We have assigned it and we are working on its resolution. You will  receive update as soon as possible.</span></span><br></p><p style=\"line-height: 20px;\"><span class=\"colour\" style=\"color:rgb(0, 0, 0)\"><span class=\"size\" style=\"font-size: 13px; line-height: 20px;\">Thank You.</span></span><br></p><p style=\"line-height: 0px;\"><span class=\"colour\" style=\"color:rgb(0, 0, 0)\"><span class=\"size\" style=\"font-size: 14px; line-height: 0px;\"><b>Xenottabyte Services Pvt. Ltd</b></span></span><br></p></td></tr></tbody></table></td></tr><tr><td bgcolor=\"#0179a9\" style=\"padding :  10px 10px 10px 10px;\"><table cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td width=\"360\" align=\"left\"><table cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td width=\"190\"><p style=\"margin: 0px;\"><span class=\"colour\" style=\"color:white\"><span class=\"size\" style=\"font-size: 14px; margin: 0px;\">H-201, Sector 63,<br> Noida, (U.P), 201301</span></span></p></td><td style=\"font-size :  0; line-height :  0;\" width=\"10\">&nbsp;&nbsp;&nbsp;&nbsp;<br></td><td style=\"font-size :  0; line-height :  0;\" width=\"10\">&nbsp;<br></td><td><a href=\"mailto:support@vert-age.com\" target=\"_blank\" style=\"color :  white; font-size :  14px;\">support@vert-age.com</a><br></td></tr></tbody></table></td><td align=\"right\" width=\"170\"><table cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td><a href=\"https://www.facebook.com/predictivedialersoftware\" target=\"_blank\" data-zeanchor=\"true\" style=\"color: rgb(0, 0, 238);\"><img id=\"1652420924420110003_imgsrc_url_1\" alt=\"facebook\" width=\"30\" height=\"30\" style=\"display :  block;\" src=\"http://letchats.com/socail_media/facebook.png\"></a></td><td style=\"font-size :  0; line-height :  0;\" width=\"10\">&nbsp;<br></td><td><a href=\"https://www.linkedin.com/company/vert-age-xenottabyte\" target=\"_blank\" data-zeanchor=\"true\" style=\"color: rgb(0, 0, 238);\"><img id=\"1652420924420110003_imgsrc_url_2\" alt=\"LinkedIn\" width=\"30\" height=\"30\" style=\"display :  block;\" src=\"http://letchats.com/socail_media/linkedin.png\"></a></td><td style=\"font-size :  0; line-height :  0;\" width=\"10\">&nbsp;<br></td><td><a href=\"https://twitter.com/age_vert\" target=\"_blank\" data-zeanchor=\"true\" style=\"color: rgb(0, 0, 238);\"><img id=\"1652420924420110003_imgsrc_url_3\" alt=\"Twitter\" width=\"30\" height=\"30\" style=\"display :  block;\" src=\"http://letchats.com/socail_media/twitter.png\"></a></td><td style=\"font-size :  0; line-height :  0;\" width=\"10\">&nbsp;<br></td><td><a href=\"https://www.instagram.com/vertage64/\" target=\"_blank\" data-zeanchor=\"true\" style=\"color: rgb(0, 0, 238);\"><img id=\"1652420924420110003_imgsrc_url_4\" alt=\"Linkedin\" width=\"30\" height=\"30\" style=\"display :  block;\" src=\"http://letchats.com/socail_media/instagram.png\"></a></td></tr></tbody></table></td></tr></tbody></table></td></tr></tbody></table></td></tr></tbody></table></div></blockquote></div></div><br>', 'SEN', NULL, '13290', 5, '1', '0', '0', '0', '1', '0', '1652421326', 'Sunil <sunil@vert-age.com>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, '2022-05-13 00:25:44', '2022-05-13 10:34:11'),
(7, '499', 0, NULL, 'Re: Successfully Register Ticket', NULL, 'Sunil <sunil@vert-age.com>', 'eticket@vert-age.com', NULL, NULL, '', '<180bbfc6f18.c6755ac8150720.2519823443257106673@vert-age.com>', '<22699ee421035e79fde05ac4dd005c4f@swift.generated>', '<22699ee421035e79fde05ac4dd005c4f@swift.generated>', '<br>gjgjg<br>\r\n								<hr>\r\n								<meta content=\"text/html;charset=UTF-8\" http-equiv=\"Content-Type\"><div style=\"font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10pt;\"><div>reopen</div><br><div id=\"Zm-_Id_-Sgn\" data-zbluepencil-ignore=\"true\" data-sigid=\"6073782000000411002\"><div style=\"color: rgb(0, 0, 0); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13.3333px; font-style: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; background-color: rgb(255, 255, 255)\"><b>Thanks &amp; Regards&nbsp;</b><br></div><div style=\"color: rgb(0, 0, 0); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13.3333px; font-style: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; background-color: rgb(255, 255, 255)\"><b>Sunil Rathore</b><br></div><div style=\"color: rgb(0, 0, 0); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13.3333px; font-style: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; background-color: rgb(255, 255, 255)\"><b>Sr PHP Developer </b><br></div><div style=\"color: rgb(0, 0, 0); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13.3333px; font-style: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; background-color: rgb(255, 255, 255)\"><b>XENOTTABYTE SERVICES PVT LTD</b><br></div><div style=\"color: rgb(0, 0, 0); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13.3333px; font-style: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; background-color: rgb(255, 255, 255)\"><b><br></b><span class=\"size\" style=\"font-size: 12pt; margin: 0px;\"><b><span class=\"font\" style=\"font-family:Verdana, &quot;sans-serif&quot;\"><span class=\"size\" style=\"font-size:10pt\">Landline No. -&nbsp;<span class=\"x_-1040127744size\"><span class=\"highlight\" style=\"background-color:white\"><span class=\"colour\" style=\"color: black; background-size: initial;\">+911206967401/Ext.-8010</span></span></span></span></span></b><br></span></div><div style=\"color: rgb(0, 0, 0); font-family: &quot;Lato 2&quot;, sans-serif; font-size: 14px; font-style: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; background-color: rgb(255, 255, 255)\"><p style=\"margin: 0px\" class=\"\"><span class=\"size\" style=\"font-size: 12pt; margin: 0px;\"><b><span class=\"font\" style=\"font-family:Verdana, &quot;sans-serif&quot;\"><span class=\"size\" style=\"font-size:10pt\">Email :-<span>&nbsp;</span></span></span></b><span class=\"font\" style=\"font-family:Verdana, &quot;sans-serif&quot;\"><span class=\"size\" style=\"font-size:10pt\"><a style=\"color: blue; cursor: pointer; text-decoration: underline\" target=\"_blank\" href=\"mailto:sunil@vert-age.com\">sunil@vert-age.com</a><b>//Web:<span>&nbsp;</span></b><a style=\"color: blue; cursor: pointer; text-decoration: underline\" target=\"_blank\" href=\"http://www.vert-age.com/\"><b>www.vert-age.com</b></a><b>&nbsp;</b></span></span><br></span></p></div><div style=\"color: rgb(0, 0, 0); font-family: &quot;Lato 2&quot;, sans-serif; font-size: 14px; font-style: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; background-color: rgb(255, 255, 255)\"><p style=\"margin: 0px\" class=\"\"><span class=\"size\" style=\"font-size: 12pt; margin: 0px;\"><b><span class=\"font\" style=\"font-family:Verdana, &quot;sans-serif&quot;\"><span class=\"size\" style=\"font-size:10pt\">Address :- 1st Floor|| H-201 Sec-62|| Noida-201301</span></span></b><br></span></p></div><div style=\"color: rgb(0, 0, 0); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13.3333px; font-style: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; background-color: rgb(255, 255, 255)\"><br></div></div><br><div class=\"zmail_extra_hr\" style=\"border-top: 1px solid rgb(204, 204, 204); height: 0px; margin-top: 10px; margin-bottom: 10px; line-height: 0px;\"><br></div><div class=\"zmail_extra\" data-zbluepencil-ignore=\"true\"><div><br></div><div id=\"Zm-_Id_-Sgn1\">---- On Fri, 13 May 2022 11:18:36 +0530 <b>Ticket-Management-System &lt;eticket@vert-age.com&gt;</b> wrote ----<br></div><div><br></div><blockquote style=\"margin: 0px;\"><div><table align=\"center\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"margin :  0; padding :  10px 0 0 0;\" bgcolor=\"F8F8F8\"><tbody><tr><td align=\"center\"><table align=\"center\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse :  separate; border-spacing :  2px 5px; border :  1px solid #b7afaf; border-radius :  6px;\" bgcolor=\"#FFFFFF\"><tbody><tr><td align=\"center\" style=\"padding :  3px 5px 3px 5px; border-bottom :  1px solid #b7afaf;\"><a href=\"http://vert-age.com\" target=\"_blank\" style=\"float: left; color: rgb(0, 0, 238);\" data-zeanchor=\"true\"><img id=\"1652420924420110003_imgsrc_url_0\" alt=\"Logo\" src=\"http://letchats.com/socail_media/logo.png\"> </a><br></td></tr><tr><td bgcolor=\"#ffffff\" style=\"padding :  0px 8px 10px 8px;\"><table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\"><tbody><tr><td style=\"padding :  0px 0px 0px 0px; font-family :  Avenir,  sans-serif; font-size :  16px; color :  #000;\"><p style=\"line-height: 20px;\"><span class=\"colour\" style=\"color:rgb(0, 0, 0)\"><span class=\"size\" style=\"font-size: 13px; line-height: 20px;\">Hi <b>Sunil ,</b></span></span><br></p><p style=\"line-height: 20px;\"><span class=\"colour\" style=\"color:rgb(0, 0, 0)\"><span class=\"size\" style=\"font-size: 13px; line-height: 20px;\">Thanks for your Query. Our Support Team has received your ticket <b>2022051315,</b> We have assigned it and we are working on its resolution. You will  receive update as soon as possible.</span></span><br></p><p style=\"line-height: 20px;\"><span class=\"colour\" style=\"color:rgb(0, 0, 0)\"><span class=\"size\" style=\"font-size: 13px; line-height: 20px;\">Thank You.</span></span><br></p><p style=\"line-height: 0px;\"><span class=\"colour\" style=\"color:rgb(0, 0, 0)\"><span class=\"size\" style=\"font-size: 14px; line-height: 0px;\"><b>Xenottabyte Services Pvt. Ltd</b></span></span><br></p></td></tr></tbody></table></td></tr><tr><td bgcolor=\"#0179a9\" style=\"padding :  10px 10px 10px 10px;\"><table cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td width=\"360\" align=\"left\"><table cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td width=\"190\"><p style=\"margin: 0px;\"><span class=\"colour\" style=\"color:white\"><span class=\"size\" style=\"font-size: 14px; margin: 0px;\">H-201, Sector 63,<br> Noida, (U.P), 201301</span></span></p></td><td style=\"font-size :  0; line-height :  0;\" width=\"10\">&nbsp;&nbsp;&nbsp;&nbsp;<br></td><td style=\"font-size :  0; line-height :  0;\" width=\"10\">&nbsp;<br></td><td><a href=\"mailto:support@vert-age.com\" target=\"_blank\" style=\"color :  white; font-size :  14px;\">support@vert-age.com</a><br></td></tr></tbody></table></td><td align=\"right\" width=\"170\"><table cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td><a href=\"https://www.facebook.com/predictivedialersoftware\" target=\"_blank\" data-zeanchor=\"true\" style=\"color: rgb(0, 0, 238);\"><img id=\"1652420924420110003_imgsrc_url_1\" alt=\"facebook\" width=\"30\" height=\"30\" style=\"display :  block;\" src=\"http://letchats.com/socail_media/facebook.png\"></a></td><td style=\"font-size :  0; line-height :  0;\" width=\"10\">&nbsp;<br></td><td><a href=\"https://www.linkedin.com/company/vert-age-xenottabyte\" target=\"_blank\" data-zeanchor=\"true\" style=\"color: rgb(0, 0, 238);\"><img id=\"1652420924420110003_imgsrc_url_2\" alt=\"LinkedIn\" width=\"30\" height=\"30\" style=\"display :  block;\" src=\"http://letchats.com/socail_media/linkedin.png\"></a></td><td style=\"font-size :  0; line-height :  0;\" width=\"10\">&nbsp;<br></td><td><a href=\"https://twitter.com/age_vert\" target=\"_blank\" data-zeanchor=\"true\" style=\"color: rgb(0, 0, 238);\"><img id=\"1652420924420110003_imgsrc_url_3\" alt=\"Twitter\" width=\"30\" height=\"30\" style=\"display :  block;\" src=\"http://letchats.com/socail_media/twitter.png\"></a></td><td style=\"font-size :  0; line-height :  0;\" width=\"10\">&nbsp;<br></td><td><a href=\"https://www.instagram.com/vertage64/\" target=\"_blank\" data-zeanchor=\"true\" style=\"color: rgb(0, 0, 238);\"><img id=\"1652420924420110003_imgsrc_url_4\" alt=\"Linkedin\" width=\"30\" height=\"30\" style=\"display :  block;\" src=\"http://letchats.com/socail_media/instagram.png\"></a></td></tr></tbody></table></td></tr></tbody></table></td></tr></tbody></table></td></tr></tbody></table></div></blockquote></div></div><br>', 'SEN', 'fwd', '13290', 5, '1', '0', '0', '0', '1', '0', '1652421326', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, '2022-05-13 05:02:47', '2022-05-13 05:03:11');
INSERT INTO `process_email2` (`id`, `uid`, `rid`, `ticket_number`, `subject`, `toaddress`, `from1`, `to1`, `cc_address`, `attachment`, `date1`, `message_id`, `references`, `in_reply_to`, `message`, `page`, `send_type`, `size`, `msgno`, `recent`, `flagged`, `answered`, `deleted`, `seen`, `draft`, `udate`, `fromaddress`, `reply_toaddress`, `reply_to`, `senderaddress`, `sender`, `unseen`, `to_mailbox`, `to_host`, `from_personal`, `from_mailbox`, `from_host`, `reply_to_personal`, `reply_to_mailbox`, `reply_to_host`, `sender_personal`, `sender_mailbox`, `starred`, `important`, `email_send`, `created_at`, `updated_at`) VALUES
(8, '499', 499, '2022051320', 'Re: Successfully Register Ticket', NULL, 'Sunil <sunil@vert-age.com>', 'eticket@vert-age.com', NULL, NULL, '', '<180bbfc6f18.c6755ac8150720.2519823443257106673@vert-age.com>', '<22699ee421035e79fde05ac4dd005c4f@swift.generated>', '<22699ee421035e79fde05ac4dd005c4f@swift.generated>', '<br>hello<br>\r\n								<hr>\r\n								<br>gfdfd<br>\r\n								<hr>\r\n								<br>gjgjg<br>\r\n								<hr>\r\n								<meta content=\"text/html;charset=UTF-8\" http-equiv=\"Content-Type\"><div style=\"font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10pt;\"><div>reopen</div><br><div id=\"Zm-_Id_-Sgn\" data-zbluepencil-ignore=\"true\" data-sigid=\"6073782000000411002\"><div style=\"color: rgb(0, 0, 0); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13.3333px; font-style: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; background-color: rgb(255, 255, 255)\"><b>Thanks &amp; Regards&nbsp;</b><br></div><div style=\"color: rgb(0, 0, 0); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13.3333px; font-style: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; background-color: rgb(255, 255, 255)\"><b>Sunil Rathore</b><br></div><div style=\"color: rgb(0, 0, 0); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13.3333px; font-style: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; background-color: rgb(255, 255, 255)\"><b>Sr PHP Developer </b><br></div><div style=\"color: rgb(0, 0, 0); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13.3333px; font-style: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; background-color: rgb(255, 255, 255)\"><b>XENOTTABYTE SERVICES PVT LTD</b><br></div><div style=\"color: rgb(0, 0, 0); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13.3333px; font-style: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; background-color: rgb(255, 255, 255)\"><b><br></b><span class=\"size\" style=\"font-size: 12pt; margin: 0px;\"><b><span class=\"font\" style=\"font-family:Verdana, \" sans-serif\"\"=\"\"><span class=\"size\" style=\"font-size:10pt\">Landline No. -&nbsp;<span class=\"x_-1040127744size\"><span class=\"highlight\" style=\"background-color:white\"><span class=\"colour\" style=\"color: black; background-size: initial;\">+911206967401/Ext.-8010</span></span></span></span></span></b><br></span></div><div style=\"color: rgb(0, 0, 0); font-family: \" lato=\"\" 2\",=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255)\"=\"\"><p style=\"margin: 0px\" class=\"\"><span class=\"size\" style=\"font-size: 12pt; margin: 0px;\"><b><span class=\"font\" style=\"font-family:Verdana, \" sans-serif\"\"=\"\"><span class=\"size\" style=\"font-size:10pt\">Email :-<span>&nbsp;</span></span></span></b><span class=\"font\" style=\"font-family:Verdana, \" sans-serif\"\"=\"\"><span class=\"size\" style=\"font-size:10pt\"><a style=\"color: blue; cursor: pointer; text-decoration: underline\" target=\"_blank\" href=\"mailto:sunil@vert-age.com\">sunil@vert-age.com</a><b>//Web:<span>&nbsp;</span></b><a style=\"color: blue; cursor: pointer; text-decoration: underline\" target=\"_blank\" href=\"http://www.vert-age.com/\"><b>www.vert-age.com</b></a><b>&nbsp;</b></span></span><br></span></p></div><div style=\"color: rgb(0, 0, 0); font-family: \" lato=\"\" 2\",=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255)\"=\"\"><p style=\"margin: 0px\" class=\"\"><span class=\"size\" style=\"font-size: 12pt; margin: 0px;\"><b><span class=\"font\" style=\"font-family:Verdana, \" sans-serif\"\"=\"\"><span class=\"size\" style=\"font-size:10pt\">Address :- 1st Floor|| H-201 Sec-62|| Noida-201301</span></span></b><br></span></p></div><div style=\"color: rgb(0, 0, 0); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13.3333px; font-style: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; background-color: rgb(255, 255, 255)\"><br></div></div><br><div class=\"zmail_extra_hr\" style=\"border-top: 1px solid rgb(204, 204, 204); height: 0px; margin-top: 10px; margin-bottom: 10px; line-height: 0px;\"><br></div><div class=\"zmail_extra\" data-zbluepencil-ignore=\"true\"><div><br></div><div id=\"Zm-_Id_-Sgn1\">---- On Fri, 13 May 2022 11:18:36 +0530 <b>Ticket-Management-System <eticket@vert-age.com></eticket@vert-age.com></b> wrote ----<br></div><div><br></div><blockquote style=\"margin: 0px;\"><div><table align=\"center\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"margin :  0; padding :  10px 0 0 0;\" bgcolor=\"F8F8F8\"><tbody><tr><td align=\"center\"><table align=\"center\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse :  separate; border-spacing :  2px 5px; border :  1px solid #b7afaf; border-radius :  6px;\" bgcolor=\"#FFFFFF\"><tbody><tr><td align=\"center\" style=\"padding :  3px 5px 3px 5px; border-bottom :  1px solid #b7afaf;\"><a href=\"http://vert-age.com\" target=\"_blank\" style=\"float: left; color: rgb(0, 0, 238);\" data-zeanchor=\"true\"><img id=\"1652420924420110003_imgsrc_url_0\" alt=\"Logo\" src=\"http://letchats.com/socail_media/logo.png\"> </a><br></td></tr><tr><td bgcolor=\"#ffffff\" style=\"padding :  0px 8px 10px 8px;\"><table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\"><tbody><tr><td style=\"padding :  0px 0px 0px 0px; font-family :  Avenir,  sans-serif; font-size :  16px; color :  #000;\"><p style=\"line-height: 20px;\"><span class=\"colour\" style=\"color:rgb(0, 0, 0)\"><span class=\"size\" style=\"font-size: 13px; line-height: 20px;\">Hi <b>Sunil ,</b></span></span><br></p><p style=\"line-height: 20px;\"><span class=\"colour\" style=\"color:rgb(0, 0, 0)\"><span class=\"size\" style=\"font-size: 13px; line-height: 20px;\">Thanks for your Query. Our Support Team has received your ticket <b>2022051315,</b> We have assigned it and we are working on its resolution. You will  receive update as soon as possible.</span></span><br></p><p style=\"line-height: 20px;\"><span class=\"colour\" style=\"color:rgb(0, 0, 0)\"><span class=\"size\" style=\"font-size: 13px; line-height: 20px;\">Thank You.</span></span><br></p><p style=\"line-height: 0px;\"><span class=\"colour\" style=\"color:rgb(0, 0, 0)\"><span class=\"size\" style=\"font-size: 14px; line-height: 0px;\"><b>Xenottabyte Services Pvt. Ltd</b></span></span><br></p></td></tr></tbody></table></td></tr><tr><td bgcolor=\"#0179a9\" style=\"padding :  10px 10px 10px 10px;\"><table cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td width=\"360\" align=\"left\"><table cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td width=\"190\"><p style=\"margin: 0px;\"><span class=\"colour\" style=\"color:white\"><span class=\"size\" style=\"font-size: 14px; margin: 0px;\">H-201, Sector 63,<br> Noida, (U.P), 201301</span></span></p></td><td style=\"font-size :  0; line-height :  0;\" width=\"10\">&nbsp;&nbsp;&nbsp;&nbsp;<br></td><td style=\"font-size :  0; line-height :  0;\" width=\"10\">&nbsp;<br></td><td><a href=\"mailto:support@vert-age.com\" target=\"_blank\" style=\"color :  white; font-size :  14px;\">support@vert-age.com</a><br></td></tr></tbody></table></td><td align=\"right\" width=\"170\"><table cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td><a href=\"https://www.facebook.com/predictivedialersoftware\" target=\"_blank\" data-zeanchor=\"true\" style=\"color: rgb(0, 0, 238);\"><img id=\"1652420924420110003_imgsrc_url_1\" alt=\"facebook\" width=\"30\" height=\"30\" style=\"display :  block;\" src=\"http://letchats.com/socail_media/facebook.png\"></a></td><td style=\"font-size :  0; line-height :  0;\" width=\"10\">&nbsp;<br></td><td><a href=\"https://www.linkedin.com/company/vert-age-xenottabyte\" target=\"_blank\" data-zeanchor=\"true\" style=\"color: rgb(0, 0, 238);\"><img id=\"1652420924420110003_imgsrc_url_2\" alt=\"LinkedIn\" width=\"30\" height=\"30\" style=\"display :  block;\" src=\"http://letchats.com/socail_media/linkedin.png\"></a></td><td style=\"font-size :  0; line-height :  0;\" width=\"10\">&nbsp;<br></td><td><a href=\"https://twitter.com/age_vert\" target=\"_blank\" data-zeanchor=\"true\" style=\"color: rgb(0, 0, 238);\"><img id=\"1652420924420110003_imgsrc_url_3\" alt=\"Twitter\" width=\"30\" height=\"30\" style=\"display :  block;\" src=\"http://letchats.com/socail_media/twitter.png\"></a></td><td style=\"font-size :  0; line-height :  0;\" width=\"10\">&nbsp;<br></td><td><a href=\"https://www.instagram.com/vertage64/\" target=\"_blank\" data-zeanchor=\"true\" style=\"color: rgb(0, 0, 238);\"><img id=\"1652420924420110003_imgsrc_url_4\" alt=\"Linkedin\" width=\"30\" height=\"30\" style=\"display :  block;\" src=\"http://letchats.com/socail_media/instagram.png\"></a></td></tr></tbody></table></td></tr></tbody></table></td></tr></tbody></table></td></tr></tbody></table></div></blockquote></div></div><br>', 'IN', 'reply', '13290', 5, '1', '0', '0', '0', '1', '0', '1652421326', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2022-05-13 05:03:19', '2022-05-13 05:04:26'),
(9, '498', 498, '2022051315', 'Testing....', NULL, 'Sunil <sunil@vert-age.com>', 'eticket@vert-age.com', NULL, NULL, '', '<180bbf5f63d.eec9125e149400.8475932264321457581@vert-age.com>', NULL, NULL, 'sunil<br><br>\r\n								<hr>\r\n								hi<br><br>\r\n								<hr>\r\n								<meta content=\"text/html;charset=UTF-8\" http-equiv=\"Content-Type\"><div style=\"font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10pt;\"><div>test<br></div><div><br></div><div><br></div><div class=\"zmail_signature_below\"><div id=\"\" data-zbluepencil-ignore=\"true\" data-sigid=\"6073782000000411002\"><div style=\"color: rgb(0, 0, 0); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13.3333px; font-style: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; background-color: rgb(255, 255, 255)\"><b>Thanks &amp; Regards&nbsp;</b><br></div><div style=\"color: rgb(0, 0, 0); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13.3333px; font-style: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; background-color: rgb(255, 255, 255)\"><b>Sunil Rathore</b><br></div><div style=\"color: rgb(0, 0, 0); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13.3333px; font-style: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; background-color: rgb(255, 255, 255)\"><b>Sr PHP Developer </b><br></div><div style=\"color: rgb(0, 0, 0); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13.3333px; font-style: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; background-color: rgb(255, 255, 255)\"><b>XENOTTABYTE SERVICES PVT LTD</b><br></div><div style=\"color: rgb(0, 0, 0); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13.3333px; font-style: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; background-color: rgb(255, 255, 255)\"><b><br></b><span class=\"size\" style=\"font-size: 12pt; margin: 0px;\"><b><span class=\"font\" style=\"font-family:Verdana, \" sans-serif\"\"=\"\"><span class=\"size\" style=\"font-size:10pt\">Landline No. -&nbsp;<span class=\"x_-1040127744size\"><span class=\"highlight\" style=\"background-color:white\"><span class=\"colour\" style=\"color: black; background-size: initial;\">+911206967401/Ext.-8010</span></span></span></span></span></b><br></span></div><div style=\"color: rgb(0, 0, 0); font-family: \" lato=\"\" 2\",=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255)\"=\"\"><p style=\"margin: 0px\" class=\"\"><span class=\"size\" style=\"font-size: 12pt; margin: 0px;\"><b><span class=\"font\" style=\"font-family:Verdana, \" sans-serif\"\"=\"\"><span class=\"size\" style=\"font-size:10pt\">Email :-<span>&nbsp;</span></span></span></b><span class=\"font\" style=\"font-family:Verdana, \" sans-serif\"\"=\"\"><span class=\"size\" style=\"font-size:10pt\"><a style=\"color: blue; cursor: pointer; text-decoration: underline\" target=\"_blank\" href=\"mailto:sunil@vert-age.com\">sunil@vert-age.com</a><b>//Web:<span>&nbsp;</span></b><a style=\"color: blue; cursor: pointer; text-decoration: underline\" target=\"_blank\" href=\"http://www.vert-age.com/\"><b>www.vert-age.com</b></a><b>&nbsp;</b></span></span><br></span></p></div><div style=\"color: rgb(0, 0, 0); font-family: \" lato=\"\" 2\",=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255)\"=\"\"><p style=\"margin: 0px\" class=\"\"><span class=\"size\" style=\"font-size: 12pt; margin: 0px;\"><b><span class=\"font\" style=\"font-family:Verdana, \" sans-serif\"\"=\"\"><span class=\"size\" style=\"font-size:10pt\">Address :- 1st Floor|| H-201 Sec-62|| Noida-201301</span></span></b><br></span></p></div><div style=\"color: rgb(0, 0, 0); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13.3333px; font-style: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; background-color: rgb(255, 255, 255)\"><br></div></div></div><div><br></div></div><br>', 'IN', 'reply', '7372', 4, '1', '0', '0', '0', '1', '0', '1652420900', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2022-05-13 05:26:09', '2022-05-13 05:41:55');

-- --------------------------------------------------------

--
-- Table structure for table `process_email_attachment`
--

CREATE TABLE `process_email_attachment` (
  `id` int(11) NOT NULL,
  `uid` bigint(20) DEFAULT NULL,
  `file` varchar(500) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `process_email_cc`
--

CREATE TABLE `process_email_cc` (
  `id` int(11) NOT NULL,
  `uid` varchar(250) NOT NULL,
  `cc_email` varchar(250) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `process_email_send`
--

CREATE TABLE `process_email_send` (
  `id` int(11) NOT NULL,
  `uid` bigint(20) DEFAULT NULL,
  `subject` varchar(250) DEFAULT NULL,
  `toaddress` varchar(250) DEFAULT NULL,
  `from1` varchar(250) DEFAULT NULL,
  `to1` varchar(250) DEFAULT NULL,
  `attachment` varchar(500) DEFAULT NULL,
  `date1` varchar(100) DEFAULT NULL,
  `message_id` varchar(250) DEFAULT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL,
  `msgno` bigint(20) DEFAULT NULL,
  `recent` varchar(250) DEFAULT NULL,
  `flagged` varchar(250) DEFAULT NULL,
  `answered` varchar(250) DEFAULT NULL,
  `deleted` varchar(100) DEFAULT NULL,
  `seen` varchar(100) DEFAULT NULL,
  `draft` varchar(100) DEFAULT NULL,
  `udate` varchar(100) DEFAULT NULL,
  `fromaddress` varchar(250) DEFAULT NULL,
  `reply_toaddress` varchar(250) DEFAULT NULL,
  `reply_to` varchar(250) DEFAULT NULL,
  `senderaddress` varchar(250) DEFAULT NULL,
  `sender` varchar(250) DEFAULT NULL,
  `unseen` varchar(250) DEFAULT NULL,
  `to_mailbox` varchar(250) DEFAULT NULL,
  `to_host` varchar(250) DEFAULT NULL,
  `from_personal` varchar(250) DEFAULT NULL,
  `from_mailbox` varchar(250) DEFAULT NULL,
  `from_host` varchar(250) DEFAULT NULL,
  `reply_to_personal` varchar(255) DEFAULT NULL,
  `reply_to_mailbox` varchar(250) DEFAULT NULL,
  `reply_to_host` varchar(250) DEFAULT NULL,
  `sender_personal` varchar(250) DEFAULT NULL,
  `sender_mailbox` varchar(250) DEFAULT NULL,
  `page` varchar(50) DEFAULT NULL,
  `starred` int(11) NOT NULL DEFAULT 0,
  `important` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `process_email_send`
--

INSERT INTO `process_email_send` (`id`, `uid`, `subject`, `toaddress`, `from1`, `to1`, `attachment`, `date1`, `message_id`, `message`, `size`, `msgno`, `recent`, `flagged`, `answered`, `deleted`, `seen`, `draft`, `udate`, `fromaddress`, `reply_toaddress`, `reply_to`, `senderaddress`, `sender`, `unseen`, `to_mailbox`, `to_host`, `from_personal`, `from_mailbox`, `from_host`, `reply_to_personal`, `reply_to_mailbox`, `reply_to_host`, `sender_personal`, `sender_mailbox`, `page`, `starred`, `important`, `created_at`, `updated_at`) VALUES
(1, 1, 'Test Demo', NULL, 'eticket@vert-age.com', 'sunil@vert-age.com', NULL, '', '965966', 'dsadad', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'eticket@vert-age.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SEN', 0, 0, '2022-05-13 04:48:01', '2022-05-13 04:48:01');

-- --------------------------------------------------------

--
-- Table structure for table `process_knowledge_base`
--

CREATE TABLE `process_knowledge_base` (
  `id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `kb_titel` varchar(250) DEFAULT NULL,
  `solution` longtext DEFAULT NULL,
  `meta_keywords` varchar(250) DEFAULT NULL,
  `meta_description` varchar(250) DEFAULT NULL,
  `meta_titel` varchar(250) DEFAULT NULL,
  `created_by` varchar(250) DEFAULT NULL,
  `publish` int(11) NOT NULL DEFAULT 0,
  `category_name` varchar(100) DEFAULT NULL,
  `sub_category` varchar(100) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `process_knowledge_base`
--

INSERT INTO `process_knowledge_base` (`id`, `created_at`, `kb_titel`, `solution`, `meta_keywords`, `meta_description`, `meta_titel`, `created_by`, `publish`, `category_name`, `sub_category`, `updated_at`) VALUES
(70, '2021-07-28 16:33:50', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit', '<div style=\"text-align: justify;\">Lorem ipsum dolor sit amet, consectetuer adipiscing elitLorem ipsum dolor sit amet, consectetuer adipiscing elitLorem ipsum dolor sit amet, consectetuer adipiscing elitLorem ipsum dolor sit amet, consectetuer adipiscing elitLorem ipsum dolor sit amet, consectetuer adipiscing elitLorem ipsum dolor sit amet, consectetuer adipiscing elitLorem ipsum dolor sit amet, consectetuer adipiscing elitLorem ipsum dolor sit amet, consectetuer adipiscing elit<br></div>', NULL, NULL, NULL, 'Sunil', 1, 'Software', 'Dialer', '2021-07-28 16:33:52'),
(71, '2021-07-28 16:40:12', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit', '<div style=\"text-align: justify;\">Lorem ipsum dolor sit amet, consectetuer adipiscing elitLorem ipsum dolor sit amet, consectetuer adipiscing elitLorem ipsum dolor sit amet, consectetuer adipiscing elitLorem ipsum dolor sit amet, consectetuer adipiscing elitLorem ipsum dolor sit amet, consectetuer adipiscing elitLorem ipsum dolor sit amet, consectetuer adipiscing elitLorem ipsum dolor sit amet, consectetuer adipiscing elitLorem ipsum dolor sit amet, consectetuer adipiscing elit<br></div>', NULL, NULL, NULL, 'Sunil', 1, 'Hardware', 'GSM Geteway', '2021-07-28 16:40:13'),
(72, '2021-11-03 01:05:11', 'It is a long established fact', '<div><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters</span><br></div>', NULL, NULL, NULL, 'Admin', 1, 'Software', NULL, '2021-11-03 01:05:15'),
(73, '2021-11-03 01:06:34', 'Lorem Ipsum is simply dummy', '<div><strong style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">Lorem Ipsum</strong><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,</span><br></div>', NULL, NULL, NULL, 'Admin', 1, 'Software', 'CRM', '2021-11-03 01:06:36'),
(74, '2021-12-22 09:58:42', 'hard', '<div>9669</div>', NULL, NULL, NULL, 'Admin', 1, 'Hardware', NULL, '2021-12-22 09:58:43');

-- --------------------------------------------------------

--
-- Table structure for table `process_list`
--

CREATE TABLE `process_list` (
  `id` int(11) NOT NULL,
  `process_id` varchar(250) NOT NULL,
  `process_name` varchar(250) NOT NULL,
  `created_date` varchar(250) NOT NULL,
  `status` varchar(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `process_list`
--

INSERT INTO `process_list` (`id`, `process_id`, `process_name`, `created_date`, `status`, `created_at`, `updated_at`) VALUES
(39, '72375898', 'lead', '2020-05-11', 'Y', '2020-12-23 10:20:52', '2020-12-24 09:24:36'),
(40, '24568176', 'indiamart', '2020-05-12', 'Y', '2020-12-23 10:20:52', '2020-12-24 09:24:15'),
(41, '66146583', 'customer', '2020-05-15', 'Y', '2020-12-23 10:20:52', NULL),
(42, '12535562', 'user', '2020-05-16', 'Y', '2020-12-23 10:20:52', NULL),
(43, '27098405', 'ticket', '2020-05-16', 'Y', '2020-12-23 10:20:52', '2020-12-24 09:21:19'),
(44, '83127486', 'product', '2020-05-23', 'Y', '2020-12-23 10:20:52', '2020-12-24 09:21:28'),
(45, '50508775', 'category', '2020-05-23', 'Y', '2020-12-23 10:20:52', '2020-12-24 09:22:25'),
(46, '2762267', 'source', '2020-05-27', 'Y', '2020-12-23 10:20:52', '2020-12-24 09:22:35'),
(47, '27178500', 'rcs', '2020-06-22', 'Y', '2020-12-23 10:20:52', '2020-12-24 09:23:07'),
(48, '45773764', 'knowledge_base', '2020-06-22', 'Y', '2020-12-23 10:20:52', '2020-12-24 09:23:28'),
(49, '79103293', 'email', '2020-06-25', 'Y', '2020-12-23 10:20:52', '2020-12-24 09:23:38');

-- --------------------------------------------------------

--
-- Table structure for table `process_log`
--

CREATE TABLE `process_log` (
  `id` int(11) NOT NULL,
  `customer_id` varchar(250) DEFAULT NULL,
  `lead_id` varchar(250) DEFAULT NULL,
  `ticket_id` varchar(250) DEFAULT NULL,
  `ticket_number` varchar(250) DEFAULT NULL,
  `process_name` varchar(250) DEFAULT NULL,
  `case_status` varchar(250) DEFAULT NULL,
  `price` varchar(250) DEFAULT NULL,
  `system_remark` text DEFAULT NULL,
  `feadback` text DEFAULT NULL,
  `resolution` text DEFAULT NULL,
  `task` text DEFAULT NULL,
  `user_id` varchar(250) DEFAULT NULL,
  `user_name` varchar(250) DEFAULT NULL,
  `modified_date` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `level_name` varchar(250) DEFAULT NULL,
  `discount` int(250) DEFAULT NULL,
  `follow` varchar(250) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `sub_status` varchar(250) DEFAULT NULL,
  `feedback_status` bigint(20) NOT NULL DEFAULT 0,
  `owner` varchar(250) DEFAULT NULL,
  `noti_read` int(11) NOT NULL DEFAULT 0,
  `transfer_case` varchar(100) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `assign_note` text DEFAULT NULL,
  `delivery_date` varchar(255) DEFAULT NULL,
  `delivery_time` varchar(100) DEFAULT NULL,
  `notifications` int(11) NOT NULL DEFAULT 2,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `process_log`
--

INSERT INTO `process_log` (`id`, `customer_id`, `lead_id`, `ticket_id`, `ticket_number`, `process_name`, `case_status`, `price`, `system_remark`, `feadback`, `resolution`, `task`, `user_id`, `user_name`, `modified_date`, `level_name`, `discount`, `follow`, `status`, `sub_status`, `feedback_status`, `owner`, `noti_read`, `transfer_case`, `note`, `assign_note`, `delivery_date`, `delivery_time`, `notifications`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, NULL, '202205091', 'HISTORY', 'Ticket Created', NULL, ' New ticket has been created by Admin', 'Ticket has been created . the ticket Number is 202205091.', NULL, NULL, '965966', 'Admin', '2022-05-15 07:51:21', NULL, NULL, NULL, 'New', 'New', 0, 'Siddharth Singh', 1, NULL, NULL, NULL, NULL, NULL, 2, '2022-05-09 08:00:49', '2022-05-15 02:21:21'),
(2, NULL, NULL, NULL, '202205092', 'HISTORY', 'Ticket Created', NULL, ' New ticket has been created by mail of Sunil ', 'Ticket has been created . the ticket Number is 202205092.', NULL, NULL, '1', 'Sunil ', '2022-05-15 04:59:32', NULL, NULL, NULL, 'New', 'New', 0, 'Admin', 1, NULL, 'Not work for support', NULL, NULL, NULL, 2, '2022-05-09 09:33:40', '2022-05-14 23:29:32'),
(3, NULL, NULL, NULL, '202205093', 'HISTORY', 'Ticket Created', NULL, ' New ticket has been created by mail of Sunil ', 'Ticket has been created . the ticket Number is 202205093.', NULL, NULL, '1', 'Sunil ', '2022-05-09 11:42:54', NULL, NULL, NULL, 'New', 'New', 0, 'Admin', 0, NULL, 'Not work for support', NULL, NULL, NULL, 2, '2022-05-09 09:50:22', '2022-05-09 11:42:54'),
(4, NULL, NULL, NULL, '202205091', 'HISTORY', 'Ticket assigned', NULL, 'This ticket assigned to sunil kumar assign by Siddharth Singh', 'Siddharth Singh Assigned the ticket', NULL, NULL, '49', 'Siddharth Singh', '2022-05-15 07:51:21', NULL, NULL, NULL, 'Open', 'Open', 0, 'sunil kumar', 1, NULL, NULL, NULL, NULL, NULL, 2, '2022-05-09 10:01:41', '2022-05-15 02:21:21'),
(5, NULL, NULL, NULL, '202205091', 'HISTORY', 'Ticket status changed', NULL, 'This ticket status changed by sunil kumar. Status changed from Open to Follow-up', 'Working...', NULL, NULL, '52', 'sunil kumar', '2022-05-15 07:51:21', NULL, NULL, NULL, 'Follow-up', 'Follow', 0, 'sunil kumar', 1, NULL, NULL, NULL, '2022-05-09', '16:08', 2, '2022-05-09 10:03:29', '2022-05-15 02:21:21'),
(6, NULL, NULL, NULL, '202205092', 'HISTORY', 'Ticket assigned', NULL, 'This ticket assigned to Deepak Swami assign by Admin', 'Admin Assigned the ticket', NULL, NULL, '1', 'Admin', '2022-05-09 11:39:07', NULL, NULL, NULL, 'Open', 'Open', 0, 'Deepak Swami', 0, NULL, NULL, NULL, NULL, NULL, 2, '2022-05-09 11:39:07', '2022-05-09 11:39:07'),
(7, NULL, NULL, NULL, '202205093', 'HISTORY', 'Ticket assigned', NULL, 'This ticket assigned to Deepak Swami assign by Admin', 'Admin Assigned the ticket', NULL, NULL, '1', 'Admin', '2022-05-09 11:41:09', NULL, NULL, NULL, 'Open', 'Open', 0, 'Deepak Swami', 0, NULL, NULL, NULL, NULL, NULL, 2, '2022-05-09 11:41:09', '2022-05-09 11:41:09'),
(8, NULL, NULL, NULL, '202205092', 'HISTORY', 'Ticket Transfer', NULL, 'Ticket has been changed by Development by Deepak Swami', 'Ticket has been changed by Development . the ticket Number is 202205092', NULL, NULL, '26451', 'Deepak Swami', '2022-05-09 11:42:43', NULL, NULL, NULL, 'Open', 'Open', 0, 'Admin', 0, NULL, NULL, NULL, NULL, NULL, 2, '2022-05-09 11:42:43', '2022-05-09 11:42:43'),
(9, NULL, NULL, NULL, '202205093', 'HISTORY', 'Ticket Transfer', NULL, 'Ticket has been changed by Development by Deepak Swami', 'Ticket has been changed by Development . the ticket Number is 202205093', NULL, NULL, '26451', 'Deepak Swami', '2022-05-09 11:42:54', NULL, NULL, NULL, 'Open', 'Open', 0, 'Admin', 0, NULL, NULL, NULL, NULL, NULL, 2, '2022-05-09 11:42:54', '2022-05-09 11:42:54'),
(10, NULL, NULL, NULL, '202205092', 'HISTORY', 'Ticket status changed', NULL, 'This ticket status changed by Siddharth Singh. Status changed from Open to Follow-up', 'work', NULL, NULL, '49', 'Siddharth Singh', '2022-05-09 11:44:17', NULL, NULL, NULL, 'Follow-up', 'Follow', 0, 'Transfer', 0, NULL, NULL, NULL, '2022-05-09', '19:00', 2, '2022-05-09 11:44:17', '2022-05-09 11:44:17'),
(11, NULL, NULL, NULL, '202205092', 'HISTORY', 'Ticket status changed', NULL, 'This ticket status changed by Siddharth Singh. Status changed from Follow-up to Closed', 'Done', 'test', NULL, '49', 'Siddharth Singh', '2022-05-09 11:55:51', NULL, NULL, NULL, 'Closed', 'Closed', 0, 'Transfer', 0, NULL, NULL, NULL, NULL, NULL, 2, '2022-05-09 11:55:51', '2022-05-09 11:55:51'),
(12, NULL, NULL, NULL, '202205104', 'HISTORY', 'Ticket Created', NULL, ' New ticket has been created by santosh', 'Ticket has been created . the ticket Number is 202205104.', NULL, NULL, '48444', 'santosh', '2022-05-15 05:56:44', NULL, NULL, NULL, 'New', 'New', 0, 'Siddharth Singh', 1, NULL, NULL, NULL, NULL, NULL, 2, '2022-05-10 04:44:20', '2022-05-15 00:26:44'),
(13, NULL, NULL, NULL, '202205105', 'HISTORY', 'Ticket Created', NULL, ' New ticket has been created by mail of Sunil ', 'Ticket has been created . the ticket Number is 202205105.', NULL, NULL, '1', 'Sunil ', '2022-05-15 05:57:11', NULL, NULL, NULL, 'New', 'New', 0, 'Admin', 1, NULL, NULL, NULL, NULL, NULL, 2, '2022-05-10 07:07:06', '2022-05-15 00:27:11'),
(14, NULL, NULL, NULL, '202205105', 'HISTORY', 'Ticket assigned', NULL, 'This ticket assigned to Siddharth Singh assign by Admin', 'Admin Assigned the ticket', NULL, NULL, '1', 'Admin', '2022-05-15 05:57:11', NULL, NULL, NULL, 'Open', 'Open', 0, 'Siddharth Singh', 1, NULL, NULL, NULL, NULL, NULL, 2, '2022-05-10 07:21:02', '2022-05-15 00:27:11'),
(15, NULL, NULL, NULL, '202205105', 'HISTORY', 'Ticket status changed', NULL, 'This ticket status changed by Siddharth Singh. Status changed from Open to Follow-up', 'Working...', NULL, NULL, '49', 'Siddharth Singh', '2022-05-15 05:57:11', NULL, NULL, NULL, 'Follow-up', 'Follow', 0, 'Siddharth Singh', 1, NULL, NULL, NULL, '2022-05-10', '15:00', 2, '2022-05-10 07:22:30', '2022-05-15 00:27:11'),
(16, NULL, NULL, NULL, '202205105', 'HISTORY', 'Ticket status changed', NULL, 'This ticket status changed by Siddharth Singh. Status changed from Follow-up to Closed', 'Done!', 'Test', NULL, '49', 'Siddharth Singh', '2022-05-15 05:57:11', NULL, NULL, NULL, 'Closed', 'Closed', 0, 'Siddharth Singh', 1, NULL, NULL, NULL, NULL, NULL, 2, '2022-05-10 07:39:57', '2022-05-15 00:27:11'),
(17, NULL, NULL, NULL, '202205106', 'HISTORY', 'Ticket Created', NULL, ' New ticket has been created by sunil kumar', 'Ticket has been created . the ticket Number is 202205106.', NULL, NULL, '15778', 'sunil kumar', '2022-05-10 09:30:51', NULL, NULL, NULL, 'New', 'New', 0, 'aakash', 0, NULL, NULL, NULL, NULL, NULL, 2, '2022-05-10 09:30:51', '2022-05-10 09:30:51'),
(18, NULL, NULL, NULL, '202205091', 'HISTORY', 'Ticket status changed', NULL, 'This ticket status changed by sunil kumar. Status changed from Follow-up to New', NULL, NULL, NULL, '52', 'sunil kumar', '2022-05-15 07:51:21', NULL, NULL, NULL, 'New', 'New', 0, 'sunil kumar', 1, NULL, NULL, NULL, NULL, NULL, 2, '2022-05-10 09:53:02', '2022-05-15 02:21:21'),
(19, NULL, NULL, NULL, '202205091', 'HISTORY', 'Ticket status changed', NULL, 'This ticket status changed by sunil kumar. Status changed from New to New', NULL, NULL, NULL, '52', 'sunil kumar', '2022-05-15 07:51:21', NULL, NULL, NULL, 'New', 'New', 0, 'sunil kumar', 1, NULL, NULL, NULL, NULL, NULL, 2, '2022-05-10 09:53:29', '2022-05-15 02:21:21'),
(20, NULL, NULL, NULL, '202205107', 'HISTORY', 'Ticket Created', NULL, ' New ticket has been created by mail of Sunil ', 'Ticket has been created . the ticket Number is 202205107.', NULL, NULL, '1', 'Sunil ', '2022-05-10 10:00:25', NULL, NULL, NULL, 'New', 'New', 0, 'Admin', 0, NULL, NULL, NULL, NULL, NULL, 2, '2022-05-10 10:00:25', '2022-05-10 10:00:25'),
(21, NULL, NULL, NULL, '202205107', 'HISTORY', 'Ticket assigned', NULL, 'This ticket assigned to Siddharth Singh assign by Admin', 'Admin Assigned the ticket', NULL, NULL, '1', 'Admin', '2022-05-10 10:03:30', NULL, NULL, NULL, 'Open', 'Open', 0, 'Siddharth Singh', 0, NULL, NULL, NULL, NULL, NULL, 2, '2022-05-10 10:03:30', '2022-05-10 10:03:30'),
(22, NULL, NULL, NULL, '202205107', 'HISTORY', 'Ticket status changed', NULL, 'This ticket status changed by Siddharth Singh. Status changed from Open to Follow-up', 'working....', NULL, NULL, '49', 'Siddharth Singh', '2022-05-10 10:05:00', NULL, NULL, NULL, 'Follow-up', 'Follow', 0, 'Siddharth Singh', 0, NULL, NULL, NULL, '2022-05-10', '19:50', 2, '2022-05-10 10:05:00', '2022-05-10 10:05:00'),
(23, NULL, NULL, NULL, '202205091', 'HISTORY', 'Ticket assigned', NULL, 'This ticket assigned to Siddharth Singh assign by Admin', 'Admin Assigned the ticket', NULL, NULL, '1', 'Admin', '2022-05-15 07:51:21', NULL, NULL, NULL, 'Open', 'Open', 0, 'Siddharth Singh', 1, NULL, NULL, NULL, NULL, NULL, 2, '2022-05-10 11:12:46', '2022-05-15 02:21:21'),
(24, NULL, NULL, NULL, '202205118', 'HISTORY', 'Ticket Created', NULL, ' New ticket has been created by sunil kumar', 'Ticket has been created . the ticket Number is 202205118.', NULL, NULL, '15778', 'sunil kumar', '2022-05-11 05:21:53', NULL, NULL, NULL, 'New', 'New', 0, 'aakash', 0, NULL, NULL, NULL, NULL, NULL, 2, '2022-05-11 05:21:53', '2022-05-11 05:21:53'),
(25, NULL, NULL, NULL, '202205119', 'HISTORY', 'Ticket Created', NULL, ' New ticket has been created by mail of Sunil ', 'Ticket has been created . the ticket Number is 202205119.', NULL, NULL, '1', 'Sunil ', '2022-05-11 10:10:19', NULL, NULL, NULL, 'New', 'New', 0, 'Admin', 0, NULL, NULL, NULL, NULL, NULL, 2, '2022-05-11 10:10:19', '2022-05-11 10:10:19'),
(26, NULL, NULL, NULL, '2022051110', 'HISTORY', 'Ticket Created', NULL, ' New ticket has been created by sunil kumar', 'Ticket has been created . the ticket Number is 2022051110.', NULL, NULL, '15778', 'sunil kumar', '2022-05-11 10:15:59', NULL, NULL, NULL, 'New', 'New', 0, 'Siddharth Singh', 0, NULL, NULL, NULL, NULL, NULL, 2, '2022-05-11 10:15:59', '2022-05-11 10:15:59'),
(27, NULL, NULL, NULL, '2022051211', 'HISTORY', 'Ticket Created', NULL, ' New ticket has been created by mail of Sunil ', 'Ticket has been created . the ticket Number is 2022051211.', NULL, NULL, '1', 'Sunil ', '2022-05-12 10:42:05', NULL, NULL, NULL, 'New', 'New', 0, 'Admin', 0, NULL, NULL, NULL, NULL, NULL, 2, '2022-05-12 10:42:05', '2022-05-12 10:42:05'),
(28, NULL, NULL, NULL, '2022051212', 'HISTORY', 'Ticket Created', NULL, ' New ticket has been created by mail of Sunil ', 'Ticket has been created . the ticket Number is 2022051212.', NULL, NULL, '1', 'Sunil ', '2022-05-12 10:42:06', NULL, NULL, NULL, 'New', 'New', 0, 'Admin', 0, NULL, NULL, NULL, NULL, NULL, 2, '2022-05-12 10:42:06', '2022-05-12 10:42:06'),
(29, NULL, NULL, NULL, '2022051213', 'HISTORY', 'Ticket Created', NULL, ' New ticket has been created by mail of Sunil ', 'Ticket has been created . the ticket Number is 2022051213.', NULL, NULL, '1', 'Sunil ', '2022-05-12 10:42:06', NULL, NULL, NULL, 'New', 'New', 0, 'Admin', 0, NULL, NULL, NULL, NULL, NULL, 2, '2022-05-12 10:42:06', '2022-05-12 10:42:06'),
(30, NULL, NULL, NULL, '2022051214', 'HISTORY', 'Ticket Created', NULL, ' New ticket has been created by mail of Sunil ', 'Ticket has been created . the ticket Number is 2022051214.', NULL, NULL, '1', 'Sunil ', '2022-05-15 12:49:51', NULL, NULL, NULL, 'New', 'New', 0, 'Admin', 1, NULL, NULL, NULL, NULL, NULL, 2, '2022-05-12 11:16:57', '2022-05-15 07:19:51'),
(31, NULL, NULL, NULL, '2022051215', 'HISTORY', 'Ticket Created', NULL, ' New ticket has been created by mail of Sunil ', 'Ticket has been created . the ticket Number is 2022051215.', NULL, NULL, '1', 'Sunil ', '2022-05-12 11:39:20', NULL, NULL, NULL, 'New', 'New', 0, 'Admin', 0, NULL, NULL, NULL, NULL, NULL, 2, '2022-05-12 11:39:20', '2022-05-12 11:39:20'),
(32, NULL, NULL, NULL, '2022051215', 'HISTORY', 'Ticket assigned', NULL, 'This ticket assigned to Siddharth Singh assign by Admin', 'Admin Assigned the ticket', NULL, NULL, '1', 'Admin', '2022-05-12 11:53:44', NULL, NULL, NULL, 'Open', 'Open', 0, 'Siddharth Singh', 0, NULL, NULL, NULL, NULL, NULL, 2, '2022-05-12 06:23:44', '2022-05-12 06:23:44'),
(33, NULL, NULL, NULL, '2022051215', 'HISTORY', 'Ticket status changed', NULL, 'This ticket status changed by Siddharth Singh. Status changed from Open to Follow-up', 'Working...', NULL, NULL, '49', 'Siddharth Singh', '2022-05-12 11:55:48', NULL, NULL, NULL, 'Follow-up', 'Follow', 0, 'Siddharth Singh', 0, NULL, NULL, NULL, '2022-05-13', '19:00', 2, '2022-05-12 06:25:48', '2022-05-12 06:25:48'),
(34, NULL, NULL, NULL, '2022051215', 'HISTORY', 'Ticket status changed', NULL, 'This ticket status changed by Siddharth Singh. Status changed from Follow-up to Closed', 'Done Work!', 'test', NULL, '49', 'Siddharth Singh', '2022-05-12 11:56:18', NULL, NULL, NULL, 'Closed', 'Closed', 0, 'Siddharth Singh', 0, NULL, NULL, NULL, NULL, NULL, 2, '2022-05-12 06:26:18', '2022-05-12 06:26:18'),
(35, NULL, NULL, NULL, '2022051316', 'HISTORY', 'Ticket Created', NULL, ' New ticket has been created by mail of Sunil ', 'Ticket has been created . the ticket Number is 2022051316.', NULL, NULL, '1', 'Sunil ', '2022-05-13 05:13:05', NULL, NULL, NULL, 'New', 'New', 0, 'Admin', 0, NULL, NULL, NULL, NULL, NULL, 2, '2022-05-13 05:13:05', '2022-05-13 05:13:05'),
(36, NULL, NULL, NULL, '2022051317', 'HISTORY', 'Ticket Created', NULL, ' New ticket has been created by mail of Sunil ', 'Ticket has been created . the ticket Number is 2022051317.', NULL, NULL, '1', 'Sunil ', '2022-05-13 05:13:06', NULL, NULL, NULL, 'New', 'New', 0, 'Admin', 0, NULL, NULL, NULL, NULL, NULL, 2, '2022-05-13 05:13:06', '2022-05-13 05:13:06'),
(46, NULL, NULL, NULL, '202205091', 'HISTORY', 'Ticket assigned', NULL, 'This ticket assigned to Deepak Swami assign by Admin', 'Admin Assigned the ticket', NULL, NULL, '1', 'Admin', '2022-05-15 07:51:21', NULL, NULL, NULL, 'Open', 'Open', 0, 'Deepak Swami', 1, NULL, NULL, NULL, NULL, NULL, 2, '2022-05-14 05:31:24', '2022-05-15 02:21:21'),
(45, NULL, NULL, NULL, '2022051315', 'HISTORY', 'Ticket status changed', NULL, 'This ticket status changed by Siddharth Singh. Status changed from Follow-up to Closed', 'working', 'Test', NULL, '49', 'Siddharth Singh', '2022-05-13 05:53:53', NULL, NULL, NULL, 'Closed', 'Closed', 0, 'Siddharth Singh', 0, NULL, NULL, NULL, NULL, NULL, 2, '2022-05-13 00:23:53', '2022-05-13 00:23:53'),
(43, NULL, NULL, NULL, '2022051315', 'HISTORY', 'Ticket assigned', NULL, 'This ticket assigned to Siddharth Singh assign by Admin', 'Admin Assigned the ticket', NULL, NULL, '1', 'Admin', '2022-05-13 05:49:30', NULL, NULL, NULL, 'Open', 'Open', 0, 'Siddharth Singh', 0, NULL, NULL, NULL, NULL, NULL, 2, '2022-05-13 00:19:30', '2022-05-13 00:19:30'),
(44, NULL, NULL, NULL, '2022051315', 'HISTORY', 'Ticket status changed', NULL, 'This ticket status changed by Siddharth Singh. Status changed from Open to Follow-up', 'working', NULL, NULL, '49', 'Siddharth Singh', '2022-05-13 05:53:05', NULL, NULL, NULL, 'Follow-up', 'Follow', 0, 'Siddharth Singh', 0, NULL, NULL, NULL, '2022-05-13', '11:23', 2, '2022-05-13 00:23:05', '2022-05-13 00:23:05'),
(42, NULL, NULL, NULL, '2022051315', 'HISTORY', 'Ticket Created', NULL, ' New ticket has been created by mail of Sunil ', 'Ticket has been created . the ticket Number is 2022051315.', NULL, NULL, '1', 'Sunil ', '2022-05-13 05:48:36', NULL, NULL, NULL, 'New', 'New', 0, 'Admin', 0, NULL, NULL, NULL, NULL, NULL, 2, '2022-05-13 05:48:36', '2022-05-13 05:48:36'),
(47, NULL, NULL, NULL, '202205091', 'HISTORY', 'Ticket assigned', NULL, 'This ticket assigned to Deepak Swami assign by Admin', 'Admin Assigned the ticket', NULL, NULL, '1', 'Admin', '2022-05-15 07:51:21', NULL, NULL, NULL, 'Open', 'Open', 0, 'Deepak Swami', 1, NULL, NULL, NULL, NULL, NULL, 2, '2022-05-14 05:32:32', '2022-05-15 02:21:21'),
(48, NULL, NULL, NULL, '202205091', 'HISTORY', 'Ticket assigned', NULL, 'This ticket assigned to Siddharth Singh assign by Admin', 'Admin Assigned the ticket', NULL, NULL, '1', 'Admin', '2022-05-15 07:51:21', NULL, NULL, NULL, 'Open', 'Open', 0, 'Siddharth Singh', 1, NULL, NULL, NULL, NULL, NULL, 2, '2022-05-14 06:00:44', '2022-05-15 02:21:21'),
(49, NULL, NULL, NULL, '202205091', 'HISTORY', 'Ticket assigned', NULL, 'This ticket assigned to Siddharth Singh assign by Admin', 'Admin Assigned the ticket', NULL, NULL, '1', 'Admin', '2022-05-15 07:51:21', NULL, NULL, NULL, 'Open', 'Open', 0, 'Siddharth Singh', 1, NULL, NULL, 'yes', NULL, NULL, 2, '2022-05-14 06:13:29', '2022-05-15 02:21:21'),
(50, NULL, NULL, NULL, '202205091', 'HISTORY', 'Ticket assigned', NULL, 'This ticket assigned to Deepak Swami assign by Admin', 'Admin Assigned the ticket', NULL, NULL, '1', 'Admin', '2022-05-15 07:51:21', NULL, NULL, NULL, 'Open', 'Open', 0, 'Deepak Swami', 1, NULL, NULL, NULL, NULL, NULL, 2, '2022-05-14 06:15:43', '2022-05-15 02:21:21'),
(51, NULL, NULL, NULL, '202205091', 'HISTORY', 'Ticket assigned', NULL, 'This ticket assigned to Siddharth Singh assign by Admin', 'Admin Assigned the ticket', NULL, NULL, '1', 'Admin', '2022-05-15 07:51:21', NULL, NULL, NULL, 'Open', 'Open', 0, 'Siddharth Singh', 1, NULL, NULL, NULL, NULL, NULL, 2, '2022-05-14 06:17:18', '2022-05-15 02:21:21'),
(52, NULL, NULL, NULL, '202205091', 'HISTORY', 'Ticket assigned', NULL, 'This ticket assigned to Siddharth Singh assign by Admin', 'Admin Assigned the ticket', NULL, NULL, '1', 'Admin', '2022-05-15 07:51:21', NULL, NULL, NULL, 'Open', 'Open', 0, 'Siddharth Singh', 1, NULL, NULL, 'work', NULL, NULL, 2, '2022-05-14 06:17:19', '2022-05-15 02:21:21'),
(53, NULL, NULL, NULL, '202205091', 'HISTORY', 'Ticket assigned', NULL, 'This ticket assigned to Siddharth Singh assign by Admin', 'Admin Assigned the ticket', NULL, NULL, '1', 'Admin', '2022-05-15 07:51:21', NULL, NULL, NULL, 'Open', 'Open', 0, 'Siddharth Singh', 1, NULL, NULL, 'work', NULL, NULL, 2, '2022-05-14 06:17:19', '2022-05-15 02:21:21'),
(54, NULL, NULL, NULL, '202205104', 'HISTORY', 'Ticket assigned', NULL, 'This ticket assigned to Siddharth Singh assign by Admin', 'Admin Assigned the ticket', NULL, NULL, '1', 'Admin', '2022-05-15 05:56:44', NULL, NULL, NULL, 'Open', 'Open', 0, 'Siddharth Singh', 1, NULL, NULL, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,', NULL, NULL, 2, '2022-05-14 06:29:09', '2022-05-15 00:26:44'),
(55, NULL, NULL, NULL, '202205091', 'HISTORY', 'Ticket assigned', NULL, 'This ticket assigned to santosh assign by Siddharth Singh', 'Siddharth Singh Assigned the ticket', NULL, NULL, '49', 'Siddharth Singh', '2022-05-15 07:51:21', NULL, NULL, NULL, 'Open', 'Open', 0, 'santosh', 1, NULL, NULL, NULL, NULL, NULL, 2, '2022-05-15 01:54:08', '2022-05-15 02:21:21'),
(56, NULL, NULL, NULL, '2022051520', 'HISTORY', 'Ticket Created', NULL, ' New ticket has been created by Admin', 'Ticket has been created . the ticket Number is 2022051520.', NULL, NULL, '965966', 'Admin', '2022-05-15 12:12:46', NULL, NULL, NULL, 'New', 'New', 0, 'Siddharth Singh', 0, NULL, NULL, NULL, NULL, NULL, 2, '2022-05-15 12:12:46', '2022-05-15 12:12:46');

-- --------------------------------------------------------

--
-- Table structure for table `process_product`
--

CREATE TABLE `process_product` (
  `id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `product` varchar(250) NOT NULL,
  `product_code` varchar(250) DEFAULT NULL,
  `product_brand` varchar(255) DEFAULT NULL,
  `product_category` varchar(250) DEFAULT NULL,
  `owner` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `process_product`
--

INSERT INTO `process_product` (`id`, `created_at`, `updated_at`, `product`, `product_code`, `product_brand`, `product_category`, `owner`) VALUES
(1, '2020-05-22 16:12:32', '2021-10-30 04:07:33', 'GSM Gateway', 'GSM8569', 'xyz', 'Hadware', 'admin'),
(8, '2020-06-22 05:42:35', '2021-11-01 06:53:42', 'PRI Card', 'PRI965326', 'test', 'Hardware', 'admin'),
(10, '2021-10-30 02:17:44', '2021-11-23 05:31:08', 'IVR', '031', 'Lead Management', 'Software', 'admin'),
(11, '2021-12-24 08:03:14', '2021-12-24 08:03:14', 'Dialer', NULL, 'Vertage', 'Software', 'Admin'),
(12, '2022-03-31 13:00:19', '2022-03-31 13:00:19', 'sip', 'sip1', 'tata', 'Hardware', 'Krishnan Sir');

-- --------------------------------------------------------

--
-- Table structure for table `process_rca`
--

CREATE TABLE `process_rca` (
  `id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `process_name` varchar(255) NOT NULL,
  `rca_name` varchar(250) NOT NULL,
  `category_name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `process_rca`
--

INSERT INTO `process_rca` (`id`, `created_at`, `updated_at`, `process_name`, `rca_name`, `category_name`) VALUES
(1, '2020-06-22 03:32:09', '2021-06-25 06:33:54', 'Ticket', 'New patch given', 'software'),
(2, '2020-06-22 03:32:09', '2021-06-25 06:33:54', 'Ticket', 'Version Upgraded', 'software'),
(3, '2020-06-22 03:33:30', '2021-06-25 06:33:54', 'Ticket', 'Reset setting', 'software'),
(4, '2021-02-04 11:37:11', '2021-06-25 06:33:54', 'Ticket', 'Version Upgraded 1.0', 'software'),
(7, '2021-06-24 15:44:07', '2021-06-25 06:33:54', 'Ticket', 'Latest Version', 'software'),
(8, '2022-03-31 11:46:41', '2022-03-31 11:46:41', 'Ticket', 'Test', 'Support'),
(9, '2022-03-31 12:57:50', '2022-03-31 12:57:50', 'Ticket', 'tech glich', 'Support');

-- --------------------------------------------------------

--
-- Table structure for table `process_source`
--

CREATE TABLE `process_source` (
  `id` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `source` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `process_source`
--

INSERT INTO `process_source` (`id`, `created_date`, `source`) VALUES
(1, '2020-05-26 14:13:16', 'Email'),
(2, '2020-05-26 14:13:16', 'WebPortal'),
(3, '2020-05-26 14:13:34', 'Chat'),
(4, '2020-05-26 14:13:34', 'Walk-in '),
(5, '2020-05-26 14:13:51', 'Walk-in'),
(6, '2020-05-26 14:13:51', 'SMS'),
(7, '2020-05-26 14:14:07', 'Phone'),
(8, '2020-05-26 14:14:07', 'Other Platform'),
(9, '2020-05-26 14:14:20', 'IoT'),
(10, '2020-05-26 14:14:20', 'Kiosk');

-- --------------------------------------------------------

--
-- Table structure for table `process_subcategory`
--

CREATE TABLE `process_subcategory` (
  `id` int(11) NOT NULL,
  `cateid` varchar(100) DEFAULT NULL,
  `sub_category` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `process_subcategory`
--

INSERT INTO `process_subcategory` (`id`, `cateid`, `sub_category`, `created_at`, `updated_at`) VALUES
(1, 'Support', 'Dialer CRM', '2021-10-28 04:50:40', '2021-12-24 08:07:20'),
(15, 'Support', 'Calling Issue', '2021-12-24 07:30:27', '2021-12-24 08:07:20'),
(16, 'Support', 'Database Issue', '2021-12-24 07:31:09', '2021-12-24 08:07:20'),
(32, 'Support', 'DID Issues', '2021-12-24 07:40:18', '2021-12-24 08:07:20'),
(43, 'Hardware Internal Issue', 'Keybord Related Issue', '2021-12-24 07:55:26', '2021-12-24 07:55:48'),
(17, 'Support', 'GSM Gateway Issue', '2021-12-24 07:31:46', '2021-12-24 08:07:20'),
(18, 'Support', 'Asterisks Related Issues', '2021-12-24 07:32:28', '2021-12-24 08:07:20'),
(19, 'Support', 'Web Server Issues', '2021-12-24 07:32:47', '2021-12-24 08:07:20'),
(20, 'Support', 'Xlite Issues', '2021-12-24 07:33:38', '2021-12-24 08:07:20'),
(21, 'Support', 'Voice Break Issues', '2021-12-24 07:34:09', '2021-12-24 08:07:20'),
(22, 'Support', 'License Related Issues', '2021-12-24 07:35:13', '2021-12-24 08:07:21'),
(23, 'Support', 'OBD Related Issues', '2021-12-24 07:35:33', '2021-12-24 08:07:21'),
(24, 'Support', 'Inbound', '2021-12-24 07:35:54', '2021-12-24 08:07:21'),
(25, 'Support', 'Outbound', '2021-12-24 07:36:05', '2021-12-24 08:07:21'),
(26, 'Support', 'IVR Calling Issues', '2021-12-24 07:36:28', '2021-12-24 08:07:21'),
(27, 'Support', 'Call Marge Issue', '2021-12-24 07:36:51', '2021-12-24 08:07:21'),
(28, 'Support', 'Login Issues', '2021-12-24 07:37:22', '2021-12-24 08:07:21'),
(29, 'Support', 'Xlite Confirmation Bell Issue', '2021-12-24 07:37:43', '2021-12-24 08:07:21'),
(30, 'Support', 'DNC Issue', '2021-12-24 07:37:57', '2021-12-24 08:07:21'),
(31, 'Support', 'Recording issue', '2021-12-24 07:38:16', '2021-12-24 08:07:21'),
(33, 'Internal  Issues', 'Development Issue', '2021-12-24 07:43:47', '2021-12-24 07:43:47'),
(34, 'Internal  Issues', 'Support issue', '2021-12-24 07:44:00', '2021-12-24 07:44:00'),
(35, 'Internal  Issues', 'HR Issue', '2021-12-24 07:44:10', '2021-12-24 07:44:10'),
(36, 'Internal  Issues', 'Sales Issue', '2021-12-24 07:44:21', '2021-12-24 07:44:21'),
(37, 'Internal  Issues', 'Accountant Issues', '2021-12-24 07:44:37', '2021-12-24 07:44:37'),
(38, 'Internal  Issues', 'IT Issues', '2021-12-24 07:44:53', '2021-12-24 07:44:53'),
(39, 'Internal  Issues', 'Admin issues', '2021-12-24 07:45:05', '2021-12-24 07:45:05'),
(40, 'Development', 'New CRM', '2021-12-24 07:47:53', '2021-12-24 07:47:53'),
(41, 'Development', 'Customize CRM', '2021-12-24 07:48:07', '2021-12-24 07:48:07'),
(42, 'Development', 'Change Report', '2021-12-24 07:48:49', '2021-12-24 07:48:49'),
(44, 'Hardware Internal Issue', 'Mouse Related', '2021-12-24 07:56:07', '2021-12-24 07:56:07'),
(45, 'Hardware Internal Issue', 'System Speed issue', '2021-12-24 07:56:28', '2021-12-24 07:56:28'),
(46, 'Hardware Internal Issue', 'Operating System', '2021-12-24 07:57:11', '2021-12-24 07:57:53'),
(47, 'Support', 'Demo', '2021-12-29 05:45:22', '2021-12-29 05:45:22'),
(48, 'Support', 'List Issue', '2021-12-29 05:46:25', '2021-12-29 05:46:25'),
(49, 'Support', 'Campaign Issue', '2021-12-29 05:46:40', '2021-12-29 05:46:40'),
(50, 'HR', 'Interview', '2021-12-31 06:53:54', '2021-12-31 06:53:54'),
(51, 'HR', 'Scheudle Interview', '2021-12-31 06:54:38', '2021-12-31 06:54:38'),
(52, 'HR', 'Shortlist Resume', '2021-12-31 06:55:06', '2021-12-31 06:55:06'),
(53, 'HR', 'Compliance issue', '2021-12-31 06:55:30', '2021-12-31 06:55:30'),
(54, 'Licences', 'Rental Lic', '2022-01-03 08:45:34', '2022-01-03 08:45:34'),
(55, 'Licences', 'One Time Lic', '2022-01-03 08:45:55', '2022-01-03 08:45:55'),
(56, 'Licences', 'WFH Lic', '2022-01-03 08:48:02', '2022-01-03 08:48:02'),
(57, 'Invoice', 'Rental', '2022-01-03 09:57:55', '2022-01-03 09:57:55'),
(58, 'Invoice', 'One Time', '2022-01-03 09:58:12', '2022-01-03 09:58:12'),
(59, 'Invoice', 'Annual AMC', '2022-01-03 09:59:14', '2022-01-03 09:59:14'),
(60, 'Support', 'VPN Issue', '2022-02-15 08:46:23', '2022-02-15 08:46:23'),
(61, 'Support', 'Prefix Issue', '2022-02-15 08:46:57', '2022-02-15 08:46:57'),
(62, 'Support', 'Implements', '2022-02-15 08:47:31', '2022-02-15 08:47:31'),
(63, 'Support', 'Installation', '2022-02-15 08:47:54', '2022-02-15 08:47:54'),
(64, 'Support', 'Data Upload Issue', '2022-02-15 08:48:48', '2022-02-15 08:48:48'),
(65, 'Support', 'Dialer Hang Issue', '2022-02-15 08:49:20', '2022-02-15 08:49:20'),
(66, 'Support', 'Report Issue', '2022-02-15 08:49:55', '2022-02-15 08:49:55'),
(67, 'Mislenious', 'other', '2022-03-31 13:03:10', '2022-03-31 13:03:10'),
(68, 'Support', 'Server Testing', '2022-04-09 05:07:07', '2022-04-09 05:07:07');

-- --------------------------------------------------------

--
-- Table structure for table `process_task`
--

CREATE TABLE `process_task` (
  `id` int(11) NOT NULL,
  `ticket_id` varchar(255) NOT NULL,
  `ticket_number` varchar(100) DEFAULT NULL,
  `process_name` varchar(100) DEFAULT NULL,
  `addtaskdetail` text DEFAULT NULL,
  `owner` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `sub_status` varchar(255) DEFAULT NULL,
  `work_status` int(11) NOT NULL DEFAULT 0,
  `assignby` text DEFAULT NULL,
  `createdby` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `process_task`
--

INSERT INTO `process_task` (`id`, `ticket_id`, `ticket_number`, `process_name`, `addtaskdetail`, `owner`, `status`, `sub_status`, `work_status`, `assignby`, `createdby`, `created_at`, `updated_at`) VALUES
(2, '302', '20220324301', 'Ticket', 'Dummy text: Its function as a filler or as a tool', 'Rishabh', 'Working', 'Working', 1, 'Siddharth Singh', 'Siddharth Singh', '2022-03-24 05:56:48', '2022-03-28 03:43:45'),
(3, '302', '20220324301', 'Ticket', 'Incomprehensibility or readability? That is the question.', 'sunil kumar', 'Working', 'Working', 1, 'Siddharth Singh', 'Siddharth Singh', '2022-03-24 06:25:16', '2022-03-28 03:43:23'),
(4, '302', '20220322301', 'Ticket', 'This alert box could indicate a successful or positive action.', 'Rishabh', 'Working', 'Working', 1, 'Siddharth Singh', 'Siddharth Singh', '2022-03-25 04:51:37', '2022-03-28 04:01:33'),
(5, '302', '20220322301', 'Ticket', 'This alert box could indicate a dangerous or potentially negative action.', 'sunil kumar', 'Working', 'Working', 1, 'Siddharth Singh', 'Siddharth Singh', '2022-03-25 05:04:45', '2022-03-28 04:01:34'),
(6, '302', '20220322301', 'Ticket', 'working.....', 'dharmender pal', 'Working', 'Working', 1, 'Siddharth Singh', 'Siddharth Singh', '2022-03-26 01:41:03', '2022-03-28 04:01:39'),
(7, '304', '20220328304', 'Ticket', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', 'Rishabh', 'New', 'New', 0, 'Siddharth Singh', 'Deepak Swami', '2022-03-28 05:08:01', '2022-03-28 06:51:31'),
(8, '304', '20220328304', 'Ticket', 'There are many variations of passages of Lorem Ipsum', 'Deepak Swami', 'New', 'New', 0, NULL, 'Deepak Swami', '2022-03-28 05:10:17', '2022-03-28 06:51:30'),
(9, '304', '20220328304', 'Ticket', 'Contrary to popular belief, Lorem Ipsum is not simply random text', 'Deepak Swami', 'New', 'New', 0, NULL, 'Deepak Swami', '2022-03-28 05:10:52', '2022-03-28 06:51:29'),
(10, '1073', '202203291073', 'Ticket', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', 'sunil kumar', 'New', 'New', 0, 'Siddharth Singh', 'Siddharth Singh', '2022-03-29 08:48:14', '2022-03-29 09:17:35'),
(11, '1073', '202203291073', 'Ticket', 'It is a long established fact that a reader will be distracted by the readable content of a page', 'sunil kumar', 'New', 'New', 0, 'Siddharth Singh', 'Siddharth Singh', '2022-03-29 08:52:26', '2022-03-29 09:32:22'),
(12, '1075', '202203291075', 'Ticket', 'It is a long established fact that a reader will be distracted by the readable content of a page', 'Siddharth Singh', 'New', 'New', 1, NULL, 'Siddharth Singh', '2022-03-29 09:55:08', '2022-04-08 06:06:04'),
(13, '1075', '202203291075', 'Ticket', 'There are many variations of passages of Lorem Ipsum available', 'Siddharth Singh', 'New', 'New', 1, NULL, 'Siddharth Singh', '2022-03-29 10:00:47', '2022-04-08 06:06:02'),
(14, '1075', '202203291075', 'Ticket', 'saddadadadada ffsfsfsfs', 'Siddharth Singh', 'New', 'New', 1, NULL, 'Siddharth Singh', '2022-03-29 10:04:02', '2022-03-31 11:40:09'),
(15, '1097', '202204011097', 'Ticket', 'TEST TASK', 'user1', 'Open', 'Open', 1, NULL, 'Krishnan Sir', '2022-04-01 04:18:28', '2022-04-02 06:09:31'),
(16, '1097', '202204011097', 'Ticket', 'jhjkhkjh', 'user1', 'Working', 'Testing', 0, NULL, 'Krishnan Sir', '2022-04-02 06:26:47', '2022-04-02 06:27:06');

-- --------------------------------------------------------

--
-- Table structure for table `process_ticket`
--

CREATE TABLE `process_ticket` (
  `id` int(11) NOT NULL,
  `created_date` timestamp NULL DEFAULT current_timestamp(),
  `ticket_number` varchar(250) DEFAULT NULL,
  `mobile` varchar(250) DEFAULT NULL,
  `email_id` varchar(250) DEFAULT NULL,
  `customer_id` varchar(250) DEFAULT NULL,
  `created_by` varchar(250) DEFAULT NULL,
  `uid` bigint(20) DEFAULT NULL,
  `message_id` varchar(355) DEFAULT NULL,
  `created_at` varchar(250) DEFAULT NULL,
  `subject` text DEFAULT NULL,
  `major_issue` text DEFAULT NULL,
  `type` varchar(250) DEFAULT NULL,
  `category` varchar(250) DEFAULT NULL,
  `sub_category` varchar(250) DEFAULT NULL,
  `status` varchar(250) DEFAULT NULL,
  `sub_status` varchar(250) DEFAULT NULL,
  `source` varchar(250) DEFAULT NULL,
  `source_value` varchar(250) DEFAULT NULL,
  `voc` varchar(250) DEFAULT NULL,
  `product` varchar(250) DEFAULT NULL,
  `department` varchar(250) DEFAULT NULL,
  `task` varchar(50) NOT NULL DEFAULT 'N',
  `owner` varchar(250) DEFAULT NULL,
  `note_assign` text DEFAULT NULL,
  `tat` varchar(250) DEFAULT NULL,
  `del_date_tat` varchar(100) DEFAULT NULL,
  `del_time_tat` varchar(100) DEFAULT NULL,
  `del_comm_tat` text DEFAULT NULL,
  `customer_name` varchar(250) DEFAULT NULL,
  `document_id` varchar(250) DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `transfer_case` varchar(100) DEFAULT NULL,
  `closure_date` varchar(250) DEFAULT NULL,
  `rca` varchar(250) DEFAULT NULL,
  `closure_remarks` varchar(250) DEFAULT NULL,
  `qrcode` text DEFAULT NULL,
  `noti_read` int(11) NOT NULL DEFAULT 0,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `process_ticket`
--

INSERT INTO `process_ticket` (`id`, `created_date`, `ticket_number`, `mobile`, `email_id`, `customer_id`, `created_by`, `uid`, `message_id`, `created_at`, `subject`, `major_issue`, `type`, `category`, `sub_category`, `status`, `sub_status`, `source`, `source_value`, `voc`, `product`, `department`, `task`, `owner`, `note_assign`, `tat`, `del_date_tat`, `del_time_tat`, `del_comm_tat`, `customer_name`, `document_id`, `remarks`, `transfer_case`, `closure_date`, `rca`, `closure_remarks`, `qrcode`, `noti_read`, `updated_at`) VALUES
(1, '2022-05-09 08:00:48', '202205091', '7275812453', 'sunil@vert-age.com', '202205091', 'Admin', NULL, NULL, '2022-05-09 01:30:48', 'Demo Test', NULL, NULL, 'Development', 'New CRM', 'Open', 'Open', 'Phone', NULL, NULL, NULL, 'Development', 'N', 'santosh', NULL, '2022-05-09', NULL, NULL, NULL, 'sunil', NULL, 'Demo Test', NULL, NULL, NULL, NULL, NULL, 1, '2022-05-15 01:54:08'),
(2, '2022-05-09 09:33:40', '202205092', '', 'Sunil <sunil@vert-age.com>', '202205092', 'Sunil ', NULL, NULL, '2022-05-09 03:03:40', 'Demo Test Cron', NULL, '', 'Software', 'CRM', 'Closed', 'Closed', 'Email', 'Email', '', '', 'Development', 'N', 'Transfer', NULL, '2022-05-09 03:03:40', NULL, NULL, 'Done', 'Sunil ', NULL, 'Demo Test Cron', 'Transfer', NULL, NULL, NULL, NULL, 1, '2022-05-14 23:27:05'),
(3, '2022-05-09 09:50:22', '202205093', '', 'Sunil <sunil@vert-age.com>', '202205093', 'Sunil ', NULL, NULL, '2022-05-09 03:20:22', 'Sunil Test', NULL, '', 'Software', 'CRM', 'Open', 'Open', 'Email', 'Email', '', '', 'Development', 'N', 'Transfer', NULL, '2022-05-09 03:20:22', NULL, NULL, NULL, 'Sunil ', NULL, 'Sunil Test', 'Transfer', NULL, NULL, NULL, NULL, 1, '2022-05-14 07:32:22'),
(4, '2022-05-10 04:44:20', '202205104', '1234567890', 'santosh@vert-age.com', '202205104', 'santosh', NULL, NULL, '2022-05-10 10:14:20', 'jjgiu', NULL, NULL, 'Development', 'New CRM', 'Open', 'Open', 'Other Platform', NULL, NULL, NULL, 'Development', 'N', 'Siddharth Singh', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,', '2022-05-10', NULL, NULL, NULL, 'sad', NULL, 'kgb', NULL, NULL, NULL, NULL, NULL, 1, '2022-05-14 23:25:31'),
(5, '2022-05-10 07:07:06', '202205105', '', 'Sunil <sunil@vert-age.com>', '202205105', 'Sunil ', NULL, NULL, '2022-05-10 12:37:06', 'IVR Issue', NULL, '', 'Software', 'CRM', 'Closed', 'Closed', 'Email', 'Email', '', '', 'Development', 'N', 'Siddharth Singh', NULL, '2022-05-10 12:37:06', NULL, NULL, 'Done!', 'Sunil ', NULL, 'IVR Issue', NULL, NULL, NULL, NULL, NULL, 1, '2022-05-14 07:59:41'),
(7, '2022-05-10 10:00:25', '202205107', '', 'Sunil <sunil@vert-age.com>', '202205107', 'Sunil ', NULL, '<180ad697bdc.118c009371296095.592478051898459700@vert-age.com>', '2022-05-10 03:30:25', 'Demo Test', NULL, '', 'Software', 'CRM', 'Follow-up', 'Follow', 'Email', 'Email', '', '', 'Development', 'N', 'Siddharth Singh', NULL, '2022-05-10 03:30:25', '2022-05-10', '19:50', 'working....', 'Sunil ', NULL, 'Demo Test', NULL, NULL, NULL, NULL, NULL, 1, '2022-05-13 06:07:20'),
(8, '2022-05-11 05:21:53', '202205118', 'abc', 'aakashverma0213@gmail.com', '202205118', 'sunil kumar', NULL, NULL, '2022-05-11 10:51:52', 'any', NULL, NULL, NULL, NULL, 'New', 'New', 'WebPortal', NULL, NULL, NULL, 'test', 'N', 'aakash', NULL, NULL, NULL, NULL, NULL, 'aakash', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2022-05-11 07:53:03'),
(9, '2022-05-11 10:10:19', '202205119', '', 'Sunil <sunil@vert-age.com>', '202205119', 'Sunil ', NULL, NULL, '2022-05-11 03:40:18', 'Demo Cron Job Test', NULL, '', 'Software', 'CRM', 'New', 'New', 'Email', 'Email', '', '', 'Support', 'N', 'Admin', NULL, '2022-05-11 03:40:18', NULL, NULL, NULL, 'Sunil ', NULL, 'Demo Cron Job Test', NULL, NULL, NULL, NULL, NULL, 0, '2022-05-10 22:10:18'),
(10, '2022-05-11 10:15:59', '2022051110', '6395079456', 'akashverma@vert-age.com', '2022051110', 'sunil kumar', NULL, NULL, '2022-05-11 03:45:59', 'Demo Test', NULL, NULL, 'Development', 'New CRM', 'New', 'New', 'Other Platform', NULL, NULL, NULL, 'Development', 'N', 'Siddharth Singh', NULL, '2022-05-11', NULL, NULL, NULL, 'aakash', NULL, 'Demo Test', NULL, NULL, NULL, NULL, NULL, 1, '2022-05-12 08:58:09'),
(11, '2022-05-12 10:42:05', '2022051211', '', 'Sunil <sunil@vert-age.com>', '2022051211', 'Sunil ', NULL, NULL, '2022-05-12 04:12:05', 'cron job test for sunil', NULL, '', 'Software', 'CRM', 'New', 'New', 'Email', 'Email', '', '', 'Support', 'N', 'Admin', NULL, '2022-05-12 04:12:05', NULL, NULL, NULL, 'Sunil ', NULL, 'cron job test for sunil', NULL, NULL, NULL, NULL, NULL, 0, '2022-05-11 22:42:05'),
(12, '2022-05-12 10:42:06', '2022051212', '', 'Sunil <sunil@vert-age.com>', '2022051212', 'Sunil ', NULL, '<180b7dc5ce4.f8407b5a1911065.2683112911794287263@vert-age.com>', '2022-05-12 04:12:06', 'cron job test for sunil', NULL, '', 'Software', 'CRM', 'New', 'New', 'Email', 'Email', '', '', 'Support', 'N', 'Admin', NULL, '2022-05-12 04:12:06', NULL, NULL, NULL, 'Sunil ', NULL, 'cron job test for sunil', NULL, NULL, NULL, NULL, NULL, 0, '2022-05-11 22:42:06'),
(13, '2022-05-12 10:42:06', '2022051213', '', 'Sunil <sunil@vert-age.com>', '2022051213', 'Sunil ', NULL, NULL, '2022-05-12 04:12:06', 'cron job test for sunil', NULL, '', 'Software', 'CRM', 'New', 'New', 'Email', 'Email', '', '', 'Support', 'N', 'Admin', NULL, '2022-05-12 04:12:06', NULL, NULL, NULL, 'Sunil ', NULL, 'cron job test for sunil', NULL, NULL, NULL, NULL, NULL, 0, '2022-05-11 22:42:06'),
(14, '2022-05-12 11:16:57', '2022051214', '', 'Sunil <sunil@vert-age.com>', '2022051214', 'Sunil ', NULL, '<180b7fc4849.d9fae5621920093.8855689256900014063@vert-age.com>', '2022-05-12 04:46:57', 'Testing Imap', NULL, '', 'Software', 'CRM', 'New', 'New', 'Email', 'Email', '', '', 'Support', 'N', 'Admin', NULL, '2022-05-12 04:46:57', NULL, NULL, NULL, 'Sunil ', NULL, 'Testing Imap', NULL, NULL, NULL, NULL, NULL, 1, '2022-05-14 06:42:29'),
(19, '2022-05-13 05:48:36', '2022051315', '', 'Sunil <sunil@vert-age.com>', '2022051315', 'Sunil ', NULL, '<180bbf5f63d.eec9125e149400.8475932264321457581@vert-age.com>', '2022-05-13 11:18:36', 'Testing....', NULL, '', 'Software', 'CRM', 'Open', 'Open', 'Email', 'Email', '', '', 'Development', 'N', 'Siddharth Singh', NULL, '2022-05-13 11:18:36', NULL, NULL, 'working', 'Sunil ', NULL, 'Testing....', NULL, NULL, NULL, NULL, NULL, 1, '2022-05-15 12:40:24'),
(20, '2022-05-15 12:12:46', '2022051520', '7275812453', 'sunil@vert-age.com', '2022051520', 'Admin', NULL, NULL, '2022-05-15 05:42:46', 'Demo', NULL, NULL, 'Development', 'New CRM', 'New', 'New', 'Other Platform', NULL, NULL, NULL, 'Development', 'N', 'Siddharth Singh', NULL, '2022-05-17', NULL, NULL, NULL, 'sunil', NULL, 'demo', NULL, NULL, NULL, NULL, NULL, 0, '2022-05-15 00:12:46');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL,
  `session_id` varchar(100) NOT NULL,
  `ip_address` varchar(100) DEFAULT NULL,
  `user_agent` varchar(100) DEFAULT NULL,
  `last_activity` int(11) NOT NULL DEFAULT 1,
  `session_name` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `country_id` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `name`, `country_id`, `created_at`, `updated_at`) VALUES
(1, 'UP', 'India', '2021-11-11 20:14:42', '2021-11-12 22:36:30'),
(2, 'MP', 'India', '2021-11-11 20:17:20', '2021-11-11 20:17:20'),
(3, 'State First', 'Afghanistan', '2021-11-23 02:27:51', '2021-11-23 05:20:36'),
(4, 'State Sconed', 'Afghanistan', '2021-11-23 02:29:19', '2021-11-23 04:43:17');

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `id` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'New', '2022-05-07 06:58:09', NULL),
(2, 'Open', '2022-05-07 07:00:02', NULL),
(3, 'Follow-up', '2022-05-07 07:01:01', NULL),
(4, 'Closed', '2022-05-07 07:04:08', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `strick_note`
--

CREATE TABLE `strick_note` (
  `id` int(11) NOT NULL,
  `process_name` varchar(255) NOT NULL,
  `ticket_number` varchar(250) NOT NULL,
  `note_text` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `strick_note`
--

INSERT INTO `strick_note` (`id`, `process_name`, `ticket_number`, `note_text`, `created_at`, `updated_at`) VALUES
(1, 'Ticket', 'TKT2021100721', 'Dear Sir by mistake Ticket Close. Please reopen Ticket.', '2021-10-18 06:51:40', '2021-10-18 06:51:40'),
(2, 'Ticket', '2021122556', 'kindly reopen this ticket', '2021-12-29 13:20:25', '2021-12-29 13:20:25'),
(3, 'Ticket', '20211230130', 'add server shutdown  time crontab \r\n7:30', '2021-12-30 11:53:27', '2021-12-30 11:53:27'),
(4, 'Ticket', '20220105232', 'anydesk :- citi3floor@ad', '2022-01-05 12:13:47', '2022-01-05 12:13:47');

-- --------------------------------------------------------

--
-- Table structure for table `suggestion`
--

CREATE TABLE `suggestion` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `title` varchar(300) NOT NULL,
  `suggestion` text NOT NULL,
  `uid` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `suggestion`
--

INSERT INTO `suggestion` (`id`, `name`, `email`, `title`, `suggestion`, `uid`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', 'Vertage Team ', 'All Vertage Team Share New Thing And Improve Software.', 1, '2021-12-29 12:35:26', '2021-12-29 12:38:17'),
(2, 'Rohit dixit', 'marketing@vert-age.com', 'website design', '1) https://slaveryfootprint.org/ ****\r\n\r\n2) http://blacknegative.com/ ****\r\n\r\n3) https://www.hellomonday.com/ ****\r\n\r\n4) https://www.aquest.it/\r\n\r\n5) https://wovenmagazine.com/\r\n\r\n6) https://activetheory.net/ ***', 69, '2021-12-31 13:04:02', '2021-12-31 13:04:02'),
(3, 'Krishnan Sir', 'v.krishnan@jumbokonexionsventures.com', 'test', 'test', 97, '2022-03-31 13:06:22', '2022-03-31 13:06:22');

-- --------------------------------------------------------

--
-- Table structure for table `suggestion_comment`
--

CREATE TABLE `suggestion_comment` (
  `id` bigint(20) NOT NULL,
  `cid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `comment` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `suggestion_comment`
--

INSERT INTO `suggestion_comment` (`id`, `cid`, `uid`, `comment`, `created_at`, `updated_at`) VALUES
(1, 1, 52, 'Good...', '2021-12-29 12:37:17', '2021-12-29 12:37:17'),
(2, 2, 49, 'nice', '2022-01-06 10:34:33', '2022-01-06 10:34:33'),
(3, 2, 49, 'nice', '2022-01-06 10:34:43', '2022-01-06 10:34:43');

-- --------------------------------------------------------

--
-- Table structure for table `table_field_list`
--

CREATE TABLE `table_field_list` (
  `id` int(11) NOT NULL,
  `process_id` varchar(250) DEFAULT NULL,
  `process_name` varchar(250) DEFAULT NULL,
  `field_colm` varchar(250) DEFAULT NULL,
  `field_type` varchar(250) DEFAULT NULL,
  `extra_values` text DEFAULT NULL,
  `order_list_col` int(11) NOT NULL DEFAULT 0,
  `input_label` varchar(250) DEFAULT NULL,
  `input_name` varchar(250) DEFAULT NULL,
  `preposition` int(250) NOT NULL DEFAULT 0,
  `user_id` varchar(250) DEFAULT NULL,
  `level` varchar(250) DEFAULT NULL,
  `table_sql` enum('DNY','SQL') NOT NULL DEFAULT 'DNY',
  `table_name` varchar(250) DEFAULT NULL,
  `table_condition` varchar(250) DEFAULT NULL,
  `table_column` varchar(250) DEFAULT NULL,
  `gui_set` enum('N','Y') NOT NULL,
  `data_table` enum('N','Y') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `table_field_list`
--

INSERT INTO `table_field_list` (`id`, `process_id`, `process_name`, `field_colm`, `field_type`, `extra_values`, `order_list_col`, `input_label`, `input_name`, `preposition`, `user_id`, `level`, `table_sql`, `table_name`, `table_condition`, `table_column`, `gui_set`, `data_table`, `created_at`, `updated_at`) VALUES
(390, '66146583', 'customer', '_', 'header', '', 0, 'Contact information', '_', 1, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 06:44:06', NULL),
(391, '66146583', 'customer', 'owner', 'select', NULL, 0, 'owner', 'owner', 3, '', 'Level_Fast', 'SQL', 'users', '', 'name', 'Y', 'N', '2020-12-23 06:44:06', '2022-05-06 11:34:27'),
(392, '66146583', 'customer', 'customer_name', 'text', '', 0, 'Customer_Name	', 'Customer_Name	', 5, '', 'Level_Fast', 'DNY', '', '', '', 'Y', 'N', '2020-12-23 06:44:06', '2021-10-10 20:05:51'),
(393, '66146583', 'customer', 'mobile', 'text', '', 0, 'Mobile', 'Mobile', 6, '', 'Level_Fast', 'DNY', '', '', '', 'Y', 'N', '2020-12-23 06:44:06', '2021-10-10 20:06:33'),
(394, '66146583', 'customer', 'email_id', 'text', '', 0, 'Email_ID', 'Email_ID', 7, '', 'Level_Fast', 'DNY', '', '', '', 'Y', 'N', '2020-12-23 06:44:06', '2021-10-10 20:06:59'),
(395, '66146583', 'customer', 'fax', 'text', '', 0, 'Fax', 'Fax', 8, '', 'Level_Fast', 'DNY', '', '', '', 'Y', 'N', '2020-12-23 06:44:06', '2021-10-10 20:07:42'),
(396, '66146583', 'customer', 'skype_Id', 'text', '', 0, 'Skype Id', 'skype_Id', 9, '', 'Level_Fast', 'DNY', '', '', '', 'Y', 'N', '2020-12-23 06:44:06', '2022-05-06 11:40:16'),
(397, '66146583', 'customer', '_', 'header', '', 0, 'Address information', '_', 10, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 06:44:06', NULL),
(398, '66146583', 'customer', 'country', 'select', ' ', 0, 'country', 'country', 11, '', 'Level_Fast', 'SQL', 'country', '', 'name', 'Y', 'N', '2020-12-23 06:44:06', '2021-11-08 22:04:30'),
(399, '66146583', 'customer', 'state', 'text', NULL, 0, 'state', 'state', 12, '', 'Level_Fast', 'DNY', '', '', '', 'Y', 'N', '2020-12-23 06:44:06', '2021-11-08 21:53:30'),
(400, '66146583', 'customer', 'city', 'text', NULL, 0, 'city', 'city', 13, '', 'Current_date', 'DNY', '', '', '', 'Y', 'N', '2020-12-23 06:44:06', '2021-11-08 21:53:44'),
(401, '66146583', 'customer', '_', 'header', '', 0, 'Description information', '_', 14, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 06:44:06', NULL),
(402, '66146583', 'customer', 'description', 'textarea', '', 0, 'Description', 'description', 15, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 06:44:06', NULL),
(403, '66146583', 'customer', 'company_name', 'text', '', 0, 'Company name', 'company_name', 4, '', 'Level_Fast', 'DNY', '', '', '', 'Y', 'N', '2020-12-23 06:44:06', '2022-05-06 11:39:23'),
(404, '12535562', 'user', 'user_id', 'text', '', 1, 'user_id', 'user_id', 0, '', '', 'DNY', '', '', '', 'N', 'N', '2020-12-23 06:44:06', '2022-05-02 12:07:17'),
(405, '12535562', 'user', 'user_name', 'text', '', 2, 'user_name', 'user_name', 0, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 06:44:06', '2022-05-02 12:07:24'),
(406, '12535562', 'user', 'user_email', 'text', '', 3, 'user_email', 'user_email', 0, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 06:44:06', '2022-05-02 12:07:38'),
(407, '12535562', 'user', 'user_pass', 'text', '', 4, 'Password', 'user_pass', 0, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 06:44:06', '2022-05-02 12:07:42'),
(408, '12535562', 'user', 'user_type', 'select', NULL, 5, 'User Group', 'user_type', 0, '', 'Level_Fast', 'SQL', 'users_role', '', 'user_role', 'N', 'N', '2020-12-23 06:44:06', '2022-05-02 12:07:46'),
(409, '12535562', 'user', 'images', 'text', '', 6, 'images', 'images', 0, '', '', 'DNY', '', '', '', 'N', 'N', '2020-12-23 06:44:06', '2022-05-02 12:07:55'),
(410, '12535562', 'user', 'level_name', 'select', '', 7, 'level_name', 'level_name', 0, '', '', 'SQL', 'create_level', 'level_name', 'level_name', 'N', 'N', '2020-12-23 06:44:06', '2022-05-02 12:08:11'),
(435, '27098405', 'Ticket', 'sub_category', 'select', '', 0, 'Sub Category', 'sub_category', 13, '', 'Level_Fast', 'SQL', 'process_category', '', 'sub_category', 'Y', 'N', '2020-12-23 06:44:06', '2021-06-25 00:04:51'),
(434, '27098405', 'Ticket', 'category', 'select', '', 0, 'Category', 'category', 12, '', 'Level_Fast', 'SQL', 'process_category', '', 'category_name', 'Y', 'N', '2020-12-23 06:44:06', '2021-06-24 19:51:51'),
(433, '27098405', 'Ticket', 'user_roles', 'select', 'Complaint,Request,Requirement,Customize', 0, 'Type', 'User Roles', 11, '', 'Level_Fast', 'DNY', '', '', '', 'Y', 'N', '2020-12-23 06:44:06', '2022-02-02 09:27:02'),
(431, '27098405', 'Ticket', '_', 'header', '', 0, 'Ticket Details', '_', 7, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 06:44:06', NULL),
(432, '27098405', 'Ticket', 'subject', 'text', '', 0, 'Subject', 'subject', 10, '', 'Level_Fast', 'DNY', '', '', '', 'Y', 'Y', '2020-12-23 06:44:06', '2021-06-25 00:16:44'),
(430, '27098405', 'Ticket', 'created_at', 'date', '', 0, 'Created At', 'created_at', 9, '', '', 'DNY', '', '', '', 'Y', 'N', '2020-12-23 06:44:06', '2021-06-25 00:05:38'),
(429, '27098405', 'Ticket', 'created_by', 'text', '', 0, 'Created By', 'created_by', 8, '', '', 'DNY', '', '', '', 'Y', 'N', '2020-12-23 06:44:06', '2021-06-25 00:06:33'),
(427, '27098405', 'Ticket', 'email_id', 'text', '', 0, 'Email ID', 'email_id', 4, '', 'Level_Fast', 'DNY', '', '', '', 'Y', 'Y', '2020-12-23 06:44:06', '2021-06-25 00:06:53'),
(426, '27098405', 'Ticket', 'mobile', 'text', '', 0, 'Mobile', 'mobile', 3, '', 'Level_Fast', 'DNY', '', '', '', 'Y', 'Y', '2020-12-23 06:44:06', '2021-06-25 00:07:04'),
(425, '27098405', 'Ticket', '_', 'header', '', 0, 'Customer details', '_', 1, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 06:44:06', NULL),
(436, '27098405', 'Ticket', 'status', 'select', 'New', 0, 'Status', 'status', 14, '', 'Level_Fast', 'DNY', '', '', '', 'Y', 'Y', '2020-12-23 06:44:06', '2022-02-02 09:53:39'),
(437, '27098405', 'Ticket', 'sub_status', 'select', ' ', 0, 'Sub Status', 'sub_status', 15, '', 'Level_Fast', 'DNY', '', '', '', 'Y', 'N', '2020-12-23 06:44:06', '2021-06-25 00:07:29'),
(438, '27098405', 'Ticket', 'source', 'select', 'Email,WebPortal,Chat,SMS,Phone,Other Platform', 0, 'Source', 'source', 16, '', 'Level_Fast', 'DNY', '', '', '', 'Y', 'Y', '2020-12-23 06:44:06', '2022-02-02 09:52:43'),
(442, '27098405', 'Ticket', 'department', 'select', 'IT', 0, 'Department', 'department', 22, '', 'Level_Fast', 'SQL', 'department', '', 'department_name', 'Y', 'N', '2020-12-23 06:44:06', NULL),
(443, '27098405', 'Ticket', 'owner', 'text', '', 0, 'Owner', 'owner', 23, '', 'Level_Fast', 'SQL', 'users', '', 'name', 'Y', 'Y', '2020-12-23 06:44:06', '2021-02-03 03:11:18'),
(444, '27098405', 'Ticket', 'tat', 'date', NULL, 0, 'TAT', 'tat', 20, '', 'Level_Fast', 'DNY', '', '', '', 'Y', 'N', '2020-12-23 06:44:06', '2021-10-08 18:43:42'),
(445, '27098405', 'Ticket', 'customer_name', 'text', '', 0, 'Customer Name', 'customer_name', 2, '', 'Level_Fast', 'DNY', '', '', '', 'Y', 'Y', '2020-12-23 06:44:06', '2021-06-25 00:08:43'),
(446, '66146583', 'customer', 'customer_id', 'text', '', 0, 'CustID', 'CustID', 2, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 06:44:06', NULL),
(447, '83127486', 'Product', 'product', 'text', '', 0, 'Product Name', 'product_name', 2, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 06:44:06', NULL),
(448, '83127486', 'Product', 'product_code', 'text', '', 0, 'Product Code', 'product_code', 3, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 06:44:06', NULL),
(449, '83127486', 'Product', 'product_category', 'select', 'Hardware,Software,CRM Applications', 0, 'Product Category', 'product_category', 4, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 06:44:06', NULL),
(450, '83127486', 'Product', 'owner', 'select', '', 0, 'Product Owner', 'owner', 5, '', 'Level_Fast', 'SQL', 'users', '', 'name', 'N', 'N', '2020-12-23 06:44:06', '2021-02-03 03:11:28'),
(451, '83127486', 'Product', '_', 'header', '', 0, 'Product Information', '_', 1, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 06:44:06', NULL),
(452, '27098405', 'Ticket', '_', 'header', '', 0, 'Ticket Action', '_', 21, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 06:44:06', NULL),
(453, '27098405', 'Ticket', 'remarks', 'textarea', '', 0, 'Remarks', 'remarks', 24, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 06:44:06', NULL),
(454, '27098405', 'Ticket', '_', 'header', '', 0, 'Ticket Close', '_', 26, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 06:44:06', NULL),
(456, '27098405', 'Ticket', 'closure_date', 'date', '', 0, 'Closure Date', 'closure_date', 27, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 06:44:06', '2021-06-25 00:18:52'),
(458, '27098405', 'Ticket', 'closure_remarks', 'textarea', '', 0, 'Closure Remarks', 'closure_remarks', 29, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 06:44:06', NULL),
(459, '50508775', 'Category', 'category_name', 'text', NULL, 0, 'Category Name', 'category_name', 0, '', NULL, 'DNY', '', '', '', 'N', 'N', '2020-12-23 06:44:06', '2020-12-24 09:02:25'),
(460, '12535562', 'user', 'department_name', 'select', '', 8, 'Department', 'department_name', 0, '', 'Level_Fast', 'SQL', 'department', '', 'department_name', 'N', 'N', '2020-12-23 06:44:06', '2022-05-02 12:08:18'),
(461, '2762267', 'Source', 'Source', 'text', '', 0, 'Source_name', 'Source', 0, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 06:44:06', NULL),
(462, '27178500', 'RCA', 'RCA_Name', 'text', '', 0, 'RCA_Name', 'RCA_Name', 1, '', 'Level_Fast', 'SQL', 'process_rca', '', 'rca_name', 'N', 'N', '2020-12-23 06:44:06', '2021-06-25 00:47:10'),
(463, '27178500', 'RCA', 'category_name', 'text', '', 0, 'category_name', 'category_name', 2, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 06:44:06', NULL),
(464, '45773764', 'Knowledge_Base', 'kb_titel', 'text', '', 0, 'Titel', 'kb_titel', 0, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 06:44:06', NULL),
(465, '45773764', 'Knowledge_Base', 'Solution', 'text', '', 0, 'Solution', 'Solution', 0, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 06:44:06', NULL),
(466, '45773764', 'Knowledge_Base', 'meta_keywords', 'textarea', '', 0, 'Meta keywords', 'meta_keywords', 0, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 06:44:06', NULL),
(467, '45773764', 'Knowledge_Base', 'meta_description', 'text', '', 0, 'Meta description', 'meta_description', 0, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 06:44:06', NULL),
(468, '45773764', 'Knowledge_Base', 'meta_titel', 'text', '', 0, 'Meta Titel', 'meta_titel', 0, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 06:44:06', NULL),
(469, '79103293', 'Email', 'fromaddress', 'text', '', 0, 'From address', 'fromaddress', 0, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 06:44:06', NULL),
(470, '79103293', 'Email', 'from', 'text', '', 0, 'from', 'from', 0, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 06:44:06', NULL),
(471, '79103293', 'Email', 'reply_toaddress', 'text', '', 0, 'Reply to address', 'reply_toaddress', 0, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 06:44:06', NULL),
(472, '79103293', 'Email', 'reply_to', 'text', '', 0, 'reply to', 'reply_to', 0, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 06:44:06', '2020-12-26 05:00:00'),
(473, '79103293', 'Email', 'senderaddress', 'text', '', 0, 'sender address', 'senderaddress', 0, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 06:44:06', NULL),
(474, '79103293', 'Email', 'sender', 'text', '', 0, 'sender', 'sender', 0, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 06:44:06', NULL),
(475, '79103293', 'Email', 'from_personal', 'text', '', 0, 'from personal', 'from_personal', 0, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 06:44:06', NULL),
(476, '79103293', 'Email', 'from_mailbox', 'text', '', 0, 'from mailbox', 'from_mailbox', 0, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 06:44:06', NULL),
(477, '79103293', 'Email', 'from_host', 'text', '', 0, 'from host', 'from_host', 0, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 06:44:06', NULL),
(478, '79103293', 'Email', 'reply_to_personal', 'text', '', 0, 'reply_to_personal', 'reply_to_personal', 0, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 06:44:06', NULL),
(479, '79103293', 'Email', 'reply_to_mailbox', 'text', '', 0, 'reply_to_mailbox', 'reply_to_mailbox', 0, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 06:44:06', NULL),
(480, '79103293', 'Email', 'reply_to_host', 'text', '', 0, 'reply_to_host', 'reply_to_host', 0, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 06:44:06', NULL),
(481, '79103293', 'Email', 'sender_personal', 'text', '', 0, 'sender_personal', 'sender_personal', 0, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 06:44:06', NULL),
(482, '79103293', 'Email', 'sender_mailbox', 'text', '', 0, 'sender_mailbox', 'sender_mailbox', 0, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 06:44:06', NULL),
(483, '19235190', 'Chat', 'sender_id', 'text', NULL, 0, 'sender_id', 'sender_id', 0, '', 'Current_date', 'DNY', '', '', '', 'N', 'N', '2020-12-23 06:44:06', '2021-11-10 19:17:29'),
(484, '19235190', 'Chat', 'receiver_id', 'text', '', 0, 'receiver_id', 'receiver_id', 0, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 06:44:06', NULL),
(485, '19235190', 'Chat', 'message', 'text', '', 0, 'message', 'message', 0, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 06:44:06', NULL),
(486, '19235190', 'Chat', 'sender_name', 'text', '', 0, 'sender_name', 'sender_name', 0, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 06:44:06', NULL),
(487, '19235190', 'Chat', 'receiver_name', 'text', '', 0, 'receiver_name', 'receiver_name', 0, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 06:44:06', NULL),
(499, '50508775', 'category', 'user', 'text', NULL, 0, 'Customer Name', 'user', 0, NULL, 'Level_Fast', 'DNY', NULL, NULL, NULL, 'N', 'N', '2020-12-26 00:45:48', '2020-12-26 00:45:48'),
(500, '83127486', 'product', 'email', 'text', NULL, 0, 'email', 'email', 0, NULL, 'Current_date', 'DNY', NULL, NULL, NULL, 'N', 'N', '2021-06-24 09:07:24', '2021-11-22 01:01:41'),
(501, '12535562', 'user', 'username', 'text', NULL, 9, 'User ID', 'username', 0, NULL, 'Level_Fast', 'DNY', NULL, NULL, NULL, 'N', 'N', '2021-11-10 20:18:29', '2022-05-02 12:08:29'),
(505, '12535562', 'user', 'designation', 'select', NULL, 10, 'Designation', 'designation', 0, NULL, 'Level_Fast', 'DNY', NULL, NULL, NULL, 'N', 'N', '2021-11-24 09:04:14', '2022-05-02 12:08:41'),
(508, '12535562', 'user', 'Permission', 'select', NULL, 11, 'Permission', 'Permission', 0, NULL, 'Level_Fast', 'DNY', NULL, NULL, NULL, 'N', 'N', '2021-11-29 06:50:25', '2022-05-02 12:08:49'),
(510, '12535562', 'user', 'customer_care_no', 'text', NULL, 12, 'Customer Care No', 'customer_care_no', 0, NULL, 'Level_Fast', 'DNY', NULL, NULL, NULL, 'N', 'N', '2021-12-06 07:03:07', '2022-05-02 12:08:57'),
(511, '12535562', 'user', 'extension_no', 'text', NULL, 13, 'Extension No', 'extension_no', 0, NULL, 'Level_Fast', 'DNY', NULL, NULL, NULL, 'N', 'N', '2021-12-06 07:08:58', '2022-05-02 12:09:01'),
(519, '12535562', 'user', 'type_user', 'select', NULL, 14, 'User Type', 'type_user', 0, NULL, 'Level_Fast', 'DNY', NULL, NULL, NULL, 'N', 'N', '2021-12-07 14:27:40', '2022-05-02 12:09:11');

-- --------------------------------------------------------

--
-- Table structure for table `table_field_list_old`
--

CREATE TABLE `table_field_list_old` (
  `id` int(11) NOT NULL,
  `process_id` varchar(250) DEFAULT NULL,
  `process_name` varchar(250) DEFAULT NULL,
  `field_colm` varchar(250) DEFAULT NULL,
  `field_type` varchar(250) DEFAULT NULL,
  `extra_values` text DEFAULT NULL,
  `order_list_col` int(11) NOT NULL,
  `input_label` varchar(250) DEFAULT NULL,
  `input_name` varchar(250) DEFAULT NULL,
  `preposition` int(250) NOT NULL,
  `user_id` varchar(250) DEFAULT NULL,
  `level` varchar(250) DEFAULT NULL,
  `table_sql` enum('DNY','SQL') NOT NULL DEFAULT 'DNY',
  `table_name` varchar(250) DEFAULT NULL,
  `table_condition` varchar(250) DEFAULT NULL,
  `table_column` varchar(250) DEFAULT NULL,
  `gui_set` enum('N','Y') NOT NULL,
  `data_table` enum('N','Y') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `table_field_list_old`
--

INSERT INTO `table_field_list_old` (`id`, `process_id`, `process_name`, `field_colm`, `field_type`, `extra_values`, `order_list_col`, `input_label`, `input_name`, `preposition`, `user_id`, `level`, `table_sql`, `table_name`, `table_condition`, `table_column`, `gui_set`, `data_table`, `created_at`, `updated_at`) VALUES
(389, '72375898', 'LEAD', 'header', 'header', '', 0, 'header', 'header', 1, '', 'TAT1', 'DNY', '', '', '', 'N', 'N', '2020-12-23 12:14:06', NULL),
(390, '66146583', 'customer', '_', 'header', '', 0, 'Contact information', '_', 1, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 12:14:06', NULL),
(391, '66146583', 'customer', 'owner', 'select', 'user', 0, 'owner', 'owner', 3, '', 'Level_Fast', 'SQL', 'users', '', 'name', 'Y', 'N', '2020-12-23 12:14:06', '2021-02-03 08:41:03'),
(392, '66146583', 'customer', 'customer_name', 'text', '', 0, 'Customer_Name	', 'Customer_Name	', 5, '', 'Level_Fast', 'DNY', '', '', '', 'Y', 'N', '2020-12-23 12:14:06', '2021-10-11 01:35:51'),
(393, '66146583', 'customer', 'mobile', 'text', '', 0, 'Mobile', 'Mobile', 6, '', 'Level_Fast', 'DNY', '', '', '', 'Y', 'N', '2020-12-23 12:14:06', '2021-10-11 01:36:33'),
(394, '66146583', 'customer', 'email_id', 'text', '', 0, 'Email_ID', 'Email_ID', 7, '', 'Level_Fast', 'DNY', '', '', '', 'Y', 'N', '2020-12-23 12:14:06', '2021-10-11 01:36:59'),
(395, '66146583', 'customer', 'fax', 'text', '', 0, 'Fax', 'Fax', 8, '', 'Level_Fast', 'DNY', '', '', '', 'Y', 'N', '2020-12-23 12:14:06', '2021-10-11 01:37:42'),
(396, '66146583', 'customer', 'skype_id', 'text', '', 0, 'Skype Id', 'Skype_Id', 9, '', 'Level_Fast', 'DNY', '', '', '', 'Y', 'N', '2020-12-23 12:14:06', '2021-10-11 01:37:58'),
(397, '66146583', 'customer', '_', 'header', '', 0, 'Address information', '_', 10, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 12:14:06', NULL),
(398, '66146583', 'customer', 'country', 'select', ' ', 0, 'country', 'country', 11, '', 'Level_Fast', 'SQL', 'country', '', 'name', 'Y', 'N', '2020-12-23 12:14:06', '2021-11-09 03:34:30'),
(399, '66146583', 'customer', 'state', 'text', NULL, 0, 'state', 'state', 12, '', 'Level_Fast', 'DNY', '', '', '', 'Y', 'N', '2020-12-23 12:14:06', '2021-11-09 03:23:30'),
(400, '66146583', 'customer', 'city', 'text', NULL, 0, 'city', 'city', 13, '', 'Current_date', 'DNY', '', '', '', 'Y', 'N', '2020-12-23 12:14:06', '2021-11-09 03:23:44'),
(401, '66146583', 'customer', '_', 'header', '', 0, 'Description information', '_', 14, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 12:14:06', NULL),
(402, '66146583', 'customer', 'description', 'textarea', '', 0, 'Description', 'description', 15, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 12:14:06', NULL),
(403, '66146583', 'customer', 'Company_name', 'text', '', 0, 'Company name', 'company_name', 4, '', 'Level_Fast', 'DNY', '', '', '', 'Y', 'N', '2020-12-23 12:14:06', '2021-10-11 01:41:33'),
(404, '12535562', 'user', 'user_id', 'text', '', 0, 'user_id', 'user_id', 0, '', '', 'DNY', '', '', '', 'N', 'N', '2020-12-23 12:14:06', NULL),
(405, '12535562', 'user', 'user_name', 'text', '', 0, 'user_name', 'user_name', 0, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 12:14:06', NULL),
(406, '12535562', 'user', 'user_email', 'text', '', 0, 'user_email', 'user_email', 0, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 12:14:06', NULL),
(407, '12535562', 'user', 'user_pass', 'text', '', 0, 'Password', 'user_pass', 0, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 12:14:06', NULL),
(408, '12535562', 'user', 'user_type', 'select', 'Admin,Maneger,Employee', 0, 'Type', 'user_type', 0, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 12:14:06', NULL),
(409, '12535562', 'user', 'images', 'text', '', 0, 'images', 'images', 0, '', '', 'DNY', '', '', '', 'N', 'N', '2020-12-23 12:14:06', NULL),
(410, '12535562', 'user', 'level_name', 'select', '', 0, 'level_name', 'level_name', 0, '', '', 'SQL', 'create_level', 'level_name', 'level_name', 'N', 'N', '2020-12-23 12:14:06', NULL),
(435, '27098405', 'Ticket', 'sub_category', 'select', '', 0, 'Sub Category', 'sub_category', 13, '', 'Level_Fast', 'SQL', 'process_category', '', 'sub_category', 'Y', 'N', '2020-12-23 12:14:06', '2021-06-25 05:34:51'),
(434, '27098405', 'Ticket', 'category', 'select', '', 0, 'Category', 'category', 12, '', 'Level_Fast', 'SQL', 'process_category', '', 'category_name', 'Y', 'N', '2020-12-23 12:14:06', '2021-06-25 01:21:51'),
(433, '27098405', 'Ticket', 'type', 'select', 'Complaint', 0, 'Type', 'type', 11, '', 'Level_Fast', 'DNY', '', '', '', 'Y', 'N', '2020-12-23 12:14:06', '2021-06-25 05:35:03'),
(431, '27098405', 'Ticket', '_', 'header', '', 0, 'Ticket Details', '_', 7, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 12:14:06', NULL),
(432, '27098405', 'Ticket', 'subject', 'text', '', 0, 'Subject', 'subject', 10, '', 'Level_Fast', 'DNY', '', '', '', 'Y', 'Y', '2020-12-23 12:14:06', '2021-06-25 05:46:44'),
(430, '27098405', 'Ticket', 'created_at', 'date', '', 0, 'Created At', 'created_at', 9, '', '', 'DNY', '', '', '', 'Y', 'N', '2020-12-23 12:14:06', '2021-06-25 05:35:38'),
(429, '27098405', 'Ticket', 'created_by', 'text', '', 0, 'Created By', 'created_by', 8, '', '', 'DNY', '', '', '', 'Y', 'N', '2020-12-23 12:14:06', '2021-06-25 05:36:33'),
(427, '27098405', 'Ticket', 'email_id', 'text', '', 0, 'Email ID', 'email_id', 4, '', 'Level_Fast', 'DNY', '', '', '', 'Y', 'Y', '2020-12-23 12:14:06', '2021-06-25 05:36:53'),
(426, '27098405', 'Ticket', 'mobile', 'text', '', 0, 'Mobile', 'mobile', 3, '', 'Level_Fast', 'DNY', '', '', '', 'Y', 'Y', '2020-12-23 12:14:06', '2021-06-25 05:37:04'),
(425, '27098405', 'Ticket', '_', 'header', '', 0, 'Customer details', '_', 1, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 12:14:06', NULL),
(436, '27098405', 'Ticket', 'status', 'select', 'Open,Hold,Resolve', 0, 'Status', 'status', 14, '', 'Level_Fast', 'DNY', '', '', '', 'Y', 'Y', '2020-12-23 12:14:06', NULL),
(437, '27098405', 'Ticket', 'sub_status', 'select', ' ', 0, 'Sub Status', 'sub_status', 15, '', 'Level_Fast', 'DNY', '', '', '', 'Y', 'N', '2020-12-23 12:14:06', '2021-06-25 05:37:29'),
(438, '27098405', 'Ticket', 'source', 'select', 'Email,WebPortal,Chat,Walk-in,SMS,Phone,Other Platform,IoT,Kiosk', 0, 'Source', 'source', 16, '', 'Level_Fast', 'DNY', '', '', '', 'Y', 'Y', '2020-12-23 12:14:06', '2021-06-25 05:37:45'),
(439, '27098405', 'Ticket', 'source_value', 'text', '', 0, 'Source Value', 'source_value', 17, '', 'Level_Fast', 'DNY', '', '', '', 'Y', 'N', '2020-12-23 12:14:06', '2021-06-25 05:38:03'),
(440, '27098405', 'Ticket', 'voc', 'textarea', '', 0, 'VOC', 'voc', 18, '', 'Level_Fast', 'DNY', '', '', '', 'Y', 'N', '2020-12-23 12:14:06', '2021-06-25 05:38:15'),
(441, '27098405', 'Ticket', 'product', 'text', '', 0, 'Product', 'product', 19, '', 'Level_Fast', 'DNY', '', '', '', 'Y', 'N', '2020-12-23 12:14:06', NULL),
(442, '27098405', 'Ticket', 'department', 'select', 'IT', 0, 'Department', 'department', 22, '', 'Level_Fast', 'SQL', 'department', '', 'department_name', 'Y', 'N', '2020-12-23 12:14:06', NULL),
(443, '27098405', 'Ticket', 'owner', 'text', '', 0, 'Owner', 'owner', 23, '', 'Level_Fast', 'SQL', 'users', '', 'name', 'Y', 'Y', '2020-12-23 12:14:06', '2021-02-03 08:41:18'),
(444, '27098405', 'Ticket', 'tat', 'date', NULL, 0, 'TAT', 'tat', 20, '', 'Level_Fast', 'DNY', '', '', '', 'Y', 'N', '2020-12-23 12:14:06', '2021-10-09 00:13:42'),
(445, '27098405', 'Ticket', 'customer_name', 'text', '', 0, 'Customer Name', 'customer_name', 2, '', 'Level_Fast', 'DNY', '', '', '', 'Y', 'Y', '2020-12-23 12:14:06', '2021-06-25 05:38:43'),
(446, '66146583', 'customer', 'customer_id', 'text', '', 0, 'CustID', 'CustID', 2, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 12:14:06', NULL),
(447, '83127486', 'Product', 'product', 'text', '', 0, 'Product Name', 'product_name', 2, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 12:14:06', NULL),
(448, '83127486', 'Product', 'product_code', 'text', '', 0, 'Product Code', 'product_code', 3, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 12:14:06', NULL),
(449, '83127486', 'Product', 'product_category', 'select', 'Hardware,Software,CRM Applications', 0, 'Product Category', 'product_category', 4, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 12:14:06', NULL),
(450, '83127486', 'Product', 'owner', 'select', '', 0, 'Product Owner', 'owner', 5, '', 'Level_Fast', 'SQL', 'users', '', 'name', 'N', 'N', '2020-12-23 12:14:06', '2021-02-03 08:41:28'),
(451, '83127486', 'Product', '_', 'header', '', 0, 'Product Information', '_', 1, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 12:14:06', NULL),
(452, '27098405', 'Ticket', '_', 'header', '', 0, 'Ticket Action', '_', 21, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 12:14:06', NULL),
(453, '27098405', 'Ticket', 'remarks', 'textarea', '', 0, 'Remarks', 'remarks', 24, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 12:14:06', NULL),
(454, '27098405', 'Ticket', '_', 'header', '', 0, 'Ticket Close', '_', 26, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 12:14:06', NULL),
(456, '27098405', 'Ticket', 'closure_date', 'date', '', 0, 'Closure Date', 'closure_date', 27, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 12:14:06', '2021-06-25 05:48:52'),
(458, '27098405', 'Ticket', 'closure_remarks', 'textarea', '', 0, 'Closure Remarks', 'closure_remarks', 29, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 12:14:06', NULL),
(459, '50508775', 'Category', 'category_name', 'text', NULL, 0, 'Category Name', 'category_name', 0, '', NULL, 'DNY', '', '', '', 'N', 'N', '2020-12-23 12:14:06', '2020-12-24 14:32:25'),
(460, '12535562', 'user', 'department_name', 'select', '', 0, 'Department', 'department_name', 0, '', 'Level_Fast', 'SQL', 'department', '', 'department_name', 'N', 'N', '2020-12-23 12:14:06', NULL),
(461, '2762267', 'Source', 'Source', 'text', '', 0, 'Source_name', 'Source', 0, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 12:14:06', NULL),
(462, '27178500', 'RCA', 'RCA_Name', 'text', '', 0, 'RCA_Name', 'RCA_Name', 1, '', 'Level_Fast', 'SQL', 'process_rca', '', 'rca_name', 'N', 'N', '2020-12-23 12:14:06', '2021-06-25 06:17:10'),
(463, '27178500', 'RCA', 'category_name', 'text', '', 0, 'category_name', 'category_name', 2, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 12:14:06', NULL),
(464, '45773764', 'Knowledge_Base', 'kb_titel', 'text', '', 0, 'Titel', 'kb_titel', 0, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 12:14:06', NULL),
(465, '45773764', 'Knowledge_Base', 'Solution', 'text', '', 0, 'Solution', 'Solution', 0, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 12:14:06', NULL),
(466, '45773764', 'Knowledge_Base', 'meta_keywords', 'textarea', '', 0, 'Meta keywords', 'meta_keywords', 0, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 12:14:06', NULL),
(467, '45773764', 'Knowledge_Base', 'meta_description', 'text', '', 0, 'Meta description', 'meta_description', 0, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 12:14:06', NULL),
(468, '45773764', 'Knowledge_Base', 'meta_titel', 'text', '', 0, 'Meta Titel', 'meta_titel', 0, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 12:14:06', NULL),
(469, '79103293', 'Email', 'fromaddress', 'text', '', 0, 'From address', 'fromaddress', 0, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 12:14:06', NULL),
(470, '79103293', 'Email', 'from', 'text', '', 0, 'from', 'from', 0, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 12:14:06', NULL),
(471, '79103293', 'Email', 'reply_toaddress', 'text', '', 0, 'Reply to address', 'reply_toaddress', 0, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 12:14:06', NULL),
(472, '79103293', 'Email', 'reply_to', 'text', '', 0, 'reply to', 'reply_to', 0, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 12:14:06', '2020-12-26 10:30:00'),
(473, '79103293', 'Email', 'senderaddress', 'text', '', 0, 'sender address', 'senderaddress', 0, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 12:14:06', NULL),
(474, '79103293', 'Email', 'sender', 'text', '', 0, 'sender', 'sender', 0, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 12:14:06', NULL),
(475, '79103293', 'Email', 'from_personal', 'text', '', 0, 'from personal', 'from_personal', 0, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 12:14:06', NULL),
(476, '79103293', 'Email', 'from_mailbox', 'text', '', 0, 'from mailbox', 'from_mailbox', 0, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 12:14:06', NULL),
(477, '79103293', 'Email', 'from_host', 'text', '', 0, 'from host', 'from_host', 0, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 12:14:06', NULL),
(478, '79103293', 'Email', 'reply_to_personal', 'text', '', 0, 'reply_to_personal', 'reply_to_personal', 0, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 12:14:06', NULL),
(479, '79103293', 'Email', 'reply_to_mailbox', 'text', '', 0, 'reply_to_mailbox', 'reply_to_mailbox', 0, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 12:14:06', NULL),
(480, '79103293', 'Email', 'reply_to_host', 'text', '', 0, 'reply_to_host', 'reply_to_host', 0, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 12:14:06', NULL),
(481, '79103293', 'Email', 'sender_personal', 'text', '', 0, 'sender_personal', 'sender_personal', 0, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 12:14:06', NULL),
(482, '79103293', 'Email', 'sender_mailbox', 'text', '', 0, 'sender_mailbox', 'sender_mailbox', 0, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 12:14:06', NULL),
(483, '19235190', 'Chat', 'sender_id', 'text', '', 0, 'sender_id', 'sender_id', 0, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 12:14:06', NULL),
(484, '19235190', 'Chat', 'receiver_id', 'text', '', 0, 'receiver_id', 'receiver_id', 0, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 12:14:06', NULL),
(485, '19235190', 'Chat', 'message', 'text', '', 0, 'message', 'message', 0, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 12:14:06', NULL),
(486, '19235190', 'Chat', 'sender_name', 'text', '', 0, 'sender_name', 'sender_name', 0, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 12:14:06', NULL),
(487, '19235190', 'Chat', 'receiver_name', 'text', '', 0, 'receiver_name', 'receiver_name', 0, '', 'Level_Fast', 'DNY', '', '', '', 'N', 'N', '2020-12-23 12:14:06', NULL),
(499, '50508775', 'category', 'user', 'text', NULL, 0, 'Customer Name', 'user', 0, NULL, 'Level_Fast', 'DNY', NULL, NULL, NULL, 'N', 'N', '2020-12-26 06:15:48', '2020-12-26 06:15:48'),
(500, '83127486', 'product', 'email', 'text', NULL, 0, 'email', 'email', 0, NULL, 'Level_Fast', 'DNY', NULL, NULL, NULL, 'N', 'N', '2021-06-24 14:37:24', '2021-06-24 14:38:10');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `user_id` varchar(250) DEFAULT NULL,
  `username` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `user_type` varchar(250) DEFAULT NULL,
  `group_name` varchar(255) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `images` varchar(250) DEFAULT NULL,
  `level_name` varchar(250) DEFAULT NULL,
  `department_name` varchar(250) DEFAULT NULL,
  `chat_status` enum('Online','Away','Busy','Offline') NOT NULL DEFAULT 'Offline',
  `status_live` enum('success','warning','danger','muted') NOT NULL DEFAULT 'muted',
  `phone_number` varchar(250) DEFAULT NULL,
  `country` varchar(250) DEFAULT NULL,
  `company_name` varchar(100) DEFAULT NULL,
  `designation` varchar(100) DEFAULT NULL,
  `Process_name` varchar(250) DEFAULT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `api_token` varchar(255) DEFAULT NULL,
  `create_ticket_permission` int(11) NOT NULL DEFAULT 0,
  `manage_ticket_permission` int(11) NOT NULL DEFAULT 0,
  `create_customer_permission` int(11) NOT NULL DEFAULT 0,
  `customer_list_permission` int(11) NOT NULL DEFAULT 0,
  `knowledge_base_permission` int(11) NOT NULL DEFAULT 0,
  `email_permission` int(11) NOT NULL DEFAULT 0,
  `report_permission` int(11) NOT NULL DEFAULT 0,
  `process_permission` int(11) NOT NULL DEFAULT 0,
  `user_permission` int(11) NOT NULL DEFAULT 0,
  `access_permission` int(11) NOT NULL DEFAULT 0,
  `status_permission` int(11) NOT NULL DEFAULT 0,
  `category_permission` int(11) NOT NULL DEFAULT 0,
  `country_state_city_permission` int(11) NOT NULL DEFAULT 0,
  `product_permission` int(11) NOT NULL DEFAULT 0,
  `department_permission` int(11) NOT NULL DEFAULT 0,
  `rca_permission` int(11) NOT NULL DEFAULT 0,
  `password_status` int(11) NOT NULL DEFAULT 0,
  `cust_care_no` varchar(255) DEFAULT NULL,
  `exten_no` varchar(100) DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `session_in` varchar(100) DEFAULT NULL,
  `session_out` varchar(100) DEFAULT NULL,
  `login_status` int(11) NOT NULL DEFAULT 0,
  `created_by` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `status` bigint(20) DEFAULT NULL,
  `open_url` varchar(250) DEFAULT NULL,
  `open_condition` enum('N','Y','P') NOT NULL DEFAULT 'N',
  `customer_phone` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_id`, `username`, `name`, `email`, `password`, `user_type`, `group_name`, `type`, `images`, `level_name`, `department_name`, `chat_status`, `status_live`, `phone_number`, `country`, `company_name`, `designation`, `Process_name`, `remember_token`, `api_token`, `create_ticket_permission`, `manage_ticket_permission`, `create_customer_permission`, `customer_list_permission`, `knowledge_base_permission`, `email_permission`, `report_permission`, `process_permission`, `user_permission`, `access_permission`, `status_permission`, `category_permission`, `country_state_city_permission`, `product_permission`, `department_permission`, `rca_permission`, `password_status`, `cust_care_no`, `exten_no`, `ip_address`, `session_in`, `session_out`, `login_status`, `created_by`, `created_at`, `updated_at`, `status`, `open_url`, `open_condition`, `customer_phone`) VALUES
(1, '965966', 'admin123456', 'Admin', 'admin@gmail.com', '$2y$10$QbZB09p01WXDjn3DwJBf8.vFdvIfjoNk1UDaHjbYR.zXaYfv2rcym', 'Admin', NULL, 'Special', 'usermina_profilepic20211127164139.jpg', '', 'Admin', 'Online', 'success', '7275812453', 'India', NULL, 'CEO', 'Ticket', 'GCdF5BauWgXcIfspNo2KAOJeNGfrcdeIz5vKKrVt3AX5tHb1OJ2AbR5HO4jQ', NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, '01206967401', '8017', '127.0.0.1', '2022-05-15 07:47:33', '2022-05-16 03:51:41', 0, 'Admin', '2020-10-13 05:39:18', '2022-05-16 03:51:41', 1, '', 'N', ''),
(48, '26451', 'deepaks', 'Deepak Swami', 'deepakkr@vert-age.com', '$2y$10$nNmLl.3HtNYXvLFNFpdB/.W7iCWLjpdHYxAN4vSEAaSrfa8hSKZIu', 'Support', NULL, 'Special', 'usermina_profilepic20211221122732.jpg', NULL, 'Support', 'Offline', 'success', NULL, NULL, NULL, 'Support', 'Ticket', 'txi6itV8lDqdM7pTUKR3exzi03j0pszQ3Z5oyhfQBkvkTIWNZgGB7tU1f44u', NULL, 1, 1, 1, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, '01206967401', '8014', '192.168.1.101', '2022-05-10 16:29:14', '2022-05-10 18:15:21', 0, 'Admin', '2021-12-20 07:21:45', '2022-05-10 12:45:21', 1, '', 'N', ''),
(49, '64945', 'Siddharth', 'Siddharth Singh', 'siddharth@vert-age.com', '$2y$10$1o6Z0R.tHKnVwc54HC1TUeU1q4VSwAOP/7a6UpS4nDANj5fOKCHAG', 'Development', NULL, 'Special', NULL, NULL, 'Development', 'Offline', 'success', NULL, NULL, NULL, 'Sr. PHP Developer', 'Ticket', 'PU6GWLYD366ZxgrP1oP2oKC3TBLbstsOrV3V2qz2AU3Juw6A3cJW7uC77X7h', NULL, 1, 1, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, '01206967401', '8012', '127.0.0.1', '2022-05-15 04:50:27', '2022-05-15 07:47:10', 0, 'Admin', '2021-12-20 07:24:05', '2022-05-15 07:47:10', 1, '', 'N', '0964316819'),
(50, '48444', 'santosh', 'santosh', 'santosh@vert-age.com', '$2y$10$1o6Z0R.tHKnVwc54HC1TUeU1q4VSwAOP/7a6UpS4nDANj5fOKCHAG', 'Development', NULL, 'Normal', 'usermina_profilepic20220118155839.jpg', NULL, 'Development', 'Offline', 'success', NULL, NULL, NULL, 'PHP DEVELOPER', 'Ticket', 'jNDPi4zrbymlqRh0Beza1A8WguYdLVNAZLcYw2exVQOHXgdqBuI55VcBpkIA', NULL, 1, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '01206967401', '8009', '47.9.185.121', '2022-05-10 10:10:59', '2022-05-10 10:49:14', 0, 'Siddarth Singh', '2021-12-20 07:28:07', '2022-05-10 05:19:14', 1, '', 'N', ''),
(51, '32276', 'dharmender', 'dharmender pal', 'dharmender.pal@vert-age.com', '$2y$10$1o6Z0R.tHKnVwc54HC1TUeU1q4VSwAOP/7a6UpS4nDANj5fOKCHAG', 'Developement', NULL, 'Normal', NULL, NULL, 'Development', 'Offline', 'success', NULL, NULL, NULL, 'PHP DEVELOPER', 'Ticket', 'HWx2vpPZi6oC0LEWZfNBvdOdJH7YNzFYDOn0WA52bhTn46WaiZLuE3yChXqL', NULL, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '01206967401', '8011', '192.168.1.108', '2022-04-23 09:43:12', '2022-04-23 17:17:02', 0, 'Siddarth Singh', '2021-12-20 07:29:51', '2022-04-23 06:17:02', 1, '', 'N', ''),
(52, '15778', 'sunil', 'sunil kumar', 'sunil@vert-age.com', '$2y$10$9s1zEbTcqQS7n6icrcV/TuvfLzbY6TWW4l4GaQne4V4FOuAZbZ3Ci', 'Development', NULL, 'Normal', NULL, NULL, 'Development', 'Offline', 'success', '7275812453', NULL, NULL, 'Sr. PHP Developer', 'Ticket', 'bEzSgxCESYNmV2hMuX6WHzLLpUlL5ZaIP9HAR3NWDp5ScLKzSGRqZcE73cTm', '6kpFSD5esD6fpd6sFrgimxm6aDOGSojMaG9haZV4j7ut6gql7OzD4Hhf3tddqNAY', 1, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '01206967401', '8010', '192.168.1.191', '2022-05-14 05:28:11', '2022-05-14 05:32:32', 0, 'Siddarth Singh', '2021-12-20 07:30:37', '2022-05-14 05:32:32', 1, '', 'N', ''),
(54, '33929', 'sahadev', 'sahadev', 'sahadevmca@gmail.com', '$2y$10$1o6Z0R.tHKnVwc54HC1TUeU1q4VSwAOP/7a6UpS4nDANj5fOKCHAG', 'customer', NULL, NULL, NULL, NULL, 'Admin', 'Offline', 'muted', '9650095791', NULL, 'xspl', 'IT admin', 'Ticket', 'q0bGe7aH0obs24c05r6FocNoLPLu7BB9a8AfSwTRq0Gfz3ei6ouhTSJtNcKp', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, 'customer', '2021-12-20 08:28:28', '2021-12-23 05:50:17', 1, '', 'N', ''),
(55, '65315', 'sunil01', 'sunil rathore', 'rathore.sunil23@gmail.com', '$2y$10$1o6Z0R.tHKnVwc54HC1TUeU1q4VSwAOP/7a6UpS4nDANj5fOKCHAG', 'customer', NULL, NULL, NULL, NULL, 'Admin', 'Offline', 'muted', '9887676677', NULL, 'Xenottabyte Services Pvt. Ltd', 'php', 'Ticket', 'ej3W2NXO4hzdOMjrOGpOnH2mZApcsXt85HLAR2a2QAr7cj6wlPj2HFYE5CpE', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, 'customer', '2021-12-21 00:39:11', '2022-01-31 07:03:28', 1, '', 'N', ''),
(57, '13899', 'ankitsupport', 'ankit sharma', 'ankit.sharma@vert-age.com', '$2y$10$G7qa48QP3T35OmEWdFEeXOgVBj9pj0vA.t4IenwYfN/y/jqQBBB9K', 'Support', NULL, 'Normal', NULL, NULL, 'Support', 'Offline', 'success', NULL, NULL, NULL, 'Support', 'Ticket', 'w3S6jdHAJqFACGT0SDhoYkwdaI04f2VokSi24U7Ns9RdViR7lkYjcFrxScro', NULL, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '01206967401', '8005', '192.168.1.110', '2022-04-28 09:58:31', '2022-04-27 19:02:37', 1, 'Deepak Swami', '2021-12-21 01:20:49', '2022-04-27 22:58:31', 1, '', 'N', ''),
(62, '72842', 'deepaksupport', 'Deepak Kumar', 'deepakkumar@vert-age.com', '$2y$10$UM5NJXWlbrmrRGyR4hwoJufoPEk4saPhgFEdzrLErFENxpavPjyja', 'Support', NULL, 'Normal', NULL, NULL, 'Support', 'Offline', 'success', NULL, NULL, NULL, 'Support', 'Ticket', '6DNLiRXq9yEL8u0zMyrkGGQ5zvW7SO6uhsXBN7Pde5fkRqlytGkOhaDFFkQo', NULL, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '01206967401', '8019', '103.48.197.230', '2022-04-28 12:37:57', '2022-03-14 15:52:33', 1, 'Deepak Swami', '2021-12-24 01:49:31', '2022-04-28 01:37:57', 1, '', 'N', ''),
(63, '35487', 'pooja.gupta', 'pooja gupta', 'pooja.gupta@vert-age.com', '$2y$10$aq9iDf8O6j09UFUoFgHaaOiSFIRhKTEt4DVLgUvnX/j5iAD9R1Bpe', 'Support', NULL, 'Normal', NULL, NULL, 'Support', 'Offline', 'success', NULL, NULL, NULL, 'Support', 'Ticket', 'nhjHC3lGdROPfgJL2m8ZFHgjoBkfAAQTBOryu76XG5YSuPhnwRyJSjC0jRp0', NULL, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '01206967401', '8016', '192.168.1.104', '2022-04-28 10:27:59', '2022-04-28 10:35:10', 0, 'Deepak Swami', '2021-12-24 04:19:07', '2022-04-27 23:35:10', 1, '', 'N', ''),
(64, '92544', 'Praveen.yadav', 'Praveen.yadav', 'praveenyadav@vert-age.com', '$2y$10$P2dKQXjAnMyszL3SN2sRS.VAjSLkvSjyHgdFBTw4rD3Al6Z76U1Pi', 'Support', NULL, 'Normal', NULL, NULL, 'Support', 'Offline', 'success', NULL, NULL, NULL, 'Support', 'Ticket', 'bpugsSr05vWSwwAZaeRVMUrYKZkQIBJvnSFkkKrpjjCKJyb1tJE1wAoNjl2j', NULL, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '01206967401', '8013', '192.168.1.107', '2022-04-28 11:14:48', '2022-03-31 18:14:44', 1, 'Deepak Swami', '2021-12-24 04:31:03', '2022-04-28 00:14:48', 1, '', 'N', ''),
(66, '78764', 'tushar', 'tushar rajvanshi', 'tushar@vert-age.com', '$2y$10$Bwyc6EfyT2vDhNtzRxZKQuK3zFLcL55Y4.4osvHBY4aPvd4k4PAeq', 'Support', NULL, 'Normal', NULL, NULL, 'Support', 'Offline', 'success', NULL, NULL, NULL, 'Support', 'Ticket', 'cmcE2P1FlI85jgdwiCp48WTo9ZBLB07QyBYSvTjeWa7LnQdq2C0bJXyn8L36', NULL, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '01206967401', '8006', '192.168.1.114', '2022-04-28 09:45:32', '2022-04-09 10:36:01', 1, 'Deepak Swami', '2021-12-24 05:51:37', '2022-04-27 22:45:32', 1, '', 'N', ''),
(68, '33750', 'Sunil', 'Sunil', 'sunil@vert-age.com', '$2y$10$Hdjg1XqomjDkE5A59uKxOea7/oJ2rjpXJ2GxwLkWqVr1DRZKsj.96', 'customer', NULL, NULL, NULL, NULL, 'IT', 'Offline', 'muted', '1234567890', NULL, 'vert', 'php', 'Ticket', 'U1o6ldFHoYeQ8jEJswDhXhteyEzeaFXsgwH87pNRf51D8XzYlkkgcJe150Yk', '6kpFSD5esD6fpd6sFrgimxm6aDOGSojMaG9haZV4j7ut6gql7OzD4Hhf3tddqNAY', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, 'customer', '2021-12-28 01:39:16', '2022-04-25 22:00:25', 1, '', 'N', ''),
(70, '77517', 'rishabh', 'Rishabh', 'rishabh@vert-age.com', '$2y$10$1o6Z0R.tHKnVwc54HC1TUeU1q4VSwAOP/7a6UpS4nDANj5fOKCHAG', 'Development', NULL, 'Normal', NULL, NULL, 'Development', 'Offline', 'success', NULL, NULL, NULL, 'PHP DEVELOPER', 'Ticket', '3MGx7qBaixccjA6eujyaM10q8X8an3IlQWBm2Yw60GWhto4o6rnWO1Lc7eij', NULL, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '01206967401', '8020', '192.168.1.104', '2022-05-10 17:17:06', '2022-05-10 19:08:53', 0, 'Siddharth Singh', '2021-12-29 07:45:13', '2022-05-10 13:38:53', 1, '', 'N', ''),
(71, '4682', 'Mani', 'Manikant Verma', 'manikant.verma@vert-age.com', '$2y$10$EJD.xR3rZRco1pw2zNupA.VS0/aH.EXC273Q0QL8jur1jjgWTGuai', 'customer', NULL, NULL, NULL, NULL, 'IT', 'Offline', 'muted', '9716103639', NULL, 'Xspl', 'IT', 'Ticket', 'q7s0mrs3WW6IOWz1BZrZzuctizUHuqlUd3vsrrUvo6BlCuTG5kEH57X4AtSh', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, 'customer', '2021-12-30 05:53:58', '2022-01-05 00:13:33', 1, '', 'N', ''),
(72, '68499', 'Amriteshsingh', 'Amritesh singh', 'amritesh@citicollections.com', '$2y$10$bVy6rZKXM3CMq9LVB6amlucyvj3dcqaMkvtYooRv3YQlbDWpOUpcW', 'customer', NULL, NULL, NULL, NULL, 'IT', 'Offline', 'muted', '7982547071', NULL, 'Di management  Noida', 'IT AND ADMIN SUPPORTS', 'Ticket', '4D2puoCifRiftlY8hMcLHDfztSOloucyA1R1RA8sFjbPbNvYWW1v4ZNnGWNf', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, 'customer', '2021-12-30 06:26:15', '2022-01-07 03:48:58', 1, '', 'N', ''),
(73, '82464', '85454', 'adam', 'agent@gmail.com', '$2y$10$2AvgC69tYUJCAswxpg24sulZDJgXmiyRczk1/TCIrTf4ttSCCXk9q', 'customer', NULL, NULL, NULL, NULL, 'IT', 'Offline', 'muted', '4464646464', NULL, 'j4546465', '4654465', 'Ticket', 'WlfPVoeW9tc7cvbJDB0QrSa6j2KepyjuhIpF9LyF', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, 'customer', '2021-12-30 07:16:18', '2021-12-30 07:16:18', 1, '', 'N', ''),
(77, '60237', 'Sanjeevs', 'Sanjeev Sharma', 'sanjeev@vert-age.com', '$2y$10$l6lVPUhnSpAljQ34OBznuuO3zycukQmJPt8re8AgHRToP55/Auidy', 'Sales', NULL, 'Special', NULL, NULL, 'Sales', 'Offline', 'success', NULL, NULL, NULL, 'Director', 'Ticket', 'I9j4BSh2xlk6zJLaYE98ZW7mmGH3cbhhZq2ytesH0elysEr2tw89u211tr0i', NULL, 1, 1, 1, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, '01206967401', '8004', '192.168.1.105', '2022-01-14 14:26:45', '2022-01-14 14:32:58', 0, 'Admin', '2022-01-03 03:22:19', '2022-01-17 02:14:55', 1, '', 'N', ''),
(78, '42059', 'accounts', 'Vikas Jha', 'accounts@vert-age.com', '$2y$10$xPUA15n.2iRljGkAbCcGkOK8grkh/WLCRFNT2aj.GGKBvTC5SxTV6', 'Sales', NULL, 'Normal', NULL, NULL, 'Sales', 'Offline', 'success', NULL, NULL, NULL, 'Account', 'Ticket', '0h0jlvsrfc1doaISqg5LduqglRPvvqz8Dq6x4jxYQVvc2I6I11UhZOUn80H3', NULL, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, '01206967401', '8002', '192.168.1.125', '2022-02-09 09:22:31', NULL, 1, 'Sanjeev Sharma', '2022-01-03 03:25:50', '2022-02-08 22:22:31', 1, '', 'N', ''),
(79, '31397', 'sahadevs', 'sahadev Pal', 'sahadev@vert-age.com', '$2y$10$z2qzRf1muZqfpZkMVGUU/efit.AQH/RcRjqHGpXwR0eXH6QMBz6j.', 'Administration', NULL, 'Special', NULL, NULL, 'Administration', 'Offline', 'success', NULL, NULL, NULL, 'Director', 'Ticket', 'UNhPnmfbXNiTfNHChqi5OshpwWtbRNy9eAcxqF9YfIdWZGZXunNKaqEL7Moi', NULL, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, '01206967401', '8017', '192.168.1.116', '2022-04-28 12:31:33', '2022-04-12 11:54:02', 1, 'Admin', '2022-01-03 03:39:35', '2022-04-28 01:31:33', 1, '', 'N', ''),
(80, '5386', 'hr', 'Sabnam Bano', 'hr@vert-age.com', '$2y$10$qX7mA/JP8PdHpWLa4TEKlOcHgQCWGmA7iRjdAu1GxUQLOSWzubp9C', 'Administration', NULL, 'Normal', NULL, NULL, 'Administration', 'Offline', 'success', NULL, NULL, NULL, 'HR', 'Ticket', 'sYZZj6aoCtEqHM9QqJNrgZ6hRYJg7EczUJaocPkv', NULL, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '01206967401', '8003', NULL, NULL, NULL, 0, 'sahadev Pal', '2022-01-03 03:43:55', '2022-01-03 03:43:55', 1, '', 'N', ''),
(81, '24820', 'marketing', 'Rohit Dixit', 'marketing@vert-age.com', '$2y$10$SKmvLfCYfOB0JIaWAV7r7eWbmRX.G.5jNdwMwlkFxzs2NsT1Uh1xS', 'Administration', NULL, 'Normal', NULL, NULL, 'Administration', 'Offline', 'success', NULL, NULL, NULL, 'Marketing', 'Ticket', 'o8kBo9z6mXsvyEz9RjapIa3fdoyroQsUlSn1PSjgysmgN5AuJSyaReFQmiex', NULL, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '01206967401', '8008', '192.168.1.111', '2022-04-15 10:37:14', '2022-03-21 19:04:00', 1, 'sahadev Pal', '2022-01-03 03:47:07', '2022-04-14 23:37:14', 1, '', 'N', ''),
(82, '34280', 'Sanjay', 'Sanajy Rathi', 'admin@vert-age.com', '$2y$10$J7/sKNPiNU1EGxIcaJOOAuxaJSf4lUTwl/AAfUb3Y/W5Sx1ikLnbm', 'Administration', NULL, 'Normal', NULL, NULL, 'Administration', 'Offline', 'success', NULL, NULL, NULL, 'Administration', 'Ticket', 'XIr75OMH4vzZ6OthhAGaTqts8FLDivAbrms9uUcmZycEU8cl12CsUTh0chzf', NULL, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '01206967401', '8001', '122.176.38.177', '2022-02-19 15:53:11', '2022-02-19 17:28:10', 0, 'sahadev Pal', '2022-01-03 03:48:40', '2022-02-19 06:28:10', 1, '', 'N', ''),
(83, '14702', 'Customer', 'David', 'david.a@talktel', '$2y$10$e6DyUp1tt4DG/yfEi1mNBuFZXeZSkbveIdmV1r.bPg4XML6hsWLXK', 'customer', NULL, NULL, NULL, NULL, 'IT', 'Offline', 'muted', '6382746177', NULL, 'Talktel solution and services pvt ltd', 'IT Head', 'Ticket', '5q3KGKLyH5R297mTg1KXizcGwKOAMrjbEF8X10dr', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, 'customer', '2022-01-04 04:39:29', '2022-01-04 04:39:29', 1, '', 'N', ''),
(84, '53735', 'customer', 'David', 'david.a@talktel.in', '$2y$10$UYQvoiuWPeWxSzX4jA5MI.qU.CKlL.hHLIJpCelRO66Pvs6OF32uq', 'customer', NULL, NULL, NULL, NULL, 'IT', 'Offline', 'muted', '6382746177', NULL, 'Talktel solution and services pvt Ltd', 'IT Head', 'Ticket', '5q3KGKLyH5R297mTg1KXizcGwKOAMrjbEF8X10dr', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, 'customer', '2022-01-04 04:41:49', '2022-01-04 04:41:49', 1, '', 'N', ''),
(85, '33936', 'sunil.kumar', 'Sunil Kumar', 'sunil.kumar@citicollections.com', '$2y$10$B.6Pyt9x/4K9iwG1q0.6PerdVjBKKZOFbBIrjNGHW8uKRiJzNWe8S', 'customer', NULL, NULL, NULL, NULL, 'IT', 'Offline', 'muted', '8750580437', NULL, 'Citi collections IND Pvt Ltd', 'IT', 'Ticket', 'kHfbm5XadV646Lr5yOxBmZE3nqo5BvVUqO4pmjpy', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, 'customer', '2022-01-04 05:28:55', '2022-01-04 05:28:55', 1, '', 'N', ''),
(86, '4923', '8800734745', 'Santosh', 'sunil.dubey@citicollections.com', '$2y$10$3JjsfmXFWxzBM9GzLDvPbOJ8M0zihZYJv4aM/DdbmhY6CdRf4SJiC', 'customer', NULL, NULL, NULL, NULL, 'IT', 'Offline', 'muted', '8800734745', NULL, 'Dimanagement', 'IT person', 'Ticket', '2R4h8Ku2LpUwGOulWUnWzoMlHdXGf87aKueuMgTw', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, 'customer', '2022-01-05 04:59:00', '2022-01-05 04:59:00', 1, '', 'N', ''),
(87, '43800', '12345', 'Adarsh', 'adarsh@jumbokonexionsventures.com', '$2y$10$4uWdUdVi/5oAqfQpPxafAe7ZFUe7EsKqnyb3U6yAtkPEgbyC.tSWe', 'customer', NULL, NULL, NULL, NULL, 'IT', 'Offline', 'muted', '8383843066', NULL, 'Konexions back office service Pvt.ltd', 'It team', 'Ticket', 'zMZMZhWm8PwxsS6LOnEb8XmOa3gHry6COrzeUgzp', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, 'customer', '2022-01-06 04:49:09', '2022-01-06 04:49:09', 1, '', 'N', ''),
(88, '33119', 'vpsc', 'vinay', 'vinay.chauhan@busiesseye.co.in', '$2y$10$fFZcFUqnbBsfY4IIKOvuVup5A/bk6bqPSCSycZtgBSVbpHf/reg.q', 'customer', NULL, NULL, NULL, NULL, 'IT', 'Offline', 'muted', '8287876305', NULL, 'businesseye', 'IT head', 'Ticket', '5racVwwefehCOfYBatpSheBqZSmgYSbGT44wwjsB', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, 'customer', '2022-01-06 05:04:28', '2022-01-06 05:04:28', 1, '', 'N', ''),
(89, '78121', 'vpsc', 'vinay', 'vinay.chauhan@businesseye.co.in', '$2y$10$PnVWyWcwLmh2nWNXBlOfc.RCRoVRxbXMiqVwUDjvM27KOrZUdyzbS', 'customer', NULL, NULL, NULL, NULL, 'IT', 'Offline', 'muted', '8287876305', NULL, 'businesseye', 'IT head', 'Ticket', '5racVwwefehCOfYBatpSheBqZSmgYSbGT44wwjsB', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, 'customer', '2022-01-06 05:12:51', '2022-01-06 05:12:51', 1, '', 'N', ''),
(90, '71157', 'Elevate', 'deepak', 'it.elevate05@gmail.com', '$2y$10$j6sfjLsKOSunnuFlpD13CuCB1vOlmkNn.qp85tTUcy7cJmVftmbnu', 'customer', NULL, NULL, NULL, NULL, 'IT', 'Offline', 'muted', '9599476182', NULL, 'Elevate BPO Services Pvt. Ltd.', 'IT', 'Ticket', 'Bv4QMKxmkf2fXeRXCE7PHiNEnZXdgQfCZfar3Y4M', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, 'customer', '2022-01-07 01:56:19', '2022-01-07 01:56:19', 1, '', 'N', ''),
(91, '91475', 'Santosh', 'Santosh', 'santosh@vert-age.com', '$2y$10$VYywAQW7VHuCUSSuqRZbh.dv6LyuE3dEiFZlnTCjMMVVCG3fKEiQO', 'customer', NULL, NULL, NULL, NULL, 'IT', 'Offline', 'muted', '1234567890', NULL, 'Vert-Age', 'asdf', 'Ticket', 'iTFYA8mbahC2DgOqHvXg8nLulqiIuQnC46rIZx7eTWDkIaKmstNUifxqlwfJ', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, 'customer', '2022-01-07 02:09:43', '2022-04-04 02:23:33', 1, '', 'N', ''),
(92, '74037', 'Mohitpal', 'Mohit pal', 'it@kuberconsultants.com', '$2y$10$WHDOKLMGKyIPtyyeq9NbFeGDfucco6neMR4ieZ3kujmPnXVA4MPki', 'customer', NULL, NULL, NULL, NULL, 'IT', 'Offline', 'muted', '8800581449', NULL, 'Kuber consultants', 'IT ENGINEER', 'Ticket', 'edZCi8XqJJarMz5uMQFC1fsJgZTasAAK6UXWkpgJZyFrMlrBNa0GONE6msFi', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, 'customer', '2022-01-07 03:05:20', '2022-01-07 04:16:28', 1, '', 'N', ''),
(94, '57145', 'arun1.seth', 'Arun Seth', 'arun.seth@businesseye.co.in', '$2y$10$9D3mMYLQjxzN2si98LaFr.1P1..hxoAs4yimbMsiuAvAtIIK7Ulye', 'customer', NULL, NULL, NULL, NULL, 'IT', 'Offline', 'muted', '9650233877', NULL, 'Business Eye', 'Business Head', 'Ticket', 'i1yQ3e8iwrHqxaoCbmCrE8JlnX8snJ4kVxoW0zut5WiVdxSmk8q8zDFipcex', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, '2022-01-14 12:57:46', 0, 'customer', '2022-01-12 06:52:47', '2022-01-25 05:14:44', 1, '', 'N', ''),
(95, '80412', 'rohit32111', 'Rohit dixit', 'rdixit740@gmail.com', '$2y$10$s.AIHSMqAPiAxHqkLK9xt.0/cCTVmJL1vTN7xlkHSoecMY/0p/Joi', 'customer', NULL, NULL, NULL, NULL, 'IT', 'Offline', 'muted', '9643052868', NULL, 'vertage', 'Digital marketing manager', 'Ticket', 'N5N8oClISElpIsKVS5BC6R5IH1vLIVwENDI0peZlf1otQuEAslbq2s8LrFOy', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, 'customer', '2022-01-18 00:22:43', '2022-01-18 01:43:55', 1, '', 'N', ''),
(96, '30082', 'it.elevate05@gmail.com', 'deepak', 'it.elevate05@gmail.com', '$2y$10$cUwOiDPcESA/wC1p6qjw6.Fc6Epcl2zbmDQKAGkydKFDnRQ9c2wmS', 'customer', NULL, NULL, NULL, NULL, 'IT', 'Offline', 'muted', '9599476182', NULL, 'elevate bpo services pvt. ltd.', 'IT', 'Ticket', '9FTbu7EtaspGHj00KdgyI9QSAlAmPffXs1icjvUD', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, 'customer', '2022-02-03 00:55:51', '2022-02-03 00:55:51', 1, '', 'N', ''),
(97, '61840', 'Demo', 'Krishnan Sir', 'v.krishnan@jumbokonexionsventures.com', '$2y$10$l2tWCavnzDKb9fO0auXn.e1Bua7NAwT4.FxNSQkZiYHA1He6YVowu', 'Demo', NULL, 'Special', NULL, NULL, 'Demo', 'Offline', 'success', NULL, NULL, NULL, 'CEO', 'Ticket', '94C30GLsJzVahmfTgIwRVWl3FoDtHnAcxMijQdqbBBY6bJj2WSKLhU0THDyX', NULL, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 1, 1, 0, 1, 1, 1, 1, '01206967401', '8012', '192.168.1.171', '2022-04-02 10:30:43', '2022-03-31 18:22:57', 1, 'Admin', '2022-03-31 07:08:12', '2022-04-01 23:30:43', 1, '', 'N', ''),
(99, '30029', 'user1', 'user1', 'dipravindi@gmail.com', '$2y$10$4wo4qvrCdIZv4ufhY.h7CunmhDOnbg90HiqYUnnZTX8.MZs8tyIPu', 'Demo', NULL, 'Special', NULL, NULL, 'Demo', 'Offline', 'success', NULL, NULL, NULL, 'Director', 'Ticket', '0pstHEwkB3P7uIlHHxc3hKFIGK6qadUBUsrF1huW', NULL, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 1, 1, 0, 1, 1, 1, 0, '01206967401', '1234', NULL, NULL, NULL, 0, 'Krishnan Sir', '2022-03-31 07:35:40', '2022-03-31 07:35:40', 1, '', 'N', ''),
(100, '60867', 'DevelopmentID', 'Development', 'demo_Development@gmail.com', '$2y$10$o/UjILL/XqqTVKKULezI0ubcUymU42Ufng6zBZZQ9dWFXT0MO7o0K', 'Development', NULL, 'Special', NULL, NULL, 'HR', 'Offline', 'success', NULL, NULL, NULL, 'Sr. PHP Developer', 'Ticket', 'HuBFxXmBfaulStjXDnkEqOtdV046rN2bbkZEQisR', NULL, 1, 1, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '01206967401', '7890', NULL, NULL, NULL, 0, 'Admin', '2022-04-06 03:48:57', '2022-04-07 02:03:24', 1, '', 'N', ''),
(101, '62972', 'djana', 'Deepak', 'djana@vert-age.com', '$2y$10$P.CiRwX5R7o68pHt.0HmfOJC4pedMQLfkDs7O/tBQncV4LWAVoWly', 'Support', NULL, 'Normal', NULL, NULL, 'Support', 'Offline', 'success', NULL, NULL, NULL, 'Support', 'Ticket', 'h7YJ9TVibKeus82fUDfmnugNxbLjpkCuIGBv7CXR6jHn7TTelxklpziPhe90', NULL, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '01206967401', '8001', '192.168.1.171', '2022-04-15 14:03:53', '2022-04-15 14:04:12', 0, 'Deepak Swami', '2022-04-07 00:09:40', '2022-04-15 03:04:12', 1, '', 'N', '');

-- --------------------------------------------------------

--
-- Table structure for table `users123`
--

CREATE TABLE `users123` (
  `id` int(11) NOT NULL,
  `user_id` varchar(250) DEFAULT NULL,
  `username` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `user_type` varchar(250) DEFAULT NULL,
  `group_name` varchar(255) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `images` varchar(250) DEFAULT NULL,
  `level_name` varchar(250) DEFAULT NULL,
  `department_name` varchar(250) DEFAULT NULL,
  `chat_status` enum('Online','Away','Busy','Offline') NOT NULL DEFAULT 'Offline',
  `status_live` enum('success','warning','danger','muted') NOT NULL DEFAULT 'muted',
  `phone_number` varchar(250) DEFAULT NULL,
  `country` varchar(250) DEFAULT NULL,
  `company_name` varchar(100) DEFAULT NULL,
  `designation` varchar(100) DEFAULT NULL,
  `Process_name` varchar(250) DEFAULT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `api_token` varchar(255) DEFAULT NULL,
  `create_ticket_permission` int(11) NOT NULL DEFAULT 0,
  `manage_ticket_permission` int(11) NOT NULL DEFAULT 0,
  `create_customer_permission` int(11) NOT NULL DEFAULT 0,
  `customer_list_permission` int(11) NOT NULL DEFAULT 0,
  `knowledge_base_permission` int(11) NOT NULL DEFAULT 0,
  `email_permission` int(11) NOT NULL DEFAULT 0,
  `report_permission` int(11) NOT NULL DEFAULT 0,
  `process_permission` int(11) NOT NULL DEFAULT 0,
  `user_permission` int(11) NOT NULL DEFAULT 0,
  `access_permission` int(11) NOT NULL DEFAULT 0,
  `status_permission` int(11) NOT NULL DEFAULT 0,
  `category_permission` int(11) NOT NULL DEFAULT 0,
  `country_state_city_permission` int(11) NOT NULL DEFAULT 0,
  `product_permission` int(11) NOT NULL DEFAULT 0,
  `department_permission` int(11) NOT NULL DEFAULT 0,
  `rca_permission` int(11) NOT NULL DEFAULT 0,
  `password_status` int(11) NOT NULL DEFAULT 0,
  `cust_care_no` varchar(255) DEFAULT NULL,
  `exten_no` varchar(100) DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `session_in` varchar(100) DEFAULT NULL,
  `session_out` varchar(100) DEFAULT NULL,
  `login_status` int(11) NOT NULL DEFAULT 0,
  `created_by` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `status` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users123`
--

INSERT INTO `users123` (`id`, `user_id`, `username`, `name`, `email`, `password`, `user_type`, `group_name`, `type`, `images`, `level_name`, `department_name`, `chat_status`, `status_live`, `phone_number`, `country`, `company_name`, `designation`, `Process_name`, `remember_token`, `api_token`, `create_ticket_permission`, `manage_ticket_permission`, `create_customer_permission`, `customer_list_permission`, `knowledge_base_permission`, `email_permission`, `report_permission`, `process_permission`, `user_permission`, `access_permission`, `status_permission`, `category_permission`, `country_state_city_permission`, `product_permission`, `department_permission`, `rca_permission`, `password_status`, `cust_care_no`, `exten_no`, `ip_address`, `session_in`, `session_out`, `login_status`, `created_by`, `created_at`, `updated_at`, `status`) VALUES
(1, '965966', 'admin123456', 'Admin', 'admin@gmail.com', '$2y$10$QbZB09p01WXDjn3DwJBf8.vFdvIfjoNk1UDaHjbYR.zXaYfv2rcym', 'Admin', NULL, 'Special', 'usermina_profilepic20211127164139.jpg', '', 'Admin', 'Online', 'success', '72758124242', 'India', NULL, 'CEO', 'Ticket', 'W9re7rDpz3nfrSXmDxBprQ534Bp6uNMjZpT3X4IOyrToW403wTPTikpzNvtg', NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, '01206967401', '8017', '192.168.1.109', '2022-04-25 18:54:46', '2022-04-23 18:59:11', 1, 'Admin', '2020-10-13 11:09:18', '2022-04-25 14:19:02', 1),
(48, '26451', 'deepaks', 'Deepak Swami', 'deepakkr@vert-age.com', '$2y$10$nNmLl.3HtNYXvLFNFpdB/.W7iCWLjpdHYxAN4vSEAaSrfa8hSKZIu', 'Support', NULL, 'Special', 'usermina_profilepic20211221122732.jpg', NULL, 'Support', 'Offline', 'success', NULL, NULL, NULL, 'Support', 'Ticket', 'l4UPpge2Ag5dC1GUuDkEIS663WJlqncSLhcjhp7ci60dMx1rAKDdSxDWC8hE', NULL, 1, 1, 1, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, '01206967401', '8014', '192.168.1.101', '2022-04-25 10:20:09', '2022-04-22 19:45:58', 1, 'Admin', '2021-12-20 12:51:45', '2022-04-25 04:50:09', 1),
(49, '64945', 'Siddharth', 'Siddharth Singh', 'siddharth@vert-age.com', '$2y$10$1o6Z0R.tHKnVwc54HC1TUeU1q4VSwAOP/7a6UpS4nDANj5fOKCHAG', 'Development', NULL, 'Special', NULL, NULL, 'Development', 'Offline', 'success', NULL, NULL, NULL, 'Sr. PHP Developer', 'Ticket', 'oXFPLdUEyyos9IxM4Yu41qXCiEQeZGAd42gqffdpwduCahk1DPLOWqrClaVb', NULL, 1, 1, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, '01206967401', '8012', '192.168.1.109', '2022-04-25 18:54:06', '2022-04-25 20:18:57', 0, 'Admin', '2021-12-20 12:54:05', '2022-04-25 14:48:57', 1),
(50, '48444', 'santosh', 'santosh', 'santosh@vert-age.com', '$2y$10$1o6Z0R.tHKnVwc54HC1TUeU1q4VSwAOP/7a6UpS4nDANj5fOKCHAG', 'Development', NULL, 'Normal', 'usermina_profilepic20220118155839.jpg', NULL, 'Development', 'Offline', 'success', NULL, NULL, NULL, 'PHP DEVELOPER', 'Ticket', 'Sw8ZMJU9U3AG2pmE7p6VF3KFnbsrBWGmXvkBGQ2O3lNYwjlXiATEZ1DXrkey', NULL, 1, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '01206967401', '8009', '192.168.1.106', '2022-04-25 11:02:24', '2022-04-23 15:12:19', 1, 'Siddarth Singh', '2021-12-20 12:58:07', '2022-04-25 05:32:24', 1),
(51, '32276', 'dharmender', 'dharmender pal', 'dharmender.pal@vert-age.com', '$2y$10$1o6Z0R.tHKnVwc54HC1TUeU1q4VSwAOP/7a6UpS4nDANj5fOKCHAG', 'Developement', NULL, 'Normal', NULL, NULL, 'Development', 'Offline', 'success', NULL, NULL, NULL, 'PHP DEVELOPER', 'Ticket', 'HWx2vpPZi6oC0LEWZfNBvdOdJH7YNzFYDOn0WA52bhTn46WaiZLuE3yChXqL', NULL, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '01206967401', '8011', '192.168.1.108', '2022-04-23 09:43:12', '2022-04-23 17:17:02', 0, 'Siddarth Singh', '2021-12-20 12:59:51', '2022-04-23 11:47:02', 1),
(52, '15778', 'sunil', 'sunil kumar', 'sunil@vert-age.com', '$2y$10$9s1zEbTcqQS7n6icrcV/TuvfLzbY6TWW4l4GaQne4V4FOuAZbZ3Ci', 'Development', NULL, 'Normal', NULL, NULL, 'Development', 'Offline', 'success', '7275812453', NULL, NULL, 'Sr. PHP Developer', 'Ticket', 'Ce2Iq1U3OuTBwc5mWPVlnBkzMrppsxTgEWOqeXNJ3YLr6PKhMUSQKBYDT5eO', 'XTv8xJVkqwCU1VbxoikZiVB0WZw6kvKprE2ZcDBOFHyU8kZtl1WR5YwkpXXEsLJK', 1, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '01206967401', '8010', '192.168.1.113', '2022-04-28 14:16:11', '2022-04-25 16:52:10', 1, 'Siddarth Singh', '2021-12-20 13:00:37', '2022-04-28 08:46:11', 1),
(54, '33929', 'sahadev', 'sahadev', 'sahadevmca@gmail.com', '$2y$10$1o6Z0R.tHKnVwc54HC1TUeU1q4VSwAOP/7a6UpS4nDANj5fOKCHAG', 'customer', NULL, NULL, NULL, NULL, 'Admin', 'Offline', 'muted', '9650095791', NULL, 'xspl', 'IT admin', 'Ticket', 'q0bGe7aH0obs24c05r6FocNoLPLu7BB9a8AfSwTRq0Gfz3ei6ouhTSJtNcKp', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, 'customer', '2021-12-20 13:58:28', '2021-12-23 11:20:17', 1),
(55, '65315', 'sunil01', 'sunil rathore', 'rathore.sunil23@gmail.com', '$2y$10$1o6Z0R.tHKnVwc54HC1TUeU1q4VSwAOP/7a6UpS4nDANj5fOKCHAG', 'customer', NULL, NULL, NULL, NULL, 'Admin', 'Offline', 'muted', '9887676677', NULL, 'Xenottabyte Services Pvt. Ltd', 'php', 'Ticket', 'ej3W2NXO4hzdOMjrOGpOnH2mZApcsXt85HLAR2a2QAr7cj6wlPj2HFYE5CpE', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, 'customer', '2021-12-21 06:09:11', '2022-01-31 12:33:28', 1),
(57, '13899', 'ankitsupport', 'ankit sharma', 'ankit.sharma@vert-age.com', '$2y$10$G7qa48QP3T35OmEWdFEeXOgVBj9pj0vA.t4IenwYfN/y/jqQBBB9K', 'Support', NULL, 'Normal', NULL, NULL, 'Support', 'Offline', 'success', NULL, NULL, NULL, 'Support', 'Ticket', 'OOY49rHtDKE2am1r1cIILhQTOg3aQIlhRCufU1cEfaU7I0tC0DpfRqoCgi0Z', NULL, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '01206967401', '8005', '192.168.1.110', '2022-04-25 10:07:58', '2022-04-22 17:56:12', 1, 'Deepak Swami', '2021-12-21 06:50:49', '2022-04-25 04:37:58', 1),
(62, '72842', 'deepaksupport', 'Deepak Kumar', 'deepakkumar@vert-age.com', '$2y$10$UM5NJXWlbrmrRGyR4hwoJufoPEk4saPhgFEdzrLErFENxpavPjyja', 'Support', NULL, 'Normal', NULL, NULL, 'Support', 'Offline', 'success', NULL, NULL, NULL, 'Support', 'Ticket', '6DNLiRXq9yEL8u0zMyrkGGQ5zvW7SO6uhsXBN7Pde5fkRqlytGkOhaDFFkQo', NULL, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '01206967401', '8019', '192.168.1.184', '2022-04-25 11:01:52', '2022-03-14 15:52:33', 1, 'Deepak Swami', '2021-12-24 07:19:31', '2022-04-25 05:31:52', 1),
(63, '35487', 'pooja.gupta', 'pooja gupta', 'pooja.gupta@vert-age.com', '$2y$10$aq9iDf8O6j09UFUoFgHaaOiSFIRhKTEt4DVLgUvnX/j5iAD9R1Bpe', 'Support', NULL, 'Normal', NULL, NULL, 'Support', 'Offline', 'success', NULL, NULL, NULL, 'Support', 'Ticket', 'byqFu2HBSui5WSvNmifLyqs9pYKHQ9uskJoWQEdxxhZQrQUElFskGQLR8qTa', NULL, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '01206967401', '8016', '192.168.1.104', '2022-04-25 09:15:36', '2022-04-07 11:32:29', 1, 'Deepak Swami', '2021-12-24 09:49:07', '2022-04-25 03:45:36', 1),
(64, '92544', 'Praveen.yadav', 'Praveen.yadav', 'praveenyadav@vert-age.com', '$2y$10$P2dKQXjAnMyszL3SN2sRS.VAjSLkvSjyHgdFBTw4rD3Al6Z76U1Pi', 'Support', NULL, 'Normal', NULL, NULL, 'Support', 'Offline', 'success', NULL, NULL, NULL, 'Support', 'Ticket', 'bpugsSr05vWSwwAZaeRVMUrYKZkQIBJvnSFkkKrpjjCKJyb1tJE1wAoNjl2j', NULL, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '01206967401', '8013', '192.168.1.107', '2022-04-23 11:05:08', '2022-03-31 18:14:44', 1, 'Deepak Swami', '2021-12-24 10:01:03', '2022-04-23 05:35:08', 1),
(66, '78764', 'tushar', 'tushar rajvanshi', 'tushar@vert-age.com', '$2y$10$Bwyc6EfyT2vDhNtzRxZKQuK3zFLcL55Y4.4osvHBY4aPvd4k4PAeq', 'Support', NULL, 'Normal', NULL, NULL, 'Support', 'Offline', 'success', NULL, NULL, NULL, 'Support', 'Ticket', 'cmcE2P1FlI85jgdwiCp48WTo9ZBLB07QyBYSvTjeWa7LnQdq2C0bJXyn8L36', NULL, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '01206967401', '8006', '192.168.1.103', '2022-04-25 09:41:02', '2022-04-09 10:36:01', 1, 'Deepak Swami', '2021-12-24 11:21:37', '2022-04-25 04:11:02', 1),
(70, '77517', 'rishabh', 'Rishabh', 'rishabh@vert-age.com', '$2y$10$1o6Z0R.tHKnVwc54HC1TUeU1q4VSwAOP/7a6UpS4nDANj5fOKCHAG', 'Development', NULL, 'Normal', NULL, NULL, 'Development', 'Offline', 'success', NULL, NULL, NULL, 'PHP DEVELOPER', 'Ticket', 'UtG14es9vCb8i0tyIvRdLWZzPk0KOPBQtGCOxSWZtWc5OaM7Ys4iE8IwKsY8', NULL, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '01206967401', '8020', '192.168.1.102', '2022-04-23 10:32:52', '2022-04-23 18:53:17', 0, 'Siddharth Singh', '2021-12-29 13:15:13', '2022-04-23 13:23:17', 1),
(71, '4682', 'Mani', 'Manikant Verma', 'manikant.verma@vert-age.com', '$2y$10$EJD.xR3rZRco1pw2zNupA.VS0/aH.EXC273Q0QL8jur1jjgWTGuai', 'customer', NULL, NULL, NULL, NULL, 'IT', 'Offline', 'muted', '9716103639', NULL, 'Xspl', 'IT', 'Ticket', 'q7s0mrs3WW6IOWz1BZrZzuctizUHuqlUd3vsrrUvo6BlCuTG5kEH57X4AtSh', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, 'customer', '2021-12-30 11:23:58', '2022-01-05 05:43:33', 1),
(72, '68499', 'Amriteshsingh', 'Amritesh singh', 'amritesh@citicollections.com', '$2y$10$bVy6rZKXM3CMq9LVB6amlucyvj3dcqaMkvtYooRv3YQlbDWpOUpcW', 'customer', NULL, NULL, NULL, NULL, 'IT', 'Offline', 'muted', '7982547071', NULL, 'Di management  Noida', 'IT AND ADMIN SUPPORTS', 'Ticket', '4D2puoCifRiftlY8hMcLHDfztSOloucyA1R1RA8sFjbPbNvYWW1v4ZNnGWNf', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, 'customer', '2021-12-30 11:56:15', '2022-01-07 09:18:58', 1),
(73, '82464', '85454', 'adam', 'agent@gmail.com', '$2y$10$2AvgC69tYUJCAswxpg24sulZDJgXmiyRczk1/TCIrTf4ttSCCXk9q', 'customer', NULL, NULL, NULL, NULL, 'IT', 'Offline', 'muted', '4464646464', NULL, 'j4546465', '4654465', 'Ticket', 'WlfPVoeW9tc7cvbJDB0QrSa6j2KepyjuhIpF9LyF', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, 'customer', '2021-12-30 12:46:18', '2021-12-30 12:46:18', 1),
(77, '60237', 'Sanjeevs', 'Sanjeev Sharma', 'sanjeev@vert-age.com', '$2y$10$l6lVPUhnSpAljQ34OBznuuO3zycukQmJPt8re8AgHRToP55/Auidy', 'Sales', NULL, 'Special', NULL, NULL, 'Sales', 'Offline', 'success', NULL, NULL, NULL, 'Director', 'Ticket', 'I9j4BSh2xlk6zJLaYE98ZW7mmGH3cbhhZq2ytesH0elysEr2tw89u211tr0i', NULL, 1, 1, 1, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, '01206967401', '8004', '192.168.1.105', '2022-01-14 14:26:45', '2022-01-14 14:32:58', 0, 'Admin', '2022-01-03 08:52:19', '2022-01-17 07:44:55', 1),
(78, '42059', 'accounts', 'Vikas Jha', 'accounts@vert-age.com', '$2y$10$xPUA15n.2iRljGkAbCcGkOK8grkh/WLCRFNT2aj.GGKBvTC5SxTV6', 'Sales', NULL, 'Normal', NULL, NULL, 'Sales', 'Offline', 'success', NULL, NULL, NULL, 'Account', 'Ticket', '0h0jlvsrfc1doaISqg5LduqglRPvvqz8Dq6x4jxYQVvc2I6I11UhZOUn80H3', NULL, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, '01206967401', '8002', '192.168.1.125', '2022-02-09 09:22:31', NULL, 1, 'Sanjeev Sharma', '2022-01-03 08:55:50', '2022-02-09 03:52:31', 1),
(79, '31397', 'sahadevs', 'sahadev Pal', 'sahadev@vert-age.com', '$2y$10$z2qzRf1muZqfpZkMVGUU/efit.AQH/RcRjqHGpXwR0eXH6QMBz6j.', 'Administration', NULL, 'Special', NULL, NULL, 'Administration', 'Offline', 'success', NULL, NULL, NULL, 'Director', 'Ticket', 'UNhPnmfbXNiTfNHChqi5OshpwWtbRNy9eAcxqF9YfIdWZGZXunNKaqEL7Moi', NULL, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, '01206967401', '8017', '122.176.38.177', '2022-04-22 10:42:23', '2022-04-12 11:54:02', 1, 'Admin', '2022-01-03 09:09:35', '2022-04-22 05:12:23', 1),
(80, '5386', 'hr', 'Sabnam Bano', 'hr@vert-age.com', '$2y$10$qX7mA/JP8PdHpWLa4TEKlOcHgQCWGmA7iRjdAu1GxUQLOSWzubp9C', 'Administration', NULL, 'Normal', NULL, NULL, 'Administration', 'Offline', 'success', NULL, NULL, NULL, 'HR', 'Ticket', 'sYZZj6aoCtEqHM9QqJNrgZ6hRYJg7EczUJaocPkv', NULL, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '01206967401', '8003', NULL, NULL, NULL, 0, 'sahadev Pal', '2022-01-03 09:13:55', '2022-01-03 09:13:55', 1),
(81, '24820', 'marketing', 'Rohit Dixit', 'marketing@vert-age.com', '$2y$10$SKmvLfCYfOB0JIaWAV7r7eWbmRX.G.5jNdwMwlkFxzs2NsT1Uh1xS', 'Administration', NULL, 'Normal', NULL, NULL, 'Administration', 'Offline', 'success', NULL, NULL, NULL, 'Marketing', 'Ticket', 'o8kBo9z6mXsvyEz9RjapIa3fdoyroQsUlSn1PSjgysmgN5AuJSyaReFQmiex', NULL, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '01206967401', '8008', '192.168.1.111', '2022-04-15 10:37:14', '2022-03-21 19:04:00', 1, 'sahadev Pal', '2022-01-03 09:17:07', '2022-04-15 05:07:14', 1),
(82, '34280', 'Sanjay', 'Sanajy Rathi', 'admin@vert-age.com', '$2y$10$J7/sKNPiNU1EGxIcaJOOAuxaJSf4lUTwl/AAfUb3Y/W5Sx1ikLnbm', 'Administration', NULL, 'Normal', NULL, NULL, 'Administration', 'Offline', 'success', NULL, NULL, NULL, 'Administration', 'Ticket', 'XIr75OMH4vzZ6OthhAGaTqts8FLDivAbrms9uUcmZycEU8cl12CsUTh0chzf', NULL, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '01206967401', '8001', '122.176.38.177', '2022-02-19 15:53:11', '2022-02-19 17:28:10', 0, 'sahadev Pal', '2022-01-03 09:18:40', '2022-02-19 11:58:10', 1),
(83, '14702', 'Customer', 'David', 'david.a@talktel', '$2y$10$e6DyUp1tt4DG/yfEi1mNBuFZXeZSkbveIdmV1r.bPg4XML6hsWLXK', 'customer', NULL, NULL, NULL, NULL, 'IT', 'Offline', 'muted', '6382746177', NULL, 'Talktel solution and services pvt ltd', 'IT Head', 'Ticket', '5q3KGKLyH5R297mTg1KXizcGwKOAMrjbEF8X10dr', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, 'customer', '2022-01-04 10:09:29', '2022-01-04 10:09:29', 1),
(84, '53735', 'customer', 'David', 'david.a@talktel.in', '$2y$10$UYQvoiuWPeWxSzX4jA5MI.qU.CKlL.hHLIJpCelRO66Pvs6OF32uq', 'customer', NULL, NULL, NULL, NULL, 'IT', 'Offline', 'muted', '6382746177', NULL, 'Talktel solution and services pvt Ltd', 'IT Head', 'Ticket', '5q3KGKLyH5R297mTg1KXizcGwKOAMrjbEF8X10dr', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, 'customer', '2022-01-04 10:11:49', '2022-01-04 10:11:49', 1),
(85, '33936', 'sunil.kumar', 'Sunil Kumar', 'sunil.kumar@citicollections.com', '$2y$10$B.6Pyt9x/4K9iwG1q0.6PerdVjBKKZOFbBIrjNGHW8uKRiJzNWe8S', 'customer', NULL, NULL, NULL, NULL, 'IT', 'Offline', 'muted', '8750580437', NULL, 'Citi collections IND Pvt Ltd', 'IT', 'Ticket', 'kHfbm5XadV646Lr5yOxBmZE3nqo5BvVUqO4pmjpy', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, 'customer', '2022-01-04 10:58:55', '2022-01-04 10:58:55', 1),
(86, '4923', '8800734745', 'Santosh', 'sunil.dubey@citicollections.com', '$2y$10$3JjsfmXFWxzBM9GzLDvPbOJ8M0zihZYJv4aM/DdbmhY6CdRf4SJiC', 'customer', NULL, NULL, NULL, NULL, 'IT', 'Offline', 'muted', '8800734745', NULL, 'Dimanagement', 'IT person', 'Ticket', '2R4h8Ku2LpUwGOulWUnWzoMlHdXGf87aKueuMgTw', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, 'customer', '2022-01-05 10:29:00', '2022-01-05 10:29:00', 1),
(87, '43800', '12345', 'Adarsh', 'adarsh@jumbokonexionsventures.com', '$2y$10$4uWdUdVi/5oAqfQpPxafAe7ZFUe7EsKqnyb3U6yAtkPEgbyC.tSWe', 'customer', NULL, NULL, NULL, NULL, 'IT', 'Offline', 'muted', '8383843066', NULL, 'Konexions back office service Pvt.ltd', 'It team', 'Ticket', 'zMZMZhWm8PwxsS6LOnEb8XmOa3gHry6COrzeUgzp', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, 'customer', '2022-01-06 10:19:09', '2022-01-06 10:19:09', 1),
(88, '33119', 'vpsc', 'vinay', 'vinay.chauhan@busiesseye.co.in', '$2y$10$fFZcFUqnbBsfY4IIKOvuVup5A/bk6bqPSCSycZtgBSVbpHf/reg.q', 'customer', NULL, NULL, NULL, NULL, 'IT', 'Offline', 'muted', '8287876305', NULL, 'businesseye', 'IT head', 'Ticket', '5racVwwefehCOfYBatpSheBqZSmgYSbGT44wwjsB', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, 'customer', '2022-01-06 10:34:28', '2022-01-06 10:34:28', 1),
(89, '78121', 'vpsc', 'vinay', 'vinay.chauhan@businesseye.co.in', '$2y$10$PnVWyWcwLmh2nWNXBlOfc.RCRoVRxbXMiqVwUDjvM27KOrZUdyzbS', 'customer', NULL, NULL, NULL, NULL, 'IT', 'Offline', 'muted', '8287876305', NULL, 'businesseye', 'IT head', 'Ticket', '5racVwwefehCOfYBatpSheBqZSmgYSbGT44wwjsB', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, 'customer', '2022-01-06 10:42:51', '2022-01-06 10:42:51', 1),
(90, '71157', 'Elevate', 'deepak', 'it.elevate05@gmail.com', '$2y$10$j6sfjLsKOSunnuFlpD13CuCB1vOlmkNn.qp85tTUcy7cJmVftmbnu', 'customer', NULL, NULL, NULL, NULL, 'IT', 'Offline', 'muted', '9599476182', NULL, 'Elevate BPO Services Pvt. Ltd.', 'IT', 'Ticket', 'Bv4QMKxmkf2fXeRXCE7PHiNEnZXdgQfCZfar3Y4M', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, 'customer', '2022-01-07 07:26:19', '2022-01-07 07:26:19', 1),
(91, '91475', 'Santosh', 'Santosh', 'santosh@vert-age.com', '$2y$10$VYywAQW7VHuCUSSuqRZbh.dv6LyuE3dEiFZlnTCjMMVVCG3fKEiQO', 'customer', NULL, NULL, NULL, NULL, 'IT', 'Offline', 'muted', '1234567890', NULL, 'Vert-Age', 'asdf', 'Ticket', 'iTFYA8mbahC2DgOqHvXg8nLulqiIuQnC46rIZx7eTWDkIaKmstNUifxqlwfJ', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, 'customer', '2022-01-07 07:39:43', '2022-04-04 07:53:33', 1),
(92, '74037', 'Mohitpal', 'Mohit pal', 'it@kuberconsultants.com', '$2y$10$WHDOKLMGKyIPtyyeq9NbFeGDfucco6neMR4ieZ3kujmPnXVA4MPki', 'customer', NULL, NULL, NULL, NULL, 'IT', 'Offline', 'muted', '8800581449', NULL, 'Kuber consultants', 'IT ENGINEER', 'Ticket', 'edZCi8XqJJarMz5uMQFC1fsJgZTasAAK6UXWkpgJZyFrMlrBNa0GONE6msFi', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, 'customer', '2022-01-07 08:35:20', '2022-01-07 09:46:28', 1),
(93, '5043', 'siddharth', 'siddharth', 'siddharth@gmail.com', '$2y$10$BX5KnEVWWsOEOYmX067AHOvJLpM.8/Y.8pGYOPNbTxO.XfV3IANY6', 'customer', NULL, NULL, NULL, NULL, 'IT', 'Offline', 'muted', '9643168193', NULL, 'vertage', 'php', 'Ticket', '9SS51pW2uuxri7eTL3kUuRql19HzqTmlRaLh770lUr9VuNXsrkmJr3j9wIfC', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, 'customer', '2022-01-12 10:36:37', '2022-01-12 10:38:34', 1),
(94, '57145', 'arun1.seth', 'Arun Seth', 'arun.seth@businesseye.co.in', '$2y$10$9D3mMYLQjxzN2si98LaFr.1P1..hxoAs4yimbMsiuAvAtIIK7Ulye', 'customer', NULL, NULL, NULL, NULL, 'IT', 'Offline', 'muted', '9650233877', NULL, 'Business Eye', 'Business Head', 'Ticket', 'i1yQ3e8iwrHqxaoCbmCrE8JlnX8snJ4kVxoW0zut5WiVdxSmk8q8zDFipcex', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, '2022-01-14 12:57:46', 0, 'customer', '2022-01-12 12:22:47', '2022-01-25 10:44:44', 1),
(95, '80412', 'rohit32111', 'Rohit dixit', 'rdixit740@gmail.com', '$2y$10$s.AIHSMqAPiAxHqkLK9xt.0/cCTVmJL1vTN7xlkHSoecMY/0p/Joi', 'customer', NULL, NULL, NULL, NULL, 'IT', 'Offline', 'muted', '9643052868', NULL, 'vertage', 'Digital marketing manager', 'Ticket', 'N5N8oClISElpIsKVS5BC6R5IH1vLIVwENDI0peZlf1otQuEAslbq2s8LrFOy', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, 'customer', '2022-01-18 05:52:43', '2022-01-18 07:13:55', 1),
(96, '30082', 'it.elevate05@gmail.com', 'deepak', 'it.elevate05@gmail.com', '$2y$10$cUwOiDPcESA/wC1p6qjw6.Fc6Epcl2zbmDQKAGkydKFDnRQ9c2wmS', 'customer', NULL, NULL, NULL, NULL, 'IT', 'Offline', 'muted', '9599476182', NULL, 'elevate bpo services pvt. ltd.', 'IT', 'Ticket', '9FTbu7EtaspGHj00KdgyI9QSAlAmPffXs1icjvUD', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, 'customer', '2022-02-03 06:25:51', '2022-02-03 06:25:51', 1),
(97, '61840', 'Demo', 'Krishnan Sir', 'v.krishnan@jumbokonexionsventures.com', '$2y$10$l2tWCavnzDKb9fO0auXn.e1Bua7NAwT4.FxNSQkZiYHA1He6YVowu', 'Demo', NULL, 'Special', NULL, NULL, 'Demo', 'Offline', 'success', NULL, NULL, NULL, 'CEO', 'Ticket', '94C30GLsJzVahmfTgIwRVWl3FoDtHnAcxMijQdqbBBY6bJj2WSKLhU0THDyX', NULL, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 1, 1, 0, 1, 1, 1, 1, '01206967401', '8012', '192.168.1.171', '2022-04-02 10:30:43', '2022-03-31 18:22:57', 1, 'Admin', '2022-03-31 12:38:12', '2022-04-02 05:00:43', 1),
(99, '30029', 'user1', 'user1', 'dipravindi@gmail.com', '$2y$10$4wo4qvrCdIZv4ufhY.h7CunmhDOnbg90HiqYUnnZTX8.MZs8tyIPu', 'Demo', NULL, 'Special', NULL, NULL, 'Demo', 'Offline', 'success', NULL, NULL, NULL, 'Director', 'Ticket', '0pstHEwkB3P7uIlHHxc3hKFIGK6qadUBUsrF1huW', NULL, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 1, 1, 0, 1, 1, 1, 0, '01206967401', '1234', NULL, NULL, NULL, 0, 'Krishnan Sir', '2022-03-31 13:05:40', '2022-03-31 13:05:40', 1),
(100, '60867', 'DevelopmentID', 'Development', 'demo_Development@gmail.com', '$2y$10$o/UjILL/XqqTVKKULezI0ubcUymU42Ufng6zBZZQ9dWFXT0MO7o0K', 'Development', NULL, 'Special', NULL, NULL, 'HR', 'Offline', 'success', NULL, NULL, NULL, 'Sr. PHP Developer', 'Ticket', 'HuBFxXmBfaulStjXDnkEqOtdV046rN2bbkZEQisR', NULL, 1, 1, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '01206967401', '7890', NULL, NULL, NULL, 0, 'Admin', '2022-04-06 09:18:57', '2022-04-07 07:33:24', 1),
(101, '62972', 'djana', 'Deepak', 'djana@vert-age.com', '$2y$10$P.CiRwX5R7o68pHt.0HmfOJC4pedMQLfkDs7O/tBQncV4LWAVoWly', 'Support', NULL, 'Normal', NULL, NULL, 'Support', 'Offline', 'success', NULL, NULL, NULL, 'Support', 'Ticket', 'h7YJ9TVibKeus82fUDfmnugNxbLjpkCuIGBv7CXR6jHn7TTelxklpziPhe90', NULL, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '01206967401', '8001', '192.168.1.171', '2022-04-15 14:03:53', '2022-04-15 14:04:12', 0, 'Deepak Swami', '2022-04-07 05:39:40', '2022-04-15 08:34:12', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users_old`
--

CREATE TABLE `users_old` (
  `id` int(11) NOT NULL,
  `user_id` varchar(250) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `user_type` varchar(250) DEFAULT NULL,
  `images` varchar(250) DEFAULT NULL,
  `level_name` varchar(250) DEFAULT NULL,
  `department_name` varchar(250) DEFAULT NULL,
  `chat_status` enum('Online','Away','Busy','Offline') NOT NULL DEFAULT 'Offline',
  `status_live` enum('success','warning','danger','muted') NOT NULL DEFAULT 'muted',
  `phone_number` varchar(250) DEFAULT NULL,
  `country` varchar(250) DEFAULT NULL,
  `company_name` varchar(100) DEFAULT NULL,
  `designation` varchar(100) DEFAULT NULL,
  `Process_name` varchar(250) DEFAULT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `status` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_old`
--

INSERT INTO `users_old` (`id`, `user_id`, `name`, `email`, `password`, `user_type`, `images`, `level_name`, `department_name`, `chat_status`, `status_live`, `phone_number`, `country`, `company_name`, `designation`, `Process_name`, `remember_token`, `session_id`, `created_at`, `updated_at`, `status`) VALUES
(1, '965966', 'Admin', 'admin@gmail.com', '$2y$10$9PrM4PAqdS4f8kp1JMSwFuAVP2WZ7eM6ydKO7WJQ3yH3yKjHQKc.y', 'Admin', '965966.jpg', '', 'IT', 'Online', 'success', '9643168193', 'India', NULL, NULL, 'Ticket', 'hS5T7qLSd1liyY4qFJdYyTvavlpVz4saMhcqDUPAT2MtxpkJ6nLOF6Ivg5OG', NULL, '2020-10-13 16:39:18', '2021-11-13 03:25:28', 1),
(64, '50709', 'sunil rathore', 'rathore.sunil23@gmail.com', '$2y$10$NYSYFF2o46gR3IGhpbGDl.ZS..27fNV.6qcB0qeG9fQyj.sWiINKW', 'customer', NULL, NULL, 'IT', 'Offline', 'muted', '8318236567', NULL, 'Xenottabyte Services Pvt. Ltd', 'Php', 'Ticket', 'rKfjjnOM7Aehmg3hdsxn6yKVH19uRaqjWB7925ngRuNS0mDdEadwAEEmbPzy', NULL, '2021-11-10 06:13:58', '2021-11-10 07:37:31', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users_permission`
--

CREATE TABLE `users_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `user_permission` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_permission`
--

INSERT INTO `users_permission` (`id`, `name`, `user_permission`) VALUES
(1, 'Create Ticket', 1),
(2, 'Manage Ticket', 1),
(3, 'Create Customer', 1),
(4, 'Customer list', 1),
(5, 'Knowledge Base', 1),
(6, 'Email', 1),
(7, 'Report', 1),
(8, 'Process', 1),
(9, 'User', 1),
(10, 'Permission', 1),
(11, 'Status', 1),
(12, 'Category', 1),
(13, 'Country & State, City', 1),
(14, 'Product', 1),
(15, 'Department', 1),
(16, 'RCA', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users_role`
--

CREATE TABLE `users_role` (
  `id` int(11) NOT NULL,
  `user_role` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_role`
--

INSERT INTO `users_role` (`id`, `user_role`, `created_at`, `updated_at`) VALUES
(1, 'Admin', '2021-07-28 01:16:17', '2021-12-07 12:11:55'),
(14, 'Development', '2021-12-06 12:58:19', '2021-12-23 11:03:06'),
(9, 'Support', '2021-11-25 02:28:50', '2021-12-06 12:58:31'),
(16, 'Administration', '2021-12-06 12:59:29', '2022-01-03 09:05:03'),
(15, 'HR', '2021-12-06 12:58:40', '2021-12-06 12:58:40'),
(17, 'Accounts', '2021-12-06 12:59:45', '2021-12-06 12:59:45'),
(19, 'Marketing', '2021-12-29 11:46:56', '2021-12-29 11:46:56'),
(20, 'Director', '2021-12-31 06:43:23', '2021-12-31 06:43:23'),
(21, 'Sales', '2022-01-03 08:48:47', '2022-01-03 08:48:47'),
(22, 'Demo', '2022-03-31 12:28:03', '2022-03-31 12:28:03');

-- --------------------------------------------------------

--
-- Table structure for table `user_history`
--

CREATE TABLE `user_history` (
  `id` int(11) NOT NULL,
  `uid` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `session_in` varchar(255) DEFAULT NULL,
  `session_in_date` varchar(255) DEFAULT NULL,
  `session_out` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_history`
--

INSERT INTO `user_history` (`id`, `uid`, `name`, `ip_address`, `session_in`, `session_in_date`, `session_out`, `created_at`, `updated_at`) VALUES
(1, 52, 'sunil kumar', '192.168.1.105', '2022-01-14 15:53:38', '2022-01-14', '2022-01-14 16:14:11', '2022-01-14 10:23:38', '2022-01-14 10:44:11'),
(2, 70, 'Rishabh', '192.168.1.111', '2022-01-14 15:54:02', '2022-01-14', NULL, '2022-01-14 10:24:02', '2022-01-14 10:24:02'),
(3, 50, 'santosh', '192.168.1.107', '2022-01-14 15:59:36', '2022-01-14', NULL, '2022-01-14 10:29:36', '2022-01-14 10:29:36'),
(4, 57, 'ankit sharma', '192.168.1.112', '2022-01-14 17:58:49', '2022-01-14', NULL, '2022-01-14 12:28:49', '2022-01-14 12:28:49'),
(5, 79, 'sahadev Pal', '192.168.1.105', '2022-01-14 18:34:26', '2022-01-14', '2022-01-14 18:58:59', '2022-01-14 13:04:26', '2022-01-14 13:28:59'),
(6, 63, 'pooja gupta', '192.168.1.117', '2022-01-15 09:38:36', '2022-01-15', NULL, '2022-01-15 04:08:36', '2022-01-15 04:08:36'),
(7, 66, 'tushar rajvanshi', '106.195.113.74', '2022-01-15 09:40:35', '2022-01-15', NULL, '2022-01-15 04:10:35', '2022-01-15 04:10:35'),
(8, 57, 'ankit sharma', '192.168.1.112', '2022-01-15 10:03:53', '2022-01-15', '2022-01-15 19:02:39', '2022-01-15 04:33:53', '2022-01-15 13:32:39'),
(9, 51, 'dharmender pal', '192.168.1.118', '2022-01-15 10:17:04', '2022-01-15', '2022-01-15 19:02:52', '2022-01-15 04:47:04', '2022-01-15 13:32:52'),
(10, 50, 'santosh', '192.168.1.107', '2022-01-15 10:17:16', '2022-01-15', NULL, '2022-01-15 04:47:16', '2022-01-15 04:47:16'),
(11, 49, 'Siddharth Singh', '192.168.1.109', '2022-01-15 10:17:54', '2022-01-15', NULL, '2022-01-15 04:47:54', '2022-01-15 04:47:54'),
(12, 62, 'Deepak Kumar', '192.168.1.103', '2022-01-15 10:43:00', '2022-01-15', '2022-01-15 19:03:28', '2022-01-15 05:13:00', '2022-01-15 13:33:28'),
(13, 78, 'Vikas Jha', '192.168.1.125', '2022-01-15 12:59:52', '2022-01-15', NULL, '2022-01-15 07:29:52', '2022-01-15 07:29:52'),
(14, 64, 'Praveen.yadav', '223.233.72.30', '2022-01-15 13:51:10', '2022-01-15', NULL, '2022-01-15 08:21:10', '2022-01-15 08:21:10'),
(15, 48, 'Deepak Swami', '192.168.1.106', '2022-01-15 15:10:51', '2022-01-15', NULL, '2022-01-15 09:40:51', '2022-01-15 09:40:51'),
(16, 52, 'sunil kumar', '192.168.1.105', '2022-01-15 17:45:23', '2022-01-15', '2022-01-15 17:57:16', '2022-01-15 12:15:23', '2022-01-15 12:27:16'),
(17, 62, 'Deepak Kumar', '103.70.154.39', '2022-01-16 10:51:04', '2022-01-16', NULL, '2022-01-16 05:21:04', '2022-01-16 05:21:04'),
(18, 63, 'pooja gupta', '47.31.254.141', '2022-01-16 10:54:36', '2022-01-16', NULL, '2022-01-16 05:24:36', '2022-01-16 05:24:36'),
(19, 63, 'pooja gupta', '192.168.1.117', '2022-01-17 09:21:34', '2022-01-17', NULL, '2022-01-17 03:51:34', '2022-01-17 12:38:29'),
(20, 48, 'Deepak Swami', '192.168.1.106', '2022-01-17 10:04:00', '2022-01-17', '2022-01-17 15:43:30', '2022-01-17 04:34:00', '2022-01-17 10:13:30'),
(21, 51, 'dharmender pal', '192.168.1.118', '2022-01-17 10:04:20', '2022-01-17', NULL, '2022-01-17 04:34:20', '2022-01-17 10:02:56'),
(22, 50, 'santosh', '192.168.1.107', '2022-01-17 10:10:31', '2022-01-17', '2022-01-17 15:43:30', '2022-01-17 04:40:31', '2022-01-17 12:17:42'),
(23, 62, 'Deepak Kumar', '192.168.1.103', '2022-01-17 10:16:57', '2022-01-17', NULL, '2022-01-17 04:46:57', '2022-01-17 10:31:28'),
(24, 52, 'sunil kumar', '192.168.1.105', '2022-01-17 10:17:28', '2022-01-17', '2022-01-17 15:51:13', '2022-01-17 04:47:28', '2022-01-17 10:21:13'),
(25, 57, 'ankit sharma', '192.168.1.112', '2022-01-17 10:19:08', '2022-01-17', '2022-01-17 19:08:25', '2022-01-17 04:49:08', '2022-01-17 13:38:25'),
(26, 49, 'Siddharth Singh', '192.168.1.105', '2022-01-17 10:47:26', '2022-01-17', '2022-01-17 13:17:18', '2022-01-17 05:17:26', '2022-01-17 12:19:32'),
(27, 79, 'sahadev Pal', '192.168.1.105', '2022-01-17 10:48:26', '2022-01-17', '2022-01-17 15:52:11', '2022-01-17 05:18:26', '2022-01-17 10:22:11'),
(28, 64, 'Praveen.yadav', '14.97.59.188', '2022-01-17 10:48:56', '2022-01-17', NULL, '2022-01-17 05:18:56', '2022-01-17 13:32:19'),
(29, 78, 'Vikas Jha', '192.168.1.125', '2022-01-17 10:54:32', '2022-01-17', NULL, '2022-01-17 05:24:32', '2022-01-17 05:24:32'),
(30, 82, 'Sanajy Rathi', '192.168.1.104', '2022-01-17 11:19:01', '2022-01-17', '2022-01-17 18:48:45', '2022-01-17 05:49:01', '2022-01-17 13:18:45'),
(31, 81, 'Rohit Dixit', '192.168.1.108', '2022-01-17 12:39:23', '2022-01-17', '2022-01-17 17:45:03', '2022-01-17 07:09:23', '2022-01-17 12:15:03'),
(32, 70, 'Rishabh', '192.168.1.111', '2022-01-17 13:27:47', '2022-01-17', '2022-01-17 15:38:07', '2022-01-17 07:57:47', '2022-01-17 13:07:01'),
(33, 63, 'pooja gupta', '192.168.1.117', '2022-01-18 09:11:37', '2022-01-18', '2022-01-18 13:41:52', '2022-01-18 03:41:37', '2022-01-18 12:23:22'),
(34, 57, 'ankit sharma', '192.168.1.112', '2022-01-18 10:05:50', '2022-01-18', '2022-01-18 19:01:24', '2022-01-18 04:35:50', '2022-01-18 13:31:24'),
(35, 51, 'dharmender pal', '192.168.1.118', '2022-01-18 10:18:06', '2022-01-18', NULL, '2022-01-18 04:48:06', '2022-01-18 13:27:55'),
(36, 50, 'santosh', '192.168.1.107', '2022-01-18 10:20:12', '2022-01-18', '2022-01-18 19:01:28', '2022-01-18 04:50:12', '2022-01-18 13:31:28'),
(37, 66, 'tushar rajvanshi', '192.168.1.104', '2022-01-18 10:38:26', '2022-01-18', NULL, '2022-01-18 05:08:26', '2022-01-18 12:52:30'),
(38, 64, 'Praveen.yadav', '192.168.1.115', '2022-01-18 10:44:43', '2022-01-18', '2022-01-18 16:46:09', '2022-01-18 05:14:43', '2022-01-18 11:16:09'),
(39, 82, 'Sanajy Rathi', '103.141.166.50', '2022-01-18 10:45:41', '2022-01-18', '2022-01-18 19:14:57', '2022-01-18 05:15:41', '2022-01-18 13:44:57'),
(40, 52, 'sunil kumar', '192.168.1.105', '2022-01-18 10:52:11', '2022-01-18', '2022-01-18 18:57:14', '2022-01-18 05:22:11', '2022-01-18 13:27:14'),
(41, 49, 'Siddharth Singh', '192.168.1.105', '2022-01-18 10:59:40', '2022-01-18', '2022-01-18 18:59:23', '2022-01-18 05:29:40', '2022-01-18 13:29:23'),
(42, 81, 'Rohit Dixit', '192.168.1.108', '2022-01-18 11:09:54', '2022-01-18', NULL, '2022-01-18 05:39:54', '2022-01-18 13:09:08'),
(43, 48, 'Deepak Swami', '192.168.1.106', '2022-01-18 12:29:25', '2022-01-18', '2022-01-18 19:02:11', '2022-01-18 06:59:25', '2022-01-18 13:32:11'),
(44, 79, 'sahadev Pal', '192.168.1.105', '2022-01-18 12:34:02', '2022-01-18', '2022-01-18 12:39:57', '2022-01-18 07:04:02', '2022-01-18 07:09:57'),
(45, 70, 'Rishabh', '192.168.1.111', '2022-01-18 15:03:16', '2022-01-18', NULL, '2022-01-18 09:33:16', '2022-01-18 09:33:24'),
(46, 62, 'Deepak Kumar', '103.70.154.39', '2022-01-18 15:48:23', '2022-01-18', NULL, '2022-01-18 10:18:23', '2022-01-18 13:04:04'),
(47, 64, 'Praveen.yadav', '223.233.72.30', '2022-01-19 09:45:55', '2022-01-19', '2022-01-19 18:39:09', '2022-01-19 04:15:55', '2022-01-19 13:19:38'),
(48, 63, 'pooja gupta', '192.168.1.117', '2022-01-19 10:02:33', '2022-01-19', '2022-01-19 16:57:43', '2022-01-19 04:32:33', '2022-01-19 12:49:24'),
(49, 57, 'ankit sharma', '192.168.1.112', '2022-01-19 10:03:25', '2022-01-19', '2022-01-19 17:34:34', '2022-01-19 04:33:25', '2022-01-19 12:04:34'),
(50, 66, 'tushar rajvanshi', '192.168.1.104', '2022-01-19 10:06:07', '2022-01-19', NULL, '2022-01-19 04:36:07', '2022-01-19 10:06:22'),
(51, 51, 'dharmender pal', '192.168.1.118', '2022-01-19 10:07:58', '2022-01-19', '2022-01-19 18:52:51', '2022-01-19 04:37:58', '2022-01-19 13:22:51'),
(52, 50, 'santosh', '192.168.1.107', '2022-01-19 10:08:16', '2022-01-19', NULL, '2022-01-19 04:38:16', '2022-01-19 12:34:12'),
(53, 49, 'Siddharth Singh', '192.168.1.105', '2022-01-19 10:21:34', '2022-01-19', '2022-01-19 18:38:05', '2022-01-19 04:51:34', '2022-01-19 13:08:05'),
(54, 52, 'sunil kumar', '192.168.1.105', '2022-01-19 10:31:00', '2022-01-19', '2022-01-19 17:21:25', '2022-01-19 05:01:00', '2022-01-19 11:51:25'),
(55, 62, 'Deepak Kumar', '192.168.1.103', '2022-01-19 10:31:24', '2022-01-19', NULL, '2022-01-19 05:01:24', '2022-01-19 07:32:38'),
(56, 48, 'Deepak Swami', '192.168.1.105', '2022-01-19 10:31:36', '2022-01-19', '2022-01-19 16:28:53', '2022-01-19 05:01:36', '2022-01-19 10:58:53'),
(57, 81, 'Rohit Dixit', '192.168.1.108', '2022-01-19 10:45:22', '2022-01-19', NULL, '2022-01-19 05:15:22', '2022-01-19 07:35:10'),
(58, 82, 'Sanajy Rathi', '103.141.166.50', '2022-01-19 11:01:14', '2022-01-19', NULL, '2022-01-19 05:31:14', '2022-01-19 05:31:55'),
(59, 79, 'sahadev Pal', '192.168.1.105', '2022-01-19 11:34:48', '2022-01-19', '2022-01-19 13:11:06', '2022-01-19 06:04:48', '2022-01-19 07:41:06'),
(60, 70, 'Rishabh', '192.168.1.111', '2022-01-19 12:39:57', '2022-01-19', '2022-01-19 18:35:32', '2022-01-19 07:09:57', '2022-01-19 13:05:32'),
(61, 63, 'pooja gupta', '192.168.1.117', '2022-01-20 09:34:59', '2022-01-20', '2022-01-20 17:47:23', '2022-01-20 04:04:59', '2022-01-20 12:32:07'),
(62, 51, 'dharmender pal', '192.168.1.118', '2022-01-20 09:36:14', '2022-01-20', '2022-01-20 19:03:47', '2022-01-20 04:06:14', '2022-01-20 13:33:47'),
(63, 66, 'tushar rajvanshi', '192.168.1.104', '2022-01-20 10:12:26', '2022-01-20', '2022-01-20 19:05:18', '2022-01-20 04:42:26', '2022-01-20 13:35:18'),
(64, 50, 'santosh', '192.168.1.107', '2022-01-20 10:14:32', '2022-01-20', '2022-01-20 12:12:41', '2022-01-20 04:44:32', '2022-01-20 13:14:46'),
(65, 62, 'Deepak Kumar', '192.168.1.103', '2022-01-20 10:24:23', '2022-01-20', NULL, '2022-01-20 04:54:23', '2022-01-20 13:31:59'),
(66, 49, 'Siddharth Singh', '192.168.1.109', '2022-01-20 10:27:45', '2022-01-20', NULL, '2022-01-20 04:57:45', '2022-01-20 13:14:48'),
(67, 57, 'ankit sharma', '192.168.1.112', '2022-01-20 10:31:43', '2022-01-20', '2022-01-20 16:31:40', '2022-01-20 05:01:43', '2022-01-20 11:01:40'),
(68, 70, 'Rishabh', '192.168.1.111', '2022-01-20 10:31:58', '2022-01-20', '2022-01-20 17:33:04', '2022-01-20 05:01:58', '2022-01-20 12:03:04'),
(69, 52, 'sunil kumar', '192.168.1.105', '2022-01-20 10:34:45', '2022-01-20', '2022-01-20 18:27:02', '2022-01-20 05:04:45', '2022-01-20 12:57:09'),
(70, 81, 'Rohit Dixit', '192.168.1.108', '2022-01-20 11:06:50', '2022-01-20', NULL, '2022-01-20 05:36:50', '2022-01-20 11:17:00'),
(71, 48, 'Deepak Swami', '192.168.1.106', '2022-01-20 11:20:54', '2022-01-20', '2022-01-20 19:07:59', '2022-01-20 05:50:54', '2022-01-20 13:37:59'),
(72, 64, 'Praveen.yadav', '223.233.68.158', '2022-01-20 16:10:34', '2022-01-20', '2022-01-20 17:48:55', '2022-01-20 10:40:34', '2022-01-20 12:18:55'),
(73, 63, 'pooja gupta', '192.168.1.106', '2022-01-21 09:56:45', '2022-01-21', '2022-01-21 10:57:54', '2022-01-21 04:26:45', '2022-01-21 12:53:52'),
(74, 66, 'tushar rajvanshi', '192.168.1.104', '2022-01-21 10:06:51', '2022-01-21', '2022-01-21 11:44:42', '2022-01-21 04:36:51', '2022-01-21 06:40:09'),
(75, 57, 'ankit sharma', '192.168.1.112', '2022-01-21 10:10:10', '2022-01-21', '2022-01-21 19:04:09', '2022-01-21 04:40:10', '2022-01-21 13:34:09'),
(76, 50, 'santosh', '192.168.1.107', '2022-01-21 10:12:59', '2022-01-21', '2022-01-21 14:56:49', '2022-01-21 04:42:59', '2022-01-21 12:16:48'),
(77, 51, 'dharmender pal', '192.168.1.118', '2022-01-21 10:14:03', '2022-01-21', '2022-01-21 18:59:05', '2022-01-21 04:44:03', '2022-01-21 13:29:05'),
(78, 52, 'sunil kumar', '192.168.1.105', '2022-01-21 10:14:53', '2022-01-21', '2022-01-21 10:23:55', '2022-01-21 04:44:53', '2022-01-21 04:53:55'),
(79, 62, 'Deepak Kumar', '192.168.1.103', '2022-01-21 10:55:43', '2022-01-21', NULL, '2022-01-21 05:25:43', '2022-01-21 12:16:35'),
(80, 70, 'Rishabh', '192.168.1.111', '2022-01-21 10:56:23', '2022-01-21', NULL, '2022-01-21 05:26:23', '2022-01-21 12:03:16'),
(81, 64, 'Praveen.yadav', '223.233.68.158', '2022-01-21 11:11:17', '2022-01-21', '2022-01-21 17:40:39', '2022-01-21 05:41:17', '2022-01-21 12:10:39'),
(82, 48, 'Deepak Swami', '192.168.1.138', '2022-01-21 11:45:43', '2022-01-21', '2022-01-21 18:54:05', '2022-01-21 06:15:43', '2022-01-21 13:24:05'),
(83, 49, 'Siddharth Singh', '192.168.1.107', '2022-01-21 15:53:18', '2022-01-21', '2022-01-21 15:55:07', '2022-01-21 10:23:18', '2022-01-21 10:25:07'),
(84, 63, 'pooja gupta', '192.168.1.106', '2022-01-22 09:59:14', '2022-01-22', NULL, '2022-01-22 04:29:14', '2022-01-22 12:22:29'),
(85, 51, 'dharmender pal', '192.168.1.118', '2022-01-22 09:59:27', '2022-01-22', '2022-01-22 18:56:00', '2022-01-22 04:29:27', '2022-01-22 13:26:00'),
(86, 57, 'ankit sharma', '192.168.1.112', '2022-01-22 10:12:32', '2022-01-22', '2022-01-22 19:00:00', '2022-01-22 04:42:32', '2022-01-22 13:30:00'),
(87, 62, 'Deepak Kumar', '192.168.1.103', '2022-01-22 10:20:02', '2022-01-22', NULL, '2022-01-22 04:50:02', '2022-01-22 04:53:59'),
(88, 66, 'tushar rajvanshi', '192.168.1.104', '2022-01-22 10:31:30', '2022-01-22', NULL, '2022-01-22 05:01:30', '2022-01-22 11:26:13'),
(89, 70, 'Rishabh', '192.168.1.111', '2022-01-22 10:41:07', '2022-01-22', '2022-01-22 18:54:18', '2022-01-22 05:11:07', '2022-01-22 13:24:18'),
(90, 50, 'santosh', '192.168.1.107', '2022-01-22 10:41:56', '2022-01-22', NULL, '2022-01-22 05:11:56', '2022-01-22 13:06:01'),
(91, 49, 'Siddharth Singh', '192.168.1.109', '2022-01-22 10:58:14', '2022-01-22', '2022-01-22 11:31:47', '2022-01-22 05:28:14', '2022-01-22 13:04:24'),
(92, 48, 'Deepak Swami', '192.168.1.112', '2022-01-22 11:32:01', '2022-01-22', '2022-01-22 18:54:33', '2022-01-22 06:02:01', '2022-01-22 13:24:33'),
(93, 64, 'Praveen.yadav', '14.97.59.188', '2022-01-22 11:42:34', '2022-01-22', '2022-01-22 13:39:25', '2022-01-22 06:12:34', '2022-01-22 13:34:12'),
(94, 52, 'sunil kumar', '192.168.1.105', '2022-01-22 12:38:25', '2022-01-22', '2022-01-22 16:24:57', '2022-01-22 07:08:25', '2022-01-22 10:54:57'),
(95, 79, 'sahadev Pal', '192.168.1.105', '2022-01-22 16:25:13', '2022-01-22', '2022-01-22 18:42:09', '2022-01-22 10:55:13', '2022-01-22 13:12:09'),
(96, 81, 'Rohit Dixit', '192.168.1.108', '2022-01-22 17:04:39', '2022-01-22', NULL, '2022-01-22 11:34:39', '2022-01-22 12:09:55'),
(97, 78, 'Vikas Jha', '157.37.223.12', '2022-01-22 20:28:20', '2022-01-22', NULL, '2022-01-22 14:58:20', '2022-01-22 14:58:40'),
(98, 49, 'Siddharth Singh', '47.31.240.236', '2022-01-23 10:51:28', '2022-01-23', '2022-01-23 10:52:01', '2022-01-23 05:21:28', '2022-01-23 05:22:01'),
(99, 50, 'santosh', '47.31.240.236', '2022-01-23 10:52:30', '2022-01-23', '2022-01-23 10:54:08', '2022-01-23 05:22:30', '2022-01-23 05:24:08'),
(100, 52, 'sunil kumar', '47.31.240.236', '2022-01-23 10:56:10', '2022-01-23', '2022-01-23 12:57:32', '2022-01-23 05:26:10', '2022-01-23 07:27:32'),
(101, 62, 'Deepak Kumar', '103.70.154.12', '2022-01-23 11:39:07', '2022-01-23', NULL, '2022-01-23 06:09:07', '2022-01-23 06:17:10'),
(102, 63, 'pooja gupta', '192.168.1.106', '2022-01-24 09:06:07', '2022-01-24', '2022-01-24 17:59:11', '2022-01-24 03:36:07', '2022-01-24 12:29:11'),
(103, 64, 'Praveen.yadav', '223.233.75.108', '2022-01-24 10:13:03', '2022-01-24', NULL, '2022-01-24 04:43:03', '2022-01-24 13:18:03'),
(104, 57, 'ankit sharma', '192.168.1.112', '2022-01-24 10:13:05', '2022-01-24', '2022-01-24 18:59:40', '2022-01-24 04:43:05', '2022-01-24 13:29:40'),
(105, 66, 'tushar rajvanshi', '192.168.1.146', '2022-01-24 10:14:47', '2022-01-24', NULL, '2022-01-24 04:44:47', '2022-01-24 12:42:39'),
(106, 51, 'dharmender pal', '192.168.1.118', '2022-01-24 10:16:18', '2022-01-24', NULL, '2022-01-24 04:46:18', '2022-01-24 11:49:11'),
(107, 50, 'santosh', '192.168.1.107', '2022-01-24 10:24:59', '2022-01-24', NULL, '2022-01-24 04:54:59', '2022-01-24 13:01:48'),
(108, 81, 'Rohit Dixit', '192.168.1.108', '2022-01-24 10:27:29', '2022-01-24', NULL, '2022-01-24 04:57:29', '2022-01-24 12:47:06'),
(109, 49, 'Siddharth Singh', '192.168.1.109', '2022-01-24 10:34:06', '2022-01-24', '2022-01-24 17:47:02', '2022-01-24 05:04:06', '2022-01-24 12:17:02'),
(110, 62, 'Deepak Kumar', '192.168.1.103', '2022-01-24 10:38:12', '2022-01-24', NULL, '2022-01-24 05:08:12', '2022-01-24 13:06:15'),
(111, 48, 'Deepak Swami', '122.176.38.177', '2022-01-24 10:38:36', '2022-01-24', '2022-01-24 17:14:35', '2022-01-24 05:08:36', '2022-01-24 13:13:19'),
(112, 52, 'sunil kumar', '192.168.1.105', '2022-01-24 10:42:00', '2022-01-24', '2022-01-24 15:52:55', '2022-01-24 05:12:00', '2022-01-24 10:22:55'),
(113, 70, 'Rishabh', '192.168.1.111', '2022-01-24 10:51:43', '2022-01-24', '2022-01-24 18:57:00', '2022-01-24 05:21:43', '2022-01-24 13:27:00'),
(114, 79, 'sahadev Pal', '192.168.1.105', '2022-01-24 11:16:18', '2022-01-24', '2022-01-24 15:53:48', '2022-01-24 05:46:18', '2022-01-24 10:23:48'),
(115, 63, 'pooja gupta', '192.168.1.106', '2022-01-25 09:21:44', '2022-01-25', NULL, '2022-01-25 03:51:44', '2022-01-25 12:02:39'),
(116, 51, 'dharmender pal', '192.168.1.118', '2022-01-25 09:51:01', '2022-01-25', '2022-01-25 18:49:29', '2022-01-25 04:21:01', '2022-01-25 13:19:29'),
(117, 66, 'tushar rajvanshi', '192.168.1.146', '2022-01-25 10:10:21', '2022-01-25', '2022-01-25 14:33:48', '2022-01-25 04:40:21', '2022-01-25 09:03:48'),
(118, 50, 'santosh', '192.168.1.107', '2022-01-25 10:18:42', '2022-01-25', NULL, '2022-01-25 04:48:42', '2022-01-25 12:35:37'),
(119, 62, 'Deepak Kumar', '192.168.1.103', '2022-01-25 10:27:20', '2022-01-25', NULL, '2022-01-25 04:57:20', '2022-01-25 12:53:46'),
(120, 57, 'ankit sharma', '122.176.38.177', '2022-01-25 10:28:57', '2022-01-25', '2022-01-25 18:59:05', '2022-01-25 04:58:57', '2022-01-25 13:29:05'),
(121, 49, 'Siddharth Singh', '192.168.1.109', '2022-01-25 10:30:49', '2022-01-25', NULL, '2022-01-25 05:00:49', '2022-01-25 13:30:46'),
(122, 70, 'Rishabh', '192.168.1.111', '2022-01-25 10:43:17', '2022-01-25', '2022-01-25 18:58:05', '2022-01-25 05:13:17', '2022-01-25 13:28:05'),
(123, 81, 'Rohit Dixit', '192.168.1.108', '2022-01-25 10:46:11', '2022-01-25', NULL, '2022-01-25 05:16:11', '2022-01-25 10:38:07'),
(124, 48, 'Deepak Swami', '192.168.1.138', '2022-01-25 11:54:56', '2022-01-25', NULL, '2022-01-25 06:24:56', '2022-01-25 12:54:20'),
(125, 64, 'Praveen.yadav', '223.233.75.108', '2022-01-25 13:46:02', '2022-01-25', NULL, '2022-01-25 08:16:02', '2022-01-25 11:35:43'),
(126, 63, 'pooja gupta', '192.168.1.106', '2022-01-27 09:19:12', '2022-01-27', NULL, '2022-01-27 03:49:12', '2022-01-27 12:43:24'),
(127, 51, 'dharmender pal', '192.168.1.118', '2022-01-27 09:59:42', '2022-01-27', '2022-01-27 19:06:12', '2022-01-27 04:29:42', '2022-01-27 13:36:12'),
(128, 64, 'Praveen.yadav', '223.233.75.196', '2022-01-27 10:04:20', '2022-01-27', NULL, '2022-01-27 04:34:20', '2022-01-27 13:37:14'),
(129, 48, 'Deepak Swami', '122.176.38.177', '2022-01-27 10:12:10', '2022-01-27', '2022-01-27 15:40:22', '2022-01-27 04:42:10', '2022-01-27 13:18:49'),
(130, 57, 'ankit sharma', '192.168.1.112', '2022-01-27 10:13:11', '2022-01-27', '2022-01-27 19:08:37', '2022-01-27 04:43:11', '2022-01-27 13:38:37'),
(131, 50, 'santosh', '192.168.1.107', '2022-01-27 10:21:12', '2022-01-27', NULL, '2022-01-27 04:51:12', '2022-01-27 12:32:45'),
(132, 62, 'Deepak Kumar', '192.168.1.103', '2022-01-27 10:23:42', '2022-01-27', NULL, '2022-01-27 04:53:42', '2022-01-27 11:47:47'),
(133, 49, 'Siddharth Singh', '192.168.1.109', '2022-01-27 10:38:47', '2022-01-27', '2022-01-27 11:14:18', '2022-01-27 05:08:47', '2022-01-27 13:21:46'),
(134, 70, 'Rishabh', '192.168.1.111', '2022-01-27 10:40:23', '2022-01-27', '2022-01-27 19:04:03', '2022-01-27 05:10:23', '2022-01-27 13:34:03'),
(135, 81, 'Rohit Dixit', '192.168.1.108', '2022-01-27 10:40:31', '2022-01-27', NULL, '2022-01-27 05:10:31', '2022-01-27 12:56:36'),
(136, 52, 'sunil kumar', '192.168.1.105', '2022-01-27 11:44:34', '2022-01-27', '2022-01-27 19:11:32', '2022-01-27 06:14:34', '2022-01-27 13:41:32'),
(137, 79, 'sahadev Pal', '192.168.1.105', '2022-01-27 11:50:33', '2022-01-27', '2022-01-27 17:39:30', '2022-01-27 06:20:33', '2022-01-27 12:09:30'),
(138, 51, 'dharmender pal', '192.168.1.118', '2022-01-28 10:53:41', '2022-01-28', '2022-01-28 19:00:05', '2022-01-28 05:23:41', '2022-01-28 13:30:05'),
(139, 49, 'Siddharth Singh', '192.168.1.109', '2022-01-28 10:55:11', '2022-01-28', '2022-01-28 16:35:03', '2022-01-28 05:25:11', '2022-01-28 12:14:20'),
(140, 81, 'Rohit Dixit', '192.168.1.108', '2022-01-28 10:56:41', '2022-01-28', '2022-01-28 19:04:10', '2022-01-28 05:26:41', '2022-01-28 13:34:10'),
(141, 66, 'tushar rajvanshi', '192.168.1.104', '2022-01-28 11:00:57', '2022-01-28', '2022-01-28 15:33:25', '2022-01-28 05:30:57', '2022-01-28 10:03:25'),
(142, 70, 'Rishabh', '192.168.1.111', '2022-01-28 11:01:03', '2022-01-28', '2022-01-28 19:00:26', '2022-01-28 05:31:03', '2022-01-28 13:30:26'),
(143, 48, 'Deepak Swami', '192.168.1.138', '2022-01-28 11:01:44', '2022-01-28', '2022-01-28 16:51:42', '2022-01-28 05:31:44', '2022-01-28 12:34:25'),
(144, 63, 'pooja gupta', '192.168.1.106', '2022-01-28 11:16:42', '2022-01-28', NULL, '2022-01-28 05:46:42', '2022-01-28 12:28:51'),
(145, 50, 'santosh', '192.168.1.107', '2022-01-28 11:22:30', '2022-01-28', '2022-01-28 15:44:44', '2022-01-28 05:52:30', '2022-01-28 11:19:32'),
(146, 62, 'Deepak Kumar', '192.168.1.103', '2022-01-28 12:03:21', '2022-01-28', NULL, '2022-01-28 06:33:21', '2022-01-28 13:14:13'),
(147, 64, 'Praveen.yadav', '223.233.75.196', '2022-01-28 12:16:41', '2022-01-28', NULL, '2022-01-28 06:46:41', '2022-01-28 12:12:06'),
(148, 57, 'ankit sharma', '192.168.1.112', '2022-01-28 12:43:34', '2022-01-28', NULL, '2022-01-28 07:13:34', '2022-01-28 11:25:17'),
(149, 82, 'Sanajy Rathi', '122.176.38.177', '2022-01-28 13:22:27', '2022-01-28', NULL, '2022-01-28 07:52:27', '2022-01-28 07:52:28'),
(150, 52, 'sunil kumar', '192.168.1.105', '2022-01-28 14:41:05', '2022-01-28', '2022-01-28 14:41:18', '2022-01-28 09:11:05', '2022-01-28 09:11:18'),
(151, 79, 'sahadev Pal', '192.168.1.105', '2022-01-28 14:41:31', '2022-01-28', '2022-01-28 19:15:02', '2022-01-28 09:11:31', '2022-01-28 13:45:02'),
(152, 63, 'pooja gupta', '192.168.1.106', '2022-01-29 09:21:20', '2022-01-29', NULL, '2022-01-29 03:51:20', '2022-01-29 12:34:09'),
(153, 51, 'dharmender pal', '192.168.1.118', '2022-01-29 10:05:40', '2022-01-29', '2022-01-29 18:48:15', '2022-01-29 04:35:40', '2022-01-29 13:18:15'),
(154, 57, 'ankit sharma', '192.168.1.112', '2022-01-29 10:07:00', '2022-01-29', NULL, '2022-01-29 04:37:00', '2022-01-29 08:16:20'),
(155, 50, 'santosh', '192.168.1.107', '2022-01-29 10:15:51', '2022-01-29', NULL, '2022-01-29 04:45:51', '2022-01-29 12:56:22'),
(156, 66, 'tushar rajvanshi', '192.168.1.104', '2022-01-29 10:21:01', '2022-01-29', NULL, '2022-01-29 04:51:01', '2022-01-29 11:34:15'),
(157, 48, 'Deepak Swami', '192.168.1.117', '2022-01-29 10:35:01', '2022-01-29', NULL, '2022-01-29 05:05:01', '2022-01-29 13:28:34'),
(158, 70, 'Rishabh', '192.168.1.111', '2022-01-29 10:35:13', '2022-01-29', '2022-01-29 18:39:58', '2022-01-29 05:05:13', '2022-01-29 13:09:58'),
(159, 81, 'Rohit Dixit', '192.168.1.108', '2022-01-29 10:35:35', '2022-01-29', NULL, '2022-01-29 05:05:35', '2022-01-29 10:44:34'),
(160, 64, 'Praveen.yadav', '223.233.68.176', '2022-01-29 10:53:43', '2022-01-29', NULL, '2022-01-29 05:23:43', '2022-01-29 09:35:03'),
(161, 62, 'Deepak Kumar', '192.168.1.103', '2022-01-29 11:07:20', '2022-01-29', NULL, '2022-01-29 05:37:20', '2022-01-29 12:13:15'),
(162, 79, 'sahadev Pal', '192.168.1.105', '2022-01-29 11:26:40', '2022-01-29', '2022-01-29 13:01:00', '2022-01-29 05:56:40', '2022-01-29 07:31:00'),
(163, 52, 'sunil kumar', '192.168.1.105', '2022-01-29 17:21:53', '2022-01-29', '2022-01-29 17:49:12', '2022-01-29 11:51:53', '2022-01-29 12:19:12'),
(164, 49, 'Siddharth Singh', '192.168.1.105', '2022-01-29 17:43:45', '2022-01-29', '2022-01-29 21:41:44', '2022-01-29 12:13:45', '2022-01-29 16:11:44'),
(165, 48, 'Deepak Swami', '45.251.48.23', '2022-01-30 09:40:43', '2022-01-30', NULL, '2022-01-30 04:10:43', '2022-01-30 04:10:49'),
(166, 62, 'Deepak Kumar', '103.70.154.12', '2022-01-30 17:03:03', '2022-01-30', NULL, '2022-01-30 11:33:03', '2022-01-30 11:34:07'),
(167, 63, 'pooja gupta', '192.168.1.106', '2022-01-31 09:26:15', '2022-01-31', NULL, '2022-01-31 03:56:15', '2022-01-31 12:25:35'),
(168, 51, 'dharmender pal', '192.168.1.118', '2022-01-31 09:52:18', '2022-01-31', '2022-01-31 21:28:18', '2022-01-31 04:22:18', '2022-01-31 15:58:18'),
(169, 50, 'santosh', '192.168.1.107', '2022-01-31 10:07:04', '2022-01-31', NULL, '2022-01-31 04:37:04', '2022-01-31 12:00:25'),
(170, 81, 'Rohit Dixit', '192.168.1.108', '2022-01-31 10:07:50', '2022-01-31', '2022-01-31 19:00:30', '2022-01-31 04:37:50', '2022-01-31 13:30:30'),
(171, 66, 'tushar rajvanshi', '192.168.1.104', '2022-01-31 10:21:55', '2022-01-31', NULL, '2022-01-31 04:51:55', '2022-01-31 09:51:16'),
(172, 62, 'Deepak Kumar', '192.168.1.103', '2022-01-31 10:23:57', '2022-01-31', NULL, '2022-01-31 04:53:57', '2022-01-31 15:14:10'),
(173, 49, 'Siddharth Singh', '192.168.1.109', '2022-01-31 10:31:12', '2022-01-31', NULL, '2022-01-31 05:01:12', '2022-01-31 05:19:32'),
(174, 79, 'sahadev Pal', '192.168.1.105', '2022-01-31 10:51:42', '2022-01-31', '2022-01-31 12:50:05', '2022-01-31 05:21:42', '2022-01-31 09:17:51'),
(175, 57, 'ankit sharma', '192.168.1.112', '2022-01-31 11:11:17', '2022-01-31', '2022-01-31 19:03:22', '2022-01-31 05:41:17', '2022-01-31 13:33:22'),
(176, 78, 'Vikas Jha', '192.168.1.125', '2022-01-31 13:20:02', '2022-01-31', NULL, '2022-01-31 07:50:02', '2022-01-31 08:46:19'),
(177, 48, 'Deepak Swami', '192.168.1.112', '2022-01-31 13:47:33', '2022-01-31', NULL, '2022-01-31 08:17:33', '2022-01-31 13:42:18'),
(178, 63, 'pooja gupta', '192.168.1.106', '2022-02-01 09:46:10', '2022-02-01', NULL, '2022-02-01 04:16:10', '2022-02-01 11:19:33'),
(179, 51, 'dharmender pal', '192.168.1.118', '2022-02-01 09:55:04', '2022-02-01', '2022-02-01 17:12:53', '2022-02-01 04:25:04', '2022-02-01 11:42:53'),
(180, 48, 'Deepak Swami', '192.168.1.117', '2022-02-01 10:03:05', '2022-02-01', NULL, '2022-02-01 04:33:05', '2022-02-01 11:31:28'),
(181, 57, 'ankit sharma', '192.168.1.112', '2022-02-01 10:08:52', '2022-02-01', '2022-02-01 19:08:03', '2022-02-01 04:38:52', '2022-02-01 13:38:03'),
(182, 50, 'santosh', '192.168.1.107', '2022-02-01 10:15:36', '2022-02-01', NULL, '2022-02-01 04:45:36', '2022-02-01 13:25:17'),
(183, 81, 'Rohit Dixit', '192.168.1.108', '2022-02-01 10:24:54', '2022-02-01', '2022-02-01 12:02:51', '2022-02-01 04:54:54', '2022-02-01 11:06:39'),
(184, 66, 'tushar rajvanshi', '192.168.1.104', '2022-02-01 10:26:04', '2022-02-01', '2022-02-01 18:53:47', '2022-02-01 04:56:04', '2022-02-01 13:23:47'),
(185, 70, 'Rishabh', '192.168.1.111', '2022-02-01 10:34:55', '2022-02-01', '2022-02-01 19:01:48', '2022-02-01 05:04:55', '2022-02-01 13:31:48'),
(186, 62, 'Deepak Kumar', '192.168.1.103', '2022-02-01 10:54:03', '2022-02-01', NULL, '2022-02-01 05:24:03', '2022-02-01 14:14:05'),
(187, 64, 'Praveen.yadav', '192.168.1.158', '2022-02-01 11:11:37', '2022-02-01', NULL, '2022-02-01 05:41:37', '2022-02-01 06:23:43'),
(188, 79, 'sahadev Pal', '192.168.1.108', '2022-02-01 12:04:15', '2022-02-01', '2022-02-01 15:24:04', '2022-02-01 06:34:15', '2022-02-01 09:54:04'),
(189, 52, 'sunil kumar', '192.168.1.105', '2022-02-01 14:53:55', '2022-02-01', '2022-02-01 18:50:49', '2022-02-01 09:23:55', '2022-02-01 13:20:49'),
(190, 49, 'Siddharth Singh', '192.168.1.105', '2022-02-01 15:50:38', '2022-02-01', '2022-02-01 16:40:25', '2022-02-01 10:20:38', '2022-02-01 13:24:12'),
(191, 63, 'pooja gupta', '192.168.1.106', '2022-02-02 09:21:49', '2022-02-02', NULL, '2022-02-02 03:51:49', '2022-02-02 11:24:47'),
(192, 66, 'tushar rajvanshi', '192.168.1.104', '2022-02-02 09:43:07', '2022-02-02', '2022-02-02 11:46:12', '2022-02-02 04:13:07', '2022-02-02 09:42:07'),
(193, 81, 'Rohit Dixit', '192.168.1.108', '2022-02-02 10:28:26', '2022-02-02', NULL, '2022-02-02 04:58:26', '2022-02-02 13:17:15'),
(194, 57, 'ankit sharma', '192.168.1.112', '2022-02-02 10:29:30', '2022-02-02', '2022-02-02 19:09:50', '2022-02-02 04:59:30', '2022-02-02 13:39:50'),
(195, 62, 'Deepak Kumar', '192.168.1.103', '2022-02-02 10:51:14', '2022-02-02', NULL, '2022-02-02 05:21:14', '2022-02-02 06:20:27'),
(196, 64, 'Praveen.yadav', '192.168.1.158', '2022-02-02 10:59:14', '2022-02-02', NULL, '2022-02-02 05:29:14', '2022-02-02 05:39:18'),
(197, 48, 'Deepak Swami', '192.168.1.117', '2022-02-02 11:26:38', '2022-02-02', '2022-02-02 18:38:17', '2022-02-02 05:56:38', '2022-02-02 13:08:17'),
(198, 70, 'Rishabh', '192.168.1.111', '2022-02-02 14:09:29', '2022-02-02', '2022-02-02 19:00:34', '2022-02-02 08:39:29', '2022-02-02 13:30:34'),
(199, 52, 'sunil kumar', '192.168.1.105', '2022-02-02 14:57:26', '2022-02-02', '2022-02-02 18:50:16', '2022-02-02 09:27:26', '2022-02-02 13:20:16'),
(200, 50, 'santosh', '192.168.1.107', '2022-02-02 15:55:58', '2022-02-02', NULL, '2022-02-02 10:25:58', '2022-02-02 13:29:42'),
(201, 49, 'Siddharth Singh', '192.168.1.105', '2022-02-02 17:20:23', '2022-02-02', '2022-02-02 19:05:52', '2022-02-02 11:50:23', '2022-02-02 13:35:52'),
(202, 48, 'Deepak Swami', '192.168.1.117', '2022-02-03 09:52:22', '2022-02-03', '2022-02-03 17:40:52', '2022-02-03 04:22:22', '2022-02-03 12:25:20'),
(203, 57, 'ankit sharma', '192.168.1.112', '2022-02-03 10:01:37', '2022-02-03', '2022-02-03 19:35:50', '2022-02-03 04:31:37', '2022-02-03 14:05:50'),
(204, 66, 'tushar rajvanshi', '192.168.1.146', '2022-02-03 10:05:32', '2022-02-03', NULL, '2022-02-03 04:35:32', '2022-02-03 04:35:32'),
(205, 64, 'Praveen.yadav', '192.168.1.158', '2022-02-03 10:19:15', '2022-02-03', NULL, '2022-02-03 04:49:15', '2022-02-03 13:33:28'),
(206, 50, 'santosh', '192.168.1.107', '2022-02-03 10:19:58', '2022-02-03', NULL, '2022-02-03 04:49:58', '2022-02-03 13:27:10'),
(207, 81, 'Rohit Dixit', '192.168.1.108', '2022-02-03 10:22:54', '2022-02-03', NULL, '2022-02-03 04:52:54', '2022-02-03 12:52:55'),
(208, 70, 'Rishabh', '192.168.1.111', '2022-02-03 10:29:35', '2022-02-03', '2022-02-03 19:02:30', '2022-02-03 04:59:35', '2022-02-03 13:32:30'),
(209, 51, 'dharmender pal', '192.168.1.118', '2022-02-03 10:36:07', '2022-02-03', '2022-02-03 19:44:45', '2022-02-03 05:06:07', '2022-02-03 14:14:45'),
(210, 49, 'Siddharth Singh', '192.168.1.109', '2022-02-03 13:00:23', '2022-02-03', '2022-02-03 19:01:31', '2022-02-03 07:30:23', '2022-02-03 13:31:31'),
(211, 52, 'sunil kumar', '192.168.1.105', '2022-02-03 14:25:41', '2022-02-03', '2022-02-03 14:28:45', '2022-02-03 08:55:41', '2022-02-03 08:58:45'),
(212, 62, 'Deepak Kumar', '103.70.154.127', '2022-02-03 14:52:33', '2022-02-03', NULL, '2022-02-03 09:22:33', '2022-02-03 15:12:25'),
(213, 79, 'sahadev Pal', '122.176.38.177', '2022-02-03 15:44:19', '2022-02-03', NULL, '2022-02-03 10:14:19', '2022-02-03 10:14:34'),
(214, 63, 'pooja gupta', '192.168.1.112', '2022-02-04 09:24:50', '2022-02-04', '2022-02-04 10:08:57', '2022-02-04 03:54:50', '2022-02-04 12:41:11'),
(215, 57, 'ankit sharma', '192.168.1.112', '2022-02-04 10:08:25', '2022-02-04', '2022-02-04 19:07:28', '2022-02-04 04:38:25', '2022-02-04 13:37:28'),
(216, 66, 'tushar rajvanshi', '192.168.1.146', '2022-02-04 10:10:54', '2022-02-04', NULL, '2022-02-04 04:40:54', '2022-02-04 11:19:55'),
(217, 51, 'dharmender pal', '192.168.1.118', '2022-02-04 10:12:37', '2022-02-04', '2022-02-04 18:58:46', '2022-02-04 04:42:37', '2022-02-04 13:28:46'),
(218, 62, 'Deepak Kumar', '192.168.1.103', '2022-02-04 10:24:32', '2022-02-04', NULL, '2022-02-04 04:54:32', '2022-02-04 11:24:14'),
(219, 64, 'Praveen.yadav', '192.168.1.158', '2022-02-04 11:20:25', '2022-02-04', NULL, '2022-02-04 05:50:25', '2022-02-04 09:40:37'),
(220, 52, 'sunil kumar', '192.168.1.105', '2022-02-04 11:47:37', '2022-02-04', '2022-02-04 15:57:48', '2022-02-04 06:17:37', '2022-02-04 10:27:48'),
(221, 70, 'Rishabh', '192.168.1.111', '2022-02-04 12:11:08', '2022-02-04', '2022-02-04 18:59:15', '2022-02-04 06:41:08', '2022-02-04 13:29:15'),
(222, 50, 'santosh', '192.168.1.107', '2022-02-04 12:13:13', '2022-02-04', NULL, '2022-02-04 06:43:13', '2022-02-04 06:59:17'),
(223, 48, 'Deepak Swami', '192.168.1.112', '2022-02-04 12:34:04', '2022-02-04', '2022-02-04 18:59:37', '2022-02-04 07:04:04', '2022-02-04 13:36:29'),
(224, 49, 'Siddharth Singh', '192.168.1.109', '2022-02-04 13:27:24', '2022-02-04', NULL, '2022-02-04 07:57:24', '2022-02-04 10:49:46'),
(225, 81, 'Rohit Dixit', '192.168.1.108', '2022-02-04 14:53:14', '2022-02-04', NULL, '2022-02-04 09:23:14', '2022-02-04 11:44:58'),
(226, 78, 'Vikas Jha', '192.168.1.125', '2022-02-04 17:19:07', '2022-02-04', NULL, '2022-02-04 11:49:07', '2022-02-04 11:49:46'),
(227, 63, 'pooja gupta', '192.168.1.106', '2022-02-05 09:25:54', '2022-02-05', NULL, '2022-02-05 03:55:54', '2022-02-05 05:23:13'),
(228, 78, 'Vikas Jha', '192.168.1.125', '2022-02-05 09:54:27', '2022-02-05', NULL, '2022-02-05 04:24:27', '2022-02-05 09:53:12'),
(229, 51, 'dharmender pal', '192.168.1.118', '2022-02-05 10:12:53', '2022-02-05', '2022-02-05 19:03:57', '2022-02-05 04:42:53', '2022-02-05 13:33:57'),
(230, 49, 'Siddharth Singh', '192.168.1.109', '2022-02-05 10:14:46', '2022-02-05', NULL, '2022-02-05 04:44:46', '2022-02-05 11:01:08'),
(231, 57, 'ankit sharma', '192.168.1.112', '2022-02-05 10:16:35', '2022-02-05', '2022-02-05 19:16:48', '2022-02-05 04:46:35', '2022-02-05 13:46:48'),
(232, 81, 'Rohit Dixit', '192.168.1.108', '2022-02-05 10:26:18', '2022-02-05', NULL, '2022-02-05 04:56:18', '2022-02-05 09:00:03'),
(233, 62, 'Deepak Kumar', '192.168.1.103', '2022-02-05 10:31:11', '2022-02-05', NULL, '2022-02-05 05:01:11', '2022-02-05 12:28:04'),
(234, 70, 'Rishabh', '192.168.1.111', '2022-02-05 10:34:26', '2022-02-05', '2022-02-05 18:23:44', '2022-02-05 05:04:26', '2022-02-05 12:53:44'),
(235, 66, 'tushar rajvanshi', '192.168.1.146', '2022-02-05 11:20:28', '2022-02-05', NULL, '2022-02-05 05:50:28', '2022-02-05 07:48:29'),
(236, 48, 'Deepak Swami', '192.168.1.117', '2022-02-05 11:38:57', '2022-02-05', NULL, '2022-02-05 06:08:57', '2022-02-05 09:19:53'),
(237, 64, 'Praveen.yadav', '192.168.1.158', '2022-02-05 11:52:04', '2022-02-05', NULL, '2022-02-05 06:22:04', '2022-02-05 12:00:09'),
(238, 50, 'santosh', '192.168.1.107', '2022-02-05 14:09:26', '2022-02-05', NULL, '2022-02-05 08:39:26', '2022-02-05 08:39:40'),
(239, 62, 'Deepak Kumar', '103.70.154.127', '2022-02-06 10:31:48', '2022-02-06', NULL, '2022-02-06 05:01:48', '2022-02-06 07:12:31'),
(240, 63, 'pooja gupta', '192.168.1.106', '2022-02-07 09:29:18', '2022-02-07', NULL, '2022-02-07 03:59:18', '2022-02-07 09:30:05'),
(241, 78, 'Vikas Jha', '192.168.1.125', '2022-02-07 09:51:00', '2022-02-07', NULL, '2022-02-07 04:21:00', '2022-02-07 04:21:00'),
(242, 57, 'ankit sharma', '192.168.1.112', '2022-02-07 09:53:58', '2022-02-07', NULL, '2022-02-07 04:23:58', '2022-02-07 11:51:47'),
(243, 49, 'Siddharth Singh', '192.168.1.109', '2022-02-07 09:59:58', '2022-02-07', NULL, '2022-02-07 04:29:58', '2022-02-07 06:00:20'),
(244, 51, 'dharmender pal', '192.168.1.118', '2022-02-07 10:15:52', '2022-02-07', '2022-02-07 18:57:59', '2022-02-07 04:45:52', '2022-02-07 13:27:59'),
(245, 62, 'Deepak Kumar', '192.168.1.103', '2022-02-07 10:23:46', '2022-02-07', NULL, '2022-02-07 04:53:46', '2022-02-07 11:47:29'),
(246, 66, 'tushar rajvanshi', '192.168.1.146', '2022-02-07 10:26:26', '2022-02-07', NULL, '2022-02-07 04:56:26', '2022-02-07 10:38:17'),
(247, 48, 'Deepak Swami', '122.176.38.177', '2022-02-07 10:38:15', '2022-02-07', '2022-02-07 15:59:01', '2022-02-07 05:08:15', '2022-02-07 10:29:01'),
(248, 50, 'santosh', '192.168.1.107', '2022-02-07 10:59:54', '2022-02-07', NULL, '2022-02-07 05:29:54', '2022-02-07 12:43:04'),
(249, 79, 'sahadev Pal', '103.141.166.50', '2022-02-07 11:54:22', '2022-02-07', NULL, '2022-02-07 06:24:22', '2022-02-07 09:05:09'),
(250, 52, 'sunil kumar', '47.9.168.226', '2022-02-07 14:41:42', '2022-02-07', '2022-02-07 15:43:57', '2022-02-07 09:11:42', '2022-02-07 10:13:57'),
(251, 81, 'Rohit Dixit', '192.168.1.108', '2022-02-07 17:18:37', '2022-02-07', NULL, '2022-02-07 11:48:37', '2022-02-07 11:48:50'),
(252, 63, 'pooja gupta', '192.168.1.106', '2022-02-08 09:09:04', '2022-02-08', NULL, '2022-02-08 03:39:04', '2022-02-08 11:19:30'),
(253, 78, 'Vikas Jha', '192.168.1.125', '2022-02-08 09:27:36', '2022-02-08', NULL, '2022-02-08 03:57:36', '2022-02-08 04:29:22'),
(254, 62, 'Deepak Kumar', '192.168.1.103', '2022-02-08 09:44:31', '2022-02-08', NULL, '2022-02-08 04:14:31', '2022-02-08 09:32:13'),
(255, 48, 'Deepak Swami', '192.168.1.117', '2022-02-08 09:59:09', '2022-02-08', NULL, '2022-02-08 04:29:09', '2022-02-08 13:21:33'),
(256, 51, 'dharmender pal', '192.168.1.118', '2022-02-08 10:10:20', '2022-02-08', NULL, '2022-02-08 04:40:20', '2022-02-08 13:15:05'),
(257, 57, 'ankit sharma', '192.168.1.112', '2022-02-08 10:10:21', '2022-02-08', '2022-02-08 18:59:56', '2022-02-08 04:40:21', '2022-02-08 13:29:56'),
(258, 64, 'Praveen.yadav', '192.168.1.158', '2022-02-08 10:25:08', '2022-02-08', NULL, '2022-02-08 04:55:08', '2022-02-08 11:28:27'),
(259, 50, 'santosh', '192.168.1.107', '2022-02-08 10:28:51', '2022-02-08', NULL, '2022-02-08 04:58:51', '2022-02-08 10:05:12'),
(260, 66, 'tushar rajvanshi', '192.168.1.146', '2022-02-08 10:46:00', '2022-02-08', NULL, '2022-02-08 05:16:00', '2022-02-08 13:31:24'),
(261, 49, 'Siddharth Singh', '192.168.1.109', '2022-02-08 10:46:01', '2022-02-08', '2022-02-08 10:56:33', '2022-02-08 05:16:01', '2022-02-08 05:26:33'),
(262, 81, 'Rohit Dixit', '192.168.1.108', '2022-02-08 11:06:55', '2022-02-08', NULL, '2022-02-08 05:36:55', '2022-02-08 13:26:23'),
(263, 79, 'sahadev Pal', '103.141.166.50', '2022-02-08 13:55:23', '2022-02-08', NULL, '2022-02-08 08:25:23', '2022-02-08 13:31:25'),
(264, 57, 'ankit sharma', '192.168.1.112', '2022-02-09 09:06:16', '2022-02-09', NULL, '2022-02-09 03:36:16', '2022-02-09 06:17:28'),
(265, 63, 'pooja gupta', '192.168.1.106', '2022-02-09 09:17:20', '2022-02-09', '2022-02-09 18:00:26', '2022-02-09 03:47:20', '2022-02-09 12:30:26'),
(266, 78, 'Vikas Jha', '192.168.1.125', '2022-02-09 09:22:31', '2022-02-09', NULL, '2022-02-09 03:52:31', '2022-02-09 12:05:38'),
(267, 62, 'Deepak Kumar', '192.168.1.103', '2022-02-09 09:54:08', '2022-02-09', NULL, '2022-02-09 04:24:08', '2022-02-09 06:23:51'),
(268, 48, 'Deepak Swami', '103.141.166.50', '2022-02-09 10:04:58', '2022-02-09', NULL, '2022-02-09 04:34:58', '2022-02-09 13:30:55'),
(269, 66, 'tushar rajvanshi', '192.168.1.146', '2022-02-09 10:08:28', '2022-02-09', NULL, '2022-02-09 04:38:28', '2022-02-09 06:35:26'),
(270, 51, 'dharmender pal', '192.168.1.118', '2022-02-09 10:19:14', '2022-02-09', '2022-02-09 18:59:57', '2022-02-09 04:49:14', '2022-02-09 13:29:57'),
(271, 70, 'Rishabh', '192.168.1.111', '2022-02-09 10:26:36', '2022-02-09', '2022-02-09 19:23:47', '2022-02-09 04:56:36', '2022-02-09 13:53:47'),
(272, 81, 'Rohit Dixit', '192.168.1.108', '2022-02-09 10:26:51', '2022-02-09', NULL, '2022-02-09 04:56:51', '2022-02-09 13:38:41'),
(273, 50, 'santosh', '192.168.1.107', '2022-02-09 10:47:42', '2022-02-09', NULL, '2022-02-09 05:17:42', '2022-02-09 13:23:09'),
(274, 64, 'Praveen.yadav', '192.168.1.158', '2022-02-09 11:55:23', '2022-02-09', NULL, '2022-02-09 06:25:23', '2022-02-09 12:31:50'),
(275, 79, 'sahadev Pal', '103.141.166.50', '2022-02-09 12:20:38', '2022-02-09', NULL, '2022-02-09 06:50:38', '2022-02-09 12:54:19'),
(276, 62, 'Deepak Kumar', '103.70.154.16', '2022-02-10 10:41:23', '2022-02-10', NULL, '2022-02-10 05:11:23', '2022-02-10 06:26:49'),
(277, 48, 'Deepak Swami', '45.251.49.10', '2022-02-10 11:08:32', '2022-02-10', NULL, '2022-02-10 05:38:32', '2022-02-10 13:09:15'),
(278, 57, 'ankit sharma', '132.154.247.236', '2022-02-10 18:22:32', '2022-02-10', '2022-02-10 18:44:05', '2022-02-10 12:52:32', '2022-02-10 13:14:05'),
(279, 63, 'pooja gupta', '192.168.1.106', '2022-02-11 09:25:30', '2022-02-11', NULL, '2022-02-11 03:55:30', '2022-02-11 12:36:47'),
(280, 66, 'tushar rajvanshi', '192.168.1.146', '2022-02-11 09:48:47', '2022-02-11', NULL, '2022-02-11 04:18:47', '2022-02-11 10:16:05'),
(281, 51, 'dharmender pal', '192.168.1.118', '2022-02-11 09:59:17', '2022-02-11', NULL, '2022-02-11 04:29:17', '2022-02-11 12:11:29'),
(282, 70, 'Rishabh', '192.168.1.111', '2022-02-11 10:10:51', '2022-02-11', NULL, '2022-02-11 04:40:51', '2022-02-11 10:26:47'),
(283, 48, 'Deepak Swami', '192.168.1.117', '2022-02-11 10:14:39', '2022-02-11', NULL, '2022-02-11 04:44:39', '2022-02-11 14:44:28'),
(284, 64, 'Praveen.yadav', '192.168.1.158', '2022-02-11 10:17:43', '2022-02-11', NULL, '2022-02-11 04:47:43', '2022-02-11 07:10:03'),
(285, 62, 'Deepak Kumar', '192.168.1.103', '2022-02-11 10:30:26', '2022-02-11', NULL, '2022-02-11 05:00:26', '2022-02-11 08:45:30'),
(286, 81, 'Rohit Dixit', '192.168.1.108', '2022-02-11 10:40:49', '2022-02-11', NULL, '2022-02-11 05:10:49', '2022-02-11 12:40:27'),
(287, 50, 'santosh', '192.168.1.107', '2022-02-11 10:58:20', '2022-02-11', NULL, '2022-02-11 05:28:20', '2022-02-11 10:05:46'),
(288, 79, 'sahadev Pal', '103.141.166.50', '2022-02-11 13:53:24', '2022-02-11', NULL, '2022-02-11 08:23:24', '2022-02-11 08:23:30'),
(289, 49, 'Siddharth Singh', '192.168.1.109', '2022-02-11 15:52:59', '2022-02-11', NULL, '2022-02-11 10:22:59', '2022-02-11 11:09:51'),
(290, 66, 'tushar rajvanshi', '192.168.1.146', '2022-02-12 10:04:09', '2022-02-12', NULL, '2022-02-12 04:34:09', '2022-02-12 11:23:05'),
(291, 48, 'Deepak Swami', '192.168.1.117', '2022-02-12 10:09:49', '2022-02-12', NULL, '2022-02-12 04:39:49', '2022-02-12 13:08:14'),
(292, 51, 'dharmender pal', '192.168.1.118', '2022-02-12 10:16:04', '2022-02-12', NULL, '2022-02-12 04:46:04', '2022-02-12 11:11:04'),
(293, 81, 'Rohit Dixit', '192.168.1.108', '2022-02-12 10:21:05', '2022-02-12', NULL, '2022-02-12 04:51:05', '2022-02-12 04:51:05'),
(294, 63, 'pooja gupta', '192.168.1.106', '2022-02-12 10:21:23', '2022-02-12', NULL, '2022-02-12 04:51:23', '2022-02-12 12:03:25'),
(295, 50, 'santosh', '192.168.1.107', '2022-02-12 10:21:34', '2022-02-12', NULL, '2022-02-12 04:51:34', '2022-02-12 09:52:26'),
(296, 70, 'Rishabh', '192.168.1.111', '2022-02-12 10:24:01', '2022-02-12', '2022-02-12 18:20:14', '2022-02-12 04:54:01', '2022-02-12 12:50:14'),
(297, 62, 'Deepak Kumar', '192.168.1.103', '2022-02-12 10:29:45', '2022-02-12', NULL, '2022-02-12 04:59:45', '2022-02-12 11:00:06'),
(298, 64, 'Praveen.yadav', '192.168.1.158', '2022-02-12 11:43:07', '2022-02-12', NULL, '2022-02-12 06:13:07', '2022-02-12 10:25:07'),
(299, 79, 'sahadev Pal', '103.141.166.50', '2022-02-12 12:32:07', '2022-02-12', NULL, '2022-02-12 07:02:07', '2022-02-12 08:18:13'),
(300, 49, 'Siddharth Singh', '192.168.1.109', '2022-02-12 15:52:21', '2022-02-12', NULL, '2022-02-12 10:22:21', '2022-02-12 10:23:43'),
(301, 57, 'ankit sharma', '192.168.1.112', '2022-02-14 10:40:56', '2022-02-14', '2022-02-14 19:09:55', '2022-02-14 05:10:56', '2022-02-14 13:39:55'),
(302, 48, 'Deepak Swami', '192.168.1.117', '2022-02-14 10:43:27', '2022-02-14', '2022-02-14 18:54:45', '2022-02-14 05:13:27', '2022-02-14 13:35:38'),
(303, 49, 'Siddharth Singh', '192.168.1.109', '2022-02-14 11:06:45', '2022-02-14', NULL, '2022-02-14 05:36:45', '2022-02-14 12:59:14'),
(304, 51, 'dharmender pal', '192.168.1.118', '2022-02-14 11:18:59', '2022-02-14', NULL, '2022-02-14 05:48:59', '2022-02-14 10:55:35'),
(305, 62, 'Deepak Kumar', '192.168.1.103', '2022-02-14 11:28:24', '2022-02-14', NULL, '2022-02-14 05:58:24', '2022-02-14 11:20:01'),
(306, 66, 'tushar rajvanshi', '192.168.1.110', '2022-02-14 11:32:15', '2022-02-14', NULL, '2022-02-14 06:02:15', '2022-02-14 10:58:42'),
(307, 64, 'Praveen.yadav', '192.168.1.158', '2022-02-14 11:32:19', '2022-02-14', NULL, '2022-02-14 06:02:19', '2022-02-14 13:34:14'),
(308, 81, 'Rohit Dixit', '192.168.1.108', '2022-02-14 11:32:58', '2022-02-14', NULL, '2022-02-14 06:02:58', '2022-02-14 06:02:58'),
(309, 63, 'pooja gupta', '192.168.1.106', '2022-02-14 11:48:13', '2022-02-14', NULL, '2022-02-14 06:18:13', '2022-02-14 11:51:46'),
(310, 63, 'pooja gupta', '192.168.1.106', '2022-02-15 09:28:54', '2022-02-15', NULL, '2022-02-15 03:58:54', '2022-02-15 10:56:36'),
(311, 51, 'dharmender pal', '192.168.1.118', '2022-02-15 10:00:03', '2022-02-15', NULL, '2022-02-15 04:30:03', '2022-02-15 13:22:05'),
(312, 57, 'ankit sharma', '192.168.1.112', '2022-02-15 10:07:16', '2022-02-15', '2022-02-15 19:08:44', '2022-02-15 04:37:16', '2022-02-15 13:38:44'),
(313, 66, 'tushar rajvanshi', '192.168.1.110', '2022-02-15 10:18:31', '2022-02-15', '2022-02-15 16:29:37', '2022-02-15 04:48:31', '2022-02-15 12:15:21'),
(314, 81, 'Rohit Dixit', '192.168.1.108', '2022-02-15 10:25:26', '2022-02-15', NULL, '2022-02-15 04:55:26', '2022-02-15 08:50:51'),
(315, 48, 'Deepak Swami', '103.141.166.50', '2022-02-15 10:26:56', '2022-02-15', NULL, '2022-02-15 04:56:56', '2022-02-15 13:24:01'),
(316, 62, 'Deepak Kumar', '192.168.1.103', '2022-02-15 10:29:42', '2022-02-15', NULL, '2022-02-15 04:59:42', '2022-02-15 12:54:56'),
(317, 49, 'Siddharth Singh', '192.168.1.109', '2022-02-15 10:42:04', '2022-02-15', '2022-02-15 16:27:07', '2022-02-15 05:12:04', '2022-02-15 11:18:21'),
(318, 64, 'Praveen.yadav', '192.168.1.168', '2022-02-15 11:17:17', '2022-02-15', NULL, '2022-02-15 05:47:17', '2022-02-15 11:15:28'),
(319, 70, 'Rishabh', '192.168.1.111', '2022-02-15 11:22:10', '2022-02-15', '2022-02-15 19:29:50', '2022-02-15 05:52:10', '2022-02-15 13:59:50'),
(320, 52, 'sunil kumar', '192.168.1.105', '2022-02-15 11:22:56', '2022-02-15', '2022-02-15 14:57:04', '2022-02-15 05:52:56', '2022-02-15 09:27:04'),
(321, 79, 'sahadev Pal', '103.141.166.50', '2022-02-15 13:26:22', '2022-02-15', NULL, '2022-02-15 07:56:22', '2022-02-15 12:51:09'),
(322, 63, 'pooja gupta', '192.168.1.106', '2022-02-16 09:20:23', '2022-02-16', '2022-02-16 17:19:19', '2022-02-16 03:50:23', '2022-02-16 11:59:24'),
(323, 51, 'dharmender pal', '192.168.1.118', '2022-02-16 09:40:41', '2022-02-16', NULL, '2022-02-16 04:10:41', '2022-02-16 09:34:01'),
(324, 64, 'Praveen.yadav', '192.168.1.168', '2022-02-16 09:57:17', '2022-02-16', NULL, '2022-02-16 04:27:17', '2022-02-16 12:59:49'),
(325, 57, 'ankit sharma', '192.168.1.112', '2022-02-16 10:05:53', '2022-02-16', NULL, '2022-02-16 04:35:53', '2022-02-16 13:23:22'),
(326, 66, 'tushar rajvanshi', '192.168.1.110', '2022-02-16 10:06:27', '2022-02-16', NULL, '2022-02-16 04:36:27', '2022-02-16 04:36:28'),
(327, 81, 'Rohit Dixit', '192.168.1.108', '2022-02-16 10:09:13', '2022-02-16', NULL, '2022-02-16 04:39:13', '2022-02-16 11:36:33'),
(328, 48, 'Deepak Swami', '45.251.48.128', '2022-02-16 10:27:01', '2022-02-16', '2022-02-16 17:20:56', '2022-02-16 04:57:01', '2022-02-16 11:50:56'),
(329, 62, 'Deepak Kumar', '192.168.1.103', '2022-02-16 10:30:34', '2022-02-16', NULL, '2022-02-16 05:00:34', '2022-02-16 09:34:04'),
(330, 52, 'sunil kumar', '192.168.1.105', '2022-02-16 11:07:37', '2022-02-16', '2022-02-16 11:12:30', '2022-02-16 05:37:37', '2022-02-16 05:42:30'),
(331, 79, 'sahadev Pal', '192.168.1.105', '2022-02-16 11:12:44', '2022-02-16', '2022-02-16 11:17:20', '2022-02-16 05:42:44', '2022-02-16 06:23:31'),
(332, 49, 'Siddharth Singh', '192.168.1.109', '2022-02-16 11:39:02', '2022-02-16', NULL, '2022-02-16 06:09:02', '2022-02-16 07:16:06'),
(333, 50, 'santosh', '192.168.1.107', '2022-02-16 14:52:05', '2022-02-16', NULL, '2022-02-16 09:22:05', '2022-02-16 09:22:05'),
(334, 50, 'santosh', '192.168.1.107', '2022-02-17 10:07:31', '2022-02-17', NULL, '2022-02-17 04:37:31', '2022-02-17 11:40:45'),
(335, 51, 'dharmender pal', '192.168.1.118', '2022-02-17 10:07:48', '2022-02-17', '2022-02-17 18:56:35', '2022-02-17 04:37:48', '2022-02-17 13:26:35'),
(336, 66, 'tushar rajvanshi', '192.168.1.110', '2022-02-17 10:08:13', '2022-02-17', NULL, '2022-02-17 04:38:13', '2022-02-17 04:38:14'),
(337, 64, 'Praveen.yadav', '192.168.1.158', '2022-02-17 10:13:55', '2022-02-17', NULL, '2022-02-17 04:43:55', '2022-02-17 13:31:05'),
(338, 70, 'Rishabh', '192.168.1.111', '2022-02-17 10:18:10', '2022-02-17', '2022-02-17 19:00:23', '2022-02-17 04:48:10', '2022-02-17 13:30:23'),
(339, 48, 'Deepak Swami', '192.168.1.117', '2022-02-17 10:25:04', '2022-02-17', NULL, '2022-02-17 04:55:04', '2022-02-17 14:00:40'),
(340, 57, 'ankit sharma', '192.168.1.112', '2022-02-17 10:25:36', '2022-02-17', '2022-02-17 19:35:46', '2022-02-17 04:55:36', '2022-02-17 14:05:46'),
(341, 81, 'Rohit Dixit', '192.168.1.108', '2022-02-17 10:44:53', '2022-02-17', NULL, '2022-02-17 05:14:53', '2022-02-17 05:15:01'),
(342, 63, 'pooja gupta', '192.168.1.106', '2022-02-18 09:29:05', '2022-02-18', NULL, '2022-02-18 03:59:05', '2022-02-18 12:36:24'),
(343, 81, 'Rohit Dixit', '192.168.1.108', '2022-02-18 10:07:55', '2022-02-18', NULL, '2022-02-18 04:37:55', '2022-02-18 05:11:21'),
(344, 51, 'dharmender pal', '192.168.1.118', '2022-02-18 10:09:13', '2022-02-18', '2022-02-18 18:57:11', '2022-02-18 04:39:13', '2022-02-18 13:27:11'),
(345, 70, 'Rishabh', '192.168.1.111', '2022-02-18 10:17:33', '2022-02-18', '2022-02-18 18:57:09', '2022-02-18 04:47:33', '2022-02-18 13:27:09'),
(346, 57, 'ankit sharma', '192.168.1.112', '2022-02-18 10:21:10', '2022-02-18', '2022-02-18 18:59:04', '2022-02-18 04:51:10', '2022-02-18 13:29:04'),
(347, 66, 'tushar rajvanshi', '192.168.1.110', '2022-02-18 10:22:57', '2022-02-18', NULL, '2022-02-18 04:52:57', '2022-02-18 12:26:24'),
(348, 48, 'Deepak Swami', '192.168.1.117', '2022-02-18 10:43:31', '2022-02-18', NULL, '2022-02-18 05:13:31', '2022-02-18 13:07:40'),
(349, 50, 'santosh', '192.168.1.107', '2022-02-18 16:40:05', '2022-02-18', NULL, '2022-02-18 11:10:05', '2022-02-18 12:54:02'),
(350, 49, 'Siddharth Singh', '192.168.1.107', '2022-02-18 17:39:04', '2022-02-18', '2022-02-18 17:40:13', '2022-02-18 12:09:04', '2022-02-18 12:36:57'),
(351, 63, 'pooja gupta', '192.168.1.106', '2022-02-19 09:08:53', '2022-02-19', NULL, '2022-02-19 03:38:53', '2022-02-19 11:08:51'),
(352, 57, 'ankit sharma', '192.168.1.112', '2022-02-19 10:04:29', '2022-02-19', '2022-02-19 18:52:36', '2022-02-19 04:34:29', '2022-02-19 13:22:36'),
(353, 64, 'Praveen.yadav', '192.168.1.158', '2022-02-19 10:05:16', '2022-02-19', NULL, '2022-02-19 04:35:16', '2022-02-19 13:23:45'),
(354, 48, 'Deepak Swami', '122.176.38.177', '2022-02-19 10:05:58', '2022-02-19', NULL, '2022-02-19 04:35:58', '2022-02-19 13:50:45'),
(355, 51, 'dharmender pal', '192.168.1.118', '2022-02-19 10:06:29', '2022-02-19', NULL, '2022-02-19 04:36:29', '2022-02-19 10:01:18'),
(356, 66, 'tushar rajvanshi', '192.168.1.110', '2022-02-19 10:09:54', '2022-02-19', NULL, '2022-02-19 04:39:54', '2022-02-19 06:49:02'),
(357, 70, 'Rishabh', '192.168.1.111', '2022-02-19 10:17:50', '2022-02-19', '2022-02-19 18:59:33', '2022-02-19 04:47:50', '2022-02-19 13:29:33'),
(358, 62, 'Deepak Kumar', '192.168.1.103', '2022-02-19 11:09:55', '2022-02-19', NULL, '2022-02-19 05:39:55', '2022-02-19 14:05:52'),
(359, 50, 'santosh', '192.168.1.107', '2022-02-19 11:20:25', '2022-02-19', NULL, '2022-02-19 05:50:25', '2022-02-19 13:11:35'),
(360, 49, 'Siddharth Singh', '192.168.1.109', '2022-02-19 14:47:44', '2022-02-19', '2022-02-19 16:03:30', '2022-02-19 09:17:44', '2022-02-19 11:03:01'),
(361, 79, 'sahadev Pal', '192.168.1.105', '2022-02-19 15:50:49', '2022-02-19', '2022-02-19 16:04:29', '2022-02-19 10:20:49', '2022-02-19 10:34:29');
INSERT INTO `user_history` (`id`, `uid`, `name`, `ip_address`, `session_in`, `session_in_date`, `session_out`, `created_at`, `updated_at`) VALUES
(362, 82, 'Sanajy Rathi', '122.176.38.177', '2022-02-19 15:53:11', '2022-02-19', '2022-02-19 17:28:10', '2022-02-19 10:23:11', '2022-02-19 11:58:10'),
(363, 62, 'Deepak Kumar', '192.168.1.103', '2022-02-21 09:25:32', '2022-02-21', NULL, '2022-02-21 03:55:32', '2022-02-21 15:49:05'),
(364, 63, 'pooja gupta', '192.168.1.106', '2022-02-21 09:59:17', '2022-02-21', NULL, '2022-02-21 04:29:17', '2022-02-21 10:11:42'),
(365, 51, 'dharmender pal', '192.168.1.118', '2022-02-21 10:00:24', '2022-02-21', NULL, '2022-02-21 04:30:24', '2022-02-21 13:23:20'),
(366, 57, 'ankit sharma', '192.168.1.112', '2022-02-21 10:10:12', '2022-02-21', '2022-02-21 19:38:47', '2022-02-21 04:40:12', '2022-02-21 14:08:47'),
(367, 50, 'santosh', '192.168.1.107', '2022-02-21 10:10:54', '2022-02-21', NULL, '2022-02-21 04:40:54', '2022-02-21 12:18:14'),
(368, 66, 'tushar rajvanshi', '192.168.1.110', '2022-02-21 10:14:07', '2022-02-21', NULL, '2022-02-21 04:44:07', '2022-02-21 09:29:59'),
(369, 64, 'Praveen.yadav', '192.168.1.158', '2022-02-21 10:23:14', '2022-02-21', NULL, '2022-02-21 04:53:14', '2022-02-21 15:10:12'),
(370, 81, 'Rohit Dixit', '192.168.1.108', '2022-02-21 10:26:18', '2022-02-21', NULL, '2022-02-21 04:56:18', '2022-02-21 10:44:52'),
(371, 48, 'Deepak Swami', '192.168.1.117', '2022-02-21 10:36:03', '2022-02-21', NULL, '2022-02-21 05:06:03', '2022-02-21 15:43:16'),
(372, 70, 'Rishabh', '192.168.1.111', '2022-02-21 10:36:49', '2022-02-21', '2022-02-21 19:00:18', '2022-02-21 05:06:49', '2022-02-21 13:30:18'),
(373, 49, 'Siddharth Singh', '192.168.1.109', '2022-02-21 10:56:51', '2022-02-21', '2022-02-21 18:58:01', '2022-02-21 05:26:51', '2022-02-21 13:28:01'),
(374, 79, 'sahadev Pal', '103.141.166.50', '2022-02-21 16:10:19', '2022-02-21', NULL, '2022-02-21 10:40:19', '2022-02-21 12:18:25'),
(375, 52, 'sunil kumar', '192.168.1.105', '2022-02-21 18:58:06', '2022-02-21', '2022-02-21 19:14:50', '2022-02-21 13:28:06', '2022-02-21 13:44:50'),
(376, 63, 'pooja gupta', '192.168.1.106', '2022-02-22 09:30:54', '2022-02-22', NULL, '2022-02-22 04:00:54', '2022-02-22 12:22:42'),
(377, 51, 'dharmender pal', '192.168.1.118', '2022-02-22 09:55:14', '2022-02-22', '2022-02-22 14:01:53', '2022-02-22 04:25:14', '2022-02-22 08:31:53'),
(378, 57, 'ankit sharma', '192.168.1.112', '2022-02-22 10:03:22', '2022-02-22', NULL, '2022-02-22 04:33:22', '2022-02-22 13:22:36'),
(379, 62, 'Deepak Kumar', '192.168.1.103', '2022-02-22 10:11:44', '2022-02-22', NULL, '2022-02-22 04:41:44', '2022-02-22 13:38:49'),
(380, 64, 'Praveen.yadav', '192.168.1.158', '2022-02-22 10:13:01', '2022-02-22', NULL, '2022-02-22 04:43:01', '2022-02-22 13:20:31'),
(381, 49, 'Siddharth Singh', '192.168.1.109', '2022-02-22 10:21:01', '2022-02-22', '2022-02-22 19:14:19', '2022-02-22 04:51:01', '2022-02-22 13:44:19'),
(382, 70, 'Rishabh', '192.168.1.111', '2022-02-22 10:21:16', '2022-02-22', '2022-02-22 19:03:53', '2022-02-22 04:51:16', '2022-02-22 13:33:53'),
(383, 48, 'Deepak Swami', '192.168.1.117', '2022-02-22 10:50:08', '2022-02-22', '2022-02-22 16:03:03', '2022-02-22 05:20:08', '2022-02-22 12:32:13'),
(384, 81, 'Rohit Dixit', '192.168.1.108', '2022-02-22 11:01:25', '2022-02-22', NULL, '2022-02-22 05:31:25', '2022-02-22 05:32:24'),
(385, 50, 'santosh', '192.168.1.107', '2022-02-22 18:55:53', '2022-02-22', NULL, '2022-02-22 13:25:53', '2022-02-22 13:27:23'),
(386, 63, 'pooja gupta', '192.168.1.106', '2022-02-23 09:29:57', '2022-02-23', NULL, '2022-02-23 03:59:57', '2022-02-23 10:37:04'),
(387, 51, 'dharmender pal', '192.168.1.118', '2022-02-23 09:56:26', '2022-02-23', NULL, '2022-02-23 04:26:26', '2022-02-23 13:28:54'),
(388, 64, 'Praveen.yadav', '192.168.1.158', '2022-02-23 10:00:09', '2022-02-23', NULL, '2022-02-23 04:30:09', '2022-02-23 14:06:11'),
(389, 70, 'Rishabh', '192.168.1.111', '2022-02-23 10:12:56', '2022-02-23', '2022-02-23 19:07:37', '2022-02-23 04:42:56', '2022-02-23 13:37:37'),
(390, 57, 'ankit sharma', '192.168.1.112', '2022-02-23 10:16:28', '2022-02-23', '2022-02-23 19:10:24', '2022-02-23 04:46:28', '2022-02-23 13:40:24'),
(391, 48, 'Deepak Swami', '192.168.1.117', '2022-02-23 10:16:56', '2022-02-23', '2022-02-23 11:54:11', '2022-02-23 04:46:56', '2022-02-23 13:34:00'),
(392, 62, 'Deepak Kumar', '192.168.1.103', '2022-02-23 10:22:16', '2022-02-23', NULL, '2022-02-23 04:52:16', '2022-02-23 14:25:32'),
(393, 81, 'Rohit Dixit', '192.168.1.108', '2022-02-23 10:34:10', '2022-02-23', NULL, '2022-02-23 05:04:10', '2022-02-23 13:09:13'),
(394, 49, 'Siddharth Singh', '192.168.1.109', '2022-02-23 10:41:06', '2022-02-23', NULL, '2022-02-23 05:11:06', '2022-02-23 13:09:49'),
(395, 52, 'sunil kumar', '192.168.1.105', '2022-02-23 12:43:46', '2022-02-23', '2022-02-23 12:46:46', '2022-02-23 07:13:46', '2022-02-23 07:16:46'),
(396, 66, 'tushar rajvanshi', '192.168.1.110', '2022-02-23 14:49:50', '2022-02-23', NULL, '2022-02-23 09:19:50', '2022-02-23 13:38:42'),
(397, 63, 'pooja gupta', '192.168.1.106', '2022-02-24 09:22:07', '2022-02-24', NULL, '2022-02-24 03:52:07', '2022-02-24 12:38:23'),
(398, 51, 'dharmender pal', '192.168.1.118', '2022-02-24 09:43:20', '2022-02-24', NULL, '2022-02-24 04:13:20', '2022-02-24 12:50:15'),
(399, 48, 'Deepak Swami', '122.176.38.177', '2022-02-24 09:58:47', '2022-02-24', '2022-02-24 14:52:01', '2022-02-24 04:28:47', '2022-02-24 14:08:06'),
(400, 57, 'ankit sharma', '192.168.1.112', '2022-02-24 10:05:14', '2022-02-24', '2022-02-24 19:40:55', '2022-02-24 04:35:14', '2022-02-24 14:10:55'),
(401, 66, 'tushar rajvanshi', '192.168.1.110', '2022-02-24 10:07:25', '2022-02-24', NULL, '2022-02-24 04:37:25', '2022-02-24 13:25:16'),
(402, 70, 'Rishabh', '192.168.1.111', '2022-02-24 10:15:24', '2022-02-24', '2022-02-24 18:59:51', '2022-02-24 04:45:24', '2022-02-24 13:29:51'),
(403, 52, 'sunil kumar', '192.168.1.105', '2022-02-24 10:19:29', '2022-02-24', '2022-02-24 20:38:24', '2022-02-24 04:49:29', '2022-02-24 15:08:24'),
(404, 62, 'Deepak Kumar', '192.168.1.103', '2022-02-24 10:26:54', '2022-02-24', NULL, '2022-02-24 04:56:54', '2022-02-24 14:16:59'),
(405, 49, 'Siddharth Singh', '192.168.1.109', '2022-02-24 10:32:28', '2022-02-24', NULL, '2022-02-24 05:02:28', '2022-02-24 11:35:50'),
(406, 64, 'Praveen.yadav', '192.168.1.158', '2022-02-24 10:50:54', '2022-02-24', NULL, '2022-02-24 05:20:54', '2022-02-24 13:47:54'),
(407, 81, 'Rohit Dixit', '192.168.1.108', '2022-02-24 10:58:13', '2022-02-24', NULL, '2022-02-24 05:28:13', '2022-02-24 10:25:53'),
(408, 50, 'santosh', '192.168.1.107', '2022-02-24 11:47:36', '2022-02-24', NULL, '2022-02-24 06:17:36', '2022-02-24 11:24:09'),
(409, 79, 'sahadev Pal', '103.141.166.50', '2022-02-24 11:48:44', '2022-02-24', '2022-02-24 19:01:35', '2022-02-24 06:18:44', '2022-02-24 13:31:35'),
(410, 63, 'pooja gupta', '192.168.1.106', '2022-02-25 09:14:10', '2022-02-25', NULL, '2022-02-25 03:44:10', '2022-02-25 11:44:16'),
(411, 51, 'dharmender pal', '192.168.1.118', '2022-02-25 09:55:59', '2022-02-25', NULL, '2022-02-25 04:25:59', '2022-02-25 04:26:00'),
(412, 62, 'Deepak Kumar', '192.168.1.103', '2022-02-25 10:00:43', '2022-02-25', NULL, '2022-02-25 04:30:43', '2022-02-25 12:33:26'),
(413, 57, 'ankit sharma', '192.168.1.112', '2022-02-25 10:02:27', '2022-02-25', '2022-02-25 19:18:29', '2022-02-25 04:32:27', '2022-02-25 13:48:29'),
(414, 66, 'tushar rajvanshi', '192.168.1.110', '2022-02-25 10:05:43', '2022-02-25', NULL, '2022-02-25 04:35:43', '2022-02-25 10:14:29'),
(415, 81, 'Rohit Dixit', '192.168.1.108', '2022-02-25 10:06:47', '2022-02-25', NULL, '2022-02-25 04:36:47', '2022-02-25 13:21:28'),
(416, 48, 'Deepak Swami', '192.168.1.117', '2022-02-25 10:44:55', '2022-02-25', NULL, '2022-02-25 05:14:55', '2022-02-25 17:16:19'),
(417, 50, 'santosh', '192.168.1.107', '2022-02-25 11:03:19', '2022-02-25', NULL, '2022-02-25 05:33:19', '2022-02-25 07:49:04'),
(418, 52, 'sunil kumar', '192.168.1.105', '2022-02-25 11:04:52', '2022-02-25', '2022-02-25 15:57:49', '2022-02-25 05:34:52', '2022-02-25 15:15:56'),
(419, 70, 'Rishabh', '192.168.1.111', '2022-02-25 11:05:20', '2022-02-25', NULL, '2022-02-25 05:35:20', '2022-02-25 10:24:16'),
(420, 49, 'Siddharth Singh', '192.168.1.109', '2022-02-25 11:06:30', '2022-02-25', NULL, '2022-02-25 05:36:30', '2022-02-25 08:45:22'),
(421, 64, 'Praveen.yadav', '192.168.1.158', '2022-02-25 12:06:22', '2022-02-25', NULL, '2022-02-25 06:36:22', '2022-02-25 11:55:16'),
(422, 79, 'sahadev Pal', '192.168.1.105', '2022-02-25 15:58:09', '2022-02-25', '2022-02-25 17:14:55', '2022-02-25 10:28:09', '2022-02-25 11:44:55'),
(423, 63, 'pooja gupta', '192.168.1.106', '2022-02-26 09:22:51', '2022-02-26', '2022-02-26 17:54:44', '2022-02-26 03:52:51', '2022-02-26 12:24:44'),
(424, 50, 'santosh', '192.168.1.107', '2022-02-26 09:56:12', '2022-02-26', NULL, '2022-02-26 04:26:12', '2022-02-26 04:26:13'),
(425, 57, 'ankit sharma', '192.168.1.112', '2022-02-26 10:15:11', '2022-02-26', '2022-02-26 18:54:52', '2022-02-26 04:45:11', '2022-02-26 13:24:52'),
(426, 66, 'tushar rajvanshi', '192.168.1.110', '2022-02-26 10:48:39', '2022-02-26', NULL, '2022-02-26 05:18:39', '2022-02-26 09:45:22'),
(427, 70, 'Rishabh', '192.168.1.111', '2022-02-26 11:43:21', '2022-02-26', NULL, '2022-02-26 06:13:21', '2022-02-26 06:13:38'),
(428, 48, 'Deepak Swami', '122.176.38.177', '2022-02-26 13:31:42', '2022-02-26', NULL, '2022-02-26 08:01:42', '2022-02-26 13:15:38'),
(429, 64, 'Praveen.yadav', '192.168.1.158', '2022-02-26 14:12:33', '2022-02-26', '2022-02-26 17:17:34', '2022-02-26 08:42:33', '2022-02-26 12:25:48'),
(430, 81, 'Rohit Dixit', '192.168.1.108', '2022-02-26 16:18:24', '2022-02-26', NULL, '2022-02-26 10:48:24', '2022-02-26 10:48:24'),
(431, 63, 'pooja gupta', '192.168.1.106', '2022-02-28 09:16:33', '2022-02-28', NULL, '2022-02-28 03:46:33', '2022-02-28 12:21:24'),
(432, 81, 'Rohit Dixit', '192.168.1.108', '2022-02-28 09:54:30', '2022-02-28', NULL, '2022-02-28 04:24:30', '2022-02-28 05:46:53'),
(433, 51, 'dharmender pal', '192.168.1.118', '2022-02-28 09:57:42', '2022-02-28', NULL, '2022-02-28 04:27:42', '2022-02-28 11:40:09'),
(434, 57, 'ankit sharma', '192.168.1.112', '2022-02-28 10:06:32', '2022-02-28', '2022-02-28 19:41:10', '2022-02-28 04:36:32', '2022-02-28 14:11:10'),
(435, 66, 'tushar rajvanshi', '192.168.1.110', '2022-02-28 10:11:02', '2022-02-28', NULL, '2022-02-28 04:41:02', '2022-02-28 12:32:52'),
(436, 48, 'Deepak Swami', '122.176.38.177', '2022-02-28 10:22:22', '2022-02-28', NULL, '2022-02-28 04:52:22', '2022-02-28 14:19:31'),
(437, 70, 'Rishabh', '192.168.1.111', '2022-02-28 10:27:38', '2022-02-28', '2022-02-28 18:57:56', '2022-02-28 04:57:38', '2022-02-28 13:27:56'),
(438, 64, 'Praveen.yadav', '192.168.1.158', '2022-02-28 10:35:48', '2022-02-28', NULL, '2022-02-28 05:05:48', '2022-02-28 08:11:14'),
(439, 62, 'Deepak Kumar', '192.168.1.103', '2022-02-28 10:58:31', '2022-02-28', NULL, '2022-02-28 05:28:31', '2022-02-28 05:28:31'),
(440, 79, 'sahadev Pal', '103.141.166.50', '2022-02-28 11:49:17', '2022-02-28', NULL, '2022-02-28 06:19:17', '2022-02-28 06:24:24'),
(441, 50, 'santosh', '192.168.1.107', '2022-02-28 17:04:51', '2022-02-28', NULL, '2022-02-28 11:34:51', '2022-02-28 12:51:19'),
(442, 52, 'sunil kumar', '157.37.175.78', '2022-02-28 20:01:57', '2022-02-28', '2022-02-28 20:02:26', '2022-02-28 14:31:57', '2022-02-28 14:32:26'),
(443, 63, 'pooja gupta', '192.168.1.106', '2022-03-01 09:10:42', '2022-03-01', NULL, '2022-03-01 03:40:42', '2022-03-01 12:26:21'),
(444, 51, 'dharmender pal', '192.168.1.118', '2022-03-01 09:58:41', '2022-03-01', '2022-03-01 19:01:11', '2022-03-01 04:28:41', '2022-03-01 13:31:11'),
(445, 48, 'Deepak Swami', '192.168.1.117', '2022-03-01 10:11:18', '2022-03-01', NULL, '2022-03-01 04:41:18', '2022-03-01 17:25:01'),
(446, 57, 'ankit sharma', '192.168.1.112', '2022-03-01 10:15:30', '2022-03-01', '2022-03-01 19:17:19', '2022-03-01 04:45:30', '2022-03-01 13:47:19'),
(447, 70, 'Rishabh', '192.168.1.111', '2022-03-01 10:18:55', '2022-03-01', '2022-03-01 18:59:45', '2022-03-01 04:48:55', '2022-03-01 13:29:45'),
(448, 64, 'Praveen.yadav', '192.168.1.158', '2022-03-01 11:08:50', '2022-03-01', NULL, '2022-03-01 05:38:50', '2022-03-01 16:15:55'),
(449, 79, 'sahadev Pal', '103.141.166.50', '2022-03-01 12:21:13', '2022-03-01', NULL, '2022-03-01 06:51:13', '2022-03-01 06:51:13'),
(450, 62, 'Deepak Kumar', '192.168.1.103', '2022-03-01 13:06:57', '2022-03-01', NULL, '2022-03-01 07:36:57', '2022-03-01 15:31:28'),
(451, 50, 'santosh', '192.168.1.107', '2022-03-01 13:22:25', '2022-03-01', NULL, '2022-03-01 07:52:25', '2022-03-01 13:02:02'),
(452, 63, 'pooja gupta', '192.168.1.106', '2022-03-02 09:18:50', '2022-03-02', NULL, '2022-03-02 03:48:50', '2022-03-02 10:03:50'),
(453, 51, 'dharmender pal', '192.168.1.118', '2022-03-02 10:05:40', '2022-03-02', NULL, '2022-03-02 04:35:40', '2022-03-02 04:35:41'),
(454, 57, 'ankit sharma', '192.168.1.112', '2022-03-02 10:07:51', '2022-03-02', '2022-03-02 20:14:28', '2022-03-02 04:37:51', '2022-03-02 14:44:28'),
(455, 70, 'Rishabh', '192.168.1.111', '2022-03-02 10:14:06', '2022-03-02', '2022-03-02 19:12:52', '2022-03-02 04:44:06', '2022-03-02 13:42:52'),
(456, 81, 'Rohit Dixit', '192.168.1.108', '2022-03-02 11:07:52', '2022-03-02', NULL, '2022-03-02 05:37:52', '2022-03-02 11:33:29'),
(457, 48, 'Deepak Swami', '192.168.1.117', '2022-03-02 11:24:38', '2022-03-02', NULL, '2022-03-02 05:54:38', '2022-03-02 14:04:45'),
(458, 79, 'sahadev Pal', '103.141.166.50', '2022-03-02 11:41:13', '2022-03-02', NULL, '2022-03-02 06:11:13', '2022-03-02 06:11:14'),
(459, 49, 'Siddharth Singh', '192.168.1.105', '2022-03-02 12:05:10', '2022-03-02', '2022-03-02 19:02:06', '2022-03-02 06:35:10', '2022-03-02 13:32:06'),
(460, 50, 'santosh', '192.168.1.107', '2022-03-02 14:50:08', '2022-03-02', NULL, '2022-03-02 09:20:08', '2022-03-02 09:24:43'),
(461, 64, 'Praveen.yadav', '192.168.1.158', '2022-03-02 18:27:49', '2022-03-02', NULL, '2022-03-02 12:57:49', '2022-03-02 13:06:20'),
(462, 63, 'pooja gupta', '192.168.1.106', '2022-03-03 09:14:56', '2022-03-03', NULL, '2022-03-03 03:44:56', '2022-03-03 08:44:04'),
(463, 66, 'tushar rajvanshi', '192.168.1.104', '2022-03-03 09:16:19', '2022-03-03', NULL, '2022-03-03 03:46:19', '2022-03-03 08:52:36'),
(464, 57, 'ankit sharma', '192.168.1.112', '2022-03-03 10:01:56', '2022-03-03', '2022-03-03 19:29:43', '2022-03-03 04:31:56', '2022-03-03 13:59:43'),
(465, 48, 'Deepak Swami', '192.168.1.117', '2022-03-03 10:21:59', '2022-03-03', '2022-03-03 19:27:55', '2022-03-03 04:51:59', '2022-03-03 13:57:55'),
(466, 70, 'Rishabh', '192.168.1.111', '2022-03-03 10:22:00', '2022-03-03', '2022-03-03 19:08:05', '2022-03-03 04:52:00', '2022-03-03 13:38:05'),
(467, 81, 'Rohit Dixit', '192.168.1.108', '2022-03-03 10:30:02', '2022-03-03', NULL, '2022-03-03 05:00:02', '2022-03-03 05:00:03'),
(468, 64, 'Praveen.yadav', '192.168.1.158', '2022-03-03 11:21:12', '2022-03-03', NULL, '2022-03-03 05:51:12', '2022-03-03 10:14:43'),
(469, 62, 'Deepak Kumar', '192.168.1.103', '2022-03-03 11:37:49', '2022-03-03', '2022-03-03 16:08:38', '2022-03-03 06:07:49', '2022-03-03 13:56:06'),
(470, 79, 'sahadev Pal', '103.141.166.50', '2022-03-03 11:39:02', '2022-03-03', NULL, '2022-03-03 06:09:02', '2022-03-03 06:09:02'),
(471, 49, 'Siddharth Singh', '192.168.1.109', '2022-03-03 11:51:49', '2022-03-03', NULL, '2022-03-03 06:21:49', '2022-03-03 09:44:52'),
(472, 52, 'sunil kumar', '192.168.1.105', '2022-03-03 12:35:31', '2022-03-03', '2022-03-03 18:59:10', '2022-03-03 07:05:31', '2022-03-03 13:29:10'),
(473, 50, 'santosh', '192.168.1.107', '2022-03-03 12:52:25', '2022-03-03', '2022-03-03 17:39:03', '2022-03-03 07:22:25', '2022-03-03 13:13:44'),
(474, 66, 'tushar rajvanshi', '192.168.1.110', '2022-03-04 09:08:40', '2022-03-04', NULL, '2022-03-04 03:38:40', '2022-03-04 10:53:22'),
(475, 63, 'pooja gupta', '192.168.1.106', '2022-03-04 09:10:10', '2022-03-04', NULL, '2022-03-04 03:40:10', '2022-03-04 12:17:21'),
(476, 57, 'ankit sharma', '192.168.1.112', '2022-03-04 10:05:12', '2022-03-04', '2022-03-04 18:41:06', '2022-03-04 04:35:12', '2022-03-04 13:11:06'),
(477, 51, 'dharmender pal', '192.168.1.118', '2022-03-04 10:06:48', '2022-03-04', NULL, '2022-03-04 04:36:48', '2022-03-04 07:48:28'),
(478, 70, 'Rishabh', '192.168.1.111', '2022-03-04 10:16:33', '2022-03-04', '2022-03-04 19:15:57', '2022-03-04 04:46:33', '2022-03-04 13:45:57'),
(479, 62, 'Deepak Kumar', '192.168.1.105', '2022-03-04 10:25:39', '2022-03-04', '2022-03-04 10:50:18', '2022-03-04 04:55:39', '2022-03-04 14:37:17'),
(480, 48, 'Deepak Swami', '192.168.1.117', '2022-03-04 10:37:11', '2022-03-04', '2022-03-04 17:16:11', '2022-03-04 05:07:11', '2022-03-04 16:04:10'),
(481, 49, 'Siddharth Singh', '192.168.1.105', '2022-03-04 10:42:54', '2022-03-04', '2022-03-04 11:35:34', '2022-03-04 05:12:54', '2022-03-04 06:05:34'),
(482, 52, 'sunil kumar', '192.168.1.105', '2022-03-04 10:50:31', '2022-03-04', '2022-03-04 16:09:47', '2022-03-04 05:20:31', '2022-03-04 10:39:47'),
(483, 81, 'Rohit Dixit', '192.168.1.108', '2022-03-04 12:03:33', '2022-03-04', NULL, '2022-03-04 06:33:33', '2022-03-04 12:57:43'),
(484, 79, 'sahadev Pal', '103.141.166.50', '2022-03-04 12:59:11', '2022-03-04', '2022-03-04 19:03:30', '2022-03-04 07:29:11', '2022-03-04 13:33:30'),
(485, 50, 'santosh', '192.168.1.107', '2022-03-04 14:51:50', '2022-03-04', NULL, '2022-03-04 09:21:50', '2022-03-04 12:54:56'),
(486, 64, 'Praveen.yadav', '192.168.1.158', '2022-03-04 15:25:56', '2022-03-04', NULL, '2022-03-04 09:55:56', '2022-03-04 13:32:11'),
(487, 66, 'tushar rajvanshi', '192.168.1.110', '2022-03-05 08:58:53', '2022-03-05', NULL, '2022-03-05 03:28:53', '2022-03-05 12:11:15'),
(488, 63, 'pooja gupta', '192.168.1.106', '2022-03-05 09:01:30', '2022-03-05', NULL, '2022-03-05 03:31:30', '2022-03-05 12:21:14'),
(489, 64, 'Praveen.yadav', '192.168.1.158', '2022-03-05 10:01:04', '2022-03-05', NULL, '2022-03-05 04:31:04', '2022-03-05 07:24:56'),
(490, 51, 'dharmender pal', '192.168.1.118', '2022-03-05 10:07:59', '2022-03-05', NULL, '2022-03-05 04:37:59', '2022-03-05 04:40:23'),
(491, 48, 'Deepak Swami', '192.168.1.117', '2022-03-05 10:23:18', '2022-03-05', NULL, '2022-03-05 04:53:18', '2022-03-05 12:44:30'),
(492, 70, 'Rishabh', '192.168.1.111', '2022-03-05 10:37:31', '2022-03-05', '2022-03-05 18:34:14', '2022-03-05 05:07:31', '2022-03-05 13:04:24'),
(493, 81, 'Rohit Dixit', '192.168.1.108', '2022-03-05 11:18:19', '2022-03-05', NULL, '2022-03-05 05:48:19', '2022-03-05 12:00:38'),
(494, 62, 'Deepak Kumar', '192.168.1.103', '2022-03-05 11:35:39', '2022-03-05', NULL, '2022-03-05 06:05:39', '2022-03-05 13:51:28'),
(495, 79, 'sahadev Pal', '103.141.166.50', '2022-03-05 12:11:23', '2022-03-05', NULL, '2022-03-05 06:41:23', '2022-03-05 08:38:38'),
(496, 49, 'Siddharth Singh', '192.168.1.109', '2022-03-05 17:05:01', '2022-03-05', NULL, '2022-03-05 11:35:01', '2022-03-05 12:15:32'),
(497, 50, 'santosh', '192.168.1.107', '2022-03-05 17:38:05', '2022-03-05', NULL, '2022-03-05 12:08:05', '2022-03-05 12:18:38'),
(498, 63, 'pooja gupta', '192.168.1.106', '2022-03-07 09:27:14', '2022-03-07', NULL, '2022-03-07 03:57:14', '2022-03-07 12:11:52'),
(499, 51, 'dharmender pal', '192.168.1.118', '2022-03-07 10:08:44', '2022-03-07', '2022-03-07 19:01:23', '2022-03-07 04:38:44', '2022-03-07 13:31:23'),
(500, 57, 'ankit sharma', '192.168.1.112', '2022-03-07 10:11:00', '2022-03-07', '2022-03-07 19:05:27', '2022-03-07 04:41:00', '2022-03-07 13:35:27'),
(501, 81, 'Rohit Dixit', '192.168.1.108', '2022-03-07 10:20:17', '2022-03-07', NULL, '2022-03-07 04:50:17', '2022-03-07 08:51:25'),
(502, 70, 'Rishabh', '192.168.1.111', '2022-03-07 10:20:36', '2022-03-07', '2022-03-07 19:11:21', '2022-03-07 04:50:36', '2022-03-07 13:41:21'),
(503, 62, 'Deepak Kumar', '192.168.1.103', '2022-03-07 10:30:04', '2022-03-07', NULL, '2022-03-07 05:00:04', '2022-03-07 05:42:03'),
(504, 48, 'Deepak Swami', '192.168.1.117', '2022-03-07 10:43:27', '2022-03-07', NULL, '2022-03-07 05:13:27', '2022-03-07 12:08:34'),
(505, 49, 'Siddharth Singh', '192.168.1.105', '2022-03-07 11:01:23', '2022-03-07', '2022-03-07 11:02:05', '2022-03-07 05:31:23', '2022-03-07 05:32:05'),
(506, 79, 'sahadev Pal', '192.168.1.105', '2022-03-07 11:02:18', '2022-03-07', NULL, '2022-03-07 05:32:18', '2022-03-07 09:38:40'),
(507, 50, 'santosh', '192.168.1.107', '2022-03-07 16:37:29', '2022-03-07', NULL, '2022-03-07 11:07:29', '2022-03-07 11:07:29'),
(508, 63, 'pooja gupta', '192.168.1.106', '2022-03-08 09:19:28', '2022-03-08', NULL, '2022-03-08 03:49:28', '2022-03-08 12:08:14'),
(509, 57, 'ankit sharma', '192.168.1.112', '2022-03-08 09:52:59', '2022-03-08', NULL, '2022-03-08 04:22:59', '2022-03-08 06:37:51'),
(510, 66, 'tushar rajvanshi', '192.168.1.110', '2022-03-08 09:53:08', '2022-03-08', NULL, '2022-03-08 04:23:08', '2022-03-08 13:35:06'),
(511, 51, 'dharmender pal', '192.168.1.118', '2022-03-08 10:03:59', '2022-03-08', '2022-03-08 18:59:19', '2022-03-08 04:33:59', '2022-03-08 13:29:19'),
(512, 81, 'Rohit Dixit', '192.168.1.108', '2022-03-08 10:05:24', '2022-03-08', NULL, '2022-03-08 04:35:24', '2022-03-08 05:48:29'),
(513, 62, 'Deepak Kumar', '192.168.1.103', '2022-03-08 10:06:12', '2022-03-08', NULL, '2022-03-08 04:36:12', '2022-03-08 11:32:56'),
(514, 48, 'Deepak Swami', '192.168.1.117', '2022-03-08 10:13:22', '2022-03-08', NULL, '2022-03-08 04:43:22', '2022-03-08 14:13:50'),
(515, 79, 'sahadev Pal', '192.168.1.105', '2022-03-08 10:35:05', '2022-03-08', NULL, '2022-03-08 05:05:05', '2022-03-08 07:02:02'),
(516, 49, 'Siddharth Singh', '192.168.1.109', '2022-03-08 10:35:24', '2022-03-08', '2022-03-08 18:54:51', '2022-03-08 05:05:24', '2022-03-08 13:24:51'),
(517, 50, 'santosh', '192.168.1.107', '2022-03-08 12:13:39', '2022-03-08', NULL, '2022-03-08 06:43:39', '2022-03-08 13:09:25'),
(518, 64, 'Praveen.yadav', '192.168.1.158', '2022-03-08 14:34:04', '2022-03-08', NULL, '2022-03-08 09:04:04', '2022-03-08 12:57:13'),
(519, 70, 'Rishabh', '192.168.1.111', '2022-03-08 14:39:44', '2022-03-08', '2022-03-08 19:00:44', '2022-03-08 09:09:44', '2022-03-08 13:30:44'),
(520, 66, 'tushar rajvanshi', '192.168.1.110', '2022-03-09 10:05:03', '2022-03-09', NULL, '2022-03-09 04:35:03', '2022-03-09 06:51:41'),
(521, 57, 'ankit sharma', '192.168.1.112', '2022-03-09 10:16:43', '2022-03-09', '2022-03-09 19:06:21', '2022-03-09 04:46:43', '2022-03-09 13:36:21'),
(522, 62, 'Deepak Kumar', '192.168.1.103', '2022-03-09 10:20:40', '2022-03-09', NULL, '2022-03-09 04:50:40', '2022-03-09 11:49:58'),
(523, 63, 'pooja gupta', '192.168.1.106', '2022-03-09 10:21:47', '2022-03-09', NULL, '2022-03-09 04:51:47', '2022-03-09 11:51:10'),
(524, 70, 'Rishabh', '192.168.1.111', '2022-03-09 10:46:03', '2022-03-09', NULL, '2022-03-09 05:16:03', '2022-03-09 05:58:19'),
(525, 81, 'Rohit Dixit', '192.168.1.108', '2022-03-09 10:57:58', '2022-03-09', NULL, '2022-03-09 05:27:58', '2022-03-09 08:37:07'),
(526, 48, 'Deepak Swami', '192.168.1.117', '2022-03-09 11:04:46', '2022-03-09', NULL, '2022-03-09 05:34:46', '2022-03-09 15:31:21'),
(527, 64, 'Praveen.yadav', '192.168.1.158', '2022-03-09 11:18:36', '2022-03-09', NULL, '2022-03-09 05:48:36', '2022-03-09 11:58:51'),
(528, 79, 'sahadev Pal', '192.168.1.105', '2022-03-09 11:31:57', '2022-03-09', NULL, '2022-03-09 06:01:57', '2022-03-09 06:12:01'),
(529, 50, 'santosh', '192.168.1.107', '2022-03-09 14:48:04', '2022-03-09', NULL, '2022-03-09 09:18:04', '2022-03-09 11:07:21'),
(530, 51, 'dharmender pal', '192.168.1.118', '2022-03-10 09:42:21', '2022-03-10', NULL, '2022-03-10 04:12:21', '2022-03-10 06:39:56'),
(531, 57, 'ankit sharma', '192.168.1.112', '2022-03-10 10:10:02', '2022-03-10', '2022-03-10 18:59:33', '2022-03-10 04:40:02', '2022-03-10 13:29:33'),
(532, 62, 'Deepak Kumar', '192.168.1.103', '2022-03-10 10:13:45', '2022-03-10', NULL, '2022-03-10 04:43:45', '2022-03-10 13:30:16'),
(533, 70, 'Rishabh', '192.168.1.111', '2022-03-10 10:16:47', '2022-03-10', '2022-03-10 19:00:30', '2022-03-10 04:46:47', '2022-03-10 13:30:30'),
(534, 64, 'Praveen.yadav', '192.168.1.158', '2022-03-10 11:05:45', '2022-03-10', NULL, '2022-03-10 05:35:45', '2022-03-10 13:31:10'),
(535, 48, 'Deepak Swami', '122.176.38.177', '2022-03-10 11:22:19', '2022-03-10', '2022-03-10 16:05:08', '2022-03-10 05:52:19', '2022-03-10 13:25:14'),
(536, 81, 'Rohit Dixit', '192.168.1.108', '2022-03-10 11:45:18', '2022-03-10', NULL, '2022-03-10 06:15:18', '2022-03-10 10:22:36'),
(537, 79, 'sahadev Pal', '103.141.166.50', '2022-03-10 12:21:20', '2022-03-10', NULL, '2022-03-10 06:51:20', '2022-03-10 06:51:20'),
(538, 49, 'Siddharth Singh', '192.168.1.105', '2022-03-10 16:07:02', '2022-03-10', '2022-03-10 18:58:26', '2022-03-10 10:37:02', '2022-03-10 13:28:26'),
(539, 63, 'pooja gupta', '192.168.1.106', '2022-03-11 09:18:06', '2022-03-11', NULL, '2022-03-11 03:48:06', '2022-03-11 11:47:50'),
(540, 51, 'dharmender pal', '192.168.1.118', '2022-03-11 09:43:52', '2022-03-11', NULL, '2022-03-11 04:13:52', '2022-03-11 04:13:52'),
(541, 57, 'ankit sharma', '192.168.1.112', '2022-03-11 10:09:24', '2022-03-11', '2022-03-11 18:57:31', '2022-03-11 04:39:24', '2022-03-11 13:27:31'),
(542, 62, 'Deepak Kumar', '192.168.1.103', '2022-03-11 10:13:18', '2022-03-11', NULL, '2022-03-11 04:43:18', '2022-03-11 13:22:35'),
(543, 81, 'Rohit Dixit', '192.168.1.108', '2022-03-11 10:20:56', '2022-03-11', NULL, '2022-03-11 04:50:56', '2022-03-11 12:27:33'),
(544, 48, 'Deepak Swami', '192.168.1.117', '2022-03-11 10:22:44', '2022-03-11', NULL, '2022-03-11 04:52:44', '2022-03-11 11:52:07'),
(545, 70, 'Rishabh', '192.168.1.111', '2022-03-11 10:25:45', '2022-03-11', '2022-03-11 18:52:59', '2022-03-11 04:55:45', '2022-03-11 13:22:59'),
(546, 64, 'Praveen.yadav', '192.168.1.158', '2022-03-11 10:26:33', '2022-03-11', NULL, '2022-03-11 04:56:33', '2022-03-11 04:56:34'),
(547, 63, 'pooja gupta', '192.168.1.106', '2022-03-12 09:18:26', '2022-03-12', NULL, '2022-03-12 03:48:26', '2022-03-12 12:40:19'),
(548, 51, 'dharmender pal', '192.168.1.118', '2022-03-12 09:41:20', '2022-03-12', '2022-03-12 18:53:17', '2022-03-12 04:11:20', '2022-03-12 13:23:17'),
(549, 66, 'tushar rajvanshi', '192.168.1.110', '2022-03-12 10:05:43', '2022-03-12', NULL, '2022-03-12 04:35:43', '2022-03-12 12:25:46'),
(550, 57, 'ankit sharma', '192.168.1.112', '2022-03-12 10:08:58', '2022-03-12', '2022-03-12 19:00:57', '2022-03-12 04:38:58', '2022-03-12 13:30:57'),
(551, 48, 'Deepak Swami', '192.168.1.117', '2022-03-12 10:12:20', '2022-03-12', NULL, '2022-03-12 04:42:20', '2022-03-12 13:41:02'),
(552, 62, 'Deepak Kumar', '192.168.1.103', '2022-03-12 10:17:53', '2022-03-12', NULL, '2022-03-12 04:47:53', '2022-03-12 13:10:16'),
(553, 81, 'Rohit Dixit', '192.168.1.108', '2022-03-12 10:23:35', '2022-03-12', NULL, '2022-03-12 04:53:35', '2022-03-12 12:34:32'),
(554, 70, 'Rishabh', '192.168.1.111', '2022-03-12 10:26:37', '2022-03-12', NULL, '2022-03-12 04:56:37', '2022-03-12 12:51:32'),
(555, 64, 'Praveen.yadav', '192.168.1.158', '2022-03-12 11:20:34', '2022-03-12', NULL, '2022-03-12 05:50:34', '2022-03-12 05:50:34'),
(556, 79, 'sahadev Pal', '103.141.166.50', '2022-03-12 11:50:44', '2022-03-12', NULL, '2022-03-12 06:20:44', '2022-03-12 07:27:29'),
(557, 49, 'Siddharth Singh', '192.168.1.105', '2022-03-12 18:08:56', '2022-03-12', '2022-03-12 18:10:40', '2022-03-12 12:38:56', '2022-03-12 12:40:40'),
(558, 62, 'Deepak Kumar', '103.70.154.14', '2022-03-13 10:14:27', '2022-03-13', NULL, '2022-03-13 04:44:27', '2022-03-13 04:44:47'),
(559, 57, 'ankit sharma', '192.168.1.112', '2022-03-14 09:42:51', '2022-03-14', '2022-03-14 19:29:07', '2022-03-14 04:12:51', '2022-03-14 13:59:07'),
(560, 66, 'tushar rajvanshi', '192.168.1.110', '2022-03-14 09:48:44', '2022-03-14', NULL, '2022-03-14 04:18:44', '2022-03-14 13:00:26'),
(561, 51, 'dharmender pal', '192.168.1.118', '2022-03-14 09:57:31', '2022-03-14', '2022-03-14 19:02:09', '2022-03-14 04:27:31', '2022-03-14 13:32:09'),
(562, 81, 'Rohit Dixit', '192.168.1.108', '2022-03-14 10:08:03', '2022-03-14', NULL, '2022-03-14 04:38:03', '2022-03-14 10:08:30'),
(563, 62, 'Deepak Kumar', '192.168.1.103', '2022-03-14 10:15:23', '2022-03-14', '2022-03-14 15:52:33', '2022-03-14 04:45:23', '2022-03-14 12:36:05'),
(564, 48, 'Deepak Swami', '192.168.1.117', '2022-03-14 10:24:18', '2022-03-14', NULL, '2022-03-14 04:54:18', '2022-03-14 13:59:15'),
(565, 63, 'pooja gupta', '192.168.1.106', '2022-03-14 10:48:13', '2022-03-14', NULL, '2022-03-14 05:18:13', '2022-03-14 11:34:52'),
(566, 63, 'pooja gupta', '192.168.1.106', '2022-03-15 09:21:29', '2022-03-15', NULL, '2022-03-15 03:51:29', '2022-03-15 05:14:14'),
(567, 57, 'ankit sharma', '192.168.1.112', '2022-03-15 09:55:22', '2022-03-15', NULL, '2022-03-15 04:25:22', '2022-03-15 13:34:30'),
(568, 51, 'dharmender pal', '192.168.1.118', '2022-03-15 09:59:11', '2022-03-15', NULL, '2022-03-15 04:29:11', '2022-03-15 04:29:11'),
(569, 66, 'tushar rajvanshi', '192.168.1.110', '2022-03-15 10:01:52', '2022-03-15', NULL, '2022-03-15 04:31:52', '2022-03-15 13:18:33'),
(570, 64, 'Praveen.yadav', '192.168.1.158', '2022-03-15 10:12:47', '2022-03-15', NULL, '2022-03-15 04:42:47', '2022-03-15 04:42:48'),
(571, 81, 'Rohit Dixit', '192.168.1.108', '2022-03-15 10:43:34', '2022-03-15', NULL, '2022-03-15 05:13:34', '2022-03-15 05:14:11'),
(572, 70, 'Rishabh', '192.168.1.111', '2022-03-15 10:46:30', '2022-03-15', '2022-03-15 18:53:57', '2022-03-15 05:16:30', '2022-03-15 13:23:57'),
(573, 48, 'Deepak Swami', '192.168.1.112', '2022-03-15 10:57:00', '2022-03-15', '2022-03-15 10:57:24', '2022-03-15 05:27:00', '2022-03-15 14:22:49'),
(574, 79, 'sahadev Pal', '103.141.166.50', '2022-03-15 15:54:15', '2022-03-15', NULL, '2022-03-15 10:24:15', '2022-03-15 10:24:16'),
(575, 63, 'pooja gupta', '192.168.1.106', '2022-03-16 09:33:24', '2022-03-16', NULL, '2022-03-16 04:03:24', '2022-03-16 04:51:12'),
(576, 57, 'ankit sharma', '192.168.1.112', '2022-03-16 09:54:34', '2022-03-16', NULL, '2022-03-16 04:24:34', '2022-03-16 04:24:58'),
(577, 48, 'Deepak Swami', '192.168.1.112', '2022-03-16 09:55:01', '2022-03-16', NULL, '2022-03-16 04:25:01', '2022-03-16 04:25:53'),
(578, 62, 'Deepak Kumar', '192.168.1.103', '2022-03-16 10:01:12', '2022-03-16', NULL, '2022-03-16 04:31:12', '2022-03-16 05:08:07'),
(579, 81, 'Rohit Dixit', '192.168.1.108', '2022-03-16 10:03:33', '2022-03-16', NULL, '2022-03-16 04:33:33', '2022-03-16 04:33:33'),
(580, 51, 'dharmender pal', '192.168.1.118', '2022-03-16 10:09:32', '2022-03-16', NULL, '2022-03-16 04:39:32', '2022-03-16 04:39:42'),
(581, 70, 'Rishabh', '192.168.1.111', '2022-03-16 10:23:13', '2022-03-16', NULL, '2022-03-16 04:53:13', '2022-03-16 04:53:13'),
(582, 64, 'Praveen.yadav', '103.141.166.50', '2022-03-16 10:55:02', '2022-03-16', NULL, '2022-03-16 05:25:02', '2022-03-16 05:25:03'),
(583, 48, 'Deepak Swami', '122.176.38.177', '2022-03-17 12:36:39', '2022-03-17', NULL, '2022-03-17 07:06:39', '2022-03-17 07:06:44'),
(584, 57, 'ankit sharma', '192.168.1.112', '2022-03-17 12:50:23', '2022-03-17', NULL, '2022-03-17 07:20:23', '2022-03-17 07:20:28'),
(585, 62, 'Deepak Kumar', '103.70.154.59', '2022-03-19 10:01:38', '2022-03-19', NULL, '2022-03-19 04:31:38', '2022-03-19 08:32:45'),
(586, 64, 'Praveen.yadav', '1.187.243.222', '2022-03-19 11:43:31', '2022-03-19', NULL, '2022-03-19 06:13:31', '2022-03-19 06:13:31'),
(587, 57, 'ankit sharma', '132.154.116.213', '2022-03-19 12:43:12', '2022-03-19', NULL, '2022-03-19 07:13:12', '2022-03-19 07:13:27'),
(588, 48, 'Deepak Swami', '103.176.140.125', '2022-03-19 12:48:28', '2022-03-19', NULL, '2022-03-19 07:18:28', '2022-03-19 07:18:47'),
(589, 62, 'Deepak Kumar', '103.70.154.123', '2022-03-21 09:52:57', '2022-03-21', NULL, '2022-03-21 04:22:57', '2022-03-21 08:28:55'),
(590, 81, 'Rohit Dixit', '1.38.44.179', '2022-03-21 09:53:55', '2022-03-21', '2022-03-21 19:04:01', '2022-03-21 04:23:55', '2022-03-21 13:34:01'),
(591, 70, 'Rishabh', '47.31.99.29', '2022-03-21 10:52:32', '2022-03-21', '2022-03-21 11:14:29', '2022-03-21 05:22:32', '2022-03-21 05:44:29'),
(592, 63, 'pooja gupta', '223.233.65.22', '2022-03-21 11:14:37', '2022-03-21', NULL, '2022-03-21 05:44:37', '2022-03-21 05:44:48'),
(593, 48, 'Deepak Swami', '122.176.38.177', '2022-03-21 11:32:38', '2022-03-21', NULL, '2022-03-21 06:02:38', '2022-03-21 12:19:25'),
(594, 50, 'santosh', '47.31.208.69', '2022-03-21 12:35:20', '2022-03-21', NULL, '2022-03-21 07:05:20', '2022-03-21 07:05:43'),
(595, 64, 'Praveen.yadav', '1.38.184.185', '2022-03-21 12:58:54', '2022-03-21', NULL, '2022-03-21 07:28:54', '2022-03-21 15:11:38'),
(596, 52, 'sunil kumar', '47.31.99.29', '2022-03-21 13:21:20', '2022-03-21', '2022-03-21 13:36:05', '2022-03-21 07:51:20', '2022-03-21 08:06:05'),
(597, 49, 'Siddharth Singh', '47.31.99.29', '2022-03-21 13:26:02', '2022-03-21', '2022-03-21 16:22:25', '2022-03-21 07:56:02', '2022-03-21 10:52:25'),
(598, 62, 'Deepak Kumar', '103.70.154.123', '2022-03-22 09:28:03', '2022-03-22', NULL, '2022-03-22 03:58:03', '2022-03-22 05:26:28'),
(599, 81, 'Rohit Dixit', '43.225.74.114', '2022-03-22 09:49:35', '2022-03-22', NULL, '2022-03-22 04:19:35', '2022-03-22 04:19:36'),
(600, 50, 'santosh', '47.31.96.170', '2022-03-22 09:58:53', '2022-03-22', NULL, '2022-03-22 04:28:53', '2022-03-22 05:38:12'),
(601, 51, 'dharmender pal', '192.168.1.36', '2022-03-22 10:20:38', '2022-03-22', NULL, '2022-03-22 04:50:38', '2022-03-22 05:26:55'),
(602, 64, 'Praveen.yadav', '1.187.249.228', '2022-03-22 10:22:53', '2022-03-22', NULL, '2022-03-22 04:52:53', '2022-03-22 04:52:53'),
(603, 70, 'Rishabh', '47.31.193.12', '2022-03-22 10:42:53', '2022-03-22', NULL, '2022-03-22 05:12:53', '2022-03-22 05:12:53'),
(604, 48, 'Deepak Swami', '223.233.65.238', '2022-03-22 11:00:07', '2022-03-22', NULL, '2022-03-22 05:30:07', '2022-03-22 05:40:14'),
(605, 50, 'santosh', '223.233.65.238', '2022-03-23 18:33:44', '2022-03-23', NULL, '2022-03-23 13:03:44', '2022-03-23 13:05:39'),
(606, 63, 'pooja gupta', '192.168.1.104', '2022-03-24 09:38:15', '2022-03-24', NULL, '2022-03-24 04:08:15', '2022-03-24 12:05:33'),
(607, 66, 'tushar rajvanshi', '192.168.1.103', '2022-03-24 09:45:28', '2022-03-24', NULL, '2022-03-24 04:15:28', '2022-03-24 09:55:45'),
(608, 62, 'Deepak Kumar', '103.70.154.22', '2022-03-24 10:01:11', '2022-03-24', NULL, '2022-03-24 04:31:11', '2022-03-24 06:11:35'),
(609, 51, 'dharmender pal', '192.168.1.108', '2022-03-24 10:04:49', '2022-03-24', NULL, '2022-03-24 04:34:49', '2022-03-24 12:00:38'),
(610, 49, 'Siddharth Singh', '192.168.1.113', '2022-03-24 10:22:44', '2022-03-24', '2022-03-24 10:25:26', '2022-03-24 04:52:44', '2022-03-24 12:43:28'),
(611, 81, 'Rohit Dixit', '192.168.1.111', '2022-03-24 10:23:20', '2022-03-24', NULL, '2022-03-24 04:53:20', '2022-03-24 06:57:05'),
(612, 64, 'Praveen.yadav', '192.168.1.107', '2022-03-24 10:28:52', '2022-03-24', NULL, '2022-03-24 04:58:52', '2022-03-24 12:00:29'),
(613, 70, 'Rishabh', '192.168.1.102', '2022-03-24 10:32:34', '2022-03-24', NULL, '2022-03-24 05:02:34', '2022-03-24 06:59:27'),
(614, 57, 'ankit sharma', '192.168.1.110', '2022-03-24 10:44:15', '2022-03-24', '2022-03-24 19:09:57', '2022-03-24 05:14:15', '2022-03-24 13:39:57'),
(615, 50, 'santosh', '192.168.1.106', '2022-03-24 11:00:17', '2022-03-24', '2022-03-24 11:00:37', '2022-03-24 05:30:17', '2022-03-24 12:42:50'),
(616, 48, 'Deepak Swami', '192.168.1.110', '2022-03-24 11:34:10', '2022-03-24', '2022-03-24 17:21:00', '2022-03-24 06:04:10', '2022-03-24 13:41:37'),
(617, 79, 'sahadev Pal', '122.176.38.177', '2022-03-24 12:13:37', '2022-03-24', NULL, '2022-03-24 06:43:37', '2022-03-24 12:45:47'),
(618, 63, 'pooja gupta', '192.168.1.104', '2022-03-25 09:20:27', '2022-03-25', NULL, '2022-03-25 03:50:27', '2022-03-25 12:23:29'),
(619, 66, 'tushar rajvanshi', '192.168.1.103', '2022-03-25 09:37:02', '2022-03-25', NULL, '2022-03-25 04:07:02', '2022-03-25 12:38:09'),
(620, 51, 'dharmender pal', '192.168.1.108', '2022-03-25 10:03:14', '2022-03-25', NULL, '2022-03-25 04:33:14', '2022-03-25 12:33:10'),
(621, 64, 'Praveen.yadav', '192.168.1.107', '2022-03-25 10:06:15', '2022-03-25', NULL, '2022-03-25 04:36:15', '2022-03-25 13:39:37'),
(622, 48, 'Deepak Swami', '192.168.1.101', '2022-03-25 10:10:38', '2022-03-25', '2022-03-25 20:11:47', '2022-03-25 04:40:38', '2022-03-25 14:41:47'),
(623, 70, 'Rishabh', '192.168.1.102', '2022-03-25 10:11:40', '2022-03-25', '2022-03-25 18:55:22', '2022-03-25 04:41:40', '2022-03-25 13:25:22'),
(624, 57, 'ankit sharma', '192.168.1.110', '2022-03-25 10:12:12', '2022-03-25', NULL, '2022-03-25 04:42:12', '2022-03-25 12:23:51'),
(625, 62, 'Deepak Kumar', '192.168.1.184', '2022-03-25 10:14:43', '2022-03-25', NULL, '2022-03-25 04:44:43', '2022-03-25 12:23:54'),
(626, 50, 'santosh', '192.168.1.106', '2022-03-25 10:17:07', '2022-03-25', '2022-03-25 14:57:09', '2022-03-25 04:47:07', '2022-03-25 11:15:10'),
(627, 81, 'Rohit Dixit', '192.168.1.111', '2022-03-25 10:26:11', '2022-03-25', NULL, '2022-03-25 04:56:11', '2022-03-25 04:56:11'),
(628, 49, 'Siddharth Singh', '192.168.1.106', '2022-03-25 14:57:20', '2022-03-25', '2022-03-25 17:58:35', '2022-03-25 09:27:20', '2022-03-25 12:28:35'),
(629, 52, 'sunil kumar', '192.168.1.113', '2022-03-25 17:54:27', '2022-03-25', '2022-03-25 17:56:47', '2022-03-25 12:24:27', '2022-03-25 12:26:47'),
(630, 63, 'pooja gupta', '192.168.1.104', '2022-03-26 09:11:43', '2022-03-26', NULL, '2022-03-26 03:41:43', '2022-03-26 11:36:16'),
(631, 51, 'dharmender pal', '192.168.1.108', '2022-03-26 09:54:40', '2022-03-26', NULL, '2022-03-26 04:24:40', '2022-03-26 04:24:40'),
(632, 57, 'ankit sharma', '192.168.1.110', '2022-03-26 10:15:42', '2022-03-26', '2022-03-26 17:49:50', '2022-03-26 04:45:42', '2022-03-26 12:19:50'),
(633, 70, 'Rishabh', '192.168.1.102', '2022-03-26 10:20:48', '2022-03-26', '2022-03-26 18:59:50', '2022-03-26 04:50:48', '2022-03-26 13:29:50'),
(634, 49, 'Siddharth Singh', '192.168.1.113', '2022-03-26 10:34:10', '2022-03-26', '2022-03-26 14:53:07', '2022-03-26 05:04:10', '2022-03-26 09:23:07'),
(635, 66, 'tushar rajvanshi', '192.168.1.103', '2022-03-26 10:34:52', '2022-03-26', NULL, '2022-03-26 05:04:52', '2022-03-26 10:30:54'),
(636, 81, 'Rohit Dixit', '192.168.1.111', '2022-03-26 10:40:23', '2022-03-26', NULL, '2022-03-26 05:10:23', '2022-03-26 05:13:26'),
(637, 48, 'Deepak Swami', '192.168.1.110', '2022-03-26 11:06:12', '2022-03-26', '2022-03-26 17:38:27', '2022-03-26 05:36:12', '2022-03-26 12:08:27'),
(638, 64, 'Praveen.yadav', '192.168.1.107', '2022-03-26 11:52:06', '2022-03-26', NULL, '2022-03-26 06:22:06', '2022-03-26 09:23:07'),
(639, 50, 'santosh', '192.168.1.106', '2022-03-26 13:09:37', '2022-03-26', '2022-03-26 14:52:00', '2022-03-26 07:39:37', '2022-03-26 10:59:40'),
(640, 63, 'pooja gupta', '192.168.1.104', '2022-03-28 09:07:20', '2022-03-28', NULL, '2022-03-28 03:37:20', '2022-03-28 05:32:57'),
(641, 57, 'ankit sharma', '192.168.1.110', '2022-03-28 09:36:26', '2022-03-28', '2022-03-28 18:53:06', '2022-03-28 04:06:26', '2022-03-28 13:23:06'),
(642, 64, 'Praveen.yadav', '192.168.1.107', '2022-03-28 09:50:21', '2022-03-28', NULL, '2022-03-28 04:20:21', '2022-03-28 10:04:38'),
(643, 70, 'Rishabh', '192.168.1.102', '2022-03-28 10:15:58', '2022-03-28', '2022-03-28 18:59:00', '2022-03-28 04:45:58', '2022-03-28 13:29:00'),
(644, 81, 'Rohit Dixit', '192.168.1.111', '2022-03-28 10:24:29', '2022-03-28', NULL, '2022-03-28 04:54:29', '2022-03-28 04:54:30'),
(645, 48, 'Deepak Swami', '192.168.1.110', '2022-03-28 10:53:06', '2022-03-28', '2022-03-28 18:14:39', '2022-03-28 05:23:06', '2022-03-28 12:44:39'),
(646, 62, 'Deepak Kumar', '192.168.1.184', '2022-03-28 11:26:03', '2022-03-28', NULL, '2022-03-28 05:56:03', '2022-03-28 11:38:24'),
(647, 79, 'sahadev Pal', '103.141.166.50', '2022-03-28 11:50:24', '2022-03-28', NULL, '2022-03-28 06:20:24', '2022-03-28 11:28:22'),
(648, 66, 'tushar rajvanshi', '192.168.1.103', '2022-03-28 12:00:42', '2022-03-28', NULL, '2022-03-28 06:30:42', '2022-03-28 12:34:39'),
(649, 52, 'sunil kumar', '192.168.1.113', '2022-03-28 12:24:58', '2022-03-28', '2022-03-28 18:40:39', '2022-03-28 06:54:58', '2022-03-28 13:10:39'),
(650, 49, 'Siddharth Singh', '192.168.1.113', '2022-03-28 12:26:48', '2022-03-28', '2022-03-28 18:46:53', '2022-03-28 06:56:48', '2022-03-28 13:16:53'),
(651, 50, 'santosh', '192.168.1.106', '2022-03-28 12:52:37', '2022-03-28', '2022-03-28 17:28:29', '2022-03-28 07:22:37', '2022-03-28 13:14:07'),
(652, 63, 'pooja gupta', '192.168.1.104', '2022-03-29 09:08:14', '2022-03-29', NULL, '2022-03-29 03:38:14', '2022-03-29 10:58:09'),
(653, 51, 'dharmender pal', '192.168.1.108', '2022-03-29 10:03:07', '2022-03-29', '2022-03-29 19:09:57', '2022-03-29 04:33:07', '2022-03-29 13:39:57'),
(654, 57, 'ankit sharma', '192.168.1.110', '2022-03-29 10:16:15', '2022-03-29', NULL, '2022-03-29 04:46:15', '2022-03-29 08:57:41'),
(655, 66, 'tushar rajvanshi', '192.168.1.103', '2022-03-29 10:16:59', '2022-03-29', NULL, '2022-03-29 04:46:59', '2022-03-29 12:08:39'),
(656, 62, 'Deepak Kumar', '192.168.1.184', '2022-03-29 10:19:25', '2022-03-29', NULL, '2022-03-29 04:49:25', '2022-03-29 11:45:19'),
(657, 70, 'Rishabh', '192.168.1.102', '2022-03-29 10:22:29', '2022-03-29', NULL, '2022-03-29 04:52:29', '2022-03-29 04:52:29'),
(658, 48, 'Deepak Swami', '192.168.1.101', '2022-03-29 10:23:48', '2022-03-29', NULL, '2022-03-29 04:53:48', '2022-03-29 11:38:04'),
(659, 81, 'Rohit Dixit', '192.168.1.111', '2022-03-29 10:56:36', '2022-03-29', NULL, '2022-03-29 05:26:36', '2022-03-29 09:54:23'),
(660, 64, 'Praveen.yadav', '192.168.1.107', '2022-03-29 11:22:04', '2022-03-29', NULL, '2022-03-29 05:52:04', '2022-03-29 05:52:04'),
(661, 49, 'Siddharth Singh', '192.168.1.113', '2022-03-29 12:37:48', '2022-03-29', NULL, '2022-03-29 07:07:48', '2022-03-29 10:24:32'),
(662, 50, 'santosh', '192.168.1.106', '2022-03-29 13:04:56', '2022-03-29', NULL, '2022-03-29 07:34:56', '2022-03-29 12:35:56'),
(663, 62, 'Deepak Kumar', '192.168.1.184', '2022-03-30 10:03:19', '2022-03-30', NULL, '2022-03-30 04:33:19', '2022-03-30 12:50:25'),
(664, 57, 'ankit sharma', '192.168.1.110', '2022-03-30 10:08:42', '2022-03-30', '2022-03-30 19:00:40', '2022-03-30 04:38:42', '2022-03-30 13:30:40'),
(665, 51, 'dharmender pal', '192.168.1.108', '2022-03-30 10:10:50', '2022-03-30', NULL, '2022-03-30 04:40:50', '2022-03-30 13:25:43'),
(666, 66, 'tushar rajvanshi', '192.168.1.103', '2022-03-30 10:16:19', '2022-03-30', NULL, '2022-03-30 04:46:19', '2022-03-30 13:07:02'),
(667, 81, 'Rohit Dixit', '192.168.1.111', '2022-03-30 10:16:30', '2022-03-30', NULL, '2022-03-30 04:46:30', '2022-03-30 11:55:23'),
(668, 48, 'Deepak Swami', '10.10.10.9', '2022-03-30 10:24:38', '2022-03-30', NULL, '2022-03-30 04:54:38', '2022-03-30 13:19:51'),
(669, 64, 'Praveen.yadav', '103.141.166.50', '2022-03-30 12:33:55', '2022-03-30', NULL, '2022-03-30 07:03:55', '2022-03-30 07:03:55'),
(670, 50, 'santosh', '192.168.1.106', '2022-03-30 13:22:28', '2022-03-30', '2022-03-30 14:11:34', '2022-03-30 07:52:28', '2022-03-30 11:49:57'),
(671, 79, 'sahadev Pal', '223.233.67.254', '2022-03-30 13:52:53', '2022-03-30', NULL, '2022-03-30 08:22:53', '2022-03-30 08:22:53'),
(672, 63, 'pooja gupta', '192.168.1.104', '2022-03-31 09:39:30', '2022-03-31', '2022-03-31 17:38:07', '2022-03-31 04:09:30', '2022-03-31 12:45:09'),
(673, 51, 'dharmender pal', '192.168.1.108', '2022-03-31 10:01:03', '2022-03-31', NULL, '2022-03-31 04:31:03', '2022-03-31 10:21:55'),
(674, 62, 'Deepak Kumar', '192.168.1.184', '2022-03-31 10:06:19', '2022-03-31', NULL, '2022-03-31 04:36:19', '2022-03-31 06:09:27'),
(675, 66, 'tushar rajvanshi', '192.168.1.103', '2022-03-31 10:06:33', '2022-03-31', NULL, '2022-03-31 04:36:33', '2022-03-31 07:23:23'),
(676, 50, 'santosh', '192.168.1.106', '2022-03-31 10:08:00', '2022-03-31', NULL, '2022-03-31 04:38:00', '2022-03-31 11:18:07'),
(677, 70, 'Rishabh', '192.168.1.102', '2022-03-31 10:13:22', '2022-03-31', NULL, '2022-03-31 04:43:22', '2022-03-31 04:44:05'),
(678, 81, 'Rohit Dixit', '192.168.1.111', '2022-03-31 10:53:47', '2022-03-31', NULL, '2022-03-31 05:23:47', '2022-03-31 10:33:36'),
(679, 48, 'Deepak Swami', '192.168.1.101', '2022-03-31 10:58:53', '2022-03-31', NULL, '2022-03-31 05:28:53', '2022-03-31 12:09:44'),
(680, 79, 'sahadev Pal', '103.141.166.50', '2022-03-31 12:25:13', '2022-03-31', NULL, '2022-03-31 06:55:13', '2022-03-31 06:57:32'),
(681, 64, 'Praveen.yadav', '192.168.1.107', '2022-03-31 16:03:52', '2022-03-31', '2022-03-31 18:14:44', '2022-03-31 10:33:52', '2022-03-31 15:27:06'),
(682, 49, 'Siddharth Singh', '192.168.1.109', '2022-03-31 17:04:57', '2022-03-31', NULL, '2022-03-31 11:34:57', '2022-03-31 12:29:21'),
(683, 97, 'Krishnan Sir', '47.15.220.18', '2022-03-31 18:09:37', '2022-03-31', '2022-03-31 18:22:57', '2022-03-31 12:39:37', '2022-03-31 16:37:05'),
(684, 97, 'Krishnan Sir', '163.116.195.119', '2022-04-01 09:40:29', '2022-04-01', NULL, '2022-04-01 04:10:29', '2022-04-01 06:44:42'),
(685, 51, 'dharmender pal', '192.168.1.108', '2022-04-01 09:41:03', '2022-04-01', NULL, '2022-04-01 04:11:03', '2022-04-01 09:53:47'),
(686, 63, 'pooja gupta', '192.168.1.104', '2022-04-01 09:48:17', '2022-04-01', NULL, '2022-04-01 04:18:17', '2022-04-01 12:26:30'),
(687, 64, 'Praveen.yadav', '192.168.1.107', '2022-04-01 09:57:52', '2022-04-01', NULL, '2022-04-01 04:27:52', '2022-04-01 04:27:52'),
(688, 66, 'tushar rajvanshi', '192.168.1.103', '2022-04-01 09:59:34', '2022-04-01', NULL, '2022-04-01 04:29:34', '2022-04-01 11:55:58'),
(689, 70, 'Rishabh', '192.168.1.102', '2022-04-01 10:15:04', '2022-04-01', '2022-04-01 18:49:05', '2022-04-01 04:45:04', '2022-04-01 13:19:05'),
(690, 57, 'ankit sharma', '192.168.1.110', '2022-04-01 10:19:48', '2022-04-01', '2022-04-01 18:57:47', '2022-04-01 04:49:48', '2022-04-01 13:27:47'),
(691, 81, 'Rohit Dixit', '192.168.1.111', '2022-04-01 10:21:43', '2022-04-01', NULL, '2022-04-01 04:51:43', '2022-04-01 12:17:04'),
(692, 48, 'Deepak Swami', '192.168.1.101', '2022-04-01 10:50:42', '2022-04-01', NULL, '2022-04-01 05:20:42', '2022-04-01 13:26:31'),
(693, 50, 'santosh', '192.168.1.106', '2022-04-01 14:57:13', '2022-04-01', NULL, '2022-04-01 09:27:13', '2022-04-01 13:08:14'),
(694, 57, 'ankit sharma', '192.168.1.110', '2022-04-02 09:14:50', '2022-04-02', '2022-04-02 17:52:58', '2022-04-02 03:44:50', '2022-04-02 12:22:58'),
(695, 63, 'pooja gupta', '192.168.1.104', '2022-04-02 09:16:34', '2022-04-02', NULL, '2022-04-02 03:46:34', '2022-04-02 09:38:08'),
(696, 48, 'Deepak Swami', '192.168.1.101', '2022-04-02 10:06:31', '2022-04-02', NULL, '2022-04-02 04:36:31', '2022-04-02 13:20:25'),
(697, 66, 'tushar rajvanshi', '192.168.1.103', '2022-04-02 10:08:18', '2022-04-02', NULL, '2022-04-02 04:38:18', '2022-04-02 11:25:11'),
(698, 62, 'Deepak Kumar', '192.168.1.184', '2022-04-02 10:16:17', '2022-04-02', NULL, '2022-04-02 04:46:17', '2022-04-02 07:10:29'),
(699, 51, 'dharmender pal', '192.168.1.108', '2022-04-02 10:23:41', '2022-04-02', NULL, '2022-04-02 04:53:41', '2022-04-02 04:53:42'),
(700, 64, 'Praveen.yadav', '192.168.1.107', '2022-04-02 10:27:30', '2022-04-02', NULL, '2022-04-02 04:57:30', '2022-04-02 04:57:31'),
(701, 97, 'Krishnan Sir', '192.168.1.171', '2022-04-02 10:30:43', '2022-04-02', NULL, '2022-04-02 05:00:43', '2022-04-02 06:30:10'),
(702, 81, 'Rohit Dixit', '192.168.1.111', '2022-04-02 10:54:15', '2022-04-02', NULL, '2022-04-02 05:24:15', '2022-04-02 05:24:15'),
(703, 50, 'santosh', '192.168.1.106', '2022-04-02 11:02:30', '2022-04-02', NULL, '2022-04-02 05:32:30', '2022-04-02 13:24:56'),
(704, 63, 'pooja gupta', '192.168.1.104', '2022-04-04 09:13:51', '2022-04-04', NULL, '2022-04-04 03:43:51', '2022-04-04 07:07:53'),
(705, 51, 'dharmender pal', '192.168.1.108', '2022-04-04 09:53:59', '2022-04-04', NULL, '2022-04-04 04:23:59', '2022-04-04 04:23:59'),
(706, 66, 'tushar rajvanshi', '192.168.1.103', '2022-04-04 10:07:42', '2022-04-04', NULL, '2022-04-04 04:37:42', '2022-04-04 11:21:56'),
(707, 48, 'Deepak Swami', '192.168.1.101', '2022-04-04 10:22:55', '2022-04-04', NULL, '2022-04-04 04:52:55', '2022-04-04 14:13:32'),
(708, 62, 'Deepak Kumar', '192.168.1.184', '2022-04-04 10:23:58', '2022-04-04', NULL, '2022-04-04 04:53:58', '2022-04-04 13:21:11'),
(709, 81, 'Rohit Dixit', '192.168.1.111', '2022-04-04 10:56:10', '2022-04-04', NULL, '2022-04-04 05:26:10', '2022-04-04 08:49:54'),
(710, 57, 'ankit sharma', '192.168.1.110', '2022-04-04 11:16:23', '2022-04-04', '2022-04-04 19:34:02', '2022-04-04 05:46:23', '2022-04-04 14:04:02'),
(711, 79, 'sahadev Pal', '103.141.166.50', '2022-04-04 11:59:12', '2022-04-04', NULL, '2022-04-04 06:29:12', '2022-04-04 08:28:27'),
(712, 50, 'santosh', '192.168.1.106', '2022-04-04 13:15:38', '2022-04-04', '2022-04-04 13:22:26', '2022-04-04 07:45:38', '2022-04-04 07:54:06'),
(713, 51, 'dharmender pal', '192.168.1.108', '2022-04-05 09:25:43', '2022-04-05', NULL, '2022-04-05 03:55:43', '2022-04-05 04:20:53'),
(714, 63, 'pooja gupta', '192.168.1.104', '2022-04-05 09:40:30', '2022-04-05', NULL, '2022-04-05 04:10:30', '2022-04-05 09:41:15'),
(715, 66, 'tushar rajvanshi', '192.168.1.103', '2022-04-05 10:04:05', '2022-04-05', NULL, '2022-04-05 04:34:05', '2022-04-05 11:26:26'),
(716, 57, 'ankit sharma', '192.168.1.110', '2022-04-05 10:15:34', '2022-04-05', '2022-04-05 19:02:26', '2022-04-05 04:45:34', '2022-04-05 13:32:26'),
(717, 48, 'Deepak Swami', '192.168.1.101', '2022-04-05 10:29:34', '2022-04-05', NULL, '2022-04-05 04:59:34', '2022-04-05 13:16:52'),
(718, 81, 'Rohit Dixit', '192.168.1.111', '2022-04-05 10:31:11', '2022-04-05', NULL, '2022-04-05 05:01:11', '2022-04-05 12:51:45'),
(719, 62, 'Deepak Kumar', '192.168.1.184', '2022-04-05 10:54:05', '2022-04-05', NULL, '2022-04-05 05:24:05', '2022-04-05 13:34:42'),
(720, 79, 'sahadev Pal', '103.141.166.50', '2022-04-05 12:38:29', '2022-04-05', NULL, '2022-04-05 07:08:29', '2022-04-05 08:15:50'),
(721, 64, 'Praveen.yadav', '192.168.1.107', '2022-04-05 13:03:20', '2022-04-05', NULL, '2022-04-05 07:33:20', '2022-04-05 11:13:31'),
(722, 50, 'santosh', '192.168.1.106', '2022-04-05 15:22:26', '2022-04-05', NULL, '2022-04-05 09:52:26', '2022-04-05 13:26:27'),
(723, 63, 'pooja gupta', '192.168.1.104', '2022-04-06 09:17:05', '2022-04-06', NULL, '2022-04-06 03:47:05', '2022-04-06 11:45:35'),
(724, 51, 'dharmender pal', '192.168.1.108', '2022-04-06 09:30:57', '2022-04-06', NULL, '2022-04-06 04:00:57', '2022-04-06 04:36:57'),
(725, 66, 'tushar rajvanshi', '192.168.1.103', '2022-04-06 09:55:26', '2022-04-06', NULL, '2022-04-06 04:25:26', '2022-04-06 12:01:26'),
(726, 62, 'Deepak Kumar', '192.168.1.184', '2022-04-06 10:10:09', '2022-04-06', NULL, '2022-04-06 04:40:09', '2022-04-06 11:55:14'),
(727, 70, 'Rishabh', '192.168.1.102', '2022-04-06 10:10:23', '2022-04-06', '2022-04-06 18:53:53', '2022-04-06 04:40:23', '2022-04-06 13:23:53'),
(728, 57, 'ankit sharma', '192.168.1.110', '2022-04-06 10:21:25', '2022-04-06', '2022-04-06 19:01:40', '2022-04-06 04:51:25', '2022-04-06 13:31:40');
INSERT INTO `user_history` (`id`, `uid`, `name`, `ip_address`, `session_in`, `session_in_date`, `session_out`, `created_at`, `updated_at`) VALUES
(729, 48, 'Deepak Swami', '192.168.1.101', '2022-04-06 10:28:17', '2022-04-06', NULL, '2022-04-06 04:58:17', '2022-04-06 13:32:22'),
(730, 52, 'sunil kumar', '192.168.1.113', '2022-04-06 11:08:15', '2022-04-06', '2022-04-06 18:56:51', '2022-04-06 05:38:15', '2022-04-06 13:26:51'),
(731, 81, 'Rohit Dixit', '192.168.1.111', '2022-04-06 11:15:42', '2022-04-06', NULL, '2022-04-06 05:45:42', '2022-04-06 05:45:43'),
(732, 49, 'Siddharth Singh', '192.168.1.113', '2022-04-06 11:22:57', '2022-04-06', '2022-04-06 11:23:28', '2022-04-06 05:52:57', '2022-04-06 05:53:28'),
(733, 64, 'Praveen.yadav', '192.168.1.107', '2022-04-06 11:41:43', '2022-04-06', NULL, '2022-04-06 06:11:43', '2022-04-06 09:51:12'),
(734, 79, 'sahadev Pal', '103.141.166.50', '2022-04-06 13:45:57', '2022-04-06', NULL, '2022-04-06 08:15:57', '2022-04-06 08:15:57'),
(735, 50, 'santosh', '192.168.1.106', '2022-04-06 14:53:24', '2022-04-06', NULL, '2022-04-06 09:23:24', '2022-04-06 13:07:14'),
(736, 63, 'pooja gupta', '192.168.1.104', '2022-04-07 09:00:19', '2022-04-07', '2022-04-07 11:32:29', '2022-04-07 03:30:19', '2022-04-07 08:20:30'),
(737, 66, 'tushar rajvanshi', '192.168.1.103', '2022-04-07 09:46:58', '2022-04-07', NULL, '2022-04-07 04:16:58', '2022-04-07 11:10:06'),
(738, 50, 'santosh', '192.168.1.106', '2022-04-07 10:11:57', '2022-04-07', '2022-04-07 18:10:47', '2022-04-07 04:41:57', '2022-04-07 12:40:47'),
(739, 57, 'ankit sharma', '192.168.1.110', '2022-04-07 10:14:53', '2022-04-07', '2022-04-07 17:00:01', '2022-04-07 04:44:53', '2022-04-07 11:30:01'),
(740, 48, 'Deepak Swami', '192.168.1.101', '2022-04-07 10:16:32', '2022-04-07', '2022-04-07 12:49:55', '2022-04-07 04:46:32', '2022-04-07 13:59:41'),
(741, 70, 'Rishabh', '192.168.1.102', '2022-04-07 10:19:09', '2022-04-07', '2022-04-07 18:59:10', '2022-04-07 04:49:09', '2022-04-07 13:29:10'),
(742, 49, 'Siddharth Singh', '192.168.1.113', '2022-04-07 10:34:38', '2022-04-07', '2022-04-07 18:52:56', '2022-04-07 05:04:38', '2022-04-07 13:25:21'),
(743, 81, 'Rohit Dixit', '192.168.1.111', '2022-04-07 10:41:12', '2022-04-07', NULL, '2022-04-07 05:11:12', '2022-04-07 13:10:40'),
(744, 79, 'sahadev Pal', '103.141.166.50', '2022-04-07 11:55:57', '2022-04-07', NULL, '2022-04-07 06:25:57', '2022-04-07 06:25:57'),
(745, 101, 'Deepak', '192.168.1.171', '2022-04-07 12:01:22', '2022-04-07', '2022-04-07 18:43:15', '2022-04-07 06:31:22', '2022-04-07 13:13:15'),
(746, 64, 'Praveen.yadav', '192.168.1.107', '2022-04-07 12:04:01', '2022-04-07', NULL, '2022-04-07 06:34:01', '2022-04-07 13:46:08'),
(747, 62, 'Deepak Kumar', '192.168.1.184', '2022-04-07 12:06:38', '2022-04-07', NULL, '2022-04-07 06:36:38', '2022-04-07 10:21:32'),
(748, 52, 'sunil kumar', '192.168.1.113', '2022-04-07 13:04:45', '2022-04-07', '2022-04-07 22:34:00', '2022-04-07 07:34:45', '2022-04-07 17:04:00'),
(749, 66, 'tushar rajvanshi', '192.168.1.103', '2022-04-08 09:04:29', '2022-04-08', NULL, '2022-04-08 03:34:29', '2022-04-08 06:23:45'),
(750, 63, 'pooja gupta', '192.168.1.104', '2022-04-08 09:20:53', '2022-04-08', NULL, '2022-04-08 03:50:53', '2022-04-08 12:20:17'),
(751, 101, 'Deepak', '192.168.1.171', '2022-04-08 09:57:01', '2022-04-08', NULL, '2022-04-08 04:27:01', '2022-04-08 06:09:16'),
(752, 51, 'dharmender pal', '192.168.1.108', '2022-04-08 10:00:49', '2022-04-08', NULL, '2022-04-08 04:30:49', '2022-04-08 11:19:31'),
(753, 64, 'Praveen.yadav', '192.168.1.107', '2022-04-08 10:07:33', '2022-04-08', NULL, '2022-04-08 04:37:33', '2022-04-08 04:37:33'),
(754, 62, 'Deepak Kumar', '192.168.1.184', '2022-04-08 10:13:57', '2022-04-08', NULL, '2022-04-08 04:43:57', '2022-04-08 12:49:07'),
(755, 81, 'Rohit Dixit', '192.168.1.111', '2022-04-08 10:16:20', '2022-04-08', NULL, '2022-04-08 04:46:20', '2022-04-08 04:46:33'),
(756, 57, 'ankit sharma', '192.168.1.110', '2022-04-08 10:17:33', '2022-04-08', '2022-04-08 18:54:00', '2022-04-08 04:47:33', '2022-04-08 13:24:00'),
(757, 70, 'Rishabh', '192.168.1.102', '2022-04-08 10:21:34', '2022-04-08', '2022-04-08 19:00:40', '2022-04-08 04:51:34', '2022-04-08 13:30:40'),
(758, 52, 'sunil kumar', '192.168.1.113', '2022-04-08 10:24:55', '2022-04-08', '2022-04-08 18:57:08', '2022-04-08 04:54:55', '2022-04-08 13:27:08'),
(759, 48, 'Deepak Swami', '192.168.1.101', '2022-04-08 10:29:35', '2022-04-08', NULL, '2022-04-08 04:59:35', '2022-04-08 13:35:14'),
(760, 49, 'Siddharth Singh', '192.168.1.106', '2022-04-08 10:32:25', '2022-04-08', '2022-04-08 16:51:05', '2022-04-08 05:02:25', '2022-04-08 13:27:49'),
(761, 50, 'santosh', '192.168.1.106', '2022-04-08 10:32:36', '2022-04-08', '2022-04-08 17:01:03', '2022-04-08 05:02:36', '2022-04-08 11:31:03'),
(762, 79, 'sahadev Pal', '103.141.166.50', '2022-04-08 11:35:09', '2022-04-08', NULL, '2022-04-08 06:05:09', '2022-04-08 06:43:53'),
(763, 66, 'tushar rajvanshi', '192.168.1.103', '2022-04-09 08:36:57', '2022-04-09', '2022-04-09 10:36:01', '2022-04-09 03:06:57', '2022-04-09 10:05:32'),
(764, 57, 'ankit sharma', '192.168.1.110', '2022-04-09 09:04:59', '2022-04-09', '2022-04-09 17:48:33', '2022-04-09 03:34:59', '2022-04-09 12:18:33'),
(765, 63, 'pooja gupta', '192.168.1.104', '2022-04-09 09:19:42', '2022-04-09', NULL, '2022-04-09 03:49:42', '2022-04-09 08:57:48'),
(766, 48, 'Deepak Swami', '192.168.1.101', '2022-04-09 09:46:42', '2022-04-09', NULL, '2022-04-09 04:16:42', '2022-04-09 12:06:58'),
(767, 51, 'dharmender pal', '192.168.1.108', '2022-04-09 10:15:02', '2022-04-09', NULL, '2022-04-09 04:45:02', '2022-04-09 04:45:03'),
(768, 70, 'Rishabh', '192.168.1.102', '2022-04-09 10:16:39', '2022-04-09', '2022-04-09 18:56:11', '2022-04-09 04:46:39', '2022-04-09 13:26:11'),
(769, 50, 'santosh', '192.168.1.106', '2022-04-09 10:20:05', '2022-04-09', NULL, '2022-04-09 04:50:05', '2022-04-09 10:15:24'),
(770, 81, 'Rohit Dixit', '192.168.1.111', '2022-04-09 10:27:55', '2022-04-09', NULL, '2022-04-09 04:57:55', '2022-04-09 04:57:55'),
(771, 64, 'Praveen.yadav', '192.168.1.107', '2022-04-09 10:45:32', '2022-04-09', NULL, '2022-04-09 05:15:32', '2022-04-09 05:15:32'),
(772, 52, 'sunil kumar', '192.168.1.113', '2022-04-09 10:58:39', '2022-04-09', '2022-04-09 18:57:34', '2022-04-09 05:28:39', '2022-04-09 14:48:54'),
(773, 49, 'Siddharth Singh', '192.168.1.106', '2022-04-09 11:27:13', '2022-04-09', '2022-04-09 13:04:16', '2022-04-09 05:57:13', '2022-04-09 07:43:35'),
(774, 101, 'Deepak', '192.168.1.171', '2022-04-09 11:41:35', '2022-04-09', NULL, '2022-04-09 06:11:35', '2022-04-09 06:12:55'),
(775, 62, 'Deepak Kumar', '192.168.1.184', '2022-04-09 11:47:56', '2022-04-09', NULL, '2022-04-09 06:17:56', '2022-04-09 10:24:16'),
(776, 52, 'sunil kumar', '47.31.167.191', '2022-04-10 20:29:13', '2022-04-10', NULL, '2022-04-10 14:59:13', '2022-04-10 15:38:14'),
(777, 48, 'Deepak Swami', '192.168.1.101', '2022-04-11 08:53:18', '2022-04-11', NULL, '2022-04-11 03:23:18', '2022-04-11 11:14:40'),
(778, 63, 'pooja gupta', '192.168.1.104', '2022-04-11 09:16:16', '2022-04-11', NULL, '2022-04-11 03:46:16', '2022-04-11 11:15:34'),
(779, 50, 'santosh', '192.168.1.106', '2022-04-11 10:00:07', '2022-04-11', NULL, '2022-04-11 04:30:07', '2022-04-11 10:00:58'),
(780, 57, 'ankit sharma', '192.168.1.110', '2022-04-11 10:00:42', '2022-04-11', '2022-04-11 19:02:26', '2022-04-11 04:30:42', '2022-04-11 13:32:26'),
(781, 51, 'dharmender pal', '192.168.1.108', '2022-04-11 10:09:58', '2022-04-11', NULL, '2022-04-11 04:39:58', '2022-04-11 11:18:06'),
(782, 64, 'Praveen.yadav', '192.168.1.107', '2022-04-11 10:15:32', '2022-04-11', NULL, '2022-04-11 04:45:32', '2022-04-11 10:26:43'),
(783, 52, 'sunil kumar', '192.168.1.113', '2022-04-11 10:36:01', '2022-04-11', '2022-04-11 17:26:04', '2022-04-11 05:06:01', '2022-04-11 11:56:04'),
(784, 70, 'Rishabh', '192.168.1.102', '2022-04-11 10:45:43', '2022-04-11', NULL, '2022-04-11 05:15:43', '2022-04-11 05:15:43'),
(785, 66, 'tushar rajvanshi', '192.168.1.103', '2022-04-11 10:59:50', '2022-04-11', NULL, '2022-04-11 05:29:50', '2022-04-11 12:52:26'),
(786, 62, 'Deepak Kumar', '192.168.1.184', '2022-04-11 11:49:42', '2022-04-11', NULL, '2022-04-11 06:19:42', '2022-04-11 11:52:40'),
(787, 79, 'sahadev Pal', '223.233.64.250', '2022-04-11 16:47:27', '2022-04-11', NULL, '2022-04-11 11:17:27', '2022-04-11 11:17:27'),
(788, 48, 'Deepak Swami', '192.168.1.101', '2022-04-12 09:13:22', '2022-04-12', NULL, '2022-04-12 03:43:22', '2022-04-12 11:57:05'),
(789, 63, 'pooja gupta', '192.168.1.104', '2022-04-12 09:18:28', '2022-04-12', NULL, '2022-04-12 03:48:28', '2022-04-12 12:01:28'),
(790, 51, 'dharmender pal', '192.168.1.108', '2022-04-12 09:19:03', '2022-04-12', NULL, '2022-04-12 03:49:03', '2022-04-12 03:49:04'),
(791, 62, 'Deepak Kumar', '192.168.1.184', '2022-04-12 09:56:03', '2022-04-12', NULL, '2022-04-12 04:26:03', '2022-04-12 10:12:14'),
(792, 57, 'ankit sharma', '192.168.1.110', '2022-04-12 10:00:39', '2022-04-12', NULL, '2022-04-12 04:30:39', '2022-04-12 12:15:14'),
(793, 50, 'santosh', '192.168.1.106', '2022-04-12 10:07:43', '2022-04-12', NULL, '2022-04-12 04:37:43', '2022-04-12 07:47:30'),
(794, 70, 'Rishabh', '192.168.1.102', '2022-04-12 10:15:51', '2022-04-12', '2022-04-12 19:01:58', '2022-04-12 04:45:51', '2022-04-12 13:31:58'),
(795, 79, 'sahadev Pal', '103.141.166.50', '2022-04-12 11:02:52', '2022-04-12', '2022-04-12 11:54:02', '2022-04-12 05:32:52', '2022-04-12 07:43:26'),
(796, 81, 'Rohit Dixit', '192.168.1.111', '2022-04-12 11:22:30', '2022-04-12', NULL, '2022-04-12 05:52:30', '2022-04-12 06:26:54'),
(797, 101, 'Deepak', '192.168.1.171', '2022-04-12 11:34:44', '2022-04-12', NULL, '2022-04-12 06:04:44', '2022-04-12 07:26:33'),
(798, 49, 'Siddharth Singh', '192.168.1.113', '2022-04-12 11:45:50', '2022-04-12', '2022-04-12 11:47:35', '2022-04-12 06:15:50', '2022-04-12 06:17:35'),
(799, 52, 'sunil kumar', '192.168.1.113', '2022-04-12 13:07:54', '2022-04-12', '2022-04-12 19:02:03', '2022-04-12 07:37:54', '2022-04-12 13:32:03'),
(800, 66, 'tushar rajvanshi', '192.168.1.103', '2022-04-13 08:47:50', '2022-04-13', NULL, '2022-04-13 03:17:50', '2022-04-13 11:04:15'),
(801, 63, 'pooja gupta', '192.168.1.104', '2022-04-13 09:29:03', '2022-04-13', NULL, '2022-04-13 03:59:03', '2022-04-13 12:29:10'),
(802, 51, 'dharmender pal', '192.168.1.108', '2022-04-13 09:43:12', '2022-04-13', NULL, '2022-04-13 04:13:12', '2022-04-13 04:13:42'),
(803, 48, 'Deepak Swami', '192.168.1.101', '2022-04-13 09:50:20', '2022-04-13', NULL, '2022-04-13 04:20:20', '2022-04-13 13:29:54'),
(804, 64, 'Praveen.yadav', '192.168.1.107', '2022-04-13 09:57:18', '2022-04-13', NULL, '2022-04-13 04:27:18', '2022-04-13 04:27:18'),
(805, 57, 'ankit sharma', '192.168.1.110', '2022-04-13 10:20:55', '2022-04-13', '2022-04-13 19:02:00', '2022-04-13 04:50:55', '2022-04-13 13:32:00'),
(806, 62, 'Deepak Kumar', '192.168.1.184', '2022-04-13 10:21:26', '2022-04-13', NULL, '2022-04-13 04:51:26', '2022-04-13 04:58:08'),
(807, 70, 'Rishabh', '192.168.1.102', '2022-04-13 10:25:51', '2022-04-13', '2022-04-13 19:01:01', '2022-04-13 04:55:51', '2022-04-13 13:31:01'),
(808, 50, 'santosh', '192.168.1.106', '2022-04-13 10:26:14', '2022-04-13', NULL, '2022-04-13 04:56:14', '2022-04-13 06:25:21'),
(809, 81, 'Rohit Dixit', '192.168.1.111', '2022-04-13 10:50:15', '2022-04-13', NULL, '2022-04-13 05:20:15', '2022-04-13 05:20:21'),
(810, 52, 'sunil kumar', '192.168.1.113', '2022-04-13 18:45:26', '2022-04-13', '2022-04-13 19:01:33', '2022-04-13 13:15:26', '2022-04-13 13:31:33'),
(811, 66, 'tushar rajvanshi', '192.168.1.103', '2022-04-14 08:56:43', '2022-04-14', NULL, '2022-04-14 03:26:43', '2022-04-14 04:22:20'),
(812, 51, 'dharmender pal', '192.168.1.108', '2022-04-14 09:32:56', '2022-04-14', NULL, '2022-04-14 04:02:56', '2022-04-14 04:02:56'),
(813, 48, 'Deepak Swami', '192.168.1.101', '2022-04-14 09:49:25', '2022-04-14', '2022-04-14 19:10:44', '2022-04-14 04:19:25', '2022-04-14 13:40:44'),
(814, 62, 'Deepak Kumar', '192.168.1.184', '2022-04-14 10:06:08', '2022-04-14', NULL, '2022-04-14 04:36:08', '2022-04-14 09:09:03'),
(815, 70, 'Rishabh', '192.168.1.102', '2022-04-14 10:10:31', '2022-04-14', '2022-04-14 18:59:10', '2022-04-14 04:40:31', '2022-04-14 13:29:10'),
(816, 57, 'ankit sharma', '192.168.1.110', '2022-04-14 10:14:46', '2022-04-14', NULL, '2022-04-14 04:44:46', '2022-04-14 11:09:53'),
(817, 63, 'pooja gupta', '192.168.1.104', '2022-04-14 10:23:46', '2022-04-14', NULL, '2022-04-14 04:53:46', '2022-04-14 08:47:07'),
(818, 52, 'sunil kumar', '192.168.1.113', '2022-04-14 10:40:00', '2022-04-14', '2022-04-14 23:39:11', '2022-04-14 05:10:00', '2022-04-14 18:09:11'),
(819, 50, 'santosh', '192.168.1.106', '2022-04-14 11:26:15', '2022-04-14', '2022-04-14 14:44:44', '2022-04-14 05:56:15', '2022-04-14 09:14:44'),
(820, 49, 'Siddharth Singh', '192.168.1.106', '2022-04-14 14:44:54', '2022-04-14', NULL, '2022-04-14 09:14:54', '2022-04-14 10:31:14'),
(821, 79, 'sahadev Pal', '223.233.68.70', '2022-04-14 15:13:25', '2022-04-14', NULL, '2022-04-14 09:43:25', '2022-04-14 09:43:26'),
(822, 63, 'pooja gupta', '192.168.1.104', '2022-04-15 09:22:42', '2022-04-15', NULL, '2022-04-15 03:52:42', '2022-04-15 11:46:29'),
(823, 51, 'dharmender pal', '192.168.1.108', '2022-04-15 09:31:23', '2022-04-15', NULL, '2022-04-15 04:01:23', '2022-04-15 09:41:24'),
(824, 50, 'santosh', '192.168.1.106', '2022-04-15 10:06:55', '2022-04-15', NULL, '2022-04-15 04:36:55', '2022-04-15 12:09:22'),
(825, 52, 'sunil kumar', '192.168.1.113', '2022-04-15 10:13:40', '2022-04-15', '2022-04-15 18:55:41', '2022-04-15 04:43:40', '2022-04-15 13:25:41'),
(826, 57, 'ankit sharma', '192.168.1.110', '2022-04-15 10:21:20', '2022-04-15', '2022-04-15 18:56:55', '2022-04-15 04:51:20', '2022-04-15 13:26:55'),
(827, 62, 'Deepak Kumar', '192.168.1.184', '2022-04-15 10:29:43', '2022-04-15', NULL, '2022-04-15 04:59:43', '2022-04-15 10:10:04'),
(828, 70, 'Rishabh', '192.168.1.102', '2022-04-15 10:34:53', '2022-04-15', '2022-04-15 18:53:29', '2022-04-15 05:04:53', '2022-04-15 13:23:29'),
(829, 81, 'Rohit Dixit', '192.168.1.111', '2022-04-15 10:37:14', '2022-04-15', NULL, '2022-04-15 05:07:14', '2022-04-15 05:07:14'),
(830, 79, 'sahadev Pal', '223.233.68.170', '2022-04-15 11:11:38', '2022-04-15', NULL, '2022-04-15 05:41:38', '2022-04-15 08:17:39'),
(831, 48, 'Deepak Swami', '122.176.38.177', '2022-04-15 11:19:00', '2022-04-15', NULL, '2022-04-15 05:49:00', '2022-04-15 10:40:23'),
(832, 64, 'Praveen.yadav', '192.168.1.107', '2022-04-15 11:35:50', '2022-04-15', NULL, '2022-04-15 06:05:50', '2022-04-15 06:05:50'),
(833, 66, 'tushar rajvanshi', '192.168.1.103', '2022-04-15 12:21:16', '2022-04-15', NULL, '2022-04-15 06:51:16', '2022-04-15 06:51:17'),
(834, 49, 'Siddharth Singh', '192.168.1.109', '2022-04-15 13:06:52', '2022-04-15', NULL, '2022-04-15 07:36:52', '2022-04-15 07:37:01'),
(835, 101, 'Deepak', '192.168.1.171', '2022-04-15 14:03:53', '2022-04-15', '2022-04-15 14:04:12', '2022-04-15 08:33:53', '2022-04-15 08:34:12'),
(836, 51, 'dharmender pal', '192.168.1.108', '2022-04-16 09:31:01', '2022-04-16', '2022-04-16 18:56:16', '2022-04-16 04:01:01', '2022-04-16 13:26:16'),
(837, 57, 'ankit sharma', '192.168.1.110', '2022-04-16 09:31:28', '2022-04-16', NULL, '2022-04-16 04:01:28', '2022-04-16 12:17:13'),
(838, 66, 'tushar rajvanshi', '192.168.1.103', '2022-04-16 09:41:14', '2022-04-16', NULL, '2022-04-16 04:11:14', '2022-04-16 10:37:20'),
(839, 62, 'Deepak Kumar', '192.168.1.184', '2022-04-16 09:58:17', '2022-04-16', NULL, '2022-04-16 04:28:17', '2022-04-16 12:46:38'),
(840, 48, 'Deepak Swami', '192.168.1.101', '2022-04-16 09:59:01', '2022-04-16', NULL, '2022-04-16 04:29:01', '2022-04-16 14:05:42'),
(841, 63, 'pooja gupta', '192.168.1.104', '2022-04-16 10:20:46', '2022-04-16', NULL, '2022-04-16 04:50:46', '2022-04-16 12:31:51'),
(842, 50, 'santosh', '192.168.1.106', '2022-04-16 10:28:09', '2022-04-16', NULL, '2022-04-16 04:58:09', '2022-04-16 13:28:30'),
(843, 52, 'sunil kumar', '192.168.1.113', '2022-04-16 10:32:53', '2022-04-16', '2022-04-16 18:55:12', '2022-04-16 05:02:53', '2022-04-16 13:25:12'),
(844, 64, 'Praveen.yadav', '192.168.1.107', '2022-04-16 10:56:55', '2022-04-16', NULL, '2022-04-16 05:26:55', '2022-04-16 09:42:18'),
(845, 79, 'sahadev Pal', '122.176.38.177', '2022-04-16 13:35:09', '2022-04-16', NULL, '2022-04-16 08:05:09', '2022-04-16 08:05:10'),
(846, 66, 'tushar rajvanshi', '192.168.1.103', '2022-04-18 10:01:55', '2022-04-18', NULL, '2022-04-18 04:31:55', '2022-04-18 12:01:10'),
(847, 51, 'dharmender pal', '192.168.1.108', '2022-04-18 10:04:29', '2022-04-18', NULL, '2022-04-18 04:34:29', '2022-04-18 07:57:14'),
(848, 70, 'Rishabh', '192.168.1.102', '2022-04-18 10:19:13', '2022-04-18', '2022-04-18 19:02:51', '2022-04-18 04:49:13', '2022-04-18 13:32:51'),
(849, 63, 'pooja gupta', '192.168.1.104', '2022-04-18 10:31:39', '2022-04-18', NULL, '2022-04-18 05:01:39', '2022-04-18 10:28:36'),
(850, 48, 'Deepak Swami', '192.168.1.101', '2022-04-18 10:32:08', '2022-04-18', NULL, '2022-04-18 05:02:08', '2022-04-18 10:04:07'),
(851, 79, 'sahadev Pal', '122.176.38.177', '2022-04-18 11:47:31', '2022-04-18', NULL, '2022-04-18 06:17:31', '2022-04-18 06:17:47'),
(852, 57, 'ankit sharma', '192.168.1.110', '2022-04-18 11:49:49', '2022-04-18', '2022-04-18 20:00:54', '2022-04-18 06:19:49', '2022-04-18 14:30:54'),
(853, 64, 'Praveen.yadav', '192.168.1.107', '2022-04-18 12:26:17', '2022-04-18', NULL, '2022-04-18 06:56:17', '2022-04-18 06:56:18'),
(854, 62, 'Deepak Kumar', '192.168.1.184', '2022-04-18 13:12:02', '2022-04-18', NULL, '2022-04-18 07:42:02', '2022-04-18 15:54:07'),
(855, 52, 'sunil kumar', '192.168.1.113', '2022-04-18 13:26:30', '2022-04-18', '2022-04-18 18:14:24', '2022-04-18 07:56:30', '2022-04-18 12:44:24'),
(856, 63, 'pooja gupta', '192.168.1.104', '2022-04-19 09:15:56', '2022-04-19', NULL, '2022-04-19 03:45:56', '2022-04-19 10:34:26'),
(857, 66, 'tushar rajvanshi', '192.168.1.103', '2022-04-19 09:50:11', '2022-04-19', NULL, '2022-04-19 04:20:11', '2022-04-19 07:21:24'),
(858, 51, 'dharmender pal', '192.168.1.108', '2022-04-19 09:59:06', '2022-04-19', NULL, '2022-04-19 04:29:06', '2022-04-19 04:29:06'),
(859, 50, 'santosh', '192.168.1.106', '2022-04-19 10:12:22', '2022-04-19', '2022-04-19 10:14:06', '2022-04-19 04:42:22', '2022-04-19 12:44:55'),
(860, 70, 'Rishabh', '192.168.1.102', '2022-04-19 10:24:44', '2022-04-19', NULL, '2022-04-19 04:54:44', '2022-04-19 07:38:50'),
(861, 57, 'ankit sharma', '192.168.1.110', '2022-04-19 10:30:17', '2022-04-19', '2022-04-19 18:59:18', '2022-04-19 05:00:17', '2022-04-19 13:29:18'),
(862, 62, 'Deepak Kumar', '192.168.1.184', '2022-04-19 10:34:57', '2022-04-19', NULL, '2022-04-19 05:04:57', '2022-04-19 13:09:01'),
(863, 48, 'Deepak Swami', '192.168.1.101', '2022-04-19 11:11:13', '2022-04-19', '2022-04-19 19:05:37', '2022-04-19 05:41:13', '2022-04-19 13:35:37'),
(864, 79, 'sahadev Pal', '122.176.38.177', '2022-04-19 11:35:31', '2022-04-19', NULL, '2022-04-19 06:05:31', '2022-04-19 07:06:14'),
(865, 63, 'pooja gupta', '192.168.1.104', '2022-04-20 09:30:21', '2022-04-20', NULL, '2022-04-20 04:00:21', '2022-04-20 12:17:19'),
(866, 51, 'dharmender pal', '192.168.1.108', '2022-04-20 10:00:52', '2022-04-20', NULL, '2022-04-20 04:30:52', '2022-04-20 11:58:03'),
(867, 52, 'sunil kumar', '192.168.1.113', '2022-04-20 10:10:01', '2022-04-20', '2022-04-20 20:49:35', '2022-04-20 04:40:01', '2022-04-20 15:19:35'),
(868, 62, 'Deepak Kumar', '192.168.1.184', '2022-04-20 10:11:44', '2022-04-20', NULL, '2022-04-20 04:41:44', '2022-04-20 10:57:17'),
(869, 70, 'Rishabh', '192.168.1.102', '2022-04-20 10:13:45', '2022-04-20', NULL, '2022-04-20 04:43:45', '2022-04-20 04:43:46'),
(870, 57, 'ankit sharma', '192.168.1.110', '2022-04-20 10:22:34', '2022-04-20', '2022-04-20 19:03:21', '2022-04-20 04:52:34', '2022-04-20 13:51:54'),
(871, 48, 'Deepak Swami', '192.168.1.101', '2022-04-20 11:11:57', '2022-04-20', NULL, '2022-04-20 05:41:57', '2022-04-20 13:54:07'),
(872, 66, 'tushar rajvanshi', '192.168.1.103', '2022-04-20 11:15:56', '2022-04-20', NULL, '2022-04-20 05:45:56', '2022-04-20 05:45:56'),
(873, 50, 'santosh', '192.168.1.106', '2022-04-20 13:20:23', '2022-04-20', NULL, '2022-04-20 07:50:23', '2022-04-20 07:57:40'),
(874, 66, 'tushar rajvanshi', '192.168.1.103', '2022-04-21 08:51:06', '2022-04-21', NULL, '2022-04-21 03:21:06', '2022-04-21 03:21:07'),
(875, 62, 'Deepak Kumar', '192.168.1.184', '2022-04-21 09:26:15', '2022-04-21', NULL, '2022-04-21 03:56:15', '2022-04-21 11:27:53'),
(876, 51, 'dharmender pal', '192.168.1.108', '2022-04-21 09:48:47', '2022-04-21', NULL, '2022-04-21 04:18:47', '2022-04-21 04:18:47'),
(877, 48, 'Deepak Swami', '192.168.1.101', '2022-04-21 10:09:46', '2022-04-21', NULL, '2022-04-21 04:39:46', '2022-04-21 14:14:06'),
(878, 52, 'sunil kumar', '192.168.1.113', '2022-04-21 10:13:06', '2022-04-21', '2022-04-21 19:10:30', '2022-04-21 04:43:06', '2022-04-21 13:40:30'),
(879, 70, 'Rishabh', '192.168.1.102', '2022-04-21 10:14:02', '2022-04-21', NULL, '2022-04-21 04:44:02', '2022-04-21 04:44:03'),
(880, 57, 'ankit sharma', '192.168.1.110', '2022-04-22 09:06:03', '2022-04-22', '2022-04-22 17:56:12', '2022-04-22 03:36:03', '2022-04-22 12:26:12'),
(881, 51, 'dharmender pal', '192.168.1.108', '2022-04-22 09:32:56', '2022-04-22', NULL, '2022-04-22 04:02:56', '2022-04-22 04:02:56'),
(882, 63, 'pooja gupta', '192.168.1.104', '2022-04-22 09:35:35', '2022-04-22', NULL, '2022-04-22 04:05:35', '2022-04-22 11:53:22'),
(883, 48, 'Deepak Swami', '192.168.1.101', '2022-04-22 09:52:52', '2022-04-22', '2022-04-22 19:45:58', '2022-04-22 04:22:52', '2022-04-22 14:15:58'),
(884, 52, 'sunil kumar', '192.168.1.113', '2022-04-22 10:12:50', '2022-04-22', '2022-04-22 19:16:57', '2022-04-22 04:42:50', '2022-04-22 13:46:57'),
(885, 62, 'Deepak Kumar', '192.168.1.184', '2022-04-22 10:23:01', '2022-04-22', NULL, '2022-04-22 04:53:01', '2022-04-22 10:40:13'),
(886, 70, 'Rishabh', '192.168.1.102', '2022-04-22 10:23:01', '2022-04-22', NULL, '2022-04-22 04:53:01', '2022-04-22 04:53:02'),
(887, 50, 'santosh', '192.168.1.106', '2022-04-22 10:23:07', '2022-04-22', NULL, '2022-04-22 04:53:07', '2022-04-22 11:34:20'),
(888, 79, 'sahadev Pal', '122.176.38.177', '2022-04-22 10:42:23', '2022-04-22', NULL, '2022-04-22 05:12:23', '2022-04-22 08:57:24'),
(889, 64, 'Praveen.yadav', '192.168.1.107', '2022-04-22 11:30:19', '2022-04-22', NULL, '2022-04-22 06:00:19', '2022-04-22 06:00:19'),
(890, 49, 'Siddharth Singh', '192.168.1.109', '2022-04-22 12:57:58', '2022-04-22', '2022-04-22 13:54:03', '2022-04-22 07:27:58', '2022-04-22 08:24:03'),
(891, 63, 'pooja gupta', '192.168.1.104', '2022-04-23 09:25:40', '2022-04-23', NULL, '2022-04-23 03:55:40', '2022-04-23 12:12:26'),
(892, 51, 'dharmender pal', '192.168.1.108', '2022-04-23 09:43:12', '2022-04-23', '2022-04-23 17:17:02', '2022-04-23 04:13:12', '2022-04-23 11:47:02'),
(893, 52, 'sunil kumar', '192.168.1.113', '2022-04-23 10:08:07', '2022-04-23', '2022-04-23 18:59:22', '2022-04-23 04:38:07', '2022-04-23 14:49:32'),
(894, 48, 'Deepak Swami', '192.168.1.101', '2022-04-23 10:25:38', '2022-04-23', NULL, '2022-04-23 04:55:38', '2022-04-23 12:49:35'),
(895, 70, 'Rishabh', '192.168.1.102', '2022-04-23 10:32:52', '2022-04-23', '2022-04-23 18:53:17', '2022-04-23 05:02:52', '2022-04-23 13:23:17'),
(896, 66, 'tushar rajvanshi', '192.168.1.114', '2022-04-23 10:44:12', '2022-04-23', NULL, '2022-04-23 05:14:12', '2022-04-23 07:06:31'),
(897, 64, 'Praveen.yadav', '192.168.1.107', '2022-04-23 11:05:08', '2022-04-23', NULL, '2022-04-23 05:35:08', '2022-04-23 06:51:59'),
(898, 62, 'Deepak Kumar', '192.168.1.184', '2022-04-23 11:10:26', '2022-04-23', NULL, '2022-04-23 05:40:26', '2022-04-23 07:20:47'),
(899, 50, 'santosh', '192.168.1.106', '2022-04-23 11:53:40', '2022-04-23', '2022-04-23 15:12:19', '2022-04-23 06:23:40', '2022-04-23 09:50:07'),
(900, 49, 'Siddharth Singh', '192.168.1.109', '2022-04-23 14:38:59', '2022-04-23', '2022-04-23 17:07:50', '2022-04-23 09:08:59', '2022-04-23 11:37:50'),
(901, 52, 'sunil kumar', '157.37.223.201', '2022-04-24 08:13:30', '2022-04-24', NULL, '2022-04-24 02:43:30', '2022-04-24 04:27:12'),
(902, 63, 'pooja gupta', '192.168.1.104', '2022-04-25 09:15:36', '2022-04-25', NULL, '2022-04-25 03:45:36', '2022-04-25 03:48:29'),
(903, 66, 'tushar rajvanshi', '192.168.1.103', '2022-04-25 09:41:02', '2022-04-25', NULL, '2022-04-25 04:11:02', '2022-04-25 04:13:33'),
(904, 57, 'ankit sharma', '192.168.1.110', '2022-04-25 10:07:58', '2022-04-25', NULL, '2022-04-25 04:37:58', '2022-04-25 04:38:05'),
(905, 48, 'Deepak Swami', '192.168.1.101', '2022-04-25 10:20:09', '2022-04-25', NULL, '2022-04-25 04:50:09', '2022-04-25 05:23:14'),
(906, 52, 'sunil kumar', '192.168.1.113', '2022-04-25 10:24:39', '2022-04-25', '2022-04-25 16:52:10', '2022-04-25 04:54:39', '2022-04-25 11:22:10'),
(907, 49, 'Siddharth Singh', '192.168.1.109', '2022-04-25 10:54:25', '2022-04-25', '2022-04-25 20:18:57', '2022-04-25 05:24:25', '2022-04-25 14:48:57'),
(908, 62, 'Deepak Kumar', '192.168.1.184', '2022-04-25 11:01:52', '2022-04-25', NULL, '2022-04-25 05:31:52', '2022-04-25 05:31:52'),
(909, 50, 'santosh', '192.168.1.106', '2022-04-25 11:02:24', '2022-04-25', NULL, '2022-04-25 05:32:24', '2022-04-25 05:45:59'),
(910, 52, 'sunil kumar', '192.168.1.113', '2022-04-28 14:16:11', '2022-04-28', '2022-04-28 18:59:24', '2022-04-28 08:46:11', '2022-04-28 13:29:24'),
(911, 52, 'sunil kumar', '192.168.1.113', '2022-04-29 10:10:22', '2022-04-29', '2022-04-29 16:40:43', '2022-04-29 04:40:22', '2022-04-29 11:10:43'),
(912, 50, 'santosh', '192.168.1.106', '2022-04-29 11:28:28', '2022-04-29', '2022-04-29 11:30:24', '2022-04-29 05:58:28', '2022-04-29 06:00:24'),
(913, 52, 'sunil kumar', '192.168.1.113', '2022-04-30 11:23:32', '2022-04-30', '2022-04-30 19:07:54', '2022-04-30 05:53:32', '2022-04-30 13:37:54'),
(914, 52, 'sunil kumar', '192.168.1.113', '2022-05-02 10:26:51', '2022-05-02', '2022-05-02 11:25:34', '2022-05-02 04:56:51', '2022-05-02 05:55:34'),
(915, 49, 'Siddharth Singh', '192.168.1.113', '2022-05-02 10:54:44', '2022-05-02', '2022-05-02 16:53:55', '2022-05-02 05:24:44', '2022-05-02 11:23:55'),
(916, 50, 'santosh', '192.168.1.106', '2022-05-02 11:24:31', '2022-05-02', '2022-05-02 11:24:58', '2022-05-02 05:54:31', '2022-05-02 13:27:01'),
(917, 50, 'santosh', '192.168.1.106', '2022-05-03 10:20:19', '2022-05-03', NULL, '2022-05-03 04:50:19', '2022-05-03 11:02:14'),
(918, 52, 'sunil kumar', '192.168.1.113', '2022-05-03 11:12:56', '2022-05-03', '2022-05-03 19:03:19', '2022-05-03 05:42:56', '2022-05-03 13:33:19'),
(919, 49, 'Siddharth Singh', '192.168.1.113', '2022-05-03 11:13:48', '2022-05-03', '2022-05-03 15:53:14', '2022-05-03 05:43:48', '2022-05-03 10:23:14'),
(920, 50, 'santosh', '192.168.1.106', '2022-05-04 10:23:10', '2022-05-04', NULL, '2022-05-04 04:53:10', '2022-05-04 13:24:15'),
(921, 52, 'sunil kumar', '192.168.1.113', '2022-05-04 10:23:25', '2022-05-04', '2022-05-04 19:00:26', '2022-05-04 04:53:25', '2022-05-04 13:30:26'),
(922, 49, 'Siddharth Singh', '192.168.1.113', '2022-05-04 14:15:02', '2022-05-04', '2022-05-04 14:20:09', '2022-05-04 08:45:02', '2022-05-04 08:50:09'),
(923, 50, 'santosh', '192.168.1.106', '2022-05-05 10:26:00', '2022-05-05', NULL, '2022-05-05 04:56:00', '2022-05-05 13:23:23'),
(924, 52, 'sunil kumar', '192.168.1.113', '2022-05-05 11:10:28', '2022-05-05', '2022-05-05 11:11:09', '2022-05-05 05:40:28', '2022-05-05 05:41:09'),
(925, 50, 'santosh', '192.168.1.106', '2022-05-06 10:15:46', '2022-05-06', NULL, '2022-05-06 04:45:46', '2022-05-06 12:19:07'),
(926, 52, 'sunil kumar', '192.168.1.113', '2022-05-06 11:37:20', '2022-05-06', '2022-05-06 11:37:34', '2022-05-06 06:07:20', '2022-05-06 06:07:34'),
(927, 49, 'Siddharth Singh', '192.168.1.113', '2022-05-06 11:37:43', '2022-05-06', '2022-05-06 18:05:28', '2022-05-06 06:07:43', '2022-05-06 12:35:28'),
(928, 50, 'santosh', '192.168.1.116', '2022-05-07 10:21:51', '2022-05-07', NULL, '2022-05-07 04:51:51', '2022-05-07 11:15:07'),
(929, 52, 'sunil kumar', '192.168.1.167', '2022-05-07 10:28:35', '2022-05-07', '2022-05-07 17:02:02', '2022-05-07 04:58:35', '2022-05-07 11:48:49'),
(930, 49, 'Siddharth Singh', '192.168.1.167', '2022-05-07 15:55:47', '2022-05-07', '2022-05-07 15:56:19', '2022-05-07 10:25:47', '2022-05-07 10:26:19'),
(931, 52, 'sunil kumar', '192.168.1.103', '2022-05-09 09:58:25', '2022-05-09', '2022-05-09 20:05:35', '2022-05-09 04:28:25', '2022-05-09 14:35:35'),
(932, 49, 'Siddharth Singh', '192.168.1.167', '2022-05-09 15:22:45', '2022-05-09', '2022-05-09 19:00:45', '2022-05-09 09:52:45', '2022-05-09 13:30:45'),
(933, 48, 'Deepak Swami', '192.168.1.167', '2022-05-09 17:11:45', '2022-05-09', '2022-05-09 17:13:01', '2022-05-09 11:41:45', '2022-05-09 11:43:01'),
(934, 52, 'sunil kumar', '192.168.1.103', '2022-05-10 10:07:56', '2022-05-10', '2022-05-10 19:10:43', '2022-05-10 04:37:56', '2022-05-10 13:40:43'),
(935, 50, 'santosh', '47.9.185.121', '2022-05-10 10:10:59', '2022-05-10', '2022-05-10 10:49:14', '2022-05-10 04:40:59', '2022-05-10 05:19:14'),
(936, 49, 'Siddharth Singh', '192.168.1.167', '2022-05-10 12:41:49', '2022-05-10', '2022-05-10 12:42:48', '2022-05-10 07:11:49', '2022-05-10 10:57:48'),
(937, 48, 'Deepak Swami', '192.168.1.101', '2022-05-10 16:29:14', '2022-05-10', '2022-05-10 18:15:21', '2022-05-10 10:59:14', '2022-05-10 12:45:21'),
(938, 70, 'Rishabh', '192.168.1.104', '2022-05-10 17:17:06', '2022-05-10', '2022-05-10 19:08:53', '2022-05-10 11:47:06', '2022-05-10 13:38:53'),
(939, 52, 'sunil kumar', '192.168.1.103', '2022-05-11 10:24:21', '2022-05-11', '2022-05-11 18:58:47', '2022-05-11 04:54:21', '2022-05-11 13:28:47'),
(940, 49, 'Siddharth Singh', '192.168.1.191', '2022-05-11 10:31:26', '2022-05-11', NULL, '2022-05-11 05:01:26', '2022-05-11 10:52:43'),
(941, 52, 'sunil kumar', '192.168.1.103', '2022-05-12 10:19:58', '2022-05-12', '2022-05-12 19:06:47', '2022-05-12 04:49:58', '2022-05-12 13:36:47'),
(942, 49, 'Siddharth Singh', '192.168.1.167', '2022-05-12 11:54:33', '2022-05-12', '2022-05-12 13:35:28', '2022-05-12 06:24:33', '2022-05-12 08:05:28'),
(943, 52, 'sunil kumar', '192.168.1.103', '2022-05-13 10:44:05', '2022-05-13', '2022-05-13 12:29:17', '2022-05-13 05:14:05', '2022-05-13 06:59:17'),
(944, 49, 'Siddharth Singh', '192.168.1.167', '2022-05-13 05:33:27', '2022-05-13', '2022-05-13 13:31:09', '2022-05-13 00:03:27', '2022-05-13 08:01:09'),
(945, 49, 'Siddharth Singh', '192.168.1.167', '2022-05-14 05:12:09', '2022-05-14', '2022-05-14 13:32:49', '2022-05-13 23:42:09', '2022-05-14 08:02:49'),
(946, 52, 'sunil kumar', '192.168.1.191', '2022-05-14 05:28:11', '2022-05-14', '2022-05-14 05:32:32', '2022-05-13 23:58:11', '2022-05-14 00:02:32'),
(947, 49, 'Siddharth Singh', '127.0.0.1', '2022-05-15 04:50:27', '2022-05-15', '2022-05-15 07:47:10', '2022-05-14 23:20:27', '2022-05-15 02:17:10');

-- --------------------------------------------------------

--
-- Table structure for table `user_permission_list`
--

CREATE TABLE `user_permission_list` (
  `id` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `group_name` varchar(255) NOT NULL,
  `create_ticket_permission` int(11) NOT NULL,
  `manage_ticket_permission` int(11) NOT NULL,
  `create_customer_permission` int(11) NOT NULL,
  `customer_list_permission` int(11) NOT NULL,
  `knowledge_base_permission` int(11) NOT NULL,
  `email_permission` int(11) NOT NULL,
  `report_permission` int(11) NOT NULL,
  `process_permission` int(11) NOT NULL,
  `user_permission` int(11) NOT NULL,
  `access_permission` int(11) NOT NULL,
  `status_permission` int(11) NOT NULL,
  `category_permission` int(11) NOT NULL,
  `country_state_city_permission` int(11) NOT NULL,
  `product_permission` int(11) NOT NULL,
  `department_permission` int(11) NOT NULL,
  `rca_permission` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_permission_list`
--

INSERT INTO `user_permission_list` (`id`, `uid`, `group_name`, `create_ticket_permission`, `manage_ticket_permission`, `create_customer_permission`, `customer_list_permission`, `knowledge_base_permission`, `email_permission`, `report_permission`, `process_permission`, `user_permission`, `access_permission`, `status_permission`, `category_permission`, `country_state_city_permission`, `product_permission`, `department_permission`, `rca_permission`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Development', 1, 1, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, '2021-12-06 13:30:47', '2022-04-07 07:33:24'),
(2, NULL, 'Support', 1, 1, 1, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, '2021-12-06 13:55:49', '2022-01-17 07:44:43'),
(3, NULL, 'HR', 1, 1, 1, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, '2021-12-06 13:57:23', '2022-03-31 11:08:58'),
(4, NULL, 'Admin', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2021-12-07 05:29:54', '2021-12-08 06:57:58'),
(5, NULL, 'Office Admin', 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, '2021-12-28 02:22:59', '2022-01-03 08:59:41'),
(6, NULL, 'Marketing', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2021-12-29 11:47:50', '2021-12-29 11:47:50'),
(7, NULL, 'Director', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2021-12-31 06:44:21', '2021-12-31 06:44:21'),
(8, NULL, 'Sales', 1, 1, 1, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, '2022-01-03 08:50:03', '2022-01-17 07:44:55'),
(9, NULL, 'Administration', 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, '2022-01-03 09:08:01', '2022-01-03 09:08:01'),
(10, NULL, 'Demo', 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 1, 1, 0, 1, 1, 1, '2022-03-31 12:29:43', '2022-03-31 13:02:44');

-- --------------------------------------------------------

--
-- Table structure for table `user_permission_list_12345`
--

CREATE TABLE `user_permission_list_12345` (
  `id` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `group_name` varchar(255) NOT NULL,
  `create_ticket_permission` int(11) NOT NULL,
  `manage_ticket_permission` int(11) NOT NULL,
  `create_customer_permission` int(11) NOT NULL,
  `customer_list_permission` int(11) NOT NULL,
  `knowledge_base_permission` int(11) NOT NULL,
  `email_permission` int(11) NOT NULL,
  `report_permission` int(11) NOT NULL,
  `process_permission` int(11) NOT NULL,
  `user_permission` int(11) NOT NULL,
  `access_permission` int(11) NOT NULL,
  `status_permission` int(11) NOT NULL,
  `category_permission` int(11) NOT NULL,
  `country_state_city_permission` int(11) NOT NULL,
  `product_permission` int(11) NOT NULL,
  `department_permission` int(11) NOT NULL,
  `rca_permission` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_permission_list_12345`
--

INSERT INTO `user_permission_list_12345` (`id`, `uid`, `group_name`, `create_ticket_permission`, `manage_ticket_permission`, `create_customer_permission`, `customer_list_permission`, `knowledge_base_permission`, `email_permission`, `report_permission`, `process_permission`, `user_permission`, `access_permission`, `status_permission`, `category_permission`, `country_state_city_permission`, `product_permission`, `department_permission`, `rca_permission`, `created_at`, `updated_at`) VALUES
(1, NULL, 'support', 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, '2021-11-29 05:26:30', '2021-12-01 00:34:44'),
(2, NULL, 'HDFC', 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, '2021-11-30 04:10:33', '2021-12-03 05:01:15'),
(11, NULL, 'User', 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2021-12-01 00:05:03', '2021-12-01 00:05:51'),
(12, NULL, 'Admin', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2021-12-03 05:00:59', '2021-12-06 13:07:10'),
(13, NULL, 'TL', 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, '2021-12-03 05:01:39', '2021-12-03 05:01:39'),
(14, NULL, 'Developement', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2021-12-06 13:02:16', '2021-12-06 13:14:17'),
(15, NULL, 'Office Admin', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2021-12-06 13:02:33', '2021-12-06 13:02:33'),
(16, NULL, 'HR', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2021-12-06 13:02:39', '2021-12-06 13:02:39'),
(17, NULL, 'Accounts', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2021-12-06 13:02:47', '2021-12-06 13:02:47');

-- --------------------------------------------------------

--
-- Table structure for table `user_permission_list_old`
--

CREATE TABLE `user_permission_list_old` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `group_name` varchar(255) NOT NULL,
  `Designation` varchar(100) NOT NULL,
  `create_ticket_permission` int(11) NOT NULL,
  `manage_ticket_permission` int(11) NOT NULL,
  `create_customer_permission` int(11) NOT NULL,
  `customer_list_permission` int(11) NOT NULL,
  `knowledge_base_permission` int(11) NOT NULL,
  `email_permission` int(11) NOT NULL,
  `report_permission` int(11) NOT NULL,
  `process_permission` int(11) NOT NULL,
  `user_permission` int(11) NOT NULL,
  `access_permission` int(11) NOT NULL,
  `status_permission` int(11) NOT NULL,
  `category_permission` int(11) NOT NULL,
  `country_state_city_permission` int(11) NOT NULL,
  `product_permission` int(11) NOT NULL,
  `department_permission` int(11) NOT NULL,
  `rca_permission` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_permission_list_old`
--

INSERT INTO `user_permission_list_old` (`id`, `uid`, `group_name`, `Designation`, `create_ticket_permission`, `manage_ticket_permission`, `create_customer_permission`, `customer_list_permission`, `knowledge_base_permission`, `email_permission`, `report_permission`, `process_permission`, `user_permission`, `access_permission`, `status_permission`, `category_permission`, `country_state_city_permission`, `product_permission`, `department_permission`, `rca_permission`, `created_at`, `updated_at`) VALUES
(1, 2, 'HDFC', '', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2021-11-28 05:04:42', '2021-11-28 05:04:42'),
(2, 3, 'HDFC', '', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2021-11-28 05:04:42', '2021-11-28 05:04:42'),
(3, 2, 'support', '', 1, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2021-11-28 05:16:09', '2021-11-28 05:16:09'),
(4, 3, 'support', '', 1, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2021-11-28 05:16:09', '2021-11-28 05:16:09'),
(5, 6, 'support', '', 1, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2021-11-28 05:16:09', '2021-11-28 05:16:09'),
(6, 7, 'support', '', 1, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2021-11-28 05:16:09', '2021-11-28 05:16:09'),
(7, 8, 'support', '', 1, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2021-11-28 05:16:09', '2021-11-28 05:16:09'),
(8, 9, 'support', '', 1, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2021-11-28 05:16:09', '2021-11-28 05:16:09'),
(9, 19, 'support', '', 1, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2021-11-28 05:16:09', '2021-11-28 05:16:09');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `calendar_tbl`
--
ALTER TABLE `calendar_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `color_code`
--
ALTER TABLE `color_code`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `create_level`
--
ALTER TABLE `create_level`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `level_name` (`level_name`);

--
-- Indexes for table `degination`
--
ALTER TABLE `degination`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `id_2` (`id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dispostion`
--
ALTER TABLE `dispostion`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `document_ticket`
--
ALTER TABLE `document_ticket`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `login_chat`
--
ALTER TABLE `login_chat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `process_category`
--
ALTER TABLE `process_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `process_customer`
--
ALTER TABLE `process_customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `process_email`
--
ALTER TABLE `process_email`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `process_email2`
--
ALTER TABLE `process_email2`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `process_email_cc`
--
ALTER TABLE `process_email_cc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `process_email_send`
--
ALTER TABLE `process_email_send`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `process_knowledge_base`
--
ALTER TABLE `process_knowledge_base`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `process_list`
--
ALTER TABLE `process_list`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Process_name` (`process_name`);

--
-- Indexes for table `process_log`
--
ALTER TABLE `process_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `process_product`
--
ALTER TABLE `process_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `process_rca`
--
ALTER TABLE `process_rca`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `process_source`
--
ALTER TABLE `process_source`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `process_subcategory`
--
ALTER TABLE `process_subcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `process_task`
--
ALTER TABLE `process_task`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `process_ticket`
--
ALTER TABLE `process_ticket`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `strick_note`
--
ALTER TABLE `strick_note`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suggestion`
--
ALTER TABLE `suggestion`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suggestion_comment`
--
ALTER TABLE `suggestion_comment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_field_list`
--
ALTER TABLE `table_field_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_field_list_old`
--
ALTER TABLE `table_field_list_old`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users123`
--
ALTER TABLE `users123`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_old`
--
ALTER TABLE `users_old`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_email` (`email`);

--
-- Indexes for table `users_permission`
--
ALTER TABLE `users_permission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_role`
--
ALTER TABLE `users_role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_history`
--
ALTER TABLE `user_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_permission_list`
--
ALTER TABLE `user_permission_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_permission_list_12345`
--
ALTER TABLE `user_permission_list_12345`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_permission_list_old`
--
ALTER TABLE `user_permission_list_old`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `calendar_tbl`
--
ALTER TABLE `calendar_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=265;

--
-- AUTO_INCREMENT for table `chat_messages`
--
ALTER TABLE `chat_messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `color_code`
--
ALTER TABLE `color_code`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `create_level`
--
ALTER TABLE `create_level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `degination`
--
ALTER TABLE `degination`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `dispostion`
--
ALTER TABLE `dispostion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `document_ticket`
--
ALTER TABLE `document_ticket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `login_chat`
--
ALTER TABLE `login_chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `process_category`
--
ALTER TABLE `process_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `process_customer`
--
ALTER TABLE `process_customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `process_email`
--
ALTER TABLE `process_email`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `process_email2`
--
ALTER TABLE `process_email2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `process_email_send`
--
ALTER TABLE `process_email_send`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `process_knowledge_base`
--
ALTER TABLE `process_knowledge_base`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `process_list`
--
ALTER TABLE `process_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `process_log`
--
ALTER TABLE `process_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `process_product`
--
ALTER TABLE `process_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `process_rca`
--
ALTER TABLE `process_rca`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `process_subcategory`
--
ALTER TABLE `process_subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `process_task`
--
ALTER TABLE `process_task`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `process_ticket`
--
ALTER TABLE `process_ticket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `strick_note`
--
ALTER TABLE `strick_note`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `suggestion`
--
ALTER TABLE `suggestion`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `suggestion_comment`
--
ALTER TABLE `suggestion_comment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `table_field_list`
--
ALTER TABLE `table_field_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=520;

--
-- AUTO_INCREMENT for table `table_field_list_old`
--
ALTER TABLE `table_field_list_old`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=501;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `users123`
--
ALTER TABLE `users123`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `users_old`
--
ALTER TABLE `users_old`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `users_permission`
--
ALTER TABLE `users_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users_role`
--
ALTER TABLE `users_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `user_history`
--
ALTER TABLE `user_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=948;

--
-- AUTO_INCREMENT for table `user_permission_list`
--
ALTER TABLE `user_permission_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user_permission_list_12345`
--
ALTER TABLE `user_permission_list_12345`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `user_permission_list_old`
--
ALTER TABLE `user_permission_list_old`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
