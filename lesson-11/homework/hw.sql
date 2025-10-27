-- Easy-Level Tasks
-- 1. Return: OrderID, CustomerName, OrderDate  
SELECT o.OrderID, CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName, o.OrderDate  
FROM Orders o  
JOIN Customers c ON o.CustomerID = c.CustomerID  
WHERE o.OrderDate > '2022-12-31';

-- 2. Return: EmployeeName, DepartmentName  
SELECT e.EmployeeName, d.DepartmentName  
FROM Employees e  
JOIN Departments d ON e.DepartmentID = d.DepartmentID  
WHERE d.DepartmentName IN ('Sales','Marketing');

-- 3. Return: DepartmentName, MaxSalary  
SELECT d.DepartmentName, MAX(e.Salary) AS MaxSalary  
FROM Departments d  
JOIN Employees e ON d.DepartmentID = e.DepartmentID  
GROUP BY d.DepartmentName;

-- 4. Return: CustomerName, OrderID, OrderDate  
SELECT CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName, o.OrderID, o.OrderDate  
FROM Customers c  
JOIN Orders o ON c.CustomerID = o.CustomerID  
WHERE c.Country = 'USA'  
  AND YEAR(o.OrderDate) = 2023;

-- 5. Return: CustomerName, TotalOrders  
SELECT CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName, COUNT(o.OrderID) AS TotalOrders  
FROM Customers c  
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID  
GROUP BY c.FirstName, c.LastName;

-- 6. Return: ProductName, SupplierName  
SELECT p.ProductName, s.SupplierName  
FROM Products p  
JOIN Suppliers s ON p.SupplierID = s.SupplierID  
WHERE s.SupplierName IN ('Gadget Supplies','Clothing Mart');

-- 7. Return: CustomerName, MostRecentOrderDate  
SELECT CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName, MAX(o.OrderDate) AS MostRecentOrderDate  
FROM Customers c  
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID  
GROUP BY c.FirstName, c.LastName;


-- Medium-Level Tasks
-- 1. Return: CustomerName, OrderTotal  
SELECT CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName, o.TotalAmount AS OrderTotal  
FROM Orders o  
JOIN Customers c ON o.CustomerID = c.CustomerID  
WHERE o.TotalAmount > 500;

-- 2. Return: ProductName, SaleDate, SaleAmount  
SELECT p.ProductName, s.SaleDate, s.SaleAmount  
FROM Sales s  
JOIN Products p ON s.ProductID = p.ProductID  
WHERE YEAR(s.SaleDate) = 2022 OR s.SaleAmount > 400;

-- 3. Return: ProductName, TotalSalesAmount  
SELECT p.ProductName, SUM(s.SaleAmount) AS TotalSalesAmount  
FROM Products p  
JOIN Sales s ON p.ProductID = s.ProductID  
GROUP BY p.ProductName;

-- 4. Return: EmployeeName, DepartmentName, Salary  
SELECT e.EmployeeName, d.DepartmentName, e.Salary  
FROM Employees e  
JOIN Departments d ON e.DepartmentID = d.DepartmentID  
WHERE d.DepartmentName = 'HR' AND e.Salary > 60000;

-- 5. Return: ProductName, SaleDate, StockQuantity  
SELECT p.ProductName, s.SaleDate, p.StockQuantity  
FROM Products p  
JOIN Sales s ON p.ProductID = s.ProductID  
WHERE YEAR(s.SaleDate) = 2023 AND p.StockQuantity > 100;

-- 6. Return: EmployeeName, DepartmentName, HireDate  
SELECT e.EmployeeName, d.DepartmentName, e.HireDate  
FROM Employees e  
JOIN Departments d ON e.DepartmentID = d.DepartmentID  
WHERE d.DepartmentName = 'Sales' OR e.HireDate > '2020-12-31';


-- Hard-Level Tasks
-- 1. Return: CustomerName, OrderID, Address, OrderDate  
SELECT CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName, o.OrderID, c.Address, o.OrderDate  
FROM Customers c  
JOIN Orders o ON c.CustomerID = o.CustomerID  
WHERE c.Country = 'USA' AND c.Address LIKE '[0-9][0-9][0-9][0-9]%';

-- 2. Return: ProductName, Category, SaleAmount  
SELECT p.ProductName, c.CategoryName, s.SaleAmount  
FROM Products p  
JOIN Categories c ON p.CategoryID = c.CategoryID  
JOIN Sales s ON p.ProductID = s.ProductID  
WHERE c.CategoryName = 'Electronics' OR s.SaleAmount > 350;

-- 3. Return: CategoryName, ProductCount  
SELECT c.CategoryName, COUNT(p.ProductID) AS ProductCount  
FROM Categories c  
LEFT JOIN Products p ON c.CategoryID = p.CategoryID  
GROUP BY c.CategoryName;

-- 4. Return: CustomerName, City, OrderID, Amount  
SELECT CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName, c.City, o.OrderID, o.TotalAmount AS Amount  
FROM Customers c  
JOIN Orders o ON c.CustomerID = o.CustomerID  
WHERE c.City = 'Los Angeles' AND o.TotalAmount > 300;

-- 5. Return: EmployeeName, DepartmentName  
SELECT e.EmployeeName, d.DepartmentName  
FROM Employees e  
JOIN Departments d ON e.DepartmentID = d.DepartmentID  
WHERE d.DepartmentName IN ('HR','Finance')  
   OR (LENGTH(REGEXP_REPLACE(e.EmployeeName, '[^AEIOUaeiou]', '')) >= 4);

-- 6. Return: EmployeeName, DepartmentName, Salary  
SELECT e.EmployeeName, d.DepartmentName, e.Salary  
FROM Employees e  
JOIN Departments d ON e.DepartmentID = d.DepartmentID  
WHERE d.DepartmentName IN ('Sales','Marketing') AND e.Salary > 60000;

-- 7. Return: ProductID, ProductName  
SELECT p.ProductID, p.ProductName  
FROM Products p  
JOIN Categories c ON p.CategoryID = c.CategoryID  
WHERE c.CategoryName IN ('Electronics','Furniture');
