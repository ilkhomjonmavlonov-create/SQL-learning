-- Easy Level
SELECT Category, COUNT(*) AS TotalProducts FROM Products GROUP BY Category;

SELECT AVG(Price) AS AvgPrice FROM Products WHERE Category = 'Electronics';

SELECT * FROM Customers WHERE City LIKE 'L%';

SELECT ProductName FROM Products WHERE ProductName LIKE '%er';

SELECT * FROM Customers WHERE Country LIKE '%A';

SELECT MAX(Price) AS HighestPrice FROM Products;

SELECT ProductName, Quantity,
       CASE WHEN Quantity < 30 THEN 'Low Stock' ELSE 'Sufficient' END AS StockStatus
FROM Products;

SELECT Country, COUNT(*) AS TotalCustomers FROM Customers GROUP BY Country;

SELECT MIN(Quantity) AS MinQuantity, MAX(Quantity) AS MaxQuantity FROM Orders;


-- Medium Level
SELECT DISTINCT o.CustomerID
FROM Orders o
LEFT JOIN Invoices i ON o.CustomerID = i.CustomerID
WHERE o.OrderDate BETWEEN '2023-01-01' AND '2023-01-31'
  AND i.InvoiceID IS NULL;

SELECT ProductName FROM Products
UNION ALL
SELECT ProductName FROM Products_Discounted;

SELECT ProductName FROM Products
UNION
SELECT ProductName FROM Products_Discounted;

SELECT YEAR(OrderDate) AS OrderYear, AVG(OrderAmount) AS AvgOrderAmount
FROM Orders
GROUP BY YEAR(OrderDate);

SELECT ProductName,
       CASE
         WHEN Price < 100 THEN 'Low'
         WHEN Price BETWEEN 100 AND 500 THEN 'Mid'
         ELSE 'High'
       END AS PriceGroup
FROM Products;

SELECT *
INTO Population_Each_Year
FROM (
  SELECT City, Year, Population FROM City_Population
) src
PIVOT (
  SUM(Population)
  FOR Year IN ([2012], [2013])
) AS pvt;

SELECT ProductID, SUM(SalesAmount) AS TotalSales
FROM Sales
GROUP BY ProductID;

SELECT ProductName FROM Products WHERE ProductName LIKE '%oo%';

SELECT *
INTO Population_Each_City
FROM (
  SELECT City, Year, Population FROM City_Population
) src
PIVOT (
  SUM(Population)
  FOR City IN ([Bektemir], [Chilonzor], [Yakkasaroy])
) AS pvt;


-- Hard Level
SELECT TOP 3 CustomerID, SUM(InvoiceAmount) AS TotalSpent
FROM Invoices
GROUP BY CustomerID
ORDER BY TotalSpent DESC;

SELECT City, '2012' AS Year, [2012] AS Population FROM Population_Each_Year
UNION ALL
SELECT City, '2013', [2013] FROM Population_Each_Year;

SELECT p.ProductName, COUNT(s.SaleID) AS TimesSold
FROM Products p
JOIN Sales s ON p.ProductID = s.ProductID
GROUP BY p.ProductName;

SELECT 'Bektemir' AS City, Year, [Bektemir] AS Population FROM Population_Each_City
UNION ALL
SELECT 'Chilonzor', Year, [Chilonzor] FROM Population_Each_City
UNION ALL
SELECT 'Yakkasaroy', Year, [Yakkasaroy] FROM Population_Each_City;
