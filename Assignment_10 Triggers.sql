-- Creating database
CREATE DATABASE Teachersdb;
USE Teachersdb;

-- 1. Create Table teachers and Insert Rows

CREATE TABLE teachers (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    subject VARCHAR(50),
    experience INT,
    salary DECIMAL(10, 2)
);

INSERT INTO teachers (id, name, subject, experience, salary) VALUES
(1, 'Alice', 'Mathematics', 12, 50000.00),
(2, 'Bob', 'Physics', 8, 45000.00),
(3, 'Charlie', 'Chemistry', 5, 40000.00),
(4, 'Daisy', 'Biology', 3, 38000.00),
(5, 'Edward', 'English', 15, 55000.00),
(6, 'Fiona', 'History', 2, 36000.00),
(7, 'George', 'Geography', 10, 47000.00),
(8, 'Hannah', 'Computer Science', 7, 49000.00);

SELECT * FROM teachers;

-- 2. Create Before Insert Trigger before_insert_teacher
DELIMITER //
CREATE TRIGGER before_insert_teacher
BEFORE INSERT ON teachers
FOR EACH ROW
BEGIN
IF NEW.salary < 0 THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'salary cannot be negative';
END IF;
END;
//
DELIMITER ;

-- 3. Create After Insert Trigger after_insert_teacher
-- create the teacher_log table

CREATE TABLE teacher_log (
    teacher_id INT,
    action VARCHAR(50),
    timestamp DATETIME
);

-- create the trigger
DELIMITER //
CREATE TRIGGER after_insert_teacher
AFTER INSERT ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action, timestamp)
    VALUES (NEW.id, 'insert', NOW());
END;
// 
DELIMITER ;

-- 4. Create Before Delete Trigger

DELIMITER //

CREATE TRIGGER before_delete_teacher
BEFORE DELETE ON teachers
FOR EACH ROW
BEGIN
    IF OLD.experience > 10 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete a row with experience greater than 10 years';
    END IF;
END;
//
DELIMITER ;

-- 5.Create After Delete Trigger
DELIMITER //
CREATE TRIGGER after_delete_teacher
AFTER DELETE ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action, timestamp)
    VALUES (OLD.id, 'delete', NOW());
END;
// 
DELIMITER ;

-- testing triggers

-- testing trigger on before_insert_teacher
-- This should raise an error: 'salary cannot be negative'
INSERT INTO teachers (id, name, subject, experience, salary) VALUES
(9, 'Isaac', 'Philosophy', 4, -20000.00);

-- after_insert_teacher
-- Insert a new teacher
INSERT INTO teachers (id, name, subject, experience, salary) VALUES
(10, 'Jasmine', 'Art', 6, 42000.00);

-- Check the teacher_log table for the new entry
SELECT * FROM teacher_log WHERE teacher_id = 10;

-- before_delete_teacher
-- This should raise an error: 'Cannot delete a row with experience greater than 10 years'
DELETE FROM teachers WHERE id = 1;

-- after_delete_teacher
-- Delete a teacher
DELETE FROM teachers WHERE id = 2; -- Bob has 8 years of experience

-- Check the teacher_log table for the new entry
SELECT * FROM teacher_log WHERE teacher_id = 2 AND action = 'delete';



