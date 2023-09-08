-- Task 1: Create a procedure that displays the maximum ordered
-- quantity in the orders table
CREATE PROCEDURE GetMaxQuantity()
SELECT MAX(Quantity) AS "Max Quantity in Order"
FROM orders;

-- Task 2: Create a prepared statement GetOrderDetail which will
-- accept one input, the CustomerID from a variable, and should 
-- return the order id, quantity and cost from the orders table
PREPARE GetOrderDetail 
FROM 'SELECT OrderID, Quantity, BillAmount FROM orders WHERE OrderID = ?';

-- Task 3: Create a stored procedure called CancelOrder to delete an
-- order record based on the user input of the order id
DROP PROCEDURE IF EXISTS CancelOrder;
DELIMITER \\
CREATE PROCEDURE CancelOrder(Id INT)
BEGIN
DELETE FROM orders WHERE OrderID=Id;
SELECT CONCAT("Order ", Id," is cancelled") AS Confirmation;
END\\
DELIMITER ;


