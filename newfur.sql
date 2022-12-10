-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 10, 2022 at 01:38 PM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `newfur`
--

-- --------------------------------------------------------

--
-- Table structure for table `histories`
--

DROP TABLE IF EXISTS `histories`;
CREATE TABLE IF NOT EXISTS `histories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `id_status` tinyint(1) NOT NULL,
  `amount` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `histories`
--

INSERT INTO `histories` (`id`, `id_user`, `id_status`, `amount`, `createdAt`, `updatedAt`) VALUES
(1, 19, 0, 10000000, '2022-12-10 13:18:50', '2022-12-10 13:18:50');

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
CREATE TABLE IF NOT EXISTS `status` (
  `id_status` tinyint(1) NOT NULL,
  `keterangan` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`id_status`, `keterangan`) VALUES
(0, 'top_up'),
(1, 'transaksi');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `saldo` float NOT NULL DEFAULT '0',
  `id_wallet` varchar(255) NOT NULL,
  `refresh_token` text,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `saldo`, `id_wallet`, `refresh_token`, `createdAt`, `updatedAt`) VALUES
(1, 'jovan', 'iyaiya', '$2b$10$4yiFeEe8bRNclcY3GsA9m.sX8p8G3m02Wd5VIMIuwhFW/EHv4p60C', 5510, '', NULL, '2022-06-11 15:15:33', '2022-06-13 10:39:42'),
(2, '', 'coba@gmail.com', '$2b$10$CedIboI.bpoYgwyFOrpXz.ljg8uJ59gwTabnoRJf3yn/TWq0axXTm', 1000000, '', NULL, '2022-06-11 15:16:38', '2022-06-12 10:06:39'),
(3, '', 'coba', '$2b$10$uGBva84NFbFHSNvqpLkBye93C65PMB2RufZnRYtnQhi183r7Ja0yW', 0, '', NULL, '2022-06-11 16:27:38', '2022-06-11 16:27:38'),
(4, '', 'halo', '$2b$10$j/YIhIe3IKjFw7n57uCoFO/q/TvbTDSa84745K4YQNGf3BzV7BRPO', 0, '', NULL, '2022-06-11 16:30:40', '2022-06-11 16:30:40'),
(5, '', 'halo@gmail.com', '$2b$10$iU4rbTiy8TrJnolsOIv2K./.HdVP6H6ETrKmRekhZpnDl9jhRy2rW', 0, '', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjUsImVtYWlsIjoiaGFsb0BnbWFpbC5jb20iLCJpYXQiOjE2NTUwNDY4ODUsImV4cCI6MTY1NTA0Njk0NX0.Ce_WzfiuwntLKoEB8cUMyOHnEVdmf0HHjD2DYeu7jfw', '2022-06-11 16:51:27', '2022-06-12 15:14:45'),
(6, '', 'halo@gmail.com', '$2b$10$/ljdQsf8SFQEQWxBeecMX..XkfB2IVXPGGDvwBNRFKRITIi8Y5.wm', 0, '', NULL, '2022-06-11 16:54:18', '2022-06-11 16:54:18'),
(7, '', 'hola@gmail.com', '$2b$10$AscjzokXE4qqDQQyFLFTaOLtZRqGSjDkLwwRFCjCh9Ns2WOAPCpfm', 0, '', NULL, '2022-06-11 17:39:31', '2022-06-11 21:12:44'),
(8, 'jovaan', 'jovan@gmail.com', '$2b$10$pSBbkkYQIUB189f4SBH9iee2/.3qB241KtKtlCg2n8Ht9L1MFLm42', 10000, '', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjgsImVtYWlsIjoiam92YW5AZ21haWwuY29tIiwiaWF0IjoxNjU1MDU2MzgwLCJleHAiOjE2NTUwNTY0NDB9.7ptdtiSw17lsaMwadUCNDiWGEVId8uXvLeTd5SioS2s', '2022-06-12 17:51:07', '2022-06-12 17:53:00'),
(11, 'pi', 'pi@gmail.com', '553', 10000, '4ab06fa57882745158f08f8b36e83255', NULL, '2022-06-13 10:07:23', '2022-06-13 10:07:23'),
(12, 'pa', 'pa@gmail.com', '553', 10000, 'c1204ffc1a5bc3086f26cd3b23389e16', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEyLCJlbWFpbCI6InBhQGdtYWlsLmNvbSIsImlhdCI6MTY1NTExNTA4NiwiZXhwIjoxNjU1MTE1MTQ2fQ.r-67owAtnjUZn4_emkHGuNUBLgf9AgYxPpdVy0YRNR0', '2022-06-13 10:10:33', '2022-06-13 10:11:26'),
(14, 'pe', 'pe@gmail.com', '$2b$04$7DOSF9qdfnjnVqUwyT3Ma.7tTkWuCALa2TzR.SyNwBkQDhZwR9EpC', 1510000, '700038959fe4f3acb4081250f6a3dc7c', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjE0LCJlbWFpbCI6InBlQGdtYWlsLmNvbSIsImlhdCI6MTY1NTEyMzE0NiwiZXhwIjoxNjU1MTIzMjA2fQ.npiBc45j9I4VDxwlEajp8FDLDpa6pJOemMwYvIHjQDo', '2022-06-13 10:23:42', '2022-06-13 12:43:36'),
(15, 'ha', 'ha@gmail.com', '553', 1000000, '77b739f053b15ca87459935c7737f982', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjE1LCJlbWFpbCI6ImhhQGdtYWlsLmNvbSIsImlhdCI6MTY1NTEyNDc3OSwiZXhwIjoxNjU1MTI0ODM5fQ.Y2BDPw7kajIRVdocGsZ66g0kHkLiqQ1OiQTUWw5VFQs', '2022-06-13 12:49:17', '2022-06-13 13:00:04'),
(16, 'rich', 'rich', 'rich', 0, 'e7f4f8bd246c235418280d1f124e14f0', NULL, '2022-11-21 04:53:08', '2022-11-21 04:53:08'),
(17, 'rich', 'richard', 'rich', 0, '6ae199a93c381bf6d5de27491139d3f9', NULL, '2022-12-09 05:48:40', '2022-12-09 05:48:40'),
(18, 'rich', 'richa', 'rich', 0, '0', NULL, '2022-12-09 06:08:56', '2022-12-09 06:08:56'),
(19, 'richh', 'rich@gmail', 'rich', 40000000, '0', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjE5LCJlbWFpbCI6InJpY2hAZ21haWwiLCJpYXQiOjE2NzA2Nzc1ODUsImV4cCI6MTY3MDY3NzY0NX0.w1yVf-dfg8dsaRIqOPse9Lecy6Rl5qYkhQq_pvJo588', '2022-12-09 06:22:13', '2022-12-10 13:18:50');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
