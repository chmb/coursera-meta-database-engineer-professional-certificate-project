-- Task 1: Create a procedure AddBooking to add a new Booking
DROP PROCEDURE IF EXISTS AddBooking;
DELIMITER //
CREATE PROCEDURE AddBooking(Booking_Slot DATETIME, Table_Number INT, Customer_Id INT)
BEGIN
INSERT INTO bookings (BookingSlot,TableNo,Customers_CustomerID)
VALUES(Booking_Slot, Table_Number, Customer_Id);
SELECT 'New booking added' AS 'Confirmation';
END //
DELIMITER ;

-- Task 2: Create a procedure UpdateBooking to update bookings in the table
DROP PROCEDURE IF EXISTS UpdateBooking;
DELIMITER //
CREATE PROCEDURE UpdateBooking(Booking_Id INT, Booking_Slot DATETIME)
BEGIN
UPDATE bookings SET BookingSlot = Booking_Slot
WHERE BookingID = Booking_Id;
SELECT CONCAT('Booking ', Booking_Id, ' updated') AS 'Confirmation';
END //
DELIMITER ;

-- Task 3: Create a procedure CancelBooking to remove a booking
DROP PROCEDURE IF EXISTS CancelBooking;
DELIMITER //
CREATE PROCEDURE CancelBooking(Booking_Id INT)
BEGIN
DELETE FROM bookings WHERE BookingID = Booking_Id;
SELECT CONCAT('Booking ', booking_id, ' cancelled') AS 'Confirmation';
END //
DELIMITER ;