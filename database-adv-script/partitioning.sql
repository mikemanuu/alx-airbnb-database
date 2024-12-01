--Step 1: Creating parent table for partitioning
CREATE TABLE Booking(
    BookingID INT NOT NULL,
    UserID INT NOT NULL,
    PropertyID INT NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    PRIMARY KEY (BookingID, StartDate)
) PARTITION BY RANGE(StartDate);

--Step 2: Creating partitions based on date ranges.
CREATE TABLE Booking_2024_Q1
PARTITION OF Booking 
    FOR VALUES FROM 
('2024-01-01') TO 
('2024-04-01');

CREATE TABLE Booking_2024_Q2
PARTITION OF Booking
    FOR VALUES FROM 
('2024-04-01') TO
('2024-07-01')

CREATE TABLE Booking_2024_Q3
PARTITION OF Booking
    FOR VALUES FROM 
('2024-07-01') TO 
('2024-10-01');

CREATE TABLE Booking_2024_Q4
PARTITION OF Booking
    FOR VALUES 
('2024-10-01') TO 
('2025-01-01');

--Step 3: Indexing on paritions for faster queries
CREATE INDEX idx_booking_user_id_2024_Q1 ON Booking_2024_Q1(UserID);
CREATE INDEX idx_booking_user_id_2024_Q2 ON Booking_2024_Q2(UserID);
CREATE INDEX idx_booking_user_id_2024_Q3 ON Booking_2024_Q3(UserID);
CREATE INDEX idx_booking_user_id_2024_Q4 ON Booking_2024_Q4(UserID);