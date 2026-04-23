-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: fincore_fixed
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accounts_payable`
--

DROP TABLE IF EXISTS `accounts_payable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_payable` (
  `AP_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Vendor_Name` varchar(100) NOT NULL,
  `Expense_ID` int(11) DEFAULT NULL,
  `Amount_Owed` decimal(10,2) NOT NULL,
  `Due_Date` date NOT NULL,
  `Payment_Status` varchar(50) DEFAULT 'Unpaid',
  `Payment_Date` date DEFAULT NULL,
  `Notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`AP_ID`),
  KEY `Expense_ID` (`Expense_ID`),
  CONSTRAINT `accounts_payable_ibfk_1` FOREIGN KEY (`Expense_ID`) REFERENCES `expenses` (`Expense_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `accounts_receivable`
--

DROP TABLE IF EXISTS `accounts_receivable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_receivable` (
  `AR_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Customer_ID` int(11) NOT NULL,
  `Sale_ID` int(11) NOT NULL,
  `Amount_Due` decimal(10,2) NOT NULL,
  `Due_Date` date NOT NULL,
  `Payment_Status` varchar(50) DEFAULT 'Unpaid',
  `Date_Paid` date DEFAULT NULL,
  `Remaining_Balance` decimal(10,2) NOT NULL,
  PRIMARY KEY (`AR_ID`),
  KEY `Customer_ID` (`Customer_ID`),
  KEY `Sale_ID` (`Sale_ID`),
  CONSTRAINT `accounts_receivable_ibfk_1` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `audit_log`
--

DROP TABLE IF EXISTS `audit_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audit_log` (
  `Log_ID` int(11) NOT NULL AUTO_INCREMENT,
  `User_ID` int(11) DEFAULT NULL,
  `Action_Type` varchar(20) NOT NULL,
  `Table_Name` varchar(100) NOT NULL,
  `Record_ID` int(11) NOT NULL,
  `Timestamp` datetime DEFAULT current_timestamp(),
  `Old_Value` text DEFAULT NULL,
  `New_Value` text DEFAULT NULL,
  PRIMARY KEY (`Log_ID`),
  KEY `User_ID` (`User_ID`),
  CONSTRAINT `audit_log_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `employee` (`Employee_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `Customer_ID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Phone` varchar(15) NOT NULL,
  PRIMARY KEY (`Customer_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `log_deleted_customer` AFTER DELETE ON `customer` FOR EACH ROW BEGIN
    INSERT INTO Deleted_Log (Table_Name, Record_ID, Deleted_Data)
    VALUES (
        'Customer',
        OLD.Customer_ID,
        CONCAT('Name: ', OLD.Name, ', Email: ', OLD.Email, ', Phone: ', OLD.Phone)
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `deleted_log`
--

DROP TABLE IF EXISTS `deleted_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deleted_log` (
  `Log_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Table_Name` varchar(50) DEFAULT NULL,
  `Record_ID` int(11) DEFAULT NULL,
  `Deleted_At` datetime DEFAULT current_timestamp(),
  `Deleted_Data` text DEFAULT NULL,
  PRIMARY KEY (`Log_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `Employee_ID` int(11) NOT NULL,
  `Employee_name` varchar(100) NOT NULL,
  `Phone` varchar(100) NOT NULL,
  `Role` varchar(100) NOT NULL,
  `Hire_date` date NOT NULL,
  PRIMARY KEY (`Employee_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `log_deleted_employee` AFTER DELETE ON `employee` FOR EACH ROW BEGIN
    INSERT INTO Deleted_Log (Table_Name, Record_ID, Deleted_Data)
    VALUES (
        'Employee',
        OLD.Employee_ID,
        CONCAT('Name: ', OLD.Employee_name, ', Phone: ', OLD.Phone, ', Role: ', OLD.Role)
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `employee_records`
--

DROP TABLE IF EXISTS `employee_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_records` (
  `Employee_ID` int(11) NOT NULL,
  `First_Name` varchar(50) NOT NULL,
  `Last_Name` varchar(50) NOT NULL,
  `Role` varchar(100) DEFAULT NULL,
  `Salary` decimal(10,2) DEFAULT NULL,
  `Hire_Date` date DEFAULT NULL,
  `Department` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Employee_ID`),
  CONSTRAINT `employee_records_ibfk_1` FOREIGN KEY (`Employee_ID`) REFERENCES `employee` (`Employee_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `expense_reports`
--

DROP TABLE IF EXISTS `expense_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expense_reports` (
  `Report_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Employee_ID` int(11) NOT NULL,
  `Total_Amount` decimal(10,2) NOT NULL,
  `Report_Date` date NOT NULL,
  `Approval_Status` varchar(50) DEFAULT 'Pending',
  `Approved_By` int(11) DEFAULT NULL,
  `Notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Report_ID`),
  KEY `Employee_ID` (`Employee_ID`),
  KEY `Approved_By` (`Approved_By`),
  CONSTRAINT `expense_reports_ibfk_1` FOREIGN KEY (`Employee_ID`) REFERENCES `employee` (`Employee_ID`),
  CONSTRAINT `expense_reports_ibfk_2` FOREIGN KEY (`Approved_By`) REFERENCES `employee` (`Employee_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `expenses`
--

DROP TABLE IF EXISTS `expenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expenses` (
  `Expense_ID` int(11) NOT NULL,
  `Employee_ID` int(11) NOT NULL,
  `Category` varchar(100) NOT NULL,
  `Amount` decimal(10,2) NOT NULL,
  `Date` date NOT NULL,
  PRIMARY KEY (`Expense_ID`),
  KEY `fk_Employee_ID` (`Employee_ID`),
  CONSTRAINT `fk_Employee_ID` FOREIGN KEY (`Employee_ID`) REFERENCES `employee` (`Employee_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `financial_transactions`
--

DROP TABLE IF EXISTS `financial_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `financial_transactions` (
  `Transaction_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Transaction_Date` date NOT NULL,
  `Transaction_Type` varchar(50) NOT NULL,
  `Amount` decimal(10,2) NOT NULL,
  `Payment_Method` varchar(50) DEFAULT NULL,
  `Customer_ID` int(11) DEFAULT NULL,
  `Employee_ID` int(11) DEFAULT NULL,
  `Reference_ID` int(11) DEFAULT NULL,
  `Status` varchar(50) DEFAULT 'Pending',
  PRIMARY KEY (`Transaction_ID`),
  KEY `Customer_ID` (`Customer_ID`),
  KEY `Employee_ID` (`Employee_ID`),
  CONSTRAINT `financial_transactions_ibfk_1` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`),
  CONSTRAINT `financial_transactions_ibfk_2` FOREIGN KEY (`Employee_ID`) REFERENCES `employee` (`Employee_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory` (
  `Inventory_ID` int(11) NOT NULL,
  `Product_ID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  PRIMARY KEY (`Inventory_ID`),
  KEY `Product` (`Product_ID`),
  CONSTRAINT `fk_to_product_id` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payments` (
  `Payment_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Sale_ID` int(11) NOT NULL,
  `Payment_date` date NOT NULL,
  `Payment_method` varchar(100) NOT NULL,
  `Amount_paid` decimal(10,2) NOT NULL,
  `Payment_status` varchar(100) NOT NULL,
  PRIMARY KEY (`Payment_ID`),
  KEY `fk_to_sale_id` (`Sale_ID`),
  CONSTRAINT `fk_to_sale_id` FOREIGN KEY (`Sale_ID`) REFERENCES `sales` (`Sale_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_payment_insert` BEFORE INSERT ON `payments` FOR EACH ROW BEGIN
    IF NEW.Amount_paid <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Payment amount must be greater than zero';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_payment_update` BEFORE UPDATE ON `payments` FOR EACH ROW BEGIN
    IF NEW.Amount_paid <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Payment amount must be greater than zero';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `Product_ID` int(11) NOT NULL,
  `Product_name` varchar(100) NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`Product_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `log_deleted_product` AFTER DELETE ON `product` FOR EACH ROW BEGIN
    INSERT INTO Deleted_Log (Table_Name, Record_ID, Deleted_Data)
    VALUES (
        'Product',
        OLD.Product_ID,
        CONCAT('Name: ', OLD.Product_name, ', Price: ', OLD.Price)
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `revenue_streams`
--

DROP TABLE IF EXISTS `revenue_streams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `revenue_streams` (
  `Revenue_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Revenue_Source` varchar(100) NOT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Amount` decimal(10,2) NOT NULL,
  `Date_Recorded` date NOT NULL,
  `Sale_ID` int(11) DEFAULT NULL,
  `Customer_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`Revenue_ID`),
  KEY `Sale_ID` (`Sale_ID`),
  KEY `Customer_ID` (`Customer_ID`),
  CONSTRAINT `revenue_streams_ibfk_1` FOREIGN KEY (`Sale_ID`) REFERENCES `sales` (`Sale_ID`),
  CONSTRAINT `revenue_streams_ibfk_2` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sale_product`
--

DROP TABLE IF EXISTS `sale_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sale_product` (
  `Sale_ID` int(11) NOT NULL,
  `Product_ID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Unit_price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`Sale_ID`,`Product_ID`),
  KEY `fk_product_id` (`Product_ID`),
  CONSTRAINT `fk_product_id` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`),
  CONSTRAINT `fk_sale_id` FOREIGN KEY (`Sale_ID`) REFERENCES `sales` (`Sale_ID`),
  CONSTRAINT `fk_sp_product` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`),
  CONSTRAINT `fk_sp_sale` FOREIGN KEY (`Sale_ID`) REFERENCES `sales` (`Sale_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_sale_insert` AFTER INSERT ON `sale_product` FOR EACH ROW BEGIN
    UPDATE inventory
    SET Quantity = Quantity - NEW.Quantity
    WHERE Product_ID = NEW.Product_ID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales` (
  `Sale_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Customer_ID` int(11) NOT NULL,
  `Employee_ID` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Total_amount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`Sale_ID`),
  KEY `fk_to_Customer_ID` (`Customer_ID`),
  KEY `fk_to_Employee_ID` (`Employee_ID`),
  CONSTRAINT `fk_sales_customer` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`),
  CONSTRAINT `fk_sales_employee` FOREIGN KEY (`Employee_ID`) REFERENCES `employee` (`Employee_ID`),
  CONSTRAINT `fk_to_Customer_ID` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`),
  CONSTRAINT `fk_to_Employee_ID` FOREIGN KEY (`Employee_ID`) REFERENCES `employee` (`Employee_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_sale_created` AFTER INSERT ON `sales` FOR EACH ROW BEGIN
    INSERT INTO payments (Sale_ID, Amount_paid, Payment_date, Payment_method, Payment_status)
    VALUES (NEW.Sale_ID, NEW.Total_amount, NEW.Date, 'Pending', 'Unpaid');
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `sales_reports`
--

DROP TABLE IF EXISTS `sales_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_reports` (
  `Report_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Report_Date` date NOT NULL,
  `Total_Sales` decimal(10,2) NOT NULL,
  `Total_Revenue` decimal(10,2) NOT NULL,
  `Total_Transactions` int(11) NOT NULL,
  `Top_Product` varchar(100) DEFAULT NULL,
  `Generated_By` int(11) DEFAULT NULL,
  PRIMARY KEY (`Report_ID`),
  KEY `Generated_By` (`Generated_By`),
  CONSTRAINT `sales_reports_ibfk_1` FOREIGN KEY (`Generated_By`) REFERENCES `employee` (`Employee_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-23  0:29:08
