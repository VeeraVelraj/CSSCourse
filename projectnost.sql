-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 17, 2019 at 09:00 AM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `projectnost`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_login`
--

CREATE TABLE `admin_login` (
  `id` int(11) NOT NULL,
  `user_name` varchar(32) NOT NULL,
  `user_pass` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `daowat`
--

CREATE TABLE `daowat` (
  `id` int(11) NOT NULL,
  `body` text NOT NULL,
  `date_added` date NOT NULL,
  `post_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `added_by` varchar(32) NOT NULL,
  `photos` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `daowat_comments`
--

CREATE TABLE `daowat_comments` (
  `id` int(11) NOT NULL,
  `daowat_body` text NOT NULL,
  `date_added` date NOT NULL,
  `time` datetime NOT NULL,
  `daowat_by` varchar(32) NOT NULL,
  `daowat_to` varchar(32) NOT NULL,
  `opened` varchar(3) NOT NULL DEFAULT 'no',
  `daowat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dwt_likes`
--

CREATE TABLE `dwt_likes` (
  `id` int(11) NOT NULL,
  `user_name` varchar(15) NOT NULL,
  `dwt_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `emoticons`
--

CREATE TABLE `emoticons` (
  `id` int(11) NOT NULL,
  `chars` text NOT NULL,
  `photos` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `follow`
--

CREATE TABLE `follow` (
  `id` int(11) NOT NULL,
  `user_from` varchar(32) NOT NULL,
  `user_to` varchar(32) NOT NULL,
  `time` datetime NOT NULL,
  `opened` varchar(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `body` text NOT NULL,
  `daowat_body` text NOT NULL,
  `date_added` date NOT NULL,
  `post_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `added_by` varchar(255) NOT NULL,
  `user_posted_to` varchar(255) NOT NULL,
  `share_post` int(11) NOT NULL,
  `daowat_post` int(11) NOT NULL,
  `daowat_give` tinyint(1) NOT NULL DEFAULT '0',
  `discription` text NOT NULL,
  `photos` text NOT NULL,
  `newsfeedshow` tinyint(1) NOT NULL DEFAULT '1',
  `report` tinyint(1) NOT NULL DEFAULT '0',
  `note` tinyint(1) NOT NULL DEFAULT '0',
  `note_privacy` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `body`, `daowat_body`, `date_added`, `post_time`, `added_by`, `user_posted_to`, `share_post`, `daowat_post`, `daowat_give`, `discription`, `photos`, `newsfeedshow`, `report`, `note`, `note_privacy`) VALUES
(229, '', '', '2019-03-17', '2019-03-17 06:53:49', 'redrose', 'redrose', 0, 0, 0, 'changed his profile picture.', 'redrose/1552805629.jpg', 1, 0, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `post_comments`
--

CREATE TABLE `post_comments` (
  `id` int(11) NOT NULL,
  `post_body` text NOT NULL,
  `date_added` date NOT NULL,
  `time` datetime NOT NULL,
  `posted_by` varchar(255) NOT NULL,
  `posted_to` varchar(255) NOT NULL,
  `opened` varchar(3) NOT NULL DEFAULT 'no',
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `post_likes`
--

CREATE TABLE `post_likes` (
  `id` int(11) NOT NULL,
  `user_name` varchar(15) NOT NULL,
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `post_likes`
--

INSERT INTO `post_likes` (`id`, `user_name`, `post_id`) VALUES
(258, 'skyblue', 229);

-- --------------------------------------------------------

--
-- Table structure for table `pvt_messages`
--

CREATE TABLE `pvt_messages` (
  `id` int(11) NOT NULL,
  `user_from` varchar(255) NOT NULL,
  `user_to` varchar(255) NOT NULL,
  `msg_body` text NOT NULL,
  `date` date NOT NULL,
  `msg_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `opened` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `gender` varchar(7) NOT NULL,
  `birthday` date NOT NULL,
  `country` varchar(255) NOT NULL,
  `city` text NOT NULL,
  `hometown` text NOT NULL,
  `sign_up_date` date NOT NULL,
  `activated` enum('0','1') NOT NULL,
  `confirmCode` int(11) NOT NULL DEFAULT '0',
  `blocked_user` enum('0','1') NOT NULL DEFAULT '0',
  `bio` text NOT NULL,
  `queote` text NOT NULL,
  `profile_pic` text NOT NULL,
  `cover_pic` text NOT NULL,
  `friend_array` text NOT NULL,
  `closed` varchar(3) NOT NULL DEFAULT 'no',
  `relationship` varchar(255) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `pub_email` varchar(255) NOT NULL,
  `company` text NOT NULL,
  `position` text NOT NULL,
  `school` text NOT NULL,
  `concentration` text NOT NULL,
  `nick_name` varchar(32) NOT NULL,
  `verify_id` varchar(3) NOT NULL DEFAULT 'no',
  `pass_question` text NOT NULL,
  `pass_ans` text NOT NULL,
  `chatOnlineTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `username`, `email`, `password`, `gender`, `birthday`, `country`, `city`, `hometown`, `sign_up_date`, `activated`, `confirmCode`, `blocked_user`, `bio`, `queote`, `profile_pic`, `cover_pic`, `friend_array`, `closed`, `relationship`, `mobile`, `pub_email`, `company`, `position`, `school`, `concentration`, `nick_name`, `verify_id`, `pass_question`, `pass_ans`, `chatOnlineTime`) VALUES
(68, 'Redrose', 'redrose', 'redrose@gmail.com', 'd8578edf8458ce06fbc5bb76a58c5ca4', '1', '0000-00-00', '', '', '', '2019-03-17', '1', 0, '0', '', '', 'redrose/1552805629.jpg', '', '', 'no', '', '', '', '', '', '', '', '', 'no', '', '', '2019-03-17 07:51:46'),
(69, 'Skyblue', 'skyblue', 'skyblue@gmail.com', 'd8578edf8458ce06fbc5bb76a58c5ca4', '1', '0000-00-00', '', '', '', '2019-03-17', '1', 0, '0', '', '', '', '', '', 'no', '', '', '', '', '', '', '', '', 'no', '', '', '2019-03-17 08:00:38');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_login`
--
ALTER TABLE `admin_login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `daowat`
--
ALTER TABLE `daowat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `daowat_comments`
--
ALTER TABLE `daowat_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dwt_likes`
--
ALTER TABLE `dwt_likes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emoticons`
--
ALTER TABLE `emoticons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `follow`
--
ALTER TABLE `follow`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_comments`
--
ALTER TABLE `post_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_likes`
--
ALTER TABLE `post_likes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pvt_messages`
--
ALTER TABLE `pvt_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_login`
--
ALTER TABLE `admin_login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `daowat`
--
ALTER TABLE `daowat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;
--
-- AUTO_INCREMENT for table `daowat_comments`
--
ALTER TABLE `daowat_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `dwt_likes`
--
ALTER TABLE `dwt_likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;
--
-- AUTO_INCREMENT for table `emoticons`
--
ALTER TABLE `emoticons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `follow`
--
ALTER TABLE `follow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=231;
--
-- AUTO_INCREMENT for table `post_comments`
--
ALTER TABLE `post_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;
--
-- AUTO_INCREMENT for table `post_likes`
--
ALTER TABLE `post_likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=259;
--
-- AUTO_INCREMENT for table `pvt_messages`
--
ALTER TABLE `pvt_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=291;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
