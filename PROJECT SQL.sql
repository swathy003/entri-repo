CREATE DATABASE LIBRARYDB;

USE LIBRARYDB;

#BRANCH TABLE
CREATE TABLE Branch(
Branch_no INT PRIMARY KEY,
Manager_Id INT,
Branch_address VARCHAR(30),
Contact_no BIGINT
);

INSERT INTO Branch(Branch_no,Manager_Id,Branch_address,Contact_no) VALUES
(1,101,'SWATHY KANNAN',9987650943),
(2,102,'SALEJSH RSSI',7650983211),
(3,103,'RAJU DIVAKARAN',6574987322),
(4,104,'SUDHA KARAN',9977664422),
(5,105,'RAVI KUMAR',7789432312),
(6,106,'ANNA MARIA',9123508764),
(7,107,'RAGAVAN',7032458798),
(8,108,'SIJI RAJAN',7982345677),
(9,109,'MANIYAN PILLA',9160872569),
(10,110,'MUKESH AMBHANI',8015789023);

SELECT * FROM Branch;

#EMPLOYEE TABLE
CREATE TABLE Employee(
Emp_Id INT PRIMARY KEY,
Emp_name VARCHAR(20),
Position VARCHAR(20),
Salary INT,
Branch_no INT,
FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);

INSERT INTO Employee(Emp_Id,Emp_name,Position,Salary,Branch_no) VALUES
(1,'SWATHY','Manager',65000,1),
(2,'SREENATH','Library Assistant',55000,2),
(3,'KANNAN','Library Clerk',55000,2),
(4,'SIJI','Librarian',70000,2),
(5,'SALESH','Senior Librarian',70000,2),
(6,'SATHYAN','Research Assistant',75000,2),
(7,'USHA','Director',45000,2),
(8,'SAJESH','Customer Service',40000,4),
(9,'RAKESH','Cashier',30000,5),
(10,'MADHAVAN','Library Staff',35000,6);

SELECT * FROM Employee;

#BOOKS TABLE
CREATE TABLE Books(
ISBN VARCHAR(30) PRIMARY KEY,
Book_title VARCHAR(30),
Category VARCHAR(30),
Rental_Price DECIMAL(10,2),
Status VARCHAR(20),
Author VARCHAR(30),
Publisher VARCHAR(50)
);

INSERT INTO Books(ISBN,Book_title,Category,Rental_Price,Status,Author,Publisher) VALUES
('978-1173711463','MY JOURNEY','Biography',50.00,'Yes','APJ Abdul Kalam','Rupa Publications'),
('978-1591261750','A BRIEF HISTORY OF HUMANKIND','History',75.00,'No','Yuval Noah Harari','Harper Collins'),
('978-0061120084','To KILL A MOCKINGBIRD','Fiction',14.00,'No','Harper Lee','Signet Classic'),
('978-0316769488','THE CATCHER IN THE RYE','Fiction',18.00,'No','J.D Sallinger','Little,Brown and Company'),
('978-0062315007','THE ALCHEMIST','Fiction',30.00,'Yes','Paulo Coelho','HarperOne'),
('978-0618968633','THE HOBBIT','Fantasy',10.00,'Yes','J.R.R Tolkien','Vintage Books'),
('978-0743273565','THE GREAT GATSBY','Classic Literature',35.00,'Yes','F. Scott Fitzgerald','Scribner'),
('978-0060850524','BRAVE NEW WORLD','Dystopian Fiction',30.00,'Yes','Aldous Huxley','Harper Modern Classics'),
('978-1386290344','SIMPLY FLY','Auto Biography',15.00,'Yes','Rajiv Singh','Westland Publications'),
('978-0143446062','THE GOPI DIARIES: FINDING LOVE','Romance',26.00,'Yes','Sudha Murty','Penguin Random House India');


SELECT * FROM Books;

#CUSTOMER TABLE
CREATE TABLE Customer(
Customer_Id INT PRIMARY KEY,
Customer_name VARCHAR(30),
Customer_address VARCHAR(50),
Reg_date DATE 
);

INSERT INTO Customer(Customer_Id,Customer_name,Customer_address,Reg_date) VALUES
(1,'RAJU','Brockton Avenue','2023-01-17'),
(2,'CHUKKI','Oak Street','2023-02-21'),
(3,'SMARIYAM','Timpany Blvd','2023-09-25'),
(4,'LISHA','Pleasant Valley Street','2023-03-08'),
(5,'MAMMUTTY','Russell St','2023-11-19'),
(6,'MOHAN LAL','Lynnway villa','2023-05-11'),
(7,'SSANDRA','Plymount Street','2023-06-06'),
(8,'DONA','Hubbard Ave','2023-06-18'),
(9,'HAPPY','Rose Villa','2021-06-26'),
(10,'SHIKA','Thruway Plaza','2021-12-04');

SELECT * FROM Customer;

#ISSUESTATUS TABLE
CREATE TABLE IssueStatus(
Issue_Id INT PRIMARY KEY,
Issued_cust INT,
Issued_book_name VARCHAR(50),
Issue_date DATE,
Isbn_book VARCHAR(50),
FOREIGN KEY (Issued_cust) REFERENCES Customer (Customer_Id),
FOREIGN KEY (Isbn_book) REFERENCES Books (ISBN)
);

INSERT INTO IssueStatus(Issue_Id,Issued_cust,Issued_book_name,Issue_date,Isbn_book) VALUES
(1,1,'MY JOURNEY','2024-01-04','978-1173711463'),
(2,2,'A BRIEF HISTORY OF HUMANKIND','2024-03-16','978-1591261750'),
(3,3,'TO KILL A MOCKINGBIRD','2024-06-03','978-0061120084'),
(4,4,'THE CATCHER IN THE RYE','2023-06-04','978-0316769488'),
(5,5,'THE ALCHEMIST','2023-06-01','978-0062315007'),
(6,6,'THE HOBBIT','2023-06-22','978-0618968633'),
(7,7,'THE GREAT GATSBY','2024-10-13','978-0743273565'),
(8,8,'BRAVE NEW WORLD','2024-05-06','978-0060850524');


SELECT * FROM IssueStatus;

#RETURNSTATUS TABLE
CREATE TABLE ReturnStatus(
Return_Id INT PRIMARY KEY,
Return_cust INT,
Return_book_name VARCHAR(50),
Return_date DATE,
Isbn_book2 VARCHAR(50),
FOREIGN KEY (Isbn_book2) REFERENCES Books (ISBN)
);

INSERT INTO ReturnStatus(Return_Id,Return_cust,Return_book_name,Return_date,Isbn_book2) VALUES
(1,1,'MY JOURNEY','2024-05-11','978-1173711463'),
(2,2,'MEIN KAMPF','2024-03-07','978-1591261750'),
(3,3,'TO KILL A MOCKINGBIRD','2024-06-04','978-0061120084'),
(4,4,'THE CATCHER IN THE RYE','2024-05-07','978-0316769488'),
(5,5,'THE ALCHEMIST','2024-02-07','978-0062315007'),
(6,6,'THE HOBBIT','2024-03-02','978-0618968633'),
(7,7,'THE GREAT GATSBY','2024-04-01','978-0743273565'),
(8,8,'BRAVE NEW WORLD','2024-01-06','978-0060850524'),
(9,9,'SIMPLY FLY','2024-06-04','978-1386290344'),
(10,10,'THE GOPI DIARIES: FINDING LOVE','2024-10-11','978-0143446062');

SELECT * FROM ReturnStatus;

#QUESTIONS:
#1)Retrieve the book title, category, and rental price of all available books. 
   SELECT Book_title,Category,Rental_price FROM Books WHERE Status ='Yes';


#2)List the employee names and their respective salaries in descending order of salary.
   SELECT Emp_name,Salary FROM Employee ORDER BY Salary DESC;
   
   
#3)Retrieve the book titles and the corresponding customers who have issued those books. 
   SELECT Issued_book_name,Customer_name FROM IssueStatus LEFT JOIN Customer ON Issued_cust =  Customer_Id;
   
   
#4)Display the total count of books in each category
   SELECT Category,COUNT(*) AS 'Total books' FROM Books GROUP BY Category; 
   

#5)Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000. 
   SELECT Emp_name,Position FROM Employee WHERE Salary >50000;
   
   
#6)List the customer names who registered before 2022-01-01 and have not issued any book yet.
  SELECT Customer_name FROM Customer WHERE Customer_Id NOT IN (SELECT Issued_cust FROM Issuestatus) AND Reg_date < '2022-01-01';
  SELECT Customer_name FROM Customer
  Customer LEFT JOIN IssueStatus ON Issued_cust = Customer_Id WHERE Reg_date <'2022-01-01'; 
  
  
   
#7)Display the branch numbers and the total count of employees in each branch.
   SELECT Branch_no, COUNT(*) AS 'Total employees' FROM Employee GROUP BY Branch_no;
   
   
#8)Display the names of customers who have issued books in the month of June 2023.
   SELECT DISTINCT Customer_name FROM IssueStatus I LEFT JOIN Customer c ON I.Issued_cust = c.Customer_Id WHERE I.Issue_date BETWEEN'2023-06-01' AND '2023-06-30';
   
   
#9)Retrieve book_title from book table containing history. 
   SELECT Book_title FROM Books WHERE Book_title LIKE'%History%';
   
   
#10)Retrieve the branch numbers along with the count of employees for branches having more than 5 employees.
    SELECT Branch_no,COUNT(*) AS 'Count of employees' FROM Employee GROUP BY Branch_no HAVING COUNT(*) >5;
    
    
#11)Retrieve the names of employees who manage branches and their respective branch addresses. 
    SELECT  e.Emp_name, b.Branch_address FROM Employee e 
	LEFT JOIN Branch b ON e.Branch_no = b.Branch_no
    WHERE e.position = 'Manager';
    
    
#12)Display the names of customers who have issued books with a rental price higher than Rs. 25.
    SELECT DISTINCT c.Customer_name FROM IssueStatus I
    LEFT JOIN Books b ON I.Isbn_book = b.ISBN
    LEFT JOIN Customer c ON I.Issued_cust = c.Customer_Id
    WHERE b.Rental_price >25;
   