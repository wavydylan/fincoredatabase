-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 18, 2026 at 01:46 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `FinCore`
--

-- --------------------------------------------------------

--
-- Table structure for table `Accounts_Payable`
--

CREATE TABLE `Accounts_Payable` (
  `AP_ID` int(11) NOT NULL,
  `Vendor_Name` varchar(100) NOT NULL,
  `Expense_ID` int(11) DEFAULT NULL,
  `Amount_Owed` decimal(10,2) NOT NULL,
  `Due_Date` date NOT NULL,
  `Payment_Status` varchar(50) DEFAULT 'Unpaid',
  `Payment_Date` date DEFAULT NULL,
  `Notes` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Accounts_Payable`
--

INSERT INTO `Accounts_Payable` (`AP_ID`, `Vendor_Name`, `Expense_ID`, `Amount_Owed`, `Due_Date`, `Payment_Status`, `Payment_Date`, `Notes`) VALUES
(1, 'Office Depot', 1, 150.00, '2026-04-10', 'Paid', '2026-04-08', 'Supplies'),
(2, 'Tech Supplier Inc.', 2, 500.00, '2026-04-15', 'Unpaid', NULL, 'Equipment purchase');

-- --------------------------------------------------------

--
-- Table structure for table `Accounts_Receivable`
--

CREATE TABLE `Accounts_Receivable` (
  `AR_ID` int(11) NOT NULL,
  `Customer_ID` int(11) NOT NULL,
  `Sale_ID` int(11) NOT NULL,
  `Amount_Due` decimal(10,2) NOT NULL,
  `Due_Date` date NOT NULL,
  `Payment_Status` varchar(50) DEFAULT 'Unpaid',
  `Date_Paid` date DEFAULT NULL,
  `Remaining_Balance` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Accounts_Receivable`
--

INSERT INTO `Accounts_Receivable` (`AR_ID`, `Customer_ID`, `Sale_ID`, `Amount_Due`, `Due_Date`, `Payment_Status`, `Date_Paid`, `Remaining_Balance`) VALUES
(1, 1, 1, 150.00, '2026-04-10', 'Paid', '2026-04-02', 0.00),
(2, 2, 2, 200.00, '2026-04-12', 'Unpaid', NULL, 200.00);

-- --------------------------------------------------------

--
-- Table structure for table `Audit_Log`
--

CREATE TABLE `Audit_Log` (
  `Log_ID` int(11) NOT NULL,
  `User_ID` int(11) DEFAULT NULL,
  `Action_Type` varchar(20) NOT NULL,
  `Table_Name` varchar(100) NOT NULL,
  `Record_ID` int(11) NOT NULL,
  `Timestamp` datetime DEFAULT current_timestamp(),
  `Old_Value` text DEFAULT NULL,
  `New_Value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Audit_Log`
--

INSERT INTO `Audit_Log` (`Log_ID`, `User_ID`, `Action_Type`, `Table_Name`, `Record_ID`, `Timestamp`, `Old_Value`, `New_Value`) VALUES
(1, 1, 'INSERT', 'sales', 1, '2026-04-16 15:15:35', NULL, 'New sale created'),
(2, 2, 'UPDATE', 'inventory', 1, '2026-04-16 15:15:35', 'Quantity: 50', 'Quantity: 45'),
(3, 1, 'DELETE', 'expenses', 2, '2026-04-16 15:15:35', 'Expense record', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Customer`
--

CREATE TABLE `Customer` (
  `Customer_ID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Phone` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Customer`
--

INSERT INTO `Customer` (`Customer_ID`, `Name`, `Email`, `Phone`) VALUES
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
-- Table structure for table `Employee`
--

CREATE TABLE `Employee` (
  `Employee_ID` int(11) NOT NULL,
  `Employee_name` varchar(100) NOT NULL,
  `Phone` varchar(100) NOT NULL,
  `Role` varchar(100) NOT NULL,
  `Hire_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Employee`
--

INSERT INTO `Employee` (`Employee_ID`, `Employee_name`, `Phone`, `Role`, `Hire_date`) VALUES
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
-- Table structure for table `Employee_Records`
--

CREATE TABLE `Employee_Records` (
  `Employee_ID` int(11) NOT NULL,
  `First_Name` varchar(50) NOT NULL,
  `Last_Name` varchar(50) NOT NULL,
  `Role` varchar(100) DEFAULT NULL,
  `Salary` decimal(10,2) DEFAULT NULL,
  `Hire_Date` date DEFAULT NULL,
  `Department` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Employee_Records`
--

INSERT INTO `Employee_Records` (`Employee_ID`, `First_Name`, `Last_Name`, `Role`, `Salary`, `Hire_Date`, `Department`, `Email`, `Phone`) VALUES
(1, 'John', 'Doe', 'Manager', 60000.00, '2022-01-15', 'Sales', 'john.doe@email.com', '123-456-7890'),
(2, 'Jane', 'Smith', 'Cashier', 35000.00, '2023-03-10', 'Operations', 'jane.smith@email.com', '987-654-3210');

-- --------------------------------------------------------

--
-- Table structure for table `Expenses`
--

CREATE TABLE `Expenses` (
  `Expense_ID` int(11) NOT NULL,
  `Employee_ID` int(11) NOT NULL,
  `Category` varchar(100) NOT NULL,
  `Amount` decimal(10,2) NOT NULL,
  `Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Expenses`
--

INSERT INTO `Expenses` (`Expense_ID`, `Employee_ID`, `Category`, `Amount`, `Date`) VALUES
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
-- Table structure for table `Expense_Reports`
--

CREATE TABLE `Expense_Reports` (
  `Report_ID` int(11) NOT NULL,
  `Employee_ID` int(11) NOT NULL,
  `Total_Amount` decimal(10,2) NOT NULL,
  `Report_Date` date NOT NULL,
  `Approval_Status` varchar(50) DEFAULT 'Pending',
  `Approved_By` int(11) DEFAULT NULL,
  `Notes` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Expense_Reports`
--

INSERT INTO `Expense_Reports` (`Report_ID`, `Employee_ID`, `Total_Amount`, `Report_Date`, `Approval_Status`, `Approved_By`, `Notes`) VALUES
(1, 2, 300.00, '2026-04-05', 'Approved', 1, 'Office supplies and travel'),
(2, 1, 120.50, '2026-04-06', 'Pending', NULL, 'Maintenance costs');

-- --------------------------------------------------------

--
-- Table structure for table `Financial_Transactions`
--

CREATE TABLE `Financial_Transactions` (
  `Transaction_ID` int(11) NOT NULL,
  `Transaction_Date` date NOT NULL,
  `Transaction_Type` varchar(50) NOT NULL,
  `Amount` decimal(10,2) NOT NULL,
  `Payment_Method` varchar(50) DEFAULT NULL,
  `Customer_ID` int(11) DEFAULT NULL,
  `Employee_ID` int(11) DEFAULT NULL,
  `Reference_ID` int(11) DEFAULT NULL,
  `Status` varchar(50) DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Financial_Transactions`
--

INSERT INTO `Financial_Transactions` (`Transaction_ID`, `Transaction_Date`, `Transaction_Type`, `Amount`, `Payment_Method`, `Customer_ID`, `Employee_ID`, `Reference_ID`, `Status`) VALUES
(1, '2026-04-01', 'Sale', 150.00, 'Credit Card', 1, 1, 1, 'Completed'),
(2, '2026-04-02', 'Expense', 75.50, 'Cash', NULL, 2, 1, 'Completed'),
(3, '2026-04-03', 'Sale', 200.00, 'Debit Card', 2, 1, 2, 'Pending'),
(4, '2026-04-01', 'Sale', 150.00, 'Credit Card', 1, 1, 1, 'Completed'),
(5, '2026-04-02', 'Expense', 75.50, 'Cash', NULL, 2, 1, 'Completed'),
(6, '2026-04-03', 'Sale', 200.00, 'Debit Card', 2, 1, 2, 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `Inventory`
--

CREATE TABLE `Inventory` (
  `Inventory_ID` int(11) NOT NULL,
  `Product_ID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Inventory`
--

INSERT INTO `Inventory` (`Inventory_ID`, `Product_ID`, `Quantity`) VALUES
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
-- Table structure for table `Payments`
--

CREATE TABLE `Payments` (
  `Payment_ID` int(11) NOT NULL,
  `Sale_ID` int(11) NOT NULL,
  `Payment_date` date NOT NULL,
  `Payment_method` varchar(100) NOT NULL,
  `Amount_paid` decimal(10,2) NOT NULL,
  `Payment_status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Payments`
--

INSERT INTO `Payments` (`Payment_ID`, `Sale_ID`, `Payment_date`, `Payment_method`, `Amount_paid`, `Payment_status`) VALUES
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
-- Table structure for table `Product`
--

CREATE TABLE `Product` (
  `Product_ID` int(11) NOT NULL,
  `Product_name` varchar(100) NOT NULL,
  `Price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Product`
--

INSERT INTO `Product` (`Product_ID`, `Product_name`, `Price`) VALUES
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
-- Table structure for table `Revenue_Streams`
--

CREATE TABLE `Revenue_Streams` (
  `Revenue_ID` int(11) NOT NULL,
  `Revenue_Source` varchar(100) NOT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Amount` decimal(10,2) NOT NULL,
  `Date_Recorded` date NOT NULL,
  `Sale_ID` int(11) DEFAULT NULL,
  `Customer_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Revenue_Streams`
--

INSERT INTO `Revenue_Streams` (`Revenue_ID`, `Revenue_Source`, `Description`, `Amount`, `Date_Recorded`, `Sale_ID`, `Customer_ID`) VALUES
(1, 'Product Sales', 'Electronics purchase', 150.00, '2026-04-01', 1, 1),
(2, 'Product Sales', 'Clothing purchase', 200.00, '2026-04-03', 2, 2),
(3, 'Service', 'Installation service', 80.00, '2026-04-04', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Sales`
--

CREATE TABLE `Sales` (
  `Sale_ID` int(11) NOT NULL,
  `Customer_ID` int(11) NOT NULL,
  `Employee_ID` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Total_amount` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Sales`
--

INSERT INTO `Sales` (`Sale_ID`, `Customer_ID`, `Employee_ID`, `Date`, `Total_amount`) VALUES
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
-- Table structure for table `Sales_Reports`
--

CREATE TABLE `Sales_Reports` (
  `Report_ID` int(11) NOT NULL,
  `Report_Date` date NOT NULL,
  `Total_Sales` decimal(10,2) NOT NULL,
  `Total_Revenue` decimal(10,2) NOT NULL,
  `Total_Transactions` int(11) NOT NULL,
  `Top_Product` varchar(100) DEFAULT NULL,
  `Generated_By` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Sales_Reports`
--

INSERT INTO `Sales_Reports` (`Report_ID`, `Report_Date`, `Total_Sales`, `Total_Revenue`, `Total_Transactions`, `Top_Product`, `Generated_By`) VALUES
(1, '2026-04-07', 350.00, 350.00, 2, 'Laptop', 1),
(2, '2026-04-08', 500.00, 500.00, 3, 'Smartphone', 2);

-- --------------------------------------------------------

--
-- Table structure for table `Sale_Product`
--

CREATE TABLE `Sale_Product` (
  `Sale_ID` int(11) NOT NULL,
  `Product_ID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Unit_price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Sale_Product`
--

INSERT INTO `Sale_Product` (`Sale_ID`, `Product_ID`, `Quantity`, `Unit_price`) VALUES
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
-- Indexes for table `Accounts_Payable`
--
ALTER TABLE `Accounts_Payable`
  ADD PRIMARY KEY (`AP_ID`),
  ADD KEY `Expense_ID` (`Expense_ID`);

--
-- Indexes for table `Accounts_Receivable`
--
ALTER TABLE `Accounts_Receivable`
  ADD PRIMARY KEY (`AR_ID`),
  ADD KEY `Customer_ID` (`Customer_ID`),
  ADD KEY `Sale_ID` (`Sale_ID`);

--
-- Indexes for table `Audit_Log`
--
ALTER TABLE `Audit_Log`
  ADD PRIMARY KEY (`Log_ID`),
  ADD KEY `User_ID` (`User_ID`);

--
-- Indexes for table `Customer`
--
ALTER TABLE `Customer`
  ADD PRIMARY KEY (`Customer_ID`);

--
-- Indexes for table `Employee`
--
ALTER TABLE `Employee`
  ADD PRIMARY KEY (`Employee_ID`);

--
-- Indexes for table `Employee_Records`
--
ALTER TABLE `Employee_Records`
  ADD PRIMARY KEY (`Employee_ID`);

--
-- Indexes for table `Expenses`
--
ALTER TABLE `Expenses`
  ADD PRIMARY KEY (`Expense_ID`),
  ADD KEY `fk_Employee_ID` (`Employee_ID`);

--
-- Indexes for table `Expense_Reports`
--
ALTER TABLE `Expense_Reports`
  ADD PRIMARY KEY (`Report_ID`),
  ADD KEY `Employee_ID` (`Employee_ID`),
  ADD KEY `Approved_By` (`Approved_By`);

--
-- Indexes for table `Financial_Transactions`
--
ALTER TABLE `Financial_Transactions`
  ADD PRIMARY KEY (`Transaction_ID`),
  ADD KEY `Customer_ID` (`Customer_ID`),
  ADD KEY `Employee_ID` (`Employee_ID`);

--
-- Indexes for table `Inventory`
--
ALTER TABLE `Inventory`
  ADD PRIMARY KEY (`Inventory_ID`),
  ADD KEY `Product` (`Product_ID`);

--
-- Indexes for table `Payments`
--
ALTER TABLE `Payments`
  ADD PRIMARY KEY (`Payment_ID`),
  ADD KEY `fk_to_sale_id` (`Sale_ID`);

--
-- Indexes for table `Product`
--
ALTER TABLE `Product`
  ADD PRIMARY KEY (`Product_ID`);

--
-- Indexes for table `Revenue_Streams`
--
ALTER TABLE `Revenue_Streams`
  ADD PRIMARY KEY (`Revenue_ID`),
  ADD KEY `Sale_ID` (`Sale_ID`),
  ADD KEY `Customer_ID` (`Customer_ID`);

--
-- Indexes for table `Sales`
--
ALTER TABLE `Sales`
  ADD PRIMARY KEY (`Sale_ID`),
  ADD KEY `fk_to_Customer_ID` (`Customer_ID`),
  ADD KEY `fk_to_Employee_ID` (`Employee_ID`);

--
-- Indexes for table `Sales_Reports`
--
ALTER TABLE `Sales_Reports`
  ADD PRIMARY KEY (`Report_ID`),
  ADD KEY `Generated_By` (`Generated_By`);

--
-- Indexes for table `Sale_Product`
--
ALTER TABLE `Sale_Product`
  ADD PRIMARY KEY (`Sale_ID`,`Product_ID`),
  ADD KEY `fk_product_id` (`Product_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Accounts_Payable`
--
ALTER TABLE `Accounts_Payable`
  MODIFY `AP_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Accounts_Receivable`
--
ALTER TABLE `Accounts_Receivable`
  MODIFY `AR_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Audit_Log`
--
ALTER TABLE `Audit_Log`
  MODIFY `Log_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Expense_Reports`
--
ALTER TABLE `Expense_Reports`
  MODIFY `Report_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Financial_Transactions`
--
ALTER TABLE `Financial_Transactions`
  MODIFY `Transaction_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `Revenue_Streams`
--
ALTER TABLE `Revenue_Streams`
  MODIFY `Revenue_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Sales_Reports`
--
ALTER TABLE `Sales_Reports`
  MODIFY `Report_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Accounts_Payable`
--
ALTER TABLE `Accounts_Payable`
  ADD CONSTRAINT `accounts_payable_ibfk_1` FOREIGN KEY (`Expense_ID`) REFERENCES `expenses` (`Expense_ID`);

--
-- Constraints for table `Accounts_Receivable`
--
ALTER TABLE `Accounts_Receivable`
  ADD CONSTRAINT `accounts_receivable_ibfk_1` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`),
  ADD CONSTRAINT `accounts_receivable_ibfk_2` FOREIGN KEY (`Sale_ID`) REFERENCES `sales` (`Sale_ID`);

--
-- Constraints for table `Audit_Log`
--
ALTER TABLE `Audit_Log`
  ADD CONSTRAINT `audit_log_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `employee` (`Employee_ID`);

--
-- Constraints for table `Employee_Records`
--
ALTER TABLE `Employee_Records`
  ADD CONSTRAINT `employee_records_ibfk_1` FOREIGN KEY (`Employee_ID`) REFERENCES `employee` (`Employee_ID`);

--
-- Constraints for table `Expenses`
--
ALTER TABLE `Expenses`
  ADD CONSTRAINT `fk_Employee_ID` FOREIGN KEY (`Employee_ID`) REFERENCES `Employee` (`Employee_ID`);

--
-- Constraints for table `Expense_Reports`
--
ALTER TABLE `Expense_Reports`
  ADD CONSTRAINT `expense_reports_ibfk_1` FOREIGN KEY (`Employee_ID`) REFERENCES `employee` (`Employee_ID`),
  ADD CONSTRAINT `expense_reports_ibfk_2` FOREIGN KEY (`Approved_By`) REFERENCES `employee` (`Employee_ID`);

--
-- Constraints for table `Financial_Transactions`
--
ALTER TABLE `Financial_Transactions`
  ADD CONSTRAINT `financial_transactions_ibfk_1` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`),
  ADD CONSTRAINT `financial_transactions_ibfk_2` FOREIGN KEY (`Employee_ID`) REFERENCES `employee` (`Employee_ID`);

--
-- Constraints for table `Inventory`
--
ALTER TABLE `Inventory`
  ADD CONSTRAINT `fk_to_product_id` FOREIGN KEY (`Product_ID`) REFERENCES `Product` (`Product_ID`);

--
-- Constraints for table `Payments`
--
ALTER TABLE `Payments`
  ADD CONSTRAINT `fk_to_sale_id` FOREIGN KEY (`Sale_ID`) REFERENCES `Sales` (`Sale_ID`);

--
-- Constraints for table `Revenue_Streams`
--
ALTER TABLE `Revenue_Streams`
  ADD CONSTRAINT `revenue_streams_ibfk_1` FOREIGN KEY (`Sale_ID`) REFERENCES `sales` (`Sale_ID`),
  ADD CONSTRAINT `revenue_streams_ibfk_2` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`);

--
-- Constraints for table `Sales`
--
ALTER TABLE `Sales`
  ADD CONSTRAINT `fk_to_Customer_ID` FOREIGN KEY (`Customer_ID`) REFERENCES `Customer` (`Customer_ID`),
  ADD CONSTRAINT `fk_to_Employee_ID` FOREIGN KEY (`Employee_ID`) REFERENCES `Employee` (`Employee_ID`);

--
-- Constraints for table `Sales_Reports`
--
ALTER TABLE `Sales_Reports`
  ADD CONSTRAINT `sales_reports_ibfk_1` FOREIGN KEY (`Generated_By`) REFERENCES `employee` (`Employee_ID`);

--
-- Constraints for table `Sale_Product`
--
ALTER TABLE `Sale_Product`
  ADD CONSTRAINT `fk_product_id` FOREIGN KEY (`Product_ID`) REFERENCES `Product` (`Product_ID`),
  ADD CONSTRAINT `fk_sale_id` FOREIGN KEY (`Sale_ID`) REFERENCES `Sales` (`Sale_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
