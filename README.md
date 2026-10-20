# Jom Makan Restaurant Management System

**Course:** CISB3313 Fundamentals of Database  
**Institution:** Universiti Tenaga Nasional (UNITEN)  
**Database Platform:** Oracle / Oracle APEX  

---

## 👥 Group Members
| No | Name | Student ID |
|---|---|---|
| 1 | Ahmad Fikri bin Ahmad Mustapha | CS01083393 |
| 2 | Muhammad Faris Irfan bin Mohmad Natar | IS01083410 |
| 3 | Mohamed Hisyam Bin Abd. Ghafar | SW01083744 |
| 4 | Muhammad Danish Adam Bin Hanif | CS01084360 |

---

## 📌 Project Overview
Transitioning Jom Makan Restaurant from a traditional paper-based process to an automated database management system to streamline operations, reduce manual errors, and improve customer and staff record management.

### Key Features & Scope
- **Menu Management:** Item records, descriptions, and dynamic pricing.
- **Order Handling:** Customer order placement and itemized tracking.
- **Customer Tracking:** Contact details and transaction history.
- **Employee Records:** Staff profiles, roles, and administrative controls.

---

## 🗄️ Database Design
The schema consists of 4 core tables:
1. `MENU` (`ITEM_ID` [PK], `ITEM_NAME`, `ITEM_PRICE`)
2. `ORDERITEM` (`ORDER_ID` [PK], `ITEM_ID` [FK], `ORDER_NAME`, `ORDER_PRICE`)
3. `CUSTOMER` (`CUTOMER_ID` [PK], `ORDER_ID` [FK], `CUSTOMER_FIRST`, `CUSTOMER_LAST`, `CUSTOMER_CONTACT`, `ADDRESS`)
4. `EMPLOYEE` (`EMPLOYEE_ID` [PK], `EMPLOYEE_FIRSTNAME`, `EMPLOYEE_LASTNAME`, `EMPLOYEE_PHONENUMBER`, `EMPLOYEE_DOB`, `EMPLOYEE_SALARY`)

---

## 🚀 Getting Started
Run the scripts located in `/sql` in sequence:
1. `01_schema.sql` — Creates all tables and sets primary/foreign key constraints.
2. `02_seed_data.sql` — Populates sample test data.
3. `03_sample_queries.sql` — Contains test data retrieval queries.
