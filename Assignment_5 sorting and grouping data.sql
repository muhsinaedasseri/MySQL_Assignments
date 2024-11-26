#CREATE DATA BASE
CREATE DATABASE Statedb;
USE Statedb;

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

## 1.Print the first three characters of Country_name
SELECT LEFT(Country_name, 3) AS FirstThreeChars FROM Country;

## 2.Concatenate Fname and Lname
SELECT CONCAT(Fname, ' ', Lname) AS FullName FROM Persons;

## 3.Count unique Country_name in Persons
SELECT COUNT(DISTINCT Country_name) AS UniqueCountries FROM Persons;

## 4.Print the maximum population from Country
SELECT MAX(Population) AS MaxPopulation FROM Country;

## 5.Print the minimum population from Persons
SELECT MIN(Population) AS MinPopulation FROM Persons;



## 6. Insert 2 rows with Lname as NULL and count Lname
INSERT INTO Persons (Id,Fname, Lname, Population, Rating, Country_Id, Country_name)
VALUES (11,'Alice', NULL, 400000, 3.6, 7, 'France'), 
       (12,'Bob', NULL, 500000, 3.4, 7, 'France');

SELECT COUNT(Lname) AS CountLname FROM Persons;

## 7.Find the number of rows in Persons
SELECT COUNT(*) AS TotalRows FROM Persons;

##8.Show the population of the first 3 rows in Country
SELECT Population FROM Country LIMIT 3;

## 9.Print 3 random rows of countries
SELECT * FROM Country ORDER BY RAND() LIMIT 3;

## 10.List all persons ordered by Rating in descending order:
SELECT * FROM Persons ORDER BY Rating DESC;

## 11.Find the total population for each country in Persons
SELECT Country_name, SUM(Population) AS TotalPopulation FROM Persons GROUP BY Country_name;

## 12. Find countries in Persons with a total population > 50,000
SELECT Country_name, SUM(Population) AS TotalPopulation
FROM Persons
GROUP BY Country_name
HAVING SUM(Population) > 50000;

## 13.List total persons and average rating for each country with > 2 persons
SELECT Country_name, COUNT(*) AS TotalPersons, AVG(Rating) AS AvgRating
FROM Persons
GROUP BY Country_name
HAVING COUNT(*) > 2
ORDER BY AvgRating ASC;









