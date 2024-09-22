-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
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

-- Dumping structure for table software_architecture.admins
CREATE TABLE IF NOT EXISTS `admins` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token_verify_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admins_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table software_architecture.admins: ~7 rows (approximately)
INSERT INTO `admins` (`id`, `email`, `password`, `name`, `avatar`, `role`, `token_verify_email`, `email_verified_at`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'admin@yopmail.com', '$2y$10$nP8TsD0uLvh.81aaupRE1.hyI2svCzXvYLjVXbdwPmR/HMgAp.dF.', 'admin', 'storage/image/avatars/admins/66f038406082f.jpg', 'manager', NULL, '2024-09-22 08:31:12', NULL, '2024-09-22 08:31:12', '2024-09-22 08:31:12'),
	(2, 'thuyduong9@yopmail.com', '$2y$10$.dxgQNi8u0Zm2O9ZrnXisOsNBce4Va6uOY8yDy3AS326de4vJAg1O', 'Trần Thị Thùy Dương', 'storage/image/avatars/admins/66f0384189e46.jpg', 'superadmin', NULL, '2024-09-22 08:31:13', NULL, '2024-09-22 08:31:13', '2024-09-22 08:31:13'),
	(3, 'myandth99@yopmail.com', '$2y$10$070ltj0d./vASBGGeMeWx.4A9I1QTtNiYTV5UWIXFSgxZdTvskLMG', 'Nguyễn Thị Mỹ An', 'storage/image/avatars/admins/66f03844078df.jpg', 'superadmin', NULL, '2024-09-22 08:31:16', NULL, '2024-09-22 08:31:16', '2024-09-22 08:31:16'),
	(4, 'vanvu999@yopmail.com', '$2y$10$aD0Zl/rKXzHvpA15FOA.ue/qwYxI/L8pxywAoaz3YEUfHYYBGwcrW', 'Trần Văn Vũ', 'storage/image/avatars/admins/66f03845197f1.jpg', 'superadmin', NULL, '2024-09-22 08:31:17', NULL, '2024-09-22 08:31:17', '2024-09-22 08:31:17'),
	(5, 'phanvanhoang99@yopmail.com', '$2y$10$Hgzdu74HW3H6PyWW.M9mP.CaN9rH1l3QeslLENoE1XwlmFta3R80K', 'Phan Văn Hoàng', 'storage/image/avatars/admins/66f0384712970.jpg', 'admin', NULL, '2024-09-22 08:31:19', NULL, '2024-09-22 08:31:19', '2024-09-22 08:31:19'),
	(6, 'nganhim@yopmail.com', '$2y$10$glttRlowL2jdVwxKzVwdneocJF5rJc3dAdThddL8U1chDGurOC0Pu', 'Ngân Hiim', 'storage/image/avatars/admins/66f03847e7230.jpg', 'admin', NULL, '2024-09-22 08:31:19', NULL, '2024-09-22 08:31:19', '2024-09-22 08:31:19'),
	(7, 'kimthi@yopmail.com', '$2y$10$6XVy0s.euufGY5WJCFL4jufatQsx1VjcGPINFT3Lla7dZr//U0mtO', 'Nguyễn Thị Kim Thi', 'storage/image/avatars/admins/66f03849bac7c.jpg', 'admin', NULL, '2024-09-22 08:31:21', NULL, '2024-09-22 08:31:21', '2024-09-22 08:31:21');

-- Dumping structure for table software_architecture.comments
CREATE TABLE IF NOT EXISTS `comments` (
  `comment_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `article_id` bigint unsigned NOT NULL,
  `cmt_reply_id` bigint unsigned DEFAULT NULL,
  `comment_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `comment_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table software_architecture.comments: ~0 rows (approximately)

-- Dumping structure for table software_architecture.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table software_architecture.failed_jobs: ~0 rows (approximately)

-- Dumping structure for table software_architecture.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table software_architecture.migrations: ~0 rows (approximately)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(20, '2014_10_12_000000_create_users_table', 1),
	(21, '2014_10_12_100000_create_password_resets_table', 1),
	(22, '2019_08_19_000000_create_failed_jobs_table', 1),
	(23, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(24, '2023_08_29_093151_create_admins_table', 1),
	(25, '2023_12_30_174949_create_comments_table', 1),
	(26, '2024_09_22_145330_create_products_table', 1);

-- Dumping structure for table software_architecture.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table software_architecture.password_resets: ~0 rows (approximately)

-- Dumping structure for table software_architecture.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table software_architecture.personal_access_tokens: ~0 rows (approximately)

-- Dumping structure for table software_architecture.products
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table software_architecture.products: ~0 rows (approximately)
INSERT INTO `products` (`id`, `name`, `description`, `price`, `created_at`, `updated_at`) VALUES
	(1, 'acb', 'mo ta', 99.00, '2024-09-22 08:31:28', '2024-09-22 08:42:22'),
	(5, 'eaque', 'Sed reprehenderit ea sit aut vitae asperiores dolores.', 408.61, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(6, 'necessitatibus', 'Est ea fugiat quos est voluptas dolor distinctio.', 593.96, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(7, 'rerum', 'Voluptates facilis voluptas temporibus corporis eveniet nam velit.', 359.31, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(8, 'ut', 'Debitis culpa aut qui delectus sunt in.', 101.28, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(9, 'suscipit', 'Sit corporis et aut porro nulla sunt.', 115.24, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(10, 'ipsa', 'Modi quis nihil voluptates voluptas porro corporis odio.', 136.80, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(11, 'aut', 'Facilis dolorem eos omnis inventore ea provident.', 719.82, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(12, 'inventore', 'Illum cum odio accusantium repellendus.', 711.57, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(13, 'pariatur', 'Quasi quidem aut sed autem rerum aut sint.', 926.83, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(14, 'esse', 'At veniam nihil necessitatibus repudiandae et ab.', 499.93, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(15, 'et', 'Deserunt labore cum nihil.', 638.00, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(16, 'totam', 'Quia iure autem nobis magni at velit in.', 881.59, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(17, 'rem', 'Quia magnam voluptate nostrum nam vero illum.', 789.85, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(18, 'et', 'Distinctio in dolore dolor.', 711.11, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(19, 'et', 'Similique deserunt nobis tenetur distinctio sint sed quas.', 70.42, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(20, 'corrupti', 'Necessitatibus optio nisi autem accusantium.', 723.71, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(21, 'dolorem', 'Natus commodi sit dolores eum vero.', 573.34, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(22, 'minima', 'Aperiam nemo sit consequuntur est et excepturi.', 509.38, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(23, 'tenetur', 'Quo quia nemo qui consequatur hic dignissimos qui aspernatur.', 365.78, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(24, 'perspiciatis', 'Laboriosam ratione quibusdam in consequatur reiciendis.', 806.31, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(25, 'sit', 'Magnam debitis quo dolore autem quibusdam.', 324.20, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(26, 'laborum', 'Corrupti est repellat est ipsam.', 389.72, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(27, 'et', 'Ut quia omnis hic incidunt deleniti in omnis.', 232.46, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(28, 'voluptatem', 'Eaque et consequatur repudiandae hic similique rerum.', 239.02, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(29, 'autem', 'Consequatur aliquam corporis consequatur voluptatem harum autem omnis eum.', 676.64, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(30, 'totam', 'Vero cumque expedita nobis molestiae corrupti sit est.', 46.74, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(31, 'molestiae', 'Voluptates mollitia non velit sint dolor.', 567.53, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(32, 'fugiat', 'Magnam nisi quas optio vero at modi.', 14.56, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(33, 'non', 'Qui similique est provident quae cumque maxime ut.', 234.40, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(34, 'provident', 'At est dolore et laboriosam nisi.', 898.72, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(35, 'natus', 'Explicabo eveniet molestiae eos soluta iure.', 141.16, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(36, 'adipisci', 'Deleniti doloribus quis eum est repudiandae voluptatem ad.', 165.66, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(37, 'ut', 'Ipsa sapiente dolores laboriosam aliquid.', 181.12, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(38, 'illo', 'Quisquam fugiat ut magni hic odit.', 900.48, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(39, 'autem', 'Tenetur vitae quia neque optio.', 320.60, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(40, 'cumque', 'Quo ad culpa debitis magnam corrupti nam necessitatibus.', 873.30, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(41, 'quis', 'Enim dignissimos modi maxime enim ipsa.', 841.29, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(42, 'facilis', 'Veniam ea exercitationem nostrum inventore laudantium autem.', 675.89, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(43, 'rem', 'Voluptas dolor nemo deserunt.', 61.06, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(44, 'qui', 'Molestiae sed nobis qui molestiae.', 615.44, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(45, 'facere', 'Consequuntur quisquam ipsum adipisci id odit ex.', 714.17, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(46, 'omnis', 'Neque porro id voluptatibus tempora.', 217.23, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(47, 'deserunt', 'Incidunt praesentium sint maiores omnis.', 349.71, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(48, 'tenetur', 'Rem blanditiis perspiciatis qui quo quia.', 814.38, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(49, 'eum', 'Neque numquam fugit provident sit excepturi ut.', 903.11, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(50, 'incidunt', 'Perferendis cupiditate maxime deleniti molestiae.', 706.20, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(51, 'necessitatibus', 'Possimus id qui molestiae accusamus.', 877.70, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(52, 'sed', 'Distinctio explicabo dolorum similique voluptatem qui.', 959.36, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(53, 'modi', 'Qui repellat repudiandae non animi laborum nostrum omnis.', 228.97, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(54, 'et', 'Commodi ad ea quia eum non fugit vero.', 653.15, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(55, 'et', 'Ipsam omnis veritatis temporibus aperiam.', 104.16, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(56, 'commodi', 'Quisquam sit consequatur similique sint sed in consequuntur et.', 759.31, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(57, 'unde', 'Et itaque assumenda aliquid in reiciendis.', 501.40, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(58, 'recusandae', 'Sint temporibus voluptatibus aut voluptatem voluptate non.', 851.68, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(59, 'sequi', 'Quia expedita impedit laboriosam dolorem quis exercitationem ab.', 332.92, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(60, 'sit', 'Maiores quia voluptas accusamus esse.', 207.89, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(61, 'labore', 'Reiciendis aspernatur et aut.', 346.34, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(62, 'fugiat', 'Quidem omnis earum aut dolor.', 178.29, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(63, 'voluptatibus', 'Provident nam quod repellat deleniti asperiores.', 919.69, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(64, 'nesciunt', 'In vero odio corporis consequatur autem quia.', 635.66, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(65, 'occaecati', 'Et occaecati provident nulla quis.', 169.39, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(66, 'voluptatem', 'Harum nesciunt ut aut dolores possimus expedita nesciunt.', 292.32, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(67, 'dolores', 'Sit molestias totam ipsa sint illo eligendi consequatur consectetur.', 523.43, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(68, 'iste', 'Ea a officiis natus reprehenderit.', 517.50, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(69, 'debitis', 'Natus dolorem velit nemo voluptatem.', 869.57, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(70, 'est', 'Iusto ut sint voluptate perspiciatis maxime ut nihil atque.', 856.47, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(71, 'autem', 'Et quo molestiae consectetur voluptatem.', 552.89, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(72, 'excepturi', 'Dolore est recusandae ipsa quod.', 336.31, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(73, 'rerum', 'Asperiores sapiente veritatis et voluptatem aut tenetur.', 17.49, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(74, 'rerum', 'Dolorem perferendis a quis voluptate qui tempore est.', 959.30, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(75, 'dolorem', 'Reiciendis laborum laborum dolorem alias eos hic.', 604.62, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(76, 'sit', 'Autem vel quis laudantium aut nisi.', 375.85, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(77, 'dicta', 'Fugiat incidunt ad natus quasi.', 644.84, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(78, 'aspernatur', 'Exercitationem vitae et voluptate aut.', 681.45, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(79, 'qui', 'Eveniet et et ut.', 426.00, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(80, 'aliquid', 'Culpa alias aut eos et praesentium doloribus molestiae.', 271.45, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(81, 'adipisci', 'Qui laborum consectetur eveniet nam atque nihil ipsa magni.', 361.07, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(82, 'aut', 'Quia enim pariatur beatae id quo veniam labore.', 29.69, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(83, 'tenetur', 'In laborum sequi eveniet id fugiat ea et est.', 118.79, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(84, 'neque', 'Aut modi et dolores sint.', 680.53, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(85, 'nihil', 'Aut dolore eos unde labore.', 303.44, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(86, 'nisi', 'Perferendis laudantium natus alias animi eius aut aspernatur.', 418.64, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(87, 'quis', 'Qui commodi voluptas ut.', 712.07, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(88, 'quia', 'Dolorem eaque est praesentium voluptate labore ut sit.', 198.22, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(89, 'minus', 'Ab sed vel et quam dolor minima.', 578.63, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(90, 'dolorem', 'Quo rem numquam repudiandae.', 946.05, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(91, 'voluptatem', 'Voluptatem alias deserunt deserunt ducimus et.', 862.25, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(92, 'voluptatem', 'Magni nobis cumque dolor laboriosam aspernatur qui architecto eum.', 268.33, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(93, 'tenetur', 'Ducimus eveniet deserunt maxime quo et dolores.', 472.74, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(94, 'itaque', 'Sapiente tenetur aperiam nobis expedita quia in.', 250.52, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(95, 'rerum', 'Nemo et eveniet beatae et minus quia voluptas.', 509.53, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(96, 'sint', 'Amet est totam enim praesentium.', 664.39, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(97, 'libero', 'Autem possimus officia pariatur atque aliquid corrupti.', 634.35, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(98, 'et', 'Quaerat voluptatem facere odio dolorem nihil id harum.', 96.53, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(99, 'nesciunt', 'Officia qui amet consequatur voluptas tempora nesciunt sed.', 945.30, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(100, 'sequi', 'Aut et sunt animi possimus.', 761.83, '2024-09-22 08:31:28', '2024-09-22 08:31:28'),
	(101, 'acb', 'mo ta', 99.00, '2024-09-22 08:36:29', '2024-09-22 08:36:29');

-- Dumping structure for table software_architecture.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `github_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gitlab_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token_verify_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table software_architecture.users: ~6 rows (approximately)
INSERT INTO `users` (`id`, `email`, `password`, `google_id`, `facebook_id`, `github_id`, `gitlab_id`, `name`, `avatar`, `role`, `token_verify_email`, `email_verified_at`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'hoangphuc@yopmail.com', '$2y$10$J56OcnbsuXPN.KkRGEwy6OCw2Hb7zH7fG44I2NgxIxqEFRqKXuw.W', NULL, NULL, NULL, NULL, 'Nguyễn Văn Hoàng Phúc', 'storage/image/avatars/users/66f0384ac75da.jpg', 'user', NULL, '2024-09-22 08:31:22', NULL, '2024-09-22 08:31:22', '2024-09-22 08:31:22'),
	(2, 'duyentran@yopmail.com', '$2y$10$oGor14T57WYblWpNW9vxKOlS5s4VRh7keIgb1ImOZgYzfserpoSzm', NULL, NULL, NULL, NULL, 'Nguyễn Trần Mỹ Duyên', 'storage/image/avatars/users/66f0384bc009a.jpg', 'user', NULL, '2024-09-22 08:31:23', NULL, '2024-09-22 08:31:23', '2024-09-22 08:31:23'),
	(3, 'benhviengiadinh@yopmail.com', '$2y$10$gOIW/FdFyfnvdNT5tcCTxeJrpeX44YhX8I87qZI/nHKMZIRtL2LWG', NULL, NULL, NULL, NULL, 'Bệnh viện gia đình', 'storage/image/avatars/users/66f0384ce3271.jpg', 'hospital', NULL, '2024-09-22 08:31:24', NULL, '2024-09-22 08:31:24', '2024-09-22 08:31:24'),
	(4, 'benhviendakhoa@yopmail.com', '$2y$10$MJRuz6SrukefclcTcQi0zuXwE3TCXJHHUvkkSEHOpCjfsfuqQQ1M2', NULL, NULL, NULL, NULL, 'Bệnh viện đa khoa', 'storage/image/avatars/users/66f0384e141f6.jpg', 'hospital', NULL, '2024-09-22 08:31:26', NULL, '2024-09-22 08:31:26', '2024-09-22 08:31:26'),
	(5, 'bacsian@yopmail.com', '$2y$10$BU3GTVyzcW4e.PMJUu/gb.TecXUhVe/c/QlS96PEqffjNqmrDT0.6', NULL, NULL, NULL, NULL, 'Bác sĩ Nguyễn Văn An', 'storage/image/avatars/users/66f0384f22d3c.jpg', 'doctor', NULL, '2024-09-22 08:31:27', NULL, '2024-09-22 08:31:27', '2024-09-22 08:31:27'),
	(6, 'bacsilanhuong@yopmail.com', '$2y$10$uNIVKFX3kwzSMHmgLrHhOeqydQyTO6FldCAbEM6X9oU09Q5jCoici', NULL, NULL, NULL, NULL, 'Bác sĩ Nguyễn Lan Hương', 'storage/image/avatars/users/66f0385052df7.jpg', 'doctor', NULL, '2024-09-22 08:31:28', NULL, '2024-09-22 08:31:28', '2024-09-22 08:31:28');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
