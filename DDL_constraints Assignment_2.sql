#1. create new database Sales
CREATE DATABASE Sales;
USE Sales;
# 2.creating the Orders Table
CREATE TABLE Orders (
    Order_Id INT PRIMARY KEY, -- Primary Key Constraint
    Customer_name VARCHAR(50) NOT NULL, -- Not Null Constraint
    Product_Category VARCHAR(50) NOT NULL,
    Ordered_item VARCHAR(50) NOT NULL,
    Contact_No VARCHAR(15) UNIQUE -- Unique Constraint
);
SELECT * FROM Orders;
# 3.Add a new column order_quantity to order table
ALTER TABLE Orders ADD order_quantity INT;

#4. Rename the orders table to Sales_orders
RENAME TABLE Orders TO sales_orders;


# 5.Insert 10 rows of data into the sales_orders table
INSERT INTO sales_orders (Order_Id, Customer_name, Product_Category, Ordered_item, Contact_No, order_quantity) VALUES
(1, 'Alex', 'Clothing', 'Trousers', '3214567892', 1),
(2, 'Benny', 'Furniture', 'Table', '4325678900', 4),
(3, 'Catherin', 'Electronics', 'earphone', '5436789012', 2),
(4, 'Daicy', 'Appliances', 'mixer grinder', '7654890123', 1),
(5, 'Esther', 'Clothing', 'Jacket', '8765901234', 3),
(6, 'Freddy', 'Clothing', 'Shoes', '9876012345', 2),
(7, 'Gracy', 'Electronics', 'Tablet', '0987123456', 1),
(8, 'Hassan', 'Furniture', 'Table', '5432234567', 2),
(9, 'Isha', 'Appliances', 'Washing Machine', '4512345678', 1),
(10, 'Jojy', 'Clothing', 'T-shirt', '2223456789', 5);
SELECT * FROM sales_orders;
# 6.Retrieve the Customer_name and Ordered_item from the sales_orders table
SELECT Customer_name, Ordered_item FROM sales_orders;

# 7.Update the product name for a specific row change the product_category of product_Id 2
UPDATE sales_orders
SET Product_Category = 'Home Decor'
WHERE Order_Id = 2;
SELECT * FROM sales_orders;
# 8.Delete the sales_orders table from the Sales database
DROP TABLE sales_orders;
