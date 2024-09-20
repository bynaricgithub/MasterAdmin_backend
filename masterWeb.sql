-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 20, 2024 at 07:24 AM
-- Server version: 8.0.36-0ubuntu0.22.04.1
-- PHP Version: 8.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gpkWeb`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `circulars`
--

CREATE TABLE `circulars` (
  `id` bigint UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_id` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `circulars`
--

INSERT INTO `circulars` (`id`, `date`, `title`, `link`, `order_id`, `status`, `created_at`, `updated_at`) VALUES
(4, '2023-08-15', 'zzzz', 'https://msihmctrs.s3.ap-south-1.amazonaws.com/fra/dummypdf', 3, 1, '2024-07-23 02:18:13', '2024-09-11 06:27:10'),
(5, '2024-07-05', 'test', 'https://fra-bucket-1.s3.ap-south-1.amazonaws.com/uploads/dummypdf', 4, 1, '2024-07-31 13:23:33', '2024-09-11 06:27:12'),
(6, '2024-09-04', 'Circular 1', 'https://fra-bucket-1.s3.ap-south-1.amazonaws.com/uploads/dummypdf1726035693903', 1, 1, '2024-09-11 06:21:34', '2024-09-11 06:27:13'),
(7, '2024-09-04', 'Circular 2', 'https://fra-bucket-1.s3.ap-south-1.amazonaws.com/uploads/dummypdf1726035694191', 2, 1, '2024-09-11 06:21:34', '2024-09-11 06:27:43');

-- --------------------------------------------------------

--
-- Table structure for table `corrigedums`
--

CREATE TABLE `corrigedums` (
  `id` bigint UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_id` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `corrigedums`
--

INSERT INTO `corrigedums` (`id`, `date`, `title`, `link`, `order_id`, `status`, `created_at`, `updated_at`) VALUES
(2, '2024-07-16', 'abcd', 'https://msihmctrs.s3.ap-south-1.amazonaws.com/fra/dummypdf', 2, 1, '2024-07-22 23:36:56', '2024-09-11 06:22:19'),
(3, '2024-07-01', 'zzzzregdr abc', 'https://msihmctrs.s3.ap-south-1.amazonaws.com/fra/dummypdf', 1, 1, '2024-07-23 02:18:24', '2024-09-11 06:22:19');

-- --------------------------------------------------------

--
-- Table structure for table `course_master`
--

CREATE TABLE `course_master` (
  `cid` int NOT NULL,
  `sub_type` varchar(12) NOT NULL,
  `course_code` varchar(20) NOT NULL,
  `course_name` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course_master`
--

INSERT INTO `course_master` (`cid`, `sub_type`, `course_code`, `course_name`) VALUES
(1, 'ARCH', 'ARC', 'Architecture'),
(2, 'ARCH', 'BAP', 'Bachelor of Planning'),
(3, 'ARCH', 'BAR', 'B. Architecture(Construction Management)'),
(4, 'ARCH', 'BTP', 'B.Tech Planning'),
(5, 'ARCH', 'INT', 'Interior Design'),
(6, 'ENGG', 'AEE', 'Aeronautical Engineering'),
(7, 'ENGG', 'AGE', 'Agricultural Engineering'),
(8, 'ENGG', 'AUE', 'Automobile Engineering'),
(9, 'ENGG', 'BIT', 'Bio Technology'),
(10, 'ENGG', 'BME', 'Bio Medical Engineering'),
(11, 'ENGG', 'CHE', 'Chemical Engineering'),
(12, 'ENGG', 'CIE', 'Civil Engineering'),
(13, 'ENGG', 'COE', 'Computer Engineering'),
(14, 'ENGG', 'COT', 'Computer Technology'),
(15, 'ENGG', 'CSE', 'Computer Science and Engineering'),
(16, 'ENGG', 'CST', 'Computer Science and Technology'),
(17, 'ENGG', 'CWE', 'Civil and Water Management Engineering'),
(18, 'ENGG', 'EAT', 'Electronics and Telecommunication Engg'),
(19, 'ENGG', 'ECE', 'Electronics and Communication Engineering'),
(20, 'ENGG', 'EEE', 'Electrical and Electronics Engineering'),
(21, 'ENGG', 'EEP', 'Electrical Engg [Electrical and Power]'),
(22, 'ENGG', 'ELC', 'Electronics Engineering'),
(23, 'ENGG', 'ELE', 'Electrical Engineering'),
(24, 'ENGG', 'ELP', 'Electrical Engg[Electronics and Power]'),
(25, 'ENGG', 'ENE', 'Environmental Engineering'),
(26, 'ENGG', 'ENS', 'Environmental Science and Technology'),
(27, 'ENGG', 'EPE', 'Electrical and Power Engineering'),
(28, 'ENGG', 'EPT', 'Electronics Product Design Technology'),
(29, 'ENGG', 'FET', 'Food Engineering and Technology'),
(30, 'ENGG', 'FOT', 'Food Technology'),
(31, 'ENGG', 'IDS', 'Industrial Engineering'),
(32, 'ENGG', 'INE', 'Instrumentation Engineering'),
(33, 'ENGG', 'INF', 'Information Technology'),
(34, 'ENGG', 'INS', 'Instrumentation and Control Engineering'),
(35, 'ENGG', 'MAE', 'Marine Engineering'),
(36, 'ENGG', 'MEE', 'Mechanical Engineering'),
(37, 'ENGG', 'MES', 'Mechanical Engineering[Sandwich]'),
(38, 'ENGG', 'MET', 'Metallurgical Engineering'),
(39, 'ENGG', 'MIE', 'Mining Engineering'),
(40, 'ENGG', 'MMT', 'Man Made Textile Technology'),
(41, 'ENGG', 'OFT', 'Oil Fats and Waxes Technology'),
(42, 'ENGG', 'OIT', 'Oil Technology'),
(43, 'ENGG', 'OPT', 'Oil and Paints Technology'),
(44, 'ENGG', 'PAT', 'Paints Technology'),
(45, 'ENGG', 'PCE', 'Petro Chemical Engineering'),
(46, 'ENGG', 'PCT', 'Petro Chemical Technology'),
(47, 'ENGG', 'PEE', 'Petroleum Engineering'),
(48, 'ENGG', 'PES', 'Production Engineering[Sandwich]'),
(49, 'ENGG', 'PET', 'Petroleum Technology'),
(50, 'ENGG', 'PFT', 'Pharmaceutical and Fine Chemical Technology'),
(51, 'ENGG', 'PGC', 'Printing Engineering and Graphics Communication'),
(52, 'ENGG', 'PLP', 'Plastic and Polymer Technology'),
(53, 'ENGG', 'PLT', 'Plastic Technology'),
(54, 'ENGG', 'POE', 'Polymer Engineering'),
(55, 'ENGG', 'POT', 'Polymer Technology'),
(56, 'ENGG', 'POW', 'Power Engineering'),
(57, 'ENGG', 'PPE', 'Plastic and Polymer Engineering'),
(58, 'ENGG', 'PPT', 'Paper and Pulp Technology'),
(59, 'ENGG', 'PRE', 'Production Engineering'),
(60, 'ENGG', 'PRP', 'Printing and Packing Technology'),
(61, 'ENGG', 'PRT', 'Printing Technology'),
(62, 'ENGG', 'PUT', 'Pulp Technology'),
(63, 'ENGG', 'SCT', 'Surface Coating Technology'),
(64, 'ENGG', 'TCP', 'Town and Country Planning'),
(65, 'ENGG', 'TEC', 'Textile Chemistry'),
(66, 'ENGG', 'TEF', 'Textile Engineering (Fashion Technology)'),
(67, 'ENGG', 'TET', 'Textile Engineering / Technology'),
(68, 'ENGG', 'TEX', 'Textile Technology'),
(69, 'ENGG', 'TPE', 'Textile Plant Engineering'),
(70, 'ENGG', 'VAA', 'Valuecation and Arbitation'),
(71, 'HM', 'HMC', 'Hotel Management & Catering Technology'),
(72, 'MARC', 'ARC', 'Architecture'),
(73, 'MARC', 'ARE', 'Architectural Conservation'),
(74, 'MARC', 'COA', 'Computer Applications'),
(75, 'MARC', 'CON', 'Construction Management'),
(76, 'MARC', 'DIA', 'Digital Architecture'),
(77, 'MARC', 'ENA', 'Environmental Architecture'),
(78, 'MARC', 'IND', 'Industrial Design'),
(79, 'MARC', 'INF', 'Information Technology'),
(80, 'MARC', 'INT', 'Interior Design'),
(81, 'MARC', 'LAA', 'Landscape Architecture'),
(82, 'MARC', 'SUA', 'Sustanable Architecture'),
(83, 'MARC', 'URC', 'Urban Conservation'),
(84, 'MARC', 'URD', 'Urban Design'),
(85, 'MARC', 'URP', 'Urban and Regional Planning'),
(86, 'MBA', 'MBA', 'M. B. A.'),
(87, 'MBA', 'MBM', 'Masters in Business Mgmt'),
(88, 'MBA', 'MBT', 'M. B. A (Textile)'),
(89, 'MBA', 'MCM', 'Master in Computer Managment'),
(90, 'MBA', 'MFM', 'Masters in Financial Mgmt'),
(91, 'MBA', 'MGM', 'M.B.A.(General Management)'),
(92, 'MBA', 'MHR', 'M.B.A.(Human Resource Management)'),
(93, 'MBA', 'MIM', 'Master in Information Mgmt'),
(94, 'MBA', 'MIN', 'Masters in Industrial Management'),
(95, 'MBA', 'MIR', 'Masters in Industrial Relations & Personnel Mgmt.'),
(96, 'MBA', 'MIT', 'M.B.A.(Information Technology)'),
(97, 'MBA', 'MMM', 'M.B.A.(Marketing Management)'),
(98, 'MBA', 'MMS', 'M. M. S.'),
(99, 'MBA', 'MPM', 'Masters in Personnel Mgmt'),
(100, 'MBA', 'PGD', 'P.G.D.B.M'),
(101, 'MCA', 'MCA', 'Master in Computer Application'),
(102, 'ME', 'ADE', 'Advanced Electronics'),
(103, 'ME', 'AMM', 'Advanced Mfg & Mechanical System design'),
(104, 'ME', 'AUE', 'Automobile Engineering'),
(105, 'ME', 'AUT', 'Automotive Technology'),
(106, 'ME', 'BCE', 'Bio Chemical Engineering and Bio Technology'),
(107, 'ME', 'BIT', 'Bio Technology'),
(108, 'ME', 'BME', 'Bio Medical Engineering'),
(109, 'ME', 'CAA', 'Computer Aided Analysis and Design'),
(110, 'ME', 'CAC', 'CAD-CAM'),
(111, 'ME', 'CEM', 'Construction Engg and Management'),
(112, 'ME', 'CHE', 'Chemical Engineering'),
(113, 'ME', 'CIE', 'Civil Engineering'),
(114, 'ME', 'CIS', 'Civil Soil'),
(115, 'ME', 'CMA', 'Computer Aided Design Manufacture and Automation'),
(116, 'ME', 'CNE', 'Computer Networking and Engineering'),
(117, 'ME', 'CNI', 'Computer Networks & Internet Security'),
(118, 'ME', 'CNT', 'Computer Network'),
(119, 'ME', 'COE', 'Computer Engineering'),
(120, 'ME', 'COM', 'Communication Engineering'),
(121, 'ME', 'CON', 'Construction Management'),
(122, 'ME', 'COS', 'Communication Systems'),
(123, 'ME', 'CSE', 'Computer Science and Engineering'),
(124, 'ME', 'CSI', 'Computer Science and Information Technology'),
(125, 'ME', 'CSS', 'Computer Science & Engineering ( Specilisation Information Technology)'),
(126, 'ME', 'CST', 'Computer Science & Technology'),
(127, 'ME', 'CSY', 'Control System Engineering'),
(128, 'ME', 'CTM', 'Constructional Technology & Management'),
(129, 'ME', 'DEE', 'Design Engineering'),
(130, 'ME', 'DIC', 'Digital Communications'),
(131, 'ME', 'DIE', 'Digital Electronics'),
(132, 'ME', 'DIS', 'Digital Systems'),
(133, 'ME', 'DRP', 'Drugs & Pharmaceuticals'),
(134, 'ME', 'EAT', 'Electronics and Telecommunication Engg'),
(135, 'ME', 'ECE', 'Electronics and Communication Engineering'),
(136, 'ME', 'EDT', 'Electronics Design and Technology'),
(137, 'ME', 'EEE', 'Electrical and Electronics Engineering'),
(138, 'ME', 'EIE', 'Electronics and Instrumentation Engineering'),
(139, 'ME', 'ELC', 'Electronics Engineering'),
(140, 'ME', 'ELE', 'Electrical Engineering'),
(141, 'ME', 'ELT', 'Electronic Technology'),
(142, 'ME', 'EMD', 'Electrical Machine and Drive'),
(143, 'ME', 'EMS', 'Embedded System'),
(144, 'ME', 'ENE', 'Environmental Engineering'),
(145, 'ME', 'ENR', 'Energy Engineering'),
(146, 'ME', 'ENS', 'Environmental Science and Technology'),
(147, 'ME', 'ENT', 'Energy Technology'),
(148, 'ME', 'EPE', 'Electrical and Power Engineering'),
(149, 'ME', 'EPS', 'Electrical Power System'),
(150, 'ME', 'ESC', 'Electronic System and Communication'),
(151, 'ME', 'ESM', 'Energy Systems and Management'),
(152, 'ME', 'ESY', 'Embedded System and Computing'),
(153, 'ME', 'ETN', 'Electronic and Telecommunication Networks'),
(154, 'ME', 'FOT', 'Food Technology'),
(155, 'ME', 'GET', 'Geo Technology'),
(156, 'ME', 'GTE', 'Geo Technical Engineering'),
(157, 'ME', 'HPE', 'Heat Power Engineering'),
(158, 'ME', 'HYD', 'Hydrulics'),
(159, 'ME', 'IDC', 'Industrial Drives and Control'),
(160, 'ME', 'IDS', 'Industrial Engineering'),
(161, 'ME', 'IEM', 'Infrastructure Engg and Management'),
(162, 'ME', 'INE', 'Instrumentation Engineering'),
(163, 'ME', 'INF', 'Information Technology'),
(164, 'ME', 'INS', 'Instrumentation and Control Engineering'),
(165, 'ME', 'IPS', 'Integrated Power Systems'),
(166, 'ME', 'ITS', 'Information Techniology ( Specialisation Information Security)'),
(167, 'ME', 'MAD', 'Machine Design'),
(168, 'ME', 'MAN', 'Manufacturing Engineering'),
(169, 'ME', 'MDE', 'Mechnical Design'),
(170, 'ME', 'MEA', 'Manufacturing Engineering and Automation'),
(171, 'ME', 'MEC', 'Mechatronics'),
(172, 'ME', 'MED', 'Mechanical Engg Design'),
(173, 'ME', 'MEE', 'Mechanical Engineering'),
(174, 'ME', 'MEP', 'Mechanical (Producation Engineering)'),
(175, 'ME', 'MIC', 'Microwave Electronics'),
(176, 'ME', 'MCW', 'Microwave Engineering'),
(177, 'ME', 'MOB', 'Mobile Technology'),
(178, 'ME', 'MPD', 'Mechanical Engg.(Product Design & Dev.)'),
(179, 'ME', 'MPE', 'Manufacturing Processing Engineering'),
(180, 'ME', 'MSE', 'Manufacturing System Engineering'),
(181, 'ME', 'NAT', 'Nano Technology'),
(182, 'ME', 'NIM', 'Network Infrastructure Management'),
(183, 'ME', 'OIL', 'Oil'),
(184, 'ME', 'OOS', 'Oil Oleochemicals and Surfactants Technology'),
(185, 'ME', 'PAI', 'Paints'),
(186, 'ME', 'PCE', 'Petro Chemical Engineering'),
(187, 'ME', 'PED', 'Power Electronics and Drives'),
(188, 'ME', 'PEE', 'Petroleum Engineering'),
(189, 'ME', 'PGC', 'Printing Engineering and Graphics Communication'),
(190, 'ME', 'PHC', 'Pharmaceuticals Chemistry and Technology'),
(191, 'ME', 'PME', 'Physical Metallurgy'),
(192, 'ME', 'PMG', 'Project Mangement'),
(193, 'ME', 'POE', 'Polymer Engineering'),
(194, 'ME', 'POT', 'Polymer Technology'),
(195, 'ME', 'PPS', 'Power Electronics and Power System'),
(196, 'ME', 'PRE', 'Production Engineering'),
(197, 'ME', 'PRI', 'Process Instrumentation'),
(198, 'ME', 'PRM', 'Process Metallurgy'),
(199, 'ME', 'PRT', 'Printing Technology'),
(200, 'ME', 'PSY', 'Power Systems'),
(201, 'ME', 'PTM', 'Production Technology and Management'),
(202, 'ME', 'SIP', 'Signal Processing'),
(203, 'ME', 'SOE', 'Software Engineering'),
(204, 'ME', 'STE', 'Structural Engineering'),
(205, 'ME', 'TCP', 'Town and Country Planning'),
(206, 'ME', 'TEM', 'Transportation Engineering and Management'),
(207, 'ME', 'TEX', 'Textile Technology'),
(208, 'ME', 'TFE', 'Thermal and Fluid Engg'),
(209, 'ME', 'THE', 'Thermal Engineering'),
(210, 'ME', 'TPO', 'Thermal Power Engineering'),
(211, 'ME', 'VDD', 'VLSI DSP DW'),
(212, 'ME', 'VDE', 'VLSI Design and Embeded System'),
(213, 'ME', 'VES', 'VLSI and Embeded System'),
(214, 'ME', 'VLS', 'VLSI'),
(215, 'ME', 'WCC', 'Wireless Communication and Computing'),
(216, 'ME', 'WRE', 'Water Resource Engineering'),
(217, 'MPH', 'BIP', 'Bio Pharmaceutics'),
(218, 'MPH', 'CLP', 'Clinical Pharmacy'),
(219, 'MPH', 'INP', 'Industrial Pharmacy'),
(220, 'MPH', 'PAN', 'Pharmacitucal Analysis'),
(221, 'MPH', 'PAP', 'Pharmacognosy and Physochemistry'),
(222, 'MPH', 'PCG', 'Pharmacognosy'),
(223, 'MPH', 'PCH', 'Pharmacutical Chemistry'),
(224, 'MPH', 'PCL', 'Pharmacology'),
(225, 'MPH', 'PDR', 'Pharmaceutics(Drug regulatory affairs)'),
(226, 'MPH', 'PHA', 'Pharmaceutics'),
(227, 'MPH', 'PHB', 'Pharmaceutical Biotechnology'),
(228, 'MPH', 'PHR', 'Pharmacy'),
(229, 'MPH', 'PHS', 'Pharmaceutical Science'),
(230, 'MPH', 'PHT', 'Pharmaceutical Technology'),
(231, 'MPH', 'QAT', 'Quality Assurance Techniques'),
(232, 'MPH', 'QUA', 'Quality Assurance'),
(233, 'PH', 'PHR', 'Pharmacy'),
(238, 'MBBS', 'MBBS', 'MBBS'),
(239, 'BDS', 'BDS', 'BDS'),
(240, 'BAMS', 'BAMS', 'BAMS'),
(241, 'BHMS', 'BHMS', 'BHMS'),
(242, 'BASLP', 'BASLP', 'BASLP'),
(243, 'BSCN', 'BSCN', 'BSCN'),
(244, 'OT', 'OT', 'BOTH'),
(245, 'PT', 'PT', 'BPTH'),
(246, 'UNANI', 'UNANI', 'BUMS'),
(249, 'BAMSPG', 'BAMSPG', 'M.D. Ayurved'),
(251, 'MPTH', 'MPTH', 'PG Physiotherapy'),
(252, 'MSC', 'MSC', 'PG Nursing'),
(254, 'UNPG', 'UNPG', 'PG Unani'),
(255, 'MOTH', 'MOTH', 'PG Occupational Therapy'),
(256, 'ME', 'TCM', 'Textile Chemistry'),
(257, 'ME', 'TTX', 'Technical Textile'),
(258, 'ME', 'HPT', 'Heat Power & Thermal  Engineering'),
(259, 'PBSCN', 'PBSCN', 'PBSCN'),
(260, 'BDSPG', 'BDSPG', 'BDSPG'),
(261, 'MDMS', 'MDMS', 'MDMS'),
(262, 'BHMSPG', 'BHMSPG', 'PG Homeopathic'),
(263, 'RANM', 'RANM', 'RANM Nursing'),
(264, 'BDSH', 'BDSH', 'Dental Hygienist'),
(265, 'RGNM', 'RGNM', 'RGNM Nursing'),
(266, 'BDSM', 'BDSM', 'Dental Mechanic'),
(267, 'AA', 'AA', 'Applied Arts'),
(268, 'AN', 'AN', 'Animation'),
(269, 'DPHARM', 'DPHARM', 'D.Pharmacy'),
(270, 'MHMCT', 'MHMCT', 'M.HMCT'),
(271, 'DHMCT', 'DHMCT', 'D.HMCT'),
(272, 'DMLT', 'DMLT', 'DMLT'),
(273, 'PGDIP', 'PGDIPF', 'PGDM/PGDBM (Full Time 2 years)'),
(274, 'PGDIP', 'PGDIPP', 'PGDM/PGDBM (Part Time 1 year)'),
(275, 'POLY', 'D1', 'Architecture'),
(276, 'POLY', 'D2', 'Architecture Assistantship'),
(277, 'POLY', 'D3', 'Automobile Engineering'),
(278, 'POLY', 'D4', 'Chemical Engineering'),
(279, 'POLY', 'D5', 'Civil & Rural Engineering'),
(280, 'POLY', 'D6', 'Civil Engg.(Sandwitch Pattern)'),
(281, 'POLY', 'D7', 'Civil Engineering'),
(282, 'POLY', 'D8', 'Computer Engineering'),
(283, 'POLY', 'D9', 'Computer Engineering (P.T.)'),
(284, 'POLY', 'D10', 'Computer Engineering.(Ind./Int.)'),
(285, 'POLY', 'D11', 'Computer Science & Engineering'),
(286, 'POLY', 'D12', 'Computer Technology'),
(287, 'POLY', 'D13', 'Construction Technology'),
(288, 'POLY', 'D14', 'Digital Electronics'),
(289, 'POLY', 'D15', 'Dress Designing & Garment Manufacturing'),
(290, 'POLY', 'D16', 'Electrical Engineering '),
(291, 'POLY', 'D17', 'Electrical Power System'),
(292, 'POLY', 'D18', 'Electronics'),
(293, 'POLY', 'D19', 'Electronics & Telecommunication Engineering'),
(294, 'POLY', 'D20', 'Electronics & Telecommunications'),
(295, 'POLY', 'D21', 'Electronics & Video Engineering'),
(296, 'POLY', 'D22', 'Electronics Engg.(Industry Integrated)'),
(297, 'POLY', 'D23', 'Electronics Engineering'),
(298, 'POLY', 'D24', 'Fabrication Technology & Erection Engg (Sandwitch Pattern)'),
(299, 'POLY', 'D25', 'Fashion & clothing Technology'),
(300, 'POLY', 'D26', 'Food Technology'),
(301, 'POLY', 'D27', 'Garment Technology'),
(302, 'POLY', 'D28', 'Industrial Electronics'),
(303, 'POLY', 'D29', 'Information Technology'),
(304, 'POLY', 'D30', 'Instrumentation '),
(305, 'POLY', 'D31', 'Instrumentation  & control'),
(306, 'POLY', 'D32', 'Mechanical Engg(Industry Intrgrated)'),
(307, 'POLY', 'D33', 'Mechanical Engg(Sandwitch Pattern)'),
(308, 'POLY', 'D34', 'Mechanical Engineering'),
(309, 'POLY', 'D35', 'Medical Electronics'),
(310, 'POLY', 'D36', 'Medical Laboratory Technology'),
(311, 'POLY', 'D37', 'Mine Engineering'),
(312, 'POLY', 'D38', 'Mining & mine Suveying '),
(313, 'POLY', 'D39', 'Plastic engineering'),
(314, 'POLY', 'D40', 'Printing Technology'),
(315, 'POLY', 'D41', 'Production Engineering'),
(316, 'POLY', 'D42', 'Production Technology'),
(317, 'POLY', 'D43', 'Surface Coating Technology'),
(318, 'POLY', 'D44', 'Textile Manufactures'),
(319, 'POLY', 'D45', 'Textile Technology'),
(320, 'POLY', 'D46', 'Travel And Tourism'),
(321, 'MCM', 'MCM', 'Master of Computer Management'),
(322, 'MPM', 'MPM', 'Masters in Personnel Management'),
(323, 'PGDIP', 'MBS', 'Master of Business Studies'),
(324, 'POLY', 'D47', 'Electronics and Communication Engineering'),
(325, 'MMM', 'MMM', 'Masters in Marketing Management'),
(326, 'MMM', 'MFM', 'Masters in Financial Management '),
(327, 'MMM', 'MHRDM', 'Master In humman Research Development Management'),
(328, 'MMM', 'MIM', 'Master In Information Management'),
(329, 'ME', 'STD', 'Structural Design'),
(330, 'POLY', 'D48', 'Electrical & Electronic - Power System'),
(331, 'PGDIP', 'PGDCMM', 'Post Graduate Diploma in Capital Market Management'),
(332, 'PGDIP', 'PGDIEM', 'Post Graduate Diploma in Import and Export Management'),
(333, 'PGDIP', 'PGDMLM', 'Post Graduate Diploma in Materials and Logistics Management'),
(334, 'ME', 'WREN', 'Water Resources and Environment Engineering'),
(335, 'ME', 'MEAT', 'Automation'),
(336, 'ME', 'CNIS', 'Computer Networks & Information Security'),
(337, 'ME', 'EDAC', 'Electrical drives and Control'),
(338, 'ENGG', 'MECHA', 'Mechatronics Engineering'),
(339, 'MCA', 'MCD', 'Dual Degree in MCA'),
(340, 'POLY', 'D49', 'Electronics & Communication Technology'),
(341, 'POLY', 'D50', 'Fabrication Technology & Erection Engg'),
(342, 'MBA', 'MHD', 'M.B.A.(Human Resource Development)'),
(343, 'POLY', 'D51', 'Mining Engineering'),
(347, 'MB', 'MB', 'Management'),
(350, 'MT', 'MT', 'Medical transcription'),
(351, 'PGMBMP', 'PGDBM/MBS/MPM', 'PGDBM/MBS/MPM'),
(352, 'POLY2', 'POLY2', 'Polytechnic'),
(353, 'DTL', 'DTL', 'Diploma in Taxation Law'),
(354, 'ME', 'CEE', 'Civil Environmental Engineering'),
(355, 'MBAPT', 'MBPT', 'M.B.A Part Time'),
(356, 'MBAPT', 'MFMT', 'Masters in Financial Mgmt'),
(357, 'MBAPT', 'MHRT', 'M.B.A.(Human Resource Development)'),
(358, 'MBAPT', 'MMIT', 'Master in Information Mgmt'),
(359, 'MBAPT', 'MMMT', 'M.B.A.(Marketing Management)'),
(360, 'MCADD', 'MCADD', 'Dual Degree in MCA'),
(361, 'ME', 'FPT', 'Food Processing Technology'),
(362, 'ME', 'ICW', 'Information Technology (Information and Cyber Warfare)'),
(363, 'MBAPT', 'MBAIT', 'MBA (Information Technology)'),
(364, 'MPH', 'UD', 'Urban Design'),
(365, 'MARC', 'PMC', 'Project Management Courses'),
(367, 'LLB5', 'LLB5', 'Bachelor of Laws (5 Years)'),
(366, 'LLB3', 'LLB3', 'Bachelor of Laws (3 Years)'),
(368, 'LLB3', 'LLB3A', '1st Year - A division'),
(369, 'LLB3', 'LLB3B', '1st Year - B division'),
(370, 'LLB3', 'LLB3C', '1st Year - C division'),
(371, 'LLB3', 'LLB3D', '1st Year - D division'),
(372, 'LLB5', 'LLB5A', '1st Year - A division'),
(373, 'LLB5', 'LLB5B', '1st Year - B division'),
(374, 'LLB5', 'LLB5C', '1st Year - C division'),
(375, 'LLB5', 'LLB5D', '1st Year - D division'),
(376, 'POLY', 'D52', 'Rubber Technology'),
(377, 'PHARMD', 'PHARMD', 'Doctor of Pharmacy'),
(379, 'MCA', 'IMCA', 'Integrated MCA'),
(380, 'BSCA', 'BSCA', 'BSC Agriculture'),
(381, 'BSCH', 'BSCH', 'BSC Horticulture '),
(382, 'BSCF', 'BSCF', 'BSC Forestry'),
(383, 'BIOT', 'BIOT', 'B.Tech Bio Technology'),
(384, 'FOODT', 'FOODT', 'B. Tech Food Technology'),
(385, 'BTECHA', 'BTECHA', 'B. Tech Agriculture Engineering'),
(386, 'BSCCS', 'BSCCS', 'BSC Community Science'),
(399, 'ME', 'Power', 'Power System'),
(396, 'BSCAH', 'BSCAH', ' B.Sc. (Honours) (Animal Husbandry)'),
(398, 'ME', 'CAD/CAM', 'CAD/CAM Engineering'),
(401, 'SSP', 'DM', 'DM'),
(402, 'SSP', 'MCH', 'MCH'),
(403, 'ENGG', 'COEAI', 'Computer Science and Engineering (Artificial Intelligence)'),
(404, 'ENGG', 'ECS', 'Electronics and Computer Science'),
(405, 'BABM', 'BABM', 'Agriculture Business Management'),
(407, 'ENGG', 'AIDS', 'Artificial Intelligence and Data Science'),
(408, 'ME', 'AI', 'Artificial Intelligence'),
(409, 'ENGG', 'CSIT', 'Computer Science and Information Technology'),
(410, 'ENGG', 'MEAM', 'Mechanical Engineering AutoMobile'),
(411, 'ME', 'MEAM', 'Mechanical Engineering AutoMobile'),
(412, 'ME', 'MME', 'Mechanical Manufacturing Engineering'),
(413, 'ME', 'PSPE', 'Power Systems And Power Electronics'),
(414, 'ME', 'MET', 'Mechanical Engineering (Thermal)'),
(415, 'ME', 'ESVD', 'Embedded System And VLSI Design'),
(416, 'POLY', 'MECHA', 'MECHATRONICS'),
(417, 'ENGG', 'CSE(AIML)', 'Computer Science and Engineering(Artificial Intelligence and Machine Learning)'),
(418, 'MDMS', 'MD', 'MD- Anaesthesia'),
(419, 'MDMS', 'MDANAESTHESIOLOGY', 'MD-  Anaesthesiology'),
(420, 'MDMS', 'MDANAESTHESIOLOGY_CC', 'MD- Anaesthesiology & Critical Care Med. '),
(421, 'MDMS', 'MDANATOMY', 'MD- Anatomy'),
(422, 'MDMS', 'MD-AM', 'MD- Aviation Medicine / Aerospace Medicine'),
(423, 'MDMS', 'MDBACTERIOLOGY', 'MD- Bacteriology'),
(424, 'MDMS', 'MDBIOCHEMISTRY', 'MD- Biochemistry'),
(425, 'MDMS', 'MDBIOPHYSICS', 'MD-Bio-Physics'),
(426, 'MDMS', 'MDCCM', 'MD- CCM'),
(427, 'MDMS', 'MDCFM', 'MD- Community & Family Medicine'),
(428, 'MDMS', 'MD-C_HA', 'MD- Community & Health Administration'),
(429, 'MDMS', 'MD-CM', 'MD- Community Medicine'),
(430, 'MDMS', 'MDDERMATOLOGY', 'MD- Dermatology'),
(431, 'MDMS', 'MD-DV_L', 'MD-Dermatology venereology & Leprosy'),
(432, 'MDMS', 'MD-EM', 'MD- Emergency Medicine'),
(433, 'MDMS', 'MD-FM', 'MD- Family Medicine'),
(434, 'MDMS', 'MD-FORENSICM', 'MD- Forensic Medicine'),
(435, 'MDMS', 'MD-FM_T', 'MD- Forensic Medicine / Forensic Medicine & Toxicology '),
(436, 'MDMS', 'MD-GM', 'MD- General Medicine'),
(437, 'MDMS', 'MD-GERIATRICS ', 'MD- Geriatrics'),
(438, 'MDMS', 'MD-HA', 'MD- Hospital Administration'),
(439, 'MDMS', 'MD-IH_BT', 'MD- Immuno Haematology & Blood Transfusion'),
(440, 'MDMS', 'MD-LM', 'MD- Lab Medicine'),
(441, 'MDMS', 'MD-MM', 'MD- Marine Medicine'),
(442, 'MDMS', 'MD-M_CH', 'MD- Maternity & Child Health'),
(443, 'MDMS', 'MD-MICROBIOLOGY', 'MD- Microbiology'),
(444, 'MDMS', 'MDMS-ANATOMY', 'MD/MS- Anatomy'),
(445, 'MDMS', 'MDMS-OG', 'MD/MS- Obstetrics & Gynaecology'),
(446, 'MDMS', 'MD-MS-OPHTHA', 'MD/MS- Ophthalmology'),
(447, 'MDMS', 'MD-NM', 'MD- Nuclear Medicine'),
(448, 'MDMS', 'MD-O_G', 'MD- Obstetrics & Gynaecology'),
(449, 'MDMS', 'MD-OPHTHALMOLOGY', 'MD- Ophthalomology'),
(450, 'MDMS', 'MD-PAEDIATRICS', 'MD- Paediatrics'),
(451, 'MDMS', 'MD-PM', 'MD- Palliative Medicine'),
(452, 'MDMS', 'MD-PATHOLOGY', 'MD- Pathology'),
(453, 'MDMS', 'MD-P_LM', 'MD- Pathology & Lab Medicine'),
(454, 'MDMS', 'MD-P_M', 'MD- Pathology & Microbiology'),
(455, 'MDMS', 'MD-PHARMACOLOGY', 'MD- Pharmacology'),
(456, 'MDMS', 'MD_PMR', 'MD- Physical Medicine & Rehabilitation'),
(457, 'MDMS', 'MD-PHYSIOLOGY', 'MD- Physiology'),
(458, 'MDMS', 'MD-PSYCHIATRY', 'MD- Psychiatry'),
(459, 'MDMS', 'MD-PULMONARYM', 'MD- Pulmonary Medicine'),
(460, 'MDMS', 'MD-RONCOLOGY', 'MD- Radiation Oncology'),
(461, 'MDMS', 'MD-RADIODIAGNOSIS', 'MD- Radio Diagnosis'),
(462, 'MDMS', 'MD-RD_RADIOLOGY', 'MD- Radio Diagnosis / Radiology'),
(463, 'MDMS', 'MD-RADIOLOGY', 'MD- Radiology'),
(464, 'MDMS', 'MD-RADIOTHERAPY_RO', 'MD- Radiotherapy / Radiation Oncology'),
(465, 'MDMS', 'MD-RESPIRATORYMED', 'MD- Respiratory Medicine'),
(466, 'MDMS', 'MD-S_PM_CM', 'MD- Social & Preventive Medicine / Community Medicine'),
(467, 'MDMS', 'MD-SPORTSMED', 'MD- Sports Medicine'),
(468, 'MDMS', 'MD-TRANSFUSIONMED', 'MD- Transfusion Medicine'),
(469, 'MDMS', 'MD-TM_BB', 'MD- Transfusion Medicine & Blood Bank'),
(470, 'MDMS', 'MD-TM', 'MD- Tropical Medicine'),
(471, 'MDMS', 'MD-T_RD_PM', 'MD- Tuberculosis & Respiratory Diseases / Pulmonary Medicine'),
(472, 'MDMS', 'MD-VENEREOLOGY', 'MD- Venereology'),
(473, 'MDMS', 'MS-GS', 'MS - General Surgery'),
(474, 'MDMS', 'MS-OTORHINOLARYNGOLO', 'MS - Otorhinolaryngology'),
(475, 'MDMS', 'MS-ORTHOPAEDICS', 'MS - Orthopaedics'),
(476, 'MDMS', 'MS-ENT', 'MS - ENT'),
(477, 'BAMSPG', 'ASS', 'Ayurveda Samhita & Sidhanta'),
(478, 'BAMSPG', 'RS', 'Rachana Sharir'),
(479, 'BAMSPG', 'KS', 'Kriya Sharir'),
(480, 'BAMSPG', 'DGV', 'Dravya Guna Vigyana'),
(481, 'BAMSPG', 'RS_BK', 'Ras Shastra & Bhaishajya Kalpana'),
(482, 'BAMSPG', 'PASR', 'Prasuti avum Stri Roga'),
(483, 'BAMSPG', 'K-BR', 'Kumarbhartiya- Bala Roga'),
(484, 'BAMSPG', 'KAYACHIKITSA', 'Kayachikitsa'),
(485, 'BAMSPG', 'SVY', 'Swastha Vritta & Yoga'),
(486, 'BAMSPG', 'RNAVUMVV', 'Rog Nidan avum Vikriti Vigyana'),
(487, 'BAMSPG', 'S-SAMANYA', 'Shalya - Samanya'),
(488, 'BAMSPG', 'KKAVUMAK', 'Kshar Karma avum Anushastra Karma'),
(489, 'BAMSPG', 'SNR', 'Shalakya - Netro Roga'),
(490, 'BAMSPG', 'SS-NKAVUMKROGA', 'Shalakya: Shiro - Nasa Karna avum Kantha Roga'),
(491, 'BAMSPG', 'SDAVUMMR', 'Shalakya Danta avum Mukha Roga'),
(492, 'BAMSPG', 'MVAVUMMR', 'Mano Vigyan avum Manas Roga'),
(493, 'BAMSPG', 'PANCHKARMA', 'Panchkarma'),
(494, 'BAMSPG', 'ATAVUMVV', 'Agad Tantra avum Vidhi Vaidyaka'),
(495, 'BAMSPG', 'SANGYAHARANA', 'Sangyaharana'),
(496, 'BAMSPG', 'CAVUMVV', 'Chhaya avum Vikiran Vigyan'),
(497, 'BAMSPG', 'AS_M', 'Asthi Sandhi & Marmagat'),
(498, 'BAMSPG', 'RV', 'Rasayan & Vajikaran'),
(499, 'BDSPG', 'P_CROWN_B', 'Prosthodontics and Crown & Bridge'),
(500, 'BDSPG', 'CDEn', 'Conservative Dentistry and Endodontics'),
(501, 'BDSPG', 'PERIODONTOLOGY', 'Periodontology'),
(502, 'BDSPG', 'O_DO', 'Orthodontics & Dentofacial Orthopedics'),
(503, 'BDSPG', 'OMS', 'Oral & Maxillofacial Surgery'),
(504, 'BDSPG', 'OMP_OM', 'Oral & Maxillofacial Pathology and Oral Microbiology'),
(505, 'BDSPG', 'OMR', 'Oral Medicine & Radiology'),
(506, 'BDSPG', 'PEDIATRIC DENTISTRY', 'Pediatric Dentistry'),
(507, 'BDSPG', 'PUBLIC HEALTH DENTIS', 'Public Health Dentistry'),
(508, 'BHMSPG', 'OMHP', 'Organon of Medicine with Homeopathic Philosophy'),
(509, 'BHMSPG', 'HMM', 'Homoeopathic Materia Medica'),
(510, 'BHMSPG', 'REPERTORY', 'Repertory'),
(511, 'BHMSPG', 'PM', 'Practice of Medicine'),
(512, 'BHMSPG', 'HP', 'Homoeopathic Pharmacy'),
(513, 'BHMSPG', 'PEDIATRICS', 'Pediatrics'),
(514, 'BHMSPG', 'PSYCHIATRY', 'Psychiatry'),
(515, 'ENGG', 'CYBER SECURITY', 'Cyber Security'),
(516, 'ENGG', 'AIML', 'Artificial Intelligence and Machine Learning'),
(517, 'ENGG', 'CSE_DS', 'Computer Science and Engineering(Data Science)	'),
(518, 'BAMSPG', 'PGD_PTS', 'PG Diploma-Prasuti Tantra Strirog '),
(519, 'AA', 'BFAPAINTING', 'BFA (Painting)'),
(520, 'ME', 'CASAD ', 'Computer Aided Structural Analysis and Design'),
(521, 'ME', 'DATA_SCIENCE', 'DATA SCIENCE'),
(522, 'ENGG', 'AUTO_ROBO', 'Automation and Robotics'),
(523, 'ENGG', 'ECENGG', 'ELECTRONICS AND COMPUTER ENGINEERING'),
(524, 'ENGG', 'SENGG', 'Structural Engineering'),
(525, 'ENGG', 'AI', 'Artificial Intelligence'),
(526, 'ENGG', 'DS', 'Data Science'),
(527, 'ME', 'MININGENGG', 'Mining Engineering'),
(528, 'ENGG', 'IOT', 'Internet of Things (IoT)'),
(529, 'ENGG', 'CABS', 'Computer Science and Business Systems'),
(530, 'ENGG', 'CSE_AIML', 'Computer Science and Engineering(Artificial Intelligence and Machine Learning)'),
(531, 'ENGG', 'CSEITCSBC', 'Computer Science Engineering (Internet of things and cyber security with block chain technology)'),
(532, 'BDES', 'BDES', 'Bachelor of Design'),
(533, 'ENGG', 'SFE', 'Safety and Fire Engineering'),
(534, 'ENGG', 'RAA', 'Robotics and Automation'),
(535, 'ENGG', 'CSECS', 'COMPUTER SCIENCE AND ENGINEERING (CYBER SECURITY)'),
(536, 'ENGG', 'MMEAM', 'MECHANICAL AND MECHATRONICS ENGINEERING(ADDITIVE MANUFACTURING)'),
(537, 'ME', 'ECWCT', 'Electronics & Communication (Wireless Communication Technology)'),
(538, 'ME', 'AIDSCIENCE', 'Artificial Intelligence and Data Science'),
(539, 'ME', 'INFORMATION SECURITY', 'Information Security'),
(540, 'MBA', 'MBA_DM', 'MBA-Digital Marketing'),
(541, 'ENGG', 'CSD', 'Computer Science and Design'),
(542, 'ENGG', 'CEENGG', 'Civil and Environmental Engineering'),
(543, 'ME', 'ROBOTICS AND AUTOMAT', 'Robotics and Automation'),
(544, 'ENGG', 'AUTOMOTIVE TECHNOLOG', 'Automotive Technology'),
(545, 'ME', 'CE_CASE', 'Civil Engineering (Computer Aided Structural Engineering)'),
(546, 'ENGG', 'INDUSTRIAL IOT', 'Industrial IOT'),
(547, 'ENGG', 'RAI', 'Robotics and Artificial Intelligence'),
(548, 'ME', 'DEFENCE TECHNOLOGY', 'Defence Technology'),
(549, 'MBA', 'MBA_IEVD', 'MBA(INNOVATION ENTREPRENEURSHIP AND VENTURE DEVELOPMENT)'),
(550, 'ENGG', 'CE_RL', 'Computer Engineering (Regional Language)'),
(551, 'MBAI', 'MBAI', 'MBA Integrated'),
(552, 'MBA', 'MBA_PM', 'MBA PROJECT MANAGEMENT'),
(553, 'MBA', 'MBA_FT', 'MBA FIN TECH'),
(554, 'ME', 'CS', 'CYBER SECURITY'),
(555, 'ME', 'TEXTILEENGG', 'Textile Engineering'),
(556, 'ENGG', 'ELECTCENGG', 'Electrical and Computer Engineering'),
(557, 'MPH', 'MPHQA', 'Pharmaceutical Quality Assurance'),
(558, 'MBA', 'MBA_SM', 'MBA Service Management'),
(559, 'ENGG', 'CEI', 'Civil and Infrastructure Engineering');

-- --------------------------------------------------------

--
-- Table structure for table `curriculums`
--

CREATE TABLE `curriculums` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pdf_link` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `slug_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` bigint NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `curriculums`
--

INSERT INTO `curriculums` (`id`, `title`, `sub_title`, `pdf_link`, `image`, `slug_name`, `order_id`, `status`, `created_at`, `updated_at`) VALUES
(3, 'Circular 3', 'Circular 2', 'https://msihmctrs.s3.ap-south-1.amazonaws.com/fra/dummypdf', 'https://images.ctfassets.net/hrltx12pl8hq/28ECAQiPJZ78hxatLTa7Ts/2f695d869736ae3b0de3e56ceaca3958/free-nature-images.jpg?fit=fill&w=1200&h=630', 'hell12345o', 111, 1, '2024-07-12 00:19:35', '2024-09-11 06:25:43'),
(4, 'abc', 'def', 'https://msihmctrs.s3.ap-south-1.amazonaws.com/fra/dummypdf', 'https://msihmctrs.s3.ap-south-1.amazonaws.com/fra/WhatsAppImage20240328at50602PM2jpeg', NULL, 4, 1, '2024-07-23 00:09:22', '2024-09-11 06:19:59'),
(5, 'test 1', 'sub test', 'https://fra-bucket-1.s3.ap-south-1.amazonaws.com/uploads/dummypdf', 'https://msihmctrs.s3.ap-south-1.amazonaws.com/fra/WhatsAppImage20240328at50602PM2jpeg', NULL, 5, 1, '2024-07-23 02:16:55', '2024-07-25 01:19:24');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `failed_jobs`
--

INSERT INTO `failed_jobs` (`id`, `uuid`, `connection`, `queue`, `payload`, `exception`, `failed_at`) VALUES
(1, 'c472dec4-a0e2-43d1-9db1-6b4fefda4079', 'database', 'default', '{\"uuid\":\"c472dec4-a0e2-43d1-9db1-6b4fefda4079\",\"displayName\":\"App\\\\Jobs\\\\SendEmailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendEmailJob\",\"command\":\"O:21:\\\"App\\\\Jobs\\\\SendEmailJob\\\":1:{s:7:\\\"\\u0000*\\u0000data\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:20:\\\"App\\\\Models\\\\Grievance\\\";s:2:\\\"id\\\";i:26;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}\"}}', 'ErrorException: Attempt to read property \"id\" on null in /home/amit/Documents/FRA/FRAWeb_backend/app/Jobs/SendEmailJob.php:56\nStack trace:\n#0 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Foundation/Bootstrap/HandleExceptions.php(256): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError()\n#1 /home/amit/Documents/FRA/FRAWeb_backend/app/Jobs/SendEmailJob.php(56): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->Illuminate\\Foundation\\Bootstrap\\{closure}()\n#2 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): App\\Jobs\\SendEmailJob->handle()\n#3 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#4 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#5 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#6 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Container/Container.php(690): Illuminate\\Container\\BoundMethod::call()\n#7 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(128): Illuminate\\Container\\Container->call()\n#8 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#9 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#10 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then()\n#11 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(124): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#12 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#13 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#14 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(123): Illuminate\\Pipeline\\Pipeline->then()\n#15 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(71): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#16 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call()\n#17 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(439): Illuminate\\Queue\\Jobs\\Job->fire()\n#18 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(389): Illuminate\\Queue\\Worker->process()\n#19 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(176): Illuminate\\Queue\\Worker->runJob()\n#20 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(139): Illuminate\\Queue\\Worker->daemon()\n#21 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(122): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#22 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#23 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#24 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#25 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#26 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Container/Container.php(690): Illuminate\\Container\\BoundMethod::call()\n#27 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Console/Command.php(213): Illuminate\\Container\\Container->call()\n#28 /home/amit/Documents/FRA/FRAWeb_backend/vendor/symfony/console/Command/Command.php(279): Illuminate\\Console\\Command->execute()\n#29 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Console/Command.php(182): Symfony\\Component\\Console\\Command\\Command->run()\n#30 /home/amit/Documents/FRA/FRAWeb_backend/vendor/symfony/console/Application.php(1047): Illuminate\\Console\\Command->run()\n#31 /home/amit/Documents/FRA/FRAWeb_backend/vendor/symfony/console/Application.php(316): Symfony\\Component\\Console\\Application->doRunCommand()\n#32 /home/amit/Documents/FRA/FRAWeb_backend/vendor/symfony/console/Application.php(167): Symfony\\Component\\Console\\Application->doRun()\n#33 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(196): Symfony\\Component\\Console\\Application->run()\n#34 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Foundation/Application.php(1203): Illuminate\\Foundation\\Console\\Kernel->handle()\n#35 /home/amit/Documents/FRA/FRAWeb_backend/artisan(13): Illuminate\\Foundation\\Application->handleCommand()\n#36 {main}', '2024-08-22 06:10:36'),
(2, '988b35ab-bd3a-43c7-95e1-7e6632c71226', 'database', 'default', '{\"uuid\":\"988b35ab-bd3a-43c7-95e1-7e6632c71226\",\"displayName\":\"App\\\\Jobs\\\\SendEmailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendEmailJob\",\"command\":\"O:21:\\\"App\\\\Jobs\\\\SendEmailJob\\\":1:{s:7:\\\"\\u0000*\\u0000data\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:20:\\\"App\\\\Models\\\\Grievance\\\";s:2:\\\"id\\\";i:27;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}\"}}', 'ErrorException: Attempt to read property \"id\" on null in /home/amit/Documents/FRA/FRAWeb_backend/app/Jobs/SendEmailJob.php:56\nStack trace:\n#0 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Foundation/Bootstrap/HandleExceptions.php(256): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError()\n#1 /home/amit/Documents/FRA/FRAWeb_backend/app/Jobs/SendEmailJob.php(56): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->Illuminate\\Foundation\\Bootstrap\\{closure}()\n#2 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): App\\Jobs\\SendEmailJob->handle()\n#3 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#4 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#5 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#6 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Container/Container.php(690): Illuminate\\Container\\BoundMethod::call()\n#7 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(128): Illuminate\\Container\\Container->call()\n#8 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#9 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#10 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then()\n#11 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(124): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#12 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#13 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#14 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(123): Illuminate\\Pipeline\\Pipeline->then()\n#15 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(71): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#16 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call()\n#17 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(439): Illuminate\\Queue\\Jobs\\Job->fire()\n#18 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(389): Illuminate\\Queue\\Worker->process()\n#19 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(176): Illuminate\\Queue\\Worker->runJob()\n#20 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(139): Illuminate\\Queue\\Worker->daemon()\n#21 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(122): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#22 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#23 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#24 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#25 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#26 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Container/Container.php(690): Illuminate\\Container\\BoundMethod::call()\n#27 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Console/Command.php(213): Illuminate\\Container\\Container->call()\n#28 /home/amit/Documents/FRA/FRAWeb_backend/vendor/symfony/console/Command/Command.php(279): Illuminate\\Console\\Command->execute()\n#29 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Console/Command.php(182): Symfony\\Component\\Console\\Command\\Command->run()\n#30 /home/amit/Documents/FRA/FRAWeb_backend/vendor/symfony/console/Application.php(1047): Illuminate\\Console\\Command->run()\n#31 /home/amit/Documents/FRA/FRAWeb_backend/vendor/symfony/console/Application.php(316): Symfony\\Component\\Console\\Application->doRunCommand()\n#32 /home/amit/Documents/FRA/FRAWeb_backend/vendor/symfony/console/Application.php(167): Symfony\\Component\\Console\\Application->doRun()\n#33 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(196): Symfony\\Component\\Console\\Application->run()\n#34 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Foundation/Application.php(1203): Illuminate\\Foundation\\Console\\Kernel->handle()\n#35 /home/amit/Documents/FRA/FRAWeb_backend/artisan(13): Illuminate\\Foundation\\Application->handleCommand()\n#36 {main}', '2024-08-22 06:18:10'),
(3, '3ec97f3f-e4ef-422c-a819-a54aecb951fc', 'database', 'default', '{\"uuid\":\"3ec97f3f-e4ef-422c-a819-a54aecb951fc\",\"displayName\":\"App\\\\Jobs\\\\SendEmailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendEmailJob\",\"command\":\"O:21:\\\"App\\\\Jobs\\\\SendEmailJob\\\":1:{s:7:\\\"\\u0000*\\u0000data\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:20:\\\"App\\\\Models\\\\Grievance\\\";s:2:\\\"id\\\";i:28;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}\"}}', 'ErrorException: Attempt to read property \"id\" on null in /home/amit/Documents/FRA/FRAWeb_backend/app/Jobs/SendEmailJob.php:57\nStack trace:\n#0 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Foundation/Bootstrap/HandleExceptions.php(256): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError()\n#1 /home/amit/Documents/FRA/FRAWeb_backend/app/Jobs/SendEmailJob.php(57): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->Illuminate\\Foundation\\Bootstrap\\{closure}()\n#2 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): App\\Jobs\\SendEmailJob->handle()\n#3 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#4 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#5 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#6 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Container/Container.php(690): Illuminate\\Container\\BoundMethod::call()\n#7 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(128): Illuminate\\Container\\Container->call()\n#8 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#9 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#10 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then()\n#11 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(124): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#12 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#13 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#14 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(123): Illuminate\\Pipeline\\Pipeline->then()\n#15 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(71): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#16 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call()\n#17 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(439): Illuminate\\Queue\\Jobs\\Job->fire()\n#18 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(389): Illuminate\\Queue\\Worker->process()\n#19 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(176): Illuminate\\Queue\\Worker->runJob()\n#20 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(139): Illuminate\\Queue\\Worker->daemon()\n#21 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(122): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#22 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#23 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#24 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#25 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#26 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Container/Container.php(690): Illuminate\\Container\\BoundMethod::call()\n#27 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Console/Command.php(213): Illuminate\\Container\\Container->call()\n#28 /home/amit/Documents/FRA/FRAWeb_backend/vendor/symfony/console/Command/Command.php(279): Illuminate\\Console\\Command->execute()\n#29 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Console/Command.php(182): Symfony\\Component\\Console\\Command\\Command->run()\n#30 /home/amit/Documents/FRA/FRAWeb_backend/vendor/symfony/console/Application.php(1047): Illuminate\\Console\\Command->run()\n#31 /home/amit/Documents/FRA/FRAWeb_backend/vendor/symfony/console/Application.php(316): Symfony\\Component\\Console\\Application->doRunCommand()\n#32 /home/amit/Documents/FRA/FRAWeb_backend/vendor/symfony/console/Application.php(167): Symfony\\Component\\Console\\Application->doRun()\n#33 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(196): Symfony\\Component\\Console\\Application->run()\n#34 /home/amit/Documents/FRA/FRAWeb_backend/vendor/laravel/framework/src/Illuminate/Foundation/Application.php(1203): Illuminate\\Foundation\\Console\\Kernel->handle()\n#35 /home/amit/Documents/FRA/FRAWeb_backend/artisan(13): Illuminate\\Foundation\\Application->handleCommand()\n#36 {main}', '2024-08-22 06:22:33');

-- --------------------------------------------------------

--
-- Table structure for table `homemenu`
--

CREATE TABLE `homemenu` (
  `id` bigint UNSIGNED NOT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `order` int NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `homemenu`
--

INSERT INTO `homemenu` (`id`, `label`, `url`, `parent_id`, `order`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Home', '/', NULL, 1, 1, NULL, NULL),
(2, 'About', '#', NULL, 2, 1, NULL, NULL),
(3, 'Admission', '#', NULL, 3, 1, NULL, NULL),
(4, 'Departments', '#', NULL, 4, 1, NULL, NULL),
(5, 'Facilities', '#', NULL, 5, 1, NULL, NULL),
(6, 'Student Corner', '#', NULL, 6, 1, NULL, NULL),
(7, 'TPO', '#', NULL, 7, 1, NULL, NULL),
(8, 'CDC', '#', NULL, 8, 1, NULL, NULL),
(9, 'eNewsLetter', '#', NULL, 9, 1, NULL, NULL),
(10, 'Gallery', '#', NULL, 10, 1, NULL, NULL),
(11, 'GPK MIS', '#', NULL, 11, 1, NULL, NULL),
(12, 'Alumni', '#', NULL, 12, 1, NULL, NULL),
(13, 'Online Grievance', '/online-grievance', NULL, 13, 1, NULL, NULL),
(14, 'Contact Us', '/contact-us', NULL, 14, 1, NULL, NULL),
(15, 'About Us', '/about-us', 2, 1, 1, NULL, NULL),
(16, 'Vision & Mission', '/vision-mission', 2, 2, 1, NULL, NULL),
(17, 'Principal’s Message', '/principals-message', 2, 3, 1, NULL, NULL),
(18, 'Organizational Structure', '/organizational-structure', 2, 4, 1, NULL, NULL),
(19, 'Administrative Bodies', '/administrative-bodies', 2, 5, 1, NULL, NULL),
(20, 'NBA Accreditation', '/accreditation', 2, 6, 1, NULL, NULL),
(21, 'Infrastructure', '/infrastructure-and-facilities', 2, 7, 1, NULL, NULL),
(22, 'Continuing Education Programme', '/continuing-education-programme', 2, 8, 1, NULL, NULL),
(23, 'Administrative Section', '/administrative-section-3', 2, 9, 1, NULL, NULL),
(24, 'Committee', '/committee', 2, 10, 1, NULL, NULL),
(25, 'Citizen’s Charter', '/wp-content/uploads/2020/12/cc.pdf', 2, 11, 1, NULL, NULL),
(26, 'DTE Website', 'https://poly24.dtemaharashtra.gov.in/diploma24/', 3, 1, 1, NULL, NULL),
(27, 'Intake Capacity', '/admissions/intake', 3, 2, 1, NULL, NULL),
(28, 'Fee Structure', '/admissions/fee-structure', 3, 3, 1, NULL, NULL),
(29, 'Essential Documents', '/admissions/scholarship', 3, 4, 1, NULL, NULL),
(30, 'Documents Required for Diploma/Degree Admissions', '/wp-content/uploads/2024/05/Diploma-Admission-1.pdf', 3, 5, 1, NULL, NULL),
(31, 'प्रथम वर्ष Post SSC डिप्लोमा प्रवेशाचे वेळापत्रक', '/wp-content/uploads/2024/07/downloaddoc-2.pdf', 3, 6, 1, NULL, NULL),
(32, 'First Year Diploma Admission Process', '/wp-content/uploads/2024/05/eng_notice.pdf', 3, 7, 1, NULL, NULL),
(33, 'दिव्यांग प्रवेश', '/wp-content/uploads/2024/06/divyang-admission-notice.pdf', 3, 8, 1, NULL, NULL),
(34, 'Documentary Films Of Diploma', '/documentary-films-of-diploma', 3, 9, 1, NULL, NULL),
(35, 'Academic Departments', '#', 4, 1, 1, NULL, NULL),
(36, 'Supporting Dept And Cell', '/supporting-dept-and-cell', 4, 2, 1, NULL, NULL),
(37, 'Exam Cell', '/exam', 4, 3, 1, NULL, NULL),
(38, 'Hostel', '/admissions/hostel', 5, 1, 1, NULL, NULL),
(39, 'Library Section', '/library-section', 5, 2, 1, NULL, NULL),
(40, 'Gymkhana', '/gymkhana', 5, 3, 1, NULL, NULL),
(41, 'Students Co-Operative Store', '/students-co-operative-store', 5, 4, 1, NULL, NULL),
(42, 'NSS', '/nss', 5, 5, 1, NULL, NULL),
(43, 'EDP Cell', '/edp-cell', 7, 1, 1, NULL, NULL),
(44, 'TPO Cell', '/tpo-cell', 7, 2, 1, NULL, NULL),
(45, 'ISTE Chapter', '/isce-chapter', 7, 3, 1, NULL, NULL),
(46, 'CDC Cell', '/cdc-cell', 8, 1, 1, NULL, NULL),
(47, 'Curriculum Philosophy', '/curriculum-philosophy', 8, 2, 1, NULL, NULL),
(48, 'Curriculum Overview', '/curriculum-overview', 8, 3, 1, NULL, NULL),
(49, 'OBLTA PROFORMAS', '/wp-content/uploads/2022/08/GPKP-OB-LAT-Proformas-2020.pdf', 8, 4, 1, NULL, NULL),
(50, 'Information Technology', '/wp-content/uploads/2022/12/Final_Magazine.pdf', 9, 1, 1, NULL, NULL),
(51, 'Electronics and Telecommunication', '#', 9, 2, 1, NULL, NULL),
(52, 'Applied Mechanics', '/wp-content/uploads/2022/12/Issue-2021-22-watermark-final.pdf', 9, 3, 1, NULL, NULL),
(53, 'eNewsletter-GPKP-ENTC-Volume-I', '/wp-content/uploads/2022/12/e-Newsletter-GPKP-ENTC-Volume-I-1.pdf', 16, 1, 1, NULL, NULL),
(54, 'eNewsletter_GPKP_ENTC_Volume_II', '/wp-content/uploads/2022/12/e-Newsletter_GPKP_ENTC_Volume_II-1.pdf', 16, 2, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `home_page_slider`
--

CREATE TABLE `home_page_slider` (
  `id` int NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alternate_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_id` tinyint NOT NULL,
  `header` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `subHeader` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `home_page_slider`
--

INSERT INTO `home_page_slider` (`id`, `image`, `alternate_name`, `order_id`, `header`, `subHeader`, `status`, `created_at`, `updated_at`) VALUES
(16, 'https://msihmctrs.s3.ap-south-1.amazonaws.com/fra/WhatsApp%20Image%202024-03-28%20at%205.06.02%20PM%20%284%29.jpeg', '15-slider', 1, NULL, NULL, 0, '2024-07-17 08:04:31', '2024-09-12 12:05:26'),
(17, 'https://msihmctrs.s3.ap-south-1.amazonaws.com/fra/sliderimg.png', '17-slider', 3, NULL, NULL, 1, '2024-07-18 03:48:22', '2024-09-12 12:05:44'),
(20, 'https://msihmctrs.s3.ap-south-1.amazonaws.com/fra/WhatsAppImage20240328at50602PM2jpeg', '18-slider', 2, NULL, NULL, 0, '2024-07-23 01:16:50', '2024-09-12 12:05:44'),
(21, 'https://msihmctrs.s3.ap-south-1.amazonaws.com/fra/WhatsAppImage20240328at50602PM2jpeg', '21-slider', 4, NULL, NULL, 0, '2024-07-25 00:06:28', '2024-09-12 12:05:26'),
(22, 'https://fra-bucket-1.s3.ap-south-1.amazonaws.com//uploadsWhatsAppImage20240328at50602PM2jpeg', '22-slider', 6, NULL, NULL, 0, '2024-07-25 00:11:06', '2024-09-12 12:05:44'),
(23, 'https://fra-bucket-1.s3.ap-south-1.amazonaws.com/uploads/sliderimgpng', '23-slider', 5, NULL, NULL, 1, '2024-07-29 00:20:25', '2024-09-12 12:05:44');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `latest_update`
--

CREATE TABLE `latest_update` (
  `id` int NOT NULL,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `order_id` tinyint NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `latest_update`
--

INSERT INTO `latest_update` (`id`, `title`, `slug_name`, `link`, `order_id`, `status`, `created_at`, `updated_at`) VALUES
(3, 'Committee against Sexual Harassment (Internal Complaints Committee)', NULL, 'photos/latestupdate/1711102499-committee-against-sexual-harassment-internal-complaints-committee.pdf', 1, 1, '2024-03-05 01:53:54', '2024-09-12 12:01:27'),
(4, 'Mentor Mentee List First Year B. Tech 2023-24', NULL, 'https://msihmctrs.s3.ap-south-1.amazonaws.com/fra/AdmissionHSC.pdf', 2, 1, '2024-03-05 01:54:25', '2024-09-12 12:01:27'),
(19, 'qwert', NULL, 'https://msihmctrs.s3.ap-south-1.amazonaws.com/fra/dummypdf', 3, 0, '2024-07-23 02:16:34', '2024-09-12 12:01:27');

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtitle` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `link` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_id` tinyint NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`id`, `title`, `subtitle`, `link`, `image`, `order_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Hello 3', 'World 3', NULL, 'https://fra-bucket-1.s3.ap-south-1.amazonaws.com/uploads/samialiamaninyPR9SVDeEunsplashjpg1722600139887', 2, 1, '2024-08-02 11:59:16', '2024-09-12 12:09:30'),
(3, 'Hello 1', 'World 1', NULL, 'https://fra-bucket-1.s3.ap-south-1.amazonaws.com/uploads/threeedilWM5VxkuVwg8unsplashjpg1722600475202', 1, 1, '2024-08-02 12:07:56', '2024-09-12 12:09:30');

-- --------------------------------------------------------

--
-- Table structure for table `news_and_events`
--

CREATE TABLE `news_and_events` (
  `id` int NOT NULL,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_id` tinyint NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `news_and_events`
--

INSERT INTO `news_and_events` (`id`, `title`, `image`, `order_id`, `status`, `created_at`, `updated_at`) VALUES
(13, 'abc', 'https://msihmctrs.s3.ap-south-1.amazonaws.com/fra/WhatsAppImage20240328at50602PM2jpeg', 1, 1, '2024-07-23 01:17:15', '2024-09-12 12:12:24'),
(15, 'abcdef', 'https://fra-bucket-1.s3.ap-south-1.amazonaws.com/uploads/backgroundlaptopjpg1726038551607', 2, 1, '2024-09-11 07:07:42', '2024-09-12 12:12:24');

-- --------------------------------------------------------

--
-- Table structure for table `notice_boards`
--

CREATE TABLE `notice_boards` (
  `id` int NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_id` tinyint NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notice_boards`
--

INSERT INTO `notice_boards` (`id`, `title`, `slug_name`, `link`, `order_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Notification for Post Matric Scholarship of GOI ** Click Here**', NULL, 'photos/noticeBoard/1711106678-1-noticeBoard.pdf', 1, 0, '2024-03-22 04:44:33', '2024-07-25 00:50:58'),
(2, 'Institute Level Admission Round for the candidates who have cleared the supplementary HSC Examination A.Y. 2023-24 ** Click Here **', NULL, 'photos/noticeBoard/1711103609-2-noticeBoard.pdf', 2, 0, '2024-03-22 05:03:29', '2024-07-25 00:50:58'),
(4, 'As per the Government orders all the students above 18 years of age are required to register as voters on the portal https://www.nvsp.in', NULL, 'photos/noticeBoard/1711103653-4-noticeBoard.pdf', 3, 0, '2024-03-22 05:04:13', '2024-09-12 12:14:24'),
(5, 'Anti Ragging Helpline. The students can send e-mail to the Director(director@litnagpur.in) and / or may call freely to the Director on 9422095110/8788713619', NULL, 'photos/noticeBoard/1711103719-5-noticeBoard.pdf', 4, 0, '2024-03-22 05:05:19', '2024-09-12 12:14:24'),
(6, 'Students can enroll for the appointment of a counselor. After enrollment student should meet the Director for finalizing the appointment.** Click Here **', NULL, 'photos/noticeBoard/1711103762-6-noticeBoard.pdf', 5, 0, '2024-03-22 05:06:02', '2024-09-12 12:14:24'),
(7, 'DSY B. TECH INSTITUTE LEVEL ADMISSIONS 2023-24 **Click Here **', NULL, 'photos/noticeBoard/1711103847-7-noticeBoard.pdf', 6, 0, '2024-03-22 05:07:27', '2024-09-12 12:14:24'),
(8, 'National Suicide Prevention Strategy Document ** Click Here **', NULL, 'https://msihmctrs.s3.ap-south-1.amazonaws.com/fra/dummypdf', 7, 0, '2024-03-22 05:09:23', '2024-09-12 12:14:30'),
(10, 'Notice Board 1', NULL, 'https://msihmctrs.s3.ap-south-1.amazonaws.com/fra/dummypdf', 9, 1, '2024-07-23 02:17:22', '2024-09-11 06:23:05'),
(11, 'Test 1', NULL, 'https://fra-bucket-1.s3.ap-south-1.amazonaws.com/uploads/dummypdf', 8, 1, '2024-07-25 00:51:28', '2024-09-12 12:14:30');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('01cd8ab5df121587be09edb0d81293f3f6141cfcb2229079387a413fd518858ad1f2e171a07755f5', 9, 1, 'Personal Access Token', '[]', 0, '2024-07-16 02:43:06', '2024-07-16 02:43:06', '2024-07-16 08:13:06'),
('051f81249c0277bbb073f86c2c2f47376d1ebadbb1f19aa993f6f49982571b6731ecbebbf650e1b0', 10, 1, 'admin', '[]', 1, '2024-07-19 00:48:09', '2024-07-19 03:15:02', '2024-07-19 08:18:09'),
('06beca56833a33f01aaa798940799c68029a4d476d584d4d9868923425dc641f80b3b99a874c3e54', 9, 1, 'Personal Access Token', '[]', 0, '2024-07-16 02:41:27', '2024-07-16 02:41:27', '2024-07-16 08:11:27'),
('0cc1cd6fb31a5db94864402c79ac37685b942307b0f49d0319caa385160075f30000685b451b16a5', 10, 1, 'Admin', '[]', 0, '2024-09-20 05:05:41', '2024-09-20 05:05:41', '2024-09-20 12:35:41'),
('0cd24811eb27c824ebf7ca695dd8461c4d9036f0c4e475eee4995414b52e5b1c21ae5edf61699920', 10, 1, 'admin', '[]', 1, '2024-07-30 05:21:59', '2024-07-30 23:45:41', '2024-07-30 12:51:59'),
('12c3a30290794a1780ff77af088b67b9d454bcf5899b669a6258b799fe2f5bdea003c62926a341b7', 9, 1, 'admin', '[]', 1, '2024-07-17 01:55:04', '2024-07-17 01:55:42', '2024-07-17 09:25:04'),
('143f4792963e761712df6edf31ca6d1c76ab9a026e3846dd99b5cb3a041296135e45dc14176c6d30', 10, 1, 'admin', '[]', 1, '2024-08-02 07:56:33', '2024-08-02 10:58:43', '2024-08-02 15:26:33'),
('1530ea008039af831940f50e0ae25ff87215401850330b2c3505b9e77f3effa12823f03d80d7233c', 10, 1, 'Admin', '[]', 0, '2024-08-02 11:10:53', '2024-08-02 11:10:53', '2024-08-02 18:40:53'),
('16fdb1b672162dd31d1c3799daf36ec862aff894a2c0d4f5f95bb2d998268e62ddda85d85ebdcda2', 10, 1, 'admin', '[]', 0, '2024-07-31 03:52:54', '2024-07-31 03:52:54', '2024-07-31 11:22:54'),
('19eb4167db223c673f8f32cbf776dfb4580f2413c233c90dd0f3689d23c11421968469e6131e1600', 10, 1, 'Admin', '[]', 0, '2024-08-21 11:15:50', '2024-08-21 11:15:50', '2024-08-21 18:45:50'),
('1b4ae10d2005691abd49ecbf7a038ecdfddc0e65225aa6870e6fb96c06c6e49061d301669a4d8378', 9, 1, 'admin', '[]', 1, '2024-07-17 01:56:52', '2024-07-17 01:56:56', '2024-07-17 09:26:52'),
('1c0bdda50cef735e772c8de2f6d46291110db6f90df0ba03e61bdf0a49a3a35d51bfe5839af01c04', 9, 1, 'admin', '[]', 1, '2024-07-16 06:56:45', '2024-07-16 08:58:03', '2024-07-16 14:26:45'),
('1c4d5c61f4d7ec0f641eecc8ae362134a78ceb2d7bfcfe863f3c0635321af29b5ba64f8ef4441e74', 10, 1, 'Admin', '[]', 0, '2024-08-22 06:11:56', '2024-08-22 06:11:56', '2024-08-22 13:41:56'),
('1cd83d019b80a9260818c68cec89971795ee37cbd406e2acfe9f7f563eb750af256653e8874712e9', 9, 1, 'Personal Access Token', '[]', 0, '2024-07-16 01:54:34', '2024-07-16 01:54:34', '2024-07-16 07:24:34'),
('1d76c7bc6779709222661c5b9d357d18a86952c408b219f8a63059abc872cd4a103be781db96f328', 10, 1, 'Admin', '[]', 0, '2024-09-11 06:51:21', '2024-09-11 06:51:21', '2024-09-11 14:21:21'),
('2041c21e4df4e675d07786676d35196dda5745de2baa72d7e088842e23e3b71687fe8df0c5cddfd7', 9, 1, 'Personal Access Token', '[]', 0, '2024-07-16 04:29:42', '2024-07-16 04:29:42', '2024-07-16 11:59:42'),
('20da65797621f9466c3347cd29197f98d865f628cfd087bad51cd5832ae836a6021dcc12262eeca1', 9, 1, 'admin', '[]', 0, '2024-07-16 06:19:52', '2024-07-16 06:19:52', '2024-07-16 13:49:52'),
('21e965e8a5d19cb3b0937c55f6822c98d080119376db66bdf94be3c8a46b9c65874a4236352728c0', 10, 1, 'admin', '[]', 1, '2024-07-23 02:53:27', '2024-07-23 06:48:34', '2024-07-23 10:23:27'),
('22ff10fafae3246ee9f36f70902fcdb96b5105c06cf4231c34967b602df4d646c536616d2ee84f69', 10, 1, 'Admin', '[]', 1, '2024-08-21 11:44:22', '2024-08-21 11:44:29', '2024-08-21 19:14:22'),
('2377d9e3ca77c28ea0a6701ce8d6ea1b77876a3c83334efe88de98aaed5515a654525b61bc8b1591', 10, 1, 'Admin', '[]', 1, '2024-08-14 16:32:19', '2024-08-16 03:23:12', '2024-08-15 00:02:19'),
('239c797b869efd7ffa45ad3cc48a80a521ff71a4dd46aa050d6371a81bb137d432b0268f5f13ec92', 9, 1, 'Personal Access Token', '[]', 0, '2024-07-16 03:02:26', '2024-07-16 03:02:26', '2024-07-16 08:32:26'),
('244d711175c8feb7d9a1a7685a8bde755d540c2230e37fbf2b534461e47b91751a2614ed23c34a91', 10, 1, 'Admin', '[]', 0, '2024-08-16 03:23:42', '2024-08-16 03:23:42', '2024-08-16 10:53:42'),
('27112a5a343a7ae4fea1325a9b973d59b0f430a4818a86c82bb4aa8d42ab6e4f141a52718972c097', 9, 1, 'admin', '[]', 1, '2024-07-17 01:55:43', '2024-07-17 01:56:48', '2024-07-17 09:25:43'),
('28d34974ef46d3069825abe07b70a7b3d21b23565b7f4c220271b8206dc2e4e4dacafe3bbbf15e81', 9, 1, 'Personal Access Token', '[]', 0, '2024-07-16 02:32:10', '2024-07-16 02:32:10', '2024-07-16 08:02:10'),
('2b4562e0f8a3ba49554db92197583c3c732418f81178c60af459d28d14b9e002078464d3553d8918', 10, 1, 'Admin', '[]', 1, '2024-08-13 05:16:39', '2024-08-13 05:16:44', '2024-08-13 12:46:39'),
('2e09062b7c57470a221643af0cd84281bd48c5160e3680c62ba7c979676dc89179fbc34a063ea3c4', 10, 1, 'admin', '[]', 1, '2024-07-18 03:47:24', '2024-07-18 05:24:44', '2024-07-18 11:17:24'),
('31c6d0e50c77c082fe234c6023e6be7b722bb49f609fcaea1c610af3764dd51b1f978b51e35c8b98', 9, 1, 'Personal Access Token', '[]', 0, '2024-07-16 04:30:20', '2024-07-16 04:30:20', '2024-07-16 12:00:20'),
('32f32b8eba1bd75b1c9056c5765be33671278c52970e9913504731471f3721276d3ea0988e5d13a6', 10, 1, 'Admin', '[]', 0, '2024-08-21 11:44:31', '2024-08-21 11:44:31', '2024-08-21 19:14:31'),
('33ce7b5db38b86e8e30cd9f86c5b67dfc15a8f57290d4f3d75f9b1848bc0f5b221e27a29182a631d', 10, 1, 'admin', '[]', 1, '2024-07-23 11:03:43', '2024-07-23 23:43:48', '2024-07-23 18:33:43'),
('35aa559fc166db15b4283706c20351dd06369bedb54aab59c84344899c315de917bd5c04ec6a2451', 10, 1, 'admin', '[]', 0, '2024-07-18 08:32:32', '2024-07-18 08:32:32', '2024-07-18 16:02:32'),
('37b247a355ee16c496e1f1a5eaaa68e9834bb62d648d0c0678f3c2893f5df87924576994d18304a6', 10, 1, 'Admin', '[]', 1, '2024-08-21 05:45:52', '2024-08-21 08:08:20', '2024-08-21 13:15:52'),
('3ce2315b350f986c918db6f276df5fe5bcb42b397f5ac64bff36d67b7f6921d3782fa1c5e33e0b25', 10, 1, 'admin', '[]', 1, '2024-07-19 14:29:09', '2024-07-19 22:51:18', '2024-07-19 21:59:09'),
('3e8a582dc93bcce0b1d983a2d61e20cd54901d89e90fcc1088b8f3d1e9872333fd5b8e9fb1c666d8', 9, 1, 'admin', '[]', 0, '2024-07-16 04:54:18', '2024-07-16 04:54:18', '2024-07-16 12:24:18'),
('3eedd34b39ba80182876d032a7794e0ba50825cfc9056c608931f67c0448d7f1969a3532011b8749', 10, 1, 'Admin', '[]', 1, '2024-08-21 11:44:14', '2024-08-21 11:44:16', '2024-08-21 19:14:14'),
('3fb2b0ad62891c95ccb67d1e54e6bc71c3bc3de5b09667f03c4b69cd4f75a5734521dcad294c8e2b', 9, 1, 'admin', '[]', 1, '2024-07-17 01:11:20', '2024-07-17 01:54:41', '2024-07-17 08:41:20'),
('4044658ffe12d438bad0aaca01c837718076e67c2ccebf1c4fb191e67c7663fd4a4c6b0e9e651f66', 9, 1, 'Personal Access Token', '[]', 0, '2024-07-16 02:44:03', '2024-07-16 02:44:03', '2024-07-16 08:14:03'),
('413c6497b20da9194764339089a7ca5c5080f9e5d41346df249a1000bdea741aa18798f00a18509b', 10, 1, 'admin', '[]', 1, '2024-07-19 22:55:00', '2024-07-20 00:55:53', '2024-07-20 06:25:00'),
('41a5f4ab55ece9bdced61bb9f449f7078557979efa4d90760480bdad2d5e4d3592a05d9bd8cc99ca', 9, 1, 'Personal Access Token', '[]', 0, '2024-07-16 04:31:13', '2024-07-16 04:31:13', '2024-07-16 12:01:13'),
('42a71c47403ba3f64ce3ce33df2b40b718b2717c169b6ad861eafe4d2527f82bdb6dcd61f84b95bb', 10, 1, 'admin', '[]', 1, '2024-07-18 06:29:34', '2024-07-18 08:32:25', '2024-07-18 13:59:34'),
('42b38c5e9d18b20e3000f55d463f72efb36718b4243b5dbfa92440cf949b388c32e3a4a0afa57550', 10, 1, 'Admin', '[]', 0, '2024-08-21 12:33:59', '2024-08-21 12:33:59', '2024-08-21 20:03:59'),
('48041eab84a96ae5c4e239c45ec85f3d55289e8bea20b17e319f23a00689d12d46f0ed8715e011b8', 10, 1, 'Admin', '[]', 0, '2024-09-11 06:00:22', '2024-09-11 06:00:22', '2024-09-11 13:30:22'),
('49886ea0e8bdef438d54d1cf27a3a462415c84ebf531f25c5b0f2172df0138a6ffe0efaabea4609d', 10, 1, 'admin', '[]', 0, '2024-07-31 00:12:37', '2024-07-31 00:12:37', '2024-07-31 07:42:37'),
('49be958248d48869a2e99ccb2e2ee0f8a9586481bf96136c382809098d6661cb06b508879504f350', 10, 1, 'Admin', '[]', 0, '2024-08-14 14:17:16', '2024-08-14 14:17:16', '2024-08-14 21:47:16'),
('4b0e040d21e520ffbd922f28d9c0da6c2da6c9650424797d49c21b477656bd96e2bb2f73a976f6aa', 10, 1, 'admin', '[]', 0, '2024-07-25 00:50:47', '2024-07-25 00:50:47', '2024-07-25 08:20:47'),
('50724bc976e21f46f63af0cecc0f91913e459fae2899ca2713aea3542c7e61f1f94605f8dcc58270', 10, 1, 'admin', '[]', 0, '2024-07-18 05:50:04', '2024-07-18 05:50:04', '2024-07-18 13:20:04'),
('508e6e5081ac0f75434d626e99cc65a46153edc7789cad1f0ef2d22c6497f12190195a5e7a27842a', 9, 1, 'Personal Access Token', '[]', 0, '2024-07-16 04:32:24', '2024-07-16 04:32:24', '2024-07-16 12:02:24'),
('517a6f1a5843505a0070a4be2885448eb237742f28cc8904347f554b5b66893bb5c64e30e166f0c1', 9, 1, 'admin', '[]', 1, '2024-07-18 00:45:34', '2024-07-18 00:48:13', '2024-07-18 08:15:34'),
('538d86fc5bd9f2659e98173a5b34fd9cd715f1ac74c43af9136e872e7b82e9f18a3f6f38b3636bfe', 9, 1, 'Personal Access Token', '[]', 0, '2024-07-16 01:44:47', '2024-07-16 01:44:47', '2024-07-16 07:14:47'),
('563e738e6979ddaa6fc1d66d576f81c9e2d1c6adaa48cb0734cc19088bc520bb8279c538280ca990', 10, 1, 'admin', '[]', 0, '2024-08-01 05:57:04', '2024-08-01 05:57:04', '2024-08-01 13:27:04'),
('592dfb64f2cf0270cfc8f6b1628d49072fc803c790a4a04e0bb7bb508b5974391de85682f50df38a', 9, 1, 'Personal Access Token', '[]', 0, '2024-07-16 03:15:21', '2024-07-16 03:15:21', '2024-07-16 10:45:21'),
('5a067ecf272b905be24b7c9805f08c9e5b0609510a4e179b210b95fedcb1fb6e1a99fa4888bf8f3c', 10, 1, 'Admin', '[]', 1, '2024-08-13 06:29:31', '2024-08-13 09:04:59', '2024-08-13 13:59:31'),
('5ace4c053f4e21cc7103de15fd49c2dd015a669763cb598ab8b1d5de1511fafe00e4b187b1daf494', 9, 1, 'Personal Access Token', '[]', 0, '2024-07-16 02:38:16', '2024-07-16 02:38:16', '2024-07-16 08:08:16'),
('5b9fa68a57d1aef8d208334d1ab4c47cc971069f8eb300f07f33b26530f35a634ffac69c42aefc31', 10, 1, 'Admin', '[]', 0, '2024-09-16 11:04:50', '2024-09-16 11:04:50', '2024-09-16 18:34:50'),
('5db7f1e7833b70811e80a29c567e2289730c7e8a3b1a879f6deaa4c0e53fec6b6285dac6dae7131b', 10, 1, 'admin', '[]', 0, '2024-07-23 08:49:45', '2024-07-23 08:49:45', '2024-07-23 16:19:45'),
('6174fd27c9879c595a60e631c4d5d1626414026cd4cbcf2d7f446608c84146492e6c71a9823446cc', 10, 1, 'admin', '[]', 0, '2024-07-25 00:04:52', '2024-07-25 00:04:52', '2024-07-25 07:34:52'),
('62b0fb2fd1fd15a6c160f9ccdd08a02dd93c406f20f048e25aa8b7c89b163cc2b021a681356ce0da', 10, 1, 'admin', '[]', 1, '2024-07-20 03:02:45', '2024-07-20 05:06:03', '2024-07-20 10:32:45'),
('63505684f97d68d1ae99fecb71d9cf8774fc6e04478bd58fab676f527094f838b8e485dce8f88ac0', 10, 1, 'admin', '[]', 0, '2024-07-31 01:22:01', '2024-07-31 01:22:01', '2024-07-31 08:52:01'),
('68a1d722eeb654c1575c1a61bcc17da183f598a0d7f64817c039f9ca3fbf57b656ecabb2dcb60494', 10, 1, 'admin', '[]', 1, '2024-07-20 00:56:02', '2024-07-20 03:02:39', '2024-07-20 08:26:02'),
('6a4412e427bdbde4c0bdea76f3098921ba5f9e7dfb64aae33cfbda07d164329776933a9ec7e1f8e7', 10, 1, 'admin', '[]', 0, '2024-08-01 05:55:43', '2024-08-01 05:55:43', '2024-08-01 13:25:43'),
('6c3ab99f21b78230980e49222fe82fab061416deac0f240955a5decb6ec1402bdefc58061e86da88', 10, 1, 'Admin', '[]', 0, '2024-08-21 15:59:40', '2024-08-21 15:59:40', '2024-08-21 23:29:40'),
('6c48c1c870527c92b6e325fcd0a1acee5f883fa3a74eec894f5ef074562bae79a84ba39d67ffba57', 10, 1, 'admin', '[]', 1, '2024-07-19 05:53:58', '2024-07-19 08:12:03', '2024-07-19 13:23:58'),
('6c9c6d79426bb59a7301543fac630b4f646325874e4cf0618f3d824425494ab5660dbe01bbd4948d', 10, 1, 'Admin', '[]', 0, '2024-09-19 05:25:36', '2024-09-19 05:25:36', '2024-09-19 12:55:36'),
('75661320c9093ae80e376292fffac4d25a9ea9abf1c0a0ba89cc0177f0630afd58164b86b125ca64', 9, 1, 'admin', '[]', 0, '2024-07-17 07:14:53', '2024-07-17 07:14:53', '2024-07-17 14:44:53'),
('76edbd917dc521febc5c89e0e4e5c339e86ab22b013bb308dfbed37f37d364cc5eed034ec52c6682', 10, 1, 'admin', '[]', 1, '2024-07-31 12:19:50', '2024-08-01 05:46:00', '2024-07-31 19:49:51'),
('7994334d0779c097f6c0cf2ab1ada90777624b5142043a9a3e9d5094f29f644cf6ed7a4ed71d1597', 10, 1, 'Admin', '[]', 0, '2024-09-20 06:02:11', '2024-09-20 06:02:11', '2024-09-20 13:32:11'),
('79b29311156a1425e480fb45fbd7b3ac72b3fc2ea8457fb3f2c005fa98d976e9925c4251593ebb35', 10, 1, 'admin', '[]', 1, '2024-07-22 22:48:45', '2024-07-23 00:52:42', '2024-07-23 06:18:45'),
('7c368e9aaab9ad23fe44489b8d4a758a5432dfbdcc6efb7fb6f7a4f07450ff8feeef7914bd028495', 9, 1, 'Personal Access Token', '[]', 0, '2024-07-16 02:57:37', '2024-07-16 02:57:37', '2024-07-16 08:27:37'),
('7c8ad06034d010bdf2ce77650a95e6a30f67709c2a0fff6391b4510cd25371bd156e508761a909f3', 10, 1, 'admin', '[]', 1, '2024-07-23 08:54:44', '2024-07-23 10:59:47', '2024-07-23 16:24:44'),
('7d0ab3279dbced93f7e4a590fe35ed82274b86117b9774e4640e87e5c9062dc1891d6a53572e2c51', 10, 1, 'admin', '[]', 1, '2024-07-19 03:22:06', '2024-07-19 05:34:44', '2024-07-19 10:52:06'),
('7d638069b2867fe7dd31f43245eee4f8ef42095d5861b4d228d5f8c5bf7f0183112e65ee34f8ce72', 9, 1, 'Personal Access Token', '[]', 0, '2024-07-16 03:31:34', '2024-07-16 03:31:34', '2024-07-16 11:01:34'),
('7e9f89db3ba914b989f249d05b188183636f218a17b105f3d987581a0150b716950ecb7363403216', 10, 1, 'admin', '[]', 0, '2024-07-23 23:44:17', '2024-07-23 23:44:17', '2024-07-24 07:14:17'),
('7eb95a819d61d67a60f3de899abbfdd0f90daa39f35146e9d105168ecd26ac3c88bfe39090b0d8f2', 10, 1, 'Admin', '[]', 0, '2024-08-05 08:12:56', '2024-08-05 08:12:56', '2024-08-05 15:42:56'),
('87280e8c22ae2326d021be7845aab4dbab4d3da6ba60d8c2490cd402255bc320cec80c8b7ce2e13d', 10, 1, 'Admin', '[]', 0, '2024-08-13 04:41:33', '2024-08-13 04:41:33', '2024-08-13 12:11:33'),
('8a5c708088fce64baf3c441b86c2aa32b4dc4db57eb14484db5d6e08f2c6b54d2d23d6b34ad9f99e', 10, 1, 'admin', '[]', 1, '2024-07-25 02:12:50', '2024-07-26 05:21:35', '2024-07-25 09:42:50'),
('8d2350b95e8221cbca61038e19ea4261b278fc3ae0a920a5ccb199dae49fe373b539a50ed80e20d2', 10, 1, 'admin', '[]', 1, '2024-07-21 22:58:42', '2024-07-22 03:38:51', '2024-07-22 06:28:42'),
('8dc6c258062545c8036ebb5352e36b83c37150834928f087b8658ffc7ca85e0e92fb6819ad1d296c', 10, 1, 'Admin', '[]', 0, '2024-08-05 10:03:09', '2024-08-05 10:03:09', '2024-08-05 17:33:09'),
('902d7dd04bdb73501ffeae3d2e28530e81cfda5afa3a62c6c7455284130a267cf56a7291f614197a', 10, 1, 'Admin', '[]', 0, '2024-08-08 07:30:19', '2024-08-08 07:30:19', '2024-08-08 15:00:19'),
('949a03270fa7304b8ebd737235fbfa4b3cedf614354ce864ba1f2cf1dfe98d6b4043d07676fe0e36', 10, 1, 'Admin', '[]', 0, '2024-09-09 08:51:56', '2024-09-09 08:51:56', '2024-09-09 16:21:56'),
('9714e2b1b6d3e5a9499ddb114ce5478989ae2d2f84ac89d15ec66baac126de3068ad5189a07b4b23', 10, 1, 'Admin', '[]', 0, '2024-08-21 08:09:58', '2024-08-21 08:09:58', '2024-08-21 15:39:58'),
('9890b6373c80904ccc0c610ad4e3520d819d76da4853e3d7030205a1de351fb9c5c77773fa5d230e', 10, 1, 'admin', '[]', 0, '2024-07-19 00:30:52', '2024-07-19 00:30:52', '2024-07-19 08:00:52'),
('9a3537c56347604be9d7c281fa59d33364d8a90f2261443171240a5ac0ded92c6a4705b95aa4fe94', 10, 1, 'admin', '[]', 1, '2024-07-31 04:11:31', '2024-07-31 10:52:17', '2024-07-31 11:41:31'),
('9a447106339f395842f97606cb08f4dea76a214a80c7ac9a932b0a4f8a66fa74364299a48837d41d', 9, 1, 'admin', '[]', 0, '2024-07-16 08:58:06', '2024-07-16 08:58:06', '2024-07-16 16:28:06'),
('9d758f5e9cf0b3df87b7faf97434387bdce7e20b604f2afc1abd9f6aeb47940835986f5f4c94bd6e', 10, 1, 'Admin', '[]', 1, '2024-08-14 12:07:59', '2024-08-14 14:17:08', '2024-08-14 19:38:00'),
('9feb86d3efa51d9910c425de63b2abf9429b3b90c2a9daf6605f94f4d171c377da0e50c8c635ec40', 9, 1, 'Personal Access Token', '[]', 0, '2024-07-16 04:33:46', '2024-07-16 04:33:46', '2025-07-16 10:03:46'),
('a7075216c402ff7ed94d01259dae769f8c80e2103a35042968b0ac764b36918ab4616f435ff1e878', 10, 1, 'admin', '[]', 0, '2024-07-18 00:48:20', '2024-07-18 00:48:20', '2024-07-18 08:18:20'),
('adfb42f0fd95f739e885fe90c06c571cb16690ca247b9e057c4f44b812691bb38135f8d71a70a1e4', 9, 1, 'Personal Access Token', '[]', 0, '2024-07-16 03:12:45', '2024-07-16 03:12:45', '2024-07-16 10:42:45'),
('b31b45da07faaa1394d9bd2bdfa81ef30c23daee2dd54c59490a471ceebf6e4ea35932c8b5c53aac', 10, 1, 'Admin', '[]', 0, '2024-08-21 14:13:47', '2024-08-21 14:13:47', '2024-08-21 21:43:47'),
('b698c6738e23d4b6fa03d8b44c035eee9cc5f4769036c4b4046e42bc591fc4f548d0489bec4292e4', 10, 1, 'admin', '[]', 1, '2024-07-31 01:35:13', '2024-07-31 03:52:52', '2024-07-31 09:05:13'),
('b8e276d467ac96f5b29faf7157bee8f61b8d2c01d482df55fcf4c978c54078f9cce716629888a923', 10, 1, 'admin', '[]', 1, '2024-08-01 05:52:21', '2024-08-01 05:52:22', '2024-08-01 13:22:21'),
('ba70d0fd6b87afb27935a61e39f9b2ee65e737e94f3efb45ff2bf4f5d2da9ea2b627b8df2248f0b5', 9, 1, 'Personal Access Token', '[]', 0, '2024-07-16 03:15:46', '2024-07-16 03:15:46', '2024-07-16 10:45:46'),
('be0ab5ed3f1e1c85d83ab8813b0ff9af9b6e73458f109eed5ec3bd7731e107d4de107577c1e42ca7', 10, 1, 'Admin', '[]', 1, '2024-09-12 09:19:57', '2024-09-12 11:25:18', '2024-09-12 16:49:57'),
('be84aede3ba5f1e74c30008429e67829736aa6bdae31c934da5e827d4170f4ad202046768ec187a1', 10, 1, 'admin', '[]', 0, '2024-07-18 05:25:01', '2024-07-18 05:25:01', '2024-07-18 12:55:01'),
('c3d12c1fbc3d99eae2406eab91f6849ce6651abc6079b0ebce032d8bc1df12be2c01dce640a36a88', 10, 1, 'Admin', '[]', 0, '2024-08-21 09:58:07', '2024-08-21 09:58:07', '2024-08-21 17:28:07'),
('c426be9d7b8dd9727408fc63e8c2680772329a4bf388d0fbb5eba90396d104f4ee4af0c2eabd3642', 9, 1, 'admin', '[]', 0, '2024-07-16 06:55:42', '2024-07-16 06:55:42', '2024-07-16 14:25:42'),
('c85798f1c15847c56fffc7f69a1faa37819c92021761158576878168c9177cd2307e638f7cd1090f', 10, 1, 'admin', '[]', 1, '2024-08-01 08:59:15', '2024-08-02 05:22:57', '2024-08-01 16:29:16'),
('c8ffb1e0b5cf4767f9f6c22148168db6052fdf839accd0bc84386261d9947626d924518cd5ef6c8e', 9, 1, 'admin', '[]', 1, '2024-07-16 06:56:17', '2024-07-16 06:56:40', '2024-07-16 14:26:17'),
('ce6e05dcfffa93560d12d1608b89e831fbab41cc6ba19d7d275bc5649b691a1d49aaa31b9ead79fa', 10, 1, 'Admin', '[]', 1, '2024-08-13 05:17:17', '2024-08-13 05:17:28', '2024-08-13 12:47:17'),
('ced6cb9fde24e582921eb5d5eb834a5a4e414985f8dffbd7fb751bcf3c80582ef4ce8e2e74e33324', 9, 1, 'Personal Access Token', '[]', 0, '2024-07-16 03:20:45', '2024-07-16 03:20:45', '2024-07-16 10:50:45'),
('d1025d6bb8b4036d3e6185dfade9e0eeaa44d83f5ea37071a4afa2fa7cfcbbd5980a20a4591e3fe8', 9, 1, 'Personal Access Token', '[]', 0, '2024-07-16 02:31:18', '2024-07-16 02:31:18', '2024-07-16 08:01:18'),
('d507c0fcee8a8fb978bebfe93e1211528bf2703e8d62e0da002d95b9f08e010931e03ce36dd3653d', 10, 1, 'Admin', '[]', 1, '2024-08-13 05:17:08', '2024-08-13 05:17:11', '2024-08-13 12:47:08'),
('d53e67430f3d2612808778e115d71f5e5f2226bdd1e64d551a7d76c26ee0fd9ba90670e0f3b242f0', 10, 1, 'Admin', '[]', 1, '2024-08-21 11:44:17', '2024-08-21 11:44:19', '2024-08-21 19:14:17'),
('d862df90cc076b5488f35ca589fcfa2a76c8e3fe17ab3d48e1dc134582ecacefa44da3ca7660211d', 10, 1, 'Admin', '[]', 0, '2024-08-13 09:15:42', '2024-08-13 09:15:42', '2024-08-13 16:45:42'),
('dccca0980a6463765928515e4856fdcd55cee2357e77ee00f9f12b91230c60e9d516a98821d4f5fe', 9, 1, 'admin', '[]', 1, '2024-07-16 06:20:46', '2024-07-16 06:55:26', '2024-07-16 13:50:46'),
('deda711fba0ad51b5ea745c003e2293db73e2bf1ad79f77c3b9a7c1963bf487481f7e008cd2a33b5', 10, 1, 'Admin', '[]', 1, '2024-08-13 05:00:08', '2024-08-13 05:16:29', '2024-08-13 12:30:08'),
('dfdcffd7941ca015edb52cfdb6bf15afa35549af6bcf53a358f6876761cde89e7c1d7f68aead39a9', 10, 1, 'admin', '[]', 1, '2024-08-01 05:52:05', '2024-08-01 05:52:14', '2024-08-01 13:22:05'),
('e01e302e02eaa26c21d225551a25ecd67e5f618780458f27b5304c87e8139ba3b96492729c539a34', 10, 1, 'admin', '[]', 0, '2024-07-31 10:52:18', '2024-07-31 10:52:18', '2024-07-31 18:22:18'),
('e06af86ac9fc3c175487d98713a14a63afdc43749c210c29dc9fbb108aefd37ededc1b46df0e2586', 10, 1, 'admin', '[]', 1, '2024-07-31 01:41:25', '2024-07-31 05:13:40', '2024-07-31 09:11:25'),
('e45cd81015d35afd7453e12fb1949032205730a58e9e492a9bdfef923b1d0634c334f99296e0553b', 10, 1, 'Admin', '[]', 1, '2024-08-21 10:15:33', '2024-08-21 11:15:47', '2024-08-21 17:45:33'),
('e5367df3537d6e3f8d5ce76cf2ee043b20b6c4a53913485f5f326ded2ea0d7081ae521d7d805e40a', 9, 1, 'Personal Access Token', '[]', 0, '2024-07-16 04:34:49', '2024-07-16 04:34:49', '2024-07-16 12:04:49'),
('e5802ac551cf3098a3721e294c06c083f622bf6eeb17a3629d76fddb44e9941efd4078d7c8e9b2af', 10, 1, 'admin', '[]', 0, '2024-07-26 06:23:47', '2024-07-26 06:23:47', '2024-07-26 13:53:47'),
('eb279ac6e8dbe7c2bae43d028c9ada069bd14efdab1c89b71eb1bbd67d2d6b588dee59854d69e9e8', 10, 1, 'admin', '[]', 0, '2024-07-29 00:19:51', '2024-07-29 00:19:51', '2024-07-29 07:49:51'),
('f08c9490681990edc98ec47e331c5c52f62b20a995bdc6e50869cd139f20f70f33fd983ec911d12f', 10, 1, 'Admin', '[]', 1, '2024-08-13 04:52:15', '2024-08-13 04:52:22', '2024-08-13 12:22:15'),
('f184121e899520acb2c17c5834eb2de91000dce66e0644096b080710f2d221bde871dd14437e46cf', 10, 1, 'admin', '[]', 0, '2024-07-22 03:38:55', '2024-07-22 03:38:55', '2024-07-22 11:08:55'),
('f44bdf8fd37e6943834928bbd81fa596045f5c91462366c1066a123e25873a832c5444e9c4c104d3', 10, 1, 'Admin', '[]', 1, '2024-08-02 11:17:18', '2024-08-03 06:45:58', '2024-08-02 18:47:18'),
('f4955e3b125176a41c5eeaab92a49b822163273e3f50567d90fd2e06d47f71d7419c1a910e32f4ad', 9, 1, 'Personal Access Token', '[]', 0, '2024-07-16 02:52:20', '2024-07-16 02:52:20', '2024-07-16 08:22:20'),
('f4958f5c38f06e66cf08c3ed4366abea74baf5aa3a412ca07e0c7d599719ab3532d5cff6237f7590', 10, 1, 'Admin', '[]', 0, '2024-09-12 11:25:32', '2024-09-12 11:25:32', '2024-09-12 18:55:32'),
('f73eeff14ba7006c781e1a845f63b7969a69e3ceca05fb9eec70beab4a5385b3d6033f68ab73427f', 10, 1, 'admin', '[]', 1, '2024-07-23 00:52:47', '2024-07-23 02:53:21', '2024-07-23 08:22:47'),
('f7489c1199babf3f0fe3a74b7291780db0a9fc324abb3a02c55168142d7f67260247525dfd9dfd55', 9, 1, 'Personal Access Token', '[]', 0, '2024-07-16 01:45:29', '2024-07-16 01:45:29', '2024-07-16 07:15:29'),
('f8f0259a595093d9ccd71c3b841bdba31ffe0c3f1652c9f3a3e0f68e54db04b88d82554653ba80c3', 10, 1, 'admin', '[]', 1, '2024-07-20 05:06:05', '2024-07-21 22:58:23', '2024-07-20 12:36:05'),
('fa6cde470ea15302c04d3b423cc9bded9995e005a891ecd55848f6854fd87513e283867dd61da38f', 10, 1, 'admin', '[]', 1, '2024-07-30 03:16:41', '2024-07-30 05:21:56', '2024-07-30 10:46:41'),
('fb8273d6050d07d6333aba9efc9b9930809c0481a8a7a285801d2d9e77dcf1c810017a281f892172', 10, 1, 'admin', '[]', 1, '2024-07-22 03:55:41', '2024-07-22 22:48:35', '2024-07-22 11:25:41'),
('fbdb2ef5e11ce804bc1c116228de16dc54d25201e5cdaa03d0eaf98f0bc8f32d7f0025daed7ea6a6', 10, 1, 'admin', '[]', 1, '2024-07-23 06:48:35', '2024-07-23 08:49:20', '2024-07-23 14:18:35'),
('fc0983231ef6ffae244b872d7510bc341d858e064bb3f2d62d1dfd9c60e36a6639374c294025b2b9', 10, 1, 'admin', '[]', 0, '2024-07-22 03:52:51', '2024-07-22 03:52:51', '2024-07-22 11:22:51'),
('fe94d378124ff09d56bc97f9227b9d7f73042ac66a63f474e5010ba98fc53c12cd9e9a42837abbbe', 9, 1, 'admin', '[]', 0, '2024-07-17 01:02:33', '2024-07-17 01:02:34', '2024-07-17 08:32:34'),
('fea3fc02078c158d203ce041a7d6f32963bbeb027eaf9890fb81da39564cdb932cbd444a429207f0', 10, 1, 'Admin', '[]', 1, '2024-08-13 05:16:32', '2024-08-13 05:16:37', '2024-08-13 12:46:32');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
  `scopes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'local', 'p8QqkufMT2Myb863eEYq4BuSRJg5E4Fw0opPRKIZ', NULL, 'http://localhost', 1, 0, 0, '2024-02-19 01:21:30', '2024-02-19 01:21:30');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint UNSIGNED NOT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2024-07-09 07:09:03', '2024-07-19 07:09:06');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `otp_verify`
--

CREATE TABLE `otp_verify` (
  `id` int NOT NULL,
  `mobile` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `otp` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `error` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `otp_verify`
--

INSERT INTO `otp_verify` (`id`, `mobile`, `otp`, `status`, `error`, `created_at`, `updated_at`) VALUES
(1, '8308776949', '803510', NULL, NULL, '2024-08-07 07:10:42', '2024-08-07 07:10:42'),
(2, '8308776949', '229923', NULL, NULL, '2024-08-07 07:14:43', '2024-08-07 07:14:43'),
(3, '8308776949', '746135', NULL, NULL, '2024-08-07 07:15:33', '2024-08-07 07:15:33'),
(4, '8308776949', '804417', NULL, NULL, '2024-08-07 07:18:13', '2024-08-07 07:18:13'),
(5, '8308776949', '731051', NULL, NULL, '2024-08-07 07:20:59', '2024-08-07 07:20:59'),
(6, '8308776949', '367893', NULL, NULL, '2024-08-07 07:22:30', '2024-08-07 07:22:30'),
(7, '8308776949', '223626', NULL, NULL, '2024-08-07 07:25:53', '2024-08-07 07:25:53'),
(8, '8308776949', '391553', NULL, NULL, '2024-08-07 07:27:14', '2024-08-07 07:27:14'),
(9, '8308776949', '189222', NULL, NULL, '2024-08-07 07:27:39', '2024-08-07 07:27:39'),
(10, '8308776949', '761298', NULL, NULL, '2024-08-07 07:44:30', '2024-08-07 07:44:30'),
(11, '8308776949', '726874', NULL, NULL, '2024-08-07 07:45:28', '2024-08-07 07:45:28'),
(12, '8308776949', '707862', NULL, NULL, '2024-08-07 07:47:24', '2024-08-07 07:47:24'),
(13, '8308776949', '426178', NULL, NULL, '2024-08-07 07:49:15', '2024-08-07 07:49:15'),
(14, '8308776949', '189879', NULL, NULL, '2024-08-07 07:50:08', '2024-08-07 07:50:08'),
(15, '8308776949', '480645', NULL, NULL, '2024-08-07 07:50:19', '2024-08-07 07:50:19'),
(16, '8308776949', '251102', NULL, NULL, '2024-08-07 07:50:30', '2024-08-07 07:50:30'),
(17, '8308776949', '398624', NULL, NULL, '2024-08-07 07:50:38', '2024-08-07 07:50:38'),
(18, '8308776949', '184303', NULL, NULL, '2024-08-07 07:51:20', '2024-08-07 07:51:20'),
(19, '8308776949', '645378', NULL, NULL, '2024-08-07 07:52:18', '2024-08-07 07:52:18'),
(20, '8308776949', '650659', NULL, NULL, '2024-08-07 07:52:38', '2024-08-07 07:52:38'),
(21, '8308776949', '554004', NULL, NULL, '2024-08-07 07:53:25', '2024-08-07 07:53:25'),
(22, '8308776949', '968894', NULL, NULL, '2024-08-07 09:20:24', '2024-08-07 09:20:24'),
(23, '8308776949', '848341', NULL, NULL, '2024-08-07 09:25:46', '2024-08-07 09:25:46'),
(24, '8308776949', '562189', NULL, NULL, '2024-08-07 09:41:49', '2024-08-07 09:41:49'),
(25, '8308776949', '544020', NULL, NULL, '2024-08-07 09:45:02', '2024-08-07 09:45:02'),
(26, '8308776949', '545200', NULL, NULL, '2024-08-07 09:46:03', '2024-08-07 09:46:03'),
(27, '8308776949', '757456', NULL, NULL, '2024-08-07 09:46:24', '2024-08-07 09:46:24'),
(28, '8308776949', '689274', NULL, NULL, '2024-08-07 09:47:55', '2024-08-07 09:47:55'),
(29, '8308776949', '767662', NULL, NULL, '2024-08-07 09:48:55', '2024-08-07 09:48:55'),
(30, '8308776949', '442275', NULL, NULL, '2024-08-07 09:55:47', '2024-08-07 09:55:47'),
(31, '8308776949', '530266', '{\"balance\":503039,\"batch_id\":3763779463,\"cost\":1,\"num_messages\":1,\"message\":{\"num_parts\":1,\"sender\":\"BYNRIC\",\"content\":\"OTP for verification is: 530266\\n\\nThank You,\\nFees Regulating Authority\"},\"receipt_url\":\"\",\"custom\":\"\",\"messages\":[{\"id\":\"15093905937\",\"recipient\":918308776949}],\"status\":\"success\"}', NULL, '2024-08-07 10:03:09', '2024-08-07 10:03:11'),
(32, '8308776949', '839156', '{\"balance\":503038,\"batch_id\":3763782429,\"cost\":1,\"num_messages\":1,\"message\":{\"num_parts\":1,\"sender\":\"BYNRIC\",\"content\":\"OTP for verification is: 839156 \\n\\nThank You,\\nFees Regulating Authority\"},\"receipt_url\":\"\",\"custom\":\"\",\"messages\":[{\"id\":\"15093908932\",\"recipient\":918308776949}],\"status\":\"success\"}', NULL, '2024-08-07 10:04:49', '2024-08-07 10:04:49'),
(33, '8308776949', '911018', '{\"balance\":503037,\"batch_id\":3763840279,\"cost\":1,\"num_messages\":1,\"message\":{\"num_parts\":1,\"sender\":\"BYNRIC\",\"content\":\"OTP for verification is: 911018 \\n\\nThank You,\\nFees Regulating Authority\"},\"receipt_url\":\"\",\"custom\":\"\",\"messages\":[{\"id\":\"15093969268\",\"recipient\":918308776949}],\"status\":\"success\"}', NULL, '2024-08-07 10:34:19', '2024-08-07 10:34:20'),
(34, '8308776949', '479315', '{\"balance\":503036,\"batch_id\":3763844324,\"cost\":1,\"num_messages\":1,\"message\":{\"num_parts\":1,\"sender\":\"BYNRIC\",\"content\":\"OTP for verification is: 479315 \\n\\nThank You,\\nFees Regulating Authority\"},\"receipt_url\":\"\",\"custom\":\"\",\"messages\":[{\"id\":\"15093973864\",\"recipient\":918308776949}],\"status\":\"success\"}', NULL, '2024-08-07 10:36:22', '2024-08-07 10:36:23'),
(35, '8308776949', '189177', '{\"balance\":503035,\"batch_id\":3763845092,\"cost\":1,\"num_messages\":1,\"message\":{\"num_parts\":1,\"sender\":\"BYNRIC\",\"content\":\"OTP for verification is: 189177 \\n\\nThank You,\\nFees Regulating Authority\"},\"receipt_url\":\"\",\"custom\":\"\",\"messages\":[{\"id\":\"15093974647\",\"recipient\":918308776949}],\"status\":\"success\"}', NULL, '2024-08-07 10:36:42', '2024-08-07 10:36:45'),
(36, '8308776949', '798600', '{\"balance\":503034,\"batch_id\":3763845317,\"cost\":1,\"num_messages\":1,\"message\":{\"num_parts\":1,\"sender\":\"BYNRIC\",\"content\":\"OTP for verification is: 798600 \\n\\nThank You,\\nFees Regulating Authority\"},\"receipt_url\":\"\",\"custom\":\"\",\"messages\":[{\"id\":\"15093974900\",\"recipient\":918308776949}],\"status\":\"success\"}', NULL, '2024-08-07 10:36:49', '2024-08-07 10:36:51'),
(37, '8308776949', '571282', '{\"balance\":503033,\"batch_id\":3763846389,\"cost\":1,\"num_messages\":1,\"message\":{\"num_parts\":1,\"sender\":\"BYNRIC\",\"content\":\"OTP for verification is: 571282 \\n\\nThank You,\\nFees Regulating Authority\"},\"receipt_url\":\"\",\"custom\":\"\",\"messages\":[{\"id\":\"15093975992\",\"recipient\":918308776949}],\"status\":\"success\"}', NULL, '2024-08-07 10:37:21', '2024-08-07 10:37:25'),
(38, '8308776949', '159192', '{\"balance\":503032,\"batch_id\":3763847571,\"cost\":1,\"num_messages\":1,\"message\":{\"num_parts\":1,\"sender\":\"BYNRIC\",\"content\":\"OTP for verification is: 159192 \\n\\nThank You,\\nFees Regulating Authority\"},\"receipt_url\":\"\",\"custom\":\"\",\"messages\":[{\"id\":\"15093977217\",\"recipient\":918308776949}],\"status\":\"success\"}', NULL, '2024-08-07 10:38:02', '2024-08-07 10:38:04'),
(39, '8308776949', '861713', '{\"balance\":503031,\"batch_id\":3763848370,\"cost\":1,\"num_messages\":1,\"message\":{\"num_parts\":1,\"sender\":\"BYNRIC\",\"content\":\"OTP for verification is: 861713 \\n\\nThank You,\\nFees Regulating Authority\"},\"receipt_url\":\"\",\"custom\":\"\",\"messages\":[{\"id\":\"15093978088\",\"recipient\":918308776949}],\"status\":\"success\"}', NULL, '2024-08-07 10:38:19', '2024-08-07 10:38:25'),
(40, '8308776949', '846651', '{\"balance\":503030,\"batch_id\":3763849652,\"cost\":1,\"num_messages\":1,\"message\":{\"num_parts\":1,\"sender\":\"BYNRIC\",\"content\":\"OTP for verification is: 846651 \\n\\nThank You,\\nFees Regulating Authority\"},\"receipt_url\":\"\",\"custom\":\"\",\"messages\":[{\"id\":\"15093979383\",\"recipient\":918308776949}],\"status\":\"success\"}', NULL, '2024-08-07 10:38:59', '2024-08-07 10:39:01'),
(41, '8308776949', '469938', '{\"balance\":503029,\"batch_id\":3763850902,\"cost\":1,\"num_messages\":1,\"message\":{\"num_parts\":1,\"sender\":\"BYNRIC\",\"content\":\"OTP for verification is: 469938 \\n\\nThank You,\\nFees Regulating Authority\"},\"receipt_url\":\"\",\"custom\":\"\",\"messages\":[{\"id\":\"15093981301\",\"recipient\":918308776949}],\"status\":\"success\"}', NULL, '2024-08-07 10:39:40', '2024-08-07 10:39:41'),
(42, '8308776949', '217101', '{\"balance\":503028,\"batch_id\":3763857187,\"cost\":1,\"num_messages\":1,\"message\":{\"num_parts\":1,\"sender\":\"BYNRIC\",\"content\":\"OTP for verification is: 217101 \\n\\nThank You,\\nFees Regulating Authority\"},\"receipt_url\":\"\",\"custom\":\"\",\"messages\":[{\"id\":\"15093989300\",\"recipient\":918308776949}],\"status\":\"success\"}', NULL, '2024-08-07 10:42:39', '2024-08-07 10:42:40'),
(43, '8308776949', '955992', '{\"balance\":503027,\"batch_id\":3763869481,\"cost\":1,\"num_messages\":1,\"message\":{\"num_parts\":1,\"sender\":\"BYNRIC\",\"content\":\"OTP for verification is: 955992 \\n\\nThank You,\\nFees Regulating Authority\"},\"receipt_url\":\"\",\"custom\":\"\",\"messages\":[{\"id\":\"15094002959\",\"recipient\":918308776949}],\"status\":\"success\"}', NULL, '2024-08-07 10:51:19', '2024-08-07 10:51:23'),
(44, '8308776949', '853372', '{\"balance\":500595,\"batch_id\":3765169903,\"cost\":1,\"num_messages\":1,\"message\":{\"num_parts\":1,\"sender\":\"BYNRIC\",\"content\":\"OTP for verification is: 853372 \\n\\nThank You,\\nFees Regulating Authority\"},\"receipt_url\":\"\",\"custom\":\"\",\"messages\":[{\"id\":\"15095480082\",\"recipient\":918308776949}],\"status\":\"success\"}', NULL, '2024-08-08 07:14:01', '2024-08-08 07:14:58'),
(45, '8308776949', '638483', '{\"balance\":500594,\"batch_id\":3765201325,\"cost\":1,\"num_messages\":1,\"message\":{\"num_parts\":1,\"sender\":\"BYNRIC\",\"content\":\"OTP for verification is: 638483 \\n\\nThank You,\\nFees Regulating Authority\"},\"receipt_url\":\"\",\"custom\":\"\",\"messages\":[{\"id\":\"15095514331\",\"recipient\":918308776949}],\"status\":\"success\"}', NULL, '2024-08-08 07:29:46', '2024-08-08 07:29:50'),
(46, '8308776949', '140198', '{\"balance\":498150,\"batch_id\":3772811400,\"cost\":1,\"num_messages\":1,\"message\":{\"num_parts\":1,\"sender\":\"BYNRIC\",\"content\":\"OTP for verification is: 140198 \\n\\nThank You,\\nFees Regulating Authority\"},\"receipt_url\":\"\",\"custom\":\"\",\"messages\":[{\"id\":\"15104639401\",\"recipient\":918308776949}],\"status\":\"success\"}', NULL, '2024-08-13 06:22:47', '2024-08-13 06:25:44'),
(47, '8308776949', '826977', '{\"balance\":498149,\"batch_id\":3772811422,\"cost\":1,\"num_messages\":1,\"message\":{\"num_parts\":1,\"sender\":\"BYNRIC\",\"content\":\"OTP for verification is: 826977 \\n\\nThank You,\\nFees Regulating Authority\"},\"receipt_url\":\"\",\"custom\":\"\",\"messages\":[{\"id\":\"15104639415\",\"recipient\":918308776949}],\"status\":\"success\"}', NULL, '2024-08-13 06:25:24', '2024-08-13 06:25:44'),
(48, '8308776949', '313144', '{\"balance\":498147,\"batch_id\":3772862979,\"cost\":1,\"num_messages\":1,\"message\":{\"num_parts\":1,\"sender\":\"BYNRIC\",\"content\":\"OTP for verification is: 313144 \\n\\nThank You,\\nFees Regulating Authority\"},\"receipt_url\":\"\",\"custom\":\"\",\"messages\":[{\"id\":\"15104695821\",\"recipient\":918308776949}],\"status\":\"success\"}', NULL, '2024-08-13 06:56:40', '2024-08-13 06:56:41'),
(49, '8308776949', '901136', '{\"balance\":498145,\"batch_id\":3772948080,\"cost\":1,\"num_messages\":1,\"message\":{\"num_parts\":1,\"sender\":\"BYNRIC\",\"content\":\"OTP for verification is: 901136 \\n\\nThank You,\\nFees Regulating Authority\"},\"receipt_url\":\"\",\"custom\":\"\",\"messages\":[{\"id\":\"15104789176\",\"recipient\":918308776949}],\"status\":\"success\"}', NULL, '2024-08-13 07:47:25', '2024-08-13 07:47:27'),
(50, '8308776949', '592848', '{\"balance\":498144,\"batch_id\":3772965164,\"cost\":1,\"num_messages\":1,\"message\":{\"num_parts\":1,\"sender\":\"BYNRIC\",\"content\":\"OTP for verification is: 592848 \\n\\nThank You,\\nFees Regulating Authority\"},\"receipt_url\":\"\",\"custom\":\"\",\"messages\":[{\"id\":\"15104806478\",\"recipient\":918308776949}],\"status\":\"success\"}', NULL, '2024-08-13 07:54:39', '2024-08-13 07:54:40'),
(51, '8308776949', '453506', '{\"balance\":498143,\"batch_id\":3772978650,\"cost\":1,\"num_messages\":1,\"message\":{\"num_parts\":1,\"sender\":\"BYNRIC\",\"content\":\"OTP for verification is: 453506 \\n\\nThank You,\\nFees Regulating Authority\"},\"receipt_url\":\"\",\"custom\":\"\",\"messages\":[{\"id\":\"15104820413\",\"recipient\":918308776949}],\"status\":\"success\"}', NULL, '2024-08-13 08:01:22', '2024-08-13 08:01:26'),
(52, '8308776949', '716404', '{\"balance\":495622,\"batch_id\":3786461447,\"cost\":1,\"num_messages\":1,\"message\":{\"num_parts\":1,\"sender\":\"BYNRIC\",\"content\":\"OTP for verification is: 716404 \\n\\nThank You,\\nFees Regulating Authority\"},\"receipt_url\":\"\",\"custom\":\"\",\"messages\":[{\"id\":\"15119890963\",\"recipient\":918308776949}],\"status\":\"success\"}', NULL, '2024-08-22 05:43:36', '2024-08-22 05:44:06'),
(53, '8308776949', '259798', '{\"balance\":495621,\"batch_id\":3786506305,\"cost\":1,\"num_messages\":1,\"message\":{\"num_parts\":1,\"sender\":\"BYNRIC\",\"content\":\"OTP for verification is: 259798 \\n\\nThank You,\\nFees Regulating Authority\"},\"receipt_url\":\"\",\"custom\":\"\",\"messages\":[{\"id\":\"15119953422\",\"recipient\":918308776949}],\"status\":\"success\"}', NULL, '2024-08-22 06:10:22', '2024-08-22 06:10:24'),
(54, '8308776949', '924771', '{\"balance\":495620,\"batch_id\":3786518516,\"cost\":1,\"num_messages\":1,\"message\":{\"num_parts\":1,\"sender\":\"BYNRIC\",\"content\":\"OTP for verification is: 924771 \\n\\nThank You,\\nFees Regulating Authority\"},\"receipt_url\":\"\",\"custom\":\"\",\"messages\":[{\"id\":\"15119966270\",\"recipient\":918308776949}],\"status\":\"success\"}', NULL, '2024-08-22 06:17:53', '2024-08-22 06:17:55'),
(55, '8308776949', '907643', '{\"balance\":495619,\"batch_id\":3786525757,\"cost\":1,\"num_messages\":1,\"message\":{\"num_parts\":1,\"sender\":\"BYNRIC\",\"content\":\"OTP for verification is: 907643 \\n\\nThank You,\\nFees Regulating Authority\"},\"receipt_url\":\"\",\"custom\":\"\",\"messages\":[{\"id\":\"15119973992\",\"recipient\":918308776949}],\"status\":\"success\"}', NULL, '2024-08-22 06:22:18', '2024-08-22 06:22:21'),
(56, '8308776949', '510557', '{\"balance\":495618,\"batch_id\":3786543833,\"cost\":1,\"num_messages\":1,\"message\":{\"num_parts\":1,\"sender\":\"BYNRIC\",\"content\":\"OTP for verification is: 510557 \\n\\nThank You,\\nFees Regulating Authority\"},\"receipt_url\":\"\",\"custom\":\"\",\"messages\":[{\"id\":\"15119992574\",\"recipient\":918308776949}],\"status\":\"success\"}', NULL, '2024-08-22 06:32:15', '2024-08-22 06:32:17'),
(57, '8308776950', '539248', '{\"balance\":495617,\"batch_id\":3786576338,\"cost\":1,\"num_messages\":1,\"message\":{\"num_parts\":1,\"sender\":\"BYNRIC\",\"content\":\"OTP for verification is: 539248 \\n\\nThank You,\\nFees Regulating Authority\"},\"receipt_url\":\"\",\"custom\":\"\",\"messages\":[{\"id\":\"15120027133\",\"recipient\":918308776950}],\"status\":\"success\"}', NULL, '2024-08-22 06:51:44', '2024-08-22 06:51:46'),
(58, '8308776948', '325576', '{\"balance\":495616,\"batch_id\":3786576722,\"cost\":1,\"num_messages\":1,\"message\":{\"num_parts\":1,\"sender\":\"BYNRIC\",\"content\":\"OTP for verification is: 325576 \\n\\nThank You,\\nFees Regulating Authority\"},\"receipt_url\":\"\",\"custom\":\"\",\"messages\":[{\"id\":\"15120027518\",\"recipient\":918308776948}],\"status\":\"success\"}', NULL, '2024-08-22 06:51:59', '2024-08-22 06:52:01'),
(59, '8308776949', '988959', '{\"balance\":495615,\"batch_id\":3786583110,\"cost\":1,\"num_messages\":1,\"message\":{\"num_parts\":1,\"sender\":\"BYNRIC\",\"content\":\"OTP for verification is: 988959 \\n\\nThank You,\\nFees Regulating Authority\"},\"receipt_url\":\"\",\"custom\":\"\",\"messages\":[{\"id\":\"15120034634\",\"recipient\":918308776949}],\"status\":\"success\"}', NULL, '2024-08-22 06:55:21', '2024-08-22 06:55:23'),
(60, '8308776949', '448365', '{\"balance\":495614,\"batch_id\":3786601505,\"cost\":1,\"num_messages\":1,\"message\":{\"num_parts\":1,\"sender\":\"BYNRIC\",\"content\":\"OTP for verification is: 448365 \\n\\nThank You,\\nFees Regulating Authority\"},\"receipt_url\":\"\",\"custom\":\"\",\"messages\":[{\"id\":\"15120059133\",\"recipient\":918308776949}],\"status\":\"success\"}', NULL, '2024-08-22 07:06:06', '2024-08-22 07:06:08'),
(61, '8308776949', '536942', '{\"balance\":495613,\"batch_id\":3786603752,\"cost\":1,\"num_messages\":1,\"message\":{\"num_parts\":1,\"sender\":\"BYNRIC\",\"content\":\"OTP for verification is: 536942 \\n\\nThank You,\\nFees Regulating Authority\"},\"receipt_url\":\"\",\"custom\":\"\",\"messages\":[{\"id\":\"15120061494\",\"recipient\":918308776949}],\"status\":\"success\"}', NULL, '2024-08-22 07:07:33', '2024-08-22 07:07:36'),
(62, '8308776948', '636478', '{\"balance\":495388,\"batch_id\":3816620760,\"cost\":1,\"num_messages\":1,\"message\":{\"num_parts\":1,\"sender\":\"BYNRIC\",\"content\":\"OTP for verification is: 636478 \\n\\nThank You,\\nFees Regulating Authority\"},\"receipt_url\":\"\",\"custom\":\"\",\"messages\":[{\"id\":\"15153407821\",\"recipient\":918308776948}],\"status\":\"success\"}', NULL, '2024-09-09 08:49:05', '2024-09-09 08:49:07'),
(63, '8308776949', '718571', '{\"balance\":495387,\"batch_id\":3816622484,\"cost\":1,\"num_messages\":1,\"message\":{\"num_parts\":1,\"sender\":\"BYNRIC\",\"content\":\"OTP for verification is: 718571 \\n\\nThank You,\\nFees Regulating Authority\"},\"receipt_url\":\"\",\"custom\":\"\",\"messages\":[{\"id\":\"15153409604\",\"recipient\":918308776949}],\"status\":\"success\"}', NULL, '2024-09-09 08:50:11', '2024-09-09 08:50:13'),
(64, '8308776949', '389391', '{\"balance\":495386,\"batch_id\":3816622689,\"cost\":1,\"num_messages\":1,\"message\":{\"num_parts\":1,\"sender\":\"BYNRIC\",\"content\":\"OTP for verification is: 389391 \\n\\nThank You,\\nFees Regulating Authority\"},\"receipt_url\":\"\",\"custom\":\"\",\"messages\":[{\"id\":\"15153409812\",\"recipient\":918308776949}],\"status\":\"success\"}', NULL, '2024-09-09 08:50:21', '2024-09-09 08:50:23'),
(65, '8308776949', '651477', '{\"balance\":495385,\"batch_id\":3816623002,\"cost\":1,\"num_messages\":1,\"message\":{\"num_parts\":1,\"sender\":\"BYNRIC\",\"content\":\"OTP for verification is: 651477 \\n\\nThank You,\\nFees Regulating Authority\"},\"receipt_url\":\"\",\"custom\":\"\",\"messages\":[{\"id\":\"15153410139\",\"recipient\":918308776949}],\"status\":\"success\"}', NULL, '2024-09-09 08:50:34', '2024-09-09 08:50:35'),
(66, '8308776949', '122064', '{\"balance\":495384,\"batch_id\":3816756290,\"cost\":1,\"num_messages\":1,\"message\":{\"num_parts\":1,\"sender\":\"BYNRIC\",\"content\":\"OTP for verification is: 122064 \\n\\nThank You,\\nFees Regulating Authority\"},\"receipt_url\":\"\",\"custom\":\"\",\"messages\":[{\"id\":\"15153550154\",\"recipient\":918308776949}],\"status\":\"success\"}', NULL, '2024-09-09 10:03:28', '2024-09-09 10:03:29'),
(67, '8308776949', '773976', '{\"balance\":495383,\"batch_id\":3816776905,\"cost\":1,\"num_messages\":1,\"message\":{\"num_parts\":1,\"sender\":\"BYNRIC\",\"content\":\"OTP for verification is: 773976 \\n\\nThank You,\\nFees Regulating Authority\"},\"receipt_url\":\"\",\"custom\":\"\",\"messages\":[{\"id\":\"15153571465\",\"recipient\":918308776949}],\"status\":\"success\"}', NULL, '2024-09-09 10:13:27', '2024-09-09 10:13:38'),
(68, '8308776949', '782767', '{\"balance\":495382,\"batch_id\":3816789685,\"cost\":1,\"num_messages\":1,\"message\":{\"num_parts\":1,\"sender\":\"BYNRIC\",\"content\":\"OTP for verification is: 782767 \\n\\nThank You,\\nFees Regulating Authority\"},\"receipt_url\":\"\",\"custom\":\"\",\"messages\":[{\"id\":\"15153584593\",\"recipient\":918308776949}],\"status\":\"success\"}', NULL, '2024-09-09 10:20:19', '2024-09-09 10:20:20'),
(69, '8308776949', '197363', '{\"balance\":495381,\"batch_id\":3816797879,\"cost\":1,\"num_messages\":1,\"message\":{\"num_parts\":1,\"sender\":\"BYNRIC\",\"content\":\"OTP for verification is: 197363 \\n\\nThank You,\\nFees Regulating Authority\"},\"receipt_url\":\"\",\"custom\":\"\",\"messages\":[{\"id\":\"15153592997\",\"recipient\":918308776949}],\"status\":\"success\"}', NULL, '2024-09-09 10:24:36', '2024-09-09 10:24:38'),
(70, '8308776949', '765972', '{\"balance\":495380,\"batch_id\":3816804429,\"cost\":1,\"num_messages\":1,\"message\":{\"num_parts\":1,\"sender\":\"BYNRIC\",\"content\":\"OTP for verification is: 765972 \\n\\nThank You,\\nFees Regulating Authority\"},\"receipt_url\":\"\",\"custom\":\"\",\"messages\":[{\"id\":\"15153599650\",\"recipient\":918308776949}],\"status\":\"success\"}', NULL, '2024-09-09 10:29:14', '2024-09-09 10:29:15'),
(71, '8308776949', '213084', '{\"balance\":495379,\"batch_id\":3816814435,\"cost\":1,\"num_messages\":1,\"message\":{\"num_parts\":1,\"sender\":\"BYNRIC\",\"content\":\"OTP for verification is: 213084 \\n\\nThank You,\\nFees Regulating Authority\"},\"receipt_url\":\"\",\"custom\":\"\",\"messages\":[{\"id\":\"15153609880\",\"recipient\":918308776949}],\"status\":\"success\"}', NULL, '2024-09-09 10:33:21', '2024-09-09 10:33:22');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role_masters`
--

CREATE TABLE `role_masters` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_roll_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_masters`
--

INSERT INTO `role_masters` (`id`, `name`, `parent_roll_id`, `created_at`, `updated_at`) VALUES
(1, 'ADMIN', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('B8tHnJP3dMHMQPw9ttx6Sq4qE84Aomfk0RpMv4ot', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWUFvT2oxV3ZZRDBQWHRqRmI5VnpWTUhGV1dCWWlBMnozVE12cjA4YyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1721220289);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'bhavin.padhariya@bynaric.in', NULL, '$2y$12$0syk3WrmpCDDA8j/4LnLA.f3zrA4ARpyGhw03OP1fJioAkghFsmIu', 'admin', NULL, NULL, NULL),
(2, 'bhavin', 'bhaviwn.padhariya@bynaric.in', NULL, '$2y$12$aksOrYA45YEe89Puq4RkJ./TI4H6wf2srOBIiD9.klRHc2DxOmIKa', 'admin', NULL, '2024-07-09 01:25:44', '2024-07-09 01:25:44'),
(3, 'bhavin', 'bhavin_2.padhariya@bynaric.in', NULL, '$2y$12$jneAoVjrdwMDBEfrBKTXjeA8I6FbY3uxlZcb/s2TCyMPOXpD3sh3m', 'admin', NULL, '2024-07-09 23:07:34', '2024-07-09 23:07:34'),
(8, 'raahul', 'rahul110@gmail.com', NULL, '$2y$12$J4NYyMIJlNZtaTzAHIoajecwkeez7Kf8jkYeeK/E1oqt7Svcta5NO', '1', NULL, '2024-07-16 01:12:33', '2024-07-16 01:12:33'),
(9, 'admin', '1admin@gmail.com', NULL, '$2a$12$0IAHLVhb4uiCCPEH5WlV.u1scP/f3VCWFKAhe2fXvd6LyT8pN5gvu', '1', NULL, '2024-07-16 01:36:18', '2024-07-16 01:36:18'),
(10, 'Admin', 'admin@gmail.com', NULL, '$2y$12$1BmdrDaRHTMtKSv/RmnpkOOn3wq6O.aHyay4/0RVy/Cw8QxLzQ36u', '1', NULL, '2024-07-18 00:46:48', '2024-07-18 00:46:48');

-- --------------------------------------------------------

--
-- Table structure for table `user_tracker`
--

CREATE TABLE `user_tracker` (
  `id` bigint NOT NULL,
  `ip` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `count` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_tracker`
--

INSERT INTO `user_tracker` (`id`, `ip`, `count`, `created_at`, `updated_at`) VALUES
(1, '127.0.0.1', 2031, '2024-09-19 14:06:05', '2024-09-19 14:06:05');

-- --------------------------------------------------------

--
-- Table structure for table `video_gallery`
--

CREATE TABLE `video_gallery` (
  `id` int NOT NULL,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_id` tinyint NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `video_gallery`
--

INSERT INTO `video_gallery` (`id`, `title`, `file`, `order_id`, `status`, `created_at`, `updated_at`) VALUES
(3, 'abcdef', 'https://fra-bucket-1.s3.ap-south-1.amazonaws.com/uploads/samplemp41726486333720', 3, 1, '2024-09-16 11:33:48', '2024-09-16 11:33:48'),
(5, 'news', 'https://fra-bucket-1.s3.ap-south-1.amazonaws.com/uploads/videoplaybackmp41726724578080', 5, 1, '2024-09-19 05:43:02', '2024-09-19 05:43:02'),
(6, 'test1', 'https://fra-bucket-1.s3.ap-south-1.amazonaws.com/uploads/videoplaybackmp41726725481750', 6, 1, '2024-09-19 05:58:04', '2024-09-19 05:58:04');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `circulars`
--
ALTER TABLE `circulars`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `corrigedums`
--
ALTER TABLE `corrigedums`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course_master`
--
ALTER TABLE `course_master`
  ADD PRIMARY KEY (`cid`),
  ADD UNIQUE KEY `sub_type_2` (`sub_type`,`course_code`),
  ADD KEY `sub_type` (`sub_type`),
  ADD KEY `course_name` (`course_name`);
ALTER TABLE `course_master` ADD FULLTEXT KEY `course_name_2` (`course_name`);
ALTER TABLE `course_master` ADD FULLTEXT KEY `sub_type_3` (`sub_type`);

--
-- Indexes for table `curriculums`
--
ALTER TABLE `curriculums`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `homemenu`
--
ALTER TABLE `homemenu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_page_slider`
--
ALTER TABLE `home_page_slider`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `latest_update`
--
ALTER TABLE `latest_update`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news_and_events`
--
ALTER TABLE `news_and_events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notice_boards`
--
ALTER TABLE `notice_boards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `otp_verify`
--
ALTER TABLE `otp_verify`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mobile` (`mobile`),
  ADD KEY `otp` (`otp`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `role_masters`
--
ALTER TABLE `role_masters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_tracker`
--
ALTER TABLE `user_tracker`
  ADD PRIMARY KEY (`id`),
  ADD KEY `count` (`count`);
ALTER TABLE `user_tracker` ADD FULLTEXT KEY `ip` (`ip`);

--
-- Indexes for table `video_gallery`
--
ALTER TABLE `video_gallery`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `circulars`
--
ALTER TABLE `circulars`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `corrigedums`
--
ALTER TABLE `corrigedums`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `course_master`
--
ALTER TABLE `course_master`
  MODIFY `cid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=560;

--
-- AUTO_INCREMENT for table `curriculums`
--
ALTER TABLE `curriculums`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `homemenu`
--
ALTER TABLE `homemenu`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `home_page_slider`
--
ALTER TABLE `home_page_slider`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `latest_update`
--
ALTER TABLE `latest_update`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `news_and_events`
--
ALTER TABLE `news_and_events`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `notice_boards`
--
ALTER TABLE `notice_boards`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `otp_verify`
--
ALTER TABLE `otp_verify`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `role_masters`
--
ALTER TABLE `role_masters`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user_tracker`
--
ALTER TABLE `user_tracker`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `video_gallery`
--
ALTER TABLE `video_gallery`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
