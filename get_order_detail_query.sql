PREPARE GetOrderDetail 
FROM 'SELECT OrderID, Quantity, BillAmount FROM orders WHERE OrderID = ?';