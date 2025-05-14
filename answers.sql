-- Question 1--
-- Create a normalized table
CREATE TABLE OrderDetails_1NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(100)
);

-- Insert data by splitting the Products column
-- For Order 101
INSERT INTO OrderDetails_1NF VALUES (101, 'John Doe', 'Laptop');
INSERT INTO OrderDetails_1NF VALUES (101, 'John Doe', 'Mouse');

-- For Order 102
INSERT INTO OrderDetails_1NF VALUES (102, 'Jane Smith', 'Tablet');
INSERT INTO OrderDetails_1NF VALUES (102, 'Jane Smith', 'Keyboard');
INSERT INTO OrderDetails_1NF VALUES (102, 'Jane Smith', 'Mouse');

-- For Order 103
INSERT INTO OrderDetails_1NF VALUES (103, 'Emily Clark', 'Phone');

-- Question 2 --
-- Create Orders table (order header information)
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- Create OrderItems table (order line items)
CREATE TABLE OrderItems (
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- First insert distinct orders into Orders table
INSERT INTO Orders (OrderID, CustomerName)
SELECT DISTINCT OrderID, CustomerName
FROM OrderDetails;

-- Then insert all products into OrderItems table
INSERT INTO OrderItems (OrderID, Product, Quantity)
SELECT OrderID, Product, Quantity
FROM OrderDetails;