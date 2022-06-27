--INF202/Group 3

CREATE DATABASE K_Mart;

USE K_Mart;
--Creating Employee Table
CREATE TABLE Employee(
	EmployeeNum VARCHAR(10) PRIMARY KEY NOT NULL,
	LastName VARCHAR(50) NOT NULL,
	FirstName VARCHAR(50) NOT NULL,
	ContactNum VARCHAR(30) NOT NULL,
	Salary MONEY
);

--Inserting data to Employee Table 
INSERT INTO Employee
VALUES (1031, 'Bucala', 'Patricia', '09695665412', '4650');

INSERT INTO Employee
VALUES (1014, 'Francisco', 'Sheryl', '09896598269', '4390');

INSERT INTO Employee
VALUES (1021, 'David', 'Gabrille', '09569845212', '4999');

INSERT INTO Employee
VALUES (1010, 'Paguirigan', 'Raegan', '09856145698', '4501');

INSERT INTO Employee
VALUES (1096, 'Mendoza', 'Niel', '09856456235', '5001');

INSERT INTO Employee
VALUES (1066, 'Tan', 'Jed', '09756985231', '4825');

INSERT INTO Employee
VALUES (1088, 'Pangilinan', 'Faith', '09865325974', '5405');

INSERT INTO Employee
VALUES (1049, 'Wachu', 'Kallys', '09856458951', '4256');

INSERT INTO Employee
VALUES (1054, 'Tes', 'Marie', '09875365495', '6696');

INSERT INTO Employee
VALUES (1035, 'Uy', 'Miam', '09875698523', '5498');




--Creating Customer Table:
CREATE TABLE Customer (
    CustomerNum INT PRIMARY KEY IDENTITY (100, 1) NOT NULL,
    PaymentMethod VARCHAR(50) NOT NULL,
    Discounts CHAR(3) NOT NULL,
    EmployeeNum VARCHAR(10) FOREIGN KEY REFERENCES Employee(EmployeeNum) NOT NULL
);

--Inserting data to Customer Table 
INSERT INTO Customer
VALUES ('Cash','A', (SELECT EmployeeNum FROM Employee WHERE LastName = 'Wachu'));

INSERT INTO Customer
VALUES ('E-wallet','SC', (SELECT EmployeeNum FROM Employee WHERE LastName = 'Uy'));

INSERT INTO Customer
VALUES ('Credit','SP', (SELECT EmployeeNum FROM Employee WHERE LastName = 'Mendoza'));

INSERT INTO Customer
VALUES ('Cash','NA', (SELECT EmployeeNum FROM Employee WHERE LastName = 'David'));

INSERT INTO Customer
VALUES ('Debit','P', (SELECT EmployeeNum FROM Employee WHERE LastName = 'Bucala'));

INSERT INTO Customer
VALUES ('Cash','PWD', (SELECT EmployeeNum FROM Employee WHERE LastName = 'Pangilinan'));

INSERT INTO Customer
VALUES ('Credit','NA', (SELECT EmployeeNum FROM Employee WHERE LastName = 'Tan'));

INSERT INTO Customer
VALUES ('Debit','A', (SELECT EmployeeNum FROM Employee WHERE LastName = 'Paguirigan'));

INSERT INTO Customer
VALUES ('E-wallet','P', (SELECT EmployeeNum FROM Employee WHERE LastName = 'Tes'));

INSERT INTO Customer
VALUES ('E-wallet','PWD', (SELECT EmployeeNum FROM Employee WHERE LastName = 'Francisco'));




--Creating Transact table
CREATE TABLE Transact
(TransactionNum INT PRIMARY KEY IDENTITY (1000,20) NOT NULL,
NumberOfItems INT NOT NULL,
TotalPrice MONEY NOT NULL,
CashIn MONEY NOT NULL,
OrderDate DATE NOT NULL,
CustomerNum INT FOREIGN KEY REFERENCES Customer (CustomerNum) NOT NULL
);


--Inserting data to Transact Table 
INSERT INTO Transact
VALUES(3, 3586, 4000, '2022-1-10',101)
INSERT INTO Transact
VALUES(3, 4490, 5000, '2022-1-11',100)
INSERT INTO Transact
VALUES(1, 1090, 1100, '2022-1-12',109)
INSERT INTO Transact
VALUES(2, 557, 600, '2022-1-13',105)
INSERT INTO Transact
VALUES(3, 889, 1000, '2022-1-14',104)
INSERT INTO Transact
VALUES(1, 3356, 4000, '2022-1-15',108)
INSERT INTO Transact
VALUES(3, 6516, 6600, '2022-1-16',102)
INSERT INTO Transact
VALUES(2, 390, 500, '2022-1-17',103)
INSERT INTO Transact
VALUES(1, 890, 1000, '2022-1-18',106)
INSERT INTO Transact
VALUES(2, 6490, 7000, '2022-1-19',107)



--Creating Supplier Table
CREATE TABLE Supplier(

	--Supplier Details
		SupplierNum INT PRIMARY KEY IDENTITY (1,1) NOT NULL ,
		CompanyName VARCHAR(50) NOT NULL,
		ContactNum VARCHAR(12)  NOT NULL,
	--Address
		Street VARCHAR(50) NOT NULL,
		City VARCHAR(50) NOT NULL,
		Zip VARCHAR(6) NOT NULL,
	--Product
		Supplied_Quantity INT  NOT NULL ,

	--Employee
		EmployeeNum  VARCHAR(10) FOREIGN KEY REFERENCES Employee (EmployeeNum) NOT NULL

)

--Inserting data to Supplier Table 
 INSERT INTO Supplier (CompanyName , ContactNum, Street, City, Zip ,Supplied_Quantity , EmployeeNum  )
  VALUES   
		   ('Jed the Doggo','09123456789' ,'rawr','Rawr Dragin Rawr City','66666' ,'100' , '1031' ),
		   ('Bucisco','09345673910' ,'Hatdog','Neptune City','66666' ,'100' , '1031' ),
		   ('Patty Burger','097853615274' ,'Buggy','ASMR City','69569' ,'100' , '1031' ),
		   ('Marie the Snacks','09362918465' ,'Marietes','Sa bahay ni Tita','90210' ,'100' , '1031' ),
		   ('Canned Jed','09483968881' ,'Cheesedog','Mars City','90210' ,'100' , '1031' ),
		   ('Marie the Bakerist','09126448573' ,'Hatdog','City','90210' ,'100' , '1031' ),
		   ('69 Pisces','09887336447' ,'Sa tabi tabi','City lang','90210' ,'100' , '1031' ),
		   ('Ted Jan','09665432617' ,'Sa tabi tabi','City lang','90210' ,'100' , '1031' ),
		   ('PatRyl','09846382456' ,'shot na shot','City lang','90210','100' , '1031' ),
		   ('Pat the cleaner','092758395849' ,'Sa puso ko','Sa bahay daw','90210' ,'100' , '1031' )




--Creating Inventory Table
CREATE TABLE Inventory(
	ItemNum VARCHAR(5) PRIMARY KEY NOT NULL,
	ItemName VARCHAR(50) NOT NULL,
	InStock INT NOT NULL,
	Price MONEY,
	SupplierNum INT NOT NULL FOREIGN KEY REFERENCES Supplier (SupplierNum) 
);

--Inserting data to Inventory Table 
INSERT INTO Inventory
VALUES(1123, 'Samgak Gimbap', 32, 119.75,1);

INSERT INTO Inventory
VALUES(1234, 'Fruit Soju', 43, 57.00,2);

INSERT INTO Inventory
VALUES(2345, 'Mixed Veggies', 30, 124.75,3);

INSERT INTO Inventory
VALUES(3456, 'Chips', 62, 63.99,4);

INSERT INTO Inventory
VALUES(4567, 'Whole Cow Milk', 14, 139.00,5);

INSERT INTO Inventory
VALUES(5678, 'Cooking Oil', 18, 349.99,6);

INSERT INTO Inventory
VALUES(6789, 'Peanut Butter', 14, 110.00,7);

INSERT INTO Inventory
VALUES(7890, 'Kimchi Bottle', 26, 180.00,8);

INSERT INTO Inventory
VALUES(8901, 'Seaweed Wrap', 50, 94.00,9);

INSERT INTO Inventory
VALUES(9012, 'Instant Cup Noodles', 50, 55.00,10);



--Creating Order Table
CREATE TABLE [Order] (
	OrderNum INT PRIMARY KEY NOT NULL,
	ItemNum VARCHAR(5) FOREIGN KEY REFERENCES Inventory (ItemNum),
	TransactionNum INT NOT NULL FOREIGN KEY REFERENCES Transact (TransactionNum)
);

--Inserting data to Employee Table 
INSERT INTO [Order]
VALUES (3001, '1123',1000);

INSERT INTO [Order]
VALUES (3002, '1234',1000);

INSERT INTO [Order]
VALUES (3003, '2345',1000);

INSERT INTO [Order]
VALUES (3004, '3456',1020);

INSERT INTO [Order]
VALUES (3005, '4567',1020);

INSERT INTO [Order]
VALUES (3006, '5678',1020);

INSERT INTO [Order]
VALUES (3007, '6789',1040);

INSERT INTO [Order]
VALUES (3008, '7890',1060);

INSERT INTO [Order]
VALUES (3009, '8901',1060);

INSERT INTO [Order]
VALUES (3010, '9012',1080);

INSERT INTO [Order]
VALUES (3011, '5678',1080);

INSERT INTO [Order]
VALUES (3012, '5678',1080);

INSERT INTO [Order]
VALUES (3013, '9012',1100);

INSERT INTO [Order]
VALUES (3014, '9012',1120);

INSERT INTO [Order]
VALUES (3015, '2345',1120);

INSERT INTO [Order]
VALUES (3016, '2345',1120);

INSERT INTO [Order]
VALUES (3017, '3456',1140);

INSERT INTO [Order]
VALUES (3018, '1234',1140);

INSERT INTO [Order]
VALUES (3019, '8901',1160);

INSERT INTO [Order]
VALUES (3020, '2345',1180);

INSERT INTO [Order]
VALUES (3021, '2345',1180);


----------Single SQL Queries----------
--Select all the columns in the Transact table.
SELECT * FROM Transact;
--List all the information in the Supplier table.
SELECT * FROM Supplier;


----------SQL with WHERE Condition----------
--Display all items with 20 or less stocks remaining.
SELECT * FROM Inventory 
WHERE InStock <= 20; 

--Display the customer number, the discount they received, and the employee number of the person who assisted them for all PWD customers.
SELECT CustomerNum, Discounts, EmployeeNum 
FROM Customer 
WHERE Discounts = 'PWD'; 


----------SQL Compound Conditions (AND, OR, NOT)----------
--List the item name from the Inventory table that has an in stock greater than 30 AND a price less than 120.
SELECT ItemName FROM Inventory  
WHERE InStock > 30 AND Price < 120;

--List the transaction number from the Transact table that has a number of items less than 25 AND a total price less than 5000.
SELECT TransactionNum FROM Transact  
WHERE NumberOfItems < 25 AND TotalPrice < 5000;

--List the item name from the Inventory table that has an in stock greater than 30 OR a price less than 120.
SELECT ItemName FROM Inventory  
WHERE InStock > 30 OR Price < 120;

--List the transaction number from the Transact table that has a number of items less than 25 OR a total price less than 5000.
SELECT TransactionNum FROM Transact  
WHERE NumberOfItems < 25 OR TotalPrice < 5000;

--List the item name from the Inventory table where the item name is not "Whole Cow Milk."
SELECT ItemName FROM Inventory  
WHERE NOT ItemName ='Whole Cow Milk'; 

--List the item name from the Inventory table where in stock is not less than or equal to 30.
SELECT ItemName FROM Inventory  
WHERE NOT InStock <= 30; 


----------SQL Computed Fields----------
--Find the item number, name, and total price based on how many stocks are left for each item.
SELECT ItemNum, ItemName, (InStock * Price) AS TotalPrice 
FROM Inventory; 

--Give the transaction number, order date, customer number, and their change from a cash payment of at least ₱1000.
SELECT TransactionNum, OrderDate, 
CustomerNum, (CashIn - TotalPrice) AS Change 
FROM Transact 
WHERE CashIn >= 1000.00; 


----------SQL WHERE Application with a Range Search----------
--Write an SQL query that will display the transaction number and total price ranging from ₱1000 to ₱5000 in the Transact table.
SELECT TransactionNum, TotalPrice 
FROM Transact 
WHERE TotalPrice BETWEEN 1000 AND 5000;

--Using the Inventory table, write an SQL query that will display the item number and name together with the stock of these items that is between 0 to 40.
SELECT ItemNum, ItemName, InStock 
FROM Inventory 
WHERE InStock BETWEEN 0 AND 40;


----------SQL WHERE Application with a Pattern Search----------
--Write an SQL query that will show the employee’s full name and contact number of each employee that has the letter ‘A’ in their first name.
SELECT FirstName, LastName, ContactNum 
FROM Employee 
WHERE FirstName LIKE '%A%'; 

--Display the name, contact number, and complete address of each supplier where their company name includes ‘Pat’.
SELECT CompanyName, ContactNum, Street, City, Zip 
FROM Supplier 
WHERE CompanyName LIKE '%Pat%';


----------Using LIKE Operator----------
--Write an SQL query that will display the ItemNum, ItemName, and InStock of each Item that has a name that contains the letters 'wrap'.
SELECT ItemNum, ItemName, InStock 
FROM Inventory 
WHERE ItemName LIKE '%wrap%'; 

/* Write an SQL query that will display the EmployeeNum, LastName, FirstName and ContactNum of 
each employee that has a last name that contains the letters 'an'. */
SELECT EmployeeNum, LastName, FirstName, ContactNum 
FROM Employee 
WHERE LastName LIKE '%an%'; 


----------Using IN Operator----------
--List all details of suppliers in cities ‘ASMR city’, ‘Sa bahay daw’ and ‘City lang’.
SELECT * FROM Supplier 
WHERE City IN ('ASMR CITY', 'Sa bahay daw', 'City lang');

--List the customer number and their payment method where the payment methods are e-wallet and debit.
SELECT CustomerNum, PaymentMethod FROM Customer 
WHERE PaymentMethod IN ('E-wallet', 'Debit');


----------Using Sorting Queries----------
/**Write an SQL query that will arrange the data displayed from the least number of InStocks to the 
greatest number of InStocks in the Inventory table. The columns to be displayed only are the ItemNum,
ItemName, and InStock. Sort the output by InStock. */
SELECT ItemNum, ItemName, InStock 
FROM Inventory 
ORDER BY InStock ASC;

/*List all the attributes in the customer table for each customer. Sort the output by PaymentMethod.
Within the discounts of each payment method, sort the output alphabetically by Discounts. */
SELECT *  FROM Customer 
ORDER BY PaymentMethod, Discounts;


----------SQL GROUP BY and HAVING Application----------
/* Write an SQL query that selects the PaymentMethod in which it has at least 1 or more occurrences. 
List also the number of its occurrences in each customer class. They should be grouped by PaymentMethod. */
SELECT PaymentMethod, COUNT(*) AS numOfOccurence 
FROM Customer 
GROUP BY PaymentMethod 
HAVING COUNT(EmployeeNum) != 0;

/* Write an SQL query for each zip code with fewer than 3 companies residing there.
List the zip code and the number of companies residing in that zip area. 
Apply the GROUP BY and HAVING functions. Sort the groups by zip. */
SELECT Zip, COUNT (*) AS numOfCompany 
FROM Supplier 
GROUP BY Zip 
HAVING COUNT(*) < 3 
ORDER BY Zip; 


----------Using SQL Functions (AVG, Sum, Max, Min, Count, Rollup, ISNULL)----------
----------Using SQL Functions (AVG, Sum, Max, Min)----------
--Find the total supplies of the K-Mart Supplier, as well as the average supplies, minimum and maximum value of their supplies.
SELECT SUM(Supplied_Quantity) AS [Total Supplies], 
AVG(Supplied_Quantity) AS [Average Supplies], 	
MAX(Supplied_Quantity)  AS [Maximum Supplies], 
MIN(Supplied_Quantity)  AS [Minimum Supplies] 
FROM Supplier;

--Find the total salary of the K-Mart Employee, as well as the average salary, minimum and maximum value of their salary. 
SELECT SUM(Salary) AS [Total Salary], 
AVG(Salary) AS [Average Salary], 
MAX(Salary)  AS [Maximum Salary], 
MIN(Salary)  AS [Minimum Salary] 
FROM Employee;

--Find the total price of the K-Mart Transact, as well as the average price, minimum and maximum value of their price. 
SELECT SUM(TotalPrice) AS [Total Price], 
AVG(TotalPrice) AS [Average Price], 
MAX(TotalPrice) AS [Maximum TotalPrice], 
MIN(TotalPrice) AS [Minimum TotalPrice] 
FROM Transact;

----------Using SQL Functions (AVG)----------
--Find the average salary value from the Employee table.
SELECT AVG(Salary)  
AS [Average Salary] 
FROM Employee;

--Find the average of the total price value from the Transact table. 
SELECT AVG(TotalPrice)  
AS [Average Price] 
FROM Transact;

----------Using SQL Functions (Sum)----------
--Find the total price of the supplied quantity from the Supplier table.
SELECT SUM(Supplied_Quantity)  
AS [TotalSupplies]  
FROM Supplier;

--Find the total salary from the Employee table. 
SELECT SUM(Salary)  
AS [Total Salary]  
FROM Employee;

----------Using SQL Functions (Max)----------
--Find the maximum supply value of the supplied quantity from the Supplier table.
SELECT MAX(Supplied_Quantity)   
AS [Maximum Supplies]  
FROM Supplier;

--Find the maximum salary value from the Employee table. 
SELECT MAX(Salary)   
AS [Maximum Salary]  
FROM Employee;

----------Using SQL Functions (Min)----------
--Find the minimum salary value from the Employee table.
SELECT MIN(Salary)   
AS [Minimum Salary]  
FROM Employee;

--Find the minimum total price value from the Transact table. 
SELECT MIN(TotalPrice)  
AS [Minimum TotalPrice]  
FROM Transact;

----------Using SQL Functions (Count)----------
--How many customers used cash as their payment method?
SELECT Count (PaymentMethod) AS [Cash Method] 
FROM Customer  
WHERE PaymentMethod = 'Cash'; 

--How many customers used e-wallet as their payment method? 
SELECT Count (PaymentMethod) AS [E-Wallet Method] 
FROM Customer  
WHERE PaymentMethod = 'E-wallet';

--How many customers used debit as their payment method?
SELECT Count (PaymentMethod) AS [Bank Method] 
FROM Customer  
WHERE PaymentMethod = 'Debit';

--How many customers used credit as their payment method? 
SELECT Count (PaymentMethod) AS [Credit Method] 
FROM Customer  
WHERE PaymentMethod = 'Credit';

--Count the number of K-Mart employees in the Employee table.
SELECT Count (EmployeeNum) AS [Count Employee] 
FROM Employee;

--Count the number of K-Mart customers in the Customer table.
SELECT Count (CustomerNum) AS [Count Customer] 
FROM Customer;

--Count the number of K-Mart transactions in the Transact table.
SELECT Count (TransactionNum) AS [Count Transaction] 
FROM Transact;
--Count the number of K-Mart suppliers in the Supplier table.
SELECT Count (SupplierNum) AS [Count Supplier] 
FROM Supplier;

--Count the number of K-Mart item numbers in the Inventory table.
SELECT Count (ItemNum) AS [Count Item] 
FROM Inventory;

----------Using SQL Functions (Rollup)----------
/* Write an SQL query that will calculate the total customer of the Customer 
table and they should be grouped by payment method. Count the employee number 
of occurrences in each payment method. Then compute the grand total using the ROLLUP command.  */
SELECT PaymentMethod, SUM(CustomerNum) AS [Total Customer], Count(EmployeeNum) AS Occurence  
FROM Customer  
GROUP BY PaymentMethod With ROLLUP; 

/* Write an SQL query that will calculate the total salary of the employee in the Employee 
table and they should be grouped by last name. Count the employee number of occurrences 
in each last name. Then compute the grand total using the ROLLUP command. */
SELECT LastName, SUM(Salary) AS [Total Salary], Count(EmployeeNum) AS Occurence  
FROM Employee  
GROUP BY LastName With ROLLUP;

----------Using SQL Functions (ISNULL)----------
/* Write an SQL query that will calculate the total customer of all customers and they should 
be grouped by item payment method. Count the number of occurrences in each item payment method. 
Then compute the grand total using the ROLLUP command.
Put a Label: GT to the blank last row of the PaymentMethod column. */
SELECT ISNULL (PaymentMethod, 'GT') AS [Class], 
SUM(CustomerNum) AS [Total Customer],  
Count(PaymentMethod) AS [Occurrence] 
FROM Customer 
Group BY PaymentMethod WITH ROLLUP;

/*Write an SQL query that will calculate the total salary of all employees and they 
should be grouped by item last name. Count the number of occurrences in each last name. 
Then compute the grand total using the ROLLUP command. 
Put a Label: GT to the blank last row of the LastName column. */
SELECT ISNULL (LastName, 'GT') AS [EmployeeName], 
SUM(Salary) AS [Total Salary],  
Count(LastName) AS [Occurrence] 
FROM Employee 
Group BY LastName WITH ROLLUP;


----------Joining Two Tables----------
--List the order number, item number and the item’s name and quantity of items in stock.
SELECT [Order].OrderNum, [Order].ItemNum, Inventory.ItemName, Inventory.InStock 
FROM [Order], Inventory 
WHERE [Order].ItemNum = Inventory.ItemNum; 

--List transaction number and its total price with the customer number and payment method.
SELECT Transact.TransactionNum, Transact.TotalPrice, Customer.CustomerNum, Customer.PaymentMethod 
FROM Transact, Customer 
WHERE Transact.CustomerNum = Customer.CustomerNum;


----------Joining Multiple Tables----------
/* List the customer number together with the employee number, last name, 
and first name of the employee who represents the customer. Sort the records by customer number. */
SELECT Customer.CustomerNum, Employee.EmployeeNum,  Employee.LastName, Employee.FirstName 
FROM Customer, Employee 
WHERE Customer.EmployeeNum = Employee.EmployeeNum 
Order BY CustomerNum; 

/* List the customer number together with the employee number, last name, 
and first name of the employee who represents the customer. Sort the records by customer number. */
SELECT Transact.TransactionNum, Customer.CustomerNum, Customer.PaymentMethod, Customer.Discounts 
FROM Transact, Customer 
WHERE Transact.CustomerNum = Customer.CustomerNum 
Order BY TransactionNum; 


----------Alter Table Structure----------
--Add a new column named “CustomerType” in the Customer table with the following information. These types are Regular and Member.
ALTER TABLE Customer  
ADD CustomerType CHAR(10);

--Update the null values of Customers to ‘Regular’.
UPDATE Customer 
Set CustomerType='Regular'; 

--Change customers 102, 109, 100, 104, and 105’s customer type to ‘Member’.
UPDATE Customer 
Set CustomerType='Member' 
WHERE CustomerNum ='102';

UPDATE Customer 
Set CustomerType='Member' 
WHERE CustomerNum ='109';

UPDATE Customer 
Set CustomerType='Member' 
WHERE CustomerNum ='100';

UPDATE Customer 
Set CustomerType='Member' 
WHERE CustomerNum ='104';

UPDATE Customer 
Set CustomerType='Member' 
WHERE CustomerNum ='105';

--Add a new column named “City” in the Employee table.
ALTER TABLE Employee  
ADD City CHAR(20);

--Update the null values of City to ‘Manila City’.
UPDATE Employee 
Set City='Manila City'; 

--Change the city of employee 1031 to ‘Quezon City’. 
UPDATE Employee 
Set City='Quezon City' 
WHERE EmployeeNum ='1031';


----------Creating New Table in the Existing Table----------
--Created a new table named Customer_Member that contains all the columns and rows in the Customer_Member table in which Customer Type is ‘Member’. 
SELECT * INTO Customer_Members  
FROM Customer 
WHERE CustomerType ='Member'; 

--Created a new table named Regular_Customer that contains all the columns and rows in the Regular_Customer table in which Customer Type is ‘Regular’.
SELECT * INTO Regular_Customer 
From Customer 
WHERE CustomerType ='Regular'; 


----------Insert New Data to the New Table----------
--Insert 5 new data entries in the new Customer_Members table from the existing Customer table.
INSERT INTO Customer_Members 
VALUES ('E-wallet', 'NA', (SELECT EmployeeNum 
FROM Employee WHERE LastName = 'David'), 'Member'); 

INSERT INTO Customer_Members 
VALUES ('Credit', 'SC', (SELECT EmployeeNum 
FROM Employee WHERE LastName = 'Pangilinan'), 'Member'); 

INSERT INTO Customer_Members 
VALUES ('Debit', 'A', (SELECT EmployeeNum 
FROM Employee WHERE LastName = 'Paguirigan'), 'Member'); 

INSERT INTO Customer_Members 
VALUES ('Cash', 'A', (SELECT EmployeeNum 
FROM Employee WHERE LastName = 'Mendoza'), 'Member'); 

INSERT INTO Customer_Members 
VALUES ('Debit', 'P', (SELECT EmployeeNum 
FROM Employee WHERE LastName = 'Bucala'), 'Member'); 

--Insert 5 new data entries in the new Regular_Customer table from the existing Customer table
INSERT INTO Regular_Customer 
VALUES ('Credit', 'SP', (SELECT EmployeeNum 
FROM Employee WHERE LastName = 'Tes'), 'Regular'); 

INSERT INTO Regular_Customer 
VALUES ('Cash', 'PWD', (SELECT EmployeeNum 
FROM Employee WHERE LastName = 'Uy'), 'Regular'); 

INSERT INTO Regular_Customer 
VALUES ('Debit', 'SP', (SELECT EmployeeNum 
FROM Employee WHERE LastName = 'Francisco'), 'Regular'); 

INSERT INTO Regular_Customer 
VALUES ('E-wallet', 'P', (SELECT EmployeeNum 
FROM Employee WHERE LastName = 'Wachu'), 'Regular'); 

INSERT INTO Regular_Customer 
VALUES ('Debit', 'A', (SELECT EmployeeNum 
FROM Employee WHERE LastName = 'Tan'), 'Regular'); 


----------Delete Data to the New Table----------
--Delete 2 data entries in the new Customer_Members table from the existing Customer table.
DELETE FROM Customer_Members 
WHERE CustomerNum = 110; 

DELETE FROM Customer_Members 
WHERE CustomerNum= 105; 

--Delete 4 data entries in the new Regular_Customer table from the existing Customer table.
DELETE FROM Regular_Customer 
WHERE CustomerNum = 103; 

DELETE FROM Regular_Customer 
WHERE CustomerNum= 107; 

DELETE FROM Regular_Customer 
WHERE CustomerNum= 109; 

DELETE FROM Regular_Customer 
WHERE CustomerNum= 113; 


----------Update Data to the New Table----------
--Change the Customer 109 CustomerType to ‘Regular’ in the Customer_Members Table.
UPDATE Customer_Members 
Set CustomerType='Regular' 
WHERE CustomerNum ='109' 
Select * FROM Customer_Members WHERE CustomerNum ='109'; 

--Change the Customer 108 CustomerType to ‘Member’ in the Regular_Customer Table.
UPDATE Regular_Customer 
Set CustomerType='Member' 
WHERE CustomerNum ='108' 
Select * FROM Regular_Customer WHERE CustomerNum ='108'; 


----------Foreign Key Constraints----------
--Write an SQL query that will delete a transaction made on 2022–01-11.
DELETE 
FROM Transact
WHERE OrderDate = '2022-01-11';

--Write an SQL query that will drop the Supplier table.
DROP TABLE Supplier;