-- Task 1: Populate booking records with some data
INSERT INTO bookings (BookingSlot, TableNo, Customers_CustomerID)
VALUES 
("2022-10-10", 5, 1),
("2022-11-12", 3, 3),
("2022-10-11", 2, 2),
("2022-10-13", 2, 1);

-- Task 2: Create a stored procedure CheckBookings to check whether a 
-- table is already booked
DROP PROCEDURE IF EXISTS CheckBooking;
DELIMITER //
CREATE PROCEDURE CheckBooking(Booking_Slot DATETIME, Table_number INT)
BEGIN
SELECT CONCAT('Table ', Table_number, ' is already booked') AS 'Booking status'
FROM bookings
WHERE BookingSlot = Booking_Slot 
AND TableNo = Table_number;
END //
DELIMITER ;

-- Task 3: Create a procedure AddValidBooking that uses a transaction to perform
-- a rollback if a customer reserves a table that is already booked under another name
DROP PROCEDURE IF EXISTS AddValidBooking;
DELIMITER //
CREATE PROCEDURE AddValidBooking(Booking_Slot DATETIME, Table_Number INT, Customer_Id INT)
BEGIN
START TRANSACTION;
SELECT 1 AS 'Booking status' 
FROM bookings 
WHERE BookingSlot = Booking_Slot
AND TableNo = Table_Number
LIMIT 1
INTO @bookstatus;
IF @bookstatus = 1 THEN
ROLLBACK;
SELECT CONCAT('Table ', Table_Number, ' is already booked - cancelled') AS 'Booking status';
ELSE
INSERT INTO bookings (BookingSlot, TableNo, Customers_CustomerID) VALUES 
(Booking_Slot, Table_Number, Customer_Id);
COMMIT;
SELECT CONCAT('Table ', table_number, ' has been booked successfully') AS 'Booking status';
END IF;
END //
DELIMITER ;