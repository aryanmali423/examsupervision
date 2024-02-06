-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 04, 2024 at 08:00 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `examination2`
--

-- --------------------------------------------------------

--
-- Table structure for table `allotment`
--

CREATE TABLE `allotment` (
  `p_id` int(11) NOT NULL,
  `pr_id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL,
  `e_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `role` enum('rs','js','ss') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `c_id` int(11) NOT NULL,
  `c_name` varchar(50) NOT NULL,
  `sem` varchar(50) NOT NULL,
  `pr_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `d_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `nrs` int(11) NOT NULL,
  `nvs` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`d_id`, `name`, `nrs`, `nvs`) VALUES
(1, 'Information Technology', 60, 6),
(2, 'BSc-Bio Technology', 55, 23),
(3, 'BCOM Banking & Insurance', 67, 34),
(4, 'BCOM Accounting and Finance', 5, 2);

-- --------------------------------------------------------

--
-- Table structure for table `exam`
--

CREATE TABLE `exam` (
  `e_id` int(11) NOT NULL,
  `type` enum('C','R','A') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `exam`
--

INSERT INTO `exam` (`e_id`, `type`) VALUES
(1, 'C'),
(2, 'R'),
(3, 'A');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `type` enum('A','O') NOT NULL,
  `status` enum('A','I') NOT NULL,
  `p_id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`username`, `password`, `type`, `status`, `p_id`, `email`) VALUES
('amit', '1111', 'O', 'A', 1, 'walfra52777@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `professor`
--

CREATE TABLE `professor` (
  `p_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `doj` date NOT NULL,
  `reg_sfc` enum('reg','sfc','both') NOT NULL,
  `designation` varchar(50) NOT NULL,
  `type` enum('R','V') NOT NULL,
  `ecm` enum('Y','N') NOT NULL,
  `unfair_means` enum('Y','N') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `professor`
--

INSERT INTO `professor` (`p_id`, `name`, `doj`, `reg_sfc`, `designation`, `type`, `ecm`, `unfair_means`) VALUES
(1, 'Mr. Amit Breed', '2017-02-02', 'sfc', 'Assistant Professor', 'R', 'N', 'N');

-- --------------------------------------------------------

--
-- Table structure for table `programme`
--

CREATE TABLE `programme` (
  `pr_id` int(11) NOT NULL,
  `pr_name` varchar(50) NOT NULL,
  `strength` int(11) NOT NULL,
  `d_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pro_dep_prog_cor`
--

CREATE TABLE `pro_dep_prog_cor` (
  `p_id` int(11) NOT NULL,
  `d_id` int(11) NOT NULL,
  `pr_id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `p_course`
--

CREATE TABLE `p_course` (
  `p_id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `p_department`
--

CREATE TABLE `p_department` (
  `p_id` int(11) NOT NULL,
  `d_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `timetable`
--

CREATE TABLE `timetable` (
  `pr_id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL,
  `e_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `f_time` time NOT NULL,
  `t_time` time NOT NULL,
  `nob` int(11) NOT NULL,
  `academic_year` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `unavailability`
--

CREATE TABLE `unavailability` (
  `date` date NOT NULL,
  `reason` varchar(100) NOT NULL,
  `p_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `allotment`
--
ALTER TABLE `allotment`
  ADD KEY `allotment_ibfk_1` (`c_id`),
  ADD KEY `allotment_ibfk_2` (`e_id`),
  ADD KEY `allotment_ibfk_3` (`pr_id`),
  ADD KEY `allotment_ibfk_4` (`p_id`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`c_id`),
  ADD KEY `course_ibfk_1` (`pr_id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`d_id`);

--
-- Indexes for table `exam`
--
ALTER TABLE `exam`
  ADD PRIMARY KEY (`e_id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`username`),
  ADD KEY `p_id` (`p_id`);

--
-- Indexes for table `professor`
--
ALTER TABLE `professor`
  ADD PRIMARY KEY (`p_id`);

--
-- Indexes for table `programme`
--
ALTER TABLE `programme`
  ADD PRIMARY KEY (`pr_id`),
  ADD KEY `programme_ibfk_1` (`d_id`);

--
-- Indexes for table `pro_dep_prog_cor`
--
ALTER TABLE `pro_dep_prog_cor`
  ADD KEY `p_id` (`p_id`),
  ADD KEY `d_id` (`d_id`),
  ADD KEY `pr_id` (`pr_id`),
  ADD KEY `c_id` (`c_id`);

--
-- Indexes for table `p_course`
--
ALTER TABLE `p_course`
  ADD KEY `c_id` (`c_id`),
  ADD KEY `p_id` (`p_id`);

--
-- Indexes for table `p_department`
--
ALTER TABLE `p_department`
  ADD KEY `d_id` (`d_id`),
  ADD KEY `p_id` (`p_id`);

--
-- Indexes for table `timetable`
--
ALTER TABLE `timetable`
  ADD KEY `timetable_ibfk_1` (`pr_id`),
  ADD KEY `timetable_ibfk_2` (`c_id`),
  ADD KEY `timetable_ibfk_3` (`e_id`);

--
-- Indexes for table `unavailability`
--
ALTER TABLE `unavailability`
  ADD KEY `unavailability_ibfk_1` (`p_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `d_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `exam`
--
ALTER TABLE `exam`
  MODIFY `e_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `professor`
--
ALTER TABLE `professor`
  MODIFY `p_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=178;

--
-- AUTO_INCREMENT for table `programme`
--
ALTER TABLE `programme`
  MODIFY `pr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `allotment`
--
ALTER TABLE `allotment`
  ADD CONSTRAINT `allotment_ibfk_1` FOREIGN KEY (`c_id`) REFERENCES `course` (`c_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `allotment_ibfk_2` FOREIGN KEY (`e_id`) REFERENCES `exam` (`e_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `allotment_ibfk_3` FOREIGN KEY (`pr_id`) REFERENCES `programme` (`pr_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `allotment_ibfk_4` FOREIGN KEY (`p_id`) REFERENCES `professor` (`p_id`) ON UPDATE CASCADE;

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_ibfk_1` FOREIGN KEY (`pr_id`) REFERENCES `programme` (`pr_id`) ON UPDATE CASCADE;

--
-- Constraints for table `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `login_ibfk_1` FOREIGN KEY (`p_id`) REFERENCES `professor` (`p_id`) ON UPDATE CASCADE;

--
-- Constraints for table `programme`
--
ALTER TABLE `programme`
  ADD CONSTRAINT `programme_ibfk_1` FOREIGN KEY (`d_id`) REFERENCES `department` (`d_id`) ON UPDATE CASCADE;

--
-- Constraints for table `pro_dep_prog_cor`
--
ALTER TABLE `pro_dep_prog_cor`
  ADD CONSTRAINT `c_id` FOREIGN KEY (`c_id`) REFERENCES `course` (`c_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `d_id` FOREIGN KEY (`d_id`) REFERENCES `department` (`d_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `p_id` FOREIGN KEY (`p_id`) REFERENCES `professor` (`p_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pr_id` FOREIGN KEY (`pr_id`) REFERENCES `programme` (`pr_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `p_course`
--
ALTER TABLE `p_course`
  ADD CONSTRAINT `p_course_ibfk_1` FOREIGN KEY (`c_id`) REFERENCES `course` (`c_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `p_course_ibfk_2` FOREIGN KEY (`p_id`) REFERENCES `professor` (`p_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `p_department`
--
ALTER TABLE `p_department`
  ADD CONSTRAINT `p_department_ibfk_1` FOREIGN KEY (`d_id`) REFERENCES `department` (`d_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `p_department_ibfk_2` FOREIGN KEY (`p_id`) REFERENCES `professor` (`p_id`);

--
-- Constraints for table `timetable`
--
ALTER TABLE `timetable`
  ADD CONSTRAINT `timetable_ibfk_1` FOREIGN KEY (`pr_id`) REFERENCES `programme` (`pr_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `timetable_ibfk_2` FOREIGN KEY (`c_id`) REFERENCES `course` (`c_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `timetable_ibfk_3` FOREIGN KEY (`e_id`) REFERENCES `exam` (`e_id`) ON UPDATE CASCADE;

--
-- Constraints for table `unavailability`
--
ALTER TABLE `unavailability`
  ADD CONSTRAINT `unavailability_ibfk_1` FOREIGN KEY (`p_id`) REFERENCES `professor` (`p_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
