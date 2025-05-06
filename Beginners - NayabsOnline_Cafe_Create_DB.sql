-- Step 1: Create a new database (schema)
CREATE DATABASE NayabsOnline_Cafe;
-- Step 2: Select this database to work in
USE NayabsOnline_Cafe;
-- Step 3: Create customers table
CREATE TABLE Customer (
    Customer_ID INT PRIMARY KEY AUTO_INCREMENT,
    First_Name VARCHAR(20) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(15) NOT NULL,
    Address TEXT NOT NULL
);
-- Insert data without specifying Customer_ID
INSERT INTO Customer (First_Name, Last_Name, Email, Phone, Address)
VALUES 
    ('Nayab', 'Awan', 'nayab.awan@gmail.com', '03454024020', 'Lahore Pakistan'),
    ('Nisa', 'Malik', 'nisa.malilk@gmail.com', '03480233456', 'Islamabad Pakistan'),
    ('Munazza', 'Sheikh', 'munazza.sheikh@gmail.com', '03347778864', 'Sheikhupura Pakistan'),
    ('Ahsan', 'Butt', 'Ahsan.Butt@gmail.com', '03215421232', 'Karachi Pakistan'),
    ('Asma', 'Amy', 'Asma.Amy@gmail.com', '03302262922', 'Okara Pakistan')
    ;
CREATE TABLE Products (
	PRODUCT_ID INT PRIMARY KEY AUTO_INCREMENT,
    PRODUCT_NAME VARCHAR(100) NOT NULL,
    DESCRIPTION TEXT,
    PRICE DECIMAL(10,2) NOT NULL,
    STOCKQUANTITY INT DEFAULT 0,
    CATAGORY VARCHAR(100) NOT NULL
);
-- Insert data without specifying PRODUCT_ID
INSERT INTO Products (PRODUCT_NAME, DESCRIPTION, PRICE, STOCKQUANTITY, CATAGORY)
VALUES
	('Classic Cappuccino', 'Freshly brewed espresso with steamed milk foam', 450.50, 30, 'Beverage'),
    ('Iced Caramel Latte', 'Chilled coffee with caramel syrup & milk', 520.50, 25, 'Beverage'),
	('Belgian Waffle', 'Warm waffle topped with berries and maple syrup', 600.50, 15, 'Dessert'),
    ('Choco Lava Cake', 'Molten chocolate cake served warm with ice cream', 750, 10, 'Dessert'),
    ('Chicken Panini', 'Grilled sandwich with chicken, cheese & sauces', 680, 20, 'Meal'),
    ('Fries with Cheese', 'Crispy fries topped with melted cheese', 350, 40, 'Snack')
;
--  to fix the spellings 
ALTER TABLE Products
CHANGE CATAGORY CATEGORY VARCHAR(100) NOT NULL;
-- Create Orders table
CREATE TABLE Orders (
	ORDER_ID INT PRIMARY KEY auto_increment,
    CUSTOMER_ID VARCHAR(50),
    ORDER_DATE DATETIME DEFAULT CURRENT_TIMESTAMP,
    STATUS VARCHAR(100)
);
-- Insert data without specifying PRODUCT_ID
INSERT INTO Orders (CUSTOMER_ID, ORDER_DATE, STATUS)
VALUES 
    (1, '2025-05-06 10:00:00', 'Pending'),
    (2, '2025-05-06 11:15:00', 'Shipped'),
    (3, '2025-05-06 12:30:00', 'Delivered')
;
-- Create OrderItems Table
CREATE TABLE OrderItems (
	OrderItemID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    UnitPrice DECIMAL(10,2)
);
-- Insert data without specifying OrderItemID
INSERT INTO OrderItems (OrderID, ProductID, Quantity, UnitPrice)
VALUES 
    (1, 1, 2, 450.50),  -- 2 Classic Cappuccinos for Order 1
    (1, 3, 1, 600.50),  -- 1 Belgian Waffle for Order 1
    (2, 2, 3, 520.50),  -- 3 Iced Caramel Lattes for Order 2
    (3, 4, 1, 750.00),  -- 1 Choco Lava Cake for Order 3
    (4, 5, 2, 680.00);  -- 2 Chicken Paninis for Order 4