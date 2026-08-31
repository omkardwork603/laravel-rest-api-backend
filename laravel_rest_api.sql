-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 31, 2026 at 02:15 PM
-- Server version: 8.4.7
-- PHP Version: 8.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel_rest_api`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Electronics', 'Electronic Mobiless', '2026-08-16 00:31:18', '2026-08-16 00:33:21'),
(2, 'Electronicsds', 'Electronic itemsds', '2026-08-16 00:37:29', '2026-08-16 00:37:29'),
(3, 'Electronics', 'Electronic items', '2026-08-16 00:38:09', '2026-08-16 00:38:09'),
(7, 'Food', 'Food and beverages', '2026-08-16 00:44:13', '2026-08-16 00:44:13');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_08_15_073955_create_personal_access_tokens_table', 1),
(5, '2026_08_15_075517_create_categories_table', 1),
(6, '2026_08_15_111610_create_products_table', 1),
(7, '2026_08_15_121819_create_orders_table', 2),
(8, '2026_08_15_121825_create_order_items_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `status` enum('pending','processing','completed','cancelled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_user_id_foreign` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `total_amount`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 1500.00, 'pending', '2026-08-16 01:20:24', '2026-08-16 01:20:24'),
(2, 2, 1600.00, 'pending', '2026-08-16 01:21:18', '2026-08-16 01:21:18'),
(3, 2, 1600.00, 'pending', '2026-08-16 01:28:09', '2026-08-16 01:28:09');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
CREATE TABLE IF NOT EXISTS `order_items` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `quantity` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_items_order_id_foreign` (`order_id`),
  KEY `order_items_product_id_foreign` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  KEY `personal_access_tokens_expires_at_index` (`expires_at`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'api-token', '8f1a52b714a3b07002ee3db746569f0d9594ed133196112eefddf06c217f879d', '[\"*\"]', NULL, NULL, '2026-08-15 11:02:21', '2026-08-15 11:02:21'),
(2, 'App\\Models\\User', 1, 'api-token', '11cca210172e8187ed6fb0b090db96feb4522fd7616ed3e3d103c1ab7f615b9b', '[\"*\"]', '2026-08-15 22:44:44', NULL, '2026-08-15 11:13:24', '2026-08-15 22:44:44'),
(3, 'App\\Models\\User', 1, 'api-token', 'a3e4190673c53a8cba583377f9b7e3a7e8853c46c6656c3e23e33aa94d5c75b3', '[\"*\"]', NULL, NULL, '2026-08-15 12:53:49', '2026-08-15 12:53:49'),
(4, 'App\\Models\\User', 1, 'api-token', 'b1f0a116365ea45625365864aff2a266781f9817262e0ebf1b0494f82c7792d7', '[\"*\"]', NULL, NULL, '2026-08-15 13:02:11', '2026-08-15 13:02:11'),
(5, 'App\\Models\\User', 1, 'api-token', 'ecaeca6f9278cb89e23b9a4dae8722d450bb366c60110f46d3affe08bf88751a', '[\"*\"]', NULL, NULL, '2026-08-15 13:03:09', '2026-08-15 13:03:09'),
(6, 'App\\Models\\User', 1, 'api-token', 'a0cd6a1584f9fa26b9b36a34416e7cbbf25c809955a9f2330eaa38ddc8f8d6f1', '[\"*\"]', NULL, NULL, '2026-08-15 13:12:22', '2026-08-15 13:12:22'),
(7, 'App\\Models\\User', 1, 'api-token', '6f1f71ab8d5140d74351bd2fb6c7dafe7aa3f144e3d241877e56e88f7eae9f8e', '[\"*\"]', NULL, NULL, '2026-08-15 13:12:36', '2026-08-15 13:12:36'),
(8, 'App\\Models\\User', 1, 'api-token', '58578cabe0ac5c65cfae2f8aae6ebe968d6bf1281f370e3289053a34b7e88bed', '[\"*\"]', NULL, NULL, '2026-08-15 13:14:16', '2026-08-15 13:14:16'),
(9, 'App\\Models\\User', 1, 'api-token', '2b9dfc30d11b4aea14ec56bb1632da76ed16fb37227c11f8e96a254f226da842', '[\"*\"]', NULL, NULL, '2026-08-15 13:14:33', '2026-08-15 13:14:33'),
(10, 'App\\Models\\User', 1, 'api-token', '8bad07a07d0654178c119c4917b719f67b022565682a9b3bdb18566235c293a2', '[\"*\"]', NULL, NULL, '2026-08-15 13:27:15', '2026-08-15 13:27:15'),
(11, 'App\\Models\\User', 1, 'api-token', '7fbdf247e3171b0742493635b3a35a330d5a2504bd5ecb55477bef0301de5004', '[\"*\"]', NULL, NULL, '2026-08-15 13:27:39', '2026-08-15 13:27:39'),
(12, 'App\\Models\\User', 1, 'api-token', '2c0147a8ed527e3389e2bb7ba7bf784d9a793ff0aca2f29c2f33744f9c9fc840', '[\"*\"]', NULL, NULL, '2026-08-15 13:36:19', '2026-08-15 13:36:19'),
(13, 'App\\Models\\User', 1, 'api-token', '3df6a4b790d8da48ac8df756273372ac5f3deafa554d8b4bc73a5b56c7f8f426', '[\"*\"]', NULL, NULL, '2026-08-15 13:50:46', '2026-08-15 13:50:46'),
(14, 'App\\Models\\User', 2, 'api-token', 'c5b842b37101ff221a09d7b16367f80fdf177f6fcd72fde391a88ffda5299d4b', '[\"*\"]', NULL, NULL, '2026-08-15 22:47:52', '2026-08-15 22:47:52'),
(22, 'App\\Models\\User', 2, 'api-token', '69314c3812c211d08403cae8cd415f6b8012923466966d6375733e57a198b159', '[\"*\"]', NULL, NULL, '2026-08-16 01:34:47', '2026-08-16 01:34:47'),
(16, 'App\\Models\\User', 2, 'api-token', '0de3e28be2f9e36bc5834309d26f2e9bceeb16be43082182b4706ba74ea64888', '[\"*\"]', NULL, NULL, '2026-08-15 23:28:30', '2026-08-15 23:28:30'),
(17, 'App\\Models\\User', 2, 'api-token', '490cc4d9da1c6d643e23645ed91e18a66ca922b517ccfea153c0d4575debf1ca', '[\"*\"]', NULL, NULL, '2026-08-16 00:01:15', '2026-08-16 00:01:15'),
(18, 'App\\Models\\User', 2, 'api-token', '675468a1e3e7207d08ba3f516d5d2450bed8d5eab90b18dad7a8d3d313caf2b6', '[\"*\"]', NULL, NULL, '2026-08-16 00:01:28', '2026-08-16 00:01:28'),
(19, 'App\\Models\\User', 2, 'api-token', '106a047a3212f058093c8fe71e81cdae5af0a36eae9942865d5a678714baf843', '[\"*\"]', NULL, NULL, '2026-08-16 00:01:39', '2026-08-16 00:01:39'),
(20, 'App\\Models\\User', 2, 'api-token', '819667dd9f6fa52262df1d4cb29a63aeef82eb064a1f046d00057ad01f5ddfec', '[\"*\"]', NULL, NULL, '2026-08-16 00:05:21', '2026-08-16 00:05:21'),
(21, 'App\\Models\\User', 2, 'api-token', '7e180c8eac3d7c33203831996afa9a0e51bb659ad6c12fdec67045ef0428b102', '[\"*\"]', NULL, NULL, '2026-08-16 00:05:50', '2026-08-16 00:05:50'),
(23, 'App\\Models\\User', 2, 'api-token', 'e29bc217b1cfdc09d07d3075d3d19893949740ad51312beecfcda979cd62f4e8', '[\"*\"]', NULL, NULL, '2026-08-16 01:35:42', '2026-08-16 01:35:42'),
(24, 'App\\Models\\User', 2, 'api-token', '025a621485a734ea71e0de709d19cf0432f3a9c2162189f1e11901dd33005c60', '[\"*\"]', NULL, NULL, '2026-08-16 01:36:26', '2026-08-16 01:36:26'),
(25, 'App\\Models\\User', 2, 'api-token', '110e0a6c6bf62b8963491c1ecd89e0dd140ca36c0f6051cc40ae430626d8d473', '[\"*\"]', NULL, NULL, '2026-08-16 01:38:01', '2026-08-16 01:38:01');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `price` decimal(10,2) NOT NULL,
  `stock` int NOT NULL DEFAULT '0',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_category_id_foreign` (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `description`, `price`, `stock`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, 'iPhone 9', 'atest iPhon', 999.99, 50, NULL, '2026-08-16 00:57:30', '2026-08-16 00:57:30'),
(2, 2, 'iPhone 8', 'atest iPhondssa', 999.99, 50, NULL, '2026-08-16 00:58:07', '2026-08-16 00:58:16'),
(3, 2, 'samsunb 8', 'atest iPhondssa', 999.99, 50, NULL, '2026-08-16 00:58:31', '2026-08-16 00:58:31'),
(4, 3, 'samsunb 8', 'atest iPhondssa', 999.99, 50, NULL, '2026-08-16 00:58:38', '2026-08-16 00:58:38');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('CQVx3nQnxPWCOsNd3yZ6YbHTDwDmnaPn72aE1fzX', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRjZiN0J5b0xVUDF1eVk5MVd1dG1FR2o4RmQxZDdEV0VZNDJxZ1cxbCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1786807751),
('DlChPJe4l1zaoit5p6Y3NCHEOVp3r4abZRlYaqsY', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZUd2RExJaHNLNWxZc01weUx3bXFRNG1mWlJvSDhDbkFmVEdibUNZUiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1786804198),
('5jQ3sMuZ7kbfKuaJ9YEercsSiWJpbBCZHEc48tIh', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSEdjMzdBMklhMEtRdmtYcFQ1a3VkNHFvRFJWdTRIRDlQRjB0aFRrdyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1786804203),
('t2jXn94dTWKMyhcwIUEOaaTVvvGVg6kBL53kL2dt', NULL, '127.0.0.1', 'PostmanRuntime/7.56.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOXpWWFNkbG9yNEdmRFNEdUtidXU5OVdENXMyUXV2bGJuNUg3bHVhNyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1786821167),
('GuWPNC7aWJFroeUxYzTIlFsNdEYfqvUYVXMhPznm', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMVZiZENTN0lNaHJXM1ZNcW1lM0Z1TmR6ZDFGZjJJcERCRTFCOGRrOCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7czo1OiJyb3V0ZSI7czoyNzoiZ2VuZXJhdGVkOjoyZEd4QWtkTzd0dE8zRDdtIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1786817548),
('BkIv2fLBq4YRayF8pemjvwcwbQ1QFIWHakIaE8Wm', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN1k2Zm04dFBkRTVIczFBc3BiUHFxUkx4b0RKcFZtUTluWFRRdWxmayI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7czo1OiJyb3V0ZSI7czoyNzoiZ2VuZXJhdGVkOjoyZEd4QWtkTzd0dE8zRDdtIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1786819058),
('ulzedyRiQnyzTfV9KlwndfHpn7Ao4qyi7Cjuuphu', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVGo5NEtWY3YzM01iS2xjZjZlQTdYQ3RmZmRKQldVQU1JY0RmY3Z6MSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMSI7czo1OiJyb3V0ZSI7czoyNzoiZ2VuZXJhdGVkOjpvWWZvRkhyYVNrWnFweWJ1Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1786821708),
('ZbBlDDKPc75o4X2igiaz9HxsQ5CcYmXNO0Q27V8O', NULL, '192.168.56.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZmxiVjhXTkY4Ymg1TUNkMG9ydHBwbHJZcG4xWHBqcmpHVm84NW84OCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjQ6Imh0dHA6Ly8xOTIuMTY4LjU2LjE6ODAwMCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1786821097),
('rnHbWIwgRbW6YceVFpvn1pjIsqlN5V3z63sX80mF', NULL, '127.0.0.1', 'PostmanRuntime/7.56.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOFYwcW5kWmdycFVnRU05T3NWOE85NUdjTnhRaHFCR1h4amY0SWM1cCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1786823366),
('J95szkk0zm3wPPK003UCgFlLa0Lyy6jzXa4aADOt', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMDNFOFQ4ME9LUURRT2FZczlFNmlIYngzTkplVmFTQ0llb3RvZnFLRyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1786822713),
('pugKW0ixiJBQfD7o5mGbkFWdX7EWqNimpmTTU1mK', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQUk5Tk5yUFFkRkhPRTJ1aDZ0ZERtN2NtenhJRWNRRGpxbFp6d3VpViI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1786852567),
('gQWhpttBBM3So4rmt8AP0nM21bn2tQ6HzASOlT7o', NULL, '127.0.0.1', 'PostmanRuntime/7.56.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUEtPdmdmakJWaE15cEJlUnZieHVmN3o5aVRSUVNQTGFHRWlXdWVjTyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1786856033),
('yyvt4E8pa9Bo1Urr5KKR71RoyJdjM4SNC6Q3ySX3', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUXJnVVhVNldDRWdVdEhtbEdUMHJrQzdYU1FxT2s2WEluZG44bkczTiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1786855365),
('4d43kG2zW14dlON2ebMRwAvoiRy0mweWhO3jfe6E', NULL, '::1', 'PostmanRuntime/7.56.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRmdRQzR4aDlmTExEU21BblJUQU5IUFA4N3IxVmxvM0NuSjc0TmlYQSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjU6Imh0dHA6Ly9sb2NhbGhvc3QvYXBpLWFkdmFuYy1sYXJhdi9sYXJhdmVsLXJlc3QtYXBpLWJhY2tlbmQvcHVibGljIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1786856562),
('lUBp5perMJyJEFneobNH2MNhNU9dd9M0RABdaCyJ', NULL, '127.0.0.1', 'PostmanRuntime/7.56.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieHF1d2tibXBGaG5nQklIZ2w3V3ppODE4bGFzRnpjcDFWUE1lbVdTMyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1786863938),
('9Xuk9ofkDISbw3PzNVn98Ejv9gBNM8snX2arTErB', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibkxEbE9qdjdHS01UNkVNUnB3bUN3cDNib2xIaDJCTEpZR01rRDgwSSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1787926820);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Test', 'omkar@gmail.com', NULL, '$2y$12$Qly.bLISn8nLSmrPWZuXhOP.ggC0krAql/vkmhkxg9YPC.TBY6QzG', NULL, '2026-08-15 11:02:21', '2026-08-15 11:02:21'),
(2, 'vishawork', 'tesdst2@example.com', NULL, '$2y$12$mjfxijeWgZrfyEELN45eGeUJulnoLoR5TnkoRe3dp1Is1bqMpJ5B6', NULL, '2026-08-15 22:47:52', '2026-08-16 00:14:59');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
