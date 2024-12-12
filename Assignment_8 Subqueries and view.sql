CREATE DATABASE Populationdb;
USE Populationdb;

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
(5, 'Lilly', 'Davis', 250000, 4.5, 5, 'UK'),
(6, 'Sophia', 'Pual', 1200000, 4.3, 6, 'Germany'),
(7, 'Mona', 'George', 1800000, 3.8, 4, 'Australia'),
(8, 'Nora', 'White', 2300000, 4.9, 8, 'China'),
(9, 'Ryan', 'Smith', 800000, 3.5, 7, 'France'),
(10, 'Evaan', 'Brown', 40000, 3.6, 10, 'Brazil');
## 1. Find the number of persons in each country

SELECT Country_name, COUNT(*) AS Num_Persons
FROM Persons
GROUP BY Country_name;

## 2. Find the number of persons in each country sorted from high to low
SELECT Country_name, COUNT(*) AS Num_Persons
FROM Persons
GROUP BY Country_name
ORDER BY Num_Persons DESC;

## 3. Find out the average rating for persons in respective countries
## if the average is greater than 3.0:

SELECT Country_name, AVG(Rating) AS AverageRating
FROM Persons
GROUP BY Country_name
HAVING AVG(Rating) > 3.0;

## 4. Find the countries with the same rating as the USA

SELECT Country_name
FROM Persons
WHERE Rating = (SELECT Rating FROM Persons WHERE Country_name = 'USA');

SELECT Country_name
FROM Persons
WHERE Country_name != 'USA' AND Rating IN (
    SELECT Rating
    FROM Persons
    WHERE Country_name = 'USA'
);

## 5. Select all countries whose population is 
##greater than the average population of all nations

SELECT Country_name
FROM Country
WHERE Population > (SELECT AVG(Population) FROM Country);

## Creating data base
CREATE DATABASE  Product;
USE Product;

##Creating table 
CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    First_name VARCHAR(100),
    Last_name VARCHAR(100),
    Email VARCHAR(100),
    Phone_no VARCHAR(15),
    Address VARCHAR(255),
    City VARCHAR(100),
    State VARCHAR(100),
    Zip_code VARCHAR(10),
    Country VARCHAR(100)
);

## Insert data into Customer table
INSERT INTO Customer (Customer_Id, First_name, Last_name, Email, Phone_no, Address, City, State, Zip_code, Country)
VALUES
(1, 'John', 'Doe', 'john.doe@example.com', '555-1234', '123 Elm St', 'New York', 'New York', '10001', 'USA'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '555-5678', '456 Oak St', 'Los Angeles', 'California', '90001', 'USA'),
(3, 'Michael', 'Johnson', 'michael.johnson@example.com', '555-8765', '789 Pine St', 'Chicago', 'Texas', '60601', 'USA'),
(4, 'Emily', 'Davis', 'emily.davis@example.com', '555-4321', '321 Maple St', 'Houston', 'Texas', '77001', 'USA'),
(5, 'William', 'Brown', 'william.brown@example.com', '555-7890', '654 Cedar St', 'Phoenix', 'Arizona', '85001', 'USA'),
(6, 'Olivia', 'Wilson', 'olivia.wilson@example.com', '555-3456', '987 Spruce St', 'Philadelphia', 'Pennsylvania', '19101', 'USA'),
(7, 'Liam', 'Garcia', 'liam.garcia@example.com', '555-0123', '258 Birch St', 'San Antonio', 'Texas', '78201', 'USA'),
(8, 'Ava', 'Martinez', 'ava.martinez@example.com', '555-0987', '369 Walnut St', 'San Diego', 'Texas', '92101', 'USA'),
(9, 'Noah', 'Rodriguez', 'noah.rodriguez@example.com', '555-6543', '147 Fir St', 'Dallas', 'Texas', '75201', 'USA'),
(10, 'Sophia', 'Hernandez', 'sophia.hernandez@example.com', '555-3210', '951 Redwood St', 'San Jose', 'Texas', '95101', 'USA');

## 1. Create a view named customer_info for the Customer table
CREATE VIEW customer_info AS
SELECT CONCAT(First_name, ' ', Last_name) AS Full_name, Email
FROM Customer;

SELECT * FROM customer_info;

## 2. Create a view named US_Customers that displays customers located in the US
CREATE VIEW US_Customers AS
SELECT * FROM Customer
WHERE Country = 'USA';

SELECT * FROM US_Customers;

##Create another view named Customer_details
CREATE VIEW Customer_details AS
SELECT CONCAT(First_name, ' ', Last_name) AS Full_name, Email, Phone_no, State
FROM Customer;

SELECT * FROM Customer_details;

## 4. Update phone numbers of customers who live in California for Customer_details view



SELECT Customer_Id FROM Customer WHERE State ='California';

UPDATE Customer 
SET Phone_no = '555-4567' 
WHERE State = 'California' AND customer_id = 2;


SELECT * FROM Customer_details
WHERE State = 'California';

## 5. Count the number of customers in each state and show only 
##states with more than 5 customers:

SELECT State, COUNT(*) AS NumberOfCustomers
FROM Customer
GROUP BY State
HAVING COUNT(*) > 5;

## 6.Write a query that will return the number of customers in each state,
## based on the state column in the customer_details view:
SELECT State, COUNT(*) AS NumberOfCustomers
FROM Customer_details
GROUP BY State;

## 7. query that returns all the columns from the customer_details view,
## sorted by the state column in ascending order:
SELECT * FROM Customer_details
ORDER BY State ASC;
