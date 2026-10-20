-- ========================================================
-- Course: CISB3313 Fundamentals of Database
-- System: Jom Makan Restaurant Management System
-- Script: 03_sample_queries.sql (Data Retrieval & Verification)
-- ========================================================

-- --------------------------------------------------------
-- 1. BASIC TABLE RETRIEVAL (Section 7.3 - Display Data in Table)
-- --------------------------------------------------------

-- View all menu items and their prices
SELECT * FROM "MENU";

-- View all customer order records
SELECT * FROM "ORDERITEM";

-- View all customer profiles and assigned orders
SELECT * FROM "CUSTOMER";

-- View all employee records
SELECT * FROM "EMPLOYEE";


-- --------------------------------------------------------
-- 2. RELATIONAL JOINS (Order Details & Customer Tracking)
-- --------------------------------------------------------

-- Display customer orders linked with menu item descriptions and prices
SELECT 
    c."CUTOMER_ID" AS "Customer ID",
    c."CUSTOMER_FIRST" || ' ' || c."CUSTOMER_LAST" AS "Customer Name",
    c."CUSTOMER_CONTACT" AS "Contact",
    o."ORDER_ID" AS "Order ID",
    o."ORDER_NAME" AS "Order Name",
    m."ITEM_NAME" AS "Menu Item",
    o."ORDER_PRICE" AS "Price (RM)"
FROM "CUSTOMER" c
JOIN "ORDERITEM" o ON c."ORDER_ID" = o."ORDER_ID"
JOIN "MENU" m ON o."ITEM_ID" = m."ITEM_ID"
ORDER BY c."CUTOMER_ID" ASC;

-- Display ordered items mapped to their corresponding menu catalog price
SELECT 
    o."ORDER_ID",
    o."ORDER_NAME",
    o."ORDER_PRICE",
    m."ITEM_ID",
    m."ITEM_NAME",
    m."ITEM_PRICE"
FROM "ORDERITEM" o
INNER JOIN "MENU" m ON o."ITEM_ID" = m."ITEM_ID";


-- --------------------------------------------------------
-- 3. FILTERING & SEARCH QUERIES
-- --------------------------------------------------------

-- Search menu items priced under RM 5.00 (Beverages & small items)
SELECT 
    "ITEM_ID", 
    "ITEM_NAME", 
    "ITEM_PRICE"
FROM "MENU"
WHERE "ITEM_PRICE" < 5.00
ORDER BY "ITEM_PRICE" ASC;

-- Search for specific customer orders (e.g., customers residing in UNITEN)
SELECT 
    "CUTOMER_ID", 
    "CUSTOMER_FIRST", 
    "CUSTOMER_LAST", 
    "ADDRESS", 
    "ORDER_ID"
FROM "CUSTOMER"
WHERE UPPER("ADDRESS") LIKE '%UNITEN%';


-- --------------------------------------------------------
-- 4. AGGREGATE & SUMMARY QUERIES
-- --------------------------------------------------------

-- Total revenue generated from all recorded orders
SELECT 
    COUNT("ORDER_ID") AS "Total Orders Placed",
    SUM("ORDER_PRICE") AS "Total Sales (RM)",
    ROUND(AVG("ORDER_PRICE"), 2) AS "Average Order Value (RM)"
FROM "ORDERITEM";

-- Count of customers registered per address/location
SELECT 
    "ADDRESS", 
    COUNT("CUTOMER_ID") AS "Customer Count"
FROM "CUSTOMER"
GROUP BY "ADDRESS"
ORDER BY "Customer Count" DESC;
