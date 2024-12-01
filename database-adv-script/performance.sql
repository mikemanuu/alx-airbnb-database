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

--Query with filtering conditions

SELECT b.BookingID, u.Name, p.Name, py.Amount
FROM Booking based
JOIN User u ON b.UserID = u.UserID
JOIN Property P ON b.PropertyID = p.PropertyID
JOIN Payment py ON b.BookingID = py.BookingID
WHERE b.StartDate >= '2024-01-01' AND b.EndDate <= '2024-12-31';

--checking how adding filtering conditions affect query performance

EXPLAIN ANALYZE SELECT b.BookingID, u.Name, p.Name, py.Amount
FROM Booking based
JOIN User u ON b.UserID = u.UserID
JOIN Property P ON b.PropertyID = p.PropertyID
JOIN Payment py ON b.BookingID = py.BookingID
WHERE b.StartDate >= '2024-01-01' AND b.EndDate <= '2024-12-31';