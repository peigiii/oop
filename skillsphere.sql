-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 22, 2025 at 09:37 AM
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
-- Database: `skillspheredb`
--

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `announcements`
--

INSERT INTO `announcements` (`id`, `title`, `message`, `created_at`) VALUES
(1, 'update system for 5/5', 'dear user ,\r\nwe will update our system tomorrow for a while ,thank you', '2025-05-07 10:55:05');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `is_read` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT current_timestamp(),
  `type` varchar(50) DEFAULT 'general'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `title`, `message`, `is_read`, `created_at`, `type`) VALUES
(1, 16, 'Welcome!', 'You have successfully registered to SkillSphere!', 1, '2025-05-08 15:38:40', 'general'),
(2, 16, 'Quiz Completed', '✅ You scored 0 out of 5.', 1, '2025-05-08 16:54:01', 'quiz'),
(3, 16, 'Quiz Result - python_level_1', '✅ You scored 1 out of 20.', 1, '2025-05-08 17:56:16', 'quiz'),
(4, 16, 'Quiz Result - python_level_1', '✅ You scored 3 out of 20.', 1, '2025-05-08 18:27:59', 'quiz'),
(5, 16, 'Quiz Result - python_level_3', '📝 Thank you for submitting your code. Your result will be reviewed by an instructor.', 1, '2025-05-08 21:06:32', 'quiz'),
(6, 16, 'Quiz Result - python_level_2', '✅ You scored 6 out of 20.', 1, '2025-05-08 21:12:08', 'quiz'),
(7, 16, 'Quiz Result - python_level_2', '✅ You scored 4 out of 20.', 1, '2025-05-08 21:19:59', 'quiz'),
(8, 16, 'Quiz Result - python_level_2', '✅ You scored 3 out of 20.', 1, '2025-05-08 21:20:42', 'quiz'),
(9, 16, 'Quiz Result - python_level_1', '✅ You scored 1 out of 20.', 1, '2025-05-08 21:35:37', 'quiz'),
(10, 16, 'Quiz Result - python_level_2', '✅ You scored 6 out of 20.', 1, '2025-05-08 21:38:47', 'quiz'),
(11, 16, 'Quiz Result - python_level_1', '✅ You scored 1 out of 20.', 1, '2025-05-08 21:46:04', 'quiz'),
(12, 16, 'Quiz Result - python_level_1', '✅ You scored 2 out of 20.', 1, '2025-05-08 21:52:31', 'quiz'),
(13, 16, 'Quiz Result - python_level_1', '✅ You scored 1 out of 20.', 1, '2025-05-08 21:58:02', 'quiz'),
(14, 16, 'Quiz Result - python_level_1', '✅ You scored 1 out of 20.', 1, '2025-05-08 22:09:27', 'quiz'),
(15, 16, 'Quiz Result - python_level_1', '✅ You scored 1 out of 20.', 1, '2025-05-09 14:45:03', 'quiz'),
(16, 16, 'Quiz Result - python_level_1', '✅ You scored 1 out of 20.', 1, '2025-05-09 15:05:55', 'quiz'),
(17, 16, 'Quiz Result - python_level_1', '✅ You scored 1 out of 20.', 1, '2025-05-09 15:11:44', 'quiz'),
(18, 16, 'Quiz Result - python level 2', '📝 Thank you for submitting your code. Your result will be reviewed by an instructor.', 1, '2025-05-09 15:17:41', 'quiz'),
(19, 16, 'Quiz Result - python level 1', '📝 Thank you for submitting your code. Your result will be reviewed by an instructor.', 1, '2025-05-09 15:21:59', 'quiz'),
(20, 16, 'Quiz Result - java level 1', '✅ You scored 0 out of 20.', 1, '2025-05-09 16:14:28', 'quiz'),
(21, 16, 'Quiz Result - java level 2', '✅ You scored 0 out of 20.', 1, '2025-05-09 16:21:22', 'quiz'),
(22, 16, 'Quiz Result - java level 1', '✅ You scored 1 out of 20.', 1, '2025-05-09 18:26:12', 'quiz'),
(23, 16, 'Quiz Result - sql level 1', '📝 Thank you for submitting your code. Your result will be reviewed by an instructor.', 1, '2025-05-09 21:24:58', 'quiz'),
(24, 16, 'Quiz Result - sql level 1', '📝 Thank you for submitting your code. Your result will be reviewed by an instructor.', 1, '2025-05-09 21:33:28', 'quiz'),
(25, 16, 'Quiz Result - sql level 1', '📝 Thank you for submitting your code. Your result will be reviewed by an instructor.', 1, '2025-05-09 21:36:43', 'quiz'),
(26, 16, 'Quiz Result - cpp level 1', '✅ You scored 3 out of 20.', 1, '2025-05-09 22:18:42', 'quiz'),
(27, 16, 'Quiz Result - cpp level 1', '✅ You scored 7 out of 20.', 1, '2025-05-09 22:22:33', 'quiz'),
(28, 16, 'Quiz Result - editing_ps_level_1', '📝 Thank you for submitting your code. Your result will be reviewed by an instructor.', 1, '2025-05-10 01:49:04', 'quiz'),
(29, 16, 'Quiz Result - editing_ps_level_1', '📝 Thank you for submitting your code. Your result will be reviewed by an instructor.', 1, '2025-05-10 01:49:10', 'quiz'),
(30, 16, 'Quiz Result - editing_ps_level_1', '📝 Thank you for submitting your code. Your result will be reviewed by an instructor.', 1, '2025-05-10 01:49:18', 'quiz'),
(31, 16, 'Quiz Result - editing_ps_level_1', '📝 Thank you for submitting your code. Your result will be reviewed by an instructor.', 1, '2025-05-10 01:49:42', 'quiz'),
(32, 16, 'Quiz Result - editing_ps_level_3', '📝 Thank you for submitting your code. Your result will be reviewed by an instructor.', 1, '2025-05-10 01:50:35', 'quiz'),
(33, 16, 'Quiz Result - editing_ps_level_1', '📝 Thank you for submitting your code. Your result will be reviewed by an instructor.', 1, '2025-05-10 01:51:51', 'quiz'),
(34, 16, 'Quiz Result - editing_ps_level_1', '✅ You scored 2 out of 2.', 1, '2025-05-10 01:59:58', 'quiz'),
(35, 16, 'Quiz Result - editing_ps_level_3', '📝 Thank you for submitting your code. Your result will be reviewed by an instructor.', 1, '2025-05-10 02:19:12', 'quiz'),
(36, 16, 'Quiz Result - editing_ps_level_2', '✅ You scored 1 out of 2.', 0, '2025-05-10 03:19:04', 'quiz'),
(37, 16, 'Quiz Result - editing_ps_level_2', '✅ You scored 0 out of 1.', 0, '2025-05-10 03:22:19', 'quiz'),
(38, 16, 'Quiz Result - editing_ps_level_2', '✅ You scored 0 out of 2.', 0, '2025-05-10 03:28:09', 'quiz'),
(39, 16, 'Quiz Result - editing_ps_level_2', '✅ You scored 1 out of 2.', 1, '2025-05-10 03:45:53', 'quiz'),
(40, 16, 'Quiz Result - editing_ps_level_3', '📝 Thank you for submitting your code. Your result will be reviewed by an instructor.', 1, '2025-05-10 03:46:15', 'quiz'),
(41, 16, 'Quiz Result - editing_ps_level_2', '✅ You scored 1 out of 2.', 1, '2025-05-10 03:50:21', 'quiz'),
(42, 16, 'Quiz Result - editing_ps_level_3', '✅ You scored 0 out of 1.', 1, '2025-05-10 03:54:23', 'quiz'),
(43, 16, 'Quiz Result - editing_ps_level_3', '✅ You scored 0 out of 1.', 1, '2025-05-10 03:54:41', 'quiz'),
(44, 16, 'Quiz Result - editing_ps_level_1', '✅ You scored 1 out of 2.', 1, '2025-05-10 12:52:39', 'quiz'),
(45, 16, 'Quiz Result - editing_ps_level_3', '✅ You scored 0 out of 2.', 1, '2025-05-10 12:54:13', 'quiz'),
(46, 16, 'Quiz Result - editing_ps_level_3', '✅ You scored 0 out of 2.', 1, '2025-05-10 13:06:49', 'quiz'),
(47, 16, 'Quiz Result - editing_ps_level_3', '✅ You scored 1 out of 2.', 1, '2025-05-10 13:07:12', 'quiz'),
(48, 16, 'Quiz Result - editing_ps_level_3', '✅ You scored 1 out of 3.', 1, '2025-05-10 13:16:19', 'quiz'),
(49, 16, 'Quiz Result - design_level_1', '✅ You scored 0 out of 1.', 1, '2025-05-10 15:20:01', 'quiz'),
(50, 16, 'Quiz Result - design_level_1', '✅ You scored 4 out of 20.', 1, '2025-05-10 15:43:11', 'quiz'),
(51, 16, 'Quiz Result - language_chinese_level_1', '✅ You scored 4 out of 20.', 1, '2025-05-10 17:18:30', 'quiz'),
(52, 16, 'Quiz Result - language_chinese_level_1', '✅ You scored 2 out of 20.', 1, '2025-05-10 17:19:47', 'quiz'),
(53, 16, 'Quiz Result - language_chinese_level_1', '✅ You scored 5 out of 20.', 1, '2025-05-10 17:30:34', 'quiz'),
(54, 16, 'Quiz Result - language_chinese_level_1', '✅ You scored 1 out of 20.', 1, '2025-05-10 17:40:51', 'quiz'),
(55, 16, 'Quiz Result - language_chinese_level_1', '✅ You scored 16 out of 20.', 1, '2025-05-10 17:46:48', 'quiz'),
(56, 16, 'Quiz Result - language_japanese_level_2', '✅ You scored 5 out of 20.', 0, '2025-05-10 17:53:27', 'quiz'),
(57, 16, 'Quiz Result - design_level_2', '✅ You scored 1 out of 20.', 0, '2025-05-10 17:57:50', 'quiz'),
(58, 16, 'Quiz Result - editing_ps_level_1', '✅ You scored 2 out of 2.', 0, '2025-05-10 18:01:23', 'quiz'),
(59, 16, 'Quiz Result - editing_ps_level_1', '✅ You scored 1 out of 2.', 0, '2025-05-10 18:06:23', 'quiz'),
(60, 16, 'Quiz Result - design_level_3', '📝 Thank you for submitting your code. Your result will be reviewed by an instructor.', 0, '2025-05-10 18:07:08', 'quiz'),
(61, 16, 'Quiz Result - editing_ps_level_1', '✅ You scored 2 out of 2.', 1, '2025-05-10 18:10:11', 'quiz'),
(62, 16, 'Quiz Result - editing_ps_level_1', '✅ You scored 2 out of 2.', 1, '2025-05-10 18:10:56', 'quiz'),
(63, 16, 'Quiz Result - design_level_1', '✅ You scored 4 out of 20.', 1, '2025-05-10 18:15:08', 'quiz'),
(64, 16, 'Quiz Result - editing_ps_level_1', '✅ You scored 1 out of 2.', 1, '2025-05-10 18:15:43', 'quiz'),
(65, 16, 'Quiz Result - editing_ps_level_1', '✅ You scored 1 out of 2.', 1, '2025-05-10 18:15:45', 'quiz'),
(66, 16, 'Quiz Result - editing_ps_level_1', '✅ You scored 1 out of 2.', 1, '2025-05-10 18:18:17', 'quiz'),
(67, 16, 'Quiz Result - editing_ps_level_1', '✅ You scored 1 out of 2.', 1, '2025-05-10 18:20:34', 'quiz'),
(68, 16, 'Quiz Result - editing_ps_level_1', '✅ You scored 2 out of 2.', 1, '2025-05-10 18:20:52', 'quiz'),
(69, 16, 'Quiz Result - editing_ps_level_1', '✅ You scored 1 out of 2.', 1, '2025-05-10 18:21:51', 'quiz'),
(70, 16, 'Quiz Result - editing_ps_level_1', '✅ You scored 2 out of 2.', 1, '2025-05-10 18:26:57', 'quiz'),
(71, 16, 'Quiz Result - editing_ps_level_1', '✅ You scored 2 out of 2.', 1, '2025-05-10 18:31:21', 'quiz'),
(72, 16, 'Quiz Result - editing_ps_level_1', '✅ You scored 2 out of 2.', 1, '2025-05-10 18:33:17', 'quiz'),
(73, 16, 'Quiz Result - editing_ps_level_1', '✅ You scored 1 out of 2.', 1, '2025-05-10 18:39:57', 'quiz'),
(74, 16, 'Quiz Result - design_level_1', '✅ You scored 1 out of 20.', 1, '2025-05-10 18:42:24', 'quiz'),
(75, 16, 'Quiz Result - animation_level_1', '✅ You scored 4 out of 20.', 1, '2025-05-10 19:12:48', 'quiz'),
(76, 16, 'Quiz Result - animation_level_3', '✅ You scored 5 out of 20.', 1, '2025-05-10 19:19:39', 'quiz'),
(77, 16, 'Quiz Result - cpp_level_2', '✅ You scored 2 out of 14.', 1, '2025-05-10 19:43:38', 'quiz'),
(78, 16, 'Quiz Result - cpp_level_3', '📝 Thank you for submitting your code. Your result will be reviewed by an instructor.', 1, '2025-05-10 19:55:11', 'quiz'),
(79, 16, 'Quiz Result - sql_level_3', '📝 Thank you for submitting your code. Your result will be reviewed by an instructor.', 1, '2025-05-10 20:19:51', 'quiz'),
(80, 16, 'Quiz Result - python_level_1', '✅ You scored 1 out of 20.', 1, '2025-05-10 20:41:49', 'quiz'),
(81, 20, 'Quiz Result - animation_level_1', '✅ You scored 10 out of 20.', 1, '2025-05-11 00:00:11', 'quiz'),
(82, 20, 'Quiz Result - language_chinese_level_1', '✅ You scored 19 out of 20.', 1, '2025-05-11 00:06:28', 'quiz'),
(83, 20, 'Quiz Result - language_chinese_level_3', '📝 Thank you for submitting your code. Your result will be reviewed by an instructor.', 1, '2025-05-11 00:11:43', 'quiz'),
(84, 21, 'Quiz Result - python_level_1', '✅ You scored 4 out of 20.', 1, '2025-05-20 12:46:52', 'quiz'),
(85, 21, 'Quiz Result - python_level_3', '📝 Thank you for submitting your code. Your result will be reviewed by an instructor.', 1, '2025-05-20 13:17:31', 'quiz'),
(86, 16, 'Quiz Result - python_level_3', '📝 Thank you for submitting your code. Your result will be reviewed by an instructor.', 1, '2025-05-21 21:07:44', 'quiz'),
(87, 16, 'Quiz Result - python_level_2', '✅ You scored 7 out of 20.', 1, '2025-05-22 11:59:39', 'quiz');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `skill_category` varchar(255) DEFAULT NULL,
  `question_text` text DEFAULT NULL,
  `question_image` varchar(255) DEFAULT NULL,
  `option_a` text DEFAULT NULL,
  `option_a_image` varchar(255) DEFAULT NULL,
  `option_b` text DEFAULT NULL,
  `option_b_image` varchar(255) DEFAULT NULL,
  `option_c` text DEFAULT NULL,
  `option_c_image` varchar(255) DEFAULT NULL,
  `option_d` text DEFAULT NULL,
  `option_d_image` varchar(255) DEFAULT NULL,
  `correct_option` char(1) DEFAULT NULL,
  `TYPE` varchar(20) DEFAULT 'mcq',
  `subjective_answer` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `skill_category`, `question_text`, `question_image`, `option_a`, `option_a_image`, `option_b`, `option_b_image`, `option_c`, `option_c_image`, `option_d`, `option_d_image`, `correct_option`, `TYPE`, `subjective_answer`) VALUES
(1, 'editing_ps_level_1', 'what is the problem?', '', 'this ', '', 'count', '', 'sum', '', 'add', '', 'a', 'mcq', NULL),
(8, 'editing_ps_level_1', '1.Which panel in Photoshop lets you non destructively adjust brightness/contrast, hue/saturation, and more?', NULL, 'A. Layers', NULL, 'B. Adjustments', NULL, 'C. History', NULL, 'D. Channels', NULL, 'b', 'mcq', NULL),
(21, 'skill_category', 'question_text', 'question_image', 'option_a', 'option_a_image', 'option_b', 'option_b_image', 'option_c', 'option_c_image', 'option_d', 'option_d_image', 'c', 'TYPE', 'subjective_answer'),
(22, 'skill_category', 'question_text', 'question_image', 'option_a', 'option_a_image', 'option_b', 'option_b_image', 'option_c', 'option_c_image', 'option_d', 'option_d_image', 'c', 'TYPE', 'subjective_answer'),
(54, 'design_level_1', 'Hitting which of the following keys will make palettes and the toolbox go away?', '', 'Shift + Tab', '', 'D minor', '', 'Tab', '', 'Ctrl + X', '', 'c', 'mcq', '\r'),
(55, 'design_level_1', 'To fill in a layer as a background, which of the following tools would be useful?', '', 'Marguee', '', 'Lasso', '', 'Gradient', '', 'None of These', '', 'a', 'mcq', '\r'),
(56, 'design_level_1', 'Which of the following is a vector graphics editor?', '', 'Adobe Photoshop', '', 'Adobe Illustrator', '', 'Corel Painter', '', 'Canva', '', 'b', 'mcq', '\r'),
(57, 'design_level_1', 'What does CMYK stand for in printing?', '', 'Cyan, Magenta, Yellow, Key (Black)', '', 'Colour Mix Yellow Key', '', 'Contrast, Midtone, Yellow, Key', '', 'Cyan, Magenta, Yellow, Khaki', '', 'a', 'mcq', '\r'),
(58, 'design_level_1', 'What is the purpose of a \'grid\' in design?', '', 'To store images', '', 'To align elements consistently', '', 'To create 3D effects', '', 'To apply gradients', '', 'b', 'mcq', '\r'),
(59, 'design_level_1', 'Which tool is used to select irregular areas in an image?', '', 'Polygonal Lasso Tool', '', 'Magic Wand', '', 'Marquee Tool', '', 'Eraser', '', 'a', 'mcq', '\r'),
(60, 'design_level_1', 'What is the default file extension for Photoshop files?', '', '.psd', '', '.jpeg', '', '.png', '', '.tiff', '', 'a', 'mcq', '\r'),
(61, 'design_level_1', 'Which color model is most commonly used for web graphics?', '', 'RGB', '', 'CMYK', '', 'HSL', '', 'PMS', '', 'a', 'mcq', '\r'),
(62, 'design_level_1', 'In Illustrator, what is the purpose of the Pen Tool?', '', 'Draw paths', '', 'Fill colors', '', 'Crop images', '', 'Add text', '', 'a', 'mcq', '\r'),
(63, 'design_level_1', 'What does DPI stand for?', '', 'Dots Per Inch', '', 'Digital Pixel Integration', '', 'Data Per Interface', '', 'Dimension Proportion Indicator', '', 'a', 'mcq', '\r'),
(64, 'design_level_1', 'Which of the following is NOT a font file format?', '', '.ttf', '', '.otf', '', '.ai', '', '.woff', '', 'c', 'mcq', '\r'),
(65, 'design_level_1', 'What is the primary function of the Layers panel in Photoshop?', '', 'Organize content', '', 'Change color mode', '', 'Resize canvas', '', 'Apply filters', '', 'a', 'mcq', '\r'),
(66, 'design_level_1', 'What is the main purpose of a wireframe?', '', 'Visual layout', '', 'Final design', '', 'Print preparation', '', 'Typography settings', '', 'a', 'mcq', '\r'),
(67, 'design_level_1', 'What is a common resolution for printing high-quality images?', '', '300 DPI', '', '72 DPI', '', '100 DPI', '', '150 DPI', '', 'a', 'mcq', '\r'),
(68, 'design_level_1', 'What file format is preferred for transparent images?', '', '.png', '', '.jpg', '', '.bmp', '', '.pdf', '', 'a', 'mcq', '\r'),
(69, 'design_level_1', 'What is the shortcut for the Hand Tool in Photoshop?', '', 'H', '', 'V', '', 'T', '', 'E', '', 'a', 'mcq', '\r'),
(70, 'design_level_1', 'Which tool would you use to remove blemishes in an image?', '', 'Spot Healing Brush', '', 'Crop Tool', '', 'Gradient Tool', '', 'Move Tool', '', 'a', 'mcq', '\r'),
(71, 'design_level_1', 'What is the primary use of the Clone Stamp Tool?', '', 'Duplicate parts of an image', '', 'Select colors', '', 'Add text', '', 'Apply gradients', '', 'a', 'mcq', '\r'),
(72, 'design_level_1', 'What is the purpose of the Smudge Tool?', '', 'Blend pixels', '', 'Erase content', '', 'Select colors', '', 'Draw shapes', '', 'a', 'mcq', '\r'),
(73, 'design_level_1', 'Which of the following is a raster graphics editor?', '', 'Adobe Photoshop', '', 'Adobe Illustrator', '', 'CorelDRAW', '', 'InDesign', '', 'a', 'mcq', '\r'),
(85, 'design_level_2', 'What does RGB stand for?', '', 'Red, Gold, Blue', '', 'Red, Green, Black', '', 'Red, Green, Blue', '', 'Radiant Gradient Blend', '', 'c', 'mcq', '\r'),
(86, 'design_level_2', 'Which of the following is an example of a raster graphics file?', '', 'AI', '', 'SVG', '', 'PSD', '', 'EPS', '', 'c', 'mcq', '\r'),
(87, 'design_level_2', 'A client provides a low-resolution logo in JPG format for a billboard. What is the best response?', '', 'Upscale in Photoshop', '', 'Sharpen filter', '', 'Redesign as vector in Illustrator', '', 'Convert to PNG', '', 'c', 'mcq', '\r'),
(88, 'design_level_2', 'Which combination ensures responsive web design across screen sizes?', '', 'Colour theory', '', 'Grid systems and media queries', '', 'Kerning and leading', '', 'Print resolution', '', 'b', 'mcq', '\r'),
(89, 'design_level_2', 'What design choices best align with eco-conscious branding?', '', 'Bright neons', '', 'Natural textures and earth tones', '', 'High-contrast black and white', '', 'Minimalist metallic', '', 'b', 'mcq', '\r'),
(90, 'design_level_2', 'Which feature in InDesign helps create consistent layouts across pages?', '', 'Paragraph Styles', '', 'Master Pages', '', 'Preflight Panel', '', 'Layers', '', 'b', 'mcq', '\r'),
(91, 'design_level_2', 'Which combination of elements guides visual hierarchy effectively?', '', 'Alignment and symmetry', '', 'Bright colours and texture', '', 'Scale, contrast, white space', '', 'Saturation and gradients', '', 'c', 'mcq', '\r'),
(92, 'design_level_2', 'What happens if a CMYK file is converted to RGB for print?', '', 'Low resolution', '', 'Darker colours', '', 'Font issues', '', 'Larger file size', '', 'b', 'mcq', '\r'),
(93, 'design_level_2', 'How should colour profiles be managed for screen and print use?', '', 'Use RGB for both', '', 'Start in RGB, convert to CMYK', '', 'Grayscale initially', '', 'Always CMYK', '', 'b', 'mcq', '\r'),
(94, 'design_level_2', 'What design decision helps users notice a primary call-to-action button?', '', 'Reduce white space', '', 'Increase size and contrast', '', 'Add text', '', 'Move to footer', '', 'b', 'mcq', '\r'),
(95, 'design_level_2', 'Why export logos in multiple formats like SVG, PNG, PDF?', '', 'Only SVG is needed', '', 'Compatibility: SVG for scalability, PNG for web, PDF for print', '', 'Resolution suffices', '', 'File types are interchangeable', '', 'b', 'mcq', '\r'),
(96, 'design_level_2', 'Best practices for designing infographics for clear communication?', '', 'Use multiple fonts', '', '3D pie charts', '', 'Consistent icons and visual hierarchy', '', 'Embed long paragraphs', '', 'c', 'mcq', '\r'),
(97, 'design_level_2', 'What is the first step for visual consistency across platforms?', '', 'Design the logo', '', 'Choose website colors', '', 'Create a style guide', '', 'Start with homepage', '', 'c', 'mcq', '\r'),
(98, 'design_level_2', 'Difference between modular grid and column grid?', '', 'Modular grid is for complex layouts', '', 'Modular grid is less flexible', '', 'Column grid is only for posters', '', 'Both are the same', '', 'a', 'mcq', '\r'),
(99, 'design_level_2', 'Best approach to designing for color vision deficiency?', '', 'Bright primary colors', '', 'Colorblind-safe palettes', '', 'Avoid color', '', 'Gradients for contrast', '', 'b', 'mcq', '\r'),
(100, 'design_level_2', 'Why consider negative space in logo design?', '', 'Adds color variation', '', 'Enhances symmetry', '', 'Improves legibility', '', 'Reveals hidden meanings', '', 'd', 'mcq', '\r'),
(101, 'design_level_2', 'Difference between raster and vector effects in Illustrator?', '', 'Raster is preferred for logos', '', 'Raster pixelates when scaled', '', 'Vector is not editable', '', 'Raster loads faster', '', 'b', 'mcq', '\r'),
(102, 'design_level_2', 'What design elements communicate luxury?', '', 'Neon colors', '', 'Soft gradients', '', 'Serif fonts and gold accents', '', 'Minimalist black and white', '', 'c', 'mcq', '\r'),
(103, 'design_level_2', 'Best export settings for a multi-page brochure for offset printing?', '', 'RGB PNG', '', 'PDF/X-1a with bleed', '', 'High-quality JPEG', '', 'SVG', '', 'b', 'mcq', '\r'),
(104, 'design_level_2', 'What is the Gestalt principle of \'closure\' in design?', '', 'Completing shapes mentally', '', 'Preferring enclosed elements', '', 'Symmetrical balance', '', 'Color to close composition', '', 'a', 'mcq', '\r'),
(116, 'design_level_3', 'Logo Design Challenge: Design a logo for a fictional eco-friendly tech startup called GreenByte. Reflect sustainability and technology.', '', '', '', '', '', '', '', '', '', '', 'subjective', '\r'),
(117, 'design_level_3', 'Social Media Campaign Design: Create a 3-post Instagram carousel for a non-profit promoting mental health awareness. Be visually engaging.', '', '', '', '', '', '', '', '', '', '', 'subjective', '\r'),
(118, 'design_level_3', 'Design an infographic that explains the basics of climate change to middle school students. Use visual hierarchy and simple language.', '', '', '', '', '', '', '', '', '', '', 'subjective', '\r'),
(119, 'design_level_3', 'Logo & Branding: Rebrand a Local Café. Create a new logo, colour palette, and typography for a small neighbourhood coffee shop.', '', '', '', '', '', '', '', '', '', '', 'subjective', '\r'),
(120, 'design_level_3', 'Print & Publication: Lay out a two-page magazine spread on \'The Future of Sustainable Fashion\'. Use hierarchy and columns.', '', '', '', '', '', '', '', '', '', '', 'subjective', '\r'),
(121, 'design_level_3', 'Packaging: Redesign the packaging for a common household item, focusing on shelf appeal and clear labeling.', '', '', '', '', '', '', '', '', '', '', 'subjective', '\r'),
(122, 'design_level_3', 'Digital & Interface: Design the splash screen for a meditation app. Consider mood, color psychology, and readability.', '', '', '', '', '', '', '', '', '', '', 'subjective', '\r'),
(123, 'design_level_3', 'Illustration & Iconography: Create a cohesive set of 8–10 icons for a travel website, maintaining consistent style.', '', '', '', '', '', '', '', '', '', '', 'subjective', '\r'),
(124, 'design_level_3', 'Experiential & Environmental: Design wayfinding signage for a university campus. Define iconography, hierarchy, and materials.', '', '', '', '', '', '', '', '', '', '', 'subjective', '\r'),
(125, 'design_level_3', 'Motion & Animation: Animated Logo Concept. Create a 5-second animated reveal of a company’s logo, focusing on timing and brand personality.', '', '', '', '', '', '', '', '', '', '', 'subjective', '\r'),
(177, 'language_chinese_level_2', '以下哪个词语表示感到无聊、没有事情可做？', '', '百无聊赖', '', '手舞足蹈', '', '心花怒放', '', '愁眉苦脸', '', 'a', 'mcq', '\r'),
(178, 'language_chinese_level_2', '成语“望梅止渴”出自哪个历史人物的故事？', '', '曹操', '', '刘备', '', '孙权', '', '诸葛亮', '', 'a', 'mcq', '\r'),
(179, 'language_chinese_level_2', '“东施效颦”这个成语表达了什么含义？', '', '模仿不成反而出丑', '', '善于学习', '', '勤学苦练', '', '自强不息', '', 'a', 'mcq', '\r'),
(180, 'language_chinese_level_2', '“卧薪尝胆”与下列哪个历史人物有关？', '', '勾践', '', '项羽', '', '李世民', '', '赵云', '', 'a', 'mcq', '\r'),
(181, 'language_chinese_level_2', '“三顾茅庐”中的“三顾”是什么意思？', '', '三次拜访', '', '三次拒绝', '', '三次演讲', '', '三次合作', '', 'a', 'mcq', '\r'),
(182, 'language_chinese_level_2', '“三人行，必有我师”是谁的名言？', '', '孔子', '', '孟子', '', '老子', '', '庄子', '', 'a', 'mcq', '\r'),
(183, 'language_chinese_level_2', '“风声鹤唳，草木皆兵”表达的意思是？', '', '过分紧张', '', '非常勇敢', '', '冷静沉着', '', '心情舒畅', '', 'a', 'mcq', '\r'),
(184, 'language_chinese_level_2', '成语“杯弓蛇影”告诉我们什么道理？', '', '疑神疑鬼', '', '大智若愚', '', '顺其自然', '', '水到渠成', '', 'a', 'mcq', '\r'),
(185, 'language_chinese_level_2', '“破釜沉舟”比喻什么？', '', '背水一战', '', '半途而废', '', '顺利成功', '', '失败而归', '', 'a', 'mcq', '\r'),
(186, 'language_chinese_level_2', '“四面楚歌”描述了什么情景？', '', '四面被围困', '', '四方齐声歌唱', '', '四季如歌', '', '无忧无虑', '', 'a', 'mcq', '\r'),
(187, 'language_chinese_level_2', '成语“投桃报李”是什么意思？', '', '以礼相待', '', '互相帮助', '', '忘恩负义', '', '背信弃义', '', 'b', 'mcq', '\r'),
(188, 'language_chinese_level_2', '“画蛇添足”告诉我们什么道理？', '', '多此一举', '', '精益求精', '', '事半功倍', '', '一举两得', '', 'a', 'mcq', '\r'),
(189, 'language_chinese_level_2', '“鹬蚌相争，渔翁得利”说明什么道理？', '', '两败俱伤', '', '合作共赢', '', '独占鳌头', '', '迎难而上', '', 'a', 'mcq', '\r'),
(190, 'language_chinese_level_2', '“井底之蛙”形容什么？', '', '见识短浅', '', '胸怀宽广', '', '勇于探索', '', '孤陋寡闻', '', 'a', 'mcq', '\r'),
(191, 'language_chinese_level_2', '“纸上谈兵”描述的是什么？', '', '空谈理论', '', '实践出真知', '', '劳逸结合', '', '勇往直前', '', 'a', 'mcq', '\r'),
(192, 'language_chinese_level_2', '“兔死狗烹”形容什么情况？', '', '过河拆桥', '', '相互依赖', '', '同甘共苦', '', '互助友爱', '', 'a', 'mcq', '\r'),
(193, 'language_chinese_level_2', '成语“胸有成竹”表达的意思是？', '', '有把握', '', '缺乏信心', '', '随意而为', '', '毫无计划', '', 'a', 'mcq', '\r'),
(194, 'language_chinese_level_2', '“叶公好龙”形容什么？', '', '言行不一', '', '诚实可靠', '', '胆大心细', '', '热爱生活', '', 'a', 'mcq', '\r'),
(195, 'language_chinese_level_2', '成语“狐假虎威”表示什么？', '', '假借权势', '', '勇敢无畏', '', '自食其力', '', '虚张声势', '', 'a', 'mcq', '\r'),
(196, 'language_chinese_level_2', '“刻舟求剑”告诉我们什么道理？', '', '刻舟求进', '', '固执己见', '', '水能载舟', '', '顺其自然', '', 'b', 'mcq', '\r'),
(208, 'language_chinese_level_3', '请用不少于300字描述你的家乡风景。', '', '', '', '', '', '', '', '', '', '', 'subjective', '\r'),
(209, 'language_chinese_level_3', '根据给定主题“环境保护”，写一篇议论文，不少于400字。', '', '', '', '', '', '', '', '', '', '', 'subjective', '\r'),
(210, 'language_chinese_level_3', '阅读以下短文，概括文章的主要内容：……', '', '', '', '', '', '', '', '', '', '', 'subjective', '\r'),
(211, 'language_chinese_level_3', '请分析“网络暴力”对青少年的影响，并提出应对措施。', '', '', '', '', '', '', '', '', '', '', 'subjective', '\r'),
(212, 'language_chinese_level_3', '描述一次让你印象深刻的旅行经历，不少于350字。', '', '', '', '', '', '', '', '', '', '', 'subjective', '\r'),
(213, 'language_chinese_level_3', '根据以下图片内容，撰写一段300字的描写文章。', '', '', '', '', '', '', '', '', '', '', 'subjective', '\r'),
(214, 'language_chinese_level_3', '谈谈你对“现代科技带来的便利和隐患”的看法。', '', '', '', '', '', '', '', '', '', '', 'subjective', '\r'),
(215, 'language_chinese_level_3', '结合实际，论述“传统文化在当代社会中的传承与发展”。', '', '', '', '', '', '', '', '', '', '', 'subjective', '\r'),
(216, 'language_chinese_level_3', '假如你是一名老师，请撰写一封家长信，说明学生在学习上的表现和建议。', '', '', '', '', '', '', '', '', '', '', 'subjective', '\r'),
(217, 'language_chinese_level_3', '阅读以下人物传记，谈谈你对主人公的评价。', '', '', '', '', '', '', '', '', '', '', 'subjective', '\r'),
(218, 'language_chinese_level_3', '请结合实例，谈谈如何培养良好的学习习惯。', '', '', '', '', '', '', '', '', '', '', 'subjective', '\r'),
(223, 'language_japanese_level_1', '次の文の（　）に入る最も適切な言葉はどれですか？\n先生に（　）から、宿題を忘れたことを言えなかった。', '', 'おこられて', '', 'おこられる', '', 'おこる', '', 'おこった', '', 'b', 'mcq', '\r'),
(224, 'language_japanese_level_1', '次の漢字の読み方として正しいのはどれですか？\n質問：「昨夜は早く寝ました。」', '', 'さくよる', '', 'きのうよる', '', 'さくや', '', 'せんや', '', 'c', 'mcq', '\r'),
(225, 'language_japanese_level_1', '次の文の意味に合う言い換えはどれですか？\n彼は約束を守るどころか、連絡さえしてこなかった。', '', '約束は守らなかったが、連絡はあった', '', '約束も守らなかったし、連絡もなかった', '', '約束を守ったけれど、連絡がなかった', '', '約束を守らなかったが、それは仕方なかった', '', 'b', 'mcq', '\r'),
(226, 'language_japanese_level_1', '（　）に入る最も適切な語はどれですか？\nあの俳優の演技には、観客を（　）力がある。', '', 'ひかれる', '', 'ひきつける', '', 'ひかせる', '', 'ひきしめる', '', 'b', 'mcq', '\r'),
(227, 'language_japanese_level_1', '最近では、スマートフォンを持っていない人のほうが（　）。', '', 'ふつうです', '', 'まれです', '', 'しょうじきです', '', 'たいくつです', '', 'b', 'mcq', '\r'),
(228, 'language_japanese_level_1', '次の言葉の意味に最も近いのはどれですか？\n工夫（くふう）', '', '問題を放っておくこと', '', '上手にやるために考えること', '', '面倒なことを避けること', '', '誰かに頼ること', '', 'b', 'mcq', '\r'),
(229, 'language_japanese_level_1', '次の中で、\'あきれる\'の正しい使い方はどれですか？', '', '彼の勇気にあきれた。', '', '彼の無責任さにあきれた。', '', '美しい景色にあきれた。', '', '新しいアイデアにあきれた。', '', 'b', 'mcq', '\r'),
(230, 'language_japanese_level_1', '「部屋の窓を開けてください。」の「開けて」の正しい読み方は？', '', 'とけて', '', 'あけて', '', 'ひらけて', '', 'あらわれて', '', 'b', 'mcq', '\r'),
(231, 'language_japanese_level_1', '「その場しのぎ」の意味に最も近いのは？', '', '長く続く対策', '', 'その時だけの対応', '', '無駄な努力', '', '丁寧な準備', '', 'b', 'mcq', '\r'),
(232, 'language_japanese_level_1', '急がなければ、電車に（　）かもしれない。', '', '間に合って', '', '間に合わない', '', '間に合う', '', '間に合え', '', 'b', 'mcq', '\r'),
(233, 'language_japanese_level_1', '「出かける前に財布を確認しなさい。」の意味として最も適切なのは？', '', '財布を家に置く', '', '財布を持っているか確認する', '', '財布を使わない', '', '財布を捨てる', '', 'b', 'mcq', '\r'),
(234, 'language_japanese_level_1', '「たまには息抜きも必要です。」の意味に最も近いのは？', '', 'いつも休むべき', '', '時々休むべき', '', '全く休まない', '', '常に働くべき', '', 'b', 'mcq', '\r'),
(235, 'language_japanese_level_1', '「これからはもっと努力します。」の意味として正しいのは？', '', '努力しない', '', '努力を増やす', '', '過去に努力した', '', '努力を止める', '', 'b', 'mcq', '\r'),
(236, 'language_japanese_level_1', '「言葉に気をつけてください。」の意味として最も適切なのは？', '', '注意深く話す', '', '無言でいる', '', '大声で話す', '', '小声で話す', '', 'a', 'mcq', '\r'),
(237, 'language_japanese_level_1', '「本日はお忙しい中、ありがとうございました。」の使い方として正しいのは？', '', 'ビジネス会話', '', '日常会話', '', 'カジュアルな場', '', '友人との会話', '', 'a', 'mcq', '\r'),
(238, 'language_japanese_level_1', '「経験が不足しています。」の反対語は？', '', '経験が豊富', '', '経験が無駄', '', '経験が必要', '', '経験が軽視', '', 'a', 'mcq', '\r'),
(239, 'language_japanese_level_1', '「先生のおかげで合格できました。」の意味に最も近いのは？', '', '先生の指導で成功した', '', '先生に反対された', '', '先生が原因で失敗した', '', '先生を無視した', '', 'a', 'mcq', '\r'),
(240, 'language_japanese_level_1', '「今日は体調が悪いので、休みます。」の意味として正しいのは？', '', '元気いっぱい', '', '具合が悪い', '', '忙しい', '', '楽しんでいる', '', 'b', 'mcq', '\r'),
(241, 'language_japanese_level_1', '「この資料は後で確認してください。」の意味に最も近いのは？', '', '今すぐ確認する', '', '確認しない', '', '後でチェックする', '', '資料を捨てる', '', 'c', 'mcq', '\r'),
(242, 'language_japanese_level_1', '「しっかり勉強しないと後悔しますよ。」の意味として正しいのは？', '', '勉強しなくても良い', '', '勉強するべき', '', '後悔しない', '', '勉強を諦める', '', 'b', 'mcq', '\r'),
(254, 'language_japanese_level_2', '「うっかり」の正しい使い方はどれですか？\nWhich sentence correctly uses うっかり (carelessly / by mistake)?', '', 'うっかり準備しておいた。', '', 'うっかりテストを忘れた。', '', 'うっかり丁寧に話した。', '', 'うっかり楽しかった。', '', 'b', 'mcq', '\r'),
(255, 'language_japanese_level_2', '日本に来てから5年経つが、日本文化については知らないこと（　）だ。', '', 'だけ', '', 'しか', '', 'ばかり', '', 'ごろ', '', 'c', 'mcq', '\r'),
(256, 'language_japanese_level_2', '「足を運ぶ」の正しい使い方はどれですか？', '', '美術館に足を運んで、名画を見た。', '', '足を運んで寝た。', '', '彼は足を運ぶのが下手だ。', '', '足を運んだら足が痛くなった。', '', 'a', 'mcq', '\r'),
(257, 'language_japanese_level_2', 'そんなひどいことを言うなんて、彼は傷つけようと（　）。', '', 'していない', '', '思っている', '', '言われる', '', 'なるべく', '', 'b', 'mcq', '\r'),
(258, 'language_japanese_level_2', '彼の説明は分かりやすく、（　）としても納得できる内容だった。', '', '聞いた', '', '聞いてみた', '', '初めて聞いた', '', '何度も聞いた', '', 'c', 'mcq', '\r'),
(259, 'language_japanese_level_2', 'ニュアンスに基づいて空欄を埋めるのに最も適切な単語を選択してください。\nあの作家の小説は現実と幻想の（　）が巧妙に描かれている。', '', '境目', '', '境界線', '', '間', '', '境界', '', 'a', 'mcq', '\r'),
(260, 'language_japanese_level_2', '彼の努力がなかったら、このプロジェクトは（　）なかっただろう。', '', '成功している', '', '成功しない', '', '成功していた', '', '成功しなかった', '', 'd', 'mcq', '\r'),
(261, 'language_japanese_level_2', '彼の話はいつも（　）で、どこまでが本当なのか分からない。', '', '誠実', '', '素直', '', '大げさ', '', '堅実', '', 'c', 'mcq', '\r'),
(262, 'language_japanese_level_2', '彼は、会社の方針に不満があるようだが、上司の前では（　）。', '', '本音を言っている', '', '我慢できない', '', '黙っている', '', '意見を述べている', '', 'c', 'mcq', '\r'),
(263, 'language_japanese_level_2', 'その議論は、みんなの意見が（　）になり、最終的に結論が出なかった。', '', '一致', '', '漠然', '', '明確', '', '顕著', '', 'a', 'mcq', '\r'),
(264, 'language_japanese_level_2', '彼がそんなことをした理由は、（　）か、まだ私には理解できない。', '', 'いくら考えても', '', 'たとえ考えても', '', 'どんなに考えても', '', 'もし考えても', '', 'c', 'mcq', '\r'),
(265, 'language_japanese_level_2', '彼の発言は、私たちの期待を（　）ようなもので、正直に言ってショックだった。', '', '裏切る', '', '背負う', '', '超える', '', '承認する', '', 'a', 'mcq', '\r'),
(266, 'language_japanese_level_2', '最近の研究によると、感情を上手にコントロールできる人は、ストレスの多い状況でも冷静さを保つとされている。', '', 'ストレスに強い', '', '感情に流されやすい', '', '冷静さが欠けている', '', '落ち着きがない', '', 'a', 'mcq', '\r'),
(267, 'language_japanese_level_2', '日本の伝統文化は、多くの外国の文化を取り入れ、独自の形に進化してきた。', '', '変化しない', '', '柔軟である', '', '排他的である', '', '保守的である', '', 'b', 'mcq', '\r'),
(268, 'language_japanese_level_2', '彼の提案にはいくつか（　）があるので、もう少し検討したほうがいい。', '', '問題', '', '質問', '', '資料', '', '部分', '', 'a', 'mcq', '\r'),
(269, 'language_japanese_level_2', 'この映画は、ストーリー（　）、映像の美しさという点では一級品だ。', '', 'はさておき', '', 'にしては', '', 'に関して', '', 'とはいえ', '', 'a', 'mcq', '\r'),
(270, 'language_japanese_level_2', '彼女は、私にもっと早く（　）ように言った。', '', '起きる', '', '起こす', '', '起きろ', '', '起きさせる', '', 'd', 'mcq', '\r'),
(271, 'language_japanese_level_2', '環境問題に対する意識が高まる一方で、それに対して「どう行動すればいいのか分からない」という人も少なくない。', '', '対処法を知っている', '', '対策が分からない', '', '積極的に行動している', '', '無関心である', '', 'b', 'mcq', '\r'),
(272, 'language_japanese_level_2', '感情をコントロールしすぎると、逆に精神的な負担を感じることもあるため、バランスが重要だ。', '', 'バランスを取る', '', '感情を抑える', '', '負担を減らす', '', 'ストレスを増やす', '', 'a', 'mcq', '\r'),
(273, 'language_japanese_level_2', '理解のためには、まず相手の立場を知ろうとする姿勢が必要である。', '', '相手を否定する', '', '自分を主張する', '', '理解しようと努める', '', '意見を無視する', '', 'c', 'mcq', '\r'),
(285, 'language_japanese_level_3', 'テクノロジーの進化が人間社会に与える影響について、利点と欠点を挙げながら自分の意見を述べなさい。', '', '', '', '', '', '', '', '', '', '', 'subjective', '\r'),
(286, 'language_japanese_level_3', '環境問題に対する国際的な協力の必要性について、具体例を挙げて論じなさい。', '', '', '', '', '', '', '', '', '', '', 'subjective', '\r'),
(287, 'language_japanese_level_3', 'SNS利用における個人情報漏洩問題について、原因と対策を述べなさい。', '', '', '', '', '', '', '', '', '', '', 'subjective', '\r'),
(288, 'language_japanese_level_3', '少子高齢化が日本社会に及ぼす影響について、具体的な解決策を含めて考察しなさい。', '', '', '', '', '', '', '', '', '', '', 'subjective', '\r'),
(289, 'language_japanese_level_3', '地方創生を成功させるために、どのような取り組みが必要か、自分の考えを述べなさい。', '', '', '', '', '', '', '', '', '', '', 'subjective', '\r'),
(290, 'language_japanese_level_3', '日本文化の特徴を一つ挙げ、その文化が現代社会においてどのように変容しているかを説明しなさい。', '', '', '', '', '', '', '', '', '', '', 'subjective', '\r'),
(291, 'language_japanese_level_3', '近年の働き方改革が労働者に与える影響について、自分の意見を述べなさい。', '', '', '', '', '', '', '', '', '', '', 'subjective', '\r'),
(292, 'language_japanese_level_3', '日本の観光業が抱える課題と、その解決策について考えを述べなさい。', '', '', '', '', '', '', '', '', '', '', 'subjective', '\r'),
(293, 'language_japanese_level_3', '多文化共生社会の実現に向けて、学校教育が果たす役割について論じなさい。', '', '', '', '', '', '', '', '', '', '', 'subjective', '\r'),
(294, 'language_japanese_level_3', '日本の食文化がグローバル化によりどのように変化しているかを考察しなさい。', '', '', '', '', '', '', '', '', '', '', 'subjective', '\r'),
(295, 'language_japanese_level_3', '国際交流の意義と、その効果的な方法について意見を述べなさい。', '', '', '', '', '', '', '', '', '', '', 'subjective', '\r'),
(296, 'language_japanese_level_3', '災害に強い街づくりのためには、どのような防災対策が必要かを論じなさい。', '', '', '', '', '', '', '', '', '', '', 'subjective', '\r'),
(297, 'language_japanese_level_3', '日本の伝統行事が現代社会において果たす役割について考えを述べなさい。', '', '', '', '', '', '', '', '', '', '', 'subjective', '\r'),
(298, 'language_japanese_level_3', 'インターネット依存症が若者に及ぼす影響と、その防止策を提案しなさい。', '', '', '', '', '', '', '', '', '', '', 'subjective', '\r'),
(299, 'language_japanese_level_3', 'グローバル化が日本の雇用市場に与える影響について、自分の考えを述べなさい。', '', '', '', '', '', '', '', '', '', '', 'subjective', '\r'),
(300, 'language_japanese_level_3', '地域活性化のためには、地元の特産品をどのように活用すべきかを考察しなさい。', '', '', '', '', '', '', '', '', '', '', 'subjective', '\r'),
(301, 'language_japanese_level_3', '働き方改革とワークライフバランスの両立について考えを述べなさい。', '', '', '', '', '', '', '', '', '', '', 'subjective', '\r'),
(302, 'language_japanese_level_3', '日本の高齢者福祉が抱える課題と、その解決策を提案しなさい。', '', '', '', '', '', '', '', '', '', '', 'subjective', '\r'),
(303, 'language_japanese_level_3', 'デジタルデバイドが生む社会格差について、原因と解決策を述べなさい。', '', '', '', '', '', '', '', '', '', '', 'subjective', '\r'),
(304, 'language_japanese_level_3', '日本の文化財を保護するために、私たちができることについて考えを述べなさい。', '', '', '', '', '', '', '', '', '', '', 'subjective', '\r'),
(316, 'language_korean_level_1', '다음 중 \'감사합니다\'의 정확한 한국어 표현은 무엇인가요?', '', '고마워요 (gomawoyo)', '', '감사합니다 (gamsahamnida)', '', '미안해요 (mianhaeyo)', '', '사랑해요 (salanghaeyo)', '', 'b', 'mcq', '\r'),
(317, 'language_korean_level_1', '다음 중 \'잘 지내세요\'에 대한 올바른 한국어 표현은 무엇입니까?', '', '잘 지내요? (jal jinaeyo?)', '', '뭐 해요? (mwo haeyo?)', '', '어디 가요? (eodi gayo?)', '', '언제 가요? (eonje gayo?)', '', 'a', 'mcq', '\r'),
(318, 'language_korean_level_1', '\'고맙습니다\' (gomapseumnida)는 무엇을 의미하나요?', '', '안녕하세요 (annyeonghaseyo)', '', '죄송합니다 (joesonghabnida)', '', '감사합니다 (gamsahabnida)', '', '안녕히 가세요 (annyeonghi gaseyo)', '', 'c', 'mcq', '\r'),
(319, 'language_korean_level_1', '다음 중 \'이해합니다\'에 대한 올바른 한국어 표현은 무엇입니까?', '', '이해하지 못해요 (ihaehaji moshaeyo)', '', '이해해요 (ihaehaeyo)', '', '도와주세요 (dowajuseyo)', '', '반갑습니다 (bangabseubnida)', '', 'b', 'mcq', '\r'),
(320, 'language_korean_level_1', '다음 중 \'저는 학생입니다\'에 대한 올바른 한국어 표현은 무엇입니까?', '', '저는 선생님이에요 (jeoneun seonsaengnim-ieyo)', '', '저는 학생이에요 (jeoneun hagsaeng-ieyo)', '', '너는 학생이에요 (neoneun hagsaeng-ieyo)', '', '저는 의사예요 (jeoneun uisayeyo)', '', 'b', 'mcq', '\r'),
(321, 'language_korean_level_1', '다음 중 \'사랑해\'에 대한 올바른 한국어 표현은 무엇입니까?', '', '미안해요 (mianhaeyo)', '', '사랑해요 (salanghaeyo)', '', '감사합니다 (gamsahabnida)', '', '반가워요 (bangawoyo)', '', 'b', 'mcq', '\r'),
(322, 'language_korean_level_1', '다음 중 \'학교\'에 대한 올바른 한국어 표현은 무엇입니까?', '', '병원 (byeong-won)', '', '상점 (sangjeom)', '', '학교 (haggyo)', '', '회사 (hoesa)', '', 'c', 'mcq', '\r'),
(323, 'language_korean_level_1', '\'미안해요\' (mianhaeyo)의 의미는 무엇인가요?', '', '감사합니다 (gamsahabnida)', '', '죄송합니다 (joesonghabnida)', '', '안녕히 가세요 (annyeonghi gaseyo)', '', '안녕하세요 (annyeonghaseyo)', '', 'b', 'mcq', '\r'),
(324, 'language_korean_level_1', '다음 중 \'친구\'에 대한 올바른 한국어 표현은 무엇입니까?', '', '선생님 (seonsaengnim)', '', '친구 (chingu)', '', '학생 (hagsaeng)', '', '부모님 (bumonim)', '', 'b', 'mcq', '\r'),
(325, 'language_korean_level_1', '다음 중 \'어디에 계십니까\'에 대한 올바른 한국어 표현은 무엇입니까?', '', '몇 시에요? (myeoch sieyo?)', '', '어디에요? (eodieyo?)', '', '잘 지내요? (jal jinaeyo?)', '', '언제에요? (eonjeeyo?)', '', 'b', 'mcq', '\r'),
(326, 'language_korean_level_1', '다음 중 \'음식\'에 대한 올바른 한국어 표현은 무엇입니까?', '', '물 (mul)', '', '음식 (eumsig)', '', '책 (chaeg)', '', '영화 (yeonghwa)', '', 'b', 'mcq', '\r'),
(327, 'language_korean_level_1', '다음 중 \'좋다\'에 대한 올바른 한국어 표현은 무엇입니까?', '', '좋아하지 않아요', '', '사랑해요', '', '좋아요', '', '나빠요', '', 'c', 'mcq', '\r'),
(328, 'language_korean_level_1', '다음 중 한국어에서 \'먹다\'의 정중한 표현은 무엇입니까?', '', '마셔요 (masyeoyo)', '', '일어요 (il-eoyo)', '', '자요 (jayo)', '', '먹어요 (meog-eoyo)', '', 'd', 'mcq', '\r'),
(329, 'language_korean_level_1', '다음 중 \'쌀\'에 대한 올바른 한국어 표현은 무엇입니까?', '', '국 (gug)', '', '밥/식사 (bab/sigsa)', '', '과일 (gwail)', '', '음료수 (eumlyosu)', '', 'b', 'mcq', '\r'),
(330, 'language_korean_level_1', '다음 중 문법적으로 올바른 문장은 무엇인가요?', '', '나는 학교에 가요 매일.', '', '매일 나는 학교에 가요.', '', '나는 매일 학교에 가요.', '', '학교에 가요 나는 매일.', '', 'c', 'mcq', '\r'),
(331, 'language_korean_level_1', '\'저도 가고 싶어요\'에서 \'도\'의 의미는 무엇인가요?', '', '나', '', '도/또', '', '그리고', '', '그러나', '', 'b', 'mcq', '\r'),
(332, 'language_korean_level_1', '다음 중 \'하십니다\' 형태로 된 동사는 무엇인가요?', '', '하다', '', '가다', '', '먹다', '', '오다', '', 'a', 'mcq', '\r'),
(333, 'language_korean_level_1', '\'그럼\'의 뜻은 무엇인가요?', '', '맞아요', '', '그러면', '', '왜냐하면', '', '그러나', '', 'b', 'mcq', '\r'),
(334, 'language_korean_level_1', '\'을/를\'의 올바른 용법은 무엇인가요?', '', '주격 조사', '', '목적격 조사', '', '장소 조사', '', '시간 조사', '', 'b', 'mcq', '\r'),
(335, 'language_korean_level_1', '다음 중 \'동사 어간 + 고 싶다\' 구조가 포함된 문장은 무엇인가요?', '', '나는 책을 읽고 싶어요.', '', '나는 책을 읽어요.', '', '나는 책을 읽고 있어요.', '', '나는 책을 읽습니다.', '', 'a', 'mcq', '\r'),
(347, 'language_korean_level_2', '다음 중 한국어에서 \'개\' (gae)는 무엇을 세는 단위인가요?', '', '시간', '', '사람', '', '책', '', '물건', '', 'd', 'mcq', '\r'),
(348, 'language_korean_level_2', 'Which of the following sentences uses the appropriate honorific form and correct word order?', '', '선생님은 학교에 매일 가요.', '', '선생님은 학교에 가요 매일.', '', '선생님 학교에 매일 가요.', '', '매일 선생님은 학교에 가요.', '', 'a', 'mcq', '\r'),
(349, 'language_korean_level_2', 'The verb stem \'바꾸다\' (to change) is modified into which form to express a future action?', '', '바꿨겠어요', '', '바꿔요', '', '바꿀 거예요', '', '바꿔요', '', 'c', 'mcq', '\r'),
(350, 'language_korean_level_2', 'What is the most appropriate way to politely ask someone to wait in Korean?', '', '잠깐만 기다려 주세요.', '', '잠깐만 기다려요.', '', '잠시만 기다리세요.', '', '잠깐 기다려.', '', 'c', 'mcq', '\r'),
(351, 'language_korean_level_2', 'What is the correct use of the \'기 때문에\' (because) structure?', '', '그 사람이 늦었기 때문에, 우리는 일찍 시작했어요.', '', '그 사람이 늦어서, 우리는 일찍 시작했어요.', '', '그 사람이 늦을 거예요 기 때문에, 우리는 일찍 시작했어요.', '', '그 사람이 늦기 때문에, 우리는 일찍 시작했어요.', '', 'd', 'mcq', '\r'),
(352, 'language_korean_level_2', 'Which of the following sentences contains a grammatical mistake?', '', '나는 학교에서 친구를 만났어요.', '', '나는 도서관에 책을 읽어요.', '', '나는 그 영화를 봤어요.', '', '나는 어제 영화를 봤어요.', '', 'b', 'mcq', '\r'),
(353, 'language_korean_level_2', 'Which sentence correctly uses the honorific form of \'to go\' (가다) for a superior?', '', '선생님이 가세요.', '', '선생님이 가요.', '', '선생님이 가십시오.', '', '선생님이 갑니다.', '', 'a', 'mcq', '\r'),
(354, 'language_korean_level_2', 'Which sentence correctly uses the conditional form \'면\'?', '', '시간이 있으면, 영화를 봐요.', '', '시간이 있으면, 영화를 봤어요.', '', '시간이 있으면, 영화를 봐요?', '', '시간이 있으면, 영화를 보고 싶어요.', '', 'a', 'mcq', '\r'),
(355, 'language_korean_level_2', 'Which sentence uses the correct particle to modify a noun in Korean?', '', '이 책이 재밌어요.', '', '이 책은 재미있어요.', '', '재미있는 이 책이에요.', '', '이 재미있는 책이에요.', '', 'c', 'mcq', '\r'),
(356, 'language_korean_level_2', 'Which sentence correctly uses the particles \'에서\' and \'까지\' to express a range?', '', '서울에서 부산까지 걸어갔어요.', '', '서울에 부산까지 걸어갔어요.', '', '서울까지 부산에서 걸어갔어요.', '', '서울에서 부산에 걸어갔어요.', '', 'a', 'mcq', '\r'),
(357, 'language_korean_level_2', 'Which sentence correctly uses the polite request form \'주세요\'?', '', '물을 주세요.', '', '물 주세요.', '', '물을 주세요요.', '', '물 주세요요.', '', 'a', 'mcq', '\r'),
(358, 'language_korean_level_2', 'Which sentence means \'I have never been to Korea\'?', '', '나는 한국에 가본 적이 없어요.', '', '나는 한국에 가본 적이 없어요요.', '', '나는 한국에 가봤지 않아요.', '', '나는 한국에 가본 일이 없어요.', '', 'a', 'mcq', '\r'),
(359, 'language_korean_level_2', 'Which sentence correctly uses the passive form of \'보다\' (to see)?', '', '영화는 내가 봐요.', '', '영화는 내가 봤어요.', '', '영화는 내가 봐져요.', '', '영화는 내가 보였어요.', '', 'd', 'mcq', '\r'),
(360, 'language_korean_level_2', 'Which sentence expresses \'Even if it rains, I will go\' using the conditional \'아/어도\'?', '', '비가 오면, 저는 갈 거예요.', '', '비가 오기도 하니까, 저는 갈 거예요.', '', '비가 오더라도, 저는 갈 거예요.', '', '비가 오면, 저는 가요.', '', 'c', 'mcq', '\r'),
(361, 'language_korean_level_2', 'Which sentence correctly uses a conjunction to express contrast?', '', '그 사람은 친절하지만, 나는 그를 좋아하지 않아요.', '', '그 사람은 친절해서, 나는 그를 좋아하지 않아요.', '', '그 사람은 친절하고, 나는 그를 좋아하지 않아요.', '', '그 사람은 친절하지만, 나는 그를 좋아하지 않습니다.', '', 'a', 'mcq', '\r'),
(362, 'language_korean_level_2', 'What does the suffix \'-고 나서\' mean?', '', 'After doing something', '', 'Before doing something', '', 'Because of something', '', 'While doing something', '', 'a', 'mcq', '\r'),
(363, 'language_korean_level_2', 'Which sentence correctly expresses \'I should go to bed early\'?', '', '나는 일찍 자야 돼요.', '', '나는 일찍 자고 싶어요.', '', '나는 일찍 자요.', '', '나는 일찍 자야 해요.', '', 'a', 'mcq', '\r'),
(364, 'language_korean_level_2', 'Which sentence correctly uses \'는 것\' to express \'I like reading books\'?', '', '나는 책을 읽는 것을 좋아해요.', '', '나는 책을 읽는 것을 좋아해요요.', '', '나는 책을 읽을 것을 좋아해요.', '', '나는 책을 읽고 있는 것을 좋아해요.', '', 'a', 'mcq', '\r'),
(365, 'language_korean_level_2', 'Which sentence uses \'게 되다\' to express \'I came to like it\'?', '', '나는 그것을 좋아해요.', '', '나는 그것을 좋아하게 돼요.', '', '나는 그것을 좋아하게 해요.', '', '나는 그것을 좋아할 거예요.', '', 'b', 'mcq', '\r'),
(366, 'language_korean_level_2', 'Which sentence uses the correct form of \'가다\' (to go) to express \'I will go to the store\'?', '', '나는 가게에 갈 거예요.', '', '나는 가게에 가는 거예요.', '', '나는 가게에 갔어요.', '', '나는 가게에 가고 있어요.', '', 'a', 'mcq', '\r'),
(378, 'language_korean_level_3', '갑작스러운 개인적인 비상 상황으로 중요한 회의에 참석하지 못했습니다. 팀원들에게 사과하고 앞으로의 계획을 설명하는 연설을 작성하세요.', '', '', '', '', '', '', '', '', '', '', 'subjective', '\r'),
(379, 'language_korean_level_3', '지난 여름 프로젝트 경험을 바탕으로 \'있었던\'과 \'있을 거예요\'의 시간 흐름과 기대감을 설명하세요.', '', '', '', '', '', '', '', '', '', '', 'subjective', '\r'),
(380, 'language_korean_level_3', '복잡한 한국어 문장을 영어로 번역하세요. 조건문, 과거완료, 목적 절을 포함하여 번역의 뉘앙스를 유지하세요.', '', '', '', '', '', '', '', '', '', '', 'subjective', '\r'),
(381, 'language_korean_level_3', '기술이 현대 한국 사회에 미친 영향을 논하되, 고급 문법 구조를 사용하여 긍정적·부정적 측면을 모두 포함하세요.', '', '', '', '', '', '', '', '', '', '', 'subjective', '\r'),
(382, 'language_korean_level_3', '한국으로 이주하여 겪은 문화적 차이를 극복한 경험을 서술하세요. 존댓말과 사회적 위계질서를 중심으로 서술하세요.', '', '', '', '', '', '', '', '', '', '', 'subjective', '\r'),
(383, 'language_korean_level_3', '한국으로 이주할 예정인 친구에게 문화적 기대와 언어 장벽에 대해 조언하는 편지를 작성하세요.', '', '', '', '', '', '', '', '', '', '', 'subjective', '\r'),
(384, 'language_korean_level_3', '대화에서 사용된 다양한 예의 수준을 분석하고, 존댓말, 말투, 격식의 차이를 구체적으로 설명하세요.', '', '', '', '', '', '', '', '', '', '', 'subjective', '\r'),
(385, 'language_korean_level_3', '\'보다 더\'와 \'만큼\' 비교 구조를 사용하여 두 가지 상황을 비교하고, 다른 비교 구조를 사용하여 다시 작성하세요.', '', '', '', '', '', '', '', '', '', '', 'subjective', '\r'),
(386, 'language_korean_level_3', '영어 문단을 한국어로 번역하되, 상대절과 존댓말을 적절히 사용하여 자연스럽게 표현하세요.', '', '', '', '', '', '', '', '', '', '', 'subjective', '\r'),
(387, 'language_korean_level_3', '예의와 격식이 대화의 톤과 사회적 관계를 어떻게 반영하는지 설명하고, 특정 표현을 예로 들어 분석하세요.', '', '', '', '', '', '', '', '', '', '', 'subjective', '\r'),
(388, 'language_korean_level_3', '기술 발전이 한국 청소년의 학습 방식에 미친 긍정적 영향과 부정적 영향을 분석하세요.', '', '', '', '', '', '', '', '', '', '', 'subjective', '\r'),
(389, 'language_korean_level_3', '한국 전통 예절과 현대 소통 방식이 충돌하는 상황을 제시하고, 이를 조화롭게 해결하는 방법을 논하세요.', '', '', '', '', '', '', '', '', '', '', 'subjective', '\r'),
(390, 'language_korean_level_3', '자신의 문화와 한국 문화를 비교하여 문화적 차이를 극복하기 위한 전략을 제안하세요.', '', '', '', '', '', '', '', '', '', '', 'subjective', '\r'),
(391, 'language_korean_level_3', '다음 대화의 존댓말과 반말 사용이 대화의 맥락과 감정에 어떤 영향을 미치는지 설명하세요.', '', '', '', '', '', '', '', '', '', '', 'subjective', '\r'),
(392, 'language_korean_level_3', '복잡한 문법 구조(예: \'게 되다\', \'기 때문에\')를 활용하여 의견을 표현하는 문장을 작성하세요.', '', '', '', '', '', '', '', '', '', '', 'subjective', '\r'),
(393, 'language_korean_level_3', '한국 직장에서 상사와 동료 간의 소통 방식 차이를 존댓말과 반말 사용을 중심으로 분석하세요.', '', '', '', '', '', '', '', '', '', '', 'subjective', '\r'),
(394, 'language_korean_level_3', '다양한 한국어 높임말 구조를 사용하여 연설문을 작성하세요. 상황: 회사 프로젝트 발표.', '', '', '', '', '', '', '', '', '', '', 'subjective', '\r'),
(395, 'language_korean_level_3', '한국어의 과거 회상 표현을 사용하여 과거 경험을 서술하는 글을 작성하세요.', '', '', '', '', '', '', '', '', '', '', 'subjective', '\r'),
(396, 'language_korean_level_3', '한국 사회의 \'공동체 의식\'이 개인 생활에 미치는 영향을 논하세요.', '', '', '', '', '', '', '', '', '', '', 'subjective', '\r'),
(397, 'language_korean_level_3', '고급 어휘와 복잡한 문장 구조를 활용하여 자신의 한국어 학습 경험을 서술하세요.', '', '', '', '', '', '', '', '', '', '', 'subjective', '\r'),
(409, 'language_chinese_level_1', '下列词语中，意思最接近 “高兴” 的是：', '', '难过', '', '开心', '', '生气', '', '悲伤', '', 'b', 'mcq', '\r'),
(410, 'language_chinese_level_1', '他一听到这个消息，立刻喜出望外。这句话中的“喜出望外”是什么意思？', '', '喜欢出门散步', '', '惊讶和生气', '', '非常高兴，出乎意料', '', '无动于衷', '', 'c', 'mcq', '\r'),
(411, 'language_chinese_level_1', '下面哪个句子使用了比喻？', '', '他走得很快。', '', '他像猎豹一样冲了出去。', '', '他生气地看着我。', '', '他低着头，一句话也不说。', '', 'b', 'mcq', '\r'),
(412, 'language_chinese_level_1', '下列词语中，哪一组是近义词？', '', '高兴 — 难过', '', '明亮 — 昏暗', '', '勇敢 — 无畏', '', '冷清 — 热闹', '', 'c', 'mcq', '\r'),
(413, 'language_chinese_level_1', '画蛇添足这个成语的意思是？', '', '把蛇画得很漂亮', '', '多此一举，做了不必要的事', '', '不会画蛇', '', '添足使蛇更生动', '', 'b', 'mcq', '\r'),
(414, 'language_chinese_level_1', '按照顺序填出下句：欲穷千里目，_______。', '', '更上一层楼', '', '更下一层楼', '', '更高一层楼', '', '浮上二层楼', '', 'a', 'mcq', '\r'),
(415, 'language_chinese_level_1', '使用了“比喻”修辞手法的是：', '', '他高兴得跳了起来。', '', '星星眨着眼睛，仿佛在和我说话。', '', '她像蝴蝶一样轻盈地跳起舞来。', '', '我真是累死了！', '', 'c', 'mcq', '\r'),
(416, 'language_chinese_level_1', '使用了“拟人”修辞手法的是：', '', '这朵花真美。', '', '春风像母亲的手一样轻抚着大地。', '', '小草从地下钻出来，冲我点头微笑。', '', '他的声音像打雷一样响。', '', 'c', 'mcq', '\r'),
(417, 'language_chinese_level_1', '“不是东风压倒西风，就是西风压倒东风。”运用了哪种修辞手法？', '', '排比', '', '设问', '', '对偶', '', '反复', '', 'c', 'mcq', '\r'),
(418, 'language_chinese_level_1', '这真是一个‘白雪却嫌春色晚，故穿庭树作飞花’的季节。运用了引用的修辞手法。', '', '对', '', '错', '', '', '', '', '', 'a', 'mcq', '\r'),
(419, 'language_chinese_level_1', '在中文成语中，\"杯弓蛇影\"的意思是？', '', '无中生有', '', '杯中有蛇', '', '弓和蛇的故事', '', '害怕喝酒', '', 'a', 'mcq', '\r'),
(420, 'language_chinese_level_1', '“含沙射影”是指什么？', '', '直接攻击', '', '间接中伤', '', '射箭比赛', '', '沙地射击', '', 'b', 'mcq', '\r'),
(421, 'language_chinese_level_1', '“百闻不如一见”表达的意思是？', '', '亲眼见到比听说更为可信', '', '多听多学', '', '见多识广', '', '不如听别人说', '', 'a', 'mcq', '\r'),
(422, 'language_chinese_level_1', '“对牛弹琴”形容什么？', '', '不懂欣赏', '', '牛听音乐', '', '动物音乐会', '', '形容才艺高超', '', 'a', 'mcq', '\r'),
(423, 'language_chinese_level_1', '“亡羊补牢”告诉我们什么道理？', '', '丢了羊就算了', '', '及时改正错误', '', '继续放羊', '', '寻找新的方法', '', 'b', 'mcq', '\r'),
(424, 'language_chinese_level_1', '“成也萧何，败也萧何”表达的意思是？', '', '成败都与同一个人有关', '', '不同人导致成功和失败', '', '没有关联', '', '萧何导致失败', '', 'a', 'mcq', '\r'),
(425, 'language_chinese_level_1', '“一箭双雕”表示什么？', '', '一件事达到两个目的', '', '打鸟比赛', '', '箭术高超', '', '双雕合击', '', 'a', 'mcq', '\r'),
(426, 'language_chinese_level_1', '“五湖四海”形容什么？', '', '地方多而广', '', '山川秀丽', '', '水面辽阔', '', '全国各地', '', 'd', 'mcq', '\r'),
(427, 'language_chinese_level_1', '“风花雪月”主要形容什么？', '', '自然景色', '', '爱情缠绵', '', '严寒气候', '', '古典文学', '', 'b', 'mcq', '\r'),
(428, 'language_chinese_level_1', '“画龙点睛”是什么意思？', '', '画龙而不点睛', '', '关键之处加以修饰', '', '点眼画龙', '', '绘画技巧', '', 'b', 'mcq', '\r'),
(502, 'animation_level_1', 'Which of the following is NOT a type of animation?', '', '2D Animation', '', '3D Animation', '', 'Vector Animation', '', 'Static Design', '', 'd', 'mcq', ''),
(503, 'animation_level_1', 'In traditional animation, how many frames are typically used per second to create smooth motion?', '', '12', '', '24', '', '30', '', '60', '', 'b', 'mcq', ''),
(504, 'animation_level_1', 'What is tweening in animation?', '', 'Erasing frames between two keyframes', '', 'Generating intermediate frames between two keyframes', '', 'Compressing an animation timeline', '', 'Splitting a character rig', '', 'b', 'mcq', ''),
(505, 'animation_level_1', 'Which file format is most commonly used to export web animations?', '', 'JPG', '', 'PSD', '', 'GIF', '', 'RAW', '', 'c', 'mcq', ''),
(506, 'animation_level_1', 'What does \'keyframe\' mean in animation?', '', 'A frame that contains a sound file', '', 'A template used for rigging', '', 'A frame that defines the starting or ending point of a transition', '', 'A frame with a static background', '', 'c', 'mcq', ''),
(507, 'animation_level_1', 'Which principle of animation refers to the idea that objects stretch or squash to emphasize movement?', '', 'Squash and Stretch', '', 'Timing', '', 'Anticipation', '', 'Follow Through', '', 'a', 'mcq', ''),
(508, 'animation_level_1', 'Which software is commonly used for creating 2D digital animations?', '', 'Blender', '', 'Maya', '', 'Adobe Animate', '', 'InDesign', '', 'c', 'mcq', ''),
(509, 'animation_level_1', 'In animation, what is a \'rig\'?', '', 'A camera tool for 3D rendering', '', 'A skeleton or structure used to animate characters', '', 'A lighting setup for cel animation', '', 'A storyboard template', '', 'b', 'mcq', ''),
(510, 'animation_level_1', 'What is the main benefit of using vector graphics in animation?', '', 'Higher pixel resolution', '', 'Infinite scalability without losing quality', '', 'Faster file compression', '', 'Better colour blending', '', 'b', 'mcq', ''),
(511, 'animation_level_1', 'Which animation principle helps prepare the viewer for an action that’s about to happen?', '', 'Timing', '', 'Anticipation', '', 'Arcs', '', 'Ease In/Ease Out', '', 'b', 'mcq', ''),
(512, 'animation_level_1', 'Which animation technique involves capturing frame-by-frame movement of physical objects?', '', 'Stop Motion', '', '3D Modeling', '', 'Digital Rotoscoping', '', 'Claymation', '', 'a', 'mcq', ''),
(513, 'animation_level_1', 'What is the process of adding movement to a static object called?', '', 'Animation', '', 'Rendering', '', 'Rigging', '', 'Modeling', '', 'a', 'mcq', ''),
(514, 'animation_level_1', 'Which software is widely used for 3D animation and modeling?', '', 'Maya', '', 'Photoshop', '', 'Illustrator', '', 'Lightroom', '', 'a', 'mcq', ''),
(515, 'animation_level_1', 'What does FPS stand for in animation?', '', 'Frames Per Second', '', 'Fast Processing Speed', '', 'Final Production Stage', '', 'Frame Painting Style', '', 'a', 'mcq', ''),
(516, 'animation_level_1', 'Which principle of animation emphasizes acceleration and deceleration?', '', 'Ease In/Ease Out', '', 'Anticipation', '', 'Squash and Stretch', '', 'Follow Through', '', 'a', 'mcq', ''),
(517, 'animation_level_1', 'What is the purpose of a storyboard in animation?', '', 'To plan scenes visually', '', 'To record voiceovers', '', 'To create character rigs', '', 'To render final animations', '', 'a', 'mcq', ''),
(518, 'animation_level_1', 'Which of the following is an example of traditional animation?', '', 'Hand-drawn cel animation', '', '3D computer animation', '', 'Vector motion animation', '', 'Stop motion', '', 'a', 'mcq', ''),
(519, 'animation_level_1', 'What is rotoscoping?', '', 'Tracing over live-action footage', '', 'Creating skeletal animations', '', 'Applying textures to models', '', 'Adjusting frame rates', '', 'a', 'mcq', ''),
(520, 'animation_level_1', 'In which format is animation commonly exported for video editing?', '', 'MP4', '', 'GIF', '', 'AVI', '', 'MOV', '', 'a', 'mcq', ''),
(521, 'animation_level_1', 'What is a key characteristic of motion capture animation?', '', 'Capturing real human movements', '', 'Drawing frame by frame', '', 'Animating using vector graphics', '', 'Creating stop motion effects', '', 'a', 'mcq', ''),
(533, 'animation_level_2', 'In 3D animation, what does IK stand for, and why is it important?', '', 'Internal Keying – automates frame generation', '', 'Inverse Kinematics – controls joint movement based on end effectors', '', 'Indexed Kinematics – controls timeline layers', '', 'Input Key – maps user input to motion curves', '', 'b', 'mcq', ''),
(534, 'animation_level_2', 'Which of the following best defines \'gimbal lock\' in 3D animation and motion?', '', 'A failed render due to camera clipping', '', 'A glitch where the mesh resets to T-pose', '', 'A loss of one axis of rotation due to Euler angle limitations', '', 'A locked timeline that prevents motion edits', '', 'c', 'mcq', ''),
(535, 'animation_level_2', 'What is a blend shape (or morph target) used for in 3D animation?', '', 'For building UV maps', '', 'For facial expression animation and smooth deformation', '', 'For duplicating lighting setups', '', 'For colour grading rendered sequences', '', 'b', 'mcq', ''),
(536, 'animation_level_2', 'In Adobe After Effects, what is the purpose of the \'Graph Editor\'?', '', 'To apply masks on layers', '', 'To fine-tune animation curves and velocity over time', '', 'To edit 3D camera motion', '', 'To add expressions to keyframes', '', 'b', 'mcq', ''),
(537, 'animation_level_2', 'Which rendering engine is widely known for high-quality physically-based rendering in professional 3D animation?', '', 'Scanline', '', 'Arnold', '', 'PaintFX', '', 'V-Ray Lite', '', 'b', 'mcq', ''),
(538, 'animation_level_2', 'In skeletal animation, what’s the advantage of using forward kinematics (FK) instead of inverse kinematics (IK)?', '', 'Greater control over arc-based motion and rotation', '', 'Easier setup for walk cycles', '', 'Automatic collision detection', '', 'It’s faster to render', '', 'a', 'mcq', ''),
(539, 'animation_level_2', 'What is a \'rig controller\' in character animation?', '', 'A plugin used to import textures', '', 'A user interface object that controls bones and joints without touching them directly', '', 'The code that generates AI movement', '', 'The camera in a rigged scene', '', 'b', 'mcq', ''),
(540, 'animation_level_2', 'In 2D rigging, what is the purpose of a parent-child hierarchy?', '', 'To ensure transformations apply logically from main parts to sub-parts', '', 'To organize audio and motion together', '', 'To optimize RAM usage', '', 'To lock layers for export', '', 'a', 'mcq', ''),
(541, 'animation_level_2', 'Which term describes the intentional overshooting of a movement followed by a quick return to the original position?', '', 'Timing', '', 'Overshoot / Settle', '', 'Arc Drift', '', 'Recoil Wrap', '', 'b', 'mcq', ''),
(542, 'animation_level_2', 'Which compression format is most suitable for maintaining quality in animated video exports while keeping file size low?', '', 'MOV (uncompressed)', '', 'AVI (raw)', '', 'MP4 (H.264)', '', 'FLV', '', 'c', 'mcq', ''),
(543, 'animation_level_2', 'What is the primary difference between keyframe animation and procedural animation?', '', 'Keyframe uses manual inputs, procedural uses algorithms', '', 'Procedural is always 2D, keyframe is 3D', '', 'Keyframe is automated, procedural is manual', '', 'Procedural uses real actors, keyframe uses drawings', '', 'a', 'mcq', ''),
(544, 'animation_level_2', 'Which term describes the exaggerated movement of a character to make it more expressive?', '', 'Squash and Stretch', '', 'Anticipation', '', 'Exaggeration', '', 'Follow Through', '', 'c', 'mcq', ''),
(545, 'animation_level_2', 'What does \'render farm\' refer to in animation production?', '', 'A networked system to render animations faster', '', 'A tool to model character rigs', '', 'A sound editing technique', '', 'A type of lighting effect', '', 'a', 'mcq', ''),
(546, 'animation_level_2', 'Which software is commonly used for non-linear editing of animated movies?', '', 'Premiere Pro', '', 'Maya', '', 'Blender', '', 'ZBrush', '', 'a', 'mcq', ''),
(547, 'animation_level_2', 'What is the main advantage of using motion capture (mocap) in animation?', '', 'Realistic human movements', '', 'Faster rendering times', '', 'Simplified rigging process', '', 'Easier hand-drawn animation', '', 'a', 'mcq', ''),
(548, 'animation_level_2', 'What does the term \'rigging\' refer to in 3D animation?', '', 'Creating skeletal structures for character movement', '', 'Lighting a scene', '', 'Compositing multiple shots', '', 'Adding sound effects', '', 'a', 'mcq', ''),
(549, 'animation_level_2', 'What technique is used to create the illusion of speed by blurring fast-moving objects?', '', 'Motion Blur', '', 'Time Remapping', '', 'Frame Interpolation', '', 'Lens Distortion', '', 'a', 'mcq', ''),
(550, 'animation_level_2', 'In animation, what is the significance of \'arcs\' in character motion?', '', 'They represent natural motion paths', '', 'They are used to blend audio clips', '', 'They control lighting intensity', '', 'They smooth out textures', '', 'a', 'mcq', ''),
(551, 'animation_level_2', 'What is the primary purpose of \'onion skinning\' in animation?', '', 'To see previous and next frames while drawing', '', 'To apply color grading', '', 'To add textures to 3D models', '', 'To synchronize audio and animation', '', 'a', 'mcq', ''),
(552, 'animation_level_2', 'What is the difference between \'FPS\' and \'Keyframes\' in animation?', '', 'FPS measures speed; keyframes define motion', '', 'FPS is for lighting; keyframes are for texture', '', 'FPS measures motion curves; keyframes render images', '', 'FPS controls character rigs; keyframes control lighting', '', 'a', 'mcq', ''),
(564, 'animation_level_3', 'In the context of 3D animation, what is the primary reason for using a quaternion instead of Euler angles for representing rotations?', '', 'Quaternions are easier to visualize and interpret', '', 'Euler angles cause performance issues', '', 'Quaternions avoid gimbal lock and allow smooth interpolation (slerp)', '', 'Euler angles require more memory', '', 'c', 'mcq', ''),
(565, 'animation_level_3', 'What is the main drawback of Forward Kinematics (FK) in character animation?', '', 'Requires inverse matrices', '', 'Movement of child bones doesn\'t affect parents', '', 'Tedious for animating complex joint chains like arms', '', 'Causes gimbal lock', '', 'c', 'mcq', ''),
(566, 'animation_level_3', 'Which animation principle deals with the \'lead and follow\' of body parts?', '', 'Squash and Stretch', '', 'Anticipation', '', 'Follow Through and Overlapping Action', '', 'Secondary Action', '', 'c', 'mcq', ''),
(567, 'animation_level_3', 'What is \'onion skinning\' typically used for in 2D animation software?', '', 'Adjusting bone weights', '', 'Previewing lighting effects', '', 'Visualizing previous and next frames', '', 'Creating motion blur', '', 'c', 'mcq', ''),
(568, 'animation_level_3', 'In rigging, what is the function of an IK handle?', '', 'Binds geometry to a skeleton', '', 'Solves end-effector positioning from joint rotations', '', 'Bakes keyframes', '', 'Simulates cloth dynamics', '', 'b', 'mcq', ''),
(569, 'animation_level_3', 'In motion capture cleanup, what does “retargeting” refer to?', '', 'Removing noise from motion curves', '', 'Transferring motion data to a new rig', '', 'Matching camera angles', '', 'Exporting to FBX', '', 'b', 'mcq', ''),
(570, 'animation_level_3', 'What kind of interpolation creates a bouncing or springy motion in a curve editor?', '', 'Linear', '', 'Step', '', 'Ease-In', '', 'Overshoot', '', 'd', 'mcq', ''),
(571, 'animation_level_3', 'Which part of the animation pipeline focuses on adjusting arcs and spacing of movement?', '', 'Layout', '', 'Blocking', '', 'Graph Editor Polish', '', 'Compositing', '', 'c', 'mcq', ''),
(572, 'animation_level_3', 'Which type of shader is best suited for NPR (Non-Photorealistic Rendering) in toon animation?', '', 'Lambert', '', 'Phong', '', 'Cel Shader', '', 'Blinn', '', 'c', 'mcq', ''),
(573, 'animation_level_3', 'What is the purpose of \'blend shapes\' in facial animation?', '', 'Create texture variations', '', 'Add lighting contrast', '', 'Morph between facial expressions', '', 'Animate eye movement', '', 'c', 'mcq', ''),
(574, 'animation_level_3', 'Which animation principle gives weight and realism to a character\'s jump landing?', '', 'Staging', '', 'Appeal', '', 'Timing and Spacing', '', 'Arcs', '', 'c', 'mcq', ''),
(575, 'animation_level_3', 'Which file format is commonly used for exchanging animated 3D scenes across platforms?', '', 'PNG', '', 'MP4', '', 'FBX', '', 'PSD', '', 'c', 'mcq', '');
INSERT INTO `questions` (`id`, `skill_category`, `question_text`, `question_image`, `option_a`, `option_a_image`, `option_b`, `option_b_image`, `option_c`, `option_c_image`, `option_d`, `option_d_image`, `correct_option`, `TYPE`, `subjective_answer`) VALUES
(576, 'animation_level_3', 'What is \'baking\' in 3D animation?', '', 'Pre-rendering final frames', '', 'Converting procedural or dynamic animation into keyframes', '', 'Flattening textures', '', 'Compressing the timeline', '', 'b', 'mcq', ''),
(577, 'animation_level_3', 'Which node in a shader graph controls how surfaces reflect light directionally?', '', 'Ambient Occlusion', '', 'Normal', '', 'Roughness', '', 'Specular', '', 'd', 'mcq', ''),
(578, 'animation_level_3', 'What does \'ease-in and ease-out\' control in keyframe interpolation?', '', 'Lighting color', '', 'Layer transparency', '', 'Speed of transitions between frames', '', 'Particle decay', '', 'c', 'mcq', ''),
(579, 'animation_level_3', 'Why is the Z-axis commonly designated as the \'depth\' axis in 3D applications?', '', 'Historical artifact from CAD', '', 'Z is the only unsigned axis', '', 'It follows the right-hand rule for 3D space', '', 'To prevent confusion with time', '', 'c', 'mcq', ''),
(580, 'animation_level_3', 'What does \'animatic\' refer to in the preproduction stage?', '', 'A finalized rendered video', '', 'A moving storyboard with temporary audio', '', 'A rough 3D blocking pass', '', 'A model turnaround', '', 'b', 'mcq', ''),
(581, 'animation_level_3', 'In After Effects, what is a \'pre-comp\'?', '', 'A preview window', '', 'A composition nested inside another', '', 'An audio sync marker', '', 'A cache for RAM preview', '', 'b', 'mcq', ''),
(582, 'animation_level_3', 'Which animation principle helps show the viewer where to focus during a scene?', '', 'Appeal', '', 'Exaggeration', '', 'Staging', '', 'Timing', '', 'c', 'mcq', ''),
(583, 'animation_level_3', 'What issue arises if a character\'s skin deforms unnaturally at joints like elbows?', '', 'Texture seam', '', 'Weight painting error', '', 'Gimbal lock', '', 'Loop polygon mismatch', '', 'b', 'mcq', ''),
(595, 'cpp_level_1', 'What is the correct way to start a C++ program?', '', 'start main()', '', 'int main()', '', 'void main()', '', 'begin()', '', 'b', 'mcq', ''),
(596, 'cpp_level_1', 'Which symbol is used to end a statement in C++?', '', ':', '', ',', '', ';', '', '.', '', 'c', 'mcq', ''),
(597, 'cpp_level_1', 'Which of the following is used to take input from the user in C++?', '', 'printf', '', 'cin', '', 'cout', '', 'scanf', '', 'b', 'mcq', ''),
(598, 'cpp_level_1', 'Which of these is a correct C++ comment?', '', '/* This is a comment */', '', '# This is a comment', '', '<!-- This is a comment -->', '', '-- This is a comment', '', 'a', 'mcq', ''),
(599, 'cpp_level_1', 'Which data type is used to store a whole number in C++?', '', 'float', '', 'char', '', 'int', '', 'string', '', 'c', 'mcq', ''),
(600, 'cpp_level_1', 'What is the correct way to declare a variable in C++?', '', 'int x = 10;', '', 'x = int 10;', '', 'int = x 10;', '', 'x: int = 10;', '', 'a', 'mcq', ''),
(601, 'cpp_level_1', 'Which keyword is used to define a constant in C++?', '', 'const', '', 'define', '', 'fixed', '', 'static', '', 'a', 'mcq', ''),
(602, 'cpp_level_1', 'Which operator is used for comparison in C++?', '', '=', '', '==', '', '!=', '', 'Both B and C', '', 'd', 'mcq', ''),
(603, 'cpp_level_1', 'What is the correct way to declare and initialize an array in C++?', '', 'int arr[] = {1, 2, 3};', '', 'int arr(3) = {1, 2, 3};', '', 'int arr[3] = {1, 2, 3};', '', 'int arr[3] = (1, 2, 3);', '', 'c', 'mcq', ''),
(604, 'cpp_level_1', 'Which loop is used when you know the number of iterations in advance?', '', 'while loop', '', 'for loop', '', 'do-while loop', '', 'foreach loop', '', 'b', 'mcq', ''),
(605, 'cpp_level_1', 'Which of the following is the correct syntax for a C++ function declaration?', '', 'int add(int a, int b);', '', 'void add(int a, int b);', '', 'int add(int, int);', '', 'All of the above', '', 'd', 'mcq', ''),
(606, 'cpp_level_1', 'What is the default value of an uninitialized static variable in C++?', '', '0', '', 'Undefined', '', 'Null', '', 'Random value', '', 'a', 'mcq', ''),
(607, 'cpp_level_1', 'How can you pass an array to a function in C++?', '', 'By value', '', 'By reference', '', 'By pointer', '', 'All of the above', '', 'd', 'mcq', ''),
(608, 'cpp_level_1', 'Which of the following is the correct syntax to define a class in C++?', '', 'class MyClass {};', '', 'MyClass class {};', '', 'class MyClass: {};', '', 'class MyClass: public {};', '', 'a', 'mcq', ''),
(609, 'cpp_level_1', 'What is the purpose of the public keyword in a C++ class?', '', 'To restrict access to class members', '', 'To define the type of the class', '', 'To allow access to class members from outside the class', '', 'To hide the implementation of the class', '', 'c', 'mcq', ''),
(610, 'cpp_level_1', 'Which of the following is used to allocate memory dynamically in C++?', '', 'malloc()', '', 'free()', '', 'new', '', 'alloc()', '', 'c', 'mcq', ''),
(611, 'cpp_level_1', 'Which operator is used to access members of a class in C++?', '', '. (dot)', '', '-> (arrow)', '', ':: (scope resolution)', '', 'Both A and B', '', 'd', 'mcq', ''),
(612, 'cpp_level_1', 'What is the correct syntax to create an object of a class named Person in C++?', '', 'Person obj = new Person();', '', 'Person obj;', '', 'Person obj();', '', 'new Person obj;', '', 'b', 'mcq', ''),
(613, 'cpp_level_1', 'Which of the following is a feature of polymorphism in C++?', '', 'Function overloading', '', 'Operator overloading', '', 'Virtual functions', '', 'All of the above', '', 'd', 'mcq', ''),
(614, 'cpp_level_1', 'Which of these C++ keywords is used to create a constant variable?', '', 'final', '', 'constant', '', 'static', '', 'const', '', 'd', 'mcq', ''),
(626, 'cpp_level_2', 'What is the output of this code?', 'uploads/images/cppq21.png', '34', '', '7', '', 'a + b', '', 'Error', '', 'b', 'mcq', ''),
(627, 'cpp_level_2', 'What will this code print?', 'uploads/images/cppq22.png', 'Hello World', '', 'Hello\nWorld', '', 'Hello<br>World', '', 'Error', '', 'c', 'mcq', ''),
(628, 'cpp_level_2', 'What will the following code output?', 'uploads/images/cppq23.png', 'Smaller', '', 'Greater', '', 'Error', '', 'Nothing', '', 'b', 'mcq', ''),
(629, 'cpp_level_2', 'What will the following code print?', 'uploads/images/cppq24.png', '1', '', '2', '', '1.5', '', 'Error', '', 'a', 'mcq', ''),
(630, 'cpp_level_2', 'What will this code print when the user enters 5?', 'uploads/images/cppq25.png', 'You entered: 5', '', '5 You entered:', '', 'Error', '', 'Nothing', '', 'a', 'mcq', ''),
(631, 'cpp_level_2', 'What will this code output if the user enters \'10 20\'?', 'uploads/images/cppq26.png', '10', '', '30', '', '1020', '', 'Error', '', 'b', 'mcq', ''),
(632, 'cpp_level_2', 'If the user enters 3.14, what is the expected output from the following code?', 'uploads/images/cppq27.png', '3', '', '3.14', '', '3.140000', '', 'Error', '', 'b', 'mcq', ''),
(633, 'cpp_level_2', 'What will happen if the user enters abc for an integer input in the following code?', 'uploads/images/cppq28.png', 'It will print abc.', '', 'It will print nothing.', '', 'It will print 0.', '', 'It will throw an error.', '', 'c', 'mcq', ''),
(634, 'cpp_level_2', 'What will the following code print if the user enters 2 3 4?', 'uploads/images/cppq29.png', '2', '', '24', '', '6', '', '234', '', 'b', 'mcq', ''),
(635, 'cpp_level_2', 'What is the output of this code?', 'uploads/images/cppq210.png', '21', '', '20', '', '22', '', '23', '', 'c', 'mcq', ''),
(636, 'cpp_level_2', 'What will be the output of the following code?', 'uploads/images/cppq211.png', '31', '', '30', '', '29', '', '28', '', 'b', 'mcq', ''),
(637, 'cpp_level_2', 'What is the output of the following code?', 'uploads/images/cppq212.png', 'True', '', 'False', '', 'Error', '', 'Nothing', '', 'a', 'mcq', ''),
(638, 'cpp_level_2', 'What is the output of this code?', 'uploads/images/cppq213.png', '10', '', '20', '', '30', '', 'Error', '', 'b', 'mcq', ''),
(639, 'cpp_level_2', 'What is the output of the following code?', 'uploads/images/cppq214.png', '5', '', '10', '', '15', '', 'Compilation Error', '', 'c', 'mcq', ''),
(640, 'cpp_level_2', 'What will the following code output?', 'uploads/images/cppq215.png', '5', '', '6', '', '7', '', 'Error', '', 'b', 'mcq', ''),
(641, 'cpp_level_2', 'What will be the output of this code?', 'uploads/images/cppq216.png', '10', '', '20', '', 'Error', '', 'Undefined behaviour', '', 'b', 'mcq', ''),
(642, 'cpp_level_2', 'Consider the following code. What will it print?', 'uploads/images/cppq217.png', '5', '', '10', '', 'Memory address of a', '', 'Undefined behaviour', '', 'b', 'mcq', ''),
(643, 'cpp_level_2', 'What will the following code output?', 'uploads/images/cppq218.png', '10', '', '20', '', '30', '', 'Error', '', 'b', 'mcq', ''),
(644, 'cpp_level_2', 'What is the output of the following code?', 'uploads/images/cppq219.png', '1', '', '0', '', 'Error', '', 'Undefined', '', 'a', 'mcq', ''),
(645, 'cpp_level_2', 'What will this code output?', 'uploads/images/cppq220.png', 'Base class', '', 'Derived class', '', 'Compilation error', '', 'Runtime error', '', 'b', 'mcq', ''),
(657, 'cpp_level_3', 'Write a C++ program that takes an integer as input and prints the square of that number.', 'uploads/images/cppq31.png', '', '', '', '', '', '', '', '', '', 'subjective', ''),
(658, 'cpp_level_3', 'Write a C++ program that reads three numbers and prints their sum.', 'uploads/images/cppq32.png', '', '', '', '', '', '', '', '', '', 'subjective', ''),
(659, 'cpp_level_3', 'Write a C++ program that checks if a number is prime or not.', 'uploads/images/cppq33.1.png,uploads/images/cppq33.2.png', '', '', '', '', '', '', '', '', '', 'subjective', ''),
(660, 'cpp_level_3', 'Write a C++ program that reverses a given string.', 'uploads/images/cppq34.png', '', '', '', '', '', '', '', '', '', 'subjective', ''),
(661, 'cpp_level_3', 'Write a C++ program to implement a class Matrix that can perform matrix addition, subtraction, and multiplication.', 'uploads/images/cppq35.1.png,uploads/images/cppq35.2.png', '', '', '', '', '', '', '', '', '', 'subjective', ''),
(662, 'cpp_level_3', 'Write a C++ program to implement a Dynamic Array class with various operations.', 'uploads/images/cppq36.png', '', '', '', '', '', '', '', '', '', 'subjective', ''),
(663, 'cpp_level_3', 'Write a C++ program that implements a Student Management System.', 'uploads/images/cppq37.png', '', '', '', '', '', '', '', '', '', 'subjective', ''),
(664, 'cpp_level_3', 'Write a C++ program that implements a Simple Bank System.', 'uploads/images/cppq38.png', '', '', '', '', '', '', '', '', '', 'subjective', ''),
(672, 'sql_level_1', 'What is the correct SQL command to retrieve all columns from a table named employees?', '', 'GET * FROM employees;', '', 'SELECT * FROM employees;', '', 'FETCH ALL employees;', '', 'SHOW * FROM employees;', '', 'b', 'mcq', ''),
(673, 'sql_level_1', 'Which SQL clause is used to filter records based on a condition?', '', 'ORDER BY', '', 'WHERE', '', 'GROUP BY', '', 'HAVING', '', 'b', 'mcq', ''),
(674, 'sql_level_1', 'Which SQL keyword is used to sort query results?', '', 'FILTER BY', '', 'SORT', '', 'ORDER BY', '', 'GROUP BY', '', 'c', 'mcq', ''),
(675, 'sql_level_1', 'What is the purpose of a PRIMARY KEY in a table?', '', 'To allow duplicate values', '', 'To uniquely identify each record', '', 'To speed up queries', '', 'To store foreign key references', '', 'b', 'mcq', ''),
(676, 'sql_level_1', 'Which data type is used to store text values in SQL?', '', 'VARCHAR', '', 'INT', '', 'FLOAT', '', 'BOOLEAN', '', 'a', 'mcq', ''),
(677, 'sql_level_1', 'Which SQL function is used to count the number of rows in a table?', '', 'SUM()', '', 'COUNT()', '', 'TOTAL()', '', 'NUMBER()', '', 'b', 'mcq', ''),
(678, 'sql_level_1', 'What does NULL mean in SQL?', '', 'It represents zero (0)', '', 'It represents an empty string', '', 'It represents an unknown or missing value', '', 'It means the column is set to default', '', 'c', 'mcq', ''),
(679, 'sql_level_1', 'Which type of SQL JOIN returns only the matching rows from both tables?', '', 'LEFT JOIN', '', 'RIGHT JOIN', '', 'INNER JOIN', '', 'FULL JOIN', '', 'c', 'mcq', ''),
(680, 'sql_level_1', 'Which SQL function is used to find the highest value in a column?', '', 'MAX()', '', 'HIGH()', '', 'TOP()', '', 'GREATEST()', '', 'a', 'mcq', ''),
(681, 'sql_level_1', 'Which SQL constraint ensures that a column cannot have duplicate values?', '', 'DEFAULT', '', 'UNIQUE', '', 'NOT NULL', '', 'FOREIGN KEY', '', 'b', 'mcq', ''),
(682, 'sql_level_1', 'Which SQL command is used to remove all records from a table, but not the table itself?', '', 'DELETE', '', 'DROP', '', 'TRUNCATE', '', 'REMOVE', '', 'c', 'mcq', ''),
(683, 'sql_level_1', 'Which SQL clause is used to filter records after the GROUP BY clause?', '', 'WHERE', '', 'HAVING', '', 'FILTER', '', 'SELECT', '', 'b', 'mcq', ''),
(684, 'sql_level_1', 'Which SQL JOIN returns all records from the left table and only matching records from the right table?', '', 'INNER JOIN', '', 'LEFT JOIN', '', 'RIGHT JOIN', '', 'FULL JOIN', '', 'b', 'mcq', ''),
(685, 'sql_level_1', 'What does the SQL DISTINCT keyword do?', '', 'Limits the number of rows returned.', '', 'Ensures that all rows are returned without duplicates.', '', 'Sorts the rows in ascending order.', '', 'Combines two tables into one.', '', 'b', 'mcq', ''),
(686, 'sql_level_1', 'What is the default sorting order of the ORDER BY clause in SQL?', '', 'Ascending', '', 'Descending', '', 'Random', '', 'Alphabetical', '', 'a', 'mcq', ''),
(687, 'sql_level_1', 'Which SQL function is used to count the number of rows in a table?', '', 'COUNT()', '', 'SUM()', '', 'TOTAL()', '', 'ROW COUNT()', '', 'a', 'mcq', ''),
(688, 'sql_level_1', 'Which SQL command is used to modify an existing table structure?', '', 'MODIFY', '', 'UPDATE', '', 'ALTER', '', 'CHANGE', '', 'c', 'mcq', ''),
(689, 'sql_level_1', 'Which SQL clause is used to sort query results in ascending order by default?', '', 'ORDER BY', '', 'GROUP BY', '', 'ASC', '', 'DESC', '', 'a', 'mcq', ''),
(690, 'sql_level_1', 'Which SQL keyword is used to remove a table from a database?', '', 'DELETE', '', 'TRUNCATE', '', 'DROP', '', 'REMOVE', '', 'c', 'mcq', ''),
(691, 'sql_level_1', 'Which SQL command is used to add a new column to an existing table?', '', 'INSERT', '', 'ADD COLUMN', '', 'ALTER TABLE', '', 'UPDATE', '', 'c', 'mcq', ''),
(703, 'sql_level_2', 'Given the following tables: Customers and Orders, which SQL query retrieves the customer name and order date for each customer who has placed an order?', 'uploads/images/sqlq21.1.png,uploads/images/sqlq21.2.png', 'uploads/images/sqlq21a.png', '', 'uploads/images/sqlq21b.png', '', 'uploads/images/sqlq21c.png', '', 'uploads/images/sqlq21d.png', '', 'a', 'mcq', ''),
(704, 'sql_level_2', 'You have a table called Sales that stores sales data. What SQL query would give you the total quantity of each product sold?', 'uploads/images/sqlq22.png', 'uploads/images/sqlq22a.png', '', 'uploads/images/sqlq22b.png', '', 'uploads/images/sqlq22c.png', '', 'uploads/images/sqlq22d.png', '', 'b', 'mcq', ''),
(705, 'sql_level_2', 'You have two tables: Employees and Departments. What SQL query would return the employee names and their department names where the employee\'s salary is greater than the average salary in their department?', 'uploads/images/sqlq23.1.png,uploads/images/sqlq23.2.png', 'uploads/images/sqlq23a.png', '', 'uploads/images/sqlq23b.png', '', 'uploads/images/sqlq23c.png', '', 'uploads/images/sqlq23d.png', '', 'a', 'mcq', ''),
(706, 'sql_level_2', 'What SQL query returns the total number of orders placed by customers, but only for customers who have placed more than 1 order?', '', 'uploads/images/sqlq24a.png', '', 'uploads/images/sqlq24b.png', '', 'uploads/images/sqlq24c.png', '', 'uploads/images/sqlq24d.png', '', 'a', 'mcq', ''),
(707, 'sql_level_2', 'Which SQL statement updates the salary to 75000 for employees in the \'IT\' department?', '', 'uploads/images/sqlq25a.png', '', 'uploads/images/sqlq25b.png', '', 'uploads/images/sqlq25c.png', '', 'uploads/images/sqlq25d.png', '', 'a', 'mcq', ''),
(708, 'sql_level_2', 'Which SQL query will return all unique cities from the Customers table?', '', 'uploads/images/sqlq26a.png', '', 'uploads/images/sqlq26b.png', '', 'uploads/images/sqlq26c.png', '', 'uploads/images/sqlq26d.png', '', 'a', 'mcq', ''),
(709, 'sql_level_2', 'Which SQL query selects all customers from either \'London\' or \'Paris\'?', '', 'uploads/images/sqlq27a.png', '', 'uploads/images/sqlq27b.png', '', 'uploads/images/sqlq27c.png', '', 'uploads/images/sqlq27d.png', '', 'b', 'mcq', ''),
(710, 'sql_level_2', 'What SQL query can categorize orders based on their total amount into \'High\', \'Medium\', or \'Low\'?', '', 'uploads/images/sqlq28a.png', '', 'uploads/images/sqlq28b.png', '', 'uploads/images/sqlq28c.png', '', 'uploads/images/sqlq28d.png', '', 'a', 'mcq', ''),
(711, 'sql_level_2', 'Which SQL query deletes all orders from the Orders table that were placed by customer ID 2?', '', 'uploads/images/sqlq29a.png', '', 'uploads/images/sqlq29b.png', '', 'uploads/images/sqlq29c.png', '', 'uploads/images/sqlq29d.png', '', 'a', 'mcq', ''),
(712, 'sql_level_2', 'Which SQL query retrieves all customers and their respective orders, if any, including customers with no orders?', '', 'uploads/images/sqlq210a.png', '', 'uploads/images/sqlq210b.png', '', 'uploads/images/sqlq210c.png', '', 'uploads/images/sqlq210d.png', '', 'a', 'mcq', ''),
(713, 'sql_level_2', 'Which SQL query uses a table alias correctly?', '', 'uploads/images/sqlq211a.png', '', 'uploads/images/sqlq211b.png', '', 'uploads/images/sqlq211c.png', '', 'uploads/images/sqlq211d.png', '', 'a', 'mcq', ''),
(714, 'sql_level_2', 'What query returns products with a price between 100 and 500?', '', 'uploads/images/sqlq212a.png', '', 'uploads/images/sqlq212b.png', '', 'uploads/images/sqlq212c.png', '', 'uploads/images/sqlq212d.png', '', 'a', 'mcq', ''),
(715, 'sql_level_2', 'Which query returns the average salary of employees?', '', 'uploads/images/sqlq213a.png', '', 'uploads/images/sqlq213b.png', '', 'uploads/images/sqlq213c.png', '', 'uploads/images/sqlq213d.png', '', 'b', 'mcq', ''),
(716, 'sql_level_2', 'Which SQL query selects employees with a salary greater than the average salary?', '', 'uploads/images/sqlq214a.png', '', 'uploads/images/sqlq214b.png', '', 'uploads/images/sqlq214c.png', '', 'uploads/images/sqlq214d.png', '', 'a', 'mcq', ''),
(717, 'sql_level_2', 'What query selects customers who haven’t placed any orders?', '', 'uploads/images/sqlq215a.png', '', 'uploads/images/sqlq215b.png', '', 'uploads/images/sqlq215c.png', '', 'uploads/images/sqlq215d.png', '', 'a', 'mcq', ''),
(718, 'sql_level_2', 'How do you select the top 5 highest paid employees?', '', 'uploads/images/sqlq216a.png', '', 'uploads/images/sqlq216b.png', '', 'uploads/images/sqlq216c.png', '', 'uploads/images/sqlq216d.png', '', 'c', 'mcq', ''),
(719, 'sql_level_2', 'Which query finds all customer names that start with \'A\'?', '', 'uploads/images/sqlq217a.png', '', 'uploads/images/sqlq217b.png', '', 'uploads/images/sqlq217c.png', '', 'uploads/images/sqlq217d.png', '', 'a', 'mcq', ''),
(720, 'sql_level_2', 'Which query shows customers sorted by credit limit in descending order?', '', 'uploads/images/sqlq218a.png', '', 'uploads/images/sqlq218b.png', '', 'uploads/images/sqlq218c.png', '', 'uploads/images/sqlq218d.png', '', 'a', 'mcq', ''),
(721, 'sql_level_2', 'Which query retrieves all employees who don’t have a manager assigned (NULL in manager_id)?', '', 'uploads/images/sqlq219a.png', '', 'uploads/images/sqlq219b.png', '', 'uploads/images/sqlq219c.png', '', 'uploads/images/sqlq219d.png', '', 'a', 'mcq', ''),
(722, 'sql_level_2', 'Which SQL statement correctly defines a primary key on employee_id in the Employees table?', '', 'uploads/images/sqlq220a.png', '', 'uploads/images/sqlq220b.png', '', 'uploads/images/sqlq220c.png', '', 'uploads/images/sqlq220d.png', '', 'a', 'mcq', ''),
(734, 'sql_level_3', 'Create a table named Students with the following columns: student_id (INTEGER, Primary Key), name (VARCHAR(50)), age (INTEGER), major (VARCHAR(50)). After creating the table, insert the following data:', 'uploads/images/sqlq31.png', '', '', '', '', '', '', '', '', '', 'subjective', ''),
(735, 'sql_level_3', 'Using the Students table above, write a SQL query to: Select all students majoring in \'Computer Science\' and only include students who are older than 21.', 'uploads/images/sqlq32.png', '', '', '', '', '', '', '', '', '', 'subjective', ''),
(736, 'sql_level_3', 'You have two tables: Customers and Orders. Write a SQL query to list each customer\'s name and their total order amount. If a customer hasn’t placed any orders, they should still be listed with total amount as NULL or 0.', 'uploads/images/sqlq34.1.png,uploads/images/sqlq34.2.png,uploads/images/sqlq34.3.png', '', '', '', '', '', '', '', '', '', 'subjective', ''),
(737, 'sql_level_3', 'Using the Orders table above, write a query to find customers who have placed orders with an amount greater than the average order amount.', 'uploads/images/sqlq35.png', '', '', '', '', '', '', '', '', '', 'subjective', ''),
(738, 'sql_level_3', 'You’re designing a small University Database with the following tables: Students, Courses, Enrollments. Create all 3 tables with appropriate constraints (primary keys and foreign keys).', 'uploads/images/sqlq36.1.png,uploads/images/sqlq36.2.png,uploads/images/sqlq36.3.png,uploads/images/sqlq36.4.png,uploads/images/sqlq36.5.png,uploads/images/sqlq36.6.png', '', '', '', '', '', '', '', '', '', 'subjective', ''),
(739, 'sql_level_3', 'You\'re working as a data analyst for an e-commerce company. Analyze customer orders, spending habits, and product performance. You\'ll be working with the following tables:', 'uploads/images/sqlq37.1.png,uploads/images/sqlq37.2.png,uploads/images/sqlq37.3.png,uploads/images/sqlq37.4.png,uploads/images/sqlq37.5.png,uploads/images/sqlq37.6.png', '', '', '', '', '', '', '', '', '', 'subjective', ''),
(740, 'sql_level_3', 'Write a SQL query to calculate the average grade per course, assuming grades are mapped as: A=4, B=3, C=2, D=1, F=0.', 'uploads/images/sqlq36.4.png,uploads/images/sqlq36.5.png,uploads/images/sqlq36.6.png', '', '', '', '', '', '', '', '', '', 'subjective', ''),
(741, 'java_level_1', 'What is the correct way to print \'Hello,World!\' in Java?', '', 'System.print(\"Hello,World!\");', '', 'echo \"Hello,World!\";', '', 'System.out.println(\"Hello,World!\");', '', 'print(\"Hello,World!\");', '', 'c', 'mcq', ''),
(742, 'java_level_1', 'How do you write a single-line comment in Java?', '', '<!-- This is a comment -->', '', '// This is a comment', '', '/* This is a comment */', '', '# This is a comment', '', 'b', 'mcq', ''),
(743, 'java_level_1', 'Which of the following declares an integer variable in Java?', '', 'int x = 10;', '', 'x = 10;', '', 'integer x = 10;', '', 'var x = 10;', '', 'a', 'mcq', ''),
(744, 'java_level_1', 'What is the correct file extension for Java source files?', '', '.java', '', '.jav', '', '.class', '', '.j', '', 'a', 'mcq', ''),
(745, 'java_level_1', 'Which keyword is used to define a class in Java?', '', 'define', '', 'class', '', 'struct', '', 'object', '', 'b', 'mcq', ''),
(746, 'java_level_1', 'What is the default value of an int variable in Java?', '', '0', '', 'null', '', 'undefined', '', '1', '', 'a', 'mcq', ''),
(747, 'java_level_1', 'Which method is called when an object is created?', '', 'main()', '', 'constructor', '', 'static method', '', 'class method', '', 'b', 'mcq', ''),
(748, 'java_level_1', 'What is used to store multiple values in a single variable?', '', 'Array', '', 'Variable', '', 'Function', '', 'Loop', '', 'a', 'mcq', ''),
(749, 'java_level_1', 'What is the correct way to create an object in Java?', '', 'new ClassName();', '', 'ClassName();', '', 'object.create(ClassName);', '', 'ClassName.new();', '', 'a', 'mcq', ''),
(750, 'java_level_1', 'Which statement is used to exit a loop in Java?', '', 'stop;', '', 'break;', '', 'exit;', '', 'return;', '', 'b', 'mcq', ''),
(751, 'java_level_1', 'What is encapsulation in Java?', '', 'Hiding data and providing controlled access through methods', '', 'Using loops to repeat code', '', 'A feature that allows multiple inheritance', '', 'A way to declare a method', '', 'a', 'mcq', ''),
(752, 'java_level_1', 'Which statement about method overloading is correct?', '', 'Overloaded methods must have the same parameter list', '', 'Overloaded methods must have different parameter lists', '', 'Overloaded methods must have different return types', '', 'Overloaded methods must belong to different classes', '', 'b', 'mcq', ''),
(753, 'java_level_1', 'Which access modifier makes a variable accessible only within the same package?', '', 'public', '', 'private', '', 'protected', '', '(default)(no modifier)', '', 'd', 'mcq', ''),
(754, 'java_level_1', 'What is the purpose of the \'this\' keyword in Java?', '', 'It refers to the current object', '', 'It refers to the parent class', '', 'It is used to call static methods', '', 'It is used to define a new object', '', 'a', 'mcq', ''),
(755, 'java_level_1', 'Which statement about constructors is true?', '', 'A constructor must have a void return type', '', 'A constructor can have a different name than the class', '', 'A constructor initializes an object when it is created', '', 'A constructor cannot have parameters', '', 'c', 'mcq', ''),
(756, 'java_level_1', 'What happens if an exception is not caught in Java?', '', 'The program ignores it and continues running', '', 'The program stops execution and prints an error message', '', 'The exception is automatically fixed', '', 'The program restarts', '', 'b', 'mcq', ''),
(757, 'java_level_1', 'Which of the following is true about ArrayList in Java?', '', 'ArrayList has a fixed size', '', 'ArrayList allows dynamic resizing', '', 'ArrayList only stores primitive data types', '', 'ArrayList is faster than arrays in all cases', '', 'b', 'mcq', ''),
(758, 'java_level_1', 'What is true about static methods in Java?', '', 'Static methods belong to the class rather than an instance', '', 'Static methods can only be called from other static methods', '', 'Static methods can access instance variables', '', 'Static methods must have the same name as the class', '', 'a', 'mcq', ''),
(759, 'java_level_1', 'Which keyword is used in Java for inheritance?', '', 'extends', '', 'inherits', '', 'implements', '', 'super', '', 'a', 'mcq', ''),
(760, 'java_level_1', 'What is the key difference between an interface and an abstract class?', '', 'An interface can have constructors, but an abstract class cannot', '', 'An interface cannot have method implementations before Java 8', '', 'An abstract class cannot have instance variables', '', 'An interface allows multiple inheritance, but an abstract class does not', '', 'b', 'mcq', ''),
(772, 'java_level_2', 'What will be the output of the following Java code?', 'uploads/images/javaq21.png', 'JavaProgramming', '', 'Java Programming', '', 'Java + Programming', '', 'Error', '', 'b', 'mcq', ''),
(773, 'java_level_2', 'What is the output of the following Java code?', 'uploads/images/javaq22.png', '1 2 3', '', '1 2 3 4', '', '1 1 1', '', '2 3 4', '', 'a', 'mcq', ''),
(774, 'java_level_2', 'Which method signature correctly overrides the following method?', 'uploads/images/javaq23.png', 'public void display() { }', '', 'private void display() { }', '', 'public int display() { return 0; }', '', 'void display() { }', '', 'a', 'mcq', ''),
(775, 'java_level_2', 'What is the expected output of the following code?', 'uploads/images/javaq24.png', '1', '', '1.66', '', '2', '', 'Error: Division by zero', '', 'a', 'mcq', ''),
(776, 'java_level_2', 'What will be the output of the following Java code?', 'uploads/images/javaq25.png', 'HelloWorld', '', 'Hello World', '', 'Error: Incompatible types', '', 'Hello', '', 'b', 'mcq', ''),
(777, 'java_level_2', 'What will be the output of the following Java code?', 'uploads/images/javaq26.png', '2', '', '2.0', '', '2.5', '', 'Error', '', 'a', 'mcq', ''),
(778, 'java_level_2', 'What is the output of the following Java code?', 'uploads/images/javaq27.png', '1 2', '', '1 2 3', '', '1 2 3 4', '', 'Error: Infinite loop', '', 'a', 'mcq', ''),
(779, 'java_level_2', 'What will the following code output?', 'uploads/images/javaq28.png', '4', '', 'ArrayIndexOutOfBoundsException', '', '3', '', 'Error: Null pointer exception', '', 'b', 'mcq', ''),
(780, 'java_level_2', 'What is the expected output of this Java code?', 'uploads/images/javaq29.png', '3', '', '4', '', '5', '', 'Error: IndexOutOfBoundsException', '', 'b', 'mcq', ''),
(781, 'java_level_2', 'What will the following Java program output?', 'uploads/images/javaq210.png', '3', '', '3.0', '', '3.5', '', 'Error', '', 'c', 'mcq', ''),
(782, 'java_level_2', 'What is the output of the following Java code?', 'uploads/images/javaq211.png', '0 1 2', '', '0 1 2 3', '', '0 1 2 3 4', '', 'Error: Infinite loop', '', 'a', 'mcq', ''),
(783, 'java_level_2', 'What will be the output of the following Java code?', 'uploads/images/javaq212.png', '1', '', '2', '', '3', '', 'Error', '', 'c', 'mcq', ''),
(784, 'java_level_2', 'What will be the output of the following Java code?', 'uploads/images/javaq213.png', 'True', '', 'False', '', 'Error', '', 'Null', '', 'b', 'mcq', ''),
(785, 'java_level_2', 'What is the expected output of the following Java code?', 'uploads/images/javaq214.png', 'Progra', '', 'Program', '', 'Programmin', '', 'Progr', '', 'd', 'mcq', ''),
(786, 'java_level_2', 'What is the output of the following Java code?', 'uploads/images/javaq215.png', 'World', '', 'Hello', '', 'Error', '', 'No output', '', 'b', 'mcq', ''),
(787, 'java_level_2', 'What is the output of the following Java code?', 'uploads/images/javaq216.png', '10', '', '20', '', '30', '', 'ArrayIndexOutOfBoundsException', '', 'b', 'mcq', ''),
(788, 'java_level_2', 'What is the expected output of the following Java code?', 'uploads/images/javaq217.png', 'Java', '', 'Java Programming', '', 'Error', '', 'Java Programming Java', '', 'b', 'mcq', ''),
(789, 'java_level_2', 'What is the expected output of the following code?', 'uploads/images/javaq218.png', '35', '', '23', '', '12', '', '17', '', 'b', 'mcq', ''),
(790, 'java_level_2', 'What is the output of the following Java code?', 'uploads/images/javaq219.png', '10 8 6 4 2', '', '10 8 6 4 2 1', '', '10 9 8 7 6 5 4 3 2 1', '', '10 5', '', 'a', 'mcq', ''),
(791, 'java_level_2', 'What is the expected output of the following Java code?', 'uploads/images/javaq220.png', 'P', '', 'p', '', 'r', '', 'Error', '', 'a', 'mcq', ''),
(818, 'java_level_3', 'Write a Java program that calculates the factorial of a given number using recursion. The program should prompt the user to input a number and then display the factorial of that number.', 'uploads/images/javaq31.png', '', '', '', '', '', '', '', '', '', 'subjective', ''),
(819, 'java_level_3', 'Write a Java program to check whether a given number is prime or not. The program should prompt the user to enter a number and display whether the number is prime or not.', 'uploads/images/javaq32.1.png,uploads/images/javaq32.2.png', '', '', '', '', '', '', '', '', '', 'subjective', ''),
(820, 'java_level_3', 'Write a Java program that sorts an array of integers in ascending order using the Bubble Sort algorithm. The program should print the sorted array after sorting.', 'uploads/images/javaq33.png', '', '', '', '', '', '', '', '', '', 'subjective', ''),
(821, 'java_level_3', 'Create a simple banking system where a user can perform the following operations: View balance, Deposit money, Withdraw money, Transfer money to another account. The bank should have multiple accounts, and each account should have a unique account number.', '', '', '', '', '', '', '', '', '', '', 'subjective', ''),
(822, 'java_level_3', 'Create a library management system that allows: Adding books to the library, Viewing available books, Borrowing books, Returning books. The system should store books and their details, such as title, author, and number of copies.', '', '', '', '', '', '', '', '', '', '', 'subjective', ''),
(823, 'java_level_3', 'Design and implement a TodoList application that allows users to: Add new tasks, View all tasks, Mark tasks as completed, Delete tasks. Each task should have a description, priority level (high, medium, low), and a status (completed or not completed).', '', '', '', '', '', '', '', '', '', '', 'subjective', ''),
(824, 'java_level_3', 'Design and implement a StudentGradingSystem that allows teachers to: Add a student with their name and grades in three subjects, View the details of a student, Display all students sorted by their average grade, Find the highest and lowest average grade.', '', '', '', '', '', '', '', '', '', '', 'subjective', ''),
(825, 'java_level_3', 'Create a Java program that simulates a simple ATM system. The system should allow users to deposit, withdraw, and check their balance. Ensure that the system checks for sufficient balance before allowing a withdrawal.', '', '', '', '', '', '', '', '', '', '', 'subjective', ''),
(833, 'python_level_3', 'Write a Python function to calculate the factorial of a given number using recursion.', 'uploads/images/pythonq31.png', '', '', '', '', '', '', '', '', '', 'subjective', ''),
(834, 'python_level_3', 'Write a Python program to find the maximum value in a list without using the built-in max() function.', 'uploads/images/pythonq32.png', '', '', '', '', '', '', '', '', '', 'subjective', ''),
(835, 'python_level_3', 'Create a Python script to read a CSV file and print each row in the file.', 'uploads/images/pythonq33.png', '', '', '', '', '', '', '', '', '', 'subjective', ''),
(836, 'python_level_3', 'Write a Python function that takes a list of integers and returns the sum of all even numbers in the list.', 'uploads/images/pythonq34.png', '', '', '', '', '', '', '', '', '', 'subjective', ''),
(837, 'python_level_3', 'Write a Python program to reverse a string without using built-in functions.', 'uploads/images/pythonq35.png', '', '', '', '', '', '', '', '', '', 'subjective', ''),
(838, 'python_level_3', 'Create a Python script to read a text file and count the number of words.', 'uploads/images/pythonq36.png', '', '', '', '', '', '', '', '', '', 'subjective', ''),
(839, 'python_level_3', 'Write a Python function to merge two dictionaries.', 'uploads/images/pythonq37.png', '', '', '', '', '', '', '', '', '', 'subjective', ''),
(840, 'python_level_3', 'Develop a Python program to find the longest common prefix from a list of strings.', 'uploads/images/pythonq38.png', '', '', '', '', '', '', '', '', '', 'subjective', ''),
(848, 'python_level_2', 'What is a lambda function in Python?', '', 'A function that can have multiple expressions', '', 'An anonymous function expressed as a single statement', '', 'A function with variable arguments', '', 'A function that can be used only once', '', 'b', 'mcq', ''),
(849, 'python_level_2', 'What is the output of: print(list(map(lambda x: x**2, [1, 2, 3])))', '', '[1, 2, 3]', '', '[1, 4, 9]', '', '[2, 4, 6]', '', '[1, 8, 27]', '', 'b', 'mcq', ''),
(850, 'python_level_2', 'Which of the following best describes list comprehension in Python?', '', 'A way to create lists from existing lists', '', 'A method to generate random lists', '', 'A way to convert tuples into lists', '', 'A technique to perform matrix operations', '', 'a', 'mcq', ''),
(851, 'python_level_2', 'What is the purpose of the zip() function in Python?', '', 'Combining multiple lists into tuples', '', 'Compressing files', '', 'Sorting lists', '', 'Creating dictionaries', '', 'a', 'mcq', ''),
(852, 'python_level_2', 'Which method removes the last element from a list in Python?', '', 'pop()', '', 'remove()', '', 'delete()', '', 'clear()', '', 'a', 'mcq', ''),
(853, 'python_level_2', 'What does the \'with\' statement do in Python?', '', 'Creates a thread', '', 'Handles file cleanup automatically', '', 'Declares global variables', '', 'Initiates a lambda function', '', 'b', 'mcq', ''),
(854, 'python_level_2', 'What is the difference between \'==\' and \'is\' in Python?', '', '\'==\' checks equality, \'is\' checks identity', '', '\'==\' checks identity, \'is\' checks equality', '', 'Both perform the same function', '', '\'==\' checks data type, \'is\' checks value', '', 'a', 'mcq', ''),
(855, 'python_level_2', 'How can you create a set in Python?', '', '{1, 2, 3}', '', '[1, 2, 3]', '', '(1, 2, 3)', '', '{1:2, 3:4}', '', 'a', 'mcq', ''),
(856, 'python_level_2', 'Which of the following can be used to handle exceptions in Python?', '', 'try-except', '', 'if-else', '', 'for-while', '', 'lambda', '', 'a', 'mcq', ''),
(857, 'python_level_2', 'What is the output of print((3 > 2) and (2 < 5))?', '', 'True', '', 'False', '', 'Error', '', 'None', '', 'a', 'mcq', ''),
(858, 'python_level_2', 'Which of the following data structures does not allow duplicate values?', '', 'Set', '', 'List', '', 'Tuple', '', 'Dictionary', '', 'a', 'mcq', ''),
(859, 'python_level_2', 'What is the output of the following code: print(\'Hello\' + str(5))?', '', 'Hello5', '', 'Hello 5', '', 'Error', '', 'Hello + 5', '', 'a', 'mcq', ''),
(860, 'python_level_2', 'How do you create a generator in Python?', '', 'Using the yield keyword', '', 'Using the return keyword', '', 'Using the lambda keyword', '', 'Using the def keyword', '', 'a', 'mcq', ''),
(861, 'python_level_2', 'Which built-in function can be used to sort a list?', '', 'sort()', '', 'sorted()', '', 'order()', '', 'arrange()', '', 'b', 'mcq', ''),
(862, 'python_level_2', 'What does the enumerate() function do?', '', 'Iterates with index and value', '', 'Generates a list of numbers', '', 'Creates a new dictionary', '', 'Combines two lists', '', 'a', 'mcq', ''),
(863, 'python_level_2', 'What is the output of: print(type([]))?', '', '<class \'list\'>', '', '<class \'tuple\'>', '', '<class \'set\'>', '', '<class \'dict\'>', '', 'a', 'mcq', ''),
(864, 'python_level_2', 'Which method can be used to convert a string to lowercase?', '', 'lower()', '', 'tolower()', '', 'casefold()', '', 'to_lowercase()', '', 'a', 'mcq', ''),
(865, 'python_level_2', 'Which keyword is used to create an anonymous function?', '', 'lambda', '', 'def', '', 'func', '', 'anon', '', 'a', 'mcq', ''),
(866, 'python_level_2', 'What is the output of: print(5 // 2)?', '', '2', '', '2.5', '', '3', '', 'Error', '', 'a', 'mcq', ''),
(867, 'python_level_2', 'What is the purpose of the pass statement in Python?', '', 'To do nothing', '', 'To terminate a loop', '', 'To skip to the next iteration', '', 'To create a function', '', 'a', 'mcq', ''),
(879, 'python_level_1', 'What is the correct file extension for Python files?', '', '.py', '', '.python', '', '.pyt', '', '.pt', '', 'a', 'mcq', ''),
(880, 'python_level_1', 'Which keyword is used to define a function in Python?', '', 'func', '', 'def', '', 'function', '', 'define', '', 'b', 'mcq', ''),
(881, 'python_level_1', 'What is the correct syntax to output the type of a variable in Python?', '', 'print(typeOf(x))', '', 'print(type(x))', '', 'print(typeof(x))', '', 'print(x.type())', '', 'b', 'mcq', ''),
(882, 'python_level_1', 'What does the \'len()\' function do in Python?', '', 'Returns the last element', '', 'Returns the length of an object', '', 'Returns the data type', '', 'Returns the sum of elements', '', 'b', 'mcq', ''),
(883, 'python_level_1', 'Which of the following is a valid variable name in Python?', '', '1variable', '', 'variable1', '', 'variable-1', '', 'variable.1', '', 'b', 'mcq', ''),
(884, 'python_level_1', 'What is the output of the following code: print(2**3)?', '', '5', '', '6', '', '8', '', '9', '', 'c', 'mcq', ''),
(885, 'python_level_1', 'How do you start a comment in Python?', '', '//', '', '#', '', '/*', '', '--', '', 'b', 'mcq', ''),
(886, 'python_level_1', 'Which data type is used to store a list of values?', '', 'list', '', 'tuple', '', 'set', '', 'dictionary', '', 'a', 'mcq', ''),
(887, 'python_level_1', 'How do you create a variable with the floating number 2.8 in Python?', '', 'x = 2.8', '', 'x = float(2.8)', '', 'x = \'2.8\'', '', 'x = int(2.8)', '', 'a', 'mcq', ''),
(888, 'python_level_1', 'What is the correct way to create a dictionary in Python?', '', '{key: value}', '', '[key: value]', '', '{key, value}', '', '(key, value)', '', 'a', 'mcq', ''),
(889, 'python_level_1', 'Which method can be used to remove any whitespace from both ends of a string?', '', 'strip()', '', 'trim()', '', 'clean()', '', 'len()', '', 'a', 'mcq', ''),
(890, 'python_level_1', 'Which method can be used to return a string in upper case letters?', '', 'upper()', '', 'capitalize()', '', 'uppercase()', '', 'casefold()', '', 'a', 'mcq', ''),
(891, 'python_level_1', 'Which of the following operators is used to multiply numbers in Python?', '', '*', '', 'x', '', 'mul', '', '/', '', 'a', 'mcq', ''),
(892, 'python_level_1', 'How can you create a variable that cannot be changed?', '', 'const x = 5', '', 'x = constant(5)', '', 'x = 5', '', 'There is no const in Python', '', 'd', 'mcq', ''),
(893, 'python_level_1', 'Which keyword is used to create a class in Python?', '', 'class', '', 'def', '', 'struct', '', 'object', '', 'a', 'mcq', ''),
(894, 'python_level_1', 'How do you write a conditional statement in Python?', '', 'if x > y', '', 'if x > y then', '', 'if (x > y)', '', 'if x > y:', '', 'd', 'mcq', ''),
(895, 'python_level_1', 'What is the output of: print(bool(0))?', '', 'True', '', 'False', '', 'None', '', 'Error', '', 'b', 'mcq', ''),
(896, 'python_level_1', 'How do you create a tuple in Python?', '', '()', '', '[]', '', '{}', '', '<>', '', 'a', 'mcq', ''),
(897, 'python_level_1', 'What is the output of print(\'Hello\'[1])?', '', 'H', '', 'e', '', 'l', '', 'o', '', 'b', 'mcq', ''),
(898, 'python_level_1', 'Which of the following functions can be used to get the current date in Python?', '', 'date.today()', '', 'datetime.date.today()', '', 'now()', '', 'current_date()', '', 'b', 'mcq', ''),
(917, 'editing_ps_level_3', 'You\'re given a high-resolution portrait that needs both colour correction and retouching for a magazine cover. Outline your five-step structured workflow, specifying for each step: Tool or Feature / Purpose / Non destructive Technique.', '', '', '', '', '', '', '', '', '', '', 'subjective', ''),
(918, 'editing_ps_level_3', 'Background Replacement Workflow: Replace the sky in a landscape photo while preserving foreground details. Provide five-step structured workflow.', '', '', '', '', '', '', '', '', '', '', 'subjective', ''),
(919, 'editing_ps_level_3', 'Frequency Separation for Skin Retouching: Smooth skin on a portrait without losing texture. Outline your five-step workflow.', '', '', '', '', '', '', '', '', '', '', 'subjective', ''),
(920, 'editing_ps_level_3', 'Magazine Cover Redesign: Redesign an existing magazine cover for a modern audience. Requirements include adjustment layers, masked portrait with effects, and typographic hierarchy. Upload your files.', '', '', '', '', '', '', '', '', '', '', 'subjective', ''),
(921, 'editing_ps_level_3', 'Cinematic Colour Grade: Apply film-style grading on a RAW still. Use Camera Raw Smart Filter, Gradient Maps or LUTs, and light effects. Upload your files.', '', '', '', '', '', '', '', '', '', '', 'subjective', ''),
(922, 'editing_ps_level_3', 'Product Mock Up Composite: Composite a product shot onto a lifestyle background. Use precise masking, tone matching, and realistic shadows. Upload your files.', '', '', '', '', '', '', '', '', '', '', 'subjective', ''),
(923, 'editing_ps_level_3', 'Surreal Photo Manipulation: Merge at least three photos into a surreal scene. Use Smart Objects, seamless blending, and creative brushes. Upload your files.', '', '', '', '', '', '', '', '', '', '', 'subjective', ''),
(924, 'editing_ps_level_2', 'You need to composite two images with very different lighting so that the subject from Image A looks natural in Image B’s environment. Which workflow is most appropriate?', '', 'Match Colour adjustment on Image A layer → Blend Mode: Soft Light → Gaussian Blur on mask', '', 'Apply Curves adjustment with a Luminosity blend mode on Image A layer → Create Global Light in Shadows/Highlights → Use Camera Raw Filter for final colour grading', '', 'Use Colour Replacement Tool on Image A → Change Blend Mode to Colour → Apply High Pass filter', '', 'Rasterize Image A → Use Dodge and Burn tools to match highlights and shadows', '', 'b', 'mcq', ''),
(925, 'editing_ps_level_2', 'When preparing an image for high end retouching (frequency separation), which of the following describes the two layers you create?', '', 'Low Frequency Layer: Gaussian Blur to capture colour/tone; High Frequency Layer: Apply Image subtracting blurred layer, set to Linear Light blending', '', 'Low Frequency Layer: Apply Median filter; High Frequency Layer: Use High Pass filter at 0.5px radius, set to Overlay', '', 'Low Frequency Layer: Convert to Smart Object; High Frequency Layer: Apply Unsharp Mask', '', 'Low Frequency Layer: Use Surface Blur; High Frequency Layer: Clone Stamp only on details', '', 'a', 'mcq', ''),
(926, 'editing_ps_level_2', 'You want to create a non destructive vignette that adapts to any canvas size and can be edited later. What’s the best approach?', '', 'Add a new layer → Use Elliptical Marquee → Inverse selection → Fill with black → Lower opacity', '', 'Create a Solid Colour fill layer → Add a Layer Mask → Use Gradient tool (Radial, black-to-white) on the mask → Group and convert to Smart Object', '', 'Use Lens Correction filter → Manually adjust Vignette sliders → Apply as Smart Filter', '', 'Duplicate Background → Convert to Smart Object → Apply Camera Raw Filter vignette', '', 'b', 'mcq', ''),
(927, 'editing_ps_level_2', 'In a complex document with dozens of Smart Objects, you need to update a font across all instances. What’s the most efficient method?', '', 'Open each Smart Object individually, change the font, save, and close', '', 'Use \'Find and Replace Text\' in the Type menu on the main document', '', 'Link all text Smart Objects to a single external PSD and edit that source file', '', 'Record an Action that selects each Type layer, changes font, and batch-play it', '', 'c', 'mcq', ''),
(928, 'editing_ps_level_2', 'Which Camera Raw workflow allows you to apply lens corrections, perspective adjustments, and local retouching all in one place, non-destructively?', '', 'Filter → Lens Correction → then Filter → Adaptive Wide Angle → then Filter → Camera Raw Filter', '', 'Filter → Convert for Smart Filters → Filter → Camera Raw Filter (use Profiles, Optics, Transform, and Local tools inside)', '', 'Open image directly in Adobe Camera Raw, perform all edits, then open in Photoshop', '', 'Use Camera Raw as a Smart Object → apply separate Smart Filters for each adjustment', '', 'b', 'mcq', ''),
(929, 'editing_ps_level_2', 'To maintain maximum colour fidelity when exporting for print, which colour space and file format should you use?', '', 'RGB; PNG', '', 'CMYK; TIFF with ZIP compression', '', 'Lab Colour; PSD', '', 'CMYK; JPEG at Quality 12', '', 'b', 'mcq', ''),
(930, 'editing_ps_level_2', 'You need to create a displacement map to wrap a texture naturally over 3D-rendered text. Which steps are correct?', '', 'Duplicate text layer → Rasterize it → Apply Gaussian Blur → Save as PSD → Use Displace filter on texture layer', '', 'Render text to shape → Export paths as Illustrator file → Use that as displacement map', '', 'Create a grayscale rendering of the underlying surface (flattened, high-contrast) → Save as PSD → Apply Displace filter on texture layer using that PSD', '', 'Use Displacement Map adjustment layer → Select text layer as source', '', 'c', 'mcq', ''),
(931, 'editing_ps_level_2', 'Which technique gives you the ability to globally tweak every layer’s opacity and blending mode all at once?', '', 'Select all layers → Press Shift + [', '', 'Add all layers into a Layer Group → Adjust the group’s opacity and blend mode', '', 'Use the \'Global Opacity\' slider in the Properties panel', '', 'Convert all layers into a single Smart Object → Adjust its opacity', '', 'b', 'mcq', ''),
(932, 'editing_ps_level_2', 'In a colour grading workflow, you want to isolate shadows, midtones, and highlights and apply different colour balances to each. Which feature lets you do this most precisely?', '', 'Gradient Map', '', 'Selective Colour', '', 'Shadows/Midtones/Highlights adjustment', '', 'Colour Lookup Tables (LUTs)', '', 'c', 'mcq', ''),
(933, 'editing_ps_level_2', 'When using Data Driven Graphics (Variables) to generate multiple versions of an ad, how do you update text fields programmatically?', '', 'Use the Type Tool to edit each text layer manually', '', 'Import a CSV or XML file defining the variables → Bind Layers to Variables → Data Sets → Apply Data Sets', '', 'Write a JavaScript in ExtendScript Toolkit targeting text layers', '', 'Record an Action that types each variation and batch-play it', '', 'b', 'mcq', ''),
(934, 'editing_ps_level_2', 'To isolate a subject from a complex background with hair detail, which tool is most effective?', '', 'Pen Tool', '', 'Magic Wand', '', 'Select Subject + Refine Hair', '', 'Quick Selection Tool', '', 'c', 'mcq', ''),
(935, 'editing_ps_level_2', 'What is the most efficient method to apply the same colour grading across multiple images?', '', 'Manually copy adjustment layers', '', 'Record and run an Action', '', 'Use a Colour Lookup Table (LUT)', '', 'Use Curves presets individually', '', 'c', 'mcq', ''),
(936, 'editing_ps_level_2', 'Which filter is ideal for giving an image a stylized oil painting effect?', '', 'Surface Blur', '', 'Oil Paint', '', 'Median', '', 'Liquify', '', 'b', 'mcq', '');
INSERT INTO `questions` (`id`, `skill_category`, `question_text`, `question_image`, `option_a`, `option_a_image`, `option_b`, `option_b_image`, `option_c`, `option_c_image`, `option_d`, `option_d_image`, `correct_option`, `TYPE`, `subjective_answer`) VALUES
(937, 'editing_ps_level_2', 'What is the most non-destructive way to dodge and burn?', '', 'Use the Dodge and Burn tools directly on the Background layer', '', 'Create 50% gray layer in Overlay mode and paint with white/black', '', 'Use the Brush tool on a duplicate layer', '', 'Add Curves adjustment layers', '', 'b', 'mcq', ''),
(938, 'editing_ps_level_2', 'Which blending mode best enhances texture while minimizing colour changes?', '', 'Overlay', '', 'Luminosity', '', 'Difference', '', 'Hue', '', 'b', 'mcq', ''),
(939, 'editing_ps_level_2', 'In Camera Raw, what does the Dehaze slider primarily adjust?', '', 'Midtone contrast', '', 'White balance', '', 'Fog/mist in shadows and highlights', '', 'Sharpness', '', 'c', 'mcq', ''),
(940, 'editing_ps_level_2', 'You want to make a batch export of assets in different sizes and formats. What feature should you use?', '', 'Quick Export', '', 'Save As', '', 'Export > Export As', '', 'Generator / Image Assets', '', 'd', 'mcq', ''),
(941, 'editing_ps_level_2', 'Which method ensures a vector logo imported from Illustrator retains full scalability in Photoshop?', '', 'Paste as Pixels', '', 'Paste as Smart Object', '', 'Export as PNG', '', 'Copy and rasterize', '', 'b', 'mcq', ''),
(942, 'editing_ps_level_2', 'What’s the best approach to maintain colour consistency across print and digital designs?', '', 'Use the same RGB profile in both', '', 'Use CMYK for all outputs', '', 'Use proof colours and soft proofing profiles', '', 'Export as PNG', '', 'c', 'mcq', ''),
(943, 'editing_ps_level_2', 'Which method best removes chromatic aberration in RAW images?', '', 'Use Clone Stamp tool', '', 'Use Hue/Saturation Adjustment', '', 'Enable Lens Correction in Camera Raw', '', 'Apply Noise Reduction', '', 'c', 'mcq', ''),
(955, 'editing_ps_level_1', 'Which panel in Photoshop lets you non destructively adjust brightness/contrast, hue/saturation, and more?', '', 'Layers', '', 'Adjustments', '', 'History', '', 'Channels', '', 'b', 'mcq', ''),
(956, 'editing_ps_level_1', 'What does the \'Clone Stamp\' tool do?', '', 'Blurs pixels under the cursor', '', 'Paints with a sampled area of the image', '', 'Selects colour ranges', '', 'Creates vector shapes', '', 'b', 'mcq', ''),
(957, 'editing_ps_level_1', 'Which file format preserves layers and full editability?', '', 'JPEG', '', 'PNG', '', 'TIFF', '', 'PSD', '', 'd', 'mcq', ''),
(958, 'editing_ps_level_1', 'Which blending mode darkens only areas lighter than the blend colour?', '', 'Multiply', '', 'Screen', '', 'Colour Burn', '', 'Darken', '', 'a', 'mcq', ''),
(959, 'editing_ps_level_1', 'What shortcut toggles the visibility \'eyeball\' of the selected layer?', '', 'Alt + V', '', 'Ctrl + , (comma)', '', 'Alt + , (comma)', '', 'Ctrl + ; (semicolon)', '', 'c', 'mcq', ''),
(960, 'editing_ps_level_1', 'Which selection tool lets you draw free form shapes?', '', 'Rectangular Marquee', '', 'Lasso', '', 'Magic Wand', '', 'Quick Selection', '', 'b', 'mcq', ''),
(961, 'editing_ps_level_1', 'To apply a filter non destructively, you should convert your layer to a:', '', 'Background layer', '', 'Smart Object', '', 'Mask', '', 'Shape layer', '', 'b', 'mcq', ''),
(962, 'editing_ps_level_1', 'What does the Pen tool primarily create?', '', 'Gradient fills', '', 'Vector paths', '', 'Pixel brushes', '', '3D effects', '', 'b', 'mcq', ''),
(963, 'editing_ps_level_1', 'Which adjustment layer would you use to correct colour casts by balancing shadows, midtones, and highlights?', '', 'Levels', '', 'Brightness/Contrast', '', 'Curves', '', 'Exposure', '', 'c', 'mcq', ''),
(964, 'editing_ps_level_1', 'What is the purpose of a layer mask?', '', 'To lock a layer’s transparency', '', 'To hide or reveal portions of the layer non destructively', '', 'To merge two layers', '', 'To rasterize text', '', 'b', 'mcq', ''),
(965, 'editing_ps_level_1', 'What shortcut do you use to undo the last action (step backward) beyond the most recent History state?', '', 'Ctrl + Z', '', 'Ctrl + Alt + Z', '', 'Ctrl + Shift + Z', '', 'Ctrl + Y', '', 'b', 'mcq', ''),
(966, 'editing_ps_level_1', 'Which tool would you use to remove small blemishes and imperfections by sampling surrounding areas automatically?', '', 'Spot Healing Brush', '', 'Healing Brush', '', 'Patch Tool', '', 'Clone Stamp', '', 'a', 'mcq', ''),
(967, 'editing_ps_level_1', 'What does the “Feather” option do when making a selection?', '', 'Smooths jagged edges of the selection', '', 'Softens the edges by adding a transition boundary', '', 'Expands the selection outward', '', 'Creates a mask automatically', '', 'b', 'mcq', ''),
(968, 'editing_ps_level_1', 'Which menu path applies a Gaussian Blur filter?', '', 'Filter > Blur > Gaussian Blur', '', 'Image > Adjustments > Gaussian Blur', '', 'Filter > Noise > Gaussian Blur', '', 'Layer > Smart Filters > Gaussian Blur', '', 'a', 'mcq', ''),
(969, 'editing_ps_level_1', 'How can you constrain the Brush tool to a perfect circle?', '', 'Hold Shift while dragging', '', 'Hold Alt while dragging', '', 'Hold Ctrl while dragging', '', 'Hold Shift + Alt while dragging', '', 'a', 'mcq', ''),
(970, 'editing_ps_level_1', 'What is the purpose of the “Blend If” sliders in Layer Styles?', '', 'To blend two layers based on pixel luminosity or colour channels', '', 'To adjust opacity of the entire layer', '', 'To set blending modes for layer groups', '', 'To create gradient overlays', '', 'a', 'mcq', ''),
(971, 'editing_ps_level_1', 'Which keyboard shortcut selects the entire canvas?', '', 'Ctrl + A', '', 'Ctrl + T', '', 'Ctrl + D', '', 'Ctrl + E', '', 'a', 'mcq', ''),
(972, 'editing_ps_level_1', 'To change the focal length and perspective of an image, which feature would you use?', '', 'Lens Correction', '', 'Puppet Warp', '', 'Perspective Warp', '', 'Vanishing Point', '', 'c', 'mcq', ''),
(973, 'editing_ps_level_1', 'What happens when you press Ctrl + E with a layer selected?', '', 'Exports the layer as an image', '', 'Merges the selected layer with the layer below', '', 'Opens the Export As dialog', '', 'Erases the content of the layer', '', 'b', 'mcq', ''),
(974, 'editing_ps_level_1', 'Which adjustment layer provides the most control over individual colour channels using curves?', '', 'Colour Balance', '', 'Curves', '', 'Gradient Map', '', 'Hue/Saturation', '', 'b', 'mcq', ''),
(975, 'cpp level 1', 'what is the output?', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'subjective', NULL),
(976, 'python_level_1', 'what is the answer of this questions?', '', '1', '', '2', '', '3', '', '4', '', 'c', 'mcq', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `quiz_scores`
--

CREATE TABLE `quiz_scores` (
  `id` int(11) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `score` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `category` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `scores`
--

CREATE TABLE `scores` (
  `score_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `skill_category` varchar(255) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `test_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `search_history`
--

CREATE TABLE `search_history` (
  `id` int(11) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `keyword` varchar(255) NOT NULL,
  `searched_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `search_history`
--

INSERT INTO `search_history` (`id`, `user_id`, `keyword`, `searched_at`) VALUES
(1, 20, 'java', '2025-05-11 01:24:18'),
(2, 20, 'java', '2025-05-11 01:33:36'),
(3, 20, 'java', '2025-05-11 01:33:37'),
(4, 20, 'java', '2025-05-11 01:33:38'),
(5, 20, 'java', '2025-05-11 01:33:39'),
(6, 20, 'java', '2025-05-11 01:33:39'),
(7, 20, 'java', '2025-05-11 01:33:42'),
(8, 20, 'java', '2025-05-11 01:33:42'),
(9, 20, 'java', '2025-05-11 01:33:43'),
(10, 20, 'java', '2025-05-11 01:33:45'),
(11, 20, 'java', '2025-05-11 12:05:12'),
(12, 20, 'java', '2025-05-11 12:05:23'),
(13, 20, 'java', '2025-05-11 12:09:15'),
(14, 20, 'python', '2025-05-11 12:09:26'),
(15, 20, 'Design', '2025-05-11 12:09:41'),
(16, 20, 'Design', '2025-05-11 12:11:01'),
(17, 20, 'Design', '2025-05-11 12:11:02'),
(18, 20, 'java', '2025-05-11 12:11:11'),
(19, 20, 'java', '2025-05-11 12:36:43'),
(20, 20, 'java', '2025-05-11 12:36:44'),
(21, 20, 'java', '2025-05-11 12:36:45'),
(22, 20, 'java', '2025-05-11 14:32:39'),
(23, 20, 'java', '2025-05-11 14:32:39'),
(24, 20, 'java', '2025-05-11 14:32:39'),
(25, 16, 'python', '2025-05-11 20:51:16'),
(26, 16, 'j', '2025-05-11 20:51:25'),
(27, 16, 'java', '2025-05-11 20:51:26'),
(28, 16, 'java', '2025-05-11 20:51:26'),
(29, 16, 'c', '2025-05-11 20:51:33'),
(30, 16, 'c+', '2025-05-11 20:51:34'),
(31, 16, 'c++', '2025-05-11 20:51:34'),
(32, 16, 'c++', '2025-05-11 20:51:34'),
(33, 16, 'c+', '2025-05-11 20:51:37'),
(34, 16, 'c', '2025-05-11 20:51:38'),
(35, 16, 'd', '2025-05-11 20:51:45'),
(36, 16, 'desi', '2025-05-11 20:51:45'),
(37, 16, 'desig', '2025-05-11 20:51:46'),
(38, 16, 'design', '2025-05-11 20:51:46'),
(39, 16, 'design', '2025-05-11 20:51:46'),
(40, 16, 'lan', '2025-05-11 20:51:59'),
(41, 16, 'languag', '2025-05-11 20:52:00'),
(42, 16, 'language', '2025-05-11 20:52:00'),
(43, 16, 'language', '2025-05-11 20:52:00'),
(44, 16, 'edit', '2025-05-11 20:52:15'),
(45, 16, 'ps', '2025-05-11 20:52:26'),
(46, 16, 'edit', '2025-05-11 20:52:30'),
(47, 16, 'hi', '2025-05-19 16:09:13'),
(48, 21, 'language', '2025-05-20 13:15:57'),
(49, 21, 'language\\', '2025-05-20 13:16:11'),
(50, 21, 'language', '2025-05-20 13:16:11'),
(51, 21, 'l', '2025-05-20 13:16:12'),
(52, 21, 'java', '2025-05-20 13:16:13'),
(53, 21, 'java', '2025-05-20 13:16:13'),
(54, 21, 'jav', '2025-05-20 13:16:20'),
(55, 21, 'j', '2025-05-20 13:16:20'),
(56, 21, 'p', '2025-05-20 13:16:21'),
(57, 21, 'pt', '2025-05-20 13:16:22'),
(58, 21, 'p', '2025-05-20 13:16:22'),
(59, 21, 'py', '2025-05-20 13:16:23'),
(60, 21, 'pyth', '2025-05-20 13:16:23'),
(61, 21, 'python', '2025-05-20 13:16:24'),
(62, 21, 'python', '2025-05-20 13:16:25'),
(63, 21, 'python', '2025-05-20 15:23:19'),
(64, 16, 'java', '2025-05-22 15:04:12'),
(65, 16, 'hi', '2025-05-22 15:04:18'),
(66, 16, 'language', '2025-05-22 15:04:23'),
(67, 16, 'language', '2025-05-22 15:05:47'),
(68, 16, 'language', '2025-05-22 15:06:40'),
(69, 16, 'java', '2025-05-22 15:06:53'),
(70, 16, 'hi', '2025-05-22 15:06:57'),
(71, 16, 'java', '2025-05-22 15:07:21'),
(72, 16, 'hi', '2025-05-22 15:07:31');

-- --------------------------------------------------------

--
-- Table structure for table `skill_tests`
--

CREATE TABLE `skill_tests` (
  `id` int(11) NOT NULL,
  `test_name` varchar(255) NOT NULL,
  `LEVEL` int(11) NOT NULL,
  `time_limit` int(11) DEFAULT NULL,
  `num_questions` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subjective_submissions`
--

CREATE TABLE `subjective_submissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `skill_category` varchar(255) DEFAULT NULL,
  `question_text` text DEFAULT NULL,
  `user_answer` text DEFAULT NULL,
  `submitted_at` datetime DEFAULT current_timestamp(),
  `instructor_score` int(11) DEFAULT NULL,
  `instructor_comment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subjective_submissions`
--

INSERT INTO `subjective_submissions` (`id`, `user_id`, `skill_category`, `question_text`, `user_answer`, `submitted_at`, `instructor_score`, `instructor_comment`) VALUES
(1, NULL, 'python_level_1', NULL, '12345', '2025-05-10 02:13:31', 12, '12345'),
(2, 16, 'editing_ps_level_3', '1234 write the code', 'i think this is very nice', '2025-05-10 02:19:12', 100, 'nice!'),
(3, 16, 'editing_ps_level_3', '12345', 'i want you review', '2025-05-10 02:19:12', 20, 'no'),
(4, 16, 'editing_ps_level_3', '1234 write the code', 'i hope this database success', '2025-05-10 02:19:12', 100, 'can'),
(5, 16, 'editing_ps_level_2', 'this can success?', 'no', '2025-05-10 03:19:04', NULL, NULL),
(6, 16, 'editing_ps_level_2', 'this can success?', 'no', '2025-05-10 03:22:19', NULL, NULL),
(7, 16, 'editing_ps_level_2', 'this can success?', '123', '2025-05-10 03:28:09', NULL, NULL),
(8, 16, 'editing_ps_level_2', 'this can success?', '123', '2025-05-10 03:45:53', NULL, NULL),
(9, 16, 'editing_ps_level_3', '12345', '12345', '2025-05-10 03:46:15', NULL, NULL),
(10, 16, 'editing_ps_level_3', '1234 write the code', '1234', '2025-05-10 03:46:15', NULL, NULL),
(11, 16, 'editing_ps_level_3', '1234 write the code', '1234', '2025-05-10 03:46:15', NULL, NULL),
(12, 16, 'editing_ps_level_2', 'this can success?', '123', '2025-05-10 03:50:21', NULL, NULL),
(13, 16, 'editing_ps_level_3', 'this time can show or not', 'no', '2025-05-10 03:54:23', NULL, NULL),
(14, 16, 'editing_ps_level_3', 'this time can show or not', '123', '2025-05-10 03:54:41', NULL, NULL),
(15, 16, 'editing_ps_level_3', 'i dont want have bug again', '1234 nishi wode baby go', '2025-05-10 13:16:19', NULL, NULL),
(16, 16, 'design_level_3', 'Packaging: Redesign the packaging for a common household item, focusing on shelf appeal and clear labeling.', '123', '2025-05-10 18:07:08', NULL, NULL),
(17, 16, 'design_level_3', 'Logo & Branding: Rebrand a Local Café. Create a new logo, colour palette, and typography for a small neighbourhood coffee shop.', '123', '2025-05-10 18:07:08', NULL, NULL),
(18, 16, 'design_level_3', 'Experiential & Environmental: Design wayfinding signage for a university campus. Define iconography, hierarchy, and materials.', '123', '2025-05-10 18:07:08', NULL, NULL),
(19, 16, 'design_level_3', 'Motion & Animation: Animated Logo Concept. Create a 5-second animated reveal of a company’s logo, focusing on timing and brand personality.', '12', '2025-05-10 18:07:08', NULL, NULL),
(20, 16, 'design_level_3', 'Design an infographic that explains the basics of climate change to middle school students. Use visual hierarchy and simple language.', '1', '2025-05-10 18:07:08', NULL, NULL),
(21, 16, 'design_level_3', 'Illustration & Iconography: Create a cohesive set of 8–10 icons for a travel website, maintaining consistent style.', '1', '2025-05-10 18:07:08', NULL, NULL),
(22, 16, 'design_level_3', 'Print & Publication: Lay out a two-page magazine spread on \'The Future of Sustainable Fashion\'. Use hierarchy and columns.', '1', '2025-05-10 18:07:08', NULL, NULL),
(23, 16, 'design_level_3', 'Social Media Campaign Design: Create a 3-post Instagram carousel for a non-profit promoting mental health awareness. Be visually engaging.', '1', '2025-05-10 18:07:08', NULL, NULL),
(24, 16, 'design_level_3', 'Digital & Interface: Design the splash screen for a meditation app. Consider mood, color psychology, and readability.', '1', '2025-05-10 18:07:08', NULL, NULL),
(25, 16, 'design_level_3', 'Logo Design Challenge: Design a logo for a fictional eco-friendly tech startup called GreenByte. Reflect sustainability and technology.', '1', '2025-05-10 18:07:08', NULL, NULL),
(26, 16, 'cpp_level_3', 'Write a C++ program that implements a Simple Bank System.', '123', '2025-05-10 19:55:11', NULL, NULL),
(27, 16, 'cpp_level_3', 'Write a C++ program that reverses a given string.', '1234', '2025-05-10 19:55:11', NULL, NULL),
(28, 16, 'cpp_level_3', 'Write a C++ program that checks if a number is prime or not.', '12qwwe', '2025-05-10 19:55:11', NULL, NULL),
(29, 16, 'cpp_level_3', 'Write a C++ program that implements a Student Management System.', 'axsax', '2025-05-10 19:55:11', NULL, NULL),
(30, 16, 'cpp_level_3', 'Write a C++ program to implement a class Matrix that can perform matrix addition, subtraction, and multiplication.', 'xcrvdev', '2025-05-10 19:55:11', NULL, NULL),
(31, 16, 'cpp_level_3', 'Write a C++ program to implement a Dynamic Array class with various operations.', 'dsczx', '2025-05-10 19:55:11', NULL, NULL),
(32, 16, 'cpp_level_3', 'Write a C++ program that reads three numbers and prints their sum.', 'zca', '2025-05-10 19:55:11', NULL, NULL),
(33, 16, 'cpp_level_3', 'Write a C++ program that takes an integer as input and prints the square of that number.', 'asxwx', '2025-05-10 19:55:11', NULL, NULL),
(34, 16, 'sql_level_3', 'Write a SQL query to calculate the average grade per course, assuming grades are mapped as: A=4, B=3, C=2, D=1, F=0.', '123', '2025-05-10 20:19:51', NULL, NULL),
(35, 16, 'sql_level_3', 'You’re designing a small University Database with the following tables: Students, Courses, Enrollments. Create all 3 tables with appropriate constraints (primary keys and foreign keys).', '123', '2025-05-10 20:19:51', NULL, NULL),
(36, 16, 'sql_level_3', 'Using the Students table above, write a SQL query to: Select all students majoring in \'Computer Science\' and only include students who are older than 21.', '123', '2025-05-10 20:19:51', NULL, NULL),
(37, 16, 'sql_level_3', 'You have two tables: Customers and Orders. Write a SQL query to list each customer\'s name and their total order amount. If a customer hasn’t placed any orders, they should still be listed with total amount as NULL or 0.', '123', '2025-05-10 20:19:51', NULL, NULL),
(38, 16, 'sql_level_3', 'Using the Orders table above, write a query to find customers who have placed orders with an amount greater than the average order amount.', '1234', '2025-05-10 20:19:51', NULL, NULL),
(39, 16, 'sql_level_3', 'Create a table named Students with the following columns: student_id (INTEGER, Primary Key), name (VARCHAR(50)), age (INTEGER), major (VARCHAR(50)). After creating the table, insert the following data:', '124', '2025-05-10 20:19:51', NULL, NULL),
(40, 16, 'sql_level_3', 'You\'re working as a data analyst for an e-commerce company. Analyze customer orders, spending habits, and product performance. You\'ll be working with the following tables:', '124', '2025-05-10 20:19:51', NULL, NULL),
(41, 20, 'language_chinese_level_3', '阅读以下短文，概括文章的主要内容：……', '12345', '2025-05-11 00:11:43', 100, 'bi'),
(42, 20, 'language_chinese_level_3', '根据给定主题“环境保护”，写一篇议论文，不少于400字。', '12345', '2025-05-11 00:11:43', 50, 'qwer'),
(43, 20, 'language_chinese_level_3', '谈谈你对“现代科技带来的便利和隐患”的看法。', '12345', '2025-05-11 00:11:43', NULL, NULL),
(44, 20, 'language_chinese_level_3', '根据以下图片内容，撰写一段300字的描写文章。', '123', '2025-05-11 00:11:43', NULL, NULL),
(45, 20, 'language_chinese_level_3', '假如你是一名老师，请撰写一封家长信，说明学生在学习上的表现和建议。', '123', '2025-05-11 00:11:43', NULL, NULL),
(46, 20, 'language_chinese_level_3', '请分析“网络暴力”对青少年的影响，并提出应对措施。', '1qas', '2025-05-11 00:11:43', NULL, NULL),
(47, 20, 'language_chinese_level_3', '请结合实例，谈谈如何培养良好的学习习惯。', 'asdf', '2025-05-11 00:11:43', NULL, NULL),
(48, 20, 'language_chinese_level_3', '请用不少于300字描述你的家乡风景。', 'assdf', '2025-05-11 00:11:43', NULL, NULL),
(49, 20, 'language_chinese_level_3', '阅读以下人物传记，谈谈你对主人公的评价。', 'asdf', '2025-05-11 00:11:43', NULL, NULL),
(50, 20, 'language_chinese_level_3', '结合实际，论述“传统文化在当代社会中的传承与发展”。', 'assdff', '2025-05-11 00:11:43', NULL, NULL),
(51, 20, 'language_chinese_level_3', '描述一次让你印象深刻的旅行经历，不少于350字。', 'assdff', '2025-05-11 00:11:43', NULL, NULL),
(52, 21, 'python_level_3', 'Develop a Python program to find the longest common prefix from a list of strings.', '1234', '2025-05-20 13:17:31', NULL, NULL),
(53, 21, 'python_level_3', 'Write a Python function to calculate the factorial of a given number using recursion.', '1234', '2025-05-20 13:17:31', NULL, NULL),
(54, 21, 'python_level_3', 'Write a Python function to merge two dictionaries.', '1234', '2025-05-20 13:17:31', NULL, NULL),
(55, 21, 'python_level_3', 'Create a Python script to read a CSV file and print each row in the file.', '1234', '2025-05-20 13:17:31', NULL, NULL),
(56, 21, 'python_level_3', 'Write a Python function that takes a list of integers and returns the sum of all even numbers in the list.', '1234', '2025-05-20 13:17:31', NULL, NULL),
(57, 21, 'python_level_3', 'Write a Python program to reverse a string without using built-in functions.', '1234', '2025-05-20 13:17:31', NULL, NULL),
(58, 21, 'python_level_3', 'Create a Python script to read a text file and count the number of words.', '1234', '2025-05-20 13:17:31', NULL, NULL),
(59, 21, 'python_level_3', 'Write a Python program to find the maximum value in a list without using the built-in max() function.', '1234', '2025-05-20 13:17:31', NULL, NULL),
(60, 16, 'python_level_3', 'Create a Python script to read a CSV file and print each row in the file.', '123', '2025-05-21 21:07:44', 80, 'this answer is correct'),
(61, 16, 'python_level_3', 'Write a Python function that takes a list of integers and returns the sum of all even numbers in the list.', '1234', '2025-05-21 21:07:44', 50, 'This answer abit wrong'),
(62, 16, 'python_level_3', 'Write a Python function to calculate the factorial of a given number using recursion.', '1234', '2025-05-21 21:07:44', NULL, NULL),
(63, 16, 'python_level_3', 'Develop a Python program to find the longest common prefix from a list of strings.', '1234', '2025-05-21 21:07:44', NULL, NULL),
(64, 16, 'python_level_3', 'Write a Python function to merge two dictionaries.', 'qwer', '2025-05-21 21:07:44', NULL, NULL),
(65, 16, 'python_level_3', 'Create a Python script to read a text file and count the number of words.', '12qwead', '2025-05-21 21:07:44', NULL, NULL),
(66, 16, 'python_level_3', 'Write a Python program to find the maximum value in a list without using the built-in max() function.', 'asdf', '2025-05-21 21:07:44', NULL, NULL),
(67, 16, 'python_level_3', 'Write a Python program to reverse a string without using built-in functions.', 'asdf', '2025-05-21 21:07:44', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `PASSWORD` varchar(255) NOT NULL,
  `profile_picture` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `race` varchar(50) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `role` enum('admin','user') NOT NULL DEFAULT 'user',
  `created_at` datetime DEFAULT current_timestamp(),
  `last_login_at` datetime DEFAULT NULL,
  `admin_note` text DEFAULT NULL,
  `STATUS` enum('active','inactive') NOT NULL DEFAULT 'active',
  `reset_token` varchar(255) DEFAULT NULL,
  `reset_token_expires` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `PASSWORD`, `profile_picture`, `phone`, `country`, `state`, `city`, `race`, `avatar`, `role`, `created_at`, `last_login_at`, `admin_note`, `STATUS`, `reset_token`, `reset_token_expires`) VALUES
(14, 'Peigi Chai Pei Yin', 'fis23060012@student.uts.edu.my', '$2y$10$IOyUoVPJM9R1dyZmxTuSoefBmNOTHVYBizaoldV1CsC11/qKB3qR6', NULL, '', 'Malaysia', 'Johor', '', '', NULL, 'user', '2025-05-07 19:34:31', NULL, NULL, 'active', NULL, NULL),
(15, 'peigiii', 'bcs24090055@student.uts.edu.my', '$2y$10$pqIdB9LYo3DRcAT.zq/.6umWdxjkNNIdKmihy.XHFhjO6FYWO7hS6', NULL, '', 'Malaysia', 'Sabah', '', '', NULL, 'admin', '2025-05-07 19:34:31', NULL, NULL, 'active', 'e314b523848bf263238a2a3ad16b54e8ad59a047f911a0347288bc9bc92e58f0', '2025-05-07 17:58:19'),
(16, 'peiyin', 'peiyin5917@gmail.com', '$2y$10$siIAOsE1cjf/WMeF.Lu32uwPfbrq3pxFRQ4XiUGCjkjbe/XerzuKy', NULL, '', 'Malaysia', 'Johor', '', '', NULL, 'user', '2025-05-07 19:34:31', NULL, NULL, 'active', '0efd0eae0960d733935a7bcc2b32dfb98259baeeca3b93fafdc05d71f55877cb', '2025-05-07 15:22:53'),
(18, '1', 'yinc13445@gmail.com', '$2y$10$F./elXx2WCCrrIYs4OVT8OxKTeO1EKoGz0pwtBjBWZ1F5gTnJclrm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'user', '2025-05-07 20:47:50', NULL, NULL, 'active', NULL, NULL),
(19, '1', 'chaiszehong@gmail.com', '$2y$10$EZ4IO5JOLkOUm/AfuX2f8uNB7.UOQ4cNFqYw.VtcVpPqlJ8cc7t3O', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'user', '2025-05-07 22:03:55', NULL, 'abaaba', 'active', NULL, NULL),
(20, 'Jestina', 'fia23110109@student.uts.edu.my', '$2y$10$onUhWtl8wsCMlgcWNSn2VufFuW.uaQ5jTFRDEThNmI0wnel8l/9iW', NULL, '012345678', 'Malaysia', 'Sarawak', 'miri', 'Chinese', NULL, 'user', '2025-05-10 23:52:06', NULL, NULL, 'active', NULL, NULL),
(21, 'yinc', 'chaipyp17@gmail.com', '$2y$10$s2F8Ts./xK4QGRh8CweRgOwqeKOLT6S.tuELn8RulrtVi.njZt3fi', NULL, '01116811917', 'Malaysia', 'Sarawak', 'Kuching', 'Chinese', 'uploads/1747718317_20fc1c00d299c25c5e82786f3f5be71d.jpg', 'user', '2025-05-20 12:43:38', NULL, 'this user is nice', 'active', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE `videos` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `file_path` varchar(255) NOT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `upload_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `uploaded_at` datetime DEFAULT current_timestamp(),
  `like_count` int(11) DEFAULT 0,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `video_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `videos`
--

INSERT INTO `videos` (`id`, `title`, `description`, `category`, `file_path`, `thumbnail`, `upload_time`, `uploaded_at`, `like_count`, `user_id`, `created_at`, `video_url`) VALUES
(35, 'Learn Python in Less than 10 Minutes for Beginners (Fast & Easy)', 'In this crash course I\'ll be teaching you the basics of Python in less than 10 minutes. Python is super easy to learn compared to the other languages!\r\n\r\nContent:\r\n0:00 Intro\r\n0:25 Variables\r\n1:30 Data Types\r\n3:50 Logic Statements\r\n4:50 For Loop\r\n5:50 While Loop\r\n7:00 Functions\r\n8:00 Pass\r\n9:00 Try Accept\r\n\r\nAuthor: Indently\r\nhttps://youtu.be/fWjsdhR3z3c\r\n', 'Python', 'uploads/Learn Python in Less than 10 Minutes for Beginners (Fast & Easy).mp4', NULL, '2025-05-11 07:48:16', '2025-05-11 15:48:16', 0, 0, '2025-05-11 07:48:16', NULL),
(36, 'Python Full Course', '\r\n\r\nPython tutorial for beginners\' full course 2024 \r\n\r\n[⭐ = project] \r\n#1 (00:00:00) python tutorial for beginners 🐍 #2 (00:05:49) variables ❎ #3 (00:16:05) type casting 💱 #4 (00:21:15) user input ⌨️ #5 (00:32:42) ⭐ madlibs game 📖 #6 (00:37:55) arithmetic & math 📐 #7 (00:51:46) if statements 🤔 #8 (01:00:06) ⭐ calculator program 🧮 #9 (01:05:59) ⭐ weight conversion program 🏋️ #10 (01:09:59) ⭐ temperature conversion program 🌡️ #11 (01:13:58) logical operators 🌦️ #12 (01:21:28) conditional expressions ❓ #13 (01:27:03) string methods 〰️ #14 (01:39:08) string indexing ✂️ #15 (01:46:35) format specifiers 💬 #16 (01:51:55) while loops ♾️ #17 (01:58:53) ⭐ compound interest calculator 💵 #18 (02:06:28) for loops 🔁 #19 (02:11:33) ⭐ countdown timer program ⌛ #20 (02:17:28) nested loops ➿ #21 (02:23:03) lists, sets, and tuples 🍎 #22 (02:38:08) ⭐ shopping cart program 🛒 #23 (02:45:21) 2D collections ⬜ #24 (02:53:59) ⭐ quiz game 💯 #25 (03:03:27) dictionaries 📙 #26 (03:11:33) ⭐ concession stand program 🍿 #27 (03:19:42) random numbers 🎲 #28 (03:24:16) ⭐ number guessing game 🔢 #29 (03:32:37) ⭐ rock, paper, scissors game 🗿 #30 (03:42:06) ⭐ dice roller program ⚂ #31 (03:52:12) functions 📞 #32 (04:02:50) default arguments 👍 #33 (04:08:56) keyword arguments 🗝️ #34 (04:15:40) *args & **kwargs 📦 #35 (04:30:33) iterables 🔂 #36 (04:37:04) membership operators 🔎 #37 (04:45:56) list comprehensions 📃 #38 (04:56:17) match-case statements 📆 #39 (05:02:13) modules 📨 #40 (05:08:51) scope resolution 🔬 #41 (05:14:22) if name == \'main\': 📥 #42 (05:23:34) ⭐ banking program 💰 #43 (05:38:34) ⭐ slot machine 🎰 #44 (05:58:45) ⭐ encryption program 🔐 #45 (06:07:26) ⭐ hangman game 🕺 #46 (06:32:32) python object oriented programming 🚗 #47 (06:44:50) class variables 🎓 #48 (06:53:06) inheritance 👨‍👦‍👦 #49 (07:00:02) multiple inheritance 🐟 #50 (07:08:04) super() 🔴 #51 (07:21:10) polymorphism 🎭 #52 (07:29:15) duck typing 🦆 #53 (07:33:34) static methods ⚡ #54 (07:39:31) class methods 🏫 #55 (07:46:16) magic methods 🌟 #56 (07:59:51) @property ⚙️ #57 (08:07:33) decorators 🎊 #58 (08:14:57) exception handling 🚦 #59 (08:20:46) file detection 🕵️‍♂️ #60 (08:27:47) writing files ✍ #61 (08:41:33) reading files 🔍 #62 (08:48:29) dates & times 📅 #63 (08:54:46) ⭐ alarm clock ⏰ #64 (09:05:03) multithreading 🧵 #65 (09:13:45) request API data ↩️ #66 (09:22:19) PyQt5 GUI intro 🖥️ #67 (09:31:27) PyQt5 labels 🏷️ #68 (09:40:23) PyQt5 images 📷 #69 (09:46:28) PyQt5 layout managers 🧲 #70 (09:53:07) PyQt5 buttons 🛎️ #71 (10:00:12) PyQt5 checkboxes ✅ #72 (10:06:42) PyQt5 radio buttons 🔘 #73 (10:15:55) PyQt5 line edits 💬 #74 (10:21:55) PyQt5 CSS styles 🎨 #75 (10:32:48) ⭐ digital clock program 🕒 #76 (10:48:38) ⭐ stopwatch program ⏱ #77 (11:06:05) ⭐ weather API app ☀️\r\n\r\nhttps://youtu.be/ix9cRaBkVe0\r\nAuthor：Bro Code', 'Python', 'uploads/Python Full Course.mp4', NULL, '2025-05-11 10:28:43', '2025-05-11 18:28:43', 0, 0, '2025-05-11 10:28:43', NULL),
(37, 'Python for Beginners – Full Course [Programming Tutorial]', 'Learn the Python programming language in this full course for beginners! You will learn the fundamentals of Python and code two Python programs line-by-line. No previous programming experience is necessary before watching this course. \r\n\r\n⭐️ Course Contents ⭐️ \r\n⌨️ (0:00:00) Introduction Rock, Paper, Scissors Intro Project \r\n⌨️ (0:03:11) RPS - Variables and Functions \r\n⌨️ (0:09:07) RPS - Calling Functions \r\n⌨️ (0:12:31) RPS - Dictionaries \r\n⌨️ (0:15:28) RPS - User Input \r\n⌨️ (0:16:55) RPS - Libraries, Lists, Methods \r\n⌨️ (0:20:45) RPS - Function Arguments \r\n⌨️ (0:22:33) RPS - If Statements \r\n⌨️ (0:25:40) RPS - Concatenating Strings \r\n⌨️ (0:27:13) RPS - f-strings \r\n⌨️ (0:30:26) RPS - Else and Elif Statements \r\n⌨️ (0:33:37) RPS - Refactoring and Nested If \r\n⌨️ (0:38:37) RPS - Accessing Dictionary Values \r\n⌨️ (0:41:55) RPS - Testing Game \r\n\r\nFundamentals of Python \r\n⌨️ (0:43:52) Setup Python Locally \r\n⌨️ (0:47:47) Creating New Repl \r\n⌨️ (0:48:45) Variables \r\n⌨️ (0:51:21) Expressions and Statements \r\n⌨️ (0:52:38) Comments \r\n⌨️ (0:54:23) Data Types \r\n⌨️ (1:00:16) Operators \r\n⌨️ (1:00:44) Arithmetic Operators \r\n⌨️ (1:03:52) Comparison Operators \r\n⌨️ (1:05:13) Boolean Operators \r\n⌨️ (1:07:26) Bitwise Operators \r\n⌨️ (1:07:42) is & in Operators \r\n⌨️ (1:08:21) Ternary Operator \r\n⌨️ (1:09:40) Strings \r\n⌨️ (1:12:36) String Methods \r\n⌨️ (1:16:41) Escaping Characters \r\n⌨️ (1:19:23) String Characters & Slicing \r\n⌨️ (1:21:45) Booleans \r\n⌨️ (1:26:07) Number Data Types \r\n⌨️ (1:28:19) Built-in Functions \r\n⌨️ (1:29:50) Enums \r\n⌨️ (1:32:51) User Input \r\n⌨️ (1:34:39) Control Statements \r\n⌨️ (1:36:48) Lists \r\n⌨️ (1:46:21) Sorting Lists \r\n⌨️ (1:49:57) Tuples \r\n⌨️ (1:53:49) Dictionaries \r\n⌨️ (2:01:45) Sets \r\n⌨️ (2:06:10) Functions \r\n⌨️ (2:16:57) Variable Scope \r\n⌨️ (2:18:35) Nested Functions \r\n⌨️ (2:21:37) Closures \r\n⌨️ (2:22:59) Objects \r\n⌨️ (2:26:27) Loops \r\n⌨️ (2:32:01) Break and Continue \r\n⌨️ (2:33:02) Classes \r\n⌨️ (2:39:12) Modules \r\n⌨️ (2:45:55) Arguments from Command Line \r\n⌨️ (2:52:42) Lambda Functions \r\n⌨️ (2:54:51) Map, Filter, Reduce \r\n⌨️ (3:02:41) Recursion \r\n⌨️ (3:04:42) Decorators \r\n⌨️ (3:06:45) Docstrings \r\n⌨️ (3:09:54) Annotations \r\n⌨️ (3:11:30) Exceptions \r\n⌨️ (3:17:09) With \r\n⌨️ (3:18:26) Installing Packages with pip \r\n⌨️ (3:21:39) List Compression \r\n⌨️ (3:23:09) Polymorphism \r\n⌨️ (3:24:23) Operator Overloading \r\n\r\nBlackjack Card Game Project \r\n⌨️ (3:26:58) Blackjack - Beginning \r\n⌨️ (3:50:13) Blackjack - Deck Class \r\n⌨️ (3:58:45) Blackjack - Card Class \r\n⌨️ (4:03:25) Blackjack - Hand Class \r\n⌨️ (4:21:13) Blackjack - Game Class \r\n⌨️ (4:37:04) Blackjack - Testing \r\n⌨️ (4:39:36) Conclusion\r\n\r\nhttps://youtu.be/eWRfhZUzrAc\r\nAuthor: freeCodeCamp.org ', 'Python', 'uploads/Python for Beginners – Full Course [Programming Tutorial].mp4', NULL, '2025-05-11 10:30:27', '2025-05-11 18:30:27', 0, 0, '2025-05-11 10:30:27', NULL),
(38, 'Python for Beginners - Learn Coding with Python in 1 Hour', 'Learn Python basics in just 1 hour! Perfect for beginners interested in AI and coding.\r\n\r\n📖 TABLE OF CONTENT \r\n0:00:00 Introduction \r\n0:00:30 What You Can Do with Python \r\n0:01:15 Your First Python Program \r\n0:05:30 Variables \r\n0:09:08 Receiving Input \r\n0:10:48 Type Conversion \r\n0:18:49 Strings \r\n0:23:41 Arithmetic Operators \r\n0:25:59 Operator Precedence \r\n0:27:11 Comparison Operators \r\n0:28:52 Logical Operators \r\n0:31:06 If Statements \r\n0:36:16 Exercise \r\n0:41:42 While Loops \r\n0:45:11 Lists \r\n0:48:47 List Methods \r\n0:52:16 For Loops \r\n0:54:54 The range() Function \r\n0:57:43 Tuples\r\n\r\nhttps://youtu.be/kqtD5dpn9C8\r\nAuthor:Programming with Mosh\r\n', 'Python', 'uploads/Python for Beginners - Learn Coding with Python in 1 Hour.mp4', NULL, '2025-05-11 10:31:59', '2025-05-11 18:31:59', 0, 0, '2025-05-11 10:31:59', NULL),
(39, 'Python Full Course for Beginners', 'Learn Python for AI, machine learning, and web development with this beginner-friendly course! 🚀\r\n\r\n📖 TABLE OF CONTENT \r\n00:00:00 Introduction \r\n00:01:49 Installing Python 3 \r\n00:06:10 Your First Python Program \r\n00:08:11 How Python Code Gets Executed \r\n00:11:24 How Long It Takes To Learn Python \r\n00:13:03 Variables \r\n00:18:21 Receiving Input \r\n00:22:16 Python Cheat Sheet \r\n00:22:46 Type Conversion\r\n00:29:31 Strings \r\n00:37:36 Formatted Strings \r\n00:40:50 String Methods \r\n00:48:33 Arithmetic Operations \r\n00:51:33 Operator Precedence \r\n00:55:04 Math Functions \r\n00:58:17 If Statements \r\n01:06:32 Logical Operators \r\n01:11:25 Comparison Operators \r\n01:16:17 Weight Converter Program \r\n01:20:43 While Loops \r\n01:24:07 Building a Guessing Game\r\n01:30:51 Building the Car Game \r\n01:41:48 For Loops \r\n01:47:46 Nested Loops \r\n01:55:50 Lists \r\n02:01:45 2D Lists \r\n02:05:11 My Complete Python Course \r\n02:06:00 List Methods \r\n02:13:25 Tuples \r\n02:15:34 Unpacking \r\n02:18:21 Dictionaries \r\n02:26:21 Emoji Converter \r\n02:30:31 Functions \r\n02:35:21 Parameters \r\n02:39:24 Keyword Arguments \r\n02:44:45 Return Statement \r\n02:48:55 Creating a Reusable Function \r\n02:53:42 Exceptions \r\n02:59:14 Comments \r\n03:01:46 Classes \r\n03:07:46 Constructors \r\n03:14:41 Inheritance \r\n03:19:33 Modules \r\n03:30:12 Packages \r\n03:36:22 Generating Random Values \r\n03:44:37 Working with Directories \r\n03:50:47 Pypi and Pip \r\n03:55:34 Project 1: Automation with Python \r\n04:10:22 Project 2: Machine Learning with Python \r\n04:58:37 Project 3: Building a Website with Django\r\n\r\nhttps://youtu.be/_uQrJ0TkZlc\r\nAuthor:Programming with Mosh', 'Python', 'uploads/Python Full Course for Beginners.mp4', NULL, '2025-05-11 10:33:46', '2025-05-11 18:33:46', 0, 0, '2025-05-11 10:33:46', NULL),
(40, 'Python Full Course for Beginners [2025]', 'Master Python from scratch 🚀 No fluff—just clear, practical coding skills to kickstart your journey! \r\n\r\n📖 Table of Content \r\n0:00:00 Introduction \r\n0:00:56 What is Python? \r\n0:04:11 Installing Python \r\n0:05:36 Python Interpreter \r\n0:07:30 Code Editors \r\n0:08:49 Your First Python Program \r\n0:12:25 Python Extension \r\n0:14:26 Linting Python Code \r\n0:18:40 Formatting Python Code \r\n0:22:51 Running Python Code \r\n0:24:30 Python Implementations \r\n0:26:59 How Python Code is Executed \r\n0:29:45 Quiz \r\n0:31:17 Python Mastery Course \r\n0:31:44 Variables \r\n0:34:48 Variable Names \r\n0:37:51 Strings \r\n0:43:20 Escape Sequences \r\n0:46:01 Formatted Strings \r\n0:48:09 String Methods \r\n0:54:03 Numbers \r\n0:56:50 Working with Numbers \r\n0:58:59 Type Conversion \r\n1:04:03 Quiz \r\n1:06:43 Comparison Operators \r\n1:08:46 Conditional Statements \r\n1:12:56 Ternary Operator \r\n1:15:04 Logical Operators \r\n1:19:07 Short-circuit Evaluations \r\n1:21:13 Chaining Comparison Operators \r\n1:22:35 Quiz \r\n1:24:18 For Loops \r\n1:27:56 For..Else \r\n1:30:42 Nested Loops \r\n1:33:26 Iterables \r\n1:36:34 While Loops \r\n1:41:33 Infinite Loops \r\n1:43:10 Exercise \r\n1:45:13 Defining Functions \r\n1:47:37 Arguments \r\n1:49:57 Types of Functions \r\n1:53:59 Keyword Arguments \r\n1:55:59 Default Arguments \r\n1:57:34 xargs\r\n\r\nhttps://youtu.be/K5KVEU3aaeQ\r\nProgramming with Mosh', 'Python', 'uploads/Python Full Course for Beginners [2025].mp4', NULL, '2025-05-11 10:34:45', '2025-05-11 18:34:45', 0, 0, '2025-05-11 10:34:45', NULL),
(41, 'Python Projects for Beginners – Master Problem-Solving! 🚀', 'Improve your Python programming skills with these handpicked Python projects. \r\n\r\n📖 Course Content \r\n00:00 – Welcome \r\n00:54 – Prerequisites \r\n01:49 – Course Materials \r\n02:34 – How to Take This Course \r\n04:14 – Dice Rolling Game \r\n10:31 – Number Guessing Game \r\n18:14 – Rock, Paper, Scissors Game \r\n33:35 – Refactoring: Modularizing Code \r\n40:14 – Refactoring: Applying the DRY Principle \r\n45:28 – QR Code Generator\r\n\r\nhttps://youtu.be/yVl_G-F7m8c\r\nProgramming with Mosh\r\n', 'Python', 'uploads/Python Projects for Beginners – Master Problem-Solving! 🚀.mp4', NULL, '2025-05-11 10:35:45', '2025-05-11 18:35:45', 0, 0, '2025-05-11 10:35:45', NULL),
(42, 'Java Full Course for free ☕ (2025)', 'Java tutorial for beginners’ full course 2025 \r\n\r\n#1 00:00:00 introduction to java \r\n☕ #2 00:10:58 variables ❎ \r\n#3 00:31:30 user input ⌨️ \r\n#4 00:47:25 ⭐ mad libs game 📕\r\n#5 00:54:08 arithmetic 🧮 \r\n#6 01:02:29 ⭐ shopping cart program 🛒\r\n#7 01:09:00 if statements 🤔 \r\n#8 01:22:28 random numbers 🔀 \r\n#9 01:27:28 math class 📐 \r\n#10 01:42:37 printf 🖨️ \r\n#11 01:56:14 ⭐ compound interest calculator 💸 \r\n#12 02:03:47 nested if statements 🎟️\r\n#13 02:10:20 string methods 🧵 \r\n#14 02:18:55 substrings 📧\r\n#15 02:27:00 ⭐ weight converter 🏋️ \r\n#16 02:35:19 ternary operator ❔ \r\n#17 02:41:10 ⭐ temperature converter 🌡️ \r\n#18 02:49:05 enhanced switches 💡 \r\n#19 02:57:42 ⭐ calculator program 🖩 \r\n#20 03:09:58 logical operators ❕ \r\n#21 03:21:23 while loops ♾️ \r\n#22 03:33:47 ⭐ number guessing game 🔢 \r\n#23 03:43:33 for loops 🔂 \r\n#24 03:53:33 break & continue 🚦 \r\n#25 03:55:45 nested loops ➿ \r\n#26 04:04:27 methods 📞 \r\n#27 04:19:51 overloaded methods 🍕 \r\n#28 04:25:59 variable scope 🏠 \r\n#29 04:30:57 ⭐ banking program 💰 \r\n#30 04:51:26 ⭐ dice roller program 🎲 \r\n#31 05:03:26 arrays 🍎 \r\n#32 05:12:35 enter user input into an array ➡️ \r\n#33 05:20:38 search an array 🔎 \r\n#34 05:28:07 varargs 💬 \r\n#35 05:34:36 2d arrays ⬜ \r\n#36 05:44:13 ⭐ quiz game 💯 \r\n#37 05:59:14 ⭐ rock paper scissors 🗿 \r\n#38 06:15:02 ⭐ slot machine 🎰 \r\n#39 06:41:47 object-oriented programming 🧱 \r\n#40 06:51:38 constructors 🔨 \r\n#41 07:01:45 overloaded constructors 🛠️ \r\n#42 07:08:22 array of objects 🗃️ \r\n#43 07:14:07 static 🤝 \r\n#44 07:22:04 inheritance 👨‍👧‍👦 \r\n#45 07:31:09 super 🔝 \r\n#46 07:41:37 method overriding ♻️ \r\n#47 07:46:08 tostring method 🎉 \r\n#48 07:51:58 abstraction 🌫️ \r\n#49 08:01:30 interfaces 📋 \r\n#50 08:07:44 polymorphism 🎭 \r\n#51 08:14:27 runtime polymorphism 🤷‍♂️ \r\n#52 08:19:35 getters and setters 🔐 \r\n#53 08:29:39 aggregation 🏫 \r\n#54 08:39:02 composition ⚙️ \r\n#55 08:45:17 wrapper classes 🎁 \r\n#56 08:55:51 arraylists 📃 \r\n#57 09:05:29 exception handling ⚠️ \r\n#58 09:13:28 write files ✍ \r\n#59 09:21:58 read files 📖 \r\n#60 09:28:50 ⭐ music player 🎼 \r\n#61 09:43:10 ⭐ hangman game 🕺 \r\n#62 10:11:42 dates & times 📆 \r\n#63 10:20:24 anonymous classes 🕵️‍♂️ \r\n#64 10:25:23 timertasks ⏲️ \r\n#65 10:31:45 ⭐ countdown timer ⏳ \r\n#66 10:38:16 generics 📦 \r\n#67 10:52:09 hashmaps 🗺️ \r\n#68 11:02:38 enums 📅 \r\n#69 11:12:45 threading 🧵 \r\n#70 11:23:04 multithreading 🧶 \r\n#71 11:31:02 ⭐ alarm clock ⏰\r\n\r\nhttps://youtu.be/xTtL8E4LzTQ\r\nBro Code\r\n', 'Java', 'uploads/Java Full Course for free ☕.mp4', NULL, '2025-05-11 10:37:44', '2025-05-11 18:37:44', 0, 0, '2025-05-11 10:37:44', NULL),
(43, 'Java Full Course', 'Java tutorial for beginners’ full course \r\n\r\n⭐️Time Stamps⭐️ \r\n#1 (00:00:00) Java tutorial for beginners ☕ \r\n#2 (00:20:26) variables ❌ \r\n#3 (00:32:58) swap two variables 💱 \r\n#4 (00:36:42) user input ⌨️ \r\n#5 (00:44:40) expressions 🧮 \r\n#6 (00:49:13) GUI intro 🚩 \r\n#7 (00:55:01) Math class 📐 \r\n#8 (01:01:08) random numbers 🎲 \r\n#9 (01:05:39) if statements 🚧 \r\n#10 (01:11:51) switches ⬇\r\n#11 (01:16:36) logical operators ❗ \r\n#12 (01:24:33) while loop 🔄 \r\n#13 (01:28:13) for loop ➰ \r\n#14 (01:32:23) nested loops ➿ \r\n#15 (01:38:28) arrays 🚗 \r\n#16 (01:44:54) 2D arrays 🚚 \r\n#17 (01:52:59) String methods 💬 \r\n#18 (01:59:18) wrapper classes 🎁 \r\n#19 (02:06:30) ArrayList 🧾 \r\n#20 (02:11:02) 2D ArrayList 📜 \r\n#21 (02:17:35) for-each loop 🔃 \r\n#22 (02:21:20) methods 📞 \r\n#23 (02:32:24) overloaded methods ☎️ \r\n#24 (02:38:03) printf 🖨️ \r\n#25 (02:49:25) final keyword ⛔ \r\n#26 (02:51:24) objects (OOP) ☕ \r\n#27 (03:01:36) constructors 👷 \r\n#28 (03:11:36) variable scope 🌍 \r\n#29 (03:16:39) overloaded constructors 🍕 \r\n#30 (03:24:04) toString method 🎉 \r\n#31 (03:30:08) array of objects 🍱 \r\n#32 (03:35:48) object passing 🏬 \r\n#33 (03:40:27) static keyword ⚡ \r\n#34 (03:48:10) inheritance 👪 \r\n#35 (03:53:45) method overriding 🙅‍♂️ \r\n#36 (03:57:33) super keyword 🦸‍♂️ \r\n#37 (04:05:06) abstraction 👻 \r\n#38 (04:10:01) access modifiers 🔒 \r\n#39 (04:19:39) encapsulation 💊 \r\n#40 (04:27:30) copy objects 🖨️ \r\n#41 (04:34:03) interface 🦅 \r\n#42 (04:41:19) polymorphism 🏁 \r\n#43 (04:46:55) dynamic polymorphism ✨ \r\n#44 (04:55:13) exception handling ⚠️ \r\n#45 (05:02:31) File class 📁 \r\n#46 (05:09:15) FileWriter (write to a file) 📝 \r\n#47 (05:12:30) FileReader (read a file) 📖 \r\n#48 (05:17:04) audio 🔊 \r\n#49 (05:27:34) GUI 🖼️ \r\n#50 (05:39:41) labels 👨‍💻 \r\n#51 (05:57:01) panels 🟥 \r\n#52 (06:09:57) buttons 🛎️ \r\n#53 (06:23:50) BorderLayout 🧭 \r\n#54 (06:34:53) FlowLayout 🌊 \r\n#55 (06:42:21) GridLayout 🔳 \r\n#56 (06:47:12) LayeredPane 📚 \r\n#57 (06:55:20) open a new GUI window 🗔 \r\n#58 (07:05:39) JOptionPane 🛑\r\n#59 (07:17:30) textfield 📛 \r\n#60 (07:27:01) checkbox ✔️ \r\n#61 (07:35:23) radio buttons 🔘 \r\n#62 (07:45:42) combobox 📑 \r\n#63 (07:55:37) slider 🌡️ \r\n#64 (08:08:08) progress bar 📊 \r\n#65 (08:18:46) menubar 🗄️ \r\n#66 (08:33:27) select a file 🔎 \r\n#67 (08:42:25) color chooser 🎨 \r\n#68 (08:48:45) KeyListener 🚀 \r\n#69 (09:01:21) MouseListener 🖱️ \r\n#70 (09:12:32) drag and drop 👈 \r\n#71 (09:26:48) key bindings ⌨️ \r\n#72 (09:38:57) 2D graphics 🖍️ \r\n#73 (09:58:33) 2D animation 👾 \r\n#74 (10:15:14) generics ❓ \r\n#75 (10:36:43) serialization 🥣 \r\n#76 (10:57:21) TimerTask ⌚ \r\n#77 (11:08:36) threads 🧵 \r\n#78 (11:24:01) multithreading 🧶 \r\n#79 (11:38:44) packages 📦 \r\n#80 (11:42:49) compile/run command prompt 💽 \r\n#81 (11:50:51) executable (.jar) ☕\r\n\r\nhttps://youtu.be/xk4_1vDrzzo\r\nBro Code', 'Java', 'uploads/Java Full Course.mp4', NULL, '2025-05-11 10:39:04', '2025-05-11 18:39:04', 0, 0, '2025-05-11 10:39:04', NULL),
(44, 'Java Full Course for Beginners', 'Master Java – a must-have language for software development, Android apps, and more! ☕️ This beginner-friendly course takes you from basics to real coding skills. \r\n\r\n📖 TABLE OF CONTENTS \r\n0:00:00 Introduction \r\n0:01:46 Installing Java \r\n0:03:59 Anatomy of a Java Program \r\n0:08:41 Your First Java Program \r\n0:15:59 Cheat Sheet \r\n0:16:29 How Java Code Gets Executed \r\n0:22:54 Course Structure \r\n0:25:22 Types \r\n0:25:57 Variables \r\n0:29:07 Primitive Types \r\n0:34:27 Reference Types \r\n0:39:15 Primitive Types vs Reference Types\r\n0:43:39 Strings \r\n0:50:42 Escape Sequences \r\n0:53:22 Arrays \r\n0:58:47 Multi-Dimensional Arrays \r\n1:01:23 Constants \r\n1:03:15 Arithmetic Expressions \r\n1:07:18 Order of Operations \r\n1:08:40 Casting \r\n1:15:08 The Math Class \r\n1:19:50 Formatting Numbers \r\n1:25:40 Reading Input \r\n1:30:45 Project: Mortgage Calculator \r\n1:32:55 Solution: Mortgage Calculator \r\n1:37:14 Types Summary \r\n1:38:43 Control Flow \r\n1:39:30 Comparison Operators \r\n1:41:16 Logical Operators \r\n1:45:52 If Statements \r\n1:50:18 Simplifying If Statements \r\n1:53:47 The Ternary Operator \r\n1:56:16 Switch Statements \r\n2:00:07 Exercise: FizzBuzz \r\n2:06:05 For Loops \r\n2:09:53 While Loops \r\n2:14:19 Do...While Loops \r\n2:15:36 Break and Continue \r\n2:18:52 For-Each Loop \r\n2:21:59 Project: Mortgage Calculator \r\n2:23:27 Solution: Mortgage Calculator \r\n2:28:28 Control Flow Summary \r\n2:29:25 Clean Coding \r\n\r\n💡 Why Java? \r\n•	Super popular language for apps, websites, and more. \r\n•	In-demand skill for software developers. \r\n•	Great for learning object-oriented programming (OOP) \r\n\r\n👉 This tutorial is perfect if: \r\n•	You\'re a complete beginner. \r\n•	You want to build real-world projects. \r\n•	You aim for a career in software development.\r\n\r\n\r\nhttps://youtu.be/eIrMbAQSU34\r\nProgramming with Mosh', 'Java', 'uploads/Java Full Course for Beginners.mp4', NULL, '2025-05-11 10:41:27', '2025-05-11 18:41:27', 0, 0, '2025-05-11 10:41:27', NULL),
(46, 'SQL Course for Beginners [Full Course]', 'Master SQL – an essential skill for AI, machine learning, data analysis, and more! 📚 This beginner-friendly course teaches you SQL from scratch.\r\n\r\n💡 Why Learn SQL? \r\n•	It\'s the standard language for working with databases. \r\n•	In-demand skill for developers, data scientists, and more. \r\n•	MySQL is popular, open-source, and easy to learn.\r\n\r\n📖 TABLE OF CONTENT \r\n0:00:00 Introduction \r\n0:01:02 What is SQL? \r\n0:04:24 Cheat Sheet \r\n0:04:50 Installing MySQL on Mac \r\n0:09:48 Installing MySQL on Windows \r\n0:15:08 Creating the Databases for this Course \r\n0:23:40 The SELECT Statement \r\n0:29:30 The SELECT Clause \r\n0:38:18 The WHERE Clause\r\n0:43:35 The AND, OR, and NOT Operators \r\n0:51:38 The IN Operator \r\n0:54:41 The BETWEEN Operator \r\n0:56:53 The LIKE Operator \r\n1:02:31 The REGEXP Operator \r\n1:11:51 The IS NULL Operator \r\n1:14:18 The ORDER BY Operator \r\n1:21:23 The LIMIT Operator \r\n1:24:50 Inner Joins \r\n1:33:16 Joining Across Databases \r\n1:36:03 Self Joins \r\n1:40:17 Joining Multiple Tables \r\n1:47:03 Compound Join Conditions \r\n1:50:44 Implicit Join Syntax \r\n1:53:04 Outer Joins \r\n1:59:31 Outer Join Between Multiple Tables \r\n2:05:50 Self Outer Joins \r\n2:08:02 The USING Clause \r\n2:13:25 Natural Joins \r\n2:14:46 Cross Joins \r\n2:18:01 Unions \r\n2:26:29 Column Attributes \r\n2:29:54 Inserting a Single Row \r\n2:35:40 Inserting Multiple Rows \r\n2:38:58 Inserting Hierarchical Rows \r\n2:44:51 Creating a Copy of a Table \r\n2:53:38 Updating a Single Row \r\n2:57:33 Updating Multiple Rows \r\n3:00:47 Using Subqueries in Updates \r\n3:06:24 Deleting Rows \r\n3:07:48 Restoring Course Databases\r\n\r\nhttps://youtu.be/7S_tz1z_5bA\r\nProgramming with Mosh', 'SQL', 'uploads/1746966790_SQL Course for Beginners [Full Course].mp4', NULL, '2025-05-11 12:33:10', '2025-05-11 20:33:10', 0, 15, '2025-05-11 12:33:10', NULL),
(47, 'SQL Tutorial - Full Database Course for Beginners', 'The course is designed for beginners to SQL and database management systems, and will introduce common database management topics. Throughout the course we\'ll be looking at various topics including schema design, basic C.R.U.D operations, aggregation, nested queries, joins, keys and much more.\r\n\r\n⭐️ Contents ⭐ \r\n⌨️ (0:00) Introduction \r\n⌨️ (2:36) What is a Database? \r\n⌨️ (23:10) Tables & Keys \r\n⌨️ (43:31) SQL Basics \r\n⌨️ (52:26) MySQL Windows Installation \r\n⌨️ (1:01:59) MySQL Mac Installation \r\n⌨️ (1:15:49) Creating Tables \r\n⌨️ (1:31:05) Inserting Data \r\n⌨️ (1:38:17) Constraints \r\n⌨️ (1:48:11) Update & Delete\r\n⌨️ (1:56:11) Basic Queries\r\n⌨️ (2:08:37) Company Database Intro \r\n⌨️ (2:14:05) Creating Company Database \r\n⌨️ (2:30:27 ) More Basic Queries \r\n⌨️ (2:26:24) Functions \r\n⌨️ (2:45:13) Wildcards \r\n⌨️ (2:53:53) Union \r\n⌨️ (3:01:36) Joins \r\n⌨️ (3:11:49) Nested Queries \r\n⌨️ (3:21:52) On Delete \r\n⌨️ (3:30:05) Triggers \r\n⌨️ (3:42:12) ER Diagrams Intro \r\n⌨️ (3:55:53) Designing an ER Diagram \r\n⌨️ (4:08:34) Converting ER Diagrams to Schemas\r\n\r\nhttps://youtu.be/HXV3zeQKqGY\r\nfreeCodeCamp.org', 'SQL', 'uploads/1746966890_SQL Tutorial - Full Database Course for Beginners.mp4', NULL, '2025-05-11 12:34:50', '2025-05-11 20:34:50', 0, 15, '2025-05-11 12:34:50', NULL),
(48, 'New to Animation? Start Here', 'TIMESTAMPS \r\n00:00 - Introduction \r\n00:35 - Bouncing Ball \r\n02:04 - Spinning Ball \r\n03:39 - Pendulum \r\n05:40 - Hammer \r\n06:20 - Variations on the exercises\r\n\r\nhttps://youtu.be/37L-8lbyS1Y\r\nmoderndayjames', 'Animation', 'uploads/1746966980_New to Animation  Start Here.mp4', NULL, '2025-05-11 12:36:20', '2025-05-11 20:36:20', 0, 15, '2025-05-11 12:36:20', NULL),
(49, 'Photoshop for Beginners | FREE COURSE', 'Go from beginner to pro in 23 lessons exploring all the essential Photoshop tools and techniques. You\'ll start at the beginning and work quickly into more exciting techniques. Learn how to use Photoshop layer styles, how to change color levels, how to retouch and manipulate images, and much more. If you\'re a photographer, marketer, or designer, this course will give you the core skills you need.\r\n\r\nhttps://youtu.be/IyR_uYsRdPs\r\nEnvato Tuts+', 'Editing & PS', 'uploads/1746967055_Photoshop for Beginners _ FREE COURSE.mp4', NULL, '2025-05-11 12:37:35', '2025-05-11 20:37:35', 0, 15, '2025-05-11 12:37:35', NULL),
(50, 'Photoshop Tutorial for Beginners 2022 | Everything You NEED to KNOW!', 'In today\'s video I show you everything you need to know as a beginner about photoshop cc photo editing in 2021/2022. If you want to see more photo and video editing tutorials with photoshop cc 2022, make sure to comment below and subscribe to the channel. Hope you like it, cheers!\r\n\r\nTimestamps: \r\n0:30 Opening a new document \r\n1:18 Importing images \r\n1:45 Software interface overview \r\n2:38 Basic editing tools | What they do | How to use them \r\n12:08 Blending modes \r\n14:26 Blending options \r\n15:31 Exporting\r\n\r\nhttps://youtu.be/61mkx_OV61s\r\nVince Opra', 'Editing & PS', 'uploads/1746967126_Photoshop Tutorial for Beginners 2022 _ Everything You NEED to KNOW!.mp4', NULL, '2025-05-11 12:38:46', '2025-05-11 20:38:46', 0, 15, '2025-05-11 12:38:46', NULL),
(51, 'Learn Hangul in 90 Minutes - Start to Finish [Complete Series]', 'Learn Hangul quickly in only 90 minutes. Hangul is the Korean alphabet, and this video will cover everything you need to know from its history, to how to read and write it, and sound change rules for proper pronunciation. Get something to write with and start learning Korean the right way - from Hangul. \r\n\r\nhttps://youtu.be/s5aobqyEaMQ\r\nLearn Korean with GO! Billy Korean', 'Language', 'uploads/1746967276_Learn Hangul in 90 Minutes - Start to Finish [Complete Series].mp4', NULL, '2025-05-11 12:41:16', '2025-05-11 20:41:16', 0, 15, '2025-05-11 12:41:16', NULL),
(52, 'C++ Full Course for free ⚡️', 'This video is a beginner\'s introduction to C++ that assumes you have no coding experience. C++ is a vast and complex language. This 6-hour video covers just enough to get you started working with C++ on your own. After completion, I would recommend researching: Vectors, Polymorphism, STL, Smart Pointers, and modern C++23 features.\r\n\r\n⭐️Time Stamps⭐️ \r\n1# (00:00:00) C++ tutorial for beginners 👨‍💻 \r\n2# (00:13:30) Variables and basic data types ✗ \r\n3# (00:24:14) Const 🚫 \r\n4# (00:27:37) Namespaces 📛 \r\n5# (00:32:13) Typedef and type aliases 🙋‍♂️ \r\n6# (00:37:39) Arithmetic operators 🧮 \r\n7# (00:43:18) Type conversion ✨ \r\n8# (00:47:05) User input ⌨️ \r\n9# (00:52:35) Useful math related functions🔢 \r\n10# (00:56:03) Hypotenuse calculator practice program 📐 \r\n11# (00:58:44) If statements 🤔 \r\n12# (01:03:40) Switches 🔀 \r\n13# (01:09:29) Console calculator program 🖩 \r\n14# (01:14:13) Ternary operator ❓ \r\n15# (01:18:53) Logical operators 🔣 \r\n16# (01:23:55) Temperature conversion program 🌡️ \r\n17# (01:29:17) Useful string methods in C++ 〰️ \r\n18# (01:35:51) While loops ♾️ \r\n19# (01:38:56) Do while loops 🔃 \r\n20# (01:42:15) For loops 🔂 \r\n21# (01:45:53) Break & continue 💔 \r\n22# (01:47:34) Nested loops ➿ \r\n23# (01:51:51) Random number generator 🎲 \r\n24# (01:55:25) Random event generator 🎁 \r\n25# (01:59:05) Number guessing game ↕️ \r\n26# (02:03:10) User defined functions 📞 \r\n27# (02:10:33) Return keyword 🔙 \r\n28# (02:16:42) Overloaded functions 🍕 \r\n29# (02:19:49) Variable scope 🌎 \r\n30# (02:24:11) Banking practice program 💰 \r\n31# (02:38:04) ROCK PAPER SCISSORS game 👊 \r\n32# (02:51:11) Arrays 🚗 \r\n33# (02:56:40) Sizeof() operator ⚖️ \r\n34# (03:01:34) Iterate over an array 🗃️ \r\n35# (03:05:40) Foreach loop 🗂️ \r\n36# (03:08:36) Pass array to a function 💵 \r\n37# (03:13:07) Search an array for an element 🔎 \r\n38# (03:20:43) Sort an array ➡️ \r\n39# (03:26:37) Fill() function 🍔 \r\n40# (03:31:19) Fill an array with user input 🌭 \r\n41# (03:38:17) Multidimensional arrays ⬜ \r\n42# (03:45:57) QUIZ GAME 💯 \r\n43# (03:57:42) Memory addresses 🏠 \r\n44# (04:00:31) Pass by VALUE vs pass by REFERENCE 📧 \r\n45# (04:04:47) Const parameters 🧱 \r\n46# (04:07:54) Credit card validator program 💳 \r\n47# (04:17:56) Pointers 👈 \r\n48# (04:23:12) Null pointers ⛔ \r\n49# (04:27:17) TIC TAC TOE game ⭕ \r\n50# (04:46:26) Dynamic memory 🧠 \r\n51# (04:52:15) Recursion 😵 \r\n52# (04:58:35) Function templates 🍪 \r\n53# (05:03:49) Structs 🏗️ \r\n54# (05:08:49) Pass structs as arguments 🚚 \r\n55# (05:14:17) Enums 📅 \r\n56# (05:18:38) Object Oriented Programming 🧍 \r\n57# (05:29:32) Constructors 👷 \r\n58# (05:38:26) Constructor overloading 👨‍🍳 \r\n59# (05:42:51) Getters & setters 🔒 \r\n60# (05:48:59) Inheritance 👩‍👧‍👦 \r\n\r\nhttps://youtu.be/-TkoO8Z07hI\r\nBro Code', 'C++', 'uploads/1746967428_C++ Full Course for free ⚡️.mp4', NULL, '2025-05-11 12:43:48', '2025-05-11 20:43:48', 0, 15, '2025-05-11 12:43:48', NULL),
(53, 'C++ Full Course for free ⚡️', 'This video is a beginner\'s introduction to C++ that assumes you have no coding experience. C++ is a vast and complex language. This 6-hour video covers just enough to get you started working with C++ on your own. After completion, I would recommend researching: Vectors, Polymorphism, STL, Smart Pointers, and modern C++23 features.\r\n\r\n⭐️Time Stamps⭐️ \r\n1# (00:00:00) C++ tutorial for beginners 👨‍💻 \r\n2# (00:13:30) Variables and basic data types ✗ \r\n3# (00:24:14) Const 🚫 \r\n4# (00:27:37) Namespaces 📛 \r\n5# (00:32:13) Typedef and type aliases 🙋‍♂️ \r\n6# (00:37:39) Arithmetic operators 🧮 \r\n7# (00:43:18) Type conversion ✨ \r\n8# (00:47:05) User input ⌨️ \r\n9# (00:52:35) Useful math related functions🔢 \r\n10# (00:56:03) Hypotenuse calculator practice program 📐 \r\n11# (00:58:44) If statements 🤔 \r\n12# (01:03:40) Switches 🔀 \r\n13# (01:09:29) Console calculator program 🖩 \r\n14# (01:14:13) Ternary operator ❓ \r\n15# (01:18:53) Logical operators 🔣 \r\n16# (01:23:55) Temperature conversion program 🌡️ \r\n17# (01:29:17) Useful string methods in C++ 〰️ \r\n18# (01:35:51) While loops ♾️ \r\n19# (01:38:56) Do while loops 🔃 \r\n20# (01:42:15) For loops 🔂 \r\n21# (01:45:53) Break & continue 💔 \r\n22# (01:47:34) Nested loops ➿ \r\n23# (01:51:51) Random number generator 🎲 \r\n24# (01:55:25) Random event generator 🎁 \r\n25# (01:59:05) Number guessing game ↕️ \r\n26# (02:03:10) User defined functions 📞 \r\n27# (02:10:33) Return keyword 🔙 \r\n28# (02:16:42) Overloaded functions 🍕 \r\n29# (02:19:49) Variable scope 🌎 \r\n30# (02:24:11) Banking practice program 💰 \r\n31# (02:38:04) ROCK PAPER SCISSORS game 👊 \r\n32# (02:51:11) Arrays 🚗 \r\n33# (02:56:40) Sizeof() operator ⚖️ \r\n34# (03:01:34) Iterate over an array 🗃️ \r\n35# (03:05:40) Foreach loop 🗂️ \r\n36# (03:08:36) Pass array to a function 💵 \r\n37# (03:13:07) Search an array for an element 🔎 \r\n38# (03:20:43) Sort an array ➡️ \r\n39# (03:26:37) Fill() function 🍔 \r\n40# (03:31:19) Fill an array with user input 🌭 \r\n41# (03:38:17) Multidimensional arrays ⬜ \r\n42# (03:45:57) QUIZ GAME 💯 \r\n43# (03:57:42) Memory addresses 🏠 \r\n44# (04:00:31) Pass by VALUE vs pass by REFERENCE 📧 \r\n45# (04:04:47) Const parameters 🧱 \r\n46# (04:07:54) Credit card validator program 💳 \r\n47# (04:17:56) Pointers 👈 \r\n48# (04:23:12) Null pointers ⛔ \r\n49# (04:27:17) TIC TAC TOE game ⭕ \r\n50# (04:46:26) Dynamic memory 🧠 \r\n51# (04:52:15) Recursion 😵 \r\n52# (04:58:35) Function templates 🍪 \r\n53# (05:03:49) Structs 🏗️ \r\n54# (05:08:49) Pass structs as arguments 🚚 \r\n55# (05:14:17) Enums 📅 \r\n56# (05:18:38) Object Oriented Programming 🧍 \r\n57# (05:29:32) Constructors 👷 \r\n58# (05:38:26) Constructor overloading 👨‍🍳 \r\n59# (05:42:51) Getters & setters 🔒 \r\n60# (05:48:59) Inheritance 👩‍👧‍👦 \r\n\r\nhttps://youtu.be/-TkoO8Z07hI\r\nBro Code', 'C++', 'uploads/1746967490_C++ Full Course for free ⚡️.mp4', NULL, '2025-05-11 12:44:50', '2025-05-11 20:44:50', 0, 15, '2025-05-11 12:44:50', NULL),
(54, 'C++ Tutorial For Beginners | C++ Programming | C++ | C++ Basics | C++ For Beginners | Simplilearn', 'In this video on C++ Tutorial for Beginners, you will learn about some basic topics that will help you understand C++ in a better way. You will learn about arrays, strings, if-else, for loop, while loop, functions, and much more. This C++ tutorial for beginners will help you understand all the essential topics you need to know to learn C++ programming. \r\n\r\nContent:\r\n00:00 Introduction - c++ tutorial for beginners \r\n01:51 The first Program - c++ tutorial for beginners \r\n04:11 Types and Variables - c++ tutorial for beginners \r\n05:31 Arrays - c++ tutorial for beginners \r\n06:11 Strings - c++ tutorial for beginners \r\n07:11 If-else - c++ tutorial for beginners \r\n07:51 for loop - c++ tutorial for beginners \r\n08:41 while loop - c++ tutorial for beginners \r\n09:41 functions - c++ tutorial for beginners\r\n\r\n\r\nhttps://youtu.be/McojvctVsUs\r\nSimplilearn', 'C++', 'uploads/1746967562_C++ Tutorial For Beginners _ C++ Programming _ C++ _ C++ Basics _ C++ For Beginners _ Simplilearn.mp4', NULL, '2025-05-11 12:46:02', '2025-05-11 20:46:02', 0, 15, '2025-05-11 12:46:02', NULL),
(55, 'C++ Tutorial For Beginners | C++ Programming | C++ | C++ Basics | C++ For Beginners | Simplilearn', 'In this video on C++ Tutorial for Beginners, you will learn about some basic topics that will help you understand C++ in a better way. You will learn about arrays, strings, if-else, for loop, while loop, functions, and much more. This C++ tutorial for beginners will help you understand all the essential topics you need to know to learn C++ programming. \r\n\r\nContent:\r\n00:00 Introduction - c++ tutorial for beginners \r\n01:51 The first Program - c++ tutorial for beginners \r\n04:11 Types and Variables - c++ tutorial for beginners \r\n05:31 Arrays - c++ tutorial for beginners \r\n06:11 Strings - c++ tutorial for beginners \r\n07:11 If-else - c++ tutorial for beginners \r\n07:51 for loop - c++ tutorial for beginners \r\n08:41 while loop - c++ tutorial for beginners \r\n09:41 functions - c++ tutorial for beginners\r\n\r\n\r\nhttps://youtu.be/McojvctVsUs\r\nSimplilearn', 'C++', 'uploads/1746967591_C++ Tutorial For Beginners _ C++ Programming _ C++ _ C++ Basics _ C++ For Beginners _ Simplilearn.mp4', NULL, '2025-05-11 12:46:31', '2025-05-11 20:46:31', 0, 15, '2025-05-11 12:46:31', NULL),
(56, 'Graphic Design Basics | FREE COURSE', 'So you want to be a graphic designer? Learn the fundamentals of design in this graphic design basics course. \r\n\r\nYou’ll learn how to apply graphic design theory to print and digital products, what a professional design workflow looks like, and how to use design assets to create your best work. \r\n\r\nContent\r\n00:00:00 Graphic Design Basics \r\n00:00:44 The History of Graphic Design \r\n00:04:03 Design Theory & Principles \r\n00:05:14 Basic Design Principles \r\n00:11:27 Color Theory \r\n00:18:02 Typography \r\n00:32:12 Design Theory in Action \r\n00:32:58 Print Design \r\n00:37:40 Digital Product Design \r\n00:39:56 Digital Design \r\n00:42:28 Brand Design \r\n00:50:04 Design Tools \r\n00:50:50 Design Workflow \r\n00:57:21 Color & Design Assets \r\n00:59:59 Technology & AI \r\n01:01:09 Conclusion \r\n\r\nFor each of these patterns, we’ll look at the definition and some use cases, and then we’ll apply that knowledge to a demo project: a three-page portfolio website designed specifically for this course. \r\n\r\nhttps://youtu.be/GQS7wPujL2k\r\nEnvato Tuts+', 'Design', 'uploads/1746967661_Graphic Design Basics  FREE COURSE.mp4', NULL, '2025-05-11 12:47:41', '2025-05-11 20:47:41', 0, 15, '2025-05-11 12:47:41', NULL),
(57, 'Web Design for Beginners | FREE COURSE', 'If you\'re new to web design, this course on web design for beginners will teach you everything you need to know. \r\n\r\n“How do I pick typefaces, how do I pick colors, what the heck is whitespace, and how do I position and size elements correctly?” These are exactly the kinds of questions which we’ll address in this beginner web design tutorial. \r\n\r\nIn terms of fundamentals, you’ll learn about color, typography, spacing, sizing, imagery, and responsive web design. We’ll discuss the theory, best practices, and some tools you can use to make your job easier. \r\n\r\nWhen it comes to common web design patterns, you’ll learn about the elements you can use to design a web page—things like headers, hero areas, buttons, image galleries, contact forms, and more. \r\n\r\nhttps://youtu.be/B-ytMSuwbf8\r\nEnvato Tuts+', 'Design', 'uploads/1746967708_Web Design for Beginners _ FREE COURSE.mp4', NULL, '2025-05-11 12:48:28', '2025-05-11 20:48:28', 0, 15, '2025-05-11 12:48:28', NULL),
(58, 'UI / UX Design Tutorial – Wireframe, Mockup & Design in Figma', 'Learn the process of UI / UX design. In this tutorial you will learn how a professional designer builds a full website design from scratch following the process of user experience and user interface. The video covers wireframing, prototyping, and designing in Figma.\r\n\r\n⭐️ Sections ⭐️ \r\n⌨️ (00:00) Introduction \r\n⌨️ (01:27) Wireframing \r\n⌨️ (30:58) UI Layout \r\n⌨️ (1:06:38) Mockup \r\n\r\n\r\nhttps://youtu.be/c9Wg6Cb_YlU\r\nfreeCodeCamp.org', 'Design', 'uploads/1746967768_UI _ UX Design Tutorial – Wireframe, Mockup & Design in Figma.mp4', NULL, '2025-05-11 12:49:28', '2025-05-11 20:49:28', 0, 15, '2025-05-11 12:49:28', NULL),
(59, 'UI / UX Design Tutorial – Wireframe, Mockup & Design in Figma', 'Learn the process of UI / UX design. In this tutorial you will learn how a professional designer builds a full website design from scratch following the process of user experience and user interface. The video covers wireframing, prototyping, and designing in Figma.\r\n\r\n⭐️ Sections ⭐️ \r\n⌨️ (00:00) Introduction \r\n⌨️ (01:27) Wireframing \r\n⌨️ (30:58) UI Layout \r\n⌨️ (1:06:38) Mockup \r\n\r\n\r\nhttps://youtu.be/c9Wg6Cb_YlU\r\nfreeCodeCamp.org', 'Design', 'uploads/1746967834_UI _ UX Design Tutorial – Wireframe, Mockup & Design in Figma.mp4', NULL, '2025-05-11 12:50:34', '2025-05-11 20:50:34', 0, 15, '2025-05-11 12:50:34', NULL),
(60, 'Free Adobe Animate Course for Beginners (Complete Animation Tutorial)', 'This Adobe Animate course for beginners will teach you everything about animating with Adobe Animate. Step-by-step, we will cover everything you need to know from opening the program for the very first time to finalising and exporting your finished animation. \r\n\r\n⭐️ Contents ⭐ \r\n00:00 Welcome \r\n00:26 Interface and Tools \r\n25:05 Layers 38:51 Timeline \r\n55:07 Symbols \r\n1:14:58 Timing, Spacing and Easing \r\n1:45:21 Squash and Stretch \r\n2:08:09 Straight Ahead and Pose-to-Pose \r\n2:19:01 Arcs \r\n2:25:46 Anticipation \r\n2:44:17 Overlapping Action and Follow Through \r\n3:16:04 Secondary Action \r\n4:08:59 Exaggeration, Appeal, Solid Drawing and Staging\r\n\r\nhttps://youtu.be/hDqhQN8X2cU\r\nSkillademia', 'Animation', 'uploads/1746973703_Free Adobe Animate Course for Beginners (Complete Animation Tutorial).mp4', NULL, '2025-05-11 14:28:23', '2025-05-11 22:28:23', 0, 15, '2025-05-11 14:28:23', NULL),
(62, 'Learn Korean in 20 Minutes - ALL the Basics You Need', 'In this video, you’ll get started with Korean. You will discover the key points of Korean Grammar! This is THE place to start if you want to start learning Korean. \r\n\r\nhttps://youtu.be/ZinAK6n6cWU\r\nLearn Korean with KoreanClass101.com', 'Language', 'uploads/1746973894_Learn Korean in 20 Minutes - ALL the Basics You Need.mp4', NULL, '2025-05-11 14:31:34', '2025-05-11 22:31:34', 0, 15, '2025-05-11 14:31:34', NULL),
(63, 'How to Say \"Hello\" in Chinese #Day 1 Nǐ hǎo/Ni hao/Nin hao (Free Chinese Lesson)', 'Hello and welcome to EverydayChinese. Today is our first lesson, so we will start with a very simple expression, how to say Hello in Chinese. \r\n\r\nhttps://youtu.be/LrNkgDVrKEw？list=PLrYgra2FrMh_jGBcMmNWPnSh-kHwGiaXG\r\nEveryday Chinese', 'Language', 'uploads/1746973966_How to Say  Hello  in Chinese #Day 1 Nǐ hǎo_Ni hao_Nin hao (Free Chinese Lesson).mp4', NULL, '2025-05-11 14:32:46', '2025-05-11 22:32:46', 0, 15, '2025-05-11 14:32:46', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `video_comments`
--

CREATE TABLE `video_comments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `video_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `video_comments`
--

INSERT INTO `video_comments` (`id`, `user_id`, `video_id`, `content`, `created_at`) VALUES
(3, 20, 35, 'J1234', '2025-05-11 08:57:02'),
(4, 21, 62, 'this video is nice, i think that this video is clearly explain', '2025-05-20 04:44:34');

-- --------------------------------------------------------

--
-- Table structure for table `video_favorites`
--

CREATE TABLE `video_favorites` (
  `user_id` int(11) UNSIGNED NOT NULL,
  `video_id` int(11) NOT NULL,
  `favorited_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `video_favorites`
--

INSERT INTO `video_favorites` (`user_id`, `video_id`, `favorited_at`) VALUES
(21, 62, '2025-05-20 04:45:08');

-- --------------------------------------------------------

--
-- Table structure for table `video_likes`
--

CREATE TABLE `video_likes` (
  `user_id` int(11) UNSIGNED NOT NULL,
  `video_id` int(11) NOT NULL,
  `liked_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `video_likes`
--

INSERT INTO `video_likes` (`user_id`, `video_id`, `liked_at`) VALUES
(20, 35, '2025-05-11 07:53:32'),
(21, 62, '2025-05-20 04:45:05');

-- --------------------------------------------------------

--
-- Table structure for table `watch_history`
--

CREATE TABLE `watch_history` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `video_id` int(11) NOT NULL,
  `watched_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `watch_history`
--

INSERT INTO `watch_history` (`id`, `user_id`, `video_id`, `watched_at`) VALUES
(2, 16, 45, '2025-05-11 18:45:27'),
(3, 21, 63, '2025-05-20 12:44:05'),
(4, 21, 62, '2025-05-20 12:44:23'),
(5, 21, 64, '2025-05-20 14:18:24'),
(7, 16, 63, '2025-05-22 15:06:59'),
(9, 16, 42, '2025-05-22 15:07:23'),
(10, 16, 62, '2025-05-22 15:07:36');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quiz_scores`
--
ALTER TABLE `quiz_scores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_id` (`user_id`);

--
-- Indexes for table `scores`
--
ALTER TABLE `scores`
  ADD PRIMARY KEY (`score_id`);

--
-- Indexes for table `search_history`
--
ALTER TABLE `search_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `skill_tests`
--
ALTER TABLE `skill_tests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subjective_submissions`
--
ALTER TABLE `subjective_submissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `video_comments`
--
ALTER TABLE `video_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `video_id` (`video_id`);

--
-- Indexes for table `video_favorites`
--
ALTER TABLE `video_favorites`
  ADD PRIMARY KEY (`user_id`,`video_id`),
  ADD KEY `video_id` (`video_id`);

--
-- Indexes for table `video_likes`
--
ALTER TABLE `video_likes`
  ADD PRIMARY KEY (`user_id`,`video_id`),
  ADD KEY `video_id` (`video_id`);

--
-- Indexes for table `watch_history`
--
ALTER TABLE `watch_history`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`video_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=977;

--
-- AUTO_INCREMENT for table `quiz_scores`
--
ALTER TABLE `quiz_scores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `scores`
--
ALTER TABLE `scores`
  MODIFY `score_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `search_history`
--
ALTER TABLE `search_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `skill_tests`
--
ALTER TABLE `skill_tests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subjective_submissions`
--
ALTER TABLE `subjective_submissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `videos`
--
ALTER TABLE `videos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `video_comments`
--
ALTER TABLE `video_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `watch_history`
--
ALTER TABLE `watch_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `quiz_scores`
--
ALTER TABLE `quiz_scores`
  ADD CONSTRAINT `fk_quiz_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `search_history`
--
ALTER TABLE `search_history`
  ADD CONSTRAINT `search_history_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `video_comments`
--
ALTER TABLE `video_comments`
  ADD CONSTRAINT `video_comments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `video_comments_ibfk_2` FOREIGN KEY (`video_id`) REFERENCES `videos` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `video_favorites`
--
ALTER TABLE `video_favorites`
  ADD CONSTRAINT `video_favorites_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `video_favorites_ibfk_2` FOREIGN KEY (`video_id`) REFERENCES `videos` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `video_likes`
--
ALTER TABLE `video_likes`
  ADD CONSTRAINT `video_likes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `video_likes_ibfk_2` FOREIGN KEY (`video_id`) REFERENCES `videos` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

GRANT ALL PRIVILEGES ON *.* TO 'peiyin5917'@'%' IDENTIFIED BY '你的密码' WITH GRANT OPTION;
FLUSH PRIVILEGES;
