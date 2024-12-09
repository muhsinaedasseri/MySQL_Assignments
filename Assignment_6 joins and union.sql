#CREATE DATA BASE
CREATE DATABASE Countryperdb;
USE Countryperdb;

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

SELECT * FROM Persons;
## 1. a)Inner Join
SELECT Country.Id, Country.Country_name, Persons.Fname, Persons.Lname
FROM Country
INNER JOIN Persons
ON Country.Id = Persons.Country_Id;

## 1. b) Left join
SELECT Country.Id, Country.Country_name, Persons.Fname, Persons.Lname
FROM Country
LEFT JOIN Persons
ON Country.Id = Persons.Country_Id;


##1.c) right join
SELECT Country.Id, Country.Country_name, Persons.Fname, Persons.Lname
FROM Country
RIGHT JOIN Persons
ON Country.Id = Persons.Country_Id;

## 2. All Distinct Country Names
SELECT DISTINCT Country_name FROM Country
UNION
SELECT DISTINCT Country_name FROM Persons;

##3. All Country Names Including Duplicates
SELECT Country_name FROM Country
UNION ALL
SELECT Country_name FROM Persons;

##4. Round Ratings of All Persons to the Nearest Integer
SELECT Id, Fname, Lname, Population, ROUND(Rating) AS RoundedRating,
Country_Id, Country_name
FROM Persons;

