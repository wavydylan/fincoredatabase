-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 16, 2026 at 01:57 AM
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
-- Database: `fincore`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `Customer_ID` int(11) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`Customer_ID`, `Name`, `Email`, `Phone`) VALUES
(1, 'Jane Smith', 'jane@email.com', '555-2001'),
(2, 'Carlos Rivera', 'carlos@email.com', '555-2002'),
(3, 'Emily Tran', 'emily@email.com', '555-2003'),
(4, 'Marcus Johnson', 'marcus.j@email.com', '555-2004'),
(5, 'Priya Patel', 'priya.p@email.com', '555-2005'),
(6, 'Derek Williams', 'derek.w@email.com', '555-2006'),
(7, 'Aisha Brown', 'aisha.b@email.com', '555-2007'),
(8, 'Tyler Nguyen', 'tyler.n@email.com', '555-2008'),
(9, 'Sofia Martinez', 'sofia.m@email.com', '555-2009'),
(10, 'James Okafor', 'james.o@email.com', '555-2010'),
(11, 'Rachel Kim', 'rachel.k@email.com', '555-2011'),
(12, 'Brandon Scott', 'brandon.s@email.com', '555-2012'),
(13, 'Leila Hassan', 'leila.h@email.com', '555-2013'),
(14, 'Noah Carter', 'noah.c@email.com', '555-2014'),
(15, 'Destiny Flores', 'destiny.f@email.com', '555-2015');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `Employee_ID` int(11) NOT NULL,
  `Employee_name` varchar(100) DEFAULT NULL,
  `Phone` varchar(100) DEFAULT NULL,
  `Role` varchar(100) DEFAULT NULL,
  `Hire_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`Employee_ID`, `Employee_name`, `Phone`, `Role`, `Hire_date`) VALUES
(1, 'John Doe', '555-1001', 'Manager', '2022-03-15'),
(2, 'Sarah Lane', '555-1002', 'Sales Rep', '2023-01-10'),
(3, 'Mike Chen', '555-1003', 'Sales Rep', '2023-06-20'),
(4, 'Angela Brooks', '555-1004', 'Sales Rep', '2022-07-01'),
(5, 'Kevin Morales', '555-1005', 'Sales Rep', '2023-02-14'),
(6, 'Tiffany Grant', '555-1006', 'Manager', '2021-11-30'),
(7, 'Derrick Stone', '555-1007', 'Sales Rep', '2023-09-05'),
(8, 'Monica Reid', '555-1008', 'Accountant', '2022-04-18'),
(9, 'Jason Park', '555-1009', 'Sales Rep', '2024-01-08'),
(10, 'Vanessa Cruz', '555-1010', 'Accountant', '2021-06-22'),
(11, 'Andre Thompson', '555-1011', 'Sales Rep', '2023-11-15'),
(12, 'Brittany Evans', '555-1012', 'Sales Rep', '2024-03-01'),
(13, 'Samuel Obi', '555-1013', 'Manager', '2020-08-10'),
(14, 'Lauren Hicks', '555-1014', 'Sales Rep', '2023-05-27'),
(15, 'Chris Yamamoto', '555-1015', 'Accountant', '2022-12-03');

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `Expense_ID` int(11) NOT NULL,
  `Employee_ID` int(11) DEFAULT NULL,
  `Category` varchar(100) DEFAULT NULL,
  `Amount` decimal(10,2) DEFAULT NULL,
  `Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`Expense_ID`, `Employee_ID`, `Category`, `Amount`, `Date`) VALUES
(1, 1, 'Travel', 150.00, '2024-01-05'),
(2, 2, 'Supplies', 45.50, '2024-01-10'),
(3, 3, 'Travel', 200.00, '2024-01-12'),
(4, 1, 'Software', 299.00, '2024-02-01'),
(5, 2, 'Travel', 175.50, '2024-02-08'),
(6, 3, 'Supplies', 62.00, '2024-02-15'),
(7, 1, 'Marketing', 500.00, '2024-03-01'),
(8, 4, 'Travel', 220.75, '2024-03-10'),
(9, 2, 'Utilities', 130.00, '2024-03-18'),
(10, 5, 'Supplies', 88.25, '2024-04-03'),
(11, 1, 'Software', 199.00, '2024-04-10'),
(12, 3, 'Marketing', 350.00, '2024-04-22'),
(13, 4, 'Travel', 410.00, '2024-05-06'),
(14, 2, 'Utilities', 145.00, '2024-05-14'),
(15, 5, 'Supplies', 73.50, '2024-05-21');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `Inventory_ID` int(11) NOT NULL,
  `Product_ID` int(11) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`Inventory_ID`, `Product_ID`, `Quantity`) VALUES
(1, 1, 100),
(2, 2, 75),
(3, 3, 50),
(4, 4, 200),
(5, 5, 85),
(6, 6, 60),
(7, 7, 45),
(8, 8, 110),
(9, 9, 90),
(10, 10, 30),
(11, 11, 55),
(12, 12, 25),
(13, 13, 140),
(14, 14, 95),
(15, 15, 175);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `Payment_ID` int(11) NOT NULL,
  `Sale_ID` int(11) DEFAULT NULL,
  `Payment_date` date DEFAULT NULL,
  `Payment_method` varchar(100) DEFAULT NULL,
  `Amount_paid` decimal(10,2) DEFAULT NULL,
  `Payment_status` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`Payment_ID`, `Sale_ID`, `Payment_date`, `Payment_method`, `Amount_paid`, `Payment_status`) VALUES
(1, 1, '2024-01-15', 'Credit Card', 79.98, 'Paid'),
(2, 2, '2024-01-18', 'Cash', 99.99, 'Paid'),
(3, 3, '2024-01-25', 'Credit Card', 149.98, 'Pending'),
(4, 4, '2024-02-03', 'Credit Card', 54.98, 'Paid'),
(5, 5, '2024-02-10', 'Cash', 119.99, 'Paid'),
(6, 6, '2024-02-14', 'Credit Card', 224.97, 'Paid'),
(7, 7, '2024-03-01', 'Debit Card', 79.99, 'Paid'),
(8, 8, '2024-03-08', 'Credit Card', 194.97, 'Pending'),
(9, 9, '2024-03-15', 'Cash', 44.99, 'Paid'),
(10, 10, '2024-04-02', 'Credit Card', 299.98, 'Paid'),
(11, 11, '2024-04-10', 'Debit Card', 89.99, 'Pending'),
(12, 12, '2024-04-18', 'Cash', 164.98, 'Paid'),
(13, 13, '2024-05-05', 'Credit Card', 54.98, 'Paid'),
(14, 14, '2024-05-12', 'Debit Card', 149.99, 'Pending'),
(15, 15, '2024-05-20', 'Cash', 109.98, 'Paid');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `Product_ID` int(11) NOT NULL,
  `Product_name` varchar(100) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`Product_ID`, `Product_name`, `Price`) VALUES
(1, 'Widget A', 29.99),
(2, 'Widget B', 49.99),
(3, 'Gadget Pro', 99.99),
(4, 'Smart Tracker', 19.99),
(5, 'Desk Organizer', 34.99),
(6, 'Wireless Charger', 44.99),
(7, 'Bluetooth Speaker', 79.99),
(8, 'LED Desk Lamp', 54.99),
(9, 'USB Hub Pro', 39.99),
(10, 'Mechanical Keyboard', 119.99),
(11, 'Webcam HD', 89.99),
(12, 'Noise Cancelling Earbuds', 149.99),
(13, 'Laptop Stand', 29.99),
(14, 'Monitor Riser', 24.99),
(15, 'Cable Management Kit', 14.99);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `Sale_ID` int(11) NOT NULL,
  `Customer_ID` int(11) DEFAULT NULL,
  `Employee_ID` int(11) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Total_amount` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`Sale_ID`, `Customer_ID`, `Employee_ID`, `Date`, `Total_amount`) VALUES
(1, 1, 2, '2024-01-15', 79.98),
(2, 2, 3, '2024-01-18', 99.99),
(3, 3, 2, '2024-01-20', 149.98),
(4, 4, 4, '2024-02-03', 54.98),
(5, 5, 2, '2024-02-10', 119.99),
(6, 6, 5, '2024-02-14', 224.97),
(7, 7, 4, '2024-03-01', 79.99),
(8, 8, 7, '2024-03-08', 194.97),
(9, 9, 2, '2024-03-15', 44.99),
(10, 10, 5, '2024-04-02', 299.98),
(11, 11, 7, '2024-04-10', 89.99),
(12, 12, 4, '2024-04-18', 164.98),
(13, 13, 2, '2024-05-05', 54.98),
(14, 14, 5, '2024-05-12', 149.99),
(15, 15, 7, '2024-05-20', 109.98);

-- --------------------------------------------------------

--
-- Table structure for table `sale_product`
--

CREATE TABLE `sale_product` (
  `Sale_ID` int(11) NOT NULL,
  `Product_ID` int(11) NOT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `Unit_price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sale_product`
--

INSERT INTO `sale_product` (`Sale_ID`, `Product_ID`, `Quantity`, `Unit_price`) VALUES
(1, 1, 2, 29.99),
(1, 2, 1, 49.99),
(2, 3, 1, 99.99),
(3, 1, 1, 29.99),
(3, 2, 2, 49.99),
(4, 4, 1, 19.99),
(4, 13, 1, 29.99),
(5, 10, 1, 119.99),
(6, 7, 1, 79.99),
(6, 8, 1, 54.99),
(6, 14, 1, 24.99),
(7, 7, 1, 79.99),
(8, 6, 1, 44.99),
(8, 12, 1, 149.99),
(9, 6, 1, 44.99),
(10, 12, 2, 149.99),
(11, 11, 1, 89.99),
(12, 8, 1, 54.99),
(12, 9, 1, 39.99),
(12, 13, 1, 29.99),
(13, 4, 1, 19.99),
(13, 13, 1, 29.99),
(14, 12, 1, 149.99),
(15, 4, 1, 19.99),
(15, 11, 1, 89.99);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Customer_ID`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`Employee_ID`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`Expense_ID`),
  ADD KEY `Employee_ID` (`Employee_ID`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`Inventory_ID`),
  ADD KEY `Product_ID` (`Product_ID`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`Payment_ID`),
  ADD KEY `Sale_ID` (`Sale_ID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`Product_ID`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`Sale_ID`),
  ADD KEY `Customer_ID` (`Customer_ID`),
  ADD KEY `Employee_ID` (`Employee_ID`);

--
-- Indexes for table `sale_product`
--
ALTER TABLE `sale_product`
  ADD PRIMARY KEY (`Sale_ID`,`Product_ID`),
  ADD KEY `Product_ID` (`Product_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `expenses`
--
ALTER TABLE `expenses`
  ADD CONSTRAINT `expenses_ibfk_1` FOREIGN KEY (`Employee_ID`) REFERENCES `employee` (`Employee_ID`);

--
-- Constraints for table `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`Sale_ID`) REFERENCES `sales` (`Sale_ID`);

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`),
  ADD CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`Employee_ID`) REFERENCES `employee` (`Employee_ID`);

--
-- Constraints for table `sale_product`
--
ALTER TABLE `sale_product`
  ADD CONSTRAINT `sale_product_ibfk_1` FOREIGN KEY (`Sale_ID`) REFERENCES `sales` (`Sale_ID`),
  ADD CONSTRAINT `sale_product_ibfk_2` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
