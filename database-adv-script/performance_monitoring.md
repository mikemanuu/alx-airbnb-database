Performance Monitoring and Optimization Report


---

Objective

Continuously monitor database performance, identify bottlenecks, and refine the schema to improve query efficiency.


---

Monitoring Process

1. Tools Used:

EXPLAIN ANALYZE: To analyze query execution plans.

SHOW PROFILE: To monitor query execution details.



2. Frequently Used Queries:

Fetch bookings with user details:

SELECT Booking.BookingID, User.Name, Property.Name, Booking.Start_Date, Booking.End_Date
FROM Booking
INNER JOIN User ON Booking.UserID = User.UserID
INNER JOIN Property ON Booking.PropertyID = Property.PropertyID;

Fetch properties and their reviews:

SELECT Property.PropertyID, Property.Name, Review.Comment
FROM Property
LEFT JOIN Review ON Property.PropertyID = Review.PropertyID;

Fetch users with more than 3 bookings:

SELECT UserID 
FROM Booking 
GROUP BY UserID 
HAVING COUNT(BookingID) > 3;





---

Bottlenecks Identified

1. Query 1: High join cost due to the lack of indexes on foreign keys (UserID, PropertyID).


2. Query 2: Sequential scans on Property and Review tables, causing slow execution for large datasets.


3. Query 3: Full table scan on Booking for aggregation.




---

Changes Suggested

1. Indexing:

Add indexes on foreign key columns to speed up joins.

Example:

CREATE INDEX idx_booking_user ON Booking(UserID);
CREATE INDEX idx_booking_property ON Booking(PropertyID);
CREATE INDEX idx_review_property ON Review(PropertyID);



2. Schema Adjustments:

Denormalize frequently joined tables by creating materialized views for complex queries that are read-heavy.

Example:

CREATE MATERIALIZED VIEW User_Booking_Details AS
SELECT Booking.BookingID, User.Name, Property.Name, Booking.Start_Date, Booking.End_Date
FROM Booking
INNER JOIN User ON Booking.UserID = User.UserID
INNER JOIN Property ON Booking.PropertyID = Property.PropertyID;





---

Improvements Observed


---

Recommendations for Continuous Monitoring

1. Regularly analyze frequently executed queries using tools like EXPLAIN ANALYZE.


2. Monitor database performance metrics to identify patterns of slow queries.


3. Periodically review the schema to identify opportunities for further optimization.


4. Use partitioning or materialized views for read-heavy and large datasets.




---

Conclusion

By adding appropriate indexes and making schema adjustments such as materialized views, query execution times were significantly reduced, improving overall database performance. Continuous monitoring is essential to ensure the database remains optimized as data grows.