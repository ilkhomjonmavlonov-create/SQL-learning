-- =====================================
-- Easy‑Level Tasks
-- =====================================

-- 1. Alias: rename ProductName column as Name in Products
SELECT
  ProductID,
  ProductName AS Name,
  Category,
  Price
FROM Products;

-- 2. Alias: rename Customers table as Client
SELECT
  c.CustomerID,
  c.FirstName,
  c.LastName,
  c.Country
FROM Customers AS Client c;

-- 3. Use UNION to combine product names from Products and Products_Discounted
SELECT ProductName
FROM Products
UNION
SELECT ProductName
FROM Products_Discounted;

-- 4. Intersection (common ProductName) using INTERSECT
SELECT ProductName
FROM Products
INTERSECT
SELECT ProductName
FROM Products_Discounted;

-- 5. Select distinct customer names and their Country (distinct over two columns)
SELECT DISTINCT FirstName, LastName, Country
FROM Customers;

-- 6. Use CASE to create a conditional column ('High' / 'Low') on Products by Price
SELECT
  ProductID,
  ProductName,
  Price,
  CASE
    WHEN Price > 1000 THEN 'High'
    ELSE 'Low'
  END AS PriceTier
FROM Products;

-- 7. Use IIF (in dialects that support it) to show 'Yes' / 'No' based on StockQuantity in Products_Discounted
SELECT
  ProductID,
  ProductName,
  StockQuantity,
  IIF(StockQuantity > 100, 'Yes', 'No') AS IsHighStock
FROM Products_Discounted;


-- =====================================
-- Medium‑Level Tasks
-- =====================================

-- 8. (Another) UNION combining ProductName from both tables
SELECT ProductName
FROM Products
UNION
SELECT ProductName
FROM Products_Discounted;

-- 9. Use EXCEPT to get products in Products that are NOT in Products_Discounted
SELECT ProductName
FROM Products
EXCEPT
SELECT ProductName
FROM Products_Discounted;

-- 10. Conditional column using IIF: 'Expensive' / 'Affordable' from Products
SELECT
  ProductID,
  ProductName,
  Price,
  IIF(Price > 1000, 'Expensive', 'Affordable') AS CostCategory
FROM Products;

-- 11. Find employees with either Age < 25 or Salary > 60000
SELECT *
FROM Employees
WHERE Age < 25
   OR Salary > 60000;

-- 12. Update salary: +10% if Department = 'HR' or EmployeeID = 5
UPDATE Employees
SET Salary = Salary * 1.10
WHERE DepartmentName = 'HR'
   OR EmployeeID = 5;


-- =====================================
-- Hard‑Level Tasks
-- =====================================

-- 13. Use CASE to assign tiers based on SaleAmount in Sales
SELECT
  SaleID,
  CustomerID,
  SaleAmount,
  CASE
    WHEN SaleAmount > 500 THEN 'Top Tier'
    WHEN SaleAmount BETWEEN 200 AND 500 THEN 'Mid Tier'
    ELSE 'Low Tier'
  END AS TierCategory
FROM Sales;

-- 14. Use EXCEPT to find customer IDs who placed orders but no record in Sales
SELECT DISTINCT o.CustomerID
FROM Orders o
EXCEPT
SELECT DISTINCT s.CustomerID
FROM Sales s;

-- 15. Use CASE in Orders to determine discount % by quantity purchased
SELECT
  o.OrderID,
  o.CustomerID,
  o.Quantity,
  CASE
    WHEN o.Quantity = 1 THEN 0.03    -- 3%
    WHEN o.Quantity BETWEEN 2 AND 3 THEN 0.05  -- 5%
    ELSE 0.07   -- 7%
  END AS DiscountRate
FROM Orders o;
