--Initial query to retriev all bookings along with user details, property details and payment details.
SELECT
    Booking.BookingID,
    Booking.BookingDate,
    User.UserID,
    User.Name,
    Property.PropertyID,
    Property.PropertyName,
    Payment.PaymentID,
    Payment.Amount,
    Payment.PaymentDate
FROM
    Booking
JOIN
    User ON Booking.UserID = User.UserID
JOIN
    Property ON Booking.PropertyID = Property.PropertyID
JOIN
    Payment ON Booking.BookingID = Payment.BookingID;