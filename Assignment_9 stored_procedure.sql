## create database
CREATE DATABASE PublicWorkerdb;
USE PublicWorkerdb;

## create worker table
CREATE TABLE Worker (
    Worker_Id INT PRIMARY KEY,
    FirstName CHAR(25),
    LastName CHAR(25),
    Salary INT,
    JoiningDate DATETIME,
    Department CHAR(25)
);

##insert data into worker table
-- Insert data into Worker table
INSERT INTO Worker (Worker_Id, FirstName, LastName, Salary, JoiningDate, Department)
VALUES
(1, 'John', 'Doe', 50000, '2022-01-15 09:00:00', 'HR'),
(2, 'Jane', 'Smith', 60000, '2022-02-20 10:30:00', 'Finance'),
(3, 'Michael', 'Johnson', 70000, '2022-03-25 11:45:00', 'IT'),
(4, 'Emily', 'Davis', 55000, '2022-04-30 12:00:00', 'Marketing'),
(5, 'William', 'Brown', 65000, '2022-05-10 09:15:00', 'Sales'),
(6, 'Olivia', 'Wilson', 48000, '2022-06-05 13:30:00', 'HR'),
(7, 'Liam', 'Garcia', 75000, '2022-07-12 08:50:00', 'Finance'),
(8, 'Ava', 'Martinez', 53000, '2022-08-18 14:10:00', 'IT'),
(9, 'Noah', 'Rodriguez', 62000, '2022-09-22 10:25:00', 'Marketing'),
(10, 'Sophia', 'Hernandez', 68000, '2022-10-29 15:45:00', 'Sales');

SELECT * FROM Worker;

## 1.Create a Stored Procedure to Add a New Record
DELIMITER $$

CREATE PROCEDURE AddWorker(
    IN p_Worker_Id INT,
    IN p_FirstName CHAR(25),
    IN p_LastName CHAR(25),
    IN p_Salary INT,
    IN p_JoiningDate DATETIME,
    IN p_Department CHAR(25)
)
BEGIN
    INSERT INTO Worker (Worker_Id, FirstName, LastName, Salary, JoiningDate, Department)
    VALUES (p_Worker_Id, p_FirstName, p_LastName, p_Salary, p_JoiningDate, p_Department);
END$$

DELIMITER ;

-- Call Procedure

CALL AddWorker(11, 'George', 'jhonson', 55000, '2022-02-15 09:00:00', 'HR');

SELECT * FROM Worker where Worker_Id = 11;

-- 2.Create a Stored Procedure to Retrieve Salary

DELIMITER $$

CREATE PROCEDURE GetWorkerSalary(
    IN p_Worker_Id INT,
    OUT p_Salary INT
)
BEGIN
    SELECT Salary INTO p_Salary
    FROM Worker
    WHERE Worker_Id = p_Worker_Id;
END$$

DELIMITER ;

-- call procedure
CALL GetWorkerSalary(3, @salary);
 SELECT @salary;
 
 -- 3. Create a Stored Procedure to Update Department
 
 DELIMITER $$

CREATE PROCEDURE UpdateWorkerDepartment(
    IN p_Worker_Id INT,
    IN p_Department CHAR(25)
)
BEGIN
    UPDATE Worker
    SET Department = p_Department
    WHERE Worker_Id = p_Worker_Id;
END$$

DELIMITER ;

-- call procedure
CALL UpdateWorkerDepartment(11, 'Finance');

SELECT Department FROM Worker WHERE Worker_Id =11;

-- 4. Create a Stored Procedure to Retrieve Worker Count by Department 

DELIMITER $$

CREATE PROCEDURE GetWorkerCountByDepartment(
    IN p_Department CHAR(25),
    OUT p_workerCount INT
)
BEGIN
    SELECT COUNT(*) INTO p_workerCount
    FROM Worker
    WHERE Department = p_Department;
END$$

DELIMITER ;

-- procedure call

CALL GetWorkerCountByDepartment('Finance', @workerCount);
SELECT @workerCount;

-- 5. Create a Stored Procedure to Retrieve Average Salary by Department
DELIMITER $$

CREATE PROCEDURE GetAverageSalaryByDepartment(
    IN p_Department CHAR(25),
    OUT p_avgSalary DECIMAL(10,2)
)
BEGIN
    SELECT AVG(Salary) INTO p_avgSalary
    FROM Worker
    WHERE Department = p_Department;
END$$

DELIMITER ;
 
 -- call procedure
 
CALL GetAverageSalaryByDepartment('HR', @avgSalary);
SELECT @avgSalary;





