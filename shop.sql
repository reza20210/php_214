-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 08, 2018 at 07:39 PM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'reza', 'reza@example.com', '$2y$10$Gkoho102gT2niXU2EQhUNuMJ7LYC81WSS/TZzs0T6/VxoXxAiS7le', 'RKRuyvuLoWnEQBewzlVK8CRJZgmzxk538xBf5hmPPzznn8HMmVFiCxaVB1cO', '2018-12-06 20:07:52', '2018-12-06 20:07:52');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_11_25_184608_create_products_table', 1),
(4, '2018_11_27_121949_create_orders_table', 1),
(5, '2018_11_27_132043_create_order_items_table', 1),
(6, '2018_11_29_163855_create_admin_users_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `date`, `address`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, '2018-12-08 18:29:41', 'Tehran', 1, '2018-12-06 20:07:53', '2018-12-09 02:29:41'),
(2, 1, '2018-12-08 18:29:04', 'Tehran', 1, '2018-12-06 20:07:53', '2018-12-09 02:29:04'),
(3, 2, '2018-12-06 08:00:00', 'Tehran', 1, '2018-12-06 20:07:53', '2018-12-06 20:07:53'),
(7, 1, '2018-12-08 18:16:17', 'tehran', 1, '2018-12-09 01:07:09', '2018-12-09 02:16:17'),
(9, 1, '2018-12-08 18:15:48', 'tehran', 1, '2018-12-09 01:48:08', '2018-12-09 02:15:48'),
(10, 2, '2018-12-08 18:19:52', 'tehran', 1, '2018-12-09 01:51:34', '2018-12-09 02:19:52'),
(11, 2, '2018-12-08 18:21:23', 'tehran', 1, '2018-12-09 02:14:38', '2018-12-09 02:21:23'),
(12, 1, '2018-12-09 02:32:03', 'tehran', 0, '2018-12-09 02:32:03', '2018-12-09 02:32:03');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `quantity`, `price`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 2, 2000.00, '2018-12-06 20:07:53', '2018-12-06 20:07:53'),
(2, 2, 2, 1, 2500.00, '2018-12-06 20:07:53', '2018-12-06 20:07:53'),
(3, 3, 3, 2, 6000.00, '2018-12-06 20:07:53', '2018-12-06 20:07:53'),
(7, 7, 3, 1, 3000.00, '2018-12-09 01:07:09', '2018-12-09 01:07:09'),
(9, 9, 4, 1, 3500.00, '2018-12-09 01:48:08', '2018-12-09 01:48:08'),
(10, 10, 1, 1, 2000.00, '2018-12-09 01:51:34', '2018-12-09 01:51:34'),
(11, 11, 2, 1, 2500.00, '2018-12-09 02:14:38', '2018-12-09 02:14:38'),
(12, 12, 4, 1, 3500.00, '2018-12-09 02:32:03', '2018-12-09 02:32:03');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Xiaomi Mi4', 2000.00, 'This is some text for the Xiaomi Mi4', 'xiaomi-mi4.jpg', '2018-12-06 20:07:53', '2018-12-06 20:07:53'),
(2, 'Xiaomi Mi5', 2500.00, 'This is some text for the Xiaomi Mi5', 'xiaomi-mi5.jpg', '2018-12-06 20:07:53', '2018-12-06 20:07:53'),
(3, 'Xiaomi Mi6', 3000.00, 'This is some text for the Xiaomi Mi6', 'xiaomi-mi6.jpg', '2018-12-06 20:07:53', '2018-12-06 20:07:53'),
(4, 'Xiaomi Mi8', 3500.00, 'This is some text for the Xiaomi Mi8', 'xiaomi-mi8.jpg', '2018-12-06 20:07:53', '2018-12-06 20:07:53');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'ali', 'ali@example.com', NULL, '$2y$10$RuOLzG6G9A/13SYDobYTB.ahKh9emm/RHdk7GKC3/wXgUZJBk9ZP6', 'zHy6AHE3fe050rivmPOun2Ha2a4prPEKeVyJ53pVJEpDfC2hDhb8J3ZOIfYk', '2018-12-06 20:07:53', '2018-12-06 20:07:53'),
(2, 'ahmad', 'ahmad@example.com', NULL, '$2y$10$RuOLzG6G9A/13SYDobYTB.ahKh9emm/RHdk7GKC3/wXgUZJBk9ZP6', 'bMTz2Wp9RuGmqLaB9GiWfZI4pTbVErYOffMmAEsxdzph3vuOd9LRRY3ztfQz', '2018-12-06 20:07:53', '2018-12-06 20:07:53');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_users_email_unique` (`email`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
