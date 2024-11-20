CREATE DATABASE Countrydb;
USE Countrydb;

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
(1, 'John', 'Davis', 1000, 4.5, 1, 'USA'),
(2, 'Alice', 'James', 2000, 4.7, 2, 'Canada'),
(3, 'Bob', 'Marly', 3000, 3.9, 3, 'India'),
(4, 'Emmanual', 'Jones', 1500, 4.8, 4, 'Australia'),
(5, 'Lilly', 'Davis', 2500, 4.6, 5, 'UK'),
(6, 'Sophia', 'Pual', 1200, 4.3, 6, 'Germany'),
(7, 'Mona', 'George', 1800, 3.8, NULL, NULL),
(8, 'Nora', 'White', 2300, 4.9, 8, 'China'),
(9, 'Ryan', 'Smith', 800, 3.5, 9, 'Japan'),
(10, 'Evaan', 'Brown', 400, 3.6, 10, 'Brazil');

SELECT * FROM Persons;
## 1. distinct country names from the Persons table
SELECT DISTINCT Country_name FROM Persons;

## 2.Select first names and last names from the Persons table with aliases
SELECT Fname AS FirstName, Lname AS LastName FROM Persons;

## 3.persons with a rating greater than 4.0
SELECT * FROM Persons WHERE Rating > 4.0;

## 4.Find countries with a population greater than 10 lakhs
SELECT * FROM Country WHERE Population > 1000000;

## 5.Find persons who are from 'USA' or have a rating greater than 4.5
SELECT * FROM Persons WHERE Country_name = 'USA' OR Rating > 4.5;

## 6. find all persons where the country name is null
SELECT * FROM Persons WHERE Country_name IS NULL;

## 7. Find all persons from the countries 'USA', 'Canada', and 'UK'
SELECT * FROM Persons WHERE Country_name IN ('USA', 'Canada', 'UK');

## 8.Find all persons not from the countries 'India' and 'Australia
SELECT * FROM Persons WHERE Country_name NOT IN ('India', 'Australia');

## 9.Find all countries with a population between 5 lakhs and 20 lakhs
SELECT * FROM Country WHERE Population BETWEEN 500000 AND 2000000;

## 10.Find all countries whose names do not start with 'C'
SELECT * FROM Country WHERE Country_name NOT LIKE 'C%';