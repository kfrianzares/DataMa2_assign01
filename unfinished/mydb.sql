-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 20, 2019 at 08:43 PM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.7

CREATE DATABASE mydb;
USE mydb;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mydb`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `id` int(11) NOT NULL,
  `acc_name` varchar(45) DEFAULT NULL,
  `acc_desc` varchar(45) DEFAULT NULL,
  `Client_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`id`, `acc_name`, `acc_desc`, `Client_id`) VALUES
(1428, 'John', 'Savings', 1247);

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `id` int(11) NOT NULL,
  `cli_name` varchar(55) DEFAULT NULL,
  `cli_address` varchar(45) DEFAULT NULL,
  `cli_desc` varchar(45) DEFAULT NULL,
  `Teller_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`id`, `cli_name`, `cli_address`, `cli_desc`, `Teller_id`) VALUES
(1247, 'John', 'Taguig', 'presenting concern', 1357);

-- --------------------------------------------------------

--
-- Table structure for table `investment`
--

CREATE TABLE `investment` (
  `id` int(11) NOT NULL,
  `inv_type` varchar(45) DEFAULT NULL,
  `inv_date` date DEFAULT NULL,
  `inv` date DEFAULT NULL,
  `Client_id` int(11) NOT NULL,
  `Teller_id` int(11) NOT NULL,
  `Client_id1` int(11) NOT NULL,
  `Client_Teller_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `investment`
--

INSERT INTO `investment` (`id`, `inv_type`, `inv_date`, `inv`, `Client_id`, `Teller_id`, `Client_id1`, `Client_Teller_id`) VALUES
(1896, 'Property', '2019-08-07', '0000-00-00', 1246, 1578, 1247, 1357);

-- --------------------------------------------------------

--
-- Table structure for table `loan`
--

CREATE TABLE `loan` (
  `id` int(11) NOT NULL,
  `loan_amt` varchar(45) DEFAULT NULL,
  `loan_date` date DEFAULT NULL,
  `loan_type` varchar(45) DEFAULT NULL,
  `Client_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `loan`
--

INSERT INTO `loan` (`id`, `loan_amt`, `loan_date`, `loan_type`, `Client_id`) VALUES
(1948, '100000', '2018-01-03', 'Installment', 1247);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` int(11) NOT NULL,
  `pay_type` varchar(45) DEFAULT NULL,
  `pay_address` varchar(45) DEFAULT NULL,
  `Client_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id`, `pay_type`, `pay_address`, `Client_id`) VALUES
(1034, 'Cash', 'Pasay', 1247);

-- --------------------------------------------------------

--
-- Table structure for table `slip`
--

CREATE TABLE `slip` (
  `id` int(11) NOT NULL,
  `slip_size` varchar(45) DEFAULT NULL,
  `slip_date` varchar(45) DEFAULT NULL,
  `Client_id` int(11) NOT NULL,
  `Client_Teller_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `slip`
--

INSERT INTO `slip` (`id`, `slip_size`, `slip_date`, `Client_id`, `Client_Teller_id`) VALUES
(3148, 'small', '2015-09-09', 1247, 1357);

-- --------------------------------------------------------

--
-- Table structure for table `teller`
--

CREATE TABLE `teller` (
  `id` int(11) NOT NULL,
  `tell_name` varchar(55) DEFAULT NULL,
  `tell_address` varchar(45) DEFAULT NULL,
  `tell_desc` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `teller`
--

INSERT INTO `teller` (`id`, `tell_name`, `tell_address`, `tell_desc`) VALUES
(1357, 'Ann', 'Makati', 'Service Provider');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`,`Client_id`),
  ADD KEY `fk_Account_Client1_idx` (`Client_id`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`,`Teller_id`),
  ADD KEY `fk_Client_Teller1_idx` (`Teller_id`);

--
-- Indexes for table `investment`
--
ALTER TABLE `investment`
  ADD PRIMARY KEY (`id`,`Client_id`,`Teller_id`,`Client_id1`,`Client_Teller_id`),
  ADD KEY `fk_Investment_Client1_idx` (`Client_id1`,`Client_Teller_id`);

--
-- Indexes for table `loan`
--
ALTER TABLE `loan`
  ADD PRIMARY KEY (`id`,`Client_id`),
  ADD KEY `fk_Loan_Client1_idx` (`Client_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`,`Client_id`),
  ADD KEY `fk_Payment_Client1_idx` (`Client_id`);

--
-- Indexes for table `slip`
--
ALTER TABLE `slip`
  ADD PRIMARY KEY (`id`,`Client_id`,`Client_Teller_id`),
  ADD KEY `fk_Slip_Client1_idx` (`Client_id`,`Client_Teller_id`);

--
-- Indexes for table `teller`
--
ALTER TABLE `teller`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1035;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account`
--
ALTER TABLE `account`
  ADD CONSTRAINT `fk_Account_Client1` FOREIGN KEY (`Client_id`) REFERENCES `client` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `fk_Client_Teller1` FOREIGN KEY (`Teller_id`) REFERENCES `teller` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `investment`
--
ALTER TABLE `investment`
  ADD CONSTRAINT `fk_Investment_Client1` FOREIGN KEY (`Client_id1`,`Client_Teller_id`) REFERENCES `client` (`id`, `Teller_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `loan`
--
ALTER TABLE `loan`
  ADD CONSTRAINT `fk_Loan_Client1` FOREIGN KEY (`Client_id`) REFERENCES `client` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `fk_Payment_Client1` FOREIGN KEY (`Client_id`) REFERENCES `client` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `slip`
--
ALTER TABLE `slip`
  ADD CONSTRAINT `fk_Slip_Client1` FOREIGN KEY (`Client_id`,`Client_Teller_id`) REFERENCES `client` (`id`, `Teller_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
