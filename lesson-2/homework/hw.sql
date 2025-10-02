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
