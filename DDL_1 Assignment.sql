# create database
CREATE DATABASE School;
USE School;

# create the student table 
CREATE TABLE STUDENT (
    Roll_No INT PRIMARY KEY,
    Name VARCHAR(50),
    Marks INT,
    Grade CHAR(1)
);
#insert data into the table
INSERT INTO STUDENT (Roll_No, Name, Marks, Grade) VALUES
(1, 'Arun', 87, 'A'),
(2, 'Benny', 74, 'B'),
(3, 'Catherin', 95, 'A'),
(4, 'Diacy', 61, 'C');

# 1. display the student table
SELECT * FROM STUDENT;

# 2. using ALTER command adding a new column to the student table
ALTER TABLE STUDENT ADD Contact VARCHAR(15);

# 3. remove the grade column
ALTER TABLE STUDENT DROP COLUMN Grade;

# 4. rename the table to CLASSTEN
RENAME TABLE STUDENT TO CLASSTEN;

# 5. delete all rows from the table
TRUNCATE TABLE CLASSTEN;
SELECT * FROM CLASSTEN;

#6. remove the table from the database
DROP TABLE CLASSTEN;








