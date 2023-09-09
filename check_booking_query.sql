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