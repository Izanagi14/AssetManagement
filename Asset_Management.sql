-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 12, 2017 at 01:38 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Asset_Management`
--

-- --------------------------------------------------------

--
-- Table structure for table `Asset`
--

CREATE TABLE `Asset` (
  `AssetID` varchar(100) NOT NULL,
  `Asset_Name` text,
  `Date` date DEFAULT NULL,
  `Quality` text,
  `Eid` varchar(100) DEFAULT NULL,
  `Minutes_From` date DEFAULT NULL,
  `Minutes_To` date DEFAULT NULL,
  `Skill` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Asset`
--

INSERT INTO `Asset` (`AssetID`, `Asset_Name`, `Date`, `Quality`, `Eid`, `Minutes_From`, `Minutes_To`, `Skill`) VALUES
('K1', 'Car', '2017-10-10', 'Good', 'Emp1', '2017-10-10', '2017-10-12', 'Driving');

-- --------------------------------------------------------

--
-- Table structure for table `Attachment`
--

CREATE TABLE `Attachment` (
  `AssetID` varchar(100) NOT NULL,
  `File` blob NOT NULL,
  `AttachmentID` int(11) NOT NULL,
  `Eid` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Attachment`
--

INSERT INTO `Attachment` (`AssetID`, `File`, `AttachmentID`, `Eid`) VALUES
('K12', 0x6a6176612e696f2e46696c65496e70757453747265616d403130623466643939, 1, '126'),
('K12', 0x6a6176612e696f2e46696c65496e70757453747265616d4064333538373238, 2, '125'),
('121212', 0x6a6176612e696f2e46696c65496e70757453747265616d403563623434633265, 3, 'Emp1');

-- --------------------------------------------------------

--
-- Table structure for table `Employees`
--

CREATE TABLE `Employees` (
  `Eid` varchar(100) NOT NULL,
  `Name` text,
  `Designation` text,
  `Password` text,
  `Skills` text NOT NULL,
  `Free` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Employees`
--

INSERT INTO `Employees` (`Eid`, `Name`, `Designation`, `Password`, `Skills`, `Free`) VALUES
('1111', 'Apurv Tandon', 'Manager', '1234', 'Driving,House Keeping,Managing,Programming', 'false'),
('125', 'John Smith', 'Employee', 'janitor', 'house keeping,driving', 'false'),
('126', 'John Doe', 'Employee', 'program', 'Programming', 'false'),
('127', 'John Doe', 'Employee', 'program', 'Programming', 'true'),
('128', 'John Doe', 'Employee', 'program', 'Programming', 'true'),
('129', 'John Doe', 'Employee', 'program', 'Programming', 'true'),
('Emp1', 'Mayank Sourabh', 'Employee', '1234', 'House keeping,Driving', 'false'),
('Emp2', 'Badhshah', 'Employee', '1234', 'Programming', 'true'),
('Emp3', 'Kal ho nah ho', 'Employee', '12345', 'Dont know', 'true');

-- --------------------------------------------------------

--
-- Table structure for table `Notes`
--

CREATE TABLE `Notes` (
  `AssetID` varchar(100) NOT NULL,
  `Text` text NOT NULL,
  `NoteID` int(11) NOT NULL,
  `Eid` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Notes`
--

INSERT INTO `Notes` (`AssetID`, `Text`, `NoteID`, `Eid`) VALUES
('12312', 'Done', 1, '126'),
('K12', 'Done', 8, '125'),
('121212', 'Work Done', 9, '126'),
('121212', 'To do', 10, 'Emp1');

-- --------------------------------------------------------

--
-- Table structure for table `Task`
--

CREATE TABLE `Task` (
  `AssetID` varchar(100) DEFAULT NULL,
  `Asset_Name` text,
  `Eid` varchar(100) DEFAULT NULL,
  `Task_Name` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Task`
--

INSERT INTO `Task` (`AssetID`, `Asset_Name`, `Eid`, `Task_Name`) VALUES
('213', 'Cat', '125', 'Deport'),
('213', 'Cat', '125', 'Deport');

-- --------------------------------------------------------

--
-- Table structure for table `Watchdog`
--

CREATE TABLE `Watchdog` (
  `AssetID` varchar(100) NOT NULL,
  `EID` varchar(100) NOT NULL,
  `CID` varchar(100) NOT NULL,
  `WID` int(11) NOT NULL,
  `Title` text NOT NULL,
  `Body` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Watchdog`
--

INSERT INTO `Watchdog` (`AssetID`, `EID`, `CID`, `WID`, `Title`, `Body`) VALUES
('A1', '126', 'Emp1', 4, 'Co', 'keep cool'),
('A1', '126', 'Emp1', 5, 'asds', 'asdada'),
('121212', 'Emp1', 'Emp2', 6, 'Kaisa', 'hain be');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Asset`
--
ALTER TABLE `Asset`
  ADD PRIMARY KEY (`AssetID`);

--
-- Indexes for table `Attachment`
--
ALTER TABLE `Attachment`
  ADD PRIMARY KEY (`AttachmentID`);

--
-- Indexes for table `Employees`
--
ALTER TABLE `Employees`
  ADD PRIMARY KEY (`Eid`);

--
-- Indexes for table `Notes`
--
ALTER TABLE `Notes`
  ADD PRIMARY KEY (`NoteID`);

--
-- Indexes for table `Watchdog`
--
ALTER TABLE `Watchdog`
  ADD PRIMARY KEY (`WID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Attachment`
--
ALTER TABLE `Attachment`
  MODIFY `AttachmentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `Notes`
--
ALTER TABLE `Notes`
  MODIFY `NoteID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `Watchdog`
--
ALTER TABLE `Watchdog`
  MODIFY `WID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
