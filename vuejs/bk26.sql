-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.28-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table linebot.admins
CREATE TABLE IF NOT EXISTS `admins` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admins_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table linebot.admins: ~1 rows (approximately)
INSERT INTO `admins` (`id`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'admin123@gmail.com', '$2y$10$ObKmKJq8zxTdHx9tA5Zwt.Scek43GCDv/TKFeMYVemN5W7nUx4a3m', NULL, '2024-02-23 01:07:40', '2024-02-23 01:07:40');

-- Dumping structure for table linebot.broadcasts
CREATE TABLE IF NOT EXISTS `broadcasts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `line_user_id` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `sent_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` varchar(255) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `sender_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `broadcasts_sender_id_foreign` (`sender_id`),
  CONSTRAINT `broadcasts_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table linebot.broadcasts: ~59 rows (approximately)
INSERT INTO `broadcasts` (`id`, `line_user_id`, `title`, `sent_at`, `status`, `is_delete`, `sender_id`, `created_at`, `updated_at`) VALUES
	(1, 'U9b60d708a68e2b81a7ff7f9c57540779', 'Hello Thuyen', '2024-02-26 16:53:08', 'sent', 0, 1, '2024-02-23 02:09:45', '2024-02-26 16:53:08'),
	(2, 'U9b60d708a68e2b81a7ff7f9c57540779', 'Thứ sáu ngày 23', '2024-02-26 16:53:08', 'sent', 0, 1, '2024-02-23 02:10:55', '2024-02-26 16:53:08'),
	(3, 'U9b60d708a68e2b81a7ff7f9c57540779', 'Broadcast1', '2024-02-26 16:53:08', 'sent', 0, 1, '2024-02-23 02:30:10', '2024-02-26 16:53:08'),
	(4, 'Ufe280b00e1515db87b977ef3101fb5a1', 'Introduce yourself', '2024-02-26 16:53:08', 'sent', 0, 8, '2024-02-23 02:49:20', '2024-02-26 16:53:08'),
	(5, 'U9b60d708a68e2b81a7ff7f9c57540779', 'Broadcast1', '2024-02-26 16:53:08', 'draf', 0, 1, '2024-02-23 04:28:10', '2024-02-26 16:53:08'),
	(6, 'U9b60d708a68e2b81a7ff7f9c57540779', 'Broadcast1', '2024-02-26 16:53:08', 'draf', 0, 1, '2024-02-23 04:29:11', '2024-02-26 16:53:08'),
	(7, 'U9b60d708a68e2b81a7ff7f9c57540779', 'Broadcast1', '2024-02-26 16:53:08', 'scheduled', 0, 1, '2024-02-23 04:29:15', '2024-02-26 16:53:08'),
	(8, 'U9b60d708a68e2b81a7ff7f9c57540779', 'Broadcast1', '2024-02-26 16:53:08', 'scheduled', 0, 1, '2024-02-23 04:29:17', '2024-02-26 16:53:08'),
	(9, 'U9b60d708a68e2b81a7ff7f9c57540779', 'Broadcast1', '2024-02-26 16:53:08', 'scheduled', 0, 1, '2024-02-23 04:29:18', '2024-02-26 16:53:08'),
	(10, 'U9b60d708a68e2b81a7ff7f9c57540779', 'Broadcast1', '2024-02-26 16:53:08', 'scheduled', 0, 1, '2024-02-23 04:29:19', '2024-02-26 16:53:08'),
	(11, 'U9b60d708a68e2b81a7ff7f9c57540779', 'Broadcast1', '2024-02-26 16:53:08', 'scheduled', 0, 1, '2024-02-23 04:29:21', '2024-02-26 16:53:08'),
	(12, 'U9b60d708a68e2b81a7ff7f9c57540779', 'Broadcast1', '2024-02-26 16:53:08', 'scheduled', 0, 1, '2024-02-23 04:29:26', '2024-02-26 16:53:08'),
	(13, 'U9b60d708a68e2b81a7ff7f9c57540779', 'Broadcast1', '2024-02-26 16:53:08', 'draf', 0, 1, '2024-02-23 04:29:31', '2024-02-26 16:53:08'),
	(14, 'U9b60d708a68e2b81a7ff7f9c57540779', 'Broadcast1', '2024-02-26 16:53:08', 'draf', 0, 1, '2024-02-23 04:29:32', '2024-02-26 16:53:08'),
	(15, 'U9b60d708a68e2b81a7ff7f9c57540779', 'Broadcast1', '2024-02-26 16:53:08', 'draf', 0, 1, '2024-02-23 04:29:33', '2024-02-26 16:53:08'),
	(16, 'U9b60d708a68e2b81a7ff7f9c57540779', 'Broadcast1', '2024-02-26 16:53:08', 'draf', 0, 1, '2024-02-23 04:29:34', '2024-02-26 16:53:08'),
	(17, 'U9b60d708a68e2b81a7ff7f9c57540779', 'Broadcast3', '2024-02-26 16:53:08', 'sent', 0, 1, '2024-02-23 04:30:44', '2024-02-26 16:53:08'),
	(18, 'U9b60d708a68e2b81a7ff7f9c57540779', 'Broadcast3', '2024-02-26 16:53:08', 'sent', 0, 1, '2024-02-23 04:30:44', '2024-02-26 16:53:08'),
	(19, 'U9b60d708a68e2b81a7ff7f9c57540779', 'Broadcast3', '2024-02-26 16:53:08', 'sent', 0, 1, '2024-02-23 04:30:45', '2024-02-26 16:53:08'),
	(20, 'U9b60d708a68e2b81a7ff7f9c57540779', 'Broadcast3', '2024-02-22 02:32:00', 'sent', 0, 1, '2024-02-23 04:30:47', '2024-02-23 04:30:47'),
	(21, 'U9b60d708a68e2b81a7ff7f9c57540779', 'Broadcast3', '2024-02-22 02:32:00', 'sent', 0, 1, '2024-02-23 04:30:48', '2024-02-23 04:30:48'),
	(22, 'U9b60d708a68e2b81a7ff7f9c57540779', 'Broadcast3', '2024-02-23 04:31:58', 'sent', 0, 1, '2024-02-23 04:30:48', '2024-02-23 04:30:48'),
	(23, 'U9b60d708a68e2b81a7ff7f9c57540779', 'Broadcast3', '2024-02-22 02:32:00', 'sent', 0, 1, '2024-02-23 04:30:49', '2024-02-23 04:30:49'),
	(24, 'U9b60d708a68e2b81a7ff7f9c57540779', 'Broadcast3', '2024-02-23 04:32:00', 'sent', 0, 1, '2024-02-23 04:30:50', '2024-02-23 04:30:50'),
	(25, 'U9b60d708a68e2b81a7ff7f9c57540779', 'Broadcast4', '2024-02-23 01:32:49', 'failed', 0, 1, '2024-02-23 04:32:25', '2024-02-23 04:32:25'),
	(26, 'U9b60d708a68e2b81a7ff7f9c57540779', 'Broadcast4', '2024-02-23 01:32:49', 'failed', 0, 1, '2024-02-23 04:32:27', '2024-02-23 04:32:27'),
	(27, 'U9b60d708a68e2b81a7ff7f9c57540779', 'Broadcast4', '2024-02-23 01:32:49', 'failed', 0, 1, '2024-02-23 04:32:27', '2024-02-23 04:32:27'),
	(28, 'U9b60d708a68e2b81a7ff7f9c57540779', 'Broadcast4', '2024-02-23 01:32:49', 'failed', 0, 1, '2024-02-23 04:32:28', '2024-02-23 04:32:28'),
	(29, 'U9b60d708a68e2b81a7ff7f9c57540779', 'Broadcast4', '2024-02-23 01:32:49', 'failed', 0, 1, '2024-02-23 04:32:28', '2024-02-23 04:32:28'),
	(30, 'U9b60d708a68e2b81a7ff7f9c57540779', 'Broadcast4', '2024-02-26 16:52:59', 'failed', 0, 1, '2024-02-23 04:32:29', '2024-02-26 16:52:59'),
	(31, 'U9b60d708a68e2b81a7ff7f9c57540779', 'Broadcast4', '2024-02-26 16:52:59', 'failed', 0, 1, '2024-02-23 04:32:29', '2024-02-26 16:52:59'),
	(32, 'U9b60d708a68e2b81a7ff7f9c57540779', 'Broadcast4', '2024-02-26 16:52:59', 'failed', 0, 1, '2024-02-23 04:32:30', '2024-02-26 16:52:59'),
	(33, 'U9b60d708a68e2b81a7ff7f9c57540779', 'ascascacascasc', '2024-02-26 16:52:59', 'sent', 0, 1, '2024-02-23 04:52:18', '2024-02-26 16:52:59'),
	(34, 'U9b60d708a68e2b81a7ff7f9c57540779', 'xin chào ban Hàoooooooooooooooo', '2024-02-26 16:52:59', 'draf', 0, 1, '2024-02-23 04:56:24', '2024-02-26 16:52:59'),
	(35, 'U9b60d708a68e2b81a7ff7f9c57540779', 'Hi Xin chao PHP2', '2024-02-26 16:52:59', 'scheduled', 0, 1, '2024-02-23 07:55:29', '2024-02-26 16:52:59'),
	(36, 'U9b60d708a68e2b81a7ff7f9c57540779', 'advdsvsdvsdv', '2024-02-26 16:52:59', 'sent', 0, 1, '2024-02-23 07:58:09', '2024-02-26 16:52:59'),
	(37, 'U9b60d708a68e2b81a7ff7f9c57540779', 'âcscsacasscasc', '2024-02-26 16:52:59', 'scheduled', 0, 1, '2024-02-23 07:59:19', '2024-02-26 16:52:59'),
	(38, 'U9b60d708a68e2b81a7ff7f9c57540779', 'asasdsvdsvsdvsdvdsv', '2024-02-26 16:52:59', 'scheduled', 0, 1, '2024-02-23 09:06:40', '2024-02-26 16:52:59'),
	(39, 'U9b60d708a68e2b81a7ff7f9c57540779', 'sbsvsbfbfdbdfbdfbdf', '2024-02-26 16:52:59', 'scheduled', 0, 1, '2024-02-23 09:07:20', '2024-02-26 16:52:59'),
	(40, 'U9b60d708a68e2b81a7ff7f9c57540779', 'dsvsdsvsvsdvsd', '2024-02-23 09:08:36', 'scheduled', 0, 1, '2024-02-23 09:08:35', '2024-02-23 09:08:35'),
	(41, 'U9b60d708a68e2b81a7ff7f9c57540779', 'demo2024', '2024-02-23 09:10:41', 'scheduled', 0, 1, '2024-02-23 09:10:41', '2024-02-23 09:10:41'),
	(42, 'U9b60d708a68e2b81a7ff7f9c57540779', 'acsacascsacasc', '2024-02-24 09:35:27', 'sent', 0, 1, '2024-02-24 09:35:10', '2024-02-24 09:35:27'),
	(43, 'U9b60d708a68e2b81a7ff7f9c57540779', 'Xin chào', '2024-02-24 11:22:28', 'sent', 0, 1, '2024-02-24 11:22:19', '2024-02-24 11:22:28'),
	(44, 'U9b60d708a68e2b81a7ff7f9c57540779', 'ewfwevewv', '2024-02-24 11:25:17', 'scheduled', 0, 1, '2024-02-24 11:25:32', '2024-02-24 11:25:32'),
	(45, 'U9b60d708a68e2b81a7ff7f9c57540779', 'ewfwevewv', '2024-02-24 11:27:59', 'sent', 0, 1, '2024-02-24 11:27:58', '2024-02-24 11:27:59'),
	(46, 'U9b60d708a68e2b81a7ff7f9c57540779', 'ascsacascascascacssac', '2024-02-24 11:29:30', 'sent', 0, 1, '2024-02-24 11:29:24', '2024-02-24 11:29:30'),
	(47, 'U9b60d708a68e2b81a7ff7f9c57540779', 'ascascsacascascsac', '2024-02-24 11:31:10', 'sent', 0, 1, '2024-02-24 11:31:06', '2024-02-24 11:31:10'),
	(48, 'U9b60d708a68e2b81a7ff7f9c57540779', 'ascascsacascascsac', '2024-02-24 20:33:03', 'sent', 1, 1, '2024-02-24 11:31:28', '2024-02-24 20:33:03'),
	(49, 'U9b60d708a68e2b81a7ff7f9c57540779', 'ascascsacascascsac', '2024-02-24 20:33:03', 'sent', 1, 1, '2024-02-24 11:32:15', '2024-02-24 20:33:03'),
	(50, 'U9b60d708a68e2b81a7ff7f9c57540779', 'vsdvsv', '2024-02-24 20:33:03', 'sent', 1, 1, '2024-02-24 11:38:33', '2024-02-24 20:33:03'),
	(51, 'U9b60d708a68e2b81a7ff7f9c57540779', 'vsdvsv', '2024-02-24 20:33:03', 'scheduled', 1, 1, '2024-02-24 11:39:13', '2024-02-24 20:33:03'),
	(52, 'U9b60d708a68e2b81a7ff7f9c57540779', 'CSACSACASC', '2024-02-24 20:33:03', 'sent', 1, 1, '2024-02-24 11:43:53', '2024-02-24 20:33:03'),
	(53, 'U9b60d708a68e2b81a7ff7f9c57540779', 'ascascasc', '2024-02-24 20:32:56', 'sent', 1, 1, '2024-02-24 11:47:46', '2024-02-24 20:32:56'),
	(54, 'U9b60d708a68e2b81a7ff7f9c57540779', 'ascsaccacascsacascsacsac', '2024-02-24 20:32:56', 'sent', 1, 1, '2024-02-24 11:48:12', '2024-02-24 20:32:56'),
	(55, 'U9b60d708a68e2b81a7ff7f9c57540779', 'xin chao viet nam xin chao viet namxin chao viet namxin chao viet namxin chao viet nam', '2024-02-24 20:34:14', 'sent', 1, 1, '2024-02-24 11:50:47', '2024-02-24 20:34:14'),
	(56, 'U9b60d708a68e2b81a7ff7f9c57540779', 'saccacsasscasc', '2024-02-24 20:34:14', 'draf', 1, 1, '2024-02-24 11:52:09', '2024-02-24 20:34:14'),
	(62, 'dvdsvdsvsdvsdvsdvsdvddvddvdvv', 'sacsacsacasc', '2024-02-26 17:14:19', 'scheduled', 0, 15, '2024-02-26 17:12:19', '2024-02-26 17:14:19'),
	(63, 'dvdsvdsvsdvsdvsdvsdvddvddvdvv', 'scacascascacs', '2024-02-26 17:14:19', 'draf', 0, 15, '2024-02-26 17:12:31', '2024-02-26 17:14:19'),
	(64, 'dvdsvdsvsdvsdvsdvsdvddvddvdvv', 'sacsaascasc', '2024-02-26 17:14:19', 'scheduled', 0, 15, '2024-02-26 17:12:47', '2024-02-26 17:14:19');

-- Dumping structure for table linebot.channels
CREATE TABLE IF NOT EXISTS `channels` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `account_manager_id` bigint(20) unsigned NOT NULL,
  `channel_id` varchar(255) DEFAULT NULL,
  `channel_name` varchar(255) DEFAULT NULL,
  `channel_secret` varchar(255) DEFAULT NULL,
  `channel_access_token` varchar(255) DEFAULT NULL,
  `picture_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `channels_account_manager_id_foreign` (`account_manager_id`),
  CONSTRAINT `channels_account_manager_id_foreign` FOREIGN KEY (`account_manager_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table linebot.channels: ~7 rows (approximately)
INSERT INTO `channels` (`id`, `account_manager_id`, `channel_id`, `channel_name`, `channel_secret`, `channel_access_token`, `picture_url`, `created_at`, `updated_at`) VALUES
	(1, 1, '2003654394', 'DemoPHP2', '927e8f76d9d1cc656e9fce51f5a114ab', '46KBGGZtdCCjJ9QNgwTYQi4wJxMRyVGpmlQtjOtAwwElXOdQulOyV9783l/Fn2PoakHgtgIBcn0uEF8u2BrLnKnvDe7Wvgk5St6O6ZDV6MdlNpZM/VnL55mTHD8BxOMokT8e6koYnKQ55N6F+o7JfgdB04t89/1O/w1cDnyilFU=', 'https://obs.line-scdn.net/0hLTgC-3_nE3taOgDPVMpsLAhnGBlpWA1weA4HHDpGTh4oYR9aOww5bX9pTks8XyZGLT06XDlFPyB2azJNOgk5HDZSThY3YSJWIiMHfTRqKDsxcQh3biAs/f256x256', '2024-02-23 01:07:40', '2024-02-24 17:31:52'),
	(2, 2, '2003308317', 'test_dut1', '1446e7d4c9eec2443fc21ce0cf4b45ec', 'txnQ8efyzbIGDv6VZ1HrATucI+rskmpJGYquRfuhTqUwnGude26UC75NIR5mtWRbyIJ6piDEaedbW3dPeJjL5Gmj0fns5EW1tDa7aXBXpH/hwDWR+KFYD0rggc3p8uplB8VIhcqSslKShINtK58JhgdB04t89/1O/w1cDnyilFU=', NULL, '2024-02-23 01:07:40', '2024-02-23 01:07:40'),
	(3, 3, NULL, NULL, NULL, NULL, NULL, '2024-02-23 01:20:15', '2024-02-23 01:48:28'),
	(4, 4, NULL, NULL, NULL, NULL, NULL, '2024-02-23 01:26:05', '2024-02-23 01:26:05'),
	(5, 5, NULL, NULL, NULL, NULL, NULL, '2024-02-23 01:28:16', '2024-02-23 01:28:16'),
	(6, 6, NULL, NULL, NULL, NULL, NULL, '2024-02-23 01:29:37', '2024-02-23 01:29:37'),
	(7, 7, NULL, NULL, NULL, NULL, NULL, '2024-02-23 01:31:15', '2024-02-23 01:31:15');

-- Dumping structure for table linebot.channel_statisticals
CREATE TABLE IF NOT EXISTS `channel_statisticals` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `channel_id` bigint(20) unsigned NOT NULL,
  `date` date NOT NULL,
  `api_broadcast` int(11) DEFAULT 0,
  `api_multicast` int(11) DEFAULT 0,
  `followers` int(11) DEFAULT 0,
  `targeted_reaches` int(11) DEFAULT 0,
  `blocks` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `channel_statisticals_channel_id_foreign` (`channel_id`),
  CONSTRAINT `channel_statisticals_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=228 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table linebot.channel_statisticals: ~62 rows (approximately)
INSERT INTO `channel_statisticals` (`id`, `channel_id`, `date`, `api_broadcast`, `api_multicast`, `followers`, `targeted_reaches`, `blocks`, `created_at`, `updated_at`) VALUES
	(162, 1, '2024-01-25', 21, 12, 15, 27, 30, '2024-02-25 11:28:06', '2024-02-25 11:28:06'),
	(163, 2, '2024-01-25', 87, 100, 22, 14, 11, '2024-02-25 11:28:06', '2024-02-25 11:28:06'),
	(164, 1, '2024-01-26', 28, 73, 8, 17, 28, '2024-02-25 11:28:06', '2024-02-25 11:28:06'),
	(165, 2, '2024-01-26', 46, 81, 28, 1, 29, '2024-02-25 11:28:06', '2024-02-25 11:28:06'),
	(166, 1, '2024-01-27', 91, 39, 7, 21, 24, '2024-02-25 11:28:06', '2024-02-25 11:28:06'),
	(167, 2, '2024-01-27', 85, 18, 4, 21, 17, '2024-02-25 11:28:06', '2024-02-25 11:28:06'),
	(168, 1, '2024-01-28', 86, 88, 5, 8, 18, '2024-02-25 11:28:06', '2024-02-25 11:28:06'),
	(169, 2, '2024-01-28', 38, 25, 2, 11, 14, '2024-02-25 11:28:06', '2024-02-25 11:28:06'),
	(170, 1, '2024-01-29', 54, 57, 4, 18, 26, '2024-02-25 11:28:06', '2024-02-25 11:28:06'),
	(171, 2, '2024-01-29', 4, 5, 6, 10, 5, '2024-02-25 11:28:06', '2024-02-25 11:28:06'),
	(172, 1, '2024-01-30', 64, 60, 15, 13, 16, '2024-02-25 11:28:06', '2024-02-25 11:28:06'),
	(173, 2, '2024-01-30', 23, 84, 7, 5, 11, '2024-02-25 11:28:06', '2024-02-25 11:28:06'),
	(174, 1, '2024-01-31', 2, 41, 9, 10, 22, '2024-02-25 11:28:06', '2024-02-25 11:28:06'),
	(175, 2, '2024-01-31', 20, 47, 6, 23, 11, '2024-02-25 11:28:06', '2024-02-25 11:28:06'),
	(176, 1, '2024-02-01', 9, 55, 26, 7, 15, '2024-02-25 11:28:06', '2024-02-25 11:28:06'),
	(177, 2, '2024-02-01', 35, 5, 19, 30, 1, '2024-02-25 11:28:06', '2024-02-25 11:28:06'),
	(178, 1, '2024-02-02', 7, 27, 3, 21, 5, '2024-02-25 11:28:06', '2024-02-25 11:28:06'),
	(179, 2, '2024-02-02', 6, 35, 27, 0, 19, '2024-02-25 11:28:06', '2024-02-25 11:28:06'),
	(180, 1, '2024-02-03', 9, 55, 20, 13, 25, '2024-02-25 11:28:06', '2024-02-25 11:28:06'),
	(181, 2, '2024-02-03', 74, 45, 19, 8, 3, '2024-02-25 11:28:06', '2024-02-25 11:28:06'),
	(182, 1, '2024-02-04', 65, 4, 15, 10, 9, '2024-02-25 11:28:06', '2024-02-25 11:28:06'),
	(183, 2, '2024-02-04', 73, 75, 0, 15, 11, '2024-02-25 11:28:06', '2024-02-25 11:28:06'),
	(184, 1, '2024-02-05', 75, 15, 25, 14, 29, '2024-02-25 11:28:06', '2024-02-25 11:28:06'),
	(185, 2, '2024-02-05', 68, 35, 13, 16, 7, '2024-02-25 11:28:06', '2024-02-25 11:28:06'),
	(186, 1, '2024-02-06', 48, 26, 22, 23, 27, '2024-02-25 11:28:06', '2024-02-25 11:28:06'),
	(187, 2, '2024-02-06', 22, 84, 11, 16, 15, '2024-02-25 11:28:06', '2024-02-25 11:28:06'),
	(188, 1, '2024-02-07', 95, 34, 23, 19, 17, '2024-02-25 11:28:06', '2024-02-25 11:28:06'),
	(189, 2, '2024-02-07', 57, 94, 5, 9, 6, '2024-02-25 11:28:06', '2024-02-25 11:28:06'),
	(190, 1, '2024-02-08', 76, 45, 1, 4, 3, '2024-02-25 11:28:06', '2024-02-25 11:28:06'),
	(191, 2, '2024-02-08', 45, 41, 14, 2, 30, '2024-02-25 11:28:06', '2024-02-25 11:28:06'),
	(192, 1, '2024-02-09', 43, 89, 7, 18, 6, '2024-02-25 11:28:06', '2024-02-25 11:28:06'),
	(193, 2, '2024-02-09', 80, 66, 18, 11, 5, '2024-02-25 11:28:06', '2024-02-25 11:28:06'),
	(194, 1, '2024-02-10', 44, 48, 10, 18, 5, '2024-02-25 11:28:06', '2024-02-25 11:28:06'),
	(195, 2, '2024-02-10', 59, 59, 20, 26, 29, '2024-02-25 11:28:06', '2024-02-25 11:28:06'),
	(196, 1, '2024-02-11', 85, 96, 14, 4, 10, '2024-02-25 11:28:06', '2024-02-25 11:28:06'),
	(197, 2, '2024-02-11', 37, 2, 28, 4, 10, '2024-02-25 11:28:06', '2024-02-25 11:28:06'),
	(198, 1, '2024-02-12', 16, 98, 6, 30, 24, '2024-02-25 11:28:06', '2024-02-25 11:28:06'),
	(199, 2, '2024-02-12', 50, 23, 0, 11, 1, '2024-02-25 11:28:06', '2024-02-25 11:28:06'),
	(200, 1, '2024-02-13', 46, 12, 8, 9, 9, '2024-02-25 11:28:06', '2024-02-25 11:28:06'),
	(201, 2, '2024-02-13', 11, 10, 28, 7, 7, '2024-02-25 11:28:06', '2024-02-25 11:28:06'),
	(202, 1, '2024-02-14', 34, 28, 23, 14, 11, '2024-02-25 11:28:06', '2024-02-25 11:28:06'),
	(203, 2, '2024-02-14', 34, 75, 2, 16, 29, '2024-02-25 11:28:06', '2024-02-25 11:28:06'),
	(204, 1, '2024-02-15', 57, 54, 17, 10, 16, '2024-02-25 11:28:06', '2024-02-25 11:28:06'),
	(205, 2, '2024-02-15', 4, 96, 22, 16, 8, '2024-02-25 11:28:06', '2024-02-25 11:28:06'),
	(206, 1, '2024-02-16', 72, 73, 5, 23, 12, '2024-02-25 11:28:06', '2024-02-25 11:28:06'),
	(207, 2, '2024-02-16', 54, 96, 2, 14, 24, '2024-02-25 11:28:06', '2024-02-25 11:28:06'),
	(208, 1, '2024-02-17', 76, 72, 20, 28, 25, '2024-02-25 11:28:06', '2024-02-25 11:28:06'),
	(209, 2, '2024-02-17', 7, 6, 15, 19, 20, '2024-02-25 11:28:06', '2024-02-25 11:28:06'),
	(210, 1, '2024-02-18', 98, 41, 30, 11, 17, '2024-02-25 11:28:06', '2024-02-25 11:28:06'),
	(211, 2, '2024-02-18', 63, 94, 2, 5, 18, '2024-02-25 11:28:06', '2024-02-25 11:28:06'),
	(212, 1, '2024-02-19', 55, 50, 21, 11, 26, '2024-02-25 11:28:06', '2024-02-25 11:28:06'),
	(213, 2, '2024-02-19', 64, 100, 3, 11, 14, '2024-02-25 11:28:06', '2024-02-25 11:28:06'),
	(214, 1, '2024-02-20', 26, 46, 24, 30, 18, '2024-02-25 11:28:06', '2024-02-25 11:28:06'),
	(215, 2, '2024-02-20', 55, 69, 7, 20, 19, '2024-02-25 11:28:06', '2024-02-25 11:28:06'),
	(216, 1, '2024-02-21', 90, 56, 26, 11, 19, '2024-02-25 11:28:06', '2024-02-25 11:28:06'),
	(217, 2, '2024-02-21', 100, 86, 22, 28, 24, '2024-02-25 11:28:06', '2024-02-25 11:28:06'),
	(218, 1, '2024-02-22', 26, 38, 16, 13, 13, '2024-02-25 11:28:06', '2024-02-25 11:28:06'),
	(219, 2, '2024-02-22', 30, 36, 10, 11, 21, '2024-02-25 11:28:06', '2024-02-25 11:28:06'),
	(220, 1, '2024-02-23', 33, 84, 0, 16, 11, '2024-02-25 11:28:06', '2024-02-25 11:28:06'),
	(221, 2, '2024-02-23', 58, 23, 19, 3, 6, '2024-02-25 11:28:06', '2024-02-25 11:28:06'),
	(222, 1, '2024-02-24', 70, 83, 4, 21, 2, '2024-02-25 11:28:06', '2024-02-25 11:28:06'),
	(223, 2, '2024-02-24', 63, 17, 21, 10, 24, '2024-02-25 11:28:06', '2024-02-25 11:28:06'),
	(226, 1, '2024-02-26', 15, 5, 3, 3, 0, '2024-02-27 00:32:17', '2024-02-27 00:32:17'),
	(227, 2, '2024-02-26', 0, 0, 0, 0, 0, '2024-02-27 00:32:17', '2024-02-27 00:32:17');

-- Dumping structure for table linebot.contents
CREATE TABLE IF NOT EXISTS `contents` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `content_type` varchar(255) NOT NULL,
  `content_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`content_data`)),
  `is_delete` tinyint(1) NOT NULL,
  `create_id` bigint(20) unsigned NOT NULL,
  `update_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contents_user_id_foreign` (`user_id`),
  KEY `contents_create_id_foreign` (`create_id`),
  KEY `contents_update_id_foreign` (`update_id`),
  CONSTRAINT `contents_create_id_foreign` FOREIGN KEY (`create_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `contents_update_id_foreign` FOREIGN KEY (`update_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `contents_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table linebot.contents: ~44 rows (approximately)
INSERT INTO `contents` (`id`, `user_id`, `content_type`, `content_data`, `is_delete`, `create_id`, `update_id`, `created_at`, `updated_at`) VALUES
	(1, 1, 'text', '{"type":"text","text":"Xin chào mọi người. Hello Thu Thuyên"}', 0, 1, 1, '2024-02-23 01:34:23', '2024-02-24 08:29:45'),
	(2, 1, 'sticker', '{"type":"sticker","packageId":"6136","stickerId":"10551390"}', 0, 1, 1, '2024-02-23 02:00:02', '2024-02-24 08:29:35'),
	(3, 1, 'image', '{"type":"image","originalContentUrl":"https:\\/\\/res.cloudinary.com\\/dzve8benj\\/image\\/upload\\/v1708653631\\/contents\\/t09j6ghhgulz5kqdo7fy.jpg","previewImageUrl":"https:\\/\\/res.cloudinary.com\\/dzve8benj\\/image\\/upload\\/v1708653631\\/contents\\/t09j6ghhgulz5kqdo7fy.jpg"}', 0, 1, 1, '2024-02-23 02:00:31', '2024-02-24 08:29:35'),
	(4, 1, 'image', '{"type":"image","originalContentUrl":"https:\\/\\/res.cloudinary.com\\/dzve8benj\\/image\\/upload\\/v1708653679\\/contents\\/wapdezovv02oq44irfqr.jpg","previewImageUrl":"https:\\/\\/res.cloudinary.com\\/dzve8benj\\/image\\/upload\\/v1708653679\\/contents\\/wapdezovv02oq44irfqr.jpg"}', 0, 1, 1, '2024-02-23 02:01:19', '2024-02-24 08:29:35'),
	(5, 1, 'text', '{"type":"text","text":"Everything has beauty, but not everyone sees it."}', 0, 1, 1, '2024-02-23 02:02:29', '2024-02-24 08:29:35'),
	(6, 1, 'text', '{"type":"text","text":"Peace does not mean one where no noise, no trouble, and no toil. When we are in a storm, we still feel the calm of mind. That is the real meaning of peace!"}', 0, 1, 1, '2024-02-23 02:03:02', '2024-02-24 08:29:35'),
	(7, 1, 'sticker', '{"type":"sticker","packageId":"446","stickerId":"1997"}', 0, 1, 1, '2024-02-23 02:03:17', '2024-02-24 08:29:35'),
	(8, 1, 'sticker', '{"type":"sticker","packageId":"446","stickerId":"1996"}', 0, 1, 1, '2024-02-23 02:03:25', '2024-02-24 08:29:35'),
	(9, 1, 'text', '{"type":"text","text":"LINE Bot tập trung phát triển chatbot trên nền tảng Software Pro"}', 0, 1, 1, '2024-02-23 02:05:56', '2024-02-24 08:29:35'),
	(10, 1, 'text', '{"type":"text","text":"Xin chào mọi người, trưa nay ăn gì???"}', 0, 1, 1, '2024-02-23 02:34:31', '2024-02-24 08:29:35'),
	(11, 1, 'image', '{"type":"image","originalContentUrl":"https:\\/\\/res.cloudinary.com\\/dzve8benj\\/image\\/upload\\/v1708655939\\/contents\\/pz9lnxhank952nxbeikh.jpg","previewImageUrl":"https:\\/\\/res.cloudinary.com\\/dzve8benj\\/image\\/upload\\/v1708655939\\/contents\\/pz9lnxhank952nxbeikh.jpg"}', 0, 1, 1, '2024-02-23 02:39:00', '2024-02-24 08:29:35'),
	(12, 8, 'text', '{"type":"text","text":"Hi everyone, I\'m a member of channelsdvsdvsvdsvsdv"}', 0, 8, 1, '2024-02-23 02:43:03', '2024-02-24 08:29:35'),
	(13, 8, 'sticker', '{"type":"sticker","packageId":"789","stickerId":"10893"}', 0, 8, 8, '2024-02-23 02:44:19', '2024-02-24 08:29:35'),
	(14, 8, 'sticker', '{"type":"sticker","packageId":"789","stickerId":"10888"}', 0, 8, 1, '2024-02-23 02:44:59', '2024-02-24 08:29:35'),
	(15, 8, 'text', '{"type":"text","text":"Xin chào bạn Mạnh, xin chào bạn Mạnh, xin chào bạn Mạnh, xin chào bạn Mạnh <333"}', 0, 8, 1, '2024-02-23 02:45:56', '2024-02-24 08:29:35'),
	(16, 8, 'image', '{"type":"image","originalContentUrl":"https:\\/\\/res.cloudinary.com\\/dzve8benj\\/image\\/upload\\/v1708679124\\/contents\\/nxxij5wh9zkif08c6hwo.png","previewImageUrl":"https:\\/\\/res.cloudinary.com\\/dzve8benj\\/image\\/upload\\/v1708679124\\/contents\\/nxxij5wh9zkif08c6hwo.png"}', 0, 8, 1, '2024-02-23 02:46:13', '2024-02-24 08:29:35'),
	(17, 1, 'sticker', '{"type":"sticker","packageId":"446","stickerId":"1988"}', 0, 1, 1, '2024-02-23 04:45:35', '2024-02-24 08:29:35'),
	(18, 1, 'sticker', '{"type":"sticker","packageId":"446","stickerId":"1990"}', 0, 1, 1, '2024-02-23 04:45:42', '2024-02-24 08:29:35'),
	(19, 1, 'sticker', '{"type":"sticker","packageId":"789","stickerId":"10876"}', 0, 1, 1, '2024-02-23 04:45:47', '2024-02-24 08:29:35'),
	(20, 1, 'sticker', '{"type":"sticker","packageId":"789","stickerId":"10861"}', 0, 1, 1, '2024-02-23 04:45:54', '2024-02-24 08:29:35'),
	(21, 1, 'sticker', '{"type":"sticker","packageId":"789","stickerId":"10868"}', 0, 1, 1, '2024-02-23 04:45:58', '2024-02-24 08:29:35'),
	(22, 1, 'sticker', '{"type":"sticker","packageId":"789","stickerId":"10889"}', 0, 1, 1, '2024-02-23 04:46:05', '2024-02-24 08:29:26'),
	(23, 1, 'sticker', '{"type":"sticker","packageId":"446","stickerId":"2003"}', 0, 1, 1, '2024-02-23 04:46:25', '2024-02-24 08:29:26'),
	(24, 1, 'sticker', '{"type":"sticker","packageId":"789","stickerId":"10856"}', 0, 1, 1, '2024-02-23 04:46:32', '2024-02-24 08:29:26'),
	(25, 1, 'sticker', '{"type":"sticker","packageId":"6136","stickerId":"10551381"}', 0, 1, 1, '2024-02-23 04:46:47', '2024-02-24 08:29:26'),
	(26, 1, 'sticker', '{"type":"sticker","packageId":"6325","stickerId":"10979910"}', 0, 1, 1, '2024-02-23 04:46:52', '2024-02-24 08:29:26'),
	(27, 1, 'sticker', '{"type":"sticker","packageId":"6325","stickerId":"10979917"}', 0, 1, 1, '2024-02-23 04:46:56', '2024-02-24 08:29:26'),
	(28, 1, 'sticker', '{"type":"sticker","packageId":"6325","stickerId":"10979907"}', 0, 1, 1, '2024-02-23 04:47:00', '2024-02-24 08:29:26'),
	(29, 1, 'image', '{"type":"image","originalContentUrl":"https:\\/\\/res.cloudinary.com\\/dzve8benj\\/image\\/upload\\/v1708663728\\/contents\\/zx3ehvy6nolspmokys6e.jpg","previewImageUrl":"https:\\/\\/res.cloudinary.com\\/dzve8benj\\/image\\/upload\\/v1708663728\\/contents\\/zx3ehvy6nolspmokys6e.jpg"}', 0, 1, 1, '2024-02-23 04:48:48', '2024-02-24 08:29:26'),
	(30, 1, 'image', '{"type":"image","originalContentUrl":"https:\\/\\/res.cloudinary.com\\/dzve8benj\\/image\\/upload\\/v1708663741\\/contents\\/mvgxzmotbi4xobylgyh0.jpg","previewImageUrl":"https:\\/\\/res.cloudinary.com\\/dzve8benj\\/image\\/upload\\/v1708663741\\/contents\\/mvgxzmotbi4xobylgyh0.jpg"}', 0, 1, 1, '2024-02-23 04:49:01', '2024-02-24 08:29:26'),
	(31, 1, 'image', '{"type":"image","originalContentUrl":"https:\\/\\/res.cloudinary.com\\/dzve8benj\\/image\\/upload\\/v1708663751\\/contents\\/fkc9tbhtxbp0c3ifmcjc.png","previewImageUrl":"https:\\/\\/res.cloudinary.com\\/dzve8benj\\/image\\/upload\\/v1708663751\\/contents\\/fkc9tbhtxbp0c3ifmcjc.png"}', 0, 1, 1, '2024-02-23 04:49:10', '2024-02-24 08:29:26'),
	(33, 1, 'image', '{"type":"image","originalContentUrl":"https:\\/\\/res.cloudinary.com\\/dzve8benj\\/image\\/upload\\/v1708663832\\/contents\\/sggyuikafoodocgtbqgf.jpg","previewImageUrl":"https:\\/\\/res.cloudinary.com\\/dzve8benj\\/image\\/upload\\/v1708663832\\/contents\\/sggyuikafoodocgtbqgf.jpg"}', 0, 1, 1, '2024-02-23 04:50:31', '2024-02-24 08:29:26'),
	(34, 1, 'text', '{"type":"text","text":"Xin chào bạn, hy vọng bạn có một ngày tuyệt vời!"}', 0, 1, 1, '2024-02-23 04:57:02', '2024-02-24 08:29:26'),
	(35, 1, 'text', '{"type":"text","text":"Chào bạn! Chúc bạn một ngày thật vui vẻ và thành công."}', 0, 1, 1, '2024-02-23 04:57:12', '2024-02-24 08:29:26'),
	(36, 1, 'sticker', '{"type":"sticker","packageId":"6136","stickerId":"10551378"}', 0, 1, 1, '2024-02-23 04:58:06', '2024-02-24 08:29:26'),
	(37, 1, 'sticker', '{"type":"sticker","packageId":"789","stickerId":"10893"}', 0, 1, 1, '2024-02-23 04:58:16', '2024-02-24 08:29:26'),
	(38, 1, 'image', '{"type":"image","originalContentUrl":"https:\\/\\/res.cloudinary.com\\/dzve8benj\\/image\\/upload\\/v1708664349\\/contents\\/lfkyaomq62rzwuxktebd.jpg","previewImageUrl":"https:\\/\\/res.cloudinary.com\\/dzve8benj\\/image\\/upload\\/v1708664349\\/contents\\/lfkyaomq62rzwuxktebd.jpg"}', 0, 1, 1, '2024-02-23 04:59:08', '2024-02-26 17:10:32'),
	(39, 1, 'image', '{"type":"image","originalContentUrl":"https:\\/\\/res.cloudinary.com\\/dzve8benj\\/image\\/upload\\/v1708664379\\/contents\\/lld2io4smjkzm6jz9tvf.jpg","previewImageUrl":"https:\\/\\/res.cloudinary.com\\/dzve8benj\\/image\\/upload\\/v1708664379\\/contents\\/lld2io4smjkzm6jz9tvf.jpg"}', 0, 1, 1, '2024-02-23 04:59:38', '2024-02-26 17:10:32'),
	(40, 1, 'image', '{"type":"image","originalContentUrl":"https:\\/\\/res.cloudinary.com\\/dzve8benj\\/image\\/upload\\/v1708678967\\/contents\\/twb88152bajhdenarhbc.jpg","previewImageUrl":"https:\\/\\/res.cloudinary.com\\/dzve8benj\\/image\\/upload\\/v1708678967\\/contents\\/twb88152bajhdenarhbc.jpg"}', 0, 1, 1, '2024-02-23 09:02:47', '2024-02-26 17:10:32'),
	(41, 1, 'text', '{"type":"text","text":"sdvdsvsdvdsvdvsdvds"}', 0, 1, 1, '2024-02-23 09:03:13', '2024-02-26 17:10:32'),
	(42, 1, 'sticker', '{"type":"sticker","packageId":"446","stickerId":"1988"}', 0, 1, 1, '2024-02-23 09:03:24', '2024-02-26 17:10:32'),
	(43, 15, 'text', '{"type":"text","text":"dvdsvdsv"}', 0, 15, 15, '2024-02-26 17:11:18', '2024-02-26 17:11:18'),
	(44, 15, 'sticker', '{"type":"sticker","packageId":"446","stickerId":"1988"}', 0, 15, 15, '2024-02-26 17:11:24', '2024-02-26 17:11:24'),
	(45, 15, 'sticker', '{"type":"sticker","packageId":"446","stickerId":"1988"}', 0, 15, 1, '2024-02-26 17:11:32', '2024-02-26 17:14:44');

-- Dumping structure for table linebot.content_broadcasts
CREATE TABLE IF NOT EXISTS `content_broadcasts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `broadcast_id` bigint(20) unsigned NOT NULL,
  `content_id` bigint(20) unsigned NOT NULL,
  `sequence` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `content_broadcasts_user_id_foreign` (`user_id`),
  KEY `content_broadcasts_broadcast_id_foreign` (`broadcast_id`),
  KEY `content_broadcasts_content_id_foreign` (`content_id`),
  CONSTRAINT `content_broadcasts_broadcast_id_foreign` FOREIGN KEY (`broadcast_id`) REFERENCES `broadcasts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `content_broadcasts_content_id_foreign` FOREIGN KEY (`content_id`) REFERENCES `contents` (`id`) ON DELETE CASCADE,
  CONSTRAINT `content_broadcasts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=255 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table linebot.content_broadcasts: ~200 rows (approximately)
INSERT INTO `content_broadcasts` (`id`, `user_id`, `broadcast_id`, `content_id`, `sequence`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, 1, 0, '2024-02-23 02:09:45', '2024-02-23 02:09:45'),
	(2, 1, 2, 9, 0, '2024-02-23 02:10:55', '2024-02-23 02:10:55'),
	(3, 1, 2, 7, 1, '2024-02-23 02:10:56', '2024-02-23 02:10:56'),
	(4, 1, 2, 4, 2, '2024-02-23 02:10:56', '2024-02-23 02:10:56'),
	(5, 1, 3, 1, 0, '2024-02-23 02:30:10', '2024-02-23 02:30:10'),
	(6, 8, 4, 12, 0, '2024-02-23 02:49:20', '2024-02-23 02:49:20'),
	(7, 8, 4, 13, 1, '2024-02-23 02:49:20', '2024-02-23 02:49:20'),
	(8, 1, 5, 2, 0, '2024-02-23 04:28:10', '2024-02-23 04:28:10'),
	(9, 1, 5, 4, 1, '2024-02-23 04:28:10', '2024-02-23 04:28:10'),
	(10, 1, 5, 1, 2, '2024-02-23 04:28:10', '2024-02-23 04:28:10'),
	(11, 1, 6, 3, 0, '2024-02-23 04:29:11', '2024-02-23 04:29:11'),
	(12, 1, 6, 6, 1, '2024-02-23 04:29:11', '2024-02-23 04:29:11'),
	(13, 1, 6, 11, 2, '2024-02-23 04:29:11', '2024-02-23 04:29:11'),
	(14, 1, 7, 3, 0, '2024-02-23 04:29:15', '2024-02-23 04:29:15'),
	(15, 1, 7, 6, 1, '2024-02-23 04:29:15', '2024-02-23 04:29:15'),
	(16, 1, 7, 11, 2, '2024-02-23 04:29:15', '2024-02-23 04:29:15'),
	(20, 1, 9, 3, 0, '2024-02-23 04:29:18', '2024-02-23 04:29:18'),
	(21, 1, 9, 6, 1, '2024-02-23 04:29:18', '2024-02-23 04:29:18'),
	(22, 1, 9, 11, 2, '2024-02-23 04:29:18', '2024-02-23 04:29:18'),
	(23, 1, 10, 3, 0, '2024-02-23 04:29:19', '2024-02-23 04:29:19'),
	(24, 1, 10, 6, 1, '2024-02-23 04:29:19', '2024-02-23 04:29:19'),
	(25, 1, 10, 11, 2, '2024-02-23 04:29:19', '2024-02-23 04:29:19'),
	(26, 1, 11, 3, 0, '2024-02-23 04:29:21', '2024-02-23 04:29:21'),
	(27, 1, 11, 6, 1, '2024-02-23 04:29:21', '2024-02-23 04:29:21'),
	(28, 1, 11, 11, 2, '2024-02-23 04:29:21', '2024-02-23 04:29:21'),
	(29, 1, 12, 3, 0, '2024-02-23 04:29:26', '2024-02-23 04:29:26'),
	(30, 1, 12, 6, 1, '2024-02-23 04:29:26', '2024-02-23 04:29:26'),
	(31, 1, 12, 11, 2, '2024-02-23 04:29:26', '2024-02-23 04:29:26'),
	(32, 1, 13, 3, 0, '2024-02-23 04:29:31', '2024-02-23 04:29:31'),
	(33, 1, 13, 6, 1, '2024-02-23 04:29:31', '2024-02-23 04:29:31'),
	(34, 1, 13, 11, 2, '2024-02-23 04:29:31', '2024-02-23 04:29:31'),
	(35, 1, 14, 3, 0, '2024-02-23 04:29:32', '2024-02-23 04:29:32'),
	(36, 1, 14, 6, 1, '2024-02-23 04:29:32', '2024-02-23 04:29:32'),
	(37, 1, 14, 11, 2, '2024-02-23 04:29:32', '2024-02-23 04:29:32'),
	(38, 1, 15, 3, 0, '2024-02-23 04:29:33', '2024-02-23 04:29:33'),
	(39, 1, 15, 6, 1, '2024-02-23 04:29:33', '2024-02-23 04:29:33'),
	(40, 1, 15, 11, 2, '2024-02-23 04:29:33', '2024-02-23 04:29:33'),
	(41, 1, 16, 3, 0, '2024-02-23 04:29:34', '2024-02-23 04:29:34'),
	(42, 1, 16, 6, 1, '2024-02-23 04:29:34', '2024-02-23 04:29:34'),
	(43, 1, 16, 11, 2, '2024-02-23 04:29:34', '2024-02-23 04:29:34'),
	(44, 1, 17, 3, 0, '2024-02-23 04:30:44', '2024-02-23 04:30:44'),
	(45, 1, 17, 6, 1, '2024-02-23 04:30:44', '2024-02-23 04:30:44'),
	(46, 1, 17, 11, 2, '2024-02-23 04:30:44', '2024-02-23 04:30:44'),
	(47, 1, 18, 3, 0, '2024-02-23 04:30:44', '2024-02-23 04:30:44'),
	(48, 1, 18, 6, 1, '2024-02-23 04:30:44', '2024-02-23 04:30:44'),
	(49, 1, 18, 11, 2, '2024-02-23 04:30:45', '2024-02-23 04:30:45'),
	(50, 1, 19, 3, 0, '2024-02-23 04:30:45', '2024-02-23 04:30:45'),
	(51, 1, 19, 6, 1, '2024-02-23 04:30:45', '2024-02-23 04:30:45'),
	(52, 1, 19, 11, 2, '2024-02-23 04:30:45', '2024-02-23 04:30:45'),
	(53, 1, 20, 3, 0, '2024-02-23 04:30:47', '2024-02-23 04:30:47'),
	(54, 1, 20, 6, 1, '2024-02-23 04:30:47', '2024-02-23 04:30:47'),
	(55, 1, 20, 11, 2, '2024-02-23 04:30:47', '2024-02-23 04:30:47'),
	(56, 1, 21, 3, 0, '2024-02-23 04:30:48', '2024-02-23 04:30:48'),
	(57, 1, 21, 6, 1, '2024-02-23 04:30:48', '2024-02-23 04:30:48'),
	(58, 1, 21, 11, 2, '2024-02-23 04:30:48', '2024-02-23 04:30:48'),
	(59, 1, 22, 3, 0, '2024-02-23 04:30:48', '2024-02-23 04:30:48'),
	(60, 1, 22, 6, 1, '2024-02-23 04:30:48', '2024-02-23 04:30:48'),
	(61, 1, 22, 11, 2, '2024-02-23 04:30:48', '2024-02-23 04:30:48'),
	(62, 1, 23, 3, 0, '2024-02-23 04:30:49', '2024-02-23 04:30:49'),
	(63, 1, 23, 6, 1, '2024-02-23 04:30:49', '2024-02-23 04:30:49'),
	(64, 1, 23, 11, 2, '2024-02-23 04:30:49', '2024-02-23 04:30:49'),
	(65, 1, 24, 3, 0, '2024-02-23 04:30:50', '2024-02-23 04:30:50'),
	(66, 1, 24, 6, 1, '2024-02-23 04:30:50', '2024-02-23 04:30:50'),
	(67, 1, 24, 11, 2, '2024-02-23 04:30:50', '2024-02-23 04:30:50'),
	(68, 1, 25, 3, 0, '2024-02-23 04:32:25', '2024-02-23 04:32:25'),
	(69, 1, 25, 6, 1, '2024-02-23 04:32:25', '2024-02-23 04:32:25'),
	(70, 1, 25, 11, 2, '2024-02-23 04:32:25', '2024-02-23 04:32:25'),
	(71, 1, 26, 3, 0, '2024-02-23 04:32:27', '2024-02-23 04:32:27'),
	(72, 1, 26, 6, 1, '2024-02-23 04:32:27', '2024-02-23 04:32:27'),
	(73, 1, 26, 11, 2, '2024-02-23 04:32:27', '2024-02-23 04:32:27'),
	(74, 1, 27, 3, 0, '2024-02-23 04:32:27', '2024-02-23 04:32:27'),
	(75, 1, 27, 6, 1, '2024-02-23 04:32:27', '2024-02-23 04:32:27'),
	(76, 1, 27, 11, 2, '2024-02-23 04:32:27', '2024-02-23 04:32:27'),
	(77, 1, 28, 3, 0, '2024-02-23 04:32:28', '2024-02-23 04:32:28'),
	(78, 1, 28, 6, 1, '2024-02-23 04:32:28', '2024-02-23 04:32:28'),
	(79, 1, 28, 11, 2, '2024-02-23 04:32:28', '2024-02-23 04:32:28'),
	(80, 1, 29, 3, 0, '2024-02-23 04:32:28', '2024-02-23 04:32:28'),
	(81, 1, 29, 6, 1, '2024-02-23 04:32:28', '2024-02-23 04:32:28'),
	(82, 1, 29, 11, 2, '2024-02-23 04:32:28', '2024-02-23 04:32:28'),
	(83, 1, 30, 3, 0, '2024-02-23 04:32:29', '2024-02-23 04:32:29'),
	(84, 1, 30, 6, 1, '2024-02-23 04:32:29', '2024-02-23 04:32:29'),
	(85, 1, 30, 11, 2, '2024-02-23 04:32:29', '2024-02-23 04:32:29'),
	(86, 1, 31, 3, 0, '2024-02-23 04:32:29', '2024-02-23 04:32:29'),
	(87, 1, 31, 6, 1, '2024-02-23 04:32:29', '2024-02-23 04:32:29'),
	(88, 1, 31, 11, 2, '2024-02-23 04:32:29', '2024-02-23 04:32:29'),
	(89, 1, 32, 3, 0, '2024-02-23 04:32:30', '2024-02-23 04:32:30'),
	(90, 1, 32, 6, 1, '2024-02-23 04:32:30', '2024-02-23 04:32:30'),
	(91, 1, 32, 11, 2, '2024-02-23 04:32:30', '2024-02-23 04:32:30'),
	(92, 1, 33, 4, 0, '2024-02-23 04:52:18', '2024-02-23 04:52:18'),
	(93, 1, 33, 3, 1, '2024-02-23 04:52:18', '2024-02-23 04:52:18'),
	(94, 1, 34, 1, 0, '2024-02-23 04:56:24', '2024-02-23 04:56:24'),
	(95, 1, 34, 7, 1, '2024-02-23 04:56:24', '2024-02-23 04:56:24'),
	(96, 1, 34, 2, 2, '2024-02-23 04:56:24', '2024-02-23 04:56:24'),
	(97, 1, 35, 1, 0, '2024-02-23 07:55:29', '2024-02-23 07:55:29'),
	(98, 1, 35, 5, 1, '2024-02-23 07:55:29', '2024-02-23 07:55:29'),
	(99, 1, 35, 2, 2, '2024-02-23 07:55:29', '2024-02-23 07:55:29'),
	(100, 1, 35, 3, 3, '2024-02-23 07:55:29', '2024-02-23 07:55:29'),
	(101, 1, 36, 1, 0, '2024-02-23 07:58:09', '2024-02-23 07:58:09'),
	(102, 1, 36, 5, 1, '2024-02-23 07:58:09', '2024-02-23 07:58:09'),
	(103, 1, 36, 2, 2, '2024-02-23 07:58:09', '2024-02-23 07:58:09'),
	(104, 1, 36, 7, 3, '2024-02-23 07:58:09', '2024-02-23 07:58:09'),
	(105, 1, 36, 3, 4, '2024-02-23 07:58:09', '2024-02-23 07:58:09'),
	(106, 1, 37, 9, 0, '2024-02-23 07:59:19', '2024-02-23 07:59:19'),
	(107, 1, 37, 2, 1, '2024-02-23 07:59:19', '2024-02-23 07:59:19'),
	(108, 1, 37, 3, 2, '2024-02-23 07:59:19', '2024-02-23 07:59:19'),
	(109, 1, 37, 4, 3, '2024-02-23 07:59:19', '2024-02-23 07:59:19'),
	(110, 1, 37, 16, 4, '2024-02-23 07:59:19', '2024-02-23 07:59:19'),
	(111, 1, 38, 1, 0, '2024-02-23 09:06:40', '2024-02-23 09:06:40'),
	(112, 1, 38, 5, 1, '2024-02-23 09:06:40', '2024-02-23 09:06:40'),
	(113, 1, 38, 19, 2, '2024-02-23 09:06:40', '2024-02-23 09:06:40'),
	(114, 1, 38, 11, 3, '2024-02-23 09:06:40', '2024-02-23 09:06:40'),
	(115, 1, 39, 1, 0, '2024-02-23 09:07:20', '2024-02-23 09:07:20'),
	(116, 1, 39, 5, 1, '2024-02-23 09:07:20', '2024-02-23 09:07:20'),
	(117, 1, 39, 19, 2, '2024-02-23 09:07:20', '2024-02-23 09:07:20'),
	(118, 1, 39, 21, 3, '2024-02-23 09:07:20', '2024-02-23 09:07:20'),
	(119, 1, 40, 1, 0, '2024-02-23 09:08:35', '2024-02-23 09:08:35'),
	(120, 1, 40, 1, 1, '2024-02-23 09:08:35', '2024-02-23 09:08:35'),
	(121, 1, 40, 5, 2, '2024-02-23 09:08:35', '2024-02-23 09:08:35'),
	(122, 1, 40, 19, 3, '2024-02-23 09:08:35', '2024-02-23 09:08:35'),
	(123, 1, 40, 4, 4, '2024-02-23 09:08:35', '2024-02-23 09:08:35'),
	(124, 1, 41, 1, 0, '2024-02-23 09:10:41', '2024-02-23 09:10:41'),
	(125, 1, 41, 5, 1, '2024-02-23 09:10:41', '2024-02-23 09:10:41'),
	(126, 1, 41, 19, 2, '2024-02-23 09:10:41', '2024-02-23 09:10:41'),
	(127, 1, 41, 11, 3, '2024-02-23 09:10:41', '2024-02-23 09:10:41'),
	(128, 1, 42, 1, 0, '2024-02-24 09:35:10', '2024-02-24 09:35:10'),
	(129, 1, 42, 19, 1, '2024-02-24 09:35:10', '2024-02-24 09:35:10'),
	(130, 1, 42, 20, 2, '2024-02-24 09:35:10', '2024-02-24 09:35:10'),
	(131, 1, 42, 39, 3, '2024-02-24 09:35:10', '2024-02-24 09:35:10'),
	(132, 1, 42, 38, 4, '2024-02-24 09:35:10', '2024-02-24 09:35:10'),
	(133, 1, 43, 1, 0, '2024-02-24 11:22:19', '2024-02-24 11:22:19'),
	(134, 1, 43, 5, 1, '2024-02-24 11:22:19', '2024-02-24 11:22:19'),
	(135, 1, 43, 2, 2, '2024-02-24 11:22:19', '2024-02-24 11:22:19'),
	(136, 1, 43, 13, 3, '2024-02-24 11:22:19', '2024-02-24 11:22:19'),
	(137, 1, 43, 14, 4, '2024-02-24 11:22:19', '2024-02-24 11:22:19'),
	(138, 1, 44, 5, 0, '2024-02-24 11:25:32', '2024-02-24 11:25:32'),
	(139, 1, 44, 1, 1, '2024-02-24 11:25:32', '2024-02-24 11:25:32'),
	(140, 1, 45, 1, 0, '2024-02-24 11:27:58', '2024-02-24 11:27:58'),
	(141, 1, 45, 5, 1, '2024-02-24 11:27:58', '2024-02-24 11:27:58'),
	(142, 1, 46, 9, 0, '2024-02-24 11:29:24', '2024-02-24 11:29:24'),
	(143, 1, 46, 10, 1, '2024-02-24 11:29:24', '2024-02-24 11:29:24'),
	(144, 1, 46, 2, 2, '2024-02-24 11:29:24', '2024-02-24 11:29:24'),
	(145, 1, 46, 4, 3, '2024-02-24 11:29:24', '2024-02-24 11:29:24'),
	(146, 1, 46, 11, 4, '2024-02-24 11:29:24', '2024-02-24 11:29:24'),
	(147, 1, 47, 5, 0, '2024-02-24 11:31:06', '2024-02-24 11:31:06'),
	(148, 1, 47, 6, 1, '2024-02-24 11:31:06', '2024-02-24 11:31:06'),
	(149, 1, 47, 9, 2, '2024-02-24 11:31:06', '2024-02-24 11:31:06'),
	(150, 1, 47, 10, 3, '2024-02-24 11:31:06', '2024-02-24 11:31:06'),
	(151, 1, 47, 12, 4, '2024-02-24 11:31:06', '2024-02-24 11:31:06'),
	(152, 1, 48, 8, 0, '2024-02-24 11:31:28', '2024-02-24 11:31:28'),
	(153, 1, 48, 13, 1, '2024-02-24 11:31:28', '2024-02-24 11:31:28'),
	(154, 1, 48, 14, 2, '2024-02-24 11:31:28', '2024-02-24 11:31:28'),
	(155, 1, 48, 17, 3, '2024-02-24 11:31:28', '2024-02-24 11:31:28'),
	(156, 1, 48, 18, 4, '2024-02-24 11:31:28', '2024-02-24 11:31:28'),
	(157, 1, 49, 3, 0, '2024-02-24 11:32:15', '2024-02-24 11:32:15'),
	(158, 1, 49, 1, 1, '2024-02-24 11:32:15', '2024-02-24 11:32:15'),
	(159, 1, 49, 8, 2, '2024-02-24 11:32:15', '2024-02-24 11:32:15'),
	(160, 1, 49, 26, 3, '2024-02-24 11:32:15', '2024-02-24 11:32:15'),
	(161, 1, 49, 29, 4, '2024-02-24 11:32:15', '2024-02-24 11:32:15'),
	(162, 1, 50, 1, 0, '2024-02-24 11:38:33', '2024-02-24 11:38:33'),
	(163, 1, 51, 1, 0, '2024-02-24 11:39:13', '2024-02-24 11:39:13'),
	(164, 1, 51, 5, 1, '2024-02-24 11:39:13', '2024-02-24 11:39:13'),
	(165, 1, 51, 6, 2, '2024-02-24 11:39:13', '2024-02-24 11:39:13'),
	(166, 1, 51, 4, 3, '2024-02-24 11:39:13', '2024-02-24 11:39:13'),
	(167, 1, 51, 11, 4, '2024-02-24 11:39:13', '2024-02-24 11:39:13'),
	(168, 1, 52, 1, 0, '2024-02-24 11:43:53', '2024-02-24 11:43:53'),
	(169, 1, 52, 5, 1, '2024-02-24 11:43:53', '2024-02-24 11:43:53'),
	(170, 1, 52, 6, 2, '2024-02-24 11:43:53', '2024-02-24 11:43:53'),
	(171, 1, 52, 7, 3, '2024-02-24 11:43:53', '2024-02-24 11:43:53'),
	(172, 1, 52, 4, 4, '2024-02-24 11:43:53', '2024-02-24 11:43:53'),
	(173, 1, 53, 1, 0, '2024-02-24 11:47:46', '2024-02-24 11:47:46'),
	(174, 1, 53, 5, 1, '2024-02-24 11:47:46', '2024-02-24 11:47:46'),
	(175, 1, 54, 1, 0, '2024-02-24 11:48:12', '2024-02-24 11:48:12'),
	(176, 1, 54, 5, 1, '2024-02-24 11:48:12', '2024-02-24 11:48:12'),
	(177, 1, 54, 6, 2, '2024-02-24 11:48:12', '2024-02-24 11:48:12'),
	(178, 1, 54, 2, 3, '2024-02-24 11:48:12', '2024-02-24 11:48:12'),
	(179, 1, 54, 3, 4, '2024-02-24 11:48:12', '2024-02-24 11:48:12'),
	(185, 1, 56, 1, 0, '2024-02-24 11:52:09', '2024-02-24 11:52:09'),
	(186, 1, 56, 5, 1, '2024-02-24 11:52:09', '2024-02-24 11:52:09'),
	(187, 1, 56, 2, 2, '2024-02-24 11:52:09', '2024-02-24 11:52:09'),
	(188, 1, 56, 7, 3, '2024-02-24 11:52:09', '2024-02-24 11:52:09'),
	(189, 1, 56, 3, 4, '2024-02-24 11:52:09', '2024-02-24 11:52:09'),
	(222, 1, 55, 11, 0, '2024-02-24 19:17:11', '2024-02-24 19:17:11'),
	(223, 1, 55, 16, 1, '2024-02-24 19:17:11', '2024-02-24 19:17:11'),
	(224, 1, 55, 29, 2, '2024-02-24 19:17:11', '2024-02-24 19:17:11'),
	(225, 1, 55, 30, 3, '2024-02-24 19:17:11', '2024-02-24 19:17:11'),
	(226, 1, 55, 31, 4, '2024-02-24 19:17:11', '2024-02-24 19:17:11'),
	(232, 1, 8, 3, 0, '2024-02-26 16:50:52', '2024-02-26 16:50:52'),
	(233, 1, 8, 6, 1, '2024-02-26 16:50:52', '2024-02-26 16:50:52'),
	(234, 1, 8, 11, 2, '2024-02-26 16:50:52', '2024-02-26 16:50:52'),
	(241, 15, 62, 1, 0, '2024-02-26 17:12:19', '2024-02-26 17:12:19'),
	(242, 15, 62, 5, 1, '2024-02-26 17:12:19', '2024-02-26 17:12:19'),
	(243, 15, 62, 2, 2, '2024-02-26 17:12:19', '2024-02-26 17:12:19'),
	(244, 15, 62, 3, 3, '2024-02-26 17:12:19', '2024-02-26 17:12:19'),
	(245, 15, 63, 1, 0, '2024-02-26 17:12:31', '2024-02-26 17:12:31'),
	(246, 15, 63, 5, 1, '2024-02-26 17:12:31', '2024-02-26 17:12:31'),
	(247, 15, 63, 2, 2, '2024-02-26 17:12:31', '2024-02-26 17:12:31'),
	(248, 15, 63, 4, 3, '2024-02-26 17:12:31', '2024-02-26 17:12:31'),
	(252, 15, 64, 1, 0, '2024-02-26 17:14:02', '2024-02-26 17:14:02'),
	(253, 15, 64, 2, 1, '2024-02-26 17:14:02', '2024-02-26 17:14:02'),
	(254, 15, 64, 4, 2, '2024-02-26 17:14:02', '2024-02-26 17:14:02');

-- Dumping structure for table linebot.content_keywords
CREATE TABLE IF NOT EXISTS `content_keywords` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `content_id` bigint(20) unsigned NOT NULL,
  `keyword_id` bigint(20) unsigned NOT NULL,
  `sequence` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `content_keywords_user_id_foreign` (`user_id`),
  KEY `content_keywords_content_id_foreign` (`content_id`),
  KEY `content_keywords_keyword_id_foreign` (`keyword_id`),
  CONSTRAINT `content_keywords_content_id_foreign` FOREIGN KEY (`content_id`) REFERENCES `contents` (`id`) ON DELETE CASCADE,
  CONSTRAINT `content_keywords_keyword_id_foreign` FOREIGN KEY (`keyword_id`) REFERENCES `keywords` (`id`) ON DELETE CASCADE,
  CONSTRAINT `content_keywords_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table linebot.content_keywords: ~0 rows (approximately)

-- Dumping structure for table linebot.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table linebot.failed_jobs: ~0 rows (approximately)

-- Dumping structure for table linebot.interaction_logs
CREATE TABLE IF NOT EXISTS `interaction_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `action_type` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `interaction_logs_user_id_foreign` (`user_id`),
  CONSTRAINT `interaction_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table linebot.interaction_logs: ~0 rows (approximately)

-- Dumping structure for table linebot.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table linebot.jobs: ~0 rows (approximately)

-- Dumping structure for table linebot.keywords
CREATE TABLE IF NOT EXISTS `keywords` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `keyword` varchar(255) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `create_id` bigint(20) unsigned NOT NULL,
  `update_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `keywords_user_id_foreign` (`user_id`),
  KEY `keywords_create_id_foreign` (`create_id`),
  KEY `keywords_update_id_foreign` (`update_id`),
  CONSTRAINT `keywords_create_id_foreign` FOREIGN KEY (`create_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `keywords_update_id_foreign` FOREIGN KEY (`update_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `keywords_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table linebot.keywords: ~0 rows (approximately)

-- Dumping structure for table linebot.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table linebot.migrations: ~14 rows (approximately)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2019_08_19_000000_create_failed_jobs_table', 1),
	(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(5, '2024_02_04_062034_create_admins_table', 1),
	(6, '2024_02_04_103740_create_channels_table', 1),
	(7, '2024_02_04_103907_create_channel_statisticals_table', 1),
	(8, '2024_02_04_104001_create_interaction_logs_table', 1),
	(9, '2024_02_04_104024_create_contents_table', 1),
	(10, '2024_02_04_104049_create_broadcasts_table', 1),
	(11, '2024_02_04_104112_create_content_broadcasts_table', 1),
	(12, '2024_02_04_104140_create_keywords_table', 1),
	(13, '2024_02_04_104201_create_content_keywords_table', 1),
	(14, '2024_02_06_110318_create_jobs_table', 1);

-- Dumping structure for table linebot.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table linebot.password_resets: ~1 rows (approximately)
INSERT INTO `password_resets` (`id`, `email`, `token`, `role`, `created_at`, `updated_at`) VALUES
	(1, 'thanh@yopmail.com', 'SNv19nPcrX4mqPzk89mQopqmTWosbekj', 'user', '2024-02-23 04:57:59', '2024-02-23 04:57:59');

-- Dumping structure for table linebot.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table linebot.personal_access_tokens: ~0 rows (approximately)

-- Dumping structure for table linebot.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `line_user_id` varchar(255) NOT NULL,
  `channel_id` bigint(20) unsigned DEFAULT NULL,
  `role` varchar(255) NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT 0,
  `is_block` tinyint(1) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `token_verify_email` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_line_user_id_unique` (`line_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table linebot.users: ~15 rows (approximately)
INSERT INTO `users` (`id`, `email`, `password`, `line_user_id`, `channel_id`, `role`, `is_delete`, `is_block`, `name`, `avatar`, `phone`, `address`, `gender`, `date_of_birth`, `token_verify_email`, `email_verified_at`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'nguyenvanmanh2001it1@gmail.com', '$2y$10$VnjO2bDsToSvR7PQItGdO.1Z5hrc2w.7NURWzjrKM3yJvqvh9J.US', 'Uabbdf767ca03c8f12c579a312728b34a', 1, 'manager', 0, 0, 'Nguyễn Văn Mạnh', 'https://res.cloudinary.com/dzve8benj/image/upload/v1708775803/avatars/evmxct8bvxkhmdjyensi.jpg', '0971404372', 'Phú Đa - Phú Vang - TT Huế', 0, '2001-08-29', NULL, '2024-02-23 01:07:40', NULL, '2024-02-23 01:07:40', '2024-02-24 11:56:44'),
	(2, 'nguyenvanmanh.it1@yopmail.com', '$2y$10$rOgduhM0b1CJ/pE6XrVBA.Y7vyyDSJF6k3We40c2kpvpbvLFlRaCq', 'U667ca434abb5753fd28330c0441c7c78', 2, 'manager', 0, 0, 'Nhật Minh', NULL, '01236000333', '120 Nguyễn Lương Bằng - Liên Chiểu - Đà Nẵng', 0, '2001-09-29', NULL, '2024-02-23 01:07:40', NULL, '2024-02-23 01:07:40', '2024-02-23 01:07:40'),
	(3, 'thuyennguyen020517@gmail.com', '$2y$10$N04Dep/QzFhgSPFp/jFt0OnouqfMW/LE7vEKFYYRAyYWsTQjnQMB2', 'Ufe280b00e1515db87b977ef3101fb5a2', 3, 'manager', 0, 0, 'Thu Thuyên', 'https://res.cloudinary.com/dzve8benj/image/upload/v1708652219/avatars/fzfvgwzt1tsngfewaqoy.jpg', '0372545069', 'Hòa Khánh Bắc, Liên Chiểu, Đà Nẵng', 0, '2002-05-17', NULL, '2024-02-23 01:20:15', NULL, '2024-02-23 01:20:15', '2024-02-23 08:53:15'),
	(4, 'hoangngoc@yopmail.com', '$2y$10$DJquTAY65I1i8dAgf0h7heRE3TlQe9bkEhI3U6B5hILq4t1UE1FuO', 'a8d1a51a231d543515sASadas4d1s', 4, 'manager', 0, 0, 'Nguyễn Hoàng Ngọc', NULL, NULL, NULL, NULL, NULL, NULL, '2024-02-23 01:26:05', NULL, '2024-02-23 01:26:05', '2024-02-23 08:53:15'),
	(5, 'phucdo@yopmail.com', '$2y$10$E8i61d9IdDP5Yg692dgD5eHt/p5lqn0FMzMmfWyhQUM6m0gMzS18e', '5f2df54f2g1551x525fF5FD5ddd21dfxsf', 5, 'manager', 0, 0, 'Đỗ Hữu Phúc', NULL, NULL, NULL, NULL, NULL, NULL, '2024-02-23 01:28:16', NULL, '2024-02-23 01:28:16', '2024-02-23 08:53:15'),
	(6, 'anhnguyen@yopmail.com', '$2y$10$0AFRt1rLYmg85sddyZAT3ucILHUVBZcuSu4yH784AL1Uu9RWXgIMS', '5254d54szd1dsdads5f2x5sdda52sd5s', 6, 'manager', 0, 0, 'Phương Anh', NULL, NULL, NULL, NULL, NULL, NULL, '2024-02-23 01:29:37', NULL, '2024-02-23 01:29:37', '2024-02-23 08:53:15'),
	(7, 'haole@yopmail.com', '$2y$10$UfFGbokdhwtA.SBbdnusPOT8RG6vhfqNP3cjYNM44bPu8qTbtvh3q', '52fg5dszxd55fv3x2c89879cxzvxc65xc', 7, 'manager', 0, 0, 'Le Van Hao', NULL, NULL, NULL, NULL, NULL, NULL, '2024-02-23 01:31:15', NULL, '2024-02-23 01:31:15', '2024-02-23 08:53:23'),
	(8, 'thuyennguyen@yopmail.com', '$2y$10$CC3Uf3GZHBFXRnGq8mVT2OuP6PdzQ9aIiEWhChPqsyS1e.rKMGsKa', 'Ufe280b00e1515db87b977ef3101fb5a1', 1, 'user', 0, 0, 'Nguyễn Thị Thu Thuyên', 'https://res.cloudinary.com/dzve8benj/image/upload/v1708656415/avatars/nwvxdbl4q1sgjw5ineoi.jpg', '0372545069', 'Hòa Khánh Bắc, Liên Chiểu, Đà Nẵng', 0, '2002-05-17', NULL, '2024-02-23 01:53:31', NULL, '2024-02-23 01:53:31', '2024-02-23 02:46:56'),
	(9, 'vanmanh.dut@gmail.com', '$2y$10$TLFycwEjE6CqFxN.CiYoj.pcvNtftliMsL8CAKwX5X1KQUGZq0CmW', 'Ue3e781ea96e69812fa3618f742bb2482', 1, 'user', 0, 0, 'Văn Mạnh PRO', NULL, NULL, NULL, NULL, NULL, NULL, '2024-02-22 11:54:28', NULL, '2024-02-23 01:54:28', '2024-02-23 02:24:29'),
	(10, 'thuytrang@yopmail.com', '$2y$10$u9XbmkWVsqzIZ0mFK8hpTugn0ve1JgTiaB1tn2/ouCSLUATm/kedC', 'kj88f7521vdf5gsdf421d54fsdgf', 1, 'user', 0, 0, 'Nguyễn Thị Thùy Trang', 'https://res.cloudinary.com/dzve8benj/image/upload/v1708674616/avatars/eapvldysdlus8fxujwga.png', '037111111', 'Đà Nẵng', 0, '2024-02-15', NULL, '2024-02-22 18:55:36', NULL, '2024-02-23 01:55:36', '2024-02-23 07:50:16'),
	(11, 'thanh@yopmail.com', '$2y$10$nsvh2LFmLyPp7/NbP02CVuP6Jk6WgzHBrxG..H2j9Lt1UaqUUQUue', '8a7fas6fcazs351cas4d6asf421xax', 1, 'user', 0, 0, 'Thành Nguyễn', 'https://res.cloudinary.com/dzve8benj/image/upload/v1708664371/avatars/dl7ihklarwbe7t73juah.jpg', '0394086123', 'Thừa Thiên Huế', 1, '2002-03-12', NULL, '2024-02-23 01:56:28', NULL, '2024-02-23 01:56:28', '2024-02-23 04:59:31'),
	(12, 'levanhao@yopmail.com', '$2y$10$K1c/8VpxUX8dRQuc/UNVM.mwxhCLarmQIZQEDx5pH29bwxRHF2eDi', '54df84gs51fsz3d2r86e7873z2x1cc', 1, 'user', 0, 0, 'Lê Văn Hào', 'https://res.cloudinary.com/dzve8benj/image/upload/v1708674301/avatars/cft1m0npqsgbuceuratk.jpg', '0372545067', 'Đà Nẵng', 1, '2002-02-01', NULL, '2024-02-23 01:57:31', NULL, '2024-02-23 01:57:31', '2024-02-23 07:45:02'),
	(13, 'anh@yopmail.com', '$2y$10$CdhbCfu8qVb9nryuKNdGR.zCJG1ZpyHz5C.qabhiyDVa8K/bUL4Gi', 'sdf584szd1cz2x1cs5d84fsd8z32x00z', 1, 'user', 0, 0, 'Nguyễn Công Phương Anh', 'https://res.cloudinary.com/dzve8benj/image/upload/v1708664087/avatars/nizfasqbv6tixhnx8fti.jpg', '0123456789', 'Da Nang', 1, '2002-06-25', NULL, '2024-02-23 01:58:39', NULL, '2024-02-23 01:58:39', '2024-02-23 04:54:47'),
	(14, 'huonggiang@yopmail.com', '$2y$10$d981gWT1zdriDF7CwoiLj.l0pdAzXJ46pCS2wr.ElySvCXC8rso6O', 'sdvbvfdbfdbfdbfbdfbdfbfdbdfdf', 1, 'user', 0, 0, 'Trương Ngọc Hương Giang', 'https://res.cloudinary.com/dzve8benj/image/upload/v1708674815/avatars/biazrbco9svelaqpx3wz.jpg', '01236000333', 'Phú Đa - Phú Vang - TT Huế', 0, '2002-11-11', NULL, '2024-02-23 07:52:02', NULL, '2024-02-23 07:52:02', '2024-02-23 07:53:34'),
	(15, 'congcuong2@yopmail.com', '$2y$10$VnjO2bDsToSvR7PQItGdO.1Z5hrc2w.7NURWzjrKM3yJvqvh9J.US', 'dvdsvdsvsdvsdvsdvsdvddvddvdvv', 1, 'user', 0, 0, 'Cong Cuong', 'https://res.cloudinary.com/dzve8benj/image/upload/v1708967630/avatars/na15lkm9fbuewwnbp0pj.jpg', '01236000333', 'Tam Ky - Quang Nam', 1, '2002-11-11', NULL, '2024-02-23 01:58:40', NULL, '2024-02-23 08:58:40', '2024-02-26 17:13:51');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
