-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 16, 2026 at 05:52 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webchat`
--

-- --------------------------------------------------------

--
-- Table structure for table `attachments`
--

CREATE TABLE `attachments` (
  `attachment_id` int(11) NOT NULL,
  `message_id` int(11) NOT NULL,
  `file_url` varchar(500) NOT NULL,
  `file_type` varchar(50) DEFAULT NULL,
  `file_size` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attachments`
--

INSERT INTO `attachments` (`attachment_id`, `message_id`, `file_url`, `file_type`, `file_size`) VALUES
(1, 2, '1766976532_wumpus.png', 'image/png', 3968),
(2, 4, '1766976813_default.png', 'image/png', 1440),
(3, 47, '1767252957_voice_msg.webm', 'audio/webm', 60188);

-- --------------------------------------------------------

--
-- Table structure for table `conversations`
--

CREATE TABLE `conversations` (
  `conversation_id` int(11) NOT NULL,
  `server_id` int(11) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `type` enum('dm','group_dm','server_text','server_voice','public','private') DEFAULT 'dm',
  `creator_id` int(11) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `conversations`
--

INSERT INTO `conversations` (`conversation_id`, `server_id`, `title`, `type`, `creator_id`, `avatar`) VALUES
(15, NULL, 'Buồng giam 1', '', 2, NULL),
(16, NULL, 'vui vẻ', '', 2, NULL),
(17, NULL, 'totoya', '', 1, NULL),
(18, 1, 'chung', 'server_text', 1, NULL),
(19, 1, 'dam-phan', 'server_text', 1, NULL),
(20, 1, 'tai-lieu', 'server_text', 1, NULL),
(21, 2, 'general', 'server_text', 1, NULL),
(22, 2, 'tim-dong-doi', 'server_text', 1, NULL),
(25, 3, 'chung', 'server_text', 1, NULL),
(26, NULL, 'Private Chat', 'dm', NULL, NULL),
(27, 4, 'chung', 'server_text', 1, NULL),
(28, 3, 'test', 'server_text', 1, NULL),
(29, NULL, 'Private Chat', 'dm', NULL, NULL),
(30, 5, 'chung', 'server_text', 2, NULL),
(31, 3, 'damn', 'server_text', 4, NULL),
(33, NULL, 'sdfsd', 'private', 1, NULL),
(35, NULL, 'ada', 'private', 1, NULL),
(38, NULL, 'test2', 'private', 1, 'default_group.png'),
(39, NULL, 'test2', 'private', 1, 'default_group.png'),
(40, NULL, 'test2', 'private', 1, 'default_group.png'),
(41, NULL, 'test2', 'private', 1, 'default_group.png'),
(42, 3, '123', 'server_text', 1, 'default_channel.png'),
(44, NULL, 'adf', 'private', 1, 'default_group.png');

-- --------------------------------------------------------

--
-- Table structure for table `friendships`
--

CREATE TABLE `friendships` (
  `requester_id` int(11) NOT NULL,
  `addressee_id` int(11) NOT NULL,
  `status` enum('pending','accepted','blocked') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `friendships`
--

INSERT INTO `friendships` (`requester_id`, `addressee_id`, `status`, `created_at`) VALUES
(1, 2, 'accepted', '2025-12-29 04:54:08'),
(1, 4, 'accepted', '2025-12-29 02:53:04'),
(5, 1, 'pending', '2025-12-31 08:28:49');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `message_id` int(11) NOT NULL,
  `conversation_id` int(11) DEFAULT NULL,
  `reply_to_message_id` int(11) DEFAULT NULL,
  `sender_id` int(11) NOT NULL,
  `content` text DEFAULT NULL,
  `message_type` enum('text','image','file','system','voice') DEFAULT 'text',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `hasAttachment` int(1) NOT NULL DEFAULT 0,
  `is_pinned` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`message_id`, `conversation_id`, `reply_to_message_id`, `sender_id`, `content`, `message_type`, `created_at`, `hasAttachment`, `is_pinned`) VALUES
(1, 25, NULL, 1, 'xin chào', 'text', '2025-12-29 02:41:31', 0, 0),
(2, 25, NULL, 1, '', 'text', '2025-12-29 02:48:52', 1, 0),
(3, 25, NULL, 1, 'hello', 'text', '2025-12-29 02:53:13', 0, 0),
(4, 25, NULL, 1, 'damn', 'text', '2025-12-29 02:53:33', 1, 0),
(5, 25, NULL, 1, 'đây', 'text', '2025-12-29 02:57:43', 0, 0),
(6, 25, NULL, 1, 'hello', 'text', '2025-12-29 03:15:29', 0, 1),
(7, 26, NULL, 1, 'Hãy tham gia máy chủ **Gyatt Daumn** của tôi!\nMã mời: **A71F66**', 'text', '2025-12-29 04:06:27', 0, 0),
(8, 25, NULL, 4, 'đây', 'text', '2025-12-29 04:40:49', 0, 0),
(9, 29, NULL, 1, 'faf', 'text', '2025-12-29 04:55:31', 0, 0),
(10, 26, NULL, 1, 'đây', 'text', '2025-12-29 05:07:38', 0, 0),
(11, 25, NULL, 2, 'damn', 'text', '2025-12-29 05:08:00', 0, 0),
(12, 25, NULL, 4, 'dm', 'text', '2025-12-31 08:29:59', 0, 0),
(13, 25, NULL, 4, 'alo alo 123', 'text', '2026-01-01 02:47:01', 0, 0),
(14, 25, NULL, 4, 'alo alo 123', 'text', '2026-01-01 02:47:03', 0, 0),
(15, 25, NULL, 4, 'alo alo 123', 'text', '2026-01-01 02:47:03', 0, 0),
(16, 25, NULL, 4, 'alo alo 123', 'text', '2026-01-01 02:47:03', 0, 0),
(17, 25, NULL, 4, 'alo alo 123', 'text', '2026-01-01 02:47:05', 0, 0),
(18, 25, NULL, 4, 'alo alo 123', 'text', '2026-01-01 02:47:06', 0, 0),
(19, 25, NULL, 4, 'alo alo 123', 'text', '2026-01-01 02:47:07', 0, 0),
(20, 25, NULL, 4, 'alo alo 123', 'text', '2026-01-01 02:47:07', 0, 0),
(21, 25, NULL, 4, 'alo alo 123', 'text', '2026-01-01 02:47:07', 0, 0),
(22, 25, NULL, 4, 'alo alo 123', 'text', '2026-01-01 02:47:07', 0, 0),
(23, 25, NULL, 4, 'alo alo 123', 'text', '2026-01-01 02:47:08', 0, 0),
(24, 25, NULL, 4, 'alo alo 123', 'text', '2026-01-01 02:47:08', 0, 0),
(25, 25, NULL, 4, 'alo alo 123', 'text', '2026-01-01 02:47:08', 0, 0),
(26, 25, NULL, 4, 'alo alo 123', 'text', '2026-01-01 02:47:08', 0, 0),
(27, 25, NULL, 4, 'alo', 'text', '2026-01-01 02:47:31', 0, 0),
(28, 25, NULL, 4, 'alo', 'text', '2026-01-01 02:47:45', 0, 0),
(29, 25, NULL, 4, 'alo', 'text', '2026-01-01 02:47:45', 0, 0),
(30, 25, NULL, 4, 'alo', 'text', '2026-01-01 02:47:46', 0, 0),
(31, 25, NULL, 4, 'lo', 'text', '2026-01-01 02:48:42', 0, 0),
(32, 25, NULL, 4, 'lo', 'text', '2026-01-01 02:53:46', 0, 0),
(33, 25, NULL, 4, 'đây', 'text', '2026-01-01 02:55:39', 0, 0),
(34, 25, NULL, 4, 'siu', 'text', '2026-01-01 03:09:33', 0, 0),
(35, 25, NULL, 4, 'siu', 'text', '2026-01-01 03:09:34', 0, 0),
(36, 25, NULL, 4, 'test', 'text', '2026-01-01 03:12:36', 0, 0),
(37, 25, NULL, 4, 'test 2', 'text', '2026-01-01 03:15:31', 0, 0),
(38, 25, NULL, 4, 'được rồi', 'text', '2026-01-01 03:15:46', 0, 0),
(39, 26, NULL, 4, 'damn', 'text', '2026-01-01 03:17:12', 0, 0),
(40, 26, NULL, 4, 'damn gì', 'text', '2026-01-01 03:17:21', 0, 0),
(41, 26, NULL, 4, 'alo alo 123', 'text', '2026-01-01 03:49:33', 0, 0),
(42, 26, NULL, 4, 'nghe ro trl', 'text', '2026-01-01 03:49:49', 0, 0),
(43, 26, NULL, 4, 'duoc chua', 'text', '2026-01-01 03:55:01', 0, 0),
(44, 26, NULL, 4, 'duoc roi', 'text', '2026-01-01 03:55:09', 0, 0),
(45, 25, NULL, 1, 'dau ', 'text', '2026-01-01 03:55:29', 0, 0),
(46, 26, NULL, 1, 'dau', 'text', '2026-01-01 03:55:46', 0, 0),
(47, 25, NULL, 1, '', 'voice', '2026-01-01 07:35:57', 1, 0),
(48, 26, NULL, 1, 'Hey! Hãy tham gia máy chủ **Gyatt Daumn** của tôi! Mã mời: **A71F66**', 'text', '2026-01-03 09:25:25', 0, 0),
(49, 26, NULL, 1, 'Hey! Hãy tham gia máy chủ **Gyatt Daumn** của tôi! Mã mời: **A71F66**', 'text', '2026-01-03 09:25:44', 0, 0),
(50, 29, NULL, 1, 'Hey! Hãy tham gia máy chủ **Gyatt Daumn** của tôi! Mã mời: **A71F66**', 'text', '2026-01-03 09:25:57', 0, 0),
(51, 25, NULL, 1, 'feae', 'text', '2026-01-03 09:26:20', 0, 0),
(52, 25, NULL, 1, 'ở đây lại được', 'text', '2026-01-03 09:26:29', 0, 0),
(53, 30, NULL, 1, 'alo alo 123', 'text', '2026-01-03 09:33:19', 0, 0),
(54, 26, NULL, 1, 'Hey! Hãy tham gia máy chủ **Gyatt Daumn** của tôi! Mã mời: **A71F66**', 'text', '2026-01-03 10:17:28', 0, 0),
(55, 26, NULL, 1, 'alo alo 123', 'text', '2026-01-03 10:26:31', 0, 0),
(56, 26, NULL, 1, 'yeah được rồi', 'text', '2026-01-03 10:26:40', 0, 0),
(57, 26, NULL, 1, 'damn ', 'text', '2026-01-03 10:28:13', 0, 0),
(58, 26, NULL, 1, 'thử lại', 'text', '2026-01-03 10:32:12', 0, 0),
(59, 26, NULL, 1, 'Hey! Hãy tham gia máy chủ **Gyatt Daumn**! Mã mời: **A71F66**', 'text', '2026-01-03 10:46:20', 0, 0),
(60, 29, NULL, 1, 'alo', 'text', '2026-01-03 10:51:41', 0, 0),
(61, 35, NULL, 1, 'sàksjhfkfhawfw', 'text', '2026-01-03 13:23:31', 0, 0),
(62, 35, NULL, 1, 'ákhfga', 'text', '2026-01-03 13:23:32', 0, 0),
(63, 35, NULL, 1, 'ádad', 'text', '2026-01-03 15:50:40', 0, 0),
(64, 26, NULL, 1, '👋 Tham gia Server **Gyatt Daumn** nhé!\nMã mời: **A71F66**', 'text', '2026-01-04 03:43:27', 0, 0),
(65, 26, NULL, 1, '👋 Tham gia Server **Gyatt Daumn** nhé!\nMã mời: **A71F66**', 'text', '2026-01-04 03:44:13', 0, 1),
(66, 25, NULL, 1, 'áddadfa', 'text', '2026-01-04 03:44:24', 0, 0),
(67, 26, NULL, 1, '👋 Tham gia Server **BuongGiam** nhé!\nMã mời: **7A9020**', 'text', '2026-01-04 03:47:37', 0, 0),
(68, 44, NULL, 1, 'alo 1234', 'text', '2026-01-11 06:49:41', 0, 0),
(70, 26, NULL, 1, '👋 Tham gia Server **Gyatt Daumn** nhé!\nMã mời: **A71F66**', 'text', '2026-01-11 07:27:06', 0, 0),
(71, 30, NULL, 1, 'ádasdad', 'text', '2026-01-15 10:35:44', 0, 0),
(72, 30, NULL, 1, 'ádgsggesjrg', 'text', '2026-01-15 10:35:47', 0, 0),
(73, 29, NULL, 1, 'alo alo 123', 'text', '2026-01-16 03:26:10', 0, 0),
(74, 29, NULL, 2, '1234', 'text', '2026-01-16 03:26:30', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `message_reactions`
--

CREATE TABLE `message_reactions` (
  `reaction_id` int(11) NOT NULL,
  `message_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `emoji_code` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `message_reactions`
--

INSERT INTO `message_reactions` (`reaction_id`, `message_id`, `user_id`, `emoji_code`, `created_at`) VALUES
(4, 6, 1, '❤️', '2025-12-29 16:18:56'),
(5, 8, 1, '😂', '2025-12-29 16:22:42');

-- --------------------------------------------------------

--
-- Table structure for table `participants`
--

CREATE TABLE `participants` (
  `conversation_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `joined_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_read_message_id` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `participants`
--

INSERT INTO `participants` (`conversation_id`, `user_id`, `joined_at`, `last_read_message_id`) VALUES
(26, 1, '2025-12-29 03:26:27', 59),
(26, 4, '2025-12-29 03:26:27', 44),
(29, 1, '2025-12-29 04:55:22', 73),
(29, 2, '2025-12-29 04:55:22', 74),
(35, 1, '2026-01-03 13:11:51', 63),
(35, 2, '2026-01-04 03:48:15', 0),
(35, 4, '2026-01-04 03:43:58', 0),
(41, 1, '2026-01-04 04:50:59', 0),
(41, 4, '2026-01-10 04:22:55', 0),
(44, 1, '2026-01-11 06:49:35', 68),
(44, 4, '2026-01-11 07:06:05', 0);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `permission_id` int(11) NOT NULL,
  `permission_code` varchar(50) NOT NULL,
  `description` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`permission_id`, `permission_code`, `description`) VALUES
(1, 'msg.send', 'Được gửi tin nhắn'),
(2, 'msg.edit', 'Được sửa tin nhắn của mình'),
(3, 'msg.delete_own', 'Được xóa tin nhắn của mình'),
(4, 'msg.delete_any', 'Được xóa tin nhắn của người khác (Quản lý)'),
(5, 'msg.pin', 'Được ghim tin nhắn'),
(6, 'member.kick', 'Được đuổi thành viên ra khỏi nhóm'),
(7, 'group.edit', 'Được đổi tên/ảnh nhóm');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL,
  `server_id` int(11) DEFAULT NULL,
  `role_name` varchar(50) NOT NULL,
  `role_color` varchar(20) DEFAULT '#99aab5',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`role_id`, `server_id`, `role_name`, `role_color`, `created_at`) VALUES
(1, NULL, 'Member', '#99aab5', '2025-12-25 15:42:20'),
(2, 3, 'Admin', '#ed4245', '2025-12-29 02:41:24'),
(3, 3, 'Member', '#99aab5', '2025-12-29 02:41:24'),
(4, 4, 'Admin', '#ed4245', '2025-12-29 04:03:19'),
(5, 4, 'Member', '#99aab5', '2025-12-29 04:03:19'),
(6, 5, 'Admin', '#ed4245', '2025-12-29 09:58:00'),
(7, 5, 'Member', '#99aab5', '2025-12-29 09:58:00');

-- --------------------------------------------------------

--
-- Table structure for table `servers`
--

CREATE TABLE `servers` (
  `server_id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `server_name` varchar(100) NOT NULL,
  `icon_url` varchar(255) DEFAULT 'default_server.png',
  `invite_code` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_public` tinyint(1) DEFAULT 0,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `servers`
--

INSERT INTO `servers` (`server_id`, `owner_id`, `server_name`, `icon_url`, `invite_code`, `created_at`, `is_public`, `description`) VALUES
(1, 1, 'Hacker Lore', 'https://i.pinimg.com/736x/b5/1b/78/b51b78ecc8e543354959110754942436.jpg', NULL, '2025-12-25 10:38:26', 0, NULL),
(2, 1, 'Góc Chơi Game', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqf0i81Gj9y-l7d3F3u6u1y0qV_8w6y3w6yA&usqp=CAU', NULL, '2025-12-25 10:38:26', 0, NULL),
(3, 1, 'Gyatt Daumn', 'https://ui-avatars.com/api/?name=Gyatt+Daumn&background=random&size=128', 'A71F66', '2025-12-29 02:41:24', 0, NULL),
(4, 1, 'Siuuuuuu', 'https://ui-avatars.com/api/?name=Siuuuuuu&background=random&size=128', '188413', '2025-12-29 04:03:19', 0, NULL),
(5, 2, 'BuongGiam', 'https://ui-avatars.com/api/?name=BuongGiam&background=random&size=128', '7A9020', '2025-12-29 09:58:00', 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `server_bans`
--

CREATE TABLE `server_bans` (
  `server_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `reason` text DEFAULT NULL,
  `banned_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `banned_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `server_bans`
--

INSERT INTO `server_bans` (`server_id`, `user_id`, `reason`, `banned_at`, `banned_by`) VALUES
(3, 4, 'Vi phạm nội quy', '2026-01-04 03:23:27', 1);

-- --------------------------------------------------------

--
-- Table structure for table `server_participants`
--

CREATE TABLE `server_participants` (
  `server_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `joined_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `server_participants`
--

INSERT INTO `server_participants` (`server_id`, `user_id`, `role_id`, `joined_at`) VALUES
(3, 1, 2, '2025-12-29 02:41:24'),
(3, 2, 2, '2025-12-29 04:54:48'),
(4, 1, 4, '2025-12-29 04:03:19'),
(5, 1, 7, '2026-01-03 09:33:02'),
(5, 2, 6, '2025-12-29 09:58:00'),
(5, 5, 7, '2025-12-31 08:29:08'),
(5, 6, 7, '2026-01-04 02:07:27');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `avatar_url` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_activity` datetime DEFAULT NULL,
  `status_mode` varchar(20) DEFAULT 'offline',
  `status_until` datetime DEFAULT NULL,
  `bio` varchar(255) DEFAULT NULL,
  `reset_token` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password_hash`, `full_name`, `avatar_url`, `email`, `created_at`, `last_activity`, `status_mode`, `status_until`, `bio`, `reset_token`) VALUES
(1, 'phat', '123', 'ha van phat rach', 'avatar_1_1767183611.png', 'phat123@gmail.com', '2025-12-25 03:38:05', '2026-01-16 11:40:34', 'offline', NULL, 'Qua met  moi', NULL),
(2, 'phat2', 'deptrai', 'ha minh huy', '2.jpg', '', '2025-12-25 03:38:05', '2026-01-16 11:11:40', 'offline', NULL, 'Mình là thành viên mới', NULL),
(4, 'vanh', '123', 'Phat Ngu', 'default.png', '', '2025-12-25 09:34:54', '2026-01-01 10:55:06', 'online', NULL, NULL, NULL),
(5, 'bang', '123', 'phat ngu', 'default.png', 'alfh@gmail.com', '2025-12-31 08:28:21', '2025-12-31 15:29:10', 'online', NULL, NULL, NULL),
(6, 'hung', '123', 'hung nguyen', 'default.png', 'hungnguyen123@gmail.com', '2026-01-04 02:07:14', '2026-01-04 09:11:15', 'online', NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attachments`
--
ALTER TABLE `attachments`
  ADD PRIMARY KEY (`attachment_id`),
  ADD KEY `message_id` (`message_id`);

--
-- Indexes for table `conversations`
--
ALTER TABLE `conversations`
  ADD PRIMARY KEY (`conversation_id`),
  ADD KEY `creator_id` (`creator_id`),
  ADD KEY `server_id` (`server_id`);

--
-- Indexes for table `friendships`
--
ALTER TABLE `friendships`
  ADD PRIMARY KEY (`requester_id`,`addressee_id`),
  ADD KEY `addressee_id` (`addressee_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `conversation_id` (`conversation_id`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `fk_msg_reply` (`reply_to_message_id`);

--
-- Indexes for table `message_reactions`
--
ALTER TABLE `message_reactions`
  ADD PRIMARY KEY (`reaction_id`),
  ADD KEY `message_id` (`message_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `participants`
--
ALTER TABLE `participants`
  ADD PRIMARY KEY (`conversation_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`permission_id`),
  ADD UNIQUE KEY `permission_code` (`permission_code`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`),
  ADD KEY `server_id` (`server_id`);

--
-- Indexes for table `servers`
--
ALTER TABLE `servers`
  ADD PRIMARY KEY (`server_id`),
  ADD UNIQUE KEY `invite_code` (`invite_code`),
  ADD KEY `owner_id` (`owner_id`);

--
-- Indexes for table `server_bans`
--
ALTER TABLE `server_bans`
  ADD PRIMARY KEY (`server_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `server_participants`
--
ALTER TABLE `server_participants`
  ADD PRIMARY KEY (`server_id`,`user_id`),
  ADD KEY `fk_sp_role` (`role_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attachments`
--
ALTER TABLE `attachments`
  MODIFY `attachment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `conversations`
--
ALTER TABLE `conversations`
  MODIFY `conversation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `message_reactions`
--
ALTER TABLE `message_reactions`
  MODIFY `reaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `permission_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `servers`
--
ALTER TABLE `servers`
  MODIFY `server_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attachments`
--
ALTER TABLE `attachments`
  ADD CONSTRAINT `attachments_ibfk_1` FOREIGN KEY (`message_id`) REFERENCES `messages` (`message_id`) ON DELETE CASCADE;

--
-- Constraints for table `conversations`
--
ALTER TABLE `conversations`
  ADD CONSTRAINT `conversations_ibfk_1` FOREIGN KEY (`creator_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `fk_conv_server` FOREIGN KEY (`server_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE;

--
-- Constraints for table `friendships`
--
ALTER TABLE `friendships`
  ADD CONSTRAINT `friendships_ibfk_1` FOREIGN KEY (`requester_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `friendships_ibfk_2` FOREIGN KEY (`addressee_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `fk_msg_reply` FOREIGN KEY (`reply_to_message_id`) REFERENCES `messages` (`message_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`conversation_id`) REFERENCES `conversations` (`conversation_id`),
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`sender_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `message_reactions`
--
ALTER TABLE `message_reactions`
  ADD CONSTRAINT `message_reactions_ibfk_1` FOREIGN KEY (`message_id`) REFERENCES `messages` (`message_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `message_reactions_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `participants`
--
ALTER TABLE `participants`
  ADD CONSTRAINT `participants_ibfk_1` FOREIGN KEY (`conversation_id`) REFERENCES `conversations` (`conversation_id`),
  ADD CONSTRAINT `participants_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `roles`
--
ALTER TABLE `roles`
  ADD CONSTRAINT `fk_role_server` FOREIGN KEY (`server_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE;

--
-- Constraints for table `servers`
--
ALTER TABLE `servers`
  ADD CONSTRAINT `servers_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `server_bans`
--
ALTER TABLE `server_bans`
  ADD CONSTRAINT `server_bans_ibfk_1` FOREIGN KEY (`server_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `server_bans_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `server_participants`
--
ALTER TABLE `server_participants`
  ADD CONSTRAINT `fk_sp_role` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `server_participants_ibfk_1` FOREIGN KEY (`server_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
