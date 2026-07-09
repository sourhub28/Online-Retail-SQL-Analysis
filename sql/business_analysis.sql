-- =====================================================
-- Online Retail SQL Analysis Project
-- Author: Sourabh
-- Database: online_retail
-- Table: onlineretail
-- =====================================================

USE online_retail;

-- =====================================================
-- 1. Display First 10 Records
-- =====================================================

SELECT *
FROM onlineretail
LIMIT 10;

-- =====================================================
-- 2. Display Selected Columns
-- =====================================================

SELECT InvoiceNo,
       Description,
       Quantity
FROM onlineretail
LIMIT 10;

-- =====================================================
-- 3. List Unique Countries
-- =====================================================

SELECT DISTINCT Country
FROM onlineretail;

-- =====================================================
-- 4. Count Unique Countries
-- =====================================================

SELECT COUNT(DISTINCT Country) AS Total_Countries
FROM onlineretail;

-- =====================================================
-- 5. Orders from France
-- =====================================================

SELECT *
FROM onlineretail
WHERE Country = 'France';

-- =====================================================
-- 6. Quantity Greater Than 10
-- =====================================================

SELECT *
FROM onlineretail
WHERE Quantity > 10;

-- =====================================================
-- 7. Products with Price Less Than 2
-- =====================================================

SELECT Description,
       UnitPrice
FROM onlineretail
WHERE UnitPrice < 2;

-- =====================================================
-- 8. Sort Products by Highest Price
-- =====================================================

SELECT Description,
       UnitPrice
FROM onlineretail
ORDER BY UnitPrice DESC;

-- =====================================================
-- 9. Total Records
-- =====================================================

SELECT COUNT(*) AS Total_Records
FROM onlineretail;

-- =====================================================
-- 10. Average Product Price
-- =====================================================

SELECT AVG(UnitPrice) AS Average_Price
FROM onlineretail;

-- =====================================================
-- 11. Highest Product Price
-- =====================================================

SELECT MAX(UnitPrice) AS Highest_Price
FROM onlineretail;

-- =====================================================
-- 12. Lowest Product Price
-- =====================================================

SELECT MIN(UnitPrice) AS Lowest_Price
FROM onlineretail;

-- =====================================================
-- 13. Total Items Sold
-- =====================================================

SELECT SUM(Quantity) AS Total_Items_Sold
FROM onlineretail;

-- =====================================================
-- 14. Total Orders by Country
-- =====================================================

SELECT Country,
       COUNT(*) AS Total_Orders
FROM onlineretail
GROUP BY Country
ORDER BY Total_Orders DESC;

-- =====================================================
-- 15. Total Items Sold by Country
-- =====================================================

SELECT Country,
       SUM(Quantity) AS Total_Items
FROM onlineretail
GROUP BY Country
ORDER BY Total_Items DESC;

-- =====================================================
-- 16. Top 10 Countries by Revenue
-- =====================================================

SELECT Country,
       ROUND(SUM(Quantity * UnitPrice),2) AS Revenue
FROM onlineretail
GROUP BY Country
ORDER BY Revenue DESC
LIMIT 10;

-- =====================================================
-- 17. Top 10 Best Selling Products
-- =====================================================

SELECT Description,
       SUM(Quantity) AS Total_Sold
FROM onlineretail
GROUP BY Description
ORDER BY Total_Sold DESC
LIMIT 10;

-- =====================================================
-- 18. Top 10 Products by Revenue
-- =====================================================

SELECT Description,
       ROUND(SUM(Quantity * UnitPrice),2) AS Revenue
FROM onlineretail
GROUP BY Description
ORDER BY Revenue DESC
LIMIT 10;

-- =====================================================
-- 19. Top 10 Customers by Quantity Purchased
-- =====================================================

SELECT CustomerID,
       SUM(Quantity) AS Total_Items
FROM onlineretail
WHERE CustomerID IS NOT NULL
GROUP BY CustomerID
ORDER BY Total_Items DESC
LIMIT 10;

-- =====================================================
-- 20. Highest Value Invoices
-- =====================================================

SELECT InvoiceNo,
       ROUND(SUM(Quantity * UnitPrice),2) AS Invoice_Value
FROM onlineretail
GROUP BY InvoiceNo
ORDER BY Invoice_Value DESC
LIMIT 10;

-- =====================================================
-- 21. Average Product Price by Country
-- =====================================================

SELECT Country,
       ROUND(AVG(UnitPrice),2) AS Average_Price
FROM onlineretail
GROUP BY Country
ORDER BY Average_Price DESC;

-- =====================================================
-- 22. Average Order Value by Country
-- =====================================================

SELECT Country,
       ROUND(AVG(Quantity * UnitPrice),2) AS Average_Order_Value
FROM onlineretail
GROUP BY Country
ORDER BY Average_Order_Value DESC;

-- =====================================================
-- 23. Most Expensive Products
-- =====================================================

SELECT Description,
       UnitPrice
FROM onlineretail
ORDER BY UnitPrice DESC
LIMIT 10;

-- =====================================================
-- 24. Cheapest Products
-- =====================================================

SELECT Description,
       UnitPrice
FROM onlineretail
ORDER BY UnitPrice ASC
LIMIT 10;

-- =====================================================
-- 25. Customers with More Than 5 Orders
-- =====================================================

SELECT CustomerID,
       COUNT(DISTINCT InvoiceNo) AS Total_Orders
FROM onlineretail
WHERE CustomerID IS NOT NULL
GROUP BY CustomerID
HAVING COUNT(DISTINCT InvoiceNo) > 5
ORDER BY Total_Orders DESC;

-- =====================================================
-- 26. Top 10 Products by Average Price
-- =====================================================

SELECT Description,
       ROUND(AVG(UnitPrice),2) AS Average_Price
FROM onlineretail
GROUP BY Description
ORDER BY Average_Price DESC
LIMIT 10;