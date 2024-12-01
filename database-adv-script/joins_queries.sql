--Retrieves all bookingd and respective users who made those bookings (INNER JOIN)

SELECT
    Booking.BookingID,
    Booking.BookingDate,
    Booking.StartDate,
    Booking.EndDate
    Booking.TotalCost,
    User.UserID,
    User.Name AS UserName,
    user.Email
FROM
    Booking
INNER JOIN
    User
ON
    Booking.UserID = User.UserID;


--Retrieves all properties and their reviews including properties without reviews (LEFT JOIN)

SELECT
    Property.PropertyID,
    Property.Name AS PropertyName,
    Property.Location,
    Property.Type,
    Property.Price,
    Reveiw.ReveiwID,
    Reveiw.Rating,
    Reveiw.Comment
FROM
    Property
LEFT JOIN
    Reveiw
ON
    Property.PropertyID = Reveiw.BookingID;

--Retrieves all users and all bookings, even if the user has no booking or a booking is noy linked to a user (FULL OUTER JOIN)

SELECT
    User.UserID,
    User.Name AS UserName,
    User.Email,
    Booking.BookingID,
    Booking.BookingDate,
    Booking.StartDate,
    Booking.EndDate,
    Booking.TotalCost
FROM
    User
FULL OUTER JOIN
    Booking
ON
    User.UserID = Booking.UserID;