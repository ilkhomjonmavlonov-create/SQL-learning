create database lesson_3data
go
use lesson_3data

/* Bulk inset helps us exporting and importing data from csv,text to SQL form.
Useful when automating data loads (via SQL Agent jobs, scripts, etc.). Very helpful when files arrive periodically and need to be imported.
*/
--2

create table Employees(ID INT,NAME VARCHAR(50)) 
Bulk insert Employees 
from 'C:\Users\MSII\Desktop\Employees,txt.txt'
with
(
firstrow = 2,
fieldterminator = ',',
rowterminator = '\n'
)

select* from Employees

create table school (director varchar(50), [count] int)

drop table school
create table school (director varchar(50), [count] int)
bulk insert school
from 'C:\Users\MSII\Desktop\Directors2,csv.txt'
with
(
firstrow = 2,
fieldterminator = ',',
rowterminator = '\n'
)

select * from school

CREATE TABLE Product (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Price DECIMAL(10,2)
)

INSERT INTO Product  (ProductID, ProductName, Price)values (1,'apple',30.90),
                                                            (2,'banana',70.80),
															(3,'peach', 24.03)


/* NULL is a special marker in SQL that means no value, unknown value, or missing data.
Can accept any values on column
Not null
NOT NULL is a constraint you can place on a column when creating or altering a table.
It means: that column must always contain a non-NULL value.
When a column is declared NOT NULL, every row inserted must provide a valid (non-NULL) value for that column
You can’t omit it or leave it blank.*/


drop table Product
CREATE TABLE Product (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50) UNIQUE,
    Price DECIMAL(10,2)
);
ALTER TABLE Product
ADD CONSTRAINT UQ_Product_ProductName UNIQUE (ProductName)


ALTER TABLE Product
ADD CategoryID INT 

select*from Product

CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(100) UNIQUE
);

select * from Categories

/* It’s a column (must be a numeric type such as tinyint, smallint, int, bigint,
or a numeric/decimal type with scale 0) that automatically generates a value for
each new row inserted into the table.
When you insert a new row, you do not need to provide a value for the identity column; 
SQL Server auto‑generates it. */

-- Medioum
