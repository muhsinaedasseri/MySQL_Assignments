CREATE DATABASE Functiondb;
USE Functiondb;

## create the country table
CREATE TABLE Country (
    Id INT PRIMARY KEY,
    Country_name VARCHAR(50),
    Population INT,
    Area INT
);
SELECT * FROM Country;

## Create the Persons table
CREATE TABLE Persons (
    Id INT PRIMARY KEY,
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    Population INT,
    Rating FLOAT,
    Country_Id INT,
    Country_name VARCHAR(50),
    FOREIGN KEY (Country_Id) REFERENCES Country(Id)
);

## Insert data into Country
INSERT INTO Country (Id, Country_name, Population, Area)
VALUES 
(1, 'USA', 331002651, 9833520),
(2, 'Canada', 37742154, 9984670),
(3, 'India', 1380004385, 3287263),
(4, 'Australia', 25499884, 7692024),
(5, 'UK', 1500000, 243610),
(6, 'Germany', 83783942, 357022),
(7, 'France', 65273511, 551695),
(8, 'China', 1439323776, 9596961),
(9, 'Japan', 126476461, 377975),
(10, 'Brazil', 212559417, 8515767);

SELECT * FROM Country;
## Insert data into Persons
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name)
VALUES
(1, 'John', 'Davis', 1000000, 4.5, 1, 'USA'),
(2, 'Alice', 'James', 2000000, 4.7, 2, 'Canada'),
(3, 'Bob', 'Marly', 3000000, 3.9, 3, 'India'),
(4, 'Emmanual', 'Jones', 1500000, 4.8, 4, 'Australia'),
(5, 'Lilly', 'Davis', 250000, 4.6, 5, 'UK'),
(6, 'Sophia', 'Pual', 1200000, 4.3, 6, 'Germany'),
(7, 'Mona', 'George', 1800000, 3.8, 4, 'Australia'),
(8, 'Nora', 'White', 2300000, 4.9, 8, 'China'),
(9, 'Ryan', 'Smith', 800000, 3.5, 7, 'France'),
(10, 'Evaan', 'Brown', 40000, 3.6, 10, 'Brazil');

## 1. Add new column to persons table
ALTER TABLE Persons ADD COLUMN DOB DATE;

UPDATE Persons SET DOB = '1990-05-25' WHERE Id = 1;
UPDATE Persons SET DOB = '1985-11-13' WHERE Id = 2;
UPDATE Persons SET DOB = '1992-07-18' WHERE Id = 3;
UPDATE Persons SET DOB = '1988-02-22' WHERE Id = 4;
UPDATE Persons SET DOB = '1994-09-30' WHERE Id = 5;
UPDATE Persons SET DOB = '1991-03-15' WHERE Id = 6;
UPDATE Persons SET DOB = '1987-01-05' WHERE Id = 7;
UPDATE Persons SET DOB = '1995-06-08' WHERE Id = 8;
UPDATE Persons SET DOB = '1993-12-19' WHERE Id = 9;
UPDATE Persons SET DOB = '1990-04-10' WHERE Id = 10;


## 2. Create a user-defined function to calculate age using DOB
DELIMITER //

CREATE FUNCTION CalculateAge(DOB DATE)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE age INT;
    SET age = TIMESTAMPDIFF(YEAR, DOB, CURDATE());
    RETURN age;
END;
//

DELIMITER ;

## 3.Write a Select Query to Fetch the Age of All Persons Using the Function
SELECT Fname, Lname, DOB, CalculateAge(DOB) AS Age
FROM Persons;

## 4.Find the Length of Each Country Name in the Country Table

SELECT Country_name, LENGTH(Country_name) AS NameLength
FROM Country;

## 5.Extract the First Three Characters of Each Country's Name in the Country Table

SELECT Country_name, LEFT(Country_name, 3) AS FirstThreeChars
FROM Country;

## 6.Convert All Country Names to Uppercase and Lowercase in the Country Table
##Uppercase

SELECT Country_name, UPPER(Country_name) AS UppercaseName
FROM Country;

## Lower case

SELECT Country_name, LOWER(Country_name) AS LowercaseName
FROM Country;

## upper and lower case

SELECT Country_name, UPPER(Country_name) AS UpperCaseName, LOWER(Country_name) 
AS LowerCaseName
FROM Country;


