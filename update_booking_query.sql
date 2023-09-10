DROP PROCEDURE IF EXISTS UpdateBooking;
DELIMITER //
CREATE PROCEDURE UpdateBooking(Booking_Id INT, Booking_Slot DATETIME)
BEGIN
UPDATE bookings SET BookingSlot = Booking_Slot
WHERE BookingID = Booking_Id;
END //
DELIMITER ;