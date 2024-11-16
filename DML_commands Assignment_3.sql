# create a data base named companymanager
CREATE DATABASE Companymanager;
USE Companymanager;
# create a table named Managers
CREATE TABLE Managers (
 Manager_Id INT PRIMARY KEY,  -- Primary Key Constraint
 First_name VARCHAR(25) NOT NULL, -- Not Null Constraint
 Last_name VARCHAR(25)  NOT NULL,
 DOB DATE NOT NULL,
 Age INT CHECK (Age > 0 AND Age < 70),
    Last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    Gender ENUM('Male', 'Female', 'Other') NOT NULL,
    Department VARCHAR(50) NOT NULL,
    Salary DECIMAL(10, 2) NOT NULL
);
 SELECT * FROM Managers;
 # insert 10 rows into table managers
 INSERT INTO Managers (Manager_Id, First_name, Last_Name, DOB, Age, Gender, Department, Salary)
VALUES
(1, 'Johan', 'Cathe', '1985-06-15', 39, 'Male', 'IT', 32000.00),
(2, 'Aaliya', 'Khan', '1990-04-20', 34, 'Female', 'HR', 30000.00),
(3, 'Robin', 'Jhonson', '1983-02-11', 41, 'Male', 'Finance', 35000.00),
(4, 'Stephy', 'Smith', '1988-09-23', 36, 'Female', 'IT', 38000.00),
(5, 'Michel', 'Abraham', '1979-01-17', 45, 'Male', 'Marketing', 27000.00),
(6, 'Emi', 'Brown', '1992-12-10', 31, 'Female', 'Finance', 26000.00),
(7, 'Linda', 'Mark', '1995-07-08', 29, 'Male', 'IT', 24000.00),
(8, 'Susan', 'Pual', '1987-03-05', 37, 'Female', 'HR', 20000.00),
(9, 'David', 'Jackson', '1980-11-30', 43, 'Male', 'Operations', 29000.00),
(10, 'Emily', 'Andriya', '1993-05-27', 31, 'Female', 'IT', 35000.00);
 SELECT * FROM Managers;
# Query to Retrieve Name and DOB of Manager with Manager_Id = 1
SELECT First_name, Last_name, DOB FROM Managers WHERE Manager_Id = 1;

# Query to Display Annual Income of All Managers
SELECT Manager_Id, First_name, Last_Name, (Salary * 12) AS Annual_Income FROM Managers;

# Query to Display Records of All Managers Except ‘Aaliya’
SELECT * FROM Managers WHERE First_name != 'Aaliya';

#Query to Display Details of Managers in IT Department Earning More Than 25,000 Per Month
SELECT * FROM Managers WHERE Department = 'IT' AND Salary > 25000;

# Query to Display Details of Managers with Salary Between 10,000 and 35,000
SELECT * FROM Managers WHERE Salary BETWEEN 10000 AND 35000;



