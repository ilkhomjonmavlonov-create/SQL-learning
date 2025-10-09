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

drop table Product

CREATE TABLE Product (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Price DECIMAL(10,2)
);

BULK INSERT Product
FROM 'C:\Users\MSII\Desktop\Directors,csv.txt'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'    
);

-- 2 

CREATE TABLE Product
(
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Price DECIMAL(10,2)
)

insert into Product (ProductID,ProductName,Price) values (1,'apple',20.03),
                                                         (2,'banana',30.30),
														 (3,'watermelon',40.04)

select* from Product

CREATE TABLE Categories
(
    CategoriID INT PRIMARY KEY,
    CategoryName VARCHAR(50),
    Best DECIMAL(10,2)

)

insert into Categories (CategoriID,CategoryName,Best) VALUES (1,'Fruits',58.90),
                                                               (2,'Vegetables',40.04),
															   (3,'Trees',60.05)


select* from Categories


select* from Product

ALTER TABLE Product
ADD CONSTRAINT FK_Product_Categories
    FOREIGN KEY (CategoriID)
    REFERENCES Categories(CategoriID)

/*	Explain the differences between PRIMARY KEY and UNIQUE KEY.
Add a CHECK constraint to the Products table ensuring Price > 0.
Modify the Products table to add a column Stock (INT, NOT NULL).
Use the ISNULL function to replace NULL values in Price column with a 0.
Describe the purpose and usage of FOREIGN KEY constraints in SQL Server.
*/

ALTER TABLE Products
ADD CONSTRAINT CK_Products_Price_Positive
    CHECK (Price > 0);


	CREATE TABLE Products
(
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Price DECIMAL(10,2) CHECK (Price > 0)
);


ALTER TABLE Products
ADD Stock INT NOT NULL
    DEFAULT 0;   -- This assigns 0 to all existing rows

-- (Optional) If you don’t want the default for future inserts, you can later drop the default constraint.
ALTER TABLE Products
ADD Stock INT NULL;

UPDATE Products
SET Stock = 0
WHERE Stock IS NULL;

ALTER TABLE Products
ALTER COLUMN Stock INT NOT NULL;

SELECT
  ProductID,
  ProductName,
  ISNULL(Price, 0) AS PriceOrZero
FROM Products;


UPDATE Products
SET Price = 0
WHERE Price IS NULL;

ALTER TABLE Products
ADD CategoryID INT NULL;   -- child column

ALTER TABLE Products
ADD CONSTRAINT FK_Products_Categories
    FOREIGN KEY (CategoryID)
    REFERENCES Categories(CategoryID)
    ON DELETE SET NULL
    ON UPDATE CASCADE;
 -- hard 

 -- Customers table with CHECK on Age
CREATE TABLE Customers
(
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    Age INT,
    CONSTRAINT CK_Customers_Age CHECK (Age >= 18)
);

-- Table with IDENTITY starting at 100, increment 10
CREATE TABLE SampleIdentity
(
    ID INT IDENTITY(100, 10) PRIMARY KEY,
    SomeValue VARCHAR(100)
);

-- Composite PRIMARY KEY in OrderDetails
CREATE TABLE OrderDetails
(
    OrderID INT,
    ProductID INT,
    Quantity INT,
    PRIMARY KEY (OrderID, ProductID)
);

-- COALESCE and ISNULL usage (example select)
SELECT
    COALESCE(SomeColumn, 'DefaultValue') AS CoalescedValue,
    ISNULL(SomeColumn, 'DefaultValue') AS IsNullValue
FROM SomeTable;

-- Employees table with PRIMARY KEY and UNIQUE on Email
CREATE TABLE Employees
(
    EmpID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(255) UNIQUE
);

-- FOREIGN KEY with ON DELETE CASCADE and ON UPDATE CASCADE
CREATE TABLE ChildTable
(
    ChildID INT PRIMARY KEY,
    ParentID INT,
    SomeData VARCHAR(100),
    CONSTRAINT FK_Child_Parent
        FOREIGN KEY (ParentID)
        REFERENCES ParentTable(ParentID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

