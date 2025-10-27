-- 1. List all combinations of product names and supplier names
SELECT p.ProductName, s.SupplierName
FROM Products p
CROSS JOIN Suppliers s;

-- 2. Get all combinations of departments and employees
SELECT d.DepartmentName, e.EmployeeName
FROM Departments d
CROSS JOIN Employees e;

-- 3. List only the combinations where the supplier actually supplies the product
SELECT s.SupplierName, p.ProductName
FROM Products p
JOIN Suppliers s
  ON p.SupplierID = s.SupplierID;

-- 4. List customer names and their order IDs
SELECT c.CustomerName, o.OrderID
FROM Customers c
JOIN Orders o
  ON c.CustomerID = o.CustomerID;

-- 5. Get all combinations of students and courses
SELECT st.StudentName, co.CourseName
FROM Students st
CROSS JOIN Courses co;

-- 6. Get product names and orders where product IDs match
SELECT p.ProductName, o.OrderID
FROM Products p
JOIN Orders o
  ON p.ProductID = o.ProductID;

-- 7. List employees whose DepartmentID matches the department
SELECT e.EmployeeName, d.DepartmentName
FROM Employees e
JOIN Departments d
  ON e.DepartmentID = d.DepartmentID;

-- 8. List student names and their enrolled course IDs
SELECT st.StudentName, en.CourseID
FROM Students st
JOIN Enrollments en
  ON st.StudentID = en.StudentID;

-- 9. List all orders that have matching payments
SELECT o.OrderID, p.PaymentID
FROM Orders o
JOIN Payments p
  ON o.OrderID = p.OrderID;

-- 10. Show orders where product price is more than 100
SELECT o.OrderID, p.ProductName, p.Price
FROM Orders o
JOIN Products p
  ON o.ProductID = p.ProductID
WHERE p.Price > 100;
