create database F44_lesson2

use F44_lesson2
create table Employees (EmpID INT, Name VARCHAR(50), Salary DECIMAL(10,2))

SELECT* from Employees
insert into Employees values (1,'Bekzod',500.90) ,
                             (2,'Ali',800.07),
							 (3,'Jamila',9000)
UPDATE Employees
set Salary = 7000
where EmpID = 1

delete from Employees
where EmpID = 2

/* Give a brief definition for difference between DELETE, TRUNCATE, and DROP.
DELETE: Removes specific rows from a table based on a condition.
Can use WHERE key word to select exact row.
you can save structure of your table.

TRUNCATE: Removes all rows from a table, faster than DELETE.
You can not use filters.(WHERE)
Keeps table structure.

DRO: Completely deletes the table structure and all data.
Can remove whole table,cheme,database .*/

alter table Employees
alter column name varchar(100)


alter table Employees
add Department VARCHAR(50)

SELECT* from Employees

alter table Employees
alter column Salary float

CREATE TABLE Departments (DepartmentID INT PRIMARY KEY,DepartmentName VARCHAR(50))

select* from Departments


truncate table Employees

----
alter table Employees
alter column Name varchar(100)


alter table Employees
add Department VARCHAR(50)

SELECT* from Employees

alter table Employees
alter column Salary float

truncate table Employees

UPDATE Employees
set Department = 'IT'
where EmpID = 1

INSERT INTO Employees values (2, 'Komil', 2500, 'Logistics')
INSERT INTO Employees values (4, 'Sarvar', 2700, 'Dispatcher')
INSERT INTO Employees values (5, 'Komil', 6500, 'Manager')




SELECT *
INTO Departments
FROM Employees

SELECT* from Departments

UPDATE Departments
set Department = 'Management'
where Salary > 5000


truncate table Departments

alter table Employees
drop column Department

SELECT* from Employees

--3
create database sql_learning
go
use sql_learning

create table Products (id int, name varchar(50), price decimal(10,2))

select* from Products

insert into Products values  (1, 'Apple', 0.99),
                             (2, 'Banana', 0.59),
                             (3, 'Orange', 1.29),
                             (4, 'Milk', 2.49),
                             (5, 'Bread', 1.99)

SELECT * 
INTO Products_Backup
FROM Products

EXEC sp_rename 'Products', 'Inventory'

ALTER TABLE Inventory
ALTER COLUMN Price FLOAT

alter table Inventory
add Productcode int Identity(1000,5)

select * from Inventory
