-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 18, 2026 at 03:57 PM
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
-- Database: `flood_relief_management_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `UserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`UserID`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `affected_person`
--

CREATE TABLE `affected_person` (
  `UserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `affected_person`
--

INSERT INTO `affected_person` (`UserID`) VALUES
(2),
(3),
(4),
(5);

-- --------------------------------------------------------

--
-- Table structure for table `relief_request`
--

CREATE TABLE `relief_request` (
  `RequestID` int(11) NOT NULL,
  `AffectedUserID` int(11) DEFAULT NULL,
  `AdminUserID` int(11) DEFAULT NULL,
  `ReliefType` varchar(50) DEFAULT NULL,
  `District` varchar(50) DEFAULT NULL,
  `DivisionalSecretariat` varchar(50) DEFAULT NULL,
  `GNDivision` varchar(50) DEFAULT NULL,
  `Address` varchar(200) DEFAULT NULL,
  `NoOfFamilyMembers` int(11) DEFAULT NULL,
  `ContactName` varchar(50) DEFAULT NULL,
  `SeverityLevel` varchar(20) DEFAULT NULL,
  `Description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `relief_request`
--

INSERT INTO `relief_request` (`RequestID`, `AffectedUserID`, `AdminUserID`, `ReliefType`, `District`, `DivisionalSecretariat`, `GNDivision`, `Address`, `NoOfFamilyMembers`, `ContactName`, `SeverityLevel`, `Description`) VALUES
(1, 2, 1, 'Food', 'sdfgh', 'fghjk', 'dxfghjk', 'No 45, Temple Road, Colombo 07', 4, '0', 'High', 'nooo'),
(2, 2, 1, 'Water', 'Galle', 'Galle', 'Hikkaduwa', 'No 12, Beach Road, Hikkaduwa', 3, '0', 'High', 'need clean cloths'),
(3, 3, 1, 'Medicine', 'Colombo', 'Colombo 07', 'Maharagama', 'No 88, Lake View, Colombo 07', 4, 'Gagan', 'Low', NULL),
(10, 3, NULL, 'Medicine', 'Colombo', 'colombo 7', 'maharagama', 'No7 ,maharagama,colombo 7,colombo', 8, 'Gagan', 'Low', 'need dry food'),
(33, 2, NULL, 'Medicine', 'Colombo', 'piliyandala', 'piliyandala', 'No 45, Temple Road, Colombo 07', 4, 'Rashmi', 'Medium', 'need essential medicine'),
(35, 3, NULL, 'Medicine', 'Galle', 'Galle', 'Hikkaduwa', 'no113,pannipitiya,colombo', 9, '0', 'High', 'no'),
(37, 3, NULL, 'Water', 'kurunagala', 'kurunagala', 'kurunagala', 'No7 ,maharagama,colombo 7,colombo', 9, 'jasanjith', 'Low', 'need fasthelp');

-- --------------------------------------------------------

--
-- Table structure for table `request_contact`
--

CREATE TABLE `request_contact` (
  `RequestID` int(11) NOT NULL,
  `ContactNumber` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `request_contact`
--

INSERT INTO `request_contact` (`RequestID`, `ContactNumber`) VALUES
(1, '0761111111'),
(1, '0781234567'),
(2, '0772222222'),
(2, '0783333333'),
(3, '0764444444'),
(10, '0764523761'),
(10, '0769100630'),
(33, '0764523761'),
(33, '0915678234'),
(35, '0761111111'),
(35, '0781234567'),
(37, '0779330444'),
(37, '0919330444');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `UserID` int(11) NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Address` varchar(200) DEFAULT NULL,
  `UserName` varchar(50) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `Role` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`UserID`, `FirstName`, `LastName`, `Address`, `UserName`, `Password`, `Role`) VALUES
(1, 'Binuri', 'Vihangi', 'No112, Temple Road, Horana', 'Binuri2003', 'Binu@26', 'admin'),
(2, 'Gagan', 'Kavishka', 'No145/B, Colombo 7, Colombo', 'KGagan15', 'KG4567@RG', 'Customer'),
(3, 'Dinuri', 'Sewmini', 'Nandana, Arachchikanda, Hikkaduwa', 'dinuS45', 'dinu567@', 'Customer'),
(4, 'Nidula', 'Yasanjith', 'Chandrasewana, Rupeewala, Kurunagale', 'nidula@45', 'NY@45D', 'customer'),
(5, 'vv', 'ukk', 'Nandana,', 'as20240449', 'as', 'Customer');

-- --------------------------------------------------------

--
-- Table structure for table `user_contact`
--

CREATE TABLE `user_contact` (
  `UserID` int(11) NOT NULL,
  `ContactNumber` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_contact`
--

INSERT INTO `user_contact` (`UserID`, `ContactNumber`) VALUES
(1, '0769100630'),
(1, '0779100630'),
(2, '0777363640'),
(3, '0761234567'),
(3, '0768910117'),
(4, '0745623888');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD KEY `admin_ibfk_1` (`UserID`);

--
-- Indexes for table `affected_person`
--
ALTER TABLE `affected_person`
  ADD KEY `affected_person_ibfk_1` (`UserID`);

--
-- Indexes for table `relief_request`
--
ALTER TABLE `relief_request`
  ADD PRIMARY KEY (`RequestID`),
  ADD KEY `AffectedUserID` (`AffectedUserID`),
  ADD KEY `AdminUserID` (`AdminUserID`);

--
-- Indexes for table `request_contact`
--
ALTER TABLE `request_contact`
  ADD PRIMARY KEY (`RequestID`,`ContactNumber`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserID`);

--
-- Indexes for table `user_contact`
--
ALTER TABLE `user_contact`
  ADD PRIMARY KEY (`UserID`,`ContactNumber`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `relief_request`
--
ALTER TABLE `relief_request`
  MODIFY `RequestID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `affected_person`
--
ALTER TABLE `affected_person`
  ADD CONSTRAINT `affected_person_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `relief_request`
--
ALTER TABLE `relief_request`
  ADD CONSTRAINT `relief_request_ibfk_1` FOREIGN KEY (`AffectedUserID`) REFERENCES `affected_person` (`UserID`),
  ADD CONSTRAINT `relief_request_ibfk_2` FOREIGN KEY (`AdminUserID`) REFERENCES `admin` (`UserID`);

--
-- Constraints for table `request_contact`
--
ALTER TABLE `request_contact`
  ADD CONSTRAINT `request_contact_ibfk_1` FOREIGN KEY (`RequestID`) REFERENCES `relief_request` (`RequestID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_contact`
--
ALTER TABLE `user_contact`
  ADD CONSTRAINT `user_contact_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
