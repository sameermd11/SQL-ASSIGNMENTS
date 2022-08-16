--QUERY-1
---------

CREATE TABLE BOOKS( id int primary key, title char(100), author varchar(30), isbn bigint unique, published_date smalldatetime);

INSERT INTO BOOKS VALUES(1,'My First SQL book','Mary Parker',981483029127,'2012-02-22 12:08:17'),
			(2,'My Second SQL book','John Mayer',857300923713,'1972-07-03 09:22:45'),
			(3,'My Third SQL book','Cary Flint',523120967812,'2015-10-18 14:05:44')

SELECT * FROM BOOKS WHERE author LIKE ('%er');


--QUERY-2
---------

CREATE TABLE REVIEWS( id int primary key, book_id int foreign key references BOOKS (id), reviewer_name varchar(40), content char(100), rating int, published_date smalldatetime);

INSERT INTO REVIEWS VALUES (1,1,'John Smith','My First review',4,'2017-12-10 05:50:11'),
			   (2,2,'John Smith','My Second review',5,'2017-10-13 15:05:12'),
			   (3,2,'Alice Walker','Another review',1,'2017-10-22 23:47:10')

SELECT t1.title , t1.author , r1.reviewer_name FROM BOOKS t1 , REVIEWS r1 WHERE t1.id = r1.book_id;

--QUERY-3
---------

SELECT reviewer_name FROM REVIEWS GROUP BY reviewer_name HAVING COUNT(DISTINCT book_id) > 1;

--QUERY-4
---------

CREATE TABLE CUSTOMER( Cid int primary key, Cname varchar(30), age int, Caddress varchar(30), salary int);

INSERT INTO CUSTOMER VALUES (1,'Ramesh', 32 , 'Ahmedabad' , 2000),
			    (2,'Khilan', 25 , 'Delhi' , 1500),
			    (3,'Kaushik', 23 , 'Kota' , 2000),
			    (4,'Chaitali', 25 , 'Mumbai' , 6500),
   			    (5,'Hardik', 27 , 'Bhopal' , 8500),
 			    (6,'Komal', 22 , 'MP' , 5500),
 			    (7,'Muffy', 24 , 'Indore' , 10000)

SELECT Cname AS 'Customer Name' FROM CUSTOMER WHERE Caddress LIKE'%O%';

--QUERY-5
---------

CREATE TABLE ORDERS( OID int primary key, OrderDate smalldatetime, Customer_ID int foreign key references CUSTOMER(Cid), amount int);

INSERT INTO ORDERS VALUES(102, '2009-10-08 00:00:00', 3 , 3000),
			 (100, '2009-10-08 00:00:00', 3 , 1500),
			 (101, '2009-11-20 00:00:00', 2 , 1560),
			 (103, '2008-05-20 00:00:00', 4 , 2060)

SELECT orderdate , COUNT(Customer_ID) AS 'Order Placed' FROM ORDERS GROUP BY orderdate;

--QUERY-6
---------

CREATE TABLE EMPLOYEE( EID int primary key, Ename varchar(30), age int, EAddress varchar(30), Salary int);

INSERT INTO EMPLOYEE VALUES(1,'Ramesh', 32 , 'Ahmedabad' , 2000),
			   (2,'Khilan', 25 , 'Delhi' , 1500),
			   (3,'Kaushik', 23 , 'Kota' , 2000),
			   (4,'Chaitali', 25 , 'Mumbai' , 6500),
			   (5,'Hardik', 27 , 'Bhopal' , 8500),
			   (6,'Komal', 22 , 'MP' , null),
			   (7,'Muffy', 24 , 'Indore' , null)

SELECT LOWER(Ename) AS 'Employee Name', Salary AS 'Null Salary' FROM EMPLOYEE WHERE Salary is null;

--QUERY-7
---------

CREATE TABLE STUDENTDETAILS( RegisterNo int primary key, Sname varchar(30), age int, Qualification varchar(30), MobileNo bigint, mail_id varchar(30), location varchar(30), Gender char(1));

INSERT INTO STUDENTDETAILS VALUES(2, 'Sai', 22, 'B.E', 9952836777, 'Sai@gmail.com', 'Chennai', 'M'),
				 (3, 'Kumar', 20, 'BCS', 7890125648, 'Kumar@gmail.com', 'Madurai', 'M'),
				 (4, 'Selvi', 22, 'B.Tech', 8904567342, 'Selvi@gmail.com', 'Selam', 'F'),
				 (5, 'Nisha', 25, 'M.E', 7834672310, 'Nisha@gmail.com', 'Theni', 'F'),
				 (6, 'SaiSaran', 21, 'B.A', 7890345678, 'SaiSaran@gmail.com', 'Madurai', 'F'),
				 (7, 'Tom', 23, 'BCA', 89012345675, 'Tom@gmail.com', 'Pune', 'M')

SELECT Gender , COUNT(Gender) AS 'Total Male & Female Count' FROM STUDENTDETAILS GROUP BY Gender;

--QUERY-8
---------

CREATE TABLE COURSEDETAILS( Cid varchar(20) primary key, Cname varchar(30), start_date date, end_date date, fees int);

INSERT INTO COURSEDETAILS VALUES('DN003', 'DotNet', '2018-02-01', '2018-02-28', 15000),
				('DV004', 'Date Visualization', '2018-03-01', '2018-04-15', 15000),
				('JA002', 'Advanced Java', '2018-01-02', '2018-01-20', 10000),
				('JC001', 'Core Java', '2018-01-02', '2018-01-12', 15000)

CREATE TABLE CourseRegistration( RegistrationNo int , C_ID varchar(20) foreign key references COURSEDETAILS(Cid), Batch varchar(10));

INSERT INTO CourseRegistration VALUES(2,'DN003', 'FN'),
				     (3,'DV004', 'AN'),
				     (4,'JA002', 'FN'),
				     (2,'JA002', 'AN'),
				     (5,'JC001', 'FN')

SELECT t1.Cid, t1.Cname, COUNT(c1.RegistrationNo) AS 'Registration Count' FROM COURSEDETAILS t1 LEFT JOIN CourseRegistration c1 ON t1.Cid = c1.C_ID WHERE Start_date BETWEEN '2018-01-02' AND '2018-02-28' GROUP BY t1.Cname, t1.Cid ORDER BY t1.Cid DESC;

--QUERY-9
---------

CREATE TABLE Customers(CustID int primary key, FirstName varchar(30), LastName varchar(30));
 
INSERT INTO Customers VALUES(1,'George','Washington'),
			    (2,'John','Adams'), 
			    (3,'Thomas','Jefferson'), 
			    (4,'James','Madison'), 
			    (5,'James','Monroe')

CREATE TABLE ORDER2( order_id int primary key, order_date date, amount float, customer_id int foreign key references Customers(CustID));

INSERT INTO ORDER2 VALUES(1,'1776-04-04',234.56,1), 
			 (2,'1760-03-14',78.50,3),
			 (3,'1784-05-23',124.00,2),
			 (4,'1790-09-03',65.50,3),
			 (5,'1795-07-21',25.50,4),
			 (6,'1787-11-27',14.40,5)

SELECT t1.FirstName , t1.LastName FROM Customers t1 JOIN ORDER2 o1 ON t1.CustID = o1.customer_id GROUP BY t1.FirstName, t1.LastName HAVING COUNT (o1.customer_id) = 2;

--QUERY-10
----------

SELECT REVERSE(Sname) AS 'Reverse Order(Sname)', UPPER(location) AS Location from STUDENTDETAILS;

--QUERY-11
----------

CREATE TABLE order3( ID int primary key, OrderDate date, OrderNumber int, CustomerID int, totalamount int);

CREATE TABLE orderitem( ID int primary key, OrderID int, ProductID int, UnitPrice int, Quantity int);

CREATE TABLE Product( ID int primary key, ProductName varchar(30), SupplierID int, Package varchar(30), isDiscontinued varchar(5));

CREATE VIEW Orderview AS SELECT p1.ProductName, i1.Quantity, o1.OrderNumber FROM order3 o1, orderitem i1, Product p1 WHERE o1.ID = i1.ID and o1.ID = p1.ID;

SELECT * FROM Orderview;

--QUERY-12
----------

SELECT t1.Cname FROM STUDENTDETAILS t2 JOIN CourseRegistration t3 ON t2.RegisterNo=t3.RegistrationNo JOIN COURSEDETAILS t1 ON t1.Cid = t3.C_ID WHERE t2.Sname = 'Nisha';




