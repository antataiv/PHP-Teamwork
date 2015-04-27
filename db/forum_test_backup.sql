-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 27, 2015 at 07:02 AM
-- Server version: 5.6.20
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `forum_test`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
`id` int(11) NOT NULL,
  `cat_name` varchar(255) NOT NULL,
  `cat_description` varchar(255) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `cat_name`, `cat_description`) VALUES
(1, 'Software', 'Some Software Related Problems'),
(5, 'Hardware', 'Some sample hardware topics'),
(6, 'FAQ', 'Frequently Asked Questions'),
(7, 'Other', 'Some Other Questions'),
(8, 'New Sample Category', 'Sample'),
(9, 'One More Category', 'One More'),
(10, 'Anton''s category', 'Category');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
`id` int(11) NOT NULL,
  `post_content` text NOT NULL,
  `post_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `post_topic` int(11) NOT NULL,
  `post_by` int(11) NOT NULL,
  `guest` varchar(255) DEFAULT NULL,
  `guest_email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `post_content`, `post_date`, `post_topic`, `post_by`, `guest`, `guest_email`) VALUES
(1, 'You are studid!!!', '2015-04-22 18:09:45', 1, 20, '', ''),
(15, 'You should try to fix it!', '2015-04-26 14:29:58', 1, 27, 'Guest1234', ''),
(16, 'Hahahahaha', '2015-04-26 14:30:59', 1, 27, 'Bai Ivan Golemia', 'bai_ivan@bai.bg'),
(17, 'И ще си напиша първия коментар!!! :)', '2015-04-26 14:36:40', 9, 19, '', NULL),
(18, 'Ajde de... koga shte hodim???', '2015-04-26 14:39:16', 5, 18, '', NULL),
(19, 'Gleda televizia :D', '2015-04-26 14:39:43', 3, 18, '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `topics`
--

CREATE TABLE IF NOT EXISTS `topics` (
`id` int(11) NOT NULL,
  `topic_subject` varchar(255) NOT NULL,
  `topic_description` text NOT NULL,
  `topic_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `topic_cat` int(11) NOT NULL,
  `topic_by` int(11) NOT NULL,
  `visits` int(11) NOT NULL DEFAULT '0',
  `topic_tags` varchar(255) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `topics`
--

INSERT INTO `topics` (`id`, `topic_subject`, `topic_description`, `topic_date`, `topic_cat`, `topic_by`, `visits`, `topic_tags`) VALUES
(1, 'How to fix my PC?', 'PC broken', '2015-04-22 18:08:06', 1, 19, 0, NULL),
(2, 'Alabalanica', 'Ala bala nica', '2015-04-23 20:04:37', 6, 19, 0, 'some, test, tag'),
(3, 'What is Anton doing?', 'What Anton is doing in his free time?', '2015-04-24 17:46:23', 10, 19, 0, 'sport, anton, topic'),
(4, 'My computer broke?!?', 'My computer suddenly stopped working', '2015-04-24 17:47:45', 5, 19, 0, 'computer, broken'),
(5, 'Mountain Climbing', 'Wanna go mountain climbing', '2015-04-24 17:48:13', 7, 19, 0, ''),
(9, 'Опит на кирилица', 'Опит да направя топик на кирилица', '2015-04-26 14:36:17', 7, 19, 0, 'cyrillic, topic, try');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `date_registered` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_admin` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `password`, `email`, `date_registered`, `is_admin`) VALUES
(18, 'Pesho', '8588310a98676af6e22563c1559e1ae20f85950792bdcd0c8f334867c54581cd', 'pesho@pesh.com', '2015-04-22 15:12:46', 0),
(19, 'Anton', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'anton@anton.com', '2015-04-22 15:12:58', 1),
(20, 'Gosho', '02359ffb8eb977c499d03c598de268df19edb14236fd3514dcf5344fcdd43833', 'pesho@pesh.com', '2015-04-22 15:26:43', 0),
(23, 'Ivan', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'ivan@ivan.com', '2015-04-24 16:33:38', 0),
(24, 'Ivan123', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'ivan@ivan.asdas', '2015-04-24 16:44:14', 0),
(25, 'Pesho123', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'asdsada', '2015-04-24 16:45:25', 0),
(27, 'guest', '6dbb02f5dccbb6146d248539e30a1bed4ab5cdd2761eb371e4bc5e26aafa4d97', 'guest@guest.com', '2015-04-26 14:00:15', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `cat_name` (`cat_name`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
 ADD PRIMARY KEY (`id`), ADD KEY `post_topic` (`post_topic`), ADD KEY `post_by` (`post_by`);

--
-- Indexes for table `topics`
--
ALTER TABLE `topics`
 ADD PRIMARY KEY (`id`), ADD KEY `topic_cat` (`topic_cat`), ADD KEY `topic_by` (`topic_by`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `name` (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `topics`
--
ALTER TABLE `topics`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=28;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`post_topic`) REFERENCES `topics` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`post_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `topics`
--
ALTER TABLE `topics`
ADD CONSTRAINT `topics_ibfk_1` FOREIGN KEY (`topic_cat`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `topics_ibfk_2` FOREIGN KEY (`topic_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
