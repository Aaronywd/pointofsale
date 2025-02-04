-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 15, 2025 at 12:10 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pointofsale`
--

-- --------------------------------------------------------

--
-- Table structure for table `cashflow`
--

CREATE TABLE `cashflow` (
  `transaction_id` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `amount` decimal(18,2) DEFAULT NULL,
  `username` varchar(30) DEFAULT NULL,
  `transaction_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `cashflow`
--

INSERT INTO `cashflow` (`transaction_id`, `description`, `amount`, `username`, `transaction_date`) VALUES
(1, 'Cash-in', 10000.00, 'admin', '2019-04-08 15:51:58'),
(2, 'cash-out', 10.00, 'admin', '2025-01-11 12:03:08'),
(3, 'Cash-in', 20.00, 'user', '2025-01-13 13:44:59');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(30) DEFAULT NULL,
  `lastname` varchar(30) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `contact_number` varchar(30) DEFAULT NULL,
  `image` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `firstname`, `lastname`, `address`, `contact_number`, `image`) VALUES
(16, 'jersel', 'Bill', 'Philippines', '+63(09)1234-1234', 'user.png');

-- --------------------------------------------------------

--
-- Table structure for table `delivery`
--

CREATE TABLE `delivery` (
  `transaction_no` varchar(20) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `delivery`
--

INSERT INTO `delivery` (`transaction_no`, `supplier_id`, `username`, `date`) VALUES
('5CAAFDA8CD697', 21, 'admin', '2019-04-08 15:52:40'),
('5CAAFDEEDB333', 22, 'admin', '2019-04-08 15:54:19'),
('5CAAFE37D21E8', 21, 'admin', '2019-04-08 15:55:28'),
('5E7F00084C934', 22, 'admin', '2020-03-28 15:43:22'),
('5E81DF2B7B8F7', 22, 'admin', '2020-03-30 20:00:48'),
('6781F031405CF', 21, 'admin', '2025-01-11 12:16:02'),
('67852C677496C', 21, 'aaron', '2025-01-13 23:09:35'),
('67863D96891AA', 21, 'eric', '2025-01-14 18:34:44'),
('67863DC415262', 21, 'eric', '2025-01-14 18:35:08');

-- --------------------------------------------------------

--
-- Table structure for table `initial_products`
--

CREATE TABLE `initial_products` (
  `id` varchar(50) NOT NULL,
  `initial_quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `initial_products`
--

INSERT INTO `initial_products` (`id`, `initial_quantity`) VALUES
('1001', 100),
('10011', 200),
('10012', 100),
('1', 100),
('2', 200),
('3', 150),
('4', 125),
('5', 100),
('23213', 23),
('10000', 21),
('sdf', 2),
('1234', 100),
('3182398', -1);

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `purpose` varchar(30) NOT NULL,
  `logs_time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`id`, `username`, `purpose`, `logs_time`) VALUES
(851, 'admin', 'User admin login', '2019-04-08 15:48:04'),
(854, 'admin', 'User admin logout', '2019-04-08 15:49:48'),
(855, 'admin', 'User admin login', '2019-04-08 15:50:04'),
(856, 'admin', 'Supplier OrangeCompany added', '2019-04-08 15:50:54'),
(857, 'admin', 'Customer jersel Added', '2019-04-08 15:51:25'),
(858, 'admin', 'Cash-in', '2019-04-08 15:51:58'),
(859, 'admin', 'Delivery Added', '2019-04-08 15:52:40'),
(860, 'admin', 'Customer Bill Added', '2019-04-08 15:53:18'),
(861, 'admin', 'Delivery Added', '2019-04-08 15:54:19'),
(862, 'admin', 'Delivery Added', '2019-04-08 15:55:29'),
(863, 'admin', 'Product sold', '2019-04-08 15:56:39'),
(864, 'admin', 'User admin logout', '2019-04-08 15:57:38'),
(865, 'admin', 'User admin login', '2019-04-08 16:06:54'),
(866, 'admin', 'User admin login', '2019-04-08 20:28:36'),
(867, 'admin', 'Product sold', '2019-04-08 20:29:27'),
(868, 'admin', 'User admin login', '2020-03-23 16:04:06'),
(869, 'admin', 'User admin logout', '2020-03-23 16:04:24'),
(870, 'admin', 'User admin login', '2020-03-28 12:58:34'),
(871, 'admin', 'User admin logout', '2020-03-28 13:02:20'),
(872, 'admin', 'User admin login', '2020-03-28 13:02:26'),
(873, 'admin', 'User admin logout', '2020-03-28 13:02:59'),
(874, 'admin', 'User admin login', '2020-03-28 13:05:48'),
(875, 'admin', 'Product sold', '2020-03-28 14:06:26'),
(876, 'admin', 'Product sold', '2020-03-28 14:07:27'),
(877, 'admin', 'Product sold', '2020-03-28 14:08:09'),
(878, 'admin', 'Product sold', '2020-03-28 14:14:46'),
(879, 'admin', 'Product sold', '2020-03-28 14:22:55'),
(880, 'admin', 'Product sold', '2020-03-28 14:27:51'),
(881, 'admin', 'Delivery Added', '2020-03-28 15:43:22'),
(882, 'admin', 'Product sold', '2020-03-28 16:14:30'),
(883, 'admin', 'User admin login', '2020-03-29 09:26:29'),
(884, 'admin', 'User admin login', '2020-03-29 09:40:46'),
(885, 'admin', 'Product Coffee updated', '2020-03-29 09:53:36'),
(886, 'admin', 'Product Coffee updated', '2020-03-29 09:53:51'),
(887, 'admin', 'User admin login', '2020-03-30 09:05:52'),
(888, 'admin', 'Product sold', '2020-03-30 09:07:10'),
(889, 'admin', 'User admin login', '2020-03-30 19:59:24'),
(890, 'admin', 'Delivery Added', '2020-03-30 20:00:48'),
(891, 'admin', 'User admin login', '2020-03-30 22:26:03'),
(892, 'user', 'User user login', '2025-01-11 11:34:27'),
(893, 'user', 'User user logout', '2025-01-11 11:42:37'),
(894, 'admin', 'User admin login', '2025-01-11 11:42:42'),
(895, 'admin', 'User admin logout', '2025-01-11 11:42:47'),
(896, 'user', 'User user login', '2025-01-11 11:42:53'),
(897, 'user', 'User user logout', '2025-01-11 11:44:18'),
(898, 'admin', 'User admin login', '2025-01-11 11:44:24'),
(899, 'admin', 'User admin logout', '2025-01-11 11:44:52'),
(900, 'user', 'User user login', '2025-01-11 11:44:57'),
(901, 'user', 'User user logout', '2025-01-11 11:49:43'),
(902, 'admin', 'User admin login', '2025-01-11 11:49:50'),
(903, 'admin', 'Product sold', '2025-01-11 11:50:39'),
(904, 'admin', 'User admin logout', '2025-01-11 11:52:02'),
(905, 'user', 'User user login', '2025-01-11 11:58:17'),
(906, 'user', 'User user logout', '2025-01-11 12:00:27'),
(907, 'admin', 'User admin login', '2025-01-11 12:00:36'),
(908, 'admin', 'cash-out', '2025-01-11 12:03:08'),
(909, 'admin', 'Product Coffee updated', '2025-01-11 12:05:40'),
(911, 'admin', 'Delivery Added', '2025-01-11 12:16:02'),
(912, 'admin', 'User admin logout', '2025-01-11 12:17:17'),
(913, 'user', 'User user login', '2025-01-11 12:49:14'),
(914, 'user', 'User user logout', '2025-01-11 12:49:22'),
(915, 'admin', 'User admin login', '2025-01-11 12:49:28'),
(916, 'admin', 'User admin logout', '2025-01-11 13:00:07'),
(917, 'user', 'User user login', '2025-01-11 13:00:14'),
(918, 'admin', 'User admin login', '2025-01-11 13:37:24'),
(919, 'admin', 'User admin logout', '2025-01-11 14:00:43'),
(920, 'user', 'User user login', '2025-01-11 14:00:54'),
(921, 'user', 'User user logout', '2025-01-11 14:07:24'),
(922, 'admin', 'User admin login', '2025-01-11 14:07:31'),
(923, 'user', 'User user login', '2025-01-11 14:41:34'),
(924, 'user', 'User user logout', '2025-01-11 14:41:46'),
(925, 'admin', 'User admin login', '2025-01-11 14:41:50'),
(926, 'admin', 'User admin logout', '2025-01-11 14:44:25'),
(927, 'user', 'User user login', '2025-01-11 14:44:43'),
(928, 'user', 'User user logout', '2025-01-11 14:44:59'),
(929, 'user', 'User user login', '2025-01-11 14:50:44'),
(930, 'user', 'User user logout', '2025-01-11 17:05:19'),
(931, 'user', 'User user login', '2025-01-11 17:05:35'),
(932, 'user', 'User user logout', '2025-01-11 17:08:04'),
(933, 'admin', 'User admin login', '2025-01-11 17:08:12'),
(934, 'admin', 'User admin logout', '2025-01-11 17:08:52'),
(935, 'user', 'User user login', '2025-01-11 17:08:58'),
(936, 'admin', 'User admin login', '2025-01-11 17:10:42'),
(937, 'admin', 'User admin logout', '2025-01-11 17:11:05'),
(938, 'admin', 'User admin login', '2025-01-11 17:13:08'),
(939, 'admin', 'User admin logout', '2025-01-11 17:13:43'),
(940, 'user', 'User user login', '2025-01-11 17:13:50'),
(941, 'user', 'User user logout', '2025-01-11 17:14:09'),
(942, 'admin', 'User admin login', '2025-01-11 17:16:56'),
(943, 'admin', 'User admin logout', '2025-01-11 17:17:04'),
(944, 'user', 'User user login', '2025-01-11 17:17:14'),
(945, 'user', 'User user logout', '2025-01-11 17:17:32'),
(946, 'admin', 'User admin login', '2025-01-11 17:21:30'),
(947, 'admin', 'Product Coffee updated', '2025-01-11 17:21:50'),
(948, 'admin', 'User admin logout', '2025-01-11 17:23:04'),
(949, 'user', 'User user login', '2025-01-11 17:23:11'),
(950, 'user', 'User user logout', '2025-01-11 17:23:29'),
(951, 'admin', 'User admin login', '2025-01-11 17:27:28'),
(952, 'admin', 'User admin logout', '2025-01-11 17:29:03'),
(953, 'user', 'User user login', '2025-01-11 17:29:10'),
(954, 'user', 'User user logout', '2025-01-11 17:29:35'),
(955, 'admin', 'User admin login', '2025-01-11 17:29:39'),
(956, 'admin', 'User admin logout', '2025-01-11 17:34:13'),
(957, 'user', 'User user login', '2025-01-11 17:34:20'),
(958, 'user', 'User user logout', '2025-01-11 17:57:51'),
(959, 'user', 'User user login', '2025-01-11 17:59:59'),
(960, 'user', 'User user logout', '2025-01-11 18:00:40'),
(961, 'user', 'User user login', '2025-01-11 20:46:02'),
(962, 'user', 'User user logout', '2025-01-11 20:46:10'),
(963, 'admin', 'User admin login', '2025-01-11 20:46:18'),
(964, 'admin', 'User admin login', '2025-01-11 21:29:55'),
(965, 'admin', 'User admin logout', '2025-01-11 21:30:11'),
(966, 'admin', 'User admin login', '2025-01-11 21:32:23'),
(967, 'admin', 'User admin logout', '2025-01-11 21:33:21'),
(968, 'user', 'User user login', '2025-01-11 21:33:27'),
(969, 'user', 'User user logout', '2025-01-11 21:34:09'),
(970, 'admin', 'User admin login', '2025-01-11 21:34:14'),
(971, 'admin', 'User admin logout', '2025-01-11 21:35:15'),
(972, 'user', 'User user login', '2025-01-11 21:38:46'),
(973, 'user', 'User user logout', '2025-01-11 21:39:29'),
(974, 'admin', 'User admin login', '2025-01-11 21:39:33'),
(975, 'admin', 'User admin logout', '2025-01-11 21:39:59'),
(976, 'user', 'User user login', '2025-01-11 21:40:14'),
(977, 'user', 'User user logout', '2025-01-11 21:40:34'),
(978, 'admin', 'User admin login', '2025-01-11 21:43:11'),
(979, 'admin', 'User admin logout', '2025-01-11 21:45:10'),
(980, 'user', 'User user login', '2025-01-11 21:47:19'),
(981, 'user', 'User Chris updated', '2025-01-11 22:16:42'),
(982, 'user', 'User user logout', '2025-01-11 22:17:04'),
(983, 'user', 'User user login', '2025-01-11 22:27:59'),
(984, 'user', 'User user login', '2025-01-11 22:32:48'),
(985, 'user', 'User user login', '2025-01-11 22:33:36'),
(986, 'user', 'User user logout', '2025-01-11 22:33:53'),
(987, 'admin', 'User admin login', '2025-01-12 17:06:29'),
(988, 'admin', 'User admin logout', '2025-01-12 17:06:40'),
(989, 'admin', 'User admin login', '2025-01-12 17:08:12'),
(990, 'admin', 'User admin logout', '2025-01-12 17:08:16'),
(991, 'user', 'User user login', '2025-01-12 17:08:23'),
(992, 'user', 'User user logout', '2025-01-12 17:14:19'),
(993, 'admin', 'User admin login', '2025-01-12 17:14:22'),
(994, 'admin', 'User admin logout', '2025-01-12 17:22:00'),
(995, 'user', 'User user login', '2025-01-12 17:22:11'),
(996, 'user', 'User user logout', '2025-01-12 17:24:53'),
(997, 'user', 'User user login', '2025-01-12 17:25:20'),
(998, 'user', 'User user logout', '2025-01-12 17:25:37'),
(999, 'admin', 'User admin login', '2025-01-12 17:25:47'),
(1000, 'admin', 'User admin logout', '2025-01-12 17:29:49'),
(1001, 'user', 'User user login', '2025-01-12 17:29:53'),
(1002, 'user', 'User user logout', '2025-01-12 17:32:02'),
(1003, 'admin', 'User admin login', '2025-01-12 17:32:05'),
(1004, 'admin', 'User admin logout', '2025-01-12 17:36:36'),
(1005, 'user', 'User user login', '2025-01-12 17:36:41'),
(1006, 'user', 'User user logout', '2025-01-12 17:37:35'),
(1007, 'admin', 'User admin login', '2025-01-12 17:37:39'),
(1008, 'admin', 'User admin logout', '2025-01-12 17:55:40'),
(1009, 'user', 'User user login', '2025-01-12 17:55:46'),
(1010, 'user', 'User user logout', '2025-01-12 18:15:08'),
(1011, 'user', 'User user login', '2025-01-12 18:15:15'),
(1012, 'user', 'User user logout', '2025-01-12 18:15:19'),
(1013, 'admin', 'User admin login', '2025-01-12 18:15:24'),
(1014, 'admin', 'User admin login', '2025-01-12 21:04:32'),
(1015, 'user', 'User user login', '2025-01-12 21:04:45'),
(1016, 'admin', 'User admin login', '2025-01-12 21:13:33'),
(1017, 'admin', 'User admin login', '2025-01-12 21:18:23'),
(1018, 'admin', 'User admin login', '2025-01-12 21:19:10'),
(1019, 'admin', 'User admin logout', '2025-01-12 21:19:13'),
(1020, 'admin', 'User admin login', '2025-01-12 21:19:22'),
(1021, 'admin', 'User admin login', '2025-01-12 21:19:59'),
(1022, 'admin', 'User admin login', '2025-01-12 21:20:19'),
(1023, 'admin', 'User admin logout', '2025-01-12 21:20:21'),
(1024, 'admin', 'User admin login', '2025-01-12 21:21:31'),
(1025, 'admin', 'User admin logout', '2025-01-12 21:26:18'),
(1026, 'user', 'User user login', '2025-01-12 21:29:46'),
(1027, 'user', 'Product sold', '2025-01-12 21:30:47'),
(1028, 'user', 'User user logout', '2025-01-12 21:31:46'),
(1029, 'admin', 'User admin login', '2025-01-12 21:34:44'),
(1030, 'admin', 'User admin logout', '2025-01-12 21:37:19'),
(1031, 'user', 'User user login', '2025-01-12 21:37:25'),
(1032, 'user', 'User user login', '2025-01-12 21:40:15'),
(1033, 'user', 'User user logout', '2025-01-12 21:40:45'),
(1034, 'admin', 'User admin login', '2025-01-12 21:41:05'),
(1035, 'admin', 'User admin logout', '2025-01-12 21:45:47'),
(1036, 'user', 'User user login', '2025-01-12 21:45:52'),
(1037, 'user', 'User user logout', '2025-01-12 21:49:15'),
(1038, 'user', 'User user login', '2025-01-12 21:54:41'),
(1039, 'user', 'User user logout', '2025-01-12 21:57:46'),
(1040, 'admin', 'User admin login', '2025-01-12 21:57:49'),
(1041, 'admin', 'Product sold', '2025-01-12 22:04:57'),
(1042, 'admin', 'User admin logout', '2025-01-12 22:05:25'),
(1043, 'user', 'User user login', '2025-01-12 22:05:30'),
(1044, 'user', 'User user logout', '2025-01-12 22:10:32'),
(1045, 'admin', 'User admin login', '2025-01-12 22:10:35'),
(1046, 'admin', 'User admin logout', '2025-01-12 22:12:58'),
(1047, 'admin', 'User admin login', '2025-01-12 22:24:19'),
(1048, 'admin', 'User admin logout', '2025-01-12 22:24:23'),
(1049, 'user', 'User user login', '2025-01-12 22:24:29'),
(1050, 'user', 'User user logout', '2025-01-12 22:29:36'),
(1051, 'admin', 'User admin login', '2025-01-12 22:29:41'),
(1052, 'admin', 'User admin logout', '2025-01-12 22:31:18'),
(1053, 'user', 'User user login', '2025-01-12 22:31:24'),
(1054, 'admin', 'User admin login', '2025-01-13 11:42:38'),
(1055, 'admin', 'User admin logout', '2025-01-13 11:43:03'),
(1056, 'user', 'User user login', '2025-01-13 11:43:08'),
(1057, 'user', 'User user logout', '2025-01-13 11:43:29'),
(1058, 'admin', 'User admin login', '2025-01-13 12:42:07'),
(1059, 'admin', 'Product chicken fried updated', '2025-01-13 12:43:21'),
(1060, 'admin', 'User admin logout', '2025-01-13 13:40:12'),
(1061, 'admin', 'User admin login', '2025-01-13 13:40:24'),
(1062, 'admin', 'User admin logout', '2025-01-13 13:42:05'),
(1063, 'user', 'User user login', '2025-01-13 13:42:10'),
(1064, 'user', 'User user logout', '2025-01-13 13:42:21'),
(1065, 'user', 'User user login', '2025-01-13 13:43:52'),
(1066, 'user', 'User user logout', '2025-01-13 13:44:06'),
(1067, 'admin', 'User admin login', '2025-01-13 13:44:10'),
(1068, 'admin', 'User admin logout', '2025-01-13 13:44:39'),
(1069, 'user', 'User user login', '2025-01-13 13:44:47'),
(1070, 'user', 'Cash-in', '2025-01-13 13:44:59'),
(1071, 'admin', 'User admin login', '2025-01-13 14:23:56'),
(1072, 'admin', 'User admin login', '2025-01-13 15:10:01'),
(1073, 'admin', 'User admin logout', '2025-01-13 15:10:04'),
(1074, 'user', 'User user login', '2025-01-13 15:10:35'),
(1075, 'user', 'User user login', '2025-01-13 15:10:51'),
(1076, 'user', 'User user logout', '2025-01-13 15:11:29'),
(1077, 'admin', 'User admin login', '2025-01-13 15:16:07'),
(1078, 'admin', 'User admin logout', '2025-01-13 15:16:18'),
(1079, 'user', 'User user login', '2025-01-13 15:16:23'),
(1080, 'user', 'User user logout', '2025-01-13 15:16:34'),
(1081, 'user', 'User user login', '2025-01-13 15:16:47'),
(1082, 'user', 'User user logout', '2025-01-13 15:18:08'),
(1083, 'user', 'User user login', '2025-01-13 15:20:03'),
(1084, 'user', 'User Chris updated', '2025-01-13 15:20:33'),
(1085, 'user', 'User Chris updated', '2025-01-13 15:20:36'),
(1086, 'user', 'User Chris updated', '2025-01-13 15:20:42'),
(1087, 'user', 'User user logout', '2025-01-13 15:22:50'),
(1088, 'admin', 'User admin login', '2025-01-13 15:22:54'),
(1089, 'admin', 'User admin login', '2025-01-13 15:23:40'),
(1090, 'admin', 'Sale completed with receipt #3', '2025-01-13 16:00:53'),
(1091, 'admin', 'User admin logout', '2025-01-13 16:00:59'),
(1092, 'user', 'User user login', '2025-01-13 16:01:04'),
(1093, 'user', 'Sale completed with receipt #3', '2025-01-13 16:01:22'),
(1094, 'user', 'User user logout', '2025-01-13 16:03:24'),
(1095, 'user', 'User user login', '2025-01-13 16:03:29'),
(1096, 'user', 'Sale completed with receipt #4', '2025-01-13 16:03:48'),
(1097, 'user', 'Sale completed with receipt #4', '2025-01-13 16:04:10'),
(1098, 'user', 'User user logout', '2025-01-13 16:04:16'),
(1099, 'user', 'User user login', '2025-01-13 16:04:21'),
(1100, 'user', 'Sale completed with receipt #4', '2025-01-13 16:04:40'),
(1101, 'user', 'Sale completed with receipt #4', '2025-01-13 16:07:09'),
(1102, 'user', 'User user logout', '2025-01-13 16:07:12'),
(1103, 'user', 'User user login', '2025-01-13 16:07:16'),
(1104, 'user', 'Sale completed with receipt #4', '2025-01-13 16:07:33'),
(1105, 'user', 'Sale completed with receipt #4', '2025-01-13 16:09:41'),
(1106, 'user', 'Sale completed with receipt #4', '2025-01-13 16:09:50'),
(1107, 'user', 'Sale completed with receipt #4', '2025-01-13 16:10:58'),
(1108, 'user', 'Sale completed with receipt #4', '2025-01-13 16:11:11'),
(1109, 'user', 'Sale completed with receipt #4', '2025-01-13 16:13:05'),
(1110, 'user', 'User user logout', '2025-01-13 16:13:10'),
(1111, 'user', 'User user login', '2025-01-13 16:13:17'),
(1112, 'user', 'Sale completed with receipt #5', '2025-01-13 16:13:37'),
(1113, 'user', 'Sale completed with receipt #5', '2025-01-13 16:42:40'),
(1114, 'admin', 'User admin login', '2025-01-13 17:37:46'),
(1115, 'admin', 'User admin login', '2025-01-13 20:09:35'),
(1116, 'admin', 'User admin login', '2025-01-13 20:11:25'),
(1117, 'admin', 'Sale completed with receipt #5', '2025-01-13 20:11:48'),
(1118, 'admin', 'Sale completed with receipt #5', '2025-01-13 20:12:12'),
(1119, 'admin', 'Sale completed with receipt #5', '2025-01-13 20:13:43'),
(1120, 'admin', 'User admin logout', '2025-01-13 20:13:48'),
(1121, 'user', 'User user login', '2025-01-13 20:14:05'),
(1122, 'user', 'User user logout', '2025-01-13 20:14:08'),
(1123, 'admin', 'User admin login', '2025-01-13 20:14:15'),
(1124, 'admin', 'User admin login', '2025-01-13 20:14:27'),
(1125, 'admin', 'User admin login', '2025-01-13 20:17:26'),
(1126, 'admin', 'User admin login', '2025-01-13 20:18:30'),
(1127, 'admin', 'User admin login', '2025-01-13 20:19:08'),
(1128, 'admin', 'User admin login', '2025-01-13 20:21:01'),
(1129, 'admin', 'User admin login', '2025-01-13 20:21:33'),
(1130, 'admin', 'User admin login', '2025-01-13 20:21:40'),
(1131, 'admin', 'User admin login', '2025-01-13 20:22:27'),
(1132, 'admin', 'User admin login', '2025-01-13 20:23:23'),
(1133, 'admin', 'User admin login', '2025-01-13 20:30:38'),
(1134, 'admin', 'User admin logout', '2025-01-13 20:30:42'),
(1135, 'user', 'User user login', '2025-01-13 20:34:52'),
(1136, 'user', 'User user logout', '2025-01-13 20:34:58'),
(1137, 'admin', 'User admin login', '2025-01-13 20:35:56'),
(1138, 'admin', 'User admin logout', '2025-01-13 20:36:16'),
(1139, 'admin', 'User admin login', '2025-01-13 20:38:16'),
(1140, 'admin', 'User admin logout', '2025-01-13 20:42:48'),
(1141, 'user', 'User user login', '2025-01-13 20:42:53'),
(1142, 'user', 'User user logout', '2025-01-13 20:42:57'),
(1143, 'admin', 'User admin login', '2025-01-13 20:48:32'),
(1144, 'admin', 'User aaron added', '2025-01-13 21:04:29'),
(1145, 'admin', 'User chee added', '2025-01-13 21:06:58'),
(1146, 'admin', 'User admin logout', '2025-01-13 21:09:16'),
(1147, 'chee', 'User chee login', '2025-01-13 21:11:20'),
(1148, 'chee', 'User chee logout', '2025-01-13 21:11:31'),
(1149, 'chee', 'User chee login', '2025-01-13 22:27:36'),
(1150, 'chee', 'User chee login', '2025-01-13 22:28:33'),
(1151, 'chee', 'User chee login', '2025-01-13 22:33:02'),
(1152, 'chee', 'Product sold', '2025-01-13 22:49:00'),
(1153, 'chee', 'User chee logout', '2025-01-13 22:54:12'),
(1154, 'aaron', 'Admin login', '2025-01-13 22:55:28'),
(1155, 'aaron', 'Admin login', '2025-01-13 22:56:59'),
(1156, 'aaron', 'User aaron logout', '2025-01-13 22:57:21'),
(1157, 'chee', 'User login', '2025-01-13 22:57:29'),
(1158, 'chee', 'User chee logout', '2025-01-13 22:57:33'),
(1159, 'aaron', 'Admin login', '2025-01-13 23:01:41'),
(1160, 'aaron', 'Delivery Added', '2025-01-13 23:09:35'),
(1161, 'aaron', 'Product sold', '2025-01-13 23:18:12'),
(1162, 'aaron', 'User aaron logout', '2025-01-13 23:23:40'),
(1163, 'chee', 'User login', '2025-01-13 23:23:48'),
(1164, 'chee', 'User chee logout', '2025-01-13 23:27:09'),
(1165, 'aaron', 'Admin login', '2025-01-13 23:27:56'),
(1166, 'aaron', 'User aaron logout', '2025-01-13 23:31:59'),
(1167, 'chee', 'User login', '2025-01-13 23:32:07'),
(1168, 'chee', 'User chee logout', '2025-01-13 23:34:08'),
(1169, 'chee', 'User login', '2025-01-13 23:36:12'),
(1170, 'chee', 'User login', '2025-01-13 23:39:11'),
(1171, 'chee', 'User chee logout', '2025-01-13 23:39:15'),
(1172, 'aaron', 'Admin login', '2025-01-13 23:39:23'),
(1173, 'aaron', 'User aaron logout', '2025-01-13 23:39:29'),
(1174, 'chee', 'User login', '2025-01-13 23:39:37'),
(1175, 'chee', 'User chee logout', '2025-01-13 23:43:40'),
(1176, 'chee', 'User login', '2025-01-13 23:43:49'),
(1177, 'chee', 'User chee logout', '2025-01-13 23:46:03'),
(1178, 'chee', 'User login', '2025-01-13 23:46:23'),
(1179, 'chee', 'User chee logout', '2025-01-13 23:52:15'),
(1180, 'aaron', 'Admin login', '2025-01-13 23:52:25'),
(1181, 'aaron', 'User aaron logout', '2025-01-13 23:58:03'),
(1182, 'aaron', 'Admin login', '2025-01-13 23:58:10'),
(1183, 'aaron', 'User aaron logout', '2025-01-14 00:00:22'),
(1184, 'chee', 'User login', '2025-01-14 00:00:59'),
(1185, 'aaron', 'Admin login', '2025-01-14 07:52:43'),
(1186, 'aaron', 'User aaron logout', '2025-01-14 07:54:37'),
(1187, 'aaron', 'Admin login', '2025-01-14 08:05:00'),
(1188, 'aaron', 'User aaron logout', '2025-01-14 08:05:33'),
(1189, 'chee', 'User login', '2025-01-14 08:05:40'),
(1190, 'chee', 'User chee logout', '2025-01-14 09:12:19'),
(1191, 'aaron', 'Admin login', '2025-01-14 09:14:57'),
(1192, 'chee', 'User login', '2025-01-14 09:15:05'),
(1193, 'chee', 'User chee logout', '2025-01-14 09:15:09'),
(1194, 'aaron', 'Admin login', '2025-01-14 09:30:46'),
(1195, 'aaron', 'User aaron logout', '2025-01-14 09:30:49'),
(1196, 'chee', 'User login', '2025-01-14 09:30:58'),
(1197, 'chee', 'User chee logout', '2025-01-14 09:31:01'),
(1198, 'aaron', 'Admin login', '2025-01-14 09:33:58'),
(1199, 'aaron', 'Supplier chickenfactory added', '2025-01-14 09:50:11'),
(1200, 'aaron', 'Admin login', '2025-01-14 09:50:51'),
(1201, 'aaron', 'Admin login', '2025-01-14 10:03:46'),
(1202, 'aaron', 'User aaron updated', '2025-01-14 10:03:56'),
(1203, 'aaron', 'Product Coffee updated', '2025-01-14 10:04:30'),
(1204, 'aaron', 'User aaron logout', '2025-01-14 10:16:19'),
(1205, 'aaron', 'Admin login', '2025-01-14 10:23:28'),
(1206, 'aaron', 'Product Pencil updated', '2025-01-14 10:25:08'),
(1207, 'aaron', 'User yong added', '2025-01-14 10:36:59'),
(1208, 'aaron', 'User aaron updated', '2025-01-14 10:41:59'),
(1209, 'aaron', 'User chee updated', '2025-01-14 10:44:04'),
(1210, 'aaron', 'User aaron logout', '2025-01-14 10:44:09'),
(1211, 'chee', 'User login', '2025-01-14 10:44:21'),
(1212, 'chee', 'User chee logout', '2025-01-14 10:45:09'),
(1213, 'chee', 'User login', '2025-01-14 10:47:20'),
(1214, 'chee', 'User chee updated', '2025-01-14 10:50:44'),
(1215, 'chee', 'User chee updated', '2025-01-14 10:50:51'),
(1216, 'chee', 'User chee logout', '2025-01-14 10:51:11'),
(1217, 'aaron', 'Admin login', '2025-01-14 10:51:20'),
(1218, 'aaron', 'Admin login', '2025-01-14 10:51:26'),
(1219, 'aaron', 'User aaron logout', '2025-01-14 11:02:30'),
(1220, 'aaron', 'Admin login', '2025-01-14 11:04:11'),
(1221, 'aaron', 'User aaron logout', '2025-01-14 11:04:29'),
(1222, 'eric', 'Admin login', '2025-01-14 11:10:05'),
(1223, 'eric', 'Admin login', '2025-01-14 11:13:07'),
(1224, 'eric', 'User eric logout', '2025-01-14 11:13:13'),
(1225, 'aaron', 'User chee updated', '2025-01-14 11:18:41'),
(1226, 'aaron', 'User chee updated', '2025-01-14 11:18:53'),
(1227, 'aaron', 'User aaron updated', '2025-01-14 11:19:04'),
(1228, 'aaron', 'User chee updated', '2025-01-14 11:19:12'),
(1229, 'aaron', 'User aaron logout', '2025-01-14 11:19:20'),
(1230, 'chee', 'User login', '2025-01-14 11:21:02'),
(1231, 'chee', 'User chee logout', '2025-01-14 11:21:05'),
(1232, 'aaron', 'Admin login', '2025-01-14 12:00:19'),
(1233, 'aaron', 'Admin login', '2025-01-14 12:51:33'),
(1234, 'aaron', 'User aaron updated', '2025-01-14 12:51:48'),
(1235, 'aaron', 'User aaron logout', '2025-01-14 12:53:08'),
(1236, 'aaron', 'Admin login', '2025-01-14 14:44:52'),
(1237, 'aaron', 'Admin login', '2025-01-14 14:57:26'),
(1238, 'aaron', 'User aaron logout', '2025-01-14 14:57:59'),
(1239, 'aaron', 'User aaron logout', '2025-01-14 17:14:47'),
(1240, 'aaron', 'Admin login', '2025-01-14 17:19:32'),
(1241, 'aaron', 'User aaron logout', '2025-01-14 17:22:59'),
(1242, 'eric', 'Admin login', '2025-01-14 17:40:40'),
(1243, 'eric', 'Product sold', '2025-01-14 17:43:25'),
(1244, 'eric', 'Product sold', '2025-01-14 17:44:44'),
(1245, 'eric', 'User eric logout', '2025-01-14 17:45:18'),
(1246, 'chee', 'User login', '2025-01-14 17:46:21'),
(1247, 'chee', 'Product sold', '2025-01-14 17:48:30'),
(1248, 'chee', 'User chee logout', '2025-01-14 17:48:45'),
(1249, 'eric', 'Admin login', '2025-01-14 18:30:50'),
(1250, 'eric', 'User yong updated', '2025-01-14 18:31:43'),
(1251, 'eric', 'Delivery Added', '2025-01-14 18:34:44'),
(1252, 'eric', 'Delivery Added', '2025-01-14 18:35:08'),
(1253, 'eric', 'User eric logout', '2025-01-14 18:37:36'),
(1254, 'chee', 'User login', '2025-01-14 18:37:59'),
(1255, 'chee', 'User Tschee updated', '2025-01-14 18:38:35'),
(1256, 'chee', 'Product sold', '2025-01-14 18:40:57'),
(1257, 'chee', 'User chee logout', '2025-01-14 18:41:53'),
(1258, 'eric', 'Admin login', '2025-01-14 18:42:22'),
(1259, 'eric', 'User eric logout', '2025-01-14 21:07:22'),
(1260, 'eric', 'Admin login', '2025-01-14 21:08:23'),
(1261, 'eric', 'User eric logout', '2025-01-14 21:08:26'),
(1262, 'eric', 'Admin login', '2025-01-14 21:09:37'),
(1263, 'chee', 'User login', '2025-01-14 21:11:54'),
(1264, 'chee', 'User chee logout', '2025-01-14 21:12:29'),
(1265, 'eric', 'Admin login', '2025-01-14 21:12:40'),
(1266, 'eric', 'User eric logout', '2025-01-14 21:12:56'),
(1267, 'chee ', 'User login', '2025-01-14 21:13:33'),
(1268, 'chee', 'Product sold', '2025-01-14 21:15:10'),
(1269, 'eric', 'Admin login', '2025-01-14 21:16:52'),
(1270, 'eric', 'Sale completed - Receipt #62 -', '2025-01-14 21:26:27'),
(1271, 'eric', 'Sale completed - Receipt #63 -', '2025-01-14 21:27:54'),
(1272, 'eric', 'Admin login', '2025-01-14 21:28:15'),
(1273, 'eric', 'Sale completed - Receipt #64 -', '2025-01-14 21:28:28'),
(1274, 'eric', 'Sale completed - Receipt #65 -', '2025-01-14 21:30:15'),
(1275, 'eric', 'Sold 1 Coffee to jersel Bill', '2025-01-14 21:34:00'),
(1276, 'eric', 'Sales completed - Receipt #66 ', '2025-01-14 21:34:00'),
(1277, 'eric', 'User eric logout', '2025-01-14 21:34:15'),
(1278, 'eric', 'Admin login', '2025-01-14 21:34:26'),
(1279, 'eric', 'User aaron updated', '2025-01-14 21:35:12'),
(1280, 'eric', 'Sold 1 chicken fried to jersel', '2025-01-14 21:40:44'),
(1281, 'eric', 'Sales completed - Receipt #67 ', '2025-01-14 21:40:44'),
(1282, 'eric', 'User eric logout', '2025-01-14 21:41:06'),
(1283, 'chee ', 'User login', '2025-01-14 21:53:26'),
(1284, 'chee', 'User login', '2025-01-14 21:56:40'),
(1285, 'chee', 'User login', '2025-01-14 21:58:24'),
(1286, 'chee', 'User chee logout', '2025-01-14 21:59:03'),
(1287, 'chee', 'User login', '2025-01-14 21:59:23'),
(1288, 'chee', 'User chee logout', '2025-01-14 22:00:44'),
(1289, 'eric', 'Admin login', '2025-01-14 22:01:04'),
(1290, 'eric', 'User eric logout', '2025-01-14 22:01:38'),
(1291, 'chee', 'User login', '2025-01-14 22:09:40'),
(1292, 'chee', 'User login', '2025-01-14 22:11:55'),
(1293, 'eric', 'Admin login', '2025-01-14 22:15:13'),
(1294, 'eric', 'User eric logout', '2025-01-14 22:18:14'),
(1295, 'chee', 'User login', '2025-01-14 22:18:24'),
(1296, 'chee', 'User chee logout', '2025-01-14 22:18:54'),
(1297, 'chee', 'User login', '2025-01-14 22:19:22'),
(1298, 'chee', 'User chee logout', '2025-01-14 22:19:39'),
(1299, 'eric', 'Admin login', '2025-01-14 22:21:35'),
(1300, 'eric', 'User eric logout', '2025-01-14 22:21:52'),
(1301, 'chee', 'User login', '2025-01-14 22:22:01'),
(1302, 'chee', 'User chee logout', '2025-01-14 22:42:07'),
(1303, 'chee', 'User login', '2025-01-14 22:45:47'),
(1304, 'chee', 'User chee logout', '2025-01-14 22:48:53'),
(1305, 'eric', 'Admin login', '2025-01-14 22:49:03'),
(1306, 'eric', 'User eric logout', '2025-01-14 22:49:23'),
(1307, 'chee', 'User login', '2025-01-14 22:49:33'),
(1308, 'chee', 'Sold 1 Coffee to jersel Bill', '2025-01-14 22:49:52'),
(1309, 'chee', 'Sales completed - Receipt #68 ', '2025-01-14 22:49:52'),
(1310, 'chee', 'User chee logout', '2025-01-14 22:50:13'),
(1311, 'eric', 'Admin login', '2025-01-14 22:50:25'),
(1312, 'eric', 'User eric logout', '2025-01-14 22:50:55'),
(1313, 'chee', 'User login', '2025-01-14 22:51:11'),
(1314, 'chee', 'User chee logout', '2025-01-14 22:52:36');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_no` varchar(50) NOT NULL,
  `product_name` varchar(30) DEFAULT NULL,
  `sell_price` decimal(18,2) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `unit` varchar(30) DEFAULT NULL,
  `min_stocks` int(11) DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `images` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_no`, `product_name`, `sell_price`, `quantity`, `unit`, `min_stocks`, `remarks`, `location`, `images`) VALUES
('1', 'Coffee', 12.00, 43, 'sachet', 20, 'from italy', 'italy', NULL),
('10000', 'chicken fried', 25.00, 4, 'KA', 29, 'nice', '62', NULL),
('1001', 'Glass', 22.00, 100, 'Box', 20, NULL, NULL, NULL),
('10011', 'Chair', 600.00, 97, 'Each', 20, NULL, NULL, NULL),
('10012', 'Sofa', 2400.00, 91, 'Each', 20, NULL, NULL, NULL),
('1234', 'sayur', 2.04, 100, 'bags', 2, 'freash', '32', NULL),
('2', 'Tooth Paste', 24.00, 200, 'sachet', 10, NULL, NULL, NULL),
('23213', 'Pencil', 42.24, 19, 'box', 23, 'stationary', 'china', NULL),
('3', 'Shampoo', 6.60, 146, 'sachet', 20, NULL, NULL, NULL),
('3182398', 'fish', 12.04, -1, '23', 12, '', '', NULL),
('4', 'Soap', 17.25, 122, 'sachet', 20, NULL, NULL, NULL),
('5', 'Conditioner', 12.00, 100, 'sachet', 10, NULL, NULL, NULL),
('sdf', 'fish', 12.04, -1, '23', 10, '', '', NULL);

--
-- Triggers `products`
--
DELIMITER $$
CREATE TRIGGER `delete` BEFORE DELETE ON `products` FOR EACH ROW DELETE FROM initial_products WHERE id=old.product_no
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert` AFTER INSERT ON `products` FOR EACH ROW INSERT INTO initial_products(id,initial_quantity) VALUES(new.product_no,new.quantity)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `product_delivered`
--

CREATE TABLE `product_delivered` (
  `transaction_no` varchar(30) NOT NULL,
  `product_id` varchar(30) NOT NULL,
  `total_qty` int(11) NOT NULL,
  `buy_price` decimal(18,2) NOT NULL,
  `tax_rate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `product_delivered`
--

INSERT INTO `product_delivered` (`transaction_no`, `product_id`, `total_qty`, `buy_price`, `tax_rate`) VALUES
('5CAAFDA8CD697', '1001', 100, 20.00, 10),
('5CAAFDEEDB333', '10011', 200, 500.00, 20),
('5CAAFDEEDB333', '10012', 100, 2000.00, 20),
('5CAAFE37D21E8', '1', 100, 10.00, 20),
('5CAAFE37D21E8', '2', 200, 20.00, 20),
('5CAAFE37D21E8', '3', 150, 6.00, 10),
('5CAAFE37D21E8', '4', 125, 15.00, 15),
('5CAAFE37D21E8', '5', 100, 10.00, 20),
('5E7F00084C934', '23213', 23, 32.00, 32),
('5E81DF2B7B8F7', '10000', 21, 21313.00, 20),
('6781F031405CF', 'sdf', 2, 10.38, 16),
('67852C677496C', '1234', 100, 2.00, 2),
('67863D96891AA', 'sdf', -1, 10.38, 16),
('67863DC415262', '3182398', -1, 10.38, 16);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `reciept_no` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT 0,
  `username` varchar(30) NOT NULL,
  `discount` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`reciept_no`, `customer_id`, `username`, `discount`, `total`, `date`) VALUES
(20, 16, 'admin', 0, 0, '2019-04-08 07:56:39'),
(21, 16, 'admin', 0, 0, '2019-04-08 12:29:27'),
(22, 16, 'admin', 0, 0, '2020-03-28 06:06:26'),
(23, 16, 'admin', 0, 0, '2020-03-28 06:07:27'),
(24, 16, 'admin', 0, 0, '2020-03-28 06:08:08'),
(25, 16, 'admin', 10, 0, '2020-03-28 06:14:46'),
(26, 16, 'admin', 10, 0, '2020-03-28 06:22:55'),
(27, 16, 'admin', 10, 2160, '2020-03-28 06:27:51'),
(28, 16, 'admin', 20, 1920, '2020-03-28 08:14:30'),
(29, 16, 'admin', 20, 4017, '2020-03-30 01:07:10'),
(30, 16, 'admin', 134, 51017, '2025-01-11 03:50:39'),
(31, 16, 'user', 0, 51151, '2025-01-12 09:30:44'),
(32, 16, 'user', 0, 51151, '2025-01-12 09:30:54'),
(33, 16, 'admin', 0, 36, '2025-01-12 09:32:22'),
(34, 16, 'admin', 0, 25576, '2025-01-12 09:36:18'),
(35, 16, 'admin', 0, 51151, '2025-01-12 10:15:42'),
(36, 16, 'user', 2, 51149, '2025-01-12 13:30:47'),
(37, 16, 'admin', 2, 11, '2025-01-12 14:04:57'),
(38, 16, 'admin', 0, 12, '2025-01-13 08:00:53'),
(39, 16, 'user', 0, 12, '2025-01-13 08:01:22'),
(40, 16, 'user', 0, 600, '2025-01-13 08:03:48'),
(41, 16, 'user', 0, 12, '2025-01-13 08:04:10'),
(42, 16, 'user', 0, 12, '2025-01-13 08:04:40'),
(43, 16, 'user', 0, 12, '2025-01-13 08:07:09'),
(44, 16, 'user', 0, 12, '2025-01-13 08:07:33'),
(45, 16, 'user', 0, 12, '2025-01-13 08:09:41'),
(46, 16, 'user', 0, 12, '2025-01-13 08:09:50'),
(47, 16, 'user', 0, 12, '2025-01-13 08:10:58'),
(48, 16, 'user', 0, 12, '2025-01-13 08:11:11'),
(49, 16, 'user', 0, 12, '2025-01-13 08:13:05'),
(50, 16, 'user', 0, 12, '2025-01-13 08:13:37'),
(51, 16, 'user', 0, 2400, '2025-01-13 08:42:40'),
(52, 16, 'admin', 0, 12, '2025-01-13 12:11:48'),
(53, 16, 'admin', 0, 12, '2025-01-13 12:12:12'),
(54, 16, 'admin', 0, 12, '2025-01-13 12:13:43'),
(55, 16, 'chee', 0, 12, '2025-01-13 14:49:00'),
(56, 16, 'aaron', 0, 24, '2025-01-13 15:18:12'),
(57, 16, 'eric', 0, 125, '2025-01-14 09:43:25'),
(58, 16, 'eric', 28, -16, '2025-01-14 09:44:44'),
(59, 16, 'chee', 0, 12, '2025-01-14 09:48:30'),
(60, 16, 'chee', 60000, 0, '2025-01-14 10:40:57'),
(61, 16, 'chee', 0, 12, '2025-01-14 13:15:10'),
(62, 16, 'eric', 0, 12, '2025-01-14 13:26:27'),
(63, 16, 'eric', 0, 12, '2025-01-14 13:27:54'),
(64, 16, 'eric', 0, 12, '2025-01-14 13:28:28'),
(65, 16, 'eric', 0, 12, '2025-01-14 13:30:15'),
(66, 16, 'eric', 0, 12, '2025-01-14 13:34:00'),
(67, 16, 'eric', 0, 25, '2025-01-14 13:40:44'),
(68, 16, 'chee', 0, 12, '2025-01-14 14:49:52');

-- --------------------------------------------------------

--
-- Table structure for table `sales_product`
--

CREATE TABLE `sales_product` (
  `reciept_no` int(11) NOT NULL,
  `product_id` varchar(20) NOT NULL,
  `price` decimal(18,2) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `sales_product`
--

INSERT INTO `sales_product` (`reciept_no`, `product_id`, `price`, `qty`) VALUES
(20, '1', 12.00, 10),
(20, '10011', 600.00, 2),
(21, '1', 12.00, 20),
(22, '10012', 2400.00, 1),
(23, '3', 6.60, 2),
(24, '10012', 2400.00, 1),
(25, '10012', 2400.00, 1),
(26, '10012', 2400.00, 1),
(27, '10012', 2400.00, 1),
(28, '10012', 2400.00, 1),
(29, '10012', 2400.00, 2),
(29, '4', 17.25, 3),
(29, '23213', 42.24, 4),
(30, '10000', 25575.60, 2),
(36, '10000', 25575.60, 2),
(37, '3', 6.60, 2),
(38, '1', 12.00, 1),
(39, '1', 12.00, 1),
(40, '10011', 600.00, 1),
(41, '1', 12.00, 1),
(42, '1', 12.00, 1),
(43, '1', 12.00, 1),
(44, '1', 12.00, 1),
(45, '1', 12.00, 1),
(46, '1', 12.00, 1),
(47, '1', 12.00, 1),
(48, '1', 12.00, 1),
(49, '1', 12.00, 1),
(50, '1', 12.00, 1),
(51, '10012', 2400.00, 1),
(52, '1', 12.00, 1),
(53, '1', 12.00, 1),
(54, '1', 12.00, 1),
(55, '1', 12.00, 1),
(56, '1', 12.00, 2),
(57, '10000', 25.00, 5),
(58, '1', 12.00, 1),
(59, '1', 12.00, 1),
(60, '10011', 600.00, 100),
(61, '1', 12.00, 1),
(62, '1', 12.00, 1),
(63, '1', 12.00, 1),
(64, '1', 12.00, 1),
(65, '1', 12.00, 1),
(66, '1', 12.00, 1),
(67, '10000', 25.00, 1),
(68, '1', 12.00, 1);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `supplier_id` int(11) NOT NULL,
  `company_name` varchar(30) DEFAULT NULL,
  `firstname` varchar(30) DEFAULT NULL,
  `lastname` varchar(30) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `contact_number` varchar(30) DEFAULT NULL,
  `image` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`supplier_id`, `company_name`, `firstname`, `lastname`, `address`, `contact_number`, `image`) VALUES
(21, 'OrangeCompany', 'Oracle', 'LTD', 'USA', '+63(09)1234-1234', 'Internship-Web-Graphic-01.png'),
(22, 'BrandName', 'Bill', 'Joe', 'Africa', '+63(09)1234-1234', 'multi-user-icon.png'),
(23, 'chickenfactory', 'quek', 'szeyang', '62', '0185704592', 'storehub.png');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `position` varchar(20) NOT NULL,
  `contact_number` varchar(30) NOT NULL,
  `image` varchar(30) NOT NULL,
  `password` varchar(60) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `reset_token` varchar(64) DEFAULT NULL,
  `reset_token_expires` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `firstname`, `lastname`, `position`, `contact_number`, `image`, `password`, `email`, `reset_token`, `reset_token_expires`) VALUES
(7, 'admin', 'Juan', 'Cruz', 'admin', '+63(09)1234-1234', 'Myprofile.jpg', '21232f297a57a5a743894a0e4a801fc3', NULL, NULL, NULL),
(13, 'user', 'Chris', 'Does', 'Employee', '+63(09)1234-1234', 'men-in-black.png', 'ee11cbb19052e40b07aac0ca060c23ee', NULL, NULL, NULL),
(15, 'aaron', 'aaron', 'weidi', 'Admin', '018-5704592', 'storehub.png', '$2y$12$XKY0mbcez9GpVs6UF1Xrd.7xe3CfAbPKRJXLzChpfb29FxxM2eHJW', 'sfas@email.com', NULL, NULL),
(16, 'chee', 'Tschee', 'chee', 'Employee', '018-7777563', 'sales-report.png', '$2y$10$qAzHkXuuLTS2q0/VrQzU7.PDV/1d/3qVYHE/HHGsNvywFF7XLRyPq', 'ai220273@student.uthm.edu.my', NULL, NULL),
(17, 'eric', 'yong', 'weidi', 'Admin', '017-5704592', 'sales-report.png', '$2y$10$L80iMeYEGuzBuSf1aXa1.uOKnmjkXjqytfS6Sd7KP2ZWeA3wjxwAm', 'aaronywd1234@gmail.com', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cashflow`
--
ALTER TABLE `cashflow`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`transaction_no`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `initial_products`
--
ALTER TABLE `initial_products`
  ADD KEY `id` (`id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_no`);

--
-- Indexes for table `product_delivered`
--
ALTER TABLE `product_delivered`
  ADD KEY `product_id` (`product_id`),
  ADD KEY `transaction_no` (`transaction_no`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`reciept_no`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `sales_product`
--
ALTER TABLE `sales_product`
  ADD KEY `product_id` (`product_id`),
  ADD KEY `reciept_no` (`reciept_no`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`supplier_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD UNIQUE KEY `user_id` (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cashflow`
--
ALTER TABLE `cashflow`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1315;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `reciept_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `sales_product`
--
ALTER TABLE `sales_product`
  MODIFY `reciept_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `supplier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cashflow`
--
ALTER TABLE `cashflow`
  ADD CONSTRAINT `cashflow_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`);

--
-- Constraints for table `delivery`
--
ALTER TABLE `delivery`
  ADD CONSTRAINT `delivery_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`supplier_id`),
  ADD CONSTRAINT `delivery_ibfk_2` FOREIGN KEY (`username`) REFERENCES `users` (`username`);

--
-- Constraints for table `initial_products`
--
ALTER TABLE `initial_products`
  ADD CONSTRAINT `initial_products_ibfk_1` FOREIGN KEY (`id`) REFERENCES `products` (`product_no`);

--
-- Constraints for table `logs`
--
ALTER TABLE `logs`
  ADD CONSTRAINT `logs_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`);

--
-- Constraints for table `product_delivered`
--
ALTER TABLE `product_delivered`
  ADD CONSTRAINT `product_delivered_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_no`),
  ADD CONSTRAINT `product_delivered_ibfk_2` FOREIGN KEY (`transaction_no`) REFERENCES `delivery` (`transaction_no`);

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `sales_ibfk_3` FOREIGN KEY (`username`) REFERENCES `users` (`username`);

--
-- Constraints for table `sales_product`
--
ALTER TABLE `sales_product`
  ADD CONSTRAINT `sales_product_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_no`),
  ADD CONSTRAINT `sales_product_ibfk_3` FOREIGN KEY (`reciept_no`) REFERENCES `sales` (`reciept_no`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
