-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Дек 27 2022 г., 06:23
-- Версия сервера: 5.7.33
-- Версия PHP: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `example`
--

-- --------------------------------------------------------

--
-- Структура таблицы `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `session_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `good_id` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `enable` tinyint(1) NOT NULL DEFAULT '1',
  `parent` int(11) NOT NULL DEFAULT '0',
  `level` tinyint(4) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `enable`, `parent`, `level`, `position`, `title`, `created_at`, `updated_at`) VALUES
(1, 1, 0, 1, NULL, 'nulla', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(2, 1, 0, 1, NULL, 'doloribus', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(3, 1, 0, 1, NULL, 'distinctio', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(4, 1, 0, 1, NULL, 'sequi', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(5, 1, 0, 1, NULL, 'voluptatum', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(6, 1, 0, 1, NULL, 'corrupti', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(7, 1, 0, 1, NULL, 'nihil', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(8, 1, 0, 1, NULL, 'unde', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(9, 1, 0, 1, NULL, 'sequi', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(10, 1, 0, 1, NULL, 'voluptatem', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(11, 1, 1, 2, NULL, 'itaque', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(12, 1, 1, 2, NULL, 'dolorem', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(13, 1, 1, 2, NULL, 'veniam', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(14, 1, 11, 3, NULL, 'laboriosam', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(15, 1, 11, 3, NULL, 'magni', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(16, 1, 11, 3, NULL, 'vero', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(17, 1, 12, 3, NULL, 'cupiditate', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(18, 1, 13, 3, NULL, 'veniam', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(19, 1, 2, 2, NULL, 'et', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(20, 1, 2, 2, NULL, 'explicabo', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(21, 1, 2, 2, NULL, 'officia', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(22, 1, 19, 3, NULL, 'voluptatibus', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(23, 1, 19, 3, NULL, 'minus', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(24, 1, 19, 3, NULL, 'quo', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(25, 1, 20, 3, NULL, 'est', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(26, 1, 20, 3, NULL, 'expedita', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(27, 1, 21, 3, NULL, 'amet', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(28, 1, 21, 3, NULL, 'et', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(29, 1, 21, 3, NULL, 'sed', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(30, 1, 3, 2, NULL, 'placeat', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(31, 1, 3, 2, NULL, 'enim', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(32, 1, 30, 3, NULL, 'sed', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(33, 1, 30, 3, NULL, 'iusto', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(34, 1, 31, 3, NULL, 'sit', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(35, 1, 31, 3, NULL, 'numquam', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(36, 1, 4, 2, NULL, 'ut', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(37, 1, 4, 2, NULL, 'porro', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(38, 1, 36, 3, NULL, 'aut', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(39, 1, 37, 3, NULL, 'quis', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(40, 1, 37, 3, NULL, 'animi', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(41, 1, 37, 3, NULL, 'tempore', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(42, 1, 5, 2, NULL, 'corrupti', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(43, 1, 5, 2, NULL, 'unde', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(44, 1, 5, 2, NULL, 'enim', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(45, 1, 5, 2, NULL, 'earum', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(46, 1, 42, 3, NULL, 'ad', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(47, 1, 43, 3, NULL, 'iusto', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(48, 1, 43, 3, NULL, 'enim', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(49, 1, 44, 3, NULL, 'repudiandae', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(50, 1, 44, 3, NULL, 'magni', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(51, 1, 44, 3, NULL, 'officia', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(52, 1, 45, 3, NULL, 'molestiae', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(53, 1, 6, 2, NULL, 'et', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(54, 1, 6, 2, NULL, 'animi', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(55, 1, 6, 2, NULL, 'ea', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(56, 1, 6, 2, NULL, 'fugit', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(57, 1, 53, 3, NULL, 'labore', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(58, 1, 53, 3, NULL, 'et', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(59, 1, 54, 3, NULL, 'ex', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(60, 1, 54, 3, NULL, 'quas', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(61, 1, 55, 3, NULL, 'repellendus', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(62, 1, 56, 3, NULL, 'sint', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(63, 1, 56, 3, NULL, 'enim', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(64, 1, 56, 3, NULL, 'vero', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(65, 1, 7, 2, NULL, 'non', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(66, 1, 65, 3, NULL, 'velit', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(67, 1, 65, 3, NULL, 'soluta', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(68, 1, 8, 2, NULL, 'sint', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(69, 1, 8, 2, NULL, 'architecto', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(70, 1, 8, 2, NULL, 'repudiandae', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(71, 1, 8, 2, NULL, 'voluptatem', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(72, 1, 68, 3, NULL, 'ea', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(73, 1, 68, 3, NULL, 'consequatur', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(74, 1, 69, 3, NULL, 'mollitia', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(75, 1, 69, 3, NULL, 'molestias', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(76, 1, 69, 3, NULL, 'qui', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(77, 1, 70, 3, NULL, 'fugiat', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(78, 1, 70, 3, NULL, 'illum', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(79, 1, 71, 3, NULL, 'qui', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(80, 1, 71, 3, NULL, 'dolorem', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(81, 1, 71, 3, NULL, 'autem', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(82, 1, 9, 2, NULL, 'fugit', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(83, 1, 9, 2, NULL, 'doloremque', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(84, 1, 9, 2, NULL, 'modi', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(85, 1, 82, 3, NULL, 'eligendi', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(86, 1, 82, 3, NULL, 'qui', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(87, 1, 83, 3, NULL, 'molestias', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(88, 1, 84, 3, NULL, 'repellendus', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(89, 1, 10, 2, NULL, 'ad', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(90, 1, 10, 2, NULL, 'cupiditate', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(91, 1, 10, 2, NULL, 'consequuntur', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(92, 1, 10, 2, NULL, 'qui', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(93, 1, 10, 2, NULL, 'quos', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(94, 1, 89, 3, NULL, 'enim', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(95, 1, 89, 3, NULL, 'minus', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(96, 1, 90, 3, NULL, 'non', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(97, 1, 90, 3, NULL, 'ea', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(98, 1, 90, 3, NULL, 'accusantium', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(99, 1, 91, 3, NULL, 'in', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(100, 1, 92, 3, NULL, 'ipsam', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(101, 1, 92, 3, NULL, 'vel', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(102, 1, 92, 3, NULL, 'autem', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(103, 1, 93, 3, NULL, 'minus', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(104, 1, 93, 3, NULL, 'omnis', '2022-12-25 20:42:17', '2022-12-25 20:42:17'),
(105, 1, 93, 3, NULL, 'eveniet', '2022-12-25 20:42:17', '2022-12-25 20:42:17');

-- --------------------------------------------------------

--
-- Структура таблицы `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `goods`
--

CREATE TABLE `goods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `enable` tinyint(1) NOT NULL DEFAULT '1',
  `category_id` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `goods`
--

INSERT INTO `goods` (`id`, `enable`, `category_id`, `position`, `title`, `slug`, `desc`, `price`, `discount`, `created_at`, `updated_at`) VALUES
(1, 1, 50, NULL, 'Sint ipsam esse id.', 'sint-ipsam-esse-id', 'Quisquam optio fugiat sit dolor blanditiis dolores. Voluptatibus ex provident expedita et. Sit ipsam quos et et. Eaque velit eveniet optio enim assumenda voluptatem beatae.', '64.35', 0, '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(2, 1, 67, NULL, 'Officia dolorem rerum.', 'officia-dolorem-rerum', 'Voluptatem delectus et voluptas. Earum molestiae dicta dicta doloribus. Enim vel odio et quidem quo. Omnis ipsum qui voluptates placeat soluta accusamus laboriosam.', '1.45', 0, '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(3, 1, 39, NULL, 'Natus laborum numquam et.', 'natus-laborum-numquam-et', 'Voluptas illo ducimus odit tempore pariatur corporis sint. Voluptatem atque quia et. Accusamus hic ratione molestias enim voluptatem voluptatem non.', '16.56', 0, '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(4, 1, 21, NULL, 'Aspernatur est ipsa.', 'aspernatur-est-ipsa', 'Aspernatur et velit consequatur. Dolores beatae ab amet aut. Corrupti sunt minima ullam molestiae distinctio molestiae.', '330776914.92', 0, '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(5, 1, 80, NULL, 'Quod quia repellat.', 'quod-quia-repellat', 'Voluptatibus sunt architecto quaerat nihil quisquam. Molestiae voluptatem quos ex qui eaque sint quidem.', '57306.42', 0, '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(6, 1, 90, NULL, 'Possimus libero perspiciatis eaque.', 'possimus-libero-perspiciatis-eaque', 'Ut illo harum odio neque quae. Perspiciatis eligendi dolores nostrum qui dolores deleniti ut. Ullam doloribus consequatur tempore sit consectetur rem dolor. Rerum ut exercitationem dolor adipisci.', '490903.13', 0, '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(7, 1, 47, NULL, 'Neque magni.', 'neque-magni', 'Aliquid error architecto possimus esse vel quis. Eos ut animi modi eos. Eligendi et corporis ullam sit qui.', '7962222.59', 0, '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(8, 1, 26, NULL, 'Cupiditate laborum magni.', 'cupiditate-laborum-magni', 'Est ab dolore voluptate aspernatur dignissimos. Nobis maxime nam vel ut impedit eligendi adipisci. Exercitationem impedit voluptas eos illo culpa cumque nemo laudantium.', '3.6', 0, '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(9, 1, 56, NULL, 'Quae iusto aliquid blanditiis eos.', 'quae-iusto-aliquid-blanditiis-eos', 'Rerum molestiae vitae alias temporibus. Deserunt autem voluptatem saepe omnis dolore nam. Ea dolorum ut illum odit et repudiandae quisquam.', '48981.85', 0, '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(10, 1, 29, NULL, 'Veritatis eum temporibus omnis.', 'veritatis-eum-temporibus-omnis', 'Qui laboriosam provident sint optio. Expedita accusamus deleniti sed ducimus qui. Qui repellat voluptatem dolores quam in sint. Nesciunt exercitationem quia nisi esse.', '637038.82', 0, '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(11, 1, 97, NULL, 'Numquam est repudiandae.', 'numquam-est-repudiandae', 'Rerum omnis quo dicta voluptate nam. Nihil debitis sed voluptatem voluptatem. Hic ab harum neque. Odio qui hic consequatur sequi quasi non qui. Qui commodi amet recusandae tempora ullam aliquid et.', '305262.79', 0, '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(12, 1, 61, NULL, 'Et possimus nisi.', 'et-possimus-nisi', 'In rem eaque hic non. Et quod est aperiam et rerum tenetur. Molestias soluta aut aperiam incidunt. Veniam maiores sed nobis illum.', '5743.09', 0, '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(13, 1, 63, NULL, 'Dolor rerum enim.', 'dolor-rerum-enim', 'Animi mollitia ut ad sapiente cum delectus. Voluptatum sunt error pariatur excepturi. Culpa non debitis deleniti est vitae eaque. Qui saepe rerum perspiciatis rem nihil culpa qui aut.', '20745204.72', 0, '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(14, 1, 44, NULL, 'Aut asperiores nostrum.', 'aut-asperiores-nostrum', 'Corporis recusandae eum facilis est. Laborum et excepturi est adipisci odio rerum. Quo nihil laboriosam non eum inventore ipsum enim.', '760126.93', 0, '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(15, 1, 102, NULL, 'Aspernatur et nulla.', 'aspernatur-et-nulla', 'Velit occaecati ipsam est et. Atque voluptatem debitis provident. Aut dolorum architecto dolor deserunt.', '0.84', 0, '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(16, 1, 36, NULL, 'Aut praesentium est.', 'aut-praesentium-est', 'Quibusdam ducimus vitae ut. Repellat est quidem optio eaque et. Nihil rerum ut tempore praesentium libero.', '924.12', 0, '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(17, 1, 56, NULL, 'Mollitia accusamus temporibus blanditiis.', 'mollitia-accusamus-temporibus-blanditiis', 'Tempore enim ipsam ipsa enim repudiandae dolores consectetur ex. Veniam itaque qui et. Rerum magnam pariatur iusto animi omnis alias qui qui. Est earum ad quisquam sit eveniet illo voluptate.', '20658.48', 0, '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(18, 1, 91, NULL, 'Consequatur ut eligendi.', 'consequatur-ut-eligendi', 'Earum aliquam maxime et aut sit vitae odio. Omnis illo delectus illo ex aliquam omnis sequi laborum. Magnam facilis possimus et omnis porro earum.', '503999.72', 0, '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(19, 1, 32, NULL, 'At hic delectus sed perspiciatis.', 'at-hic-delectus-sed-perspiciatis', 'Aut nisi dolorum nihil quae vitae optio numquam. Non possimus quae alias ex consequatur et assumenda omnis. Veritatis autem sint voluptatibus quis.', '92.34', 0, '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(20, 1, 9, NULL, 'Enim ut rerum.', 'enim-ut-rerum', 'Maiores qui omnis consequatur nam et nulla neque. Illum quod cumque incidunt. Vitae ut repudiandae numquam cum. Magnam nihil possimus illo vel provident.', '130496958.33', 0, '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(21, 1, 100, NULL, 'Totam excepturi expedita.', 'totam-excepturi-expedita', 'Non vitae aliquid voluptas assumenda similique quisquam et autem. Adipisci autem maxime itaque corporis nesciunt distinctio voluptatem. Odit qui voluptas possimus voluptates.', '41510.68', 0, '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(22, 1, 39, NULL, 'Et quia officiis.', 'et-quia-officiis', 'Iure voluptas sit ullam consequatur ratione. Natus est omnis excepturi nobis ducimus dolorem nostrum. Et sed amet quo possimus. Ea quis dolor rem dolores. Sapiente minus ad soluta et doloremque et.', '1.16', 0, '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(23, 1, 96, NULL, 'Quia ut est et.', 'quia-ut-est-et', 'Nostrum necessitatibus quod et dolorem similique. Possimus pariatur nihil nostrum et perspiciatis magnam. Expedita perspiciatis ipsum alias soluta et temporibus commodi iusto.', '265256832.71', 0, '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(24, 1, 33, NULL, 'Et autem modi.', 'et-autem-modi', 'Sint vero error quo harum consequatur aliquid optio. Dolore enim minima perspiciatis nisi. Commodi eius sed vel neque aliquam corrupti velit. A aut sunt fugiat est ipsa repellendus non.', '239.28', 0, '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(25, 1, 44, NULL, 'Quidem aut ut.', 'quidem-aut-ut', 'Vero fugit tempore provident mollitia magni delectus. Voluptate ullam omnis rerum quaerat blanditiis voluptas molestias. Reprehenderit mollitia velit saepe quia.', '382249.37', 0, '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(26, 1, 26, NULL, 'Possimus ea doloremque quia.', 'possimus-ea-doloremque-quia', 'Sapiente esse iure illo odio possimus. Quaerat ut unde iste reiciendis voluptatem et. Reiciendis et eos molestias.', '334.53', 0, '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(27, 1, 96, NULL, 'Qui nemo soluta non.', 'qui-nemo-soluta-non', 'Quia ut mollitia animi optio excepturi facilis non. Quia voluptatibus sit ut. Quia inventore libero exercitationem.', '2509994.22', 0, '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(28, 1, 85, NULL, 'Est et facilis dolores.', 'est-et-facilis-dolores', 'Magnam odit iure quos iusto illum incidunt qui. Quibusdam velit doloribus eos aut officia.', '4098.94', 0, '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(29, 1, 31, NULL, 'Vitae perferendis et.', 'vitae-perferendis-et', 'Nihil laboriosam ducimus quibusdam quisquam facilis. Laborum omnis numquam dolorem voluptatem aut praesentium assumenda. Cumque est ut at et omnis. Et et quia rerum at quo nam et.', '0.54', 0, '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(30, 1, 42, NULL, 'Ut similique unde.', 'ut-similique-unde', 'Doloribus incidunt voluptatem voluptatem enim consequatur officiis quod. Molestiae earum tenetur animi sed vel. In rerum dolore sequi totam. Quo aut veritatis repudiandae aut iste.', '0.36', 0, '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(31, 1, 51, NULL, 'Unde similique nostrum tempora.', 'unde-similique-nostrum-tempora', 'A qui repellat ratione non iure aut in. Optio esse libero neque delectus sed doloremque ipsa. Rerum ducimus beatae sunt aut.', '2.24', 0, '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(32, 1, 85, NULL, 'Libero ex dolorem consequuntur.', 'libero-ex-dolorem-consequuntur', 'Commodi velit laborum facere perferendis sit. Tenetur id reprehenderit laborum quia deserunt. Aliquid enim beatae aliquam iste rerum sit. Voluptatibus ex error nihil maxime.', '9.62', 0, '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(33, 1, 15, NULL, 'Non velit voluptate.', 'non-velit-voluptate', 'Ut blanditiis velit sed. Sint aut quo delectus quisquam hic. Quisquam sint modi debitis.', '59.35', 0, '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(34, 1, 81, NULL, 'Consequatur et temporibus.', 'consequatur-et-temporibus', 'Illum autem sed amet nostrum voluptatem adipisci nostrum. Est ut eum adipisci nam officia esse ipsum. Amet corporis consequuntur id dolores eius quis sed et.', '60105520.72', 0, '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(35, 1, 92, NULL, 'Similique placeat deserunt.', 'similique-placeat-deserunt', 'Eos sit maxime omnis asperiores id. Voluptatum perspiciatis adipisci et quaerat consectetur dignissimos quia. Corrupti minima vitae et dolorem iure et. Qui dolor doloribus rerum et enim molestias.', '17180427.01', 0, '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(36, 1, 17, NULL, 'Molestiae fugit occaecati eaque.', 'molestiae-fugit-occaecati-eaque', 'Eum quibusdam voluptatum explicabo illo vero perferendis. Ut aliquid vitae praesentium voluptatem est consequatur autem. Numquam excepturi quas et illo non.', '44766.98', 0, '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(37, 1, 27, NULL, 'Ut non ut aliquam.', 'ut-non-ut-aliquam', 'Fugiat dolor sed amet id porro. Ut laboriosam deserunt corrupti vitae quis. Quia sit impedit maxime nihil quis.', '154438558.36', 0, '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(38, 1, 38, NULL, 'Et qui et.', 'et-qui-et', 'Voluptatum eius ut delectus odit adipisci nam recusandae. Est eveniet qui nihil tenetur nihil. Ab dolorum dolorem reprehenderit quis distinctio quia.', '1.38', 0, '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(39, 1, 50, NULL, 'Corporis rerum voluptatum.', 'corporis-rerum-voluptatum', 'Id ut sed voluptatem eum placeat minima quo. Quibusdam possimus quia modi laudantium aliquam distinctio earum expedita. Quos rerum dolore occaecati qui eum error.', '17.45', 0, '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(40, 1, 87, NULL, 'Minus omnis.', 'minus-omnis', 'Voluptatem aut id assumenda dolorem ea. Delectus dicta doloribus ad deserunt suscipit vitae est. Aut reiciendis rerum consequatur maiores et.', '493806.92', 0, '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(41, 1, 30, NULL, 'Quo voluptatibus accusantium.', 'quo-voluptatibus-accusantium', 'Consequatur autem quas rerum iure eius non modi non. Provident inventore provident ea consequatur. Fugit neque molestiae quia.', '16.43', 0, '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(42, 1, 89, NULL, 'Autem ab.', 'autem-ab', 'Consequatur aut in et excepturi nulla. Non atque est rerum quaerat soluta. Voluptates et odio adipisci id fuga sint nobis.', '56.31', 0, '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(43, 1, 85, NULL, 'Non quibusdam est.', 'non-quibusdam-est', 'Et fugiat est perspiciatis quibusdam nesciunt. Et id ex voluptatem quis quod odit. Suscipit dolore est esse dolor. Deserunt ea hic libero sint eaque nemo.', '6985805.34', 0, '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(44, 1, 68, NULL, 'Sit quidem animi.', 'sit-quidem-animi', 'Dolorem nihil eum et velit. Qui autem sint vero ad similique dolores. Ut illo et aperiam. Id totam ea neque laboriosam quod.', '10.34', 0, '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(45, 1, 68, NULL, 'Harum officiis et magnam perspiciatis.', 'harum-officiis-et-magnam-perspiciatis', 'Eveniet cupiditate aut ipsum esse enim dolorem. Nulla autem asperiores nihil atque corrupti ullam. Quibusdam esse aut quia facilis. Eaque voluptatem odio quos praesentium quis et est.', '12034.24', 0, '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(46, 1, 81, NULL, 'Quia et aliquam et.', 'quia-et-aliquam-et', 'Harum et magni voluptatem corrupti error. Occaecati quis consequatur et nam hic vel nemo. Et sint est ipsum in nostrum vero nisi. Quod quis omnis id et.', '116451677.27', 0, '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(47, 1, 21, NULL, 'Eligendi dolores illum excepturi.', 'eligendi-dolores-illum-excepturi', 'Porro nihil ipsam soluta eos. Temporibus possimus sunt aliquid facilis.', '11.84', 0, '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(48, 1, 1, NULL, 'Ea explicabo et corporis.', 'ea-explicabo-et-corporis', 'Fugit modi quia corporis consequuntur. Id vel est itaque quo. Provident sed numquam odit.', '2849.55', 0, '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(49, 1, 89, NULL, 'Odio tenetur facilis.', 'odio-tenetur-facilis', 'Voluptatem qui sed iusto debitis tenetur. Fuga quia consequatur asperiores illo. Cumque voluptatum ut est expedita sit.', '10687895.52', 0, '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(50, 1, 50, NULL, 'Dolores mollitia dolorem.', 'dolores-mollitia-dolorem', 'Nihil adipisci id et laborum qui. Fugit et tempore omnis deleniti. Omnis id ea est beatae. Sint esse autem unde fuga aspernatur. Rem voluptatibus id eum veritatis.', '36.4', 0, '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(51, 1, 72, NULL, 'Odio assumenda.', 'odio-assumenda', 'Nihil aut eveniet error quisquam. Saepe quam cupiditate hic blanditiis nihil. Optio ipsa autem ullam voluptas et. Dignissimos aspernatur quam labore natus quis aliquam ut.', '25835164.57', 0, '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(52, 1, 23, NULL, 'Placeat modi.', 'placeat-modi', 'Laborum ad molestiae repellendus ut eveniet. Aspernatur consequuntur iste sint harum. Et amet quam quia occaecati neque. Quas molestiae et eum minus. Eos sit repudiandae deleniti repudiandae.', '35.84', 0, '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(53, 1, 21, NULL, 'Alias quaerat molestias fugit inventore.', 'alias-quaerat-molestias-fugit-inventore', 'Distinctio quae ipsum iusto et. Corporis assumenda dolor adipisci iure reprehenderit quia. Repellendus dignissimos debitis in sit facere iste nulla amet.', '42698.63', 0, '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(54, 1, 74, NULL, 'Non iste.', 'non-iste', 'Et nobis et sunt ipsam. Omnis temporibus dolore fugit et. Sapiente qui impedit possimus ducimus minus deleniti non.', '919698491.23', 0, '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(55, 1, 73, NULL, 'Esse quae repellat.', 'esse-quae-repellat', 'Ipsum deleniti aut est fugit error et ut ut. Porro amet quidem qui minima. Et rerum vero ut recusandae ex rerum. Ullam perferendis illo non vel incidunt enim tempora praesentium.', '2511721.99', 0, '2022-12-25 20:42:39', '2022-12-25 20:42:39'),
(56, 1, 21, NULL, 'Mollitia corrupti tempore.', 'mollitia-corrupti-tempore', 'Vel quam ad totam dignissimos cum cumque tempore. Vel corrupti ducimus voluptas sed qui. Delectus assumenda dolorem ut porro delectus. Aut voluptatem ad qui dolore ut iste.', '0.72', 0, '2022-12-25 20:42:39', '2022-12-25 20:42:39'),
(57, 1, 23, NULL, 'Quis id voluptatibus.', 'quis-id-voluptatibus', 'Reprehenderit et sit et totam. Iure ut et eum et. Rerum quis voluptas distinctio velit quia odit.', '27.08', 0, '2022-12-25 20:42:39', '2022-12-25 20:42:39'),
(58, 1, 59, NULL, 'Amet sint fugiat suscipit.', 'amet-sint-fugiat-suscipit', 'Quasi vel vitae doloremque alias eum non. Dolorem illum et ipsa vero porro voluptatem eius. Pariatur soluta quod aut aut pariatur est occaecati. Ut possimus aut amet fuga illum eos impedit.', '1874455.43', 0, '2022-12-25 20:42:39', '2022-12-25 20:42:39'),
(59, 1, 51, NULL, 'Eaque itaque aliquam aut.', 'eaque-itaque-aliquam-aut', 'Ipsa ex dolore in velit dolorem cumque aut eos. Maiores earum quas earum eum vel. Soluta rerum et facere aut sit. Distinctio magnam quibusdam ea ipsum est.', '185683096.52', 0, '2022-12-25 20:42:39', '2022-12-25 20:42:39'),
(60, 1, 26, NULL, 'Beatae iure ullam.', 'beatae-iure-ullam', 'Veniam veritatis quia qui tempora facere asperiores. Magnam nam architecto sit dicta nam quod facere. Tempora nihil sint cupiditate hic voluptatem.', '435246.45', 0, '2022-12-25 20:42:39', '2022-12-25 20:42:39'),
(61, 1, 98, NULL, 'Cumque sit similique.', 'cumque-sit-similique', 'Et quis voluptas autem saepe harum. Debitis pariatur perferendis quas blanditiis porro aut. Possimus et animi accusamus accusantium.', '4186.26', 0, '2022-12-25 20:42:39', '2022-12-25 20:42:39'),
(62, 1, 36, NULL, 'Sit aliquid alias.', 'sit-aliquid-alias', 'Fugiat molestiae accusamus quia. Vel quidem quo autem voluptatem mollitia. Similique id fugit rerum quo. Voluptatem quisquam architecto voluptatem at velit vel autem.', '70.7', 0, '2022-12-25 20:42:39', '2022-12-25 20:42:39'),
(63, 1, 34, NULL, 'Omnis harum nemo.', 'omnis-harum-nemo', 'Quia quae ut occaecati nemo sunt dolor. Possimus et quibusdam possimus eligendi. Nulla dolores est optio ad et. Repellendus distinctio laboriosam saepe occaecati.', '44280858.21', 0, '2022-12-25 20:42:39', '2022-12-25 20:42:39'),
(64, 1, 85, NULL, 'Quos iusto eos maiores.', 'quos-iusto-eos-maiores', 'Corporis enim ea illum repudiandae itaque ipsa. Maxime autem laborum nemo cumque. Perferendis magni adipisci adipisci dolorem nam.', '29.07', 0, '2022-12-25 20:42:39', '2022-12-25 20:42:39'),
(65, 1, 30, NULL, 'Quia sed sunt.', 'quia-sed-sunt', 'Minus facere saepe dicta sapiente necessitatibus aut. Enim corrupti ad debitis dignissimos quas fugiat. Odio quod qui id rerum dignissimos assumenda. Dolorem neque qui et et.', '5437252.23', 0, '2022-12-25 20:42:39', '2022-12-25 20:42:39'),
(66, 1, 103, NULL, 'Rerum unde ut.', 'rerum-unde-ut', 'Iste voluptatem facilis ab vero. Excepturi iure ut eaque asperiores est quisquam animi. Voluptatem sed maiores molestiae.', '157054290.56', 0, '2022-12-25 20:42:39', '2022-12-25 20:42:39'),
(67, 1, 75, NULL, 'Quas laborum laborum.', 'quas-laborum-laborum', 'Perferendis aut velit pariatur et molestiae aut. Enim velit deleniti quae perferendis quis nemo cupiditate. Culpa ea odit qui rerum rem sunt quo. Est vel hic velit.', '879043.15', 0, '2022-12-25 20:42:39', '2022-12-25 20:42:39'),
(68, 1, 4, NULL, 'Sunt veniam ullam.', 'sunt-veniam-ullam', 'Quas corporis ullam et culpa blanditiis et. Eaque ea at odio et. Non adipisci temporibus culpa consequatur nulla deserunt vel. Est animi id quidem aliquid.', '19.04', 0, '2022-12-25 20:42:39', '2022-12-25 20:42:39'),
(69, 1, 98, NULL, 'Eos quaerat eaque.', 'eos-quaerat-eaque', 'Facilis dolores commodi quidem voluptatibus. Iusto explicabo aliquam quam et quasi odit. Saepe ad voluptate esse placeat qui blanditiis.', '0.07', 0, '2022-12-25 20:42:39', '2022-12-25 20:42:39'),
(70, 1, 82, NULL, 'Quia minus quos quidem.', 'quia-minus-quos-quidem', 'Nihil rerum sed accusantium est. Delectus sint architecto quas officia. Beatae vitae est eius molestiae atque. Nesciunt et est provident sit aut velit.', '38435940.89', 0, '2022-12-25 20:42:39', '2022-12-25 20:42:39');

-- --------------------------------------------------------

--
-- Структура таблицы `good_properties`
--

CREATE TABLE `good_properties` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `enable` tinyint(1) NOT NULL DEFAULT '1',
  `good_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `good_properties`
--

INSERT INTO `good_properties` (`id`, `enable`, `good_id`, `title`, `value`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'length', '24', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(2, 1, 1, 'width', '21', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(3, 1, 1, 'weight', '6', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(4, 1, 1, 'color', 'silver', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(5, 1, 2, 'length', '32', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(6, 1, 2, 'width', '35', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(7, 1, 2, 'weight', '2', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(8, 1, 2, 'color', 'yellow', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(9, 1, 3, 'length', '13', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(10, 1, 3, 'width', '29', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(11, 1, 3, 'weight', '3', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(12, 1, 3, 'color', 'blue', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(13, 1, 4, 'length', '17', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(14, 1, 4, 'width', '42', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(15, 1, 4, 'weight', '5', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(16, 1, 4, 'color', 'white', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(17, 1, 5, 'length', '32', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(18, 1, 5, 'width', '49', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(19, 1, 5, 'weight', '3', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(20, 1, 5, 'color', 'teal', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(21, 1, 6, 'length', '20', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(22, 1, 6, 'width', '60', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(23, 1, 6, 'weight', '4', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(24, 1, 6, 'color', 'silver', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(25, 1, 7, 'length', '12', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(26, 1, 7, 'width', '42', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(27, 1, 7, 'weight', '6', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(28, 1, 7, 'color', 'purple', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(29, 1, 8, 'length', '27', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(30, 1, 8, 'width', '26', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(31, 1, 8, 'weight', '4', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(32, 1, 8, 'color', 'fuchsia', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(33, 1, 9, 'length', '35', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(34, 1, 9, 'width', '59', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(35, 1, 9, 'weight', '4', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(36, 1, 9, 'color', 'lime', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(37, 1, 10, 'length', '34', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(38, 1, 10, 'width', '50', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(39, 1, 10, 'weight', '5', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(40, 1, 10, 'color', 'blue', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(41, 1, 11, 'length', '14', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(42, 1, 11, 'width', '21', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(43, 1, 11, 'weight', '1', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(44, 1, 11, 'color', 'green', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(45, 1, 12, 'length', '22', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(46, 1, 12, 'width', '56', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(47, 1, 12, 'weight', '6', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(48, 1, 12, 'color', 'lime', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(49, 1, 13, 'length', '13', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(50, 1, 13, 'width', '43', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(51, 1, 13, 'weight', '6', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(52, 1, 13, 'color', 'maroon', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(53, 1, 14, 'length', '33', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(54, 1, 14, 'width', '22', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(55, 1, 14, 'weight', '2', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(56, 1, 14, 'color', 'green', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(57, 1, 15, 'length', '33', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(58, 1, 15, 'width', '28', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(59, 1, 15, 'weight', '4', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(60, 1, 15, 'color', 'lime', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(61, 1, 16, 'length', '22', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(62, 1, 16, 'width', '33', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(63, 1, 16, 'weight', '6', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(64, 1, 16, 'color', 'white', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(65, 1, 17, 'length', '35', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(66, 1, 17, 'width', '25', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(67, 1, 17, 'weight', '4', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(68, 1, 17, 'color', 'gray', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(69, 1, 18, 'length', '23', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(70, 1, 18, 'width', '19', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(71, 1, 18, 'weight', '6', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(72, 1, 18, 'color', 'teal', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(73, 1, 19, 'length', '15', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(74, 1, 19, 'width', '54', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(75, 1, 19, 'weight', '4', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(76, 1, 19, 'color', 'maroon', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(77, 1, 20, 'length', '22', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(78, 1, 20, 'width', '15', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(79, 1, 20, 'weight', '1', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(80, 1, 20, 'color', 'lime', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(81, 1, 21, 'length', '17', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(82, 1, 21, 'width', '49', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(83, 1, 21, 'weight', '6', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(84, 1, 21, 'color', 'navy', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(85, 1, 22, 'length', '28', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(86, 1, 22, 'width', '56', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(87, 1, 22, 'weight', '2', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(88, 1, 22, 'color', 'navy', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(89, 1, 23, 'length', '15', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(90, 1, 23, 'width', '41', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(91, 1, 23, 'weight', '1', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(92, 1, 23, 'color', 'blue', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(93, 1, 24, 'length', '21', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(94, 1, 24, 'width', '54', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(95, 1, 24, 'weight', '5', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(96, 1, 24, 'color', 'blue', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(97, 1, 25, 'length', '18', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(98, 1, 25, 'width', '31', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(99, 1, 25, 'weight', '6', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(100, 1, 25, 'color', 'blue', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(101, 1, 26, 'length', '31', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(102, 1, 26, 'width', '41', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(103, 1, 26, 'weight', '1', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(104, 1, 26, 'color', 'gray', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(105, 1, 27, 'length', '31', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(106, 1, 27, 'width', '34', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(107, 1, 27, 'weight', '3', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(108, 1, 27, 'color', 'purple', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(109, 1, 28, 'length', '30', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(110, 1, 28, 'width', '18', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(111, 1, 28, 'weight', '4', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(112, 1, 28, 'color', 'navy', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(113, 1, 29, 'length', '24', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(114, 1, 29, 'width', '32', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(115, 1, 29, 'weight', '5', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(116, 1, 29, 'color', 'aqua', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(117, 1, 30, 'length', '26', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(118, 1, 30, 'width', '35', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(119, 1, 30, 'weight', '3', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(120, 1, 30, 'color', 'green', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(121, 1, 31, 'length', '38', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(122, 1, 31, 'width', '21', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(123, 1, 31, 'weight', '2', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(124, 1, 31, 'color', 'aqua', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(125, 1, 32, 'length', '38', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(126, 1, 32, 'width', '40', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(127, 1, 32, 'weight', '3', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(128, 1, 32, 'color', 'navy', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(129, 1, 33, 'length', '14', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(130, 1, 33, 'width', '38', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(131, 1, 33, 'weight', '1', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(132, 1, 33, 'color', 'black', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(133, 1, 34, 'length', '19', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(134, 1, 34, 'width', '32', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(135, 1, 34, 'weight', '1', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(136, 1, 34, 'color', 'aqua', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(137, 1, 35, 'length', '28', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(138, 1, 35, 'width', '28', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(139, 1, 35, 'weight', '6', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(140, 1, 35, 'color', 'blue', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(141, 1, 36, 'length', '16', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(142, 1, 36, 'width', '53', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(143, 1, 36, 'weight', '6', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(144, 1, 36, 'color', 'olive', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(145, 1, 37, 'length', '12', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(146, 1, 37, 'width', '53', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(147, 1, 37, 'weight', '2', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(148, 1, 37, 'color', 'olive', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(149, 1, 38, 'length', '38', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(150, 1, 38, 'width', '18', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(151, 1, 38, 'weight', '1', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(152, 1, 38, 'color', 'green', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(153, 1, 39, 'length', '25', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(154, 1, 39, 'width', '59', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(155, 1, 39, 'weight', '3', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(156, 1, 39, 'color', 'fuchsia', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(157, 1, 40, 'length', '29', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(158, 1, 40, 'width', '54', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(159, 1, 40, 'weight', '4', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(160, 1, 40, 'color', 'silver', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(161, 1, 41, 'length', '34', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(162, 1, 41, 'width', '17', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(163, 1, 41, 'weight', '5', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(164, 1, 41, 'color', 'fuchsia', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(165, 1, 42, 'length', '24', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(166, 1, 42, 'width', '59', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(167, 1, 42, 'weight', '4', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(168, 1, 42, 'color', 'teal', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(169, 1, 43, 'length', '25', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(170, 1, 43, 'width', '26', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(171, 1, 43, 'weight', '5', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(172, 1, 43, 'color', 'navy', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(173, 1, 44, 'length', '17', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(174, 1, 44, 'width', '56', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(175, 1, 44, 'weight', '2', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(176, 1, 44, 'color', 'purple', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(177, 1, 45, 'length', '12', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(178, 1, 45, 'width', '23', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(179, 1, 45, 'weight', '6', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(180, 1, 45, 'color', 'navy', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(181, 1, 46, 'length', '17', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(182, 1, 46, 'width', '18', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(183, 1, 46, 'weight', '5', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(184, 1, 46, 'color', 'black', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(185, 1, 47, 'length', '14', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(186, 1, 47, 'width', '30', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(187, 1, 47, 'weight', '1', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(188, 1, 47, 'color', 'yellow', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(189, 1, 48, 'length', '20', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(190, 1, 48, 'width', '41', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(191, 1, 48, 'weight', '3', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(192, 1, 48, 'color', 'silver', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(193, 1, 49, 'length', '17', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(194, 1, 49, 'width', '31', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(195, 1, 49, 'weight', '3', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(196, 1, 49, 'color', 'yellow', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(197, 1, 50, 'length', '23', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(198, 1, 50, 'width', '40', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(199, 1, 50, 'weight', '5', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(200, 1, 50, 'color', 'yellow', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(201, 1, 51, 'length', '38', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(202, 1, 51, 'width', '58', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(203, 1, 51, 'weight', '2', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(204, 1, 51, 'color', 'navy', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(205, 1, 52, 'length', '14', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(206, 1, 52, 'width', '54', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(207, 1, 52, 'weight', '6', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(208, 1, 52, 'color', 'teal', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(209, 1, 53, 'length', '11', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(210, 1, 53, 'width', '46', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(211, 1, 53, 'weight', '6', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(212, 1, 53, 'color', 'yellow', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(213, 1, 54, 'length', '30', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(214, 1, 54, 'width', '43', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(215, 1, 54, 'weight', '1', '2022-12-25 20:42:38', '2022-12-25 20:42:38'),
(216, 1, 54, 'color', 'purple', '2022-12-25 20:42:39', '2022-12-25 20:42:39'),
(217, 1, 55, 'length', '12', '2022-12-25 20:42:39', '2022-12-25 20:42:39'),
(218, 1, 55, 'width', '22', '2022-12-25 20:42:39', '2022-12-25 20:42:39'),
(219, 1, 55, 'weight', '3', '2022-12-25 20:42:39', '2022-12-25 20:42:39'),
(220, 1, 55, 'color', 'yellow', '2022-12-25 20:42:39', '2022-12-25 20:42:39'),
(221, 1, 56, 'length', '15', '2022-12-25 20:42:39', '2022-12-25 20:42:39'),
(222, 1, 56, 'width', '33', '2022-12-25 20:42:39', '2022-12-25 20:42:39'),
(223, 1, 56, 'weight', '2', '2022-12-25 20:42:39', '2022-12-25 20:42:39'),
(224, 1, 56, 'color', 'purple', '2022-12-25 20:42:39', '2022-12-25 20:42:39'),
(225, 1, 57, 'length', '19', '2022-12-25 20:42:39', '2022-12-25 20:42:39'),
(226, 1, 57, 'width', '15', '2022-12-25 20:42:39', '2022-12-25 20:42:39'),
(227, 1, 57, 'weight', '6', '2022-12-25 20:42:39', '2022-12-25 20:42:39'),
(228, 1, 57, 'color', 'silver', '2022-12-25 20:42:39', '2022-12-25 20:42:39'),
(229, 1, 58, 'length', '36', '2022-12-25 20:42:39', '2022-12-25 20:42:39'),
(230, 1, 58, 'width', '39', '2022-12-25 20:42:39', '2022-12-25 20:42:39'),
(231, 1, 58, 'weight', '6', '2022-12-25 20:42:39', '2022-12-25 20:42:39'),
(232, 1, 58, 'color', 'fuchsia', '2022-12-25 20:42:39', '2022-12-25 20:42:39'),
(233, 1, 59, 'length', '11', '2022-12-25 20:42:39', '2022-12-25 20:42:39'),
(234, 1, 59, 'width', '55', '2022-12-25 20:42:39', '2022-12-25 20:42:39'),
(235, 1, 59, 'weight', '2', '2022-12-25 20:42:39', '2022-12-25 20:42:39'),
(236, 1, 59, 'color', 'olive', '2022-12-25 20:42:39', '2022-12-25 20:42:39'),
(237, 1, 60, 'length', '27', '2022-12-25 20:42:39', '2022-12-25 20:42:39'),
(238, 1, 60, 'width', '29', '2022-12-25 20:42:39', '2022-12-25 20:42:39'),
(239, 1, 60, 'weight', '5', '2022-12-25 20:42:39', '2022-12-25 20:42:39'),
(240, 1, 60, 'color', 'olive', '2022-12-25 20:42:39', '2022-12-25 20:42:39'),
(241, 1, 61, 'length', '40', '2022-12-25 20:42:39', '2022-12-25 20:42:39'),
(242, 1, 61, 'width', '54', '2022-12-25 20:42:39', '2022-12-25 20:42:39'),
(243, 1, 61, 'weight', '2', '2022-12-25 20:42:39', '2022-12-25 20:42:39'),
(244, 1, 61, 'color', 'lime', '2022-12-25 20:42:39', '2022-12-25 20:42:39'),
(245, 1, 62, 'length', '12', '2022-12-25 20:42:39', '2022-12-25 20:42:39'),
(246, 1, 62, 'width', '20', '2022-12-25 20:42:39', '2022-12-25 20:42:39'),
(247, 1, 62, 'weight', '3', '2022-12-25 20:42:39', '2022-12-25 20:42:39'),
(248, 1, 62, 'color', 'gray', '2022-12-25 20:42:39', '2022-12-25 20:42:39'),
(249, 1, 63, 'length', '28', '2022-12-25 20:42:39', '2022-12-25 20:42:39'),
(250, 1, 63, 'width', '19', '2022-12-25 20:42:39', '2022-12-25 20:42:39'),
(251, 1, 63, 'weight', '3', '2022-12-25 20:42:39', '2022-12-25 20:42:39'),
(252, 1, 63, 'color', 'olive', '2022-12-25 20:42:39', '2022-12-25 20:42:39'),
(253, 1, 64, 'length', '17', '2022-12-25 20:42:39', '2022-12-25 20:42:39'),
(254, 1, 64, 'width', '29', '2022-12-25 20:42:39', '2022-12-25 20:42:39'),
(255, 1, 64, 'weight', '2', '2022-12-25 20:42:39', '2022-12-25 20:42:39'),
(256, 1, 64, 'color', 'navy', '2022-12-25 20:42:39', '2022-12-25 20:42:39'),
(257, 1, 65, 'length', '25', '2022-12-25 20:42:39', '2022-12-25 20:42:39'),
(258, 1, 65, 'width', '31', '2022-12-25 20:42:39', '2022-12-25 20:42:39'),
(259, 1, 65, 'weight', '4', '2022-12-25 20:42:39', '2022-12-25 20:42:39'),
(260, 1, 65, 'color', 'navy', '2022-12-25 20:42:39', '2022-12-25 20:42:39'),
(261, 1, 66, 'length', '33', '2022-12-25 20:42:39', '2022-12-25 20:42:39'),
(262, 1, 66, 'width', '16', '2022-12-25 20:42:39', '2022-12-25 20:42:39'),
(263, 1, 66, 'weight', '3', '2022-12-25 20:42:39', '2022-12-25 20:42:39'),
(264, 1, 66, 'color', 'teal', '2022-12-25 20:42:39', '2022-12-25 20:42:39'),
(265, 1, 67, 'length', '19', '2022-12-25 20:42:39', '2022-12-25 20:42:39'),
(266, 1, 67, 'width', '36', '2022-12-25 20:42:39', '2022-12-25 20:42:39'),
(267, 1, 67, 'weight', '3', '2022-12-25 20:42:39', '2022-12-25 20:42:39'),
(268, 1, 67, 'color', 'teal', '2022-12-25 20:42:39', '2022-12-25 20:42:39'),
(269, 1, 68, 'length', '29', '2022-12-25 20:42:39', '2022-12-25 20:42:39'),
(270, 1, 68, 'width', '57', '2022-12-25 20:42:39', '2022-12-25 20:42:39'),
(271, 1, 68, 'weight', '5', '2022-12-25 20:42:39', '2022-12-25 20:42:39'),
(272, 1, 68, 'color', 'navy', '2022-12-25 20:42:39', '2022-12-25 20:42:39'),
(273, 1, 69, 'length', '29', '2022-12-25 20:42:39', '2022-12-25 20:42:39'),
(274, 1, 69, 'width', '27', '2022-12-25 20:42:39', '2022-12-25 20:42:39'),
(275, 1, 69, 'weight', '2', '2022-12-25 20:42:39', '2022-12-25 20:42:39'),
(276, 1, 69, 'color', 'teal', '2022-12-25 20:42:39', '2022-12-25 20:42:39'),
(277, 1, 70, 'length', '31', '2022-12-25 20:42:39', '2022-12-25 20:42:39'),
(278, 1, 70, 'width', '50', '2022-12-25 20:42:39', '2022-12-25 20:42:39'),
(279, 1, 70, 'weight', '1', '2022-12-25 20:42:39', '2022-12-25 20:42:39'),
(280, 1, 70, 'color', 'black', '2022-12-25 20:42:39', '2022-12-25 20:42:39');

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2022_12_23_082722_table_categories', 1),
(7, '2022_12_23_082740_table_goods', 1),
(8, '2022_12_23_083050_table_good_properties', 1),
(9, '2022_12_23_101408_table_carts', 1),
(10, '2022_12_23_102311_table_orders', 1),
(11, '2022_12_23_102447_table_order_goods', 1),
(12, '2022_12_25_154525_create_sessions_table', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `session_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `email` text COLLATE utf8mb4_unicode_ci,
  `sum` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id`, `session_id`, `user_id`, `name`, `phone`, `address`, `email`, `sum`, `created_at`, `updated_at`) VALUES
(1, 'iv9JaZNJjZNijnsyCttzUVMoeaQdgeF826twip7G', 1, 'evilgoogle', '8702445164', 'europa', 'evilgoogle@mail.ru', '257.4', '2022-12-26 18:49:06', '2022-12-26 18:49:06'),
(2, 'dbQjxdKbBe63P2FLiT1mJ1xWocX1C4MhkzIHqOwW', 1, 'evilgoogle', '8702445164', 'europa', 'evilgoogle@mail.ru', '257.4', '2022-12-26 18:52:35', '2022-12-26 18:52:35'),
(3, 'oZUScQSp1JZpC5EZHqwlWayFO0fl00aW0CgVCzSa', 1, 'evilgoogle', '8702445164', 'europa', 'evilgoogle@mail.ru', '65.8', '2022-12-26 18:53:16', '2022-12-26 18:53:16');

-- --------------------------------------------------------

--
-- Структура таблицы `order_goods`
--

CREATE TABLE `order_goods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `count` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `order_goods`
--

INSERT INTO `order_goods` (`id`, `order_id`, `title`, `price`, `count`, `created_at`, `updated_at`) VALUES
(1, 1, 'Sint ipsam esse id.', '64.35', '4', '2022-12-26 18:49:06', '2022-12-26 18:49:06'),
(2, 2, 'Sint ipsam esse id.', '64.35', '4', '2022-12-26 18:52:35', '2022-12-26 18:52:35'),
(3, 3, 'Sint ipsam esse id.', '64.35', '1', '2022-12-26 18:53:16', '2022-12-26 18:53:16'),
(4, 3, 'Officia dolorem rerum.', '1.45', '1', '2022-12-26 18:53:16', '2022-12-26 18:53:16');

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'app_token', '10a6256b8204aced1ee38db03c011dbf45f44c822c2dc3e1d841b96efa7d540f', '[\"*\"]', '2022-12-26 18:22:24', '2022-12-26 10:00:16', '2022-12-26 18:22:24'),
(2, 'App\\Models\\User', 1, 'app_token', 'b123c68fce08c6f8437ac6d84a18016f689f3a2919f1bbb3eb27e0c0b9dfa8f4', '[\"*\"]', NULL, '2022-12-26 12:28:10', '2022-12-26 12:28:10'),
(3, 'App\\Models\\User', 1, 'app_token', '2d62b8cda9f8db64b0bdeeb48070225e9d9fe9875c071a6b17b4ae38dba54d5b', '[\"*\"]', '2022-12-26 19:03:06', '2022-12-26 18:25:16', '2022-12-26 19:03:06');

-- --------------------------------------------------------

--
-- Структура таблицы `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('32bBAcclNzKBgFeKM3DLztnDGBNfm0Vj0fx94Dns', NULL, '127.0.0.1', 'PostmanRuntime/7.30.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoib1FaQW5rWFVnbEV6dUt4a2RZTjg1QlpyaTg4RkUxS0VCNXBwSFdZNiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1672101051),
('6eE8jxgKR4SLpTWy58HzxT6evATNLCEkv2a0QzZZ', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiclJRc0hzUk9OZGpIVnZUWnVGWEhYSWFtQ1U2cjVxVW1XdlZ3YXZ6OSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjU6Imh0dHA6Ly9leGFtcGxlLmxvY2FsL2NhcnQiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MjE6InBhc3N3b3JkX2hhc2hfc2FuY3R1bSI7czo2MDoiJDJ5JDEwJGo0R2RRaEovenVJc0hpcG1mc0RlNWVQSXdWV2FPenJMeFgzT1RLa3VGVVVCaHhOUzBmYXJxIjt9', 1672102402);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(1, 'evilgoogle', 'evilgoogle@mail.ru', NULL, '$2y$10$j4GdQhJ/zuIsHipmfsDe5ePIwVWaOzrLxX3OTKkuFUUBhxNS0farq', NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-25 20:44:26', '2022-12-25 20:44:26'),
(2, 'Dante', 'devil@mail.ru', NULL, '$2y$10$jggqAu7vxSo0T60Pp3jE.OODLfwhxxUOVtwzlCbDzUP1czdHeUPc2', NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-26 11:25:50', '2022-12-26 11:25:50');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Индексы таблицы `goods`
--
ALTER TABLE `goods`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `good_properties`
--
ALTER TABLE `good_properties`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `order_goods`
--
ALTER TABLE `order_goods`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Индексы таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Индексы таблицы `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT для таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `goods`
--
ALTER TABLE `goods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT для таблицы `good_properties`
--
ALTER TABLE `good_properties`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=281;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `order_goods`
--
ALTER TABLE `order_goods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
