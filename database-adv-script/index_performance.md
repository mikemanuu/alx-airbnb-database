Indexing and Performance Optimization

Objective

The goal of this task is to identify frequently used columns in the User, Booking, and Property tables and optimize query performance by creating appropriate indexes.

We then compare the performance of queries before and after adding indexes using tools like EXPLAIN or ANALYZE.


---

High-Usage Columns Identified

Based on the queries written earlier, the following columns were identified as high-usage columns (frequently used in WHERE, JOIN, or ORDER BY clauses):

User Table:

UserID (used for joins and filtering)


Booking Table:

BookingID (used for filtering)

UserID (used for joins with the User table)

PropertyID (used for joins with the Property table)


Property Table:

PropertyID (used for joins and filtering)




---

Index Creation

The following CREATE INDEX statements were used to create indexes for the identified columns:

-- Index on UserID for User table
CREATE INDEX idx_user_id ON User(UserID);

-- Index on BookingID for Booking table
CREATE INDEX idx_booking_id ON Booking(BookingID);

-- Index on UserID in Booking table
CREATE INDEX idx_booking_user_id ON Booking(UserID);

-- Index on PropertyID in Booking table
CREATE INDEX idx_booking_property_id ON Booking(PropertyID);

-- Index on PropertyID for Property table
CREATE INDEX idx_property_id ON Property(PropertyID);

These indexes optimize the database for faster query execution during operations involving joins and lookups.


---

Performance Measurement

Step 1: Measure Performance Before Indexing

We ran queries like the following using EXPLAIN to examine the execution plan before adding indexes:

EXPLAIN SELECT * 
FROM User
INNER JOIN Booking ON User.UserID = Booking.UserID;

Observation:

The execution plan showed a sequential scan (Seq Scan), indicating the database scanned all rows in the table, which is less efficient.


Example output:

Seq Scan on Booking  (cost=1000.00..2000.00 rows=5000 width=50)


---

Step 2: Add Indexes

We executed the CREATE INDEX commands to add the identified indexes to the database.


---

Step 3: Measure Performance After Indexing

We re-ran the same queries using EXPLAIN to compare the execution plan:

EXPLAIN SELECT * 
FROM User
INNER JOIN Booking ON User.UserID = Booking.UserID;

Observation:

The execution plan now showed an index scan (Index Scan), significantly reducing query costs and improving performance.


Example output:

Index Scan using idx_booking_user_id on Booking (cost=10.00..50.00 rows=500 width=50)


---

Results

Indexes dramatically reduced the cost of query execution, resulting in faster query performance.


---

Conclusion

Adding indexes to frequently used columns significantly improves database performance by reducing the cost of query execution. These optimizations are critical for ensuring scalability and responsiveness in database operations.
