-- Insert data into the User table
INSERT INTO User (Name, Email, Phone, CreatedAt, Role) 
VALUES
('Alice Johnson', 'alice.johnson@yahoo.com', '1234567890', '2024-11-20', 'Guest'),
('Bob Smith', 'bob.smith@gmail.com', '0987654321', '2024-11-01', 'Host'),
('Charlie Adams', 'charlie.adams@outlook.com', '1122334455', '2024-10-01', 'Admin');

-- Insert data into the Property table
INSERT INTO Property (Name, Location, Type, Price, CreatedTime, UpdatedTime) 
VALUES
('Cozy Apartment', 'Downtown Cityville', 'Apartment', 120.00, '2024-11-01 12:12:30'),
('Luxury Villa', 'Seaside Townsville', 'Villa', 350.00 '2024-11-01 12:12:30'),
('Rustic Cabin', 'Mountains Villageville', 'Cabin', 200.00 '2024-11-01 12:12:30');

-- Insert data into the Booking table
INSERT INTO Booking (BookingDate, StartDate, EndDate, TotalCost, UserID, PropertyID) 
VALUES
('2024-11-01', '2024-11-05', '2024-11-10', 600.00, 1, 1),
('2024-11-02', '2024-12-01', '2024-12-15', 5250.00, 2, 2),
('2024-11-03', '2024-11-15', '2024-11-20', 1000.00, 1, 3);

-- Insert data into the Message table
INSERT INTO Message (SentDate, Content, BookingID) 
VALUES
('2024-11-01 14:00:00', 'Hello, is the apartment available for my dates?', 1),
('2024-11-02 15:30:00', 'Yes, it is available.', 1),
('2024-11-03 10:00:00', 'Can I get a discount for a longer stay?', 2);

-- Insert data into the Review table
INSERT INTO Review (Rating, Comment, BookingID) VALUES
(5, 'The apartment was clean and well-equipped. Highly recommend!', 1),
(4, 'Great location, but the Wi-Fi could be faster.', 2);

-- Insert data into the Payment table
INSERT INTO Payment (PaymentDate, Amount, BookingID) VALUES
('2024-11-01', 600.00, 1),
('2024-11-15', 5250.00, 2),
('2024-11-20', 1000.00, 3);