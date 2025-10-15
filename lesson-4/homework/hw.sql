-- =====================================
-- 🟢 Basic / Simple Queries
-- =====================================

-- 1. Select the top 5 employees (SQL Server style)
SELECT TOP 5 *
FROM Employees
ORDER BY EmployeeID;

-- Alternatively, using OFFSET/FETCH if supported:
-- SELECT *
-- FROM Employees
-- ORDER BY EmployeeID
-- OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY;

-- 2. Select distinct Category values from Products
SELECT DISTINCT Category
FROM Products;

-- 3. Products with Price > 100
SELECT *
FROM Products
WHERE Price > 100;

-- 4. Customers whose FirstName starts with 'A'
SELECT *
FROM Customers
WHERE FirstName LIKE 'A%';

-- 5. Order Products by Price ascending
SELECT *
FROM Products
ORDER BY Price ASC;

-- 6. Employees with Salary >= 60000 and DepartmentName = 'HR'
SELECT *
FROM Employees
WHERE Salary >= 60000
  AND DepartmentName = 'HR';

-- 7. Replace NULL Email with a default using ISNULL (SQL Server)
SELECT
  EmployeeID,
  FirstName,
  LastName,
  ISNULL(Email, 'noemail@example.com') AS Email
FROM Employees;

-- 8. Products with Price BETWEEN 50 and 100
SELECT *
FROM Products
WHERE Price BETWEEN 50 AND 100;

-- 9. DISTINCT on two columns: Category, ProductName
SELECT DISTINCT Category, ProductName
FROM Products;

-- 10. DISTINCT on two columns, then order by ProductName descending
SELECT DISTINCT Category, ProductName
FROM Products
ORDER BY ProductName DESC;


-- =====================================
-- 🟠 Medium‑Level Queries
-- =====================================

-- 11. Top 10 products by Price descending
SELECT TOP 10 *
FROM Products
ORDER BY Price DESC;

-- (Or with OFFSET/FETCH)
-- SELECT *
-- FROM Products
-- ORDER BY Price DESC
-- OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;

-- 12. Use COALESCE to return first non-NULL of FirstName or LastName
SELECT
  EmployeeID,
  COALESCE(FirstName, LastName) AS NameNonNull
FROM Employees;

-- 13. DISTINCT Category and Price from Products
SELECT DISTINCT Category, Price
FROM Products;

-- 14. Employees whose Age between 30 and 40 OR in Marketing
SELECT *
FROM Employees
WHERE (Age BETWEEN 30 AND 40)
   OR DepartmentName = 'Marketing';

-- 15. OFFSET-FETCH rows 11–20 from Employees ordered by Salary DESC
SELECT *
FROM Employees
ORDER BY Salary DESC
OFFSET 10 ROWS FETCH NEXT 10 ROWS ONLY;

-- 16. Products with Price <= 1000 and StockQuantity > 50, sorted by StockQuantity asc
SELECT *
FROM Products
WHERE Price <= 1000
  AND StockQuantity > 50
ORDER BY StockQuantity ASC;

-- 17. Products whose ProductName contains the letter 'e'
SELECT *
FROM Products
WHERE ProductName LIKE '%e%';

-- 18. Employees in departments HR, IT, or Finance using IN
SELECT *
FROM Employees
WHERE DepartmentName IN ('HR', 'IT', 'Finance');

-- 19. Customers ordered by City asc, PostalCode desc
SELECT *
FROM Customers
ORDER BY City ASC, PostalCode DESC;


-- =====================================
-- 🔴 Hard‑Level Queries
-- =====================================

-- 20. Top 5 products with highest sales (SaleAmount)
SELECT TOP 5 *
FROM Products
ORDER BY SaleAmount DESC;

-- 21. Combine FirstName and LastName into FullName
SELECT
  EmployeeID,
  CONCAT(FirstName, ' ', LastName) AS FullName,  -- or FirstName + ' ' + LastName in some dialects
  DepartmentName,
  Salary
FROM Employees;

-- 22. DISTINCT Category, ProductName, Price for products priced > 50
SELECT DISTINCT Category, ProductName, Price
FROM Products
WHERE Price > 50;

-- 23. Products whose Price is less than 10% of the average price
SELECT *
FROM Products
WHERE Price < 0.10 * (SELECT AVG(Price) FROM Products);

-- 24. Employees whose Age < 30 AND in HR or IT
SELECT *
FROM Employees
WHERE Age < 30
  AND DepartmentName IN ('HR', 'IT');

-- 25. Customers whose Email contains "@gmail.com"
SELECT *
FROM Customers
WHERE Email LIKE '%@gmail.com%';

-- 26. Employees whose Salary > ALL salaries in Sales dept
SELECT *
FROM Employees
WHERE Salary > ALL (
  SELECT Salary
  FROM Employees
  WHERE DepartmentName = 'Sales'
);

-- 27. Orders in the last 180 days (SQL Server example using GETDATE)
SELECT *
FROM Orders
WHERE OrderDate BETWEEN DATEADD(day, -180, GETDATE()) AND GETDATE();

-- If you have a LatestDate column:
-- SELECT *
-- FROM Orders
-- WHERE OrderDate BETWEEN DATEADD(day, -180, LatestDate) AND LatestDate;

