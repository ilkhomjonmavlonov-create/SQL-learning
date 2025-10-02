#1st homework

	1.Define the following terms: data, database, relational database, and table.
Data is defined as a collection of individual facts or statistics. Data can come in the form of text, observations, figures, images, numbers, graphs, or symbols. For example, data might include individual prices, weights, addresses, ages, names, temperatures, dates, or distances.
Data is a raw form of knowledge and, on its own, doesn’t carry any significance or purpose. In other words, you have to interpret data for it to have meaning. Data can be simple—and may even seem useless until it is analyzed, organized, and interpreted.
Database. An organized collection of data stored and managed electronically, typically on a computer system.
Relational Database.A type of database that organizes data into structured tables (rows and columns) and establishes relationships between them using keys.
Table.A structured format in a relational database for storing data, consisting of rows (records) and columns (fields/attributes).

2.List five key features of SQL Server.
1. High Performance and Scalability, 2. Security and Access Control, 3. Data Management Tools
4. Backup and Recovery, 5. Business Intelligence & Integration

3.What are the different authentication modes available when connecting to SQL Server? (Give at least 2)
	1. Windows Authentication - Uses the user’s Windows account credentials (username and password) to connect to SQL Server.
	2. SQL Server Authentication - Uses a separate username and password created inside SQL Server (e.g., sa account).
	  
	                                2 - Medium tasks
4.Create a new database in SSMS named SchoolDB.
create database SchoolDB
go
use SchoolDB
5.Write and execute a query to create a table called Students with columns: StudentID (INT, PRIMARY KEY), Name (VARCHAR(50)), Age (INT).
create table Students(
	StudentID INT PRIMARY KEY,
	Name VARCHAR(50),
	Age INT

	
SQL COMMANDS

DQL-DATA  query language=selec
DML-data manipulation language=insert,,update,delete
DDL-date definition language= create,alter,drop,truncate
DCL-date control language=Grant,Revoke
TCL-transaction control language=Commit,rollback,begin tran



#2nd homework
CREATE DATABASE homework1

DROP table Students

create table Students (ID INT, NAME VARCHAR(20), GENDER CHAR(1), ENTERTIME DATE,SUBJECTTIME DECIMAL(5, 3))
SELECT * FROM Students
INSERT INTO Students VALUES 
                            (1, 'ALI', 'M', '2025-09-20', 67.4),
                            (2, 'Islom', 'M', '2025-09-20', 78.4),
							              (3,'Fotima','F','2025-09-25',90.8)
							

.Restore AdventureWorksDW2022.bak file to your server. (write its steps to submit) You can find the database from this link :https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorksDW2022.bak
Step 1. Download the .bak file
Step 2. Open SSMS
Step 3. Open the Restore Database Wizard
Step 4. Choose the Source
Step 5. Select Destination
Step 6. Check Restore Options
Step 7. Start the Restore
