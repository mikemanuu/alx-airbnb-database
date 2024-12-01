--Find total number of bookings made by each user
--Uses COUNT function with GROUP BY clause to calculate total number of bookings made by each user.
SELECT
User.UserID,
User.Name AS UserName,
COUNT(Booking.BookingID) AS TotalBookings
FROM
    User
LEFT JOIN 
    Booking
ON 
    User.UserID = Booking.UserID
GROUP BY
    User.UserID,
    User.Name;

--Rank properties based on the total number of bookings.
--Uses RANK window function to rank properties by the total number of bookings they have received.
SELECT
    Property.PropertyID,
    Property.Name AS PropertyName,
    COUNT(Booking.BookingID) AS TotalBookings,
    RANK() OVER (ORDER BY COUNT(Booking.BookingID) DESC)
AS Rank
FROM
    Property
LEFT JOIN
    Booking
ON
    Property.PropertyID = Booking.PropertyID
GROUP BY
    Property.PropertyID,
    Property.Name;

--Rank properties based on the total number of bookings.
--Uses ROW_NUMBER window function to rank properties by the total number of bookings they have received.
SELECT
    Property.PropertyID,
    Property.Name AS PropertyName,
    COUNT(Booking.BookingID) AS TotalBookings,
    ROW_NUMBER() OVER (ORDER BY COUNT(Booking.BookingID) DESC)
AS Rank
FROM
    Property
LEFT JOIN
    Booking
ON
    Property.PropertyID = Booking.PropertyID
GROUP BY
    Property.PropertyID,
    Property.Name;