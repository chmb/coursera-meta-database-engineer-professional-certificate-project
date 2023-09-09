DROP PROCEDURE IF EXISTS CancelBooking;
DELIMITER //
CREATE PROCEDURE CancelBooking(Booking_Id INT)
BEGIN
DELETE FROM bookings WHERE BookingID = Booking_Id;
SELECT CONCAT('Booking ', booking_id, ' cancelled') AS 'Confirmation';
END //
DELIMITER ;