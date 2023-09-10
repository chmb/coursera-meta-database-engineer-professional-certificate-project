DROP PROCEDURE IF EXISTS AddBooking;
DELIMITER //
CREATE PROCEDURE AddBooking(Booking_Slot DATETIME, Table_Number INT, Customer_Id INT)
BEGIN
INSERT INTO bookings (BookingSlot,TableNo,Customers_CustomerID)
VALUES(Booking_Slot, Table_Number, Customer_Id);
SELECT 'New booking added' AS 'Confirmation';
END //
DELIMITER ;