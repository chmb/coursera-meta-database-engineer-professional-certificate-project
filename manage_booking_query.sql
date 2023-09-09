DROP PROCEDURE IF EXISTS ManageBooking;
DELIMITER //
CREATE PROCEDURE ManageBooking(Booking_Slot DATETIME, Table_Number INT, Customer_Id INT)
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