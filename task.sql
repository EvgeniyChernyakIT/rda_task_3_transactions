-- Use our database
USE ShopDB;

-- Some data should be created outside the transaction (here)

-- Insert new order outside the transaction
INSERT INTO Orders (CustomerID, Date)
VALUES (1, '2023-01-01');

-- Get the ID of the last inserted order
SET @order_id = LAST_INSERT_ID();

-- Start the transaction
START TRANSACTION;

-- Add the order item (AwersomeProduct with ID = 1, count = 1)
INSERT INTO OrderItems (OrderID, ProductID, Count)
VALUES (@order_id, 1, 1);

-- Update the product warehouse amount (decrease by 1)
UPDATE Products
SET WarehouseAmount = WarehouseAmount - 1
WHERE ID = 1;

-- Commit the transaction
COMMIT;
