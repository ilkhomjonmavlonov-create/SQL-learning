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
