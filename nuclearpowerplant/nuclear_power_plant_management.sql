-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 02, 2023 at 03:09 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nuclear_power_plant_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `environment`
--

CREATE TABLE `environment` (
  `DATE` date NOT NULL,
  `TEMPERATURE_OF_CORE(CELSIUS)` float NOT NULL,
  `RADIATION_LEVEL` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `environment`
--

INSERT INTO `environment` (`DATE`, `TEMPERATURE_OF_CORE(CELSIUS)`, `RADIATION_LEVEL`) VALUES
('2022-10-24', 300.01, 0.1),
('2022-10-25', 301, 0),
('2022-10-26', 300.97, 0.2),
('2022-10-27', 302.97, 0.2),
('2022-10-28', 299.98, 0);

-- --------------------------------------------------------

--
-- Table structure for table `logbook`
--

CREATE TABLE `logbook` (
  `DATE` date NOT NULL,
  `ID` int(11) NOT NULL,
  `NAME` varchar(25) NOT NULL,
  `LOGIN` time NOT NULL,
  `LOGOUT` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `logbook`
--

INSERT INTO `logbook` (`DATE`, `ID`, `NAME`, `LOGIN`, `LOGOUT`) VALUES
('2022-10-24', 10, 'DR JOHN', '09:00:00', '20:00:00'),
('2022-10-25', 11, 'DR KRISHNA GOWDA', '08:00:00', '21:00:00'),
('2022-10-26', 12, 'DR EMMA GREEN', '10:30:00', '21:30:00'),
('2022-10-27', 13, 'DR JISOO PARK', '08:30:00', '19:00:00'),
('2022-10-28', 14, 'DR NEHA CHADHA', '07:30:00', '17:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `management`
--

CREATE TABLE `management` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(25) NOT NULL,
  `AGE` int(11) NOT NULL,
  `ADDRESS` varchar(25) NOT NULL,
  `EDU_QLFN` varchar(40) NOT NULL,
  `EXPERIENCE` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `management`
--

INSERT INTO `management` (`ID`, `NAME`, `AGE`, `ADDRESS`, `EDU_QLFN`, `EXPERIENCE`) VALUES
(10, 'DR JOHN', 37, 'CAMBRIDGE', 'PHD IN NUCLEAR PHYSICS', '5 YR'),
(11, 'DR KRISHNA GOWDA', 39, 'SOMERVILLE', 'PHD IN ATOMIC PHYSICS', '7 YR'),
(12, 'DR EMMA GREEN', 40, 'BROOKLINE', 'PHD IN NUCLEAR PHYSICS', '11 YR'),
(13, 'DR JISOO PARK', 35, 'CAMBRIDGE', 'PHD IN ATOMIC & MOLECULAR PHYSICS', '4 YR'),
(14, 'DR NEHA CHADHA', 45, 'SOMERVILLE', 'PHD IN ATOMIC PHYSICS', '15 YR');

-- --------------------------------------------------------

--
-- Table structure for table `record`
--

CREATE TABLE `record` (
  `DATE` date NOT NULL,
  `ID` int(11) NOT NULL,
  `NAME` varchar(25) NOT NULL,
  `TOTAL_PRESENT` int(11) NOT NULL,
  `REMARKS` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `record`
--

INSERT INTO `record` (`DATE`, `ID`, `NAME`, `TOTAL_PRESENT`, `REMARKS`) VALUES
('2022-10-24', 10, 'DR JOHN', 3, 'TOPICS COVERED- FISSION AND FUSSION'),
('2022-10-25', 11, 'DR KRISHNA GOWDA', 3, 'TOPIC - URANIUM IN REACTOR CORE'),
('2022-10-26', 12, 'DR EMMA GREEN', 4, 'VISITED THE COOLING TOWER'),
('2022-10-27', 13, 'DR JISOO PARK', 2, 'DEMONSTRATED REACTOR STARTUP AND SHUTDOWN'),
('2022-10-28', 14, 'DR NEHA CHADHA', 7, 'EXPERIMENT WITH NEUTRONS');

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE `team` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(25) NOT NULL,
  `NO_OF_STUDENTS` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `team`
--

INSERT INTO `team` (`ID`, `NAME`, `NO_OF_STUDENTS`) VALUES
(10, 'DR JOHN', 3),
(11, 'DR KRISHNA GOWDA', 4),
(12, 'DR EMMA GREEN', 5),
(13, 'DR JISOO PARK', 2),
(14, 'DR NEHA CHADHA', 7);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `environment`
--
ALTER TABLE `environment`
  ADD PRIMARY KEY (`DATE`);

--
-- Indexes for table `logbook`
--
ALTER TABLE `logbook`
  ADD PRIMARY KEY (`DATE`),
  ADD KEY `ID` (`ID`);

--
-- Indexes for table `management`
--
ALTER TABLE `management`
  ADD PRIMARY KEY (`ID`,`NAME`);

--
-- Indexes for table `record`
--
ALTER TABLE `record`
  ADD PRIMARY KEY (`DATE`,`ID`),
  ADD KEY `record_ibfk_2` (`ID`);

--
-- Indexes for table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `environment`
--
ALTER TABLE `environment`
  ADD CONSTRAINT `environment_ibfk_1` FOREIGN KEY (`DATE`) REFERENCES `logbook` (`DATE`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `logbook`
--
ALTER TABLE `logbook`
  ADD CONSTRAINT `logbook_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `management` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `record`
--
ALTER TABLE `record`
  ADD CONSTRAINT `record_ibfk_1` FOREIGN KEY (`DATE`) REFERENCES `logbook` (`DATE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `record_ibfk_2` FOREIGN KEY (`ID`) REFERENCES `management` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `team`
--
ALTER TABLE `team`
  ADD CONSTRAINT `team_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `management` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
