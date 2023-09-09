SELECT Cuisine FROM menu WHERE MenuID = ANY (SELECT Menu_MenuID from 
orders WHERE Quantity > 2); 