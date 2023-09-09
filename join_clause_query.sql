SELECT customers.CustomerID, customers.FirstName, customers.LastName,
orders.OrderID, orders.BillAmount, menu.Cuisine, menuitems.Course
FROM orders 
INNER JOIN customers
ON orders.Customers_CustomerID = customers.CustomerID
INNER JOIN menu
ON orders.Menu_MenuID = menu.MenuID
INNER JOIN menuitems
ON menu.MenuItems_MenuItemID = menuitems.MenuItemID
WHERE orders.BillAmount > 150
ORDER BY orders.BillAmount;