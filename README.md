# FinCore Business Management System

## 📌 Project Overview

The FinCore Business Management System is a database-driven application designed to manage core business operations, including customer data, employee records, sales transactions, inventory tracking, and financial reporting. The system integrates multiple relational tables to ensure efficient data storage, retrieval, and analysis.

Files for database management project, fincore(2).sql has all the data with 15 data values in each table, the mainQueries has the eight main queries that'll be beneficial to the project. 

---

## 👥 Authors

* Noel Mekogue - Project Manager
* Haley Harper – Database Architect
* Dylan Scott - Backend Developer
* Tayla Scott - Data Analyst
* Joshua Mays - Financial Systems Analyst
* Kai Ilela - Frontend Developer

---

## 📅 Creation Date

* February 2026 – April 2026

---

## 📁 File Structure

### 🔹 Database Files

* `FinCore(1).sql`

  * Contains the full database schema
  * Includes table creation (CREATE TABLE), constraints, and relationships
  * Includes sample data (INSERT statements)

---

### 🔹 Frontend Files (from zip)

* `index.php`

  * Main entry point for the application
  * Handles user interaction and displays content

* `*.php` files

  * Backend logic for database operations (CRUD functionality)

* `style.css` files

  * Styling for layout and design

* `app.js` files

  * Client-side interactivity

---

### 🔹 Database Tables

Key tables included in the system:

* `customer` – Stores customer information
* `employee` – Stores employee data
* `employee_records` – Extended employee details
* `product` – Product catalog
* `inventory` – Tracks product quantities
* `sales` – Records transactions
* `sale_product` – Resolves many-to-many relationship between sales and products
* `payments` – Tracks payment details
* `financial_transactions` – Logs all financial activity
* `accounts_receivable` – Tracks incoming payments
* `accounts_payable` – Tracks outgoing payments
* `expenses` – Records company expenses
* `expense_reports` – Summarizes expenses
* `revenue_streams` – Tracks income sources
* `sales_reports` – Provides sales analytics
* `audit_log` – Logs system changes for auditing

---

## ⚙️ System Features

* Relational database with normalized structure
* Use of primary and foreign keys to maintain data integrity
* Automated triggers for:

  * Updating sales totals
  * Preventing invalid payment values
  * Logging deleted records
* Supports financial tracking, reporting, and auditing

---

## 📌 Summary

This project demonstrates the design and implementation of a structured relational database system integrated with a frontend interface, supporting real-world business operations such as sales tracking, inventory management, and financial reporting.

---
