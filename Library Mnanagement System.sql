-- create database
CREATE DATABASE library;
USE library;

-- create the tables
-- 1. create the branch table 

CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(200),
    Contact_no VARCHAR(15)
);

-- 2. create the employee table

CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name CHAR(25),
    Position CHAR(25),
    Salary INT,
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);

-- 3. create the books table

CREATE TABLE Books (
    ISBN CHAR(13) PRIMARY KEY,
    Book_title CHAR(200),
    Category CHAR(50),
    Rental_Price DECIMAL(10,2),
    Status CHAR(3) CHECK (Status IN ('Yes', 'No')),
    Author CHAR(100),
    Publisher CHAR(100)
);

-- 4. create the customer table

CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name CHAR(100),
    Customer_address VARCHAR(255),
    Reg_date DATE
);

-- 5. Create the IssueStatus Table

CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name CHAR(255),
    Issue_date DATE,
    Isbn_book CHAR(13),
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);

-- 6. Create the ReturnStatus Table

CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name CHAR(255),
    Return_date DATE,
    Isbn_book2 CHAR(13),
    FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);
 -- insert data ino the tables
 -- 1. insert data into the Branch table
 
INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no)
VALUES
(1, 101, '123 Main St, New York, NY 10001', '555-1234'),
(2, 102, '456 Elm St, Los Angeles, CA 90001', '555-5678'),
(3, 103, '789 Oak St, Chicago, IL 60601', '555-8765'),
(4, 104, '321 Pine St, Houston, TX 77001', '555-4321'),
(5, 105, '654 Cedar St, Phoenix, AZ 85001', '555-7890'),
(6, 106, '987 Spruce St, Philadelphia, PA 19101', '555-3456'),
(7, 107, '258 Birch St, San Antonio, TX 78201', '555-0123'),
(8, 108, '369 Walnut St, San Diego, CA 92101', '555-0987'),
(9, 109, '147 Fir St, Dallas, TX 75201', '555-6543'),
(10, 110, '951 Redwood St, San Jose, CA 95101', '555-3210');

SELECT * FROM  Branch;

-- 2. insert data into Employee table

INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no)
VALUES
(101, 'Alice Johnson', 'Manager', 70000, 1),
(202, 'Bob Smith', 'Clerk', 40000, 1),
(103, 'Charlie Brown', 'Manager', 75000, 2),
(204, 'Diana Ross', 'Clerk', 42000, 1),
(105, 'Edward Green', 'Manager', 72000, 3),
(206, 'Fiona Black', 'Assistant', 35000, 1),
(107, 'George White', 'Manager', 76000, 4),
(208, 'Hannah King', 'Clerk', 43000, 1),
(109, 'Ian Clark', 'Manager', 73000, 5),
(210, 'Jane Miller', 'Assistant', 36000, 1);

SELECT * FROM  Employee;

-- 3. insert data into Books table

INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher)
VALUES
('9783161484100', 'The Great Gatsby', 'Fiction', 15.00, 'yes', 'F. Scott Fitzgerald', 'Scribner'),
('9781861978769', 'To Kill a Mockingbird', 'Fiction', 30.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.'),
('9780743273565', '1984', 'Dystopian', 10.00, 'no', 'George Orwell', 'Secker & Warburg'),
('9780670813024', 'The Catcher in the Rye', 'Fiction', 13.00, 'yes', 'J.D. Salinger', 'Little, Brown and Company'),
('9781501196846', 'Becoming', 'Biography', 20.00, 'yes', 'Michelle Obama', 'Crown Publishing Group'),
('9780452284234', 'The Road', 'Dystopian', 8.00, 'no', 'Cormac McCarthy', 'Alfred A. Knopf'),
('9780330440867', 'The Girl on the Train', 'Thriller', 35.00, 'yes', 'Paula Hawkins', 'Riverhead Books'),
('9780316017929', 'The Silent Patient', 'Thriller', 15.50, 'yes', 'Alex Michaelides', 'Celadon Books'),
('9781501668777', 'History', 'Memoir', 16.00, 'no', 'Tara Westover', 'Random House'),
('9780307390703', 'The Book Thief', 'Historical Fiction', 11.50, 'yes', 'Markus Zusak', 'Knopf Books for Young Readers');

SELECT * FROM  Books;

-- 4. insert data into customer table

INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date)
VALUES
(1, 'jhon Mathew', '123 Maple St, New York, NY 10001', '2021-12-15'),
(2, 'Riya Sebastian', '456 Oak St, Los Angeles, CA 90001', '2021-11-20'),
(3, 'Catherin Bob', '789 Pine St, Chicago, IL 60601', '2021-10-25'),
(4, 'Dia Ruther', '321 Cedar St, Houston, TX 77001', '2021-09-30'),
(5, 'Ebin Marvel', '654 Birch St, Phoenix, AZ 85001', '2021-08-10'),
(6, 'Fizza Harison', '987 Spruce St, Philadelphia, PA 19101', '2021-07-05'),
(7, 'Griggery Brown', '258 Walnut St, San Antonio, TX 78201', '2021-06-12'),
(8, 'Hemin Susan', '369 Fir St, San Diego, CA 92101', '2021-05-18'),
(9, 'Ivan White', '147 Redwood St, Dallas, TX 75201', '2021-04-22'),
(10, 'Amy Abraham', '951 Elm St, San Jose, CA 95101', '2021-03-29');

SELECT * FROM  Customer;

-- 5. insert data into IssueStatus Table

INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book)
VALUES
(1, 1, 'The Great Gatsby', '2023-05-10', '9783161484100'),
(2, 2, 'To Kill a Mockingbird', '2023-05-12', '9781861978769'),
(3, 3, '1984', '2023-05-15', '9780743273565'),
(4, 4, 'The Catcher in the Rye', '2023-05-18', '9780670813024'),
(5, 5, 'Becoming', '2023-05-20', '9781501196846'),
(6, 6, 'The Road', '2023-06-05', '9780452284234'),
(8, 8, 'The Silent Patient', '2023-06-10', '9780316017929'),
(9, 9, 'History', '2023-06-15', '9781501668777'),
(10, 10, 'The Book Thief', '2023-06-20', '9780307390703');

SELECT * FROM IssueStatus ;
-- 6. insert data into  ReturnStatus Table

INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2)
VALUES
(1, 1, 'The Great Gatsby', '2023-06-20', '9783161484100'),
(2, 2, 'To Kill a Mockingbird', '2023-06-22', '9781861978769'),
(3, 3, '1984', '2023-06-25', '9780743273565'),
(4, 4, 'The Catcher in the Rye', '2023-06-28', '9780670813024'),
(5, 5, 'Becoming', '2023-06-30', '9781501196846'),
(6, 6, 'The Road', '2023-07-05', '9780452284234'),
(8, 8, 'The Silent Patient', '2023-07-10', '9780316017929'),
(9, 9, 'History', '2023-07-15', '9781501668777'),
(10, 10, 'The Book Thief', '2023-07-20', '9780307390703');

SELECT * FROM  ReturnStatus ;

-- Queries
-- 1.Retrieve the book title, category, and rental price of all available books

SELECT Book_title, Category, Rental_Price
FROM Books
WHERE Status = 'yes';

-- 2.List the employee names and their respective salaries in descending order of salary

SELECT Emp_name, Salary
FROM Employee
ORDER BY Salary DESC;

-- 3. Retrieve the book titles and the corresponding customers who have issued those books

SELECT Books.Book_title, Customer.Customer_name
FROM Books
JOIN IssueStatus ON Books.ISBN = IssueStatus.Isbn_book
JOIN Customer ON IssueStatus.Issued_cust = Customer.Customer_Id;

-- 4. Display the total count of books in each category:

SELECT Category, COUNT(*) AS TotalBooks
FROM Books
GROUP BY Category;

-- 5. Retrieve the employee names and their positions for the employees whose
-- salaries are above Rs.50,000:

SELECT Emp_name, Position
FROM Employee
WHERE Salary > 50000;

-- 6. List the customer names who registered before 2022-01-01 and have 
-- not issued any books yet

SELECT Customer_name
FROM Customer
WHERE Reg_date < '2022-01-01' 
AND Customer_Id NOT IN (SELECT Issued_cust FROM IssueStatus);

-- 7. Display the branch numbers and the total count of employees in each branch

SELECT Branch_no, COUNT(*) AS TotalEmployees
FROM Employee
GROUP BY Branch_no;

-- 8.Display the names of customers who have issued books in the month of June 2023

SELECT Customer.Customer_name
FROM Customer
JOIN IssueStatus ON Customer.Customer_Id = IssueStatus.Issued_cust
WHERE Issue_date BETWEEN '2023-06-01' AND '2023-06-30';

-- 9.Retrieve book_title from Books table containing history

SELECT Book_title
FROM Books
WHERE Book_title LIKE '%history%';

-- 10. retrieve the branch numbers along with the count of employees for branches 
-- having more than 5 employees

SELECT Branch_no, COUNT(*) AS TotalEmployees
FROM Employee
GROUP BY Branch_no
HAVING COUNT(*) > 5;

-- 11. Retrieve the names of employees
-- who manage branches and their respective branch addresses

SELECT Employee.Emp_name, Branch.Branch_address
FROM Employee
JOIN Branch ON Employee.Emp_Id = Branch.Manager_Id;

-- 12.Display the names of customers who have issued
-- books with a rental price higher than Rs. 25

SELECT Customer.Customer_name
FROM Customer
JOIN IssueStatus ON Customer.Customer_Id = IssueStatus.Issued_cust
JOIN Books ON IssueStatus.Isbn_book = Books.ISBN
WHERE Books.Rental_Price > 25;







