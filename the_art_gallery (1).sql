-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 28, 2018 at 04:00 PM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 7.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `the_art_gallery`
--

-- --------------------------------------------------------

--
-- Table structure for table `interests`
--

CREATE TABLE `interests` (
  `user_id` int(255) NOT NULL,
  `interest` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `uploads`
--

CREATE TABLE `uploads` (
  `upload_id` int(255) NOT NULL,
  `uploader_id` varchar(255) NOT NULL,
  `uploader_name` varchar(255) NOT NULL,
  `artist` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `image` longblob NOT NULL,
  `upload_date` date NOT NULL,
  `upload_time` time NOT NULL,
  `path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `uploads`
--

INSERT INTO `uploads` (`upload_id`, `uploader_id`, `uploader_name`, `artist`, `file_name`, `category`, `image`, `upload_date`, `upload_time`, `path`) VALUES
(1, '1', 'False Name', 'Gallileo', 'IMG-20160319-WA0001.jpg', 'Interior Design', '', '2018-06-26', '23:09:31', 'C:UsersaduDesktopWorking FilesOOP-2OOP ProjectwebimagesIMG-20160319-WA0001.jpg'),
(2, '1', 'False Name', 'Gallileo', 'IMG-20160319-WA0001.jpg', 'Graphic Design', '', '2018-06-27', '16:17:29', 'C:UsersaduDesktopWorking FilesOOP-2OOP ProjectwebimagesIMG-20160319-WA0001.jpg'),
(3, '1', 'False Name', 'Gallileo', 'IMG-20160319-WA0001.jpg', 'Interior Design', 0x6a6176612e696f2e427974654172726179496e70757453747265616d403730313030323832, '2018-06-28', '15:17:54', 'C:UsersaduDesktopWorking FilesOOP-2OOP ProjectwebimagesIMG-20160319-WA0001.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(255) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `occupation` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `fname`, `lname`, `email`, `occupation`, `password`) VALUES
(1, 'Jerry ', 'Auvagha', 'jerry.auvagha@strathmore.edu', 'Computer Science Student', '$2a$10$xgpMEKoG2vPCPngs9tKL5e4krEjDCEglLby3kjAJWCeE/xS54hv.m');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `interests`
--
ALTER TABLE `interests`
  ADD KEY `FOREIGN KEY` (`user_id`) USING BTREE;

--
-- Indexes for table `uploads`
--
ALTER TABLE `uploads`
  ADD PRIMARY KEY (`upload_id`),
  ADD UNIQUE KEY `UNIQUE` (`upload_id`,`uploader_name`) USING BTREE,
  ADD KEY `FOREIGN KEY` (`uploader_name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `uploads`
--
ALTER TABLE `uploads`
  MODIFY `upload_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
