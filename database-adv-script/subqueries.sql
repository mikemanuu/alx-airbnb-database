--Finds all properties where the average rating is greater than 4.0 using subquery.
SELECT
    Property.PropertyID,
    Property.Name,
    Property.Location,
    Property.Type,
    Property.Price
FROM
    Property
WHERE 
    Property.PropertyID IN (
        SELECT
            BookingID
        FROM 
            Reveiw
        GROUP BY
            BookingID
        HAVING
            AVG(Rating) > 4.0
    );

--Find users who have made more than 3 bookings using a correlated subquery
SELECT
    User.UserID,
    User.Name,
    User.Email
FROM
    User
WHERE 
    (SELECT COUNT(*)
    FROM Booking
    WHERE Booking.UserID = User.UserID) > 3;
