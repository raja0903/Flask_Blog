-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 01, 2023 at 07:57 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `coding_thunder`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `name` text NOT NULL,
  `phone` varchar(20) NOT NULL,
  `mail` varchar(20) NOT NULL,
  `message` text NOT NULL,
  `sno` int(11) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`name`, `phone`, `mail`, `message`, `sno`, `date`) VALUES
('aman', '12345678', 'amsndbdo9', 'wdjwkldmlwdm dncnedmwkd', 1, '2023-09-24 21:35:02'),
('j', '76', 'hj@gm.com', 'hgvb b', 2, '2023-09-25 11:44:20'),
('Aman', '087', 'amantrivedi.knp@gmai', 'hi how are you', 3, '2023-09-25 13:02:47'),
('Aman', '087', 'amantrivedi.knp@gmai', 'hi how are you', 4, '2023-09-25 13:04:57'),
('Aman', '087', 'amantrivedi.knp@gmai', 'hi how are you', 5, '2023-09-25 13:09:40'),
('Aman', '087', 'amantrivedi.knp@gmai', 'hi', 6, '2023-09-25 13:10:22'),
('Aman', '087', 'amantrivedi.knp@gmai', 'hi', 7, '2023-09-25 13:11:03'),
('Aman Trivedi', '07268921399', 'amantrivedi.knp@gmai', 'jn', 8, '2023-09-28 22:34:54'),
('Aman Trivedi', '07268921399', 'amantrivedi.knp@gmai', 'jn', 9, '2023-09-28 22:54:40'),
('Aman Trivedi', '07268921399', 'amantrivedi.knp@gmai', 'jn', 10, '2023-09-28 22:54:48'),
('Aman Trivedi', '07268921399', 'amantrivedi.knp@gmai', 'jn', 11, '2023-09-28 22:59:32');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `sno` int(11) NOT NULL,
  `title` text NOT NULL,
  `slug` varchar(26) NOT NULL,
  `content` text NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sno`, `title`, `slug`, `content`, `date`) VALUES
(2, 'Stocks', 'stocks cs', 'Stock is paisa', '2023-09-28 23:28:00'),
(11, 'aman', '11', 'trivedi', '2023-10-01 10:34:37'),
(12, 'k', 'kk', 'kk', '2023-10-01 11:15:18'),
(13, 'jk', 'jk', 'jk', '2023-10-01 11:16:44'),
(14, 'aman', 'aman', 'aman', '2023-10-01 11:17:47'),
(15, 'trivedi', 'kumar', 'kumar', '2023-10-01 11:18:23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
