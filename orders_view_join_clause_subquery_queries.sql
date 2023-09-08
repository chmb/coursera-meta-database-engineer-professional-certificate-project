-- Task 1: Create virtual table OrdersView
CREATE VIEW OrdersView AS (SELECT OrderID, Quantity, BillAmount
FROM orders WHERE Quantity > 2);

-- Task 2: Create JOIN clause to get data from four tables on all
-- customers with orders that cost more than $150
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

-- Task 3: Create subquery to find all menu items for which more
-- than two orders have been placed
SELECT Cuisine FROM menu WHERE MenuID = ANY (SELECT Menu_MenuID from 
orders WHERE Quantity > 2); 