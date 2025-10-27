-- 1. Combine Two Tables
SELECT p.firstName, p.lastName, a.city, a.state
FROM Person p
LEFT JOIN Address a ON p.personId = a.personId;

-- 2. Employees Earning More Than Their Managers
SELECT e1.name AS Employee
FROM Employee e1
JOIN Employee e2 ON e1.managerId = e2.id
WHERE e1.salary > e2.salary;

-- 3. Duplicate Emails
SELECT email AS Email
FROM Person
GROUP BY email
HAVING COUNT(*) > 1;

-- 4. Delete Duplicate Emails
DELETE p
FROM Person p
JOIN Person d ON p.email = d.email AND p.id > d.id;

-- 5. Find those parents who has only girls
SELECT DISTINCT g.ParentName AS ParentName
FROM girls g
LEFT JOIN boys b ON b.ParentName = g.ParentName
WHERE b.ParentName IS NULL;

-- 6. Total over 50 and least
SELECT o.CustomerID,
       SUM(o.SalesAmount) AS TotalSales,
       MIN(o.Weight)       AS LeastWeight
FROM Orders o
WHERE o.Weight > 50
GROUP BY o.CustomerID;

-- 7. Carts
SELECT c1.Item AS [Item Cart 1], c2.Item AS [Item Cart 2]
FROM Cart1 c1
FULL OUTER JOIN Cart2 c2 ON c1.Item = c2.Item
ORDER BY [Item Cart 1], [Item Cart 2];

-- 8. Customers Who Never Order
SELECT name AS Customers
FROM Customers c
LEFT JOIN Orders o ON c.id = o.customerId
WHERE o.id IS NULL;

-- 9. Students and Examinations
SELECT s.student_id, s.student_name, ex.subject_name
FROM Students s
JOIN Examinations ex ON s.student_id = ex.student_id;
