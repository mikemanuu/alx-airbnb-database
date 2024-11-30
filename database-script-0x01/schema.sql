-- Create User Table
CREATE TABLE User (
    User ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Phone VARCHAR(15),
    Role ENUM('Admin', 'Host', 'Guest'), NOT NULL DEFAULT 'Guest'
    CreatedAt DATE NOT NULL
);

--Create Property Table
CREATE TABLE Property (
    PropertyID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Location VARCHAR(100) NOT NULL,
    Type VARCHAR(100)
    Price DECIMAL(10, 2) NOT NULL,
    CreatedTime DATETIME NOT NULL,
    UpdatedTime DATETIME NOT NULL
);

--Create Booking Table
CREATE TABLE Booking (
    BookingID INT AUTO_INCREMENT PRIMARY KEY,
    BookingDate DATE NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    TotalCost DECIMAL(10, 2),
    UserID INT NOT NULL,
    PropertyID INT NOT NULL,
    FOREIGN KEY(UserID) REFERENCES User(UserID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(PropertyID) REFERENCES Property(PropertyID) ON DELETE CASCADE ON UPDATE CASCADE,
);

--Create Message Table
CREATE TABLE Message (
    MessageID INT AUTO_INCREMENT PRIMARY KEY,
    SentDate DATETIME NOT NULL,
    Content TEXT NOT NULL,
    BookingID INT NOT NULL,
    FOREIGN KEY (BookingID) REFERENCES Booking(BookingID) ON DELETE CASCADE ON UPDATE CASCADE
);

--Create Reveiw Table
CREATE TABLE Reveiw (
    ReveiwID INT AUTO_INCREMENT PRIMARY KEY,
    Rating INT NOT NULL CHECK(Rating BETWEEN 1 AND 5),
    Comment TEXT,
    BookingID INT NOT NULL,
    FOREIGN KEY (BookingID) REFERENCES Booking(BookingID) ON DELETE CASCADE ON UPDATE CASCADE
);

--Create Payment Table
CREATE TABLE Payment (
    PaymentID INT AUTO_INCREMENT PRIMARY KEY,
    PaymentDate DATE NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (BookingID) REFERENCES Booking(BookingID) ON DELETE CASCADE ON UPDATE CASCADE
);

--Create Indexes for Optimal Performance
CREATE INDEX inx_user_email ON User(Email);
CREATE INDEX inx_property_description ON Property(Description);
CREATE INDEX inx_booking_dates ON Booking(StartDate, EndDate);
CREATE INDEX inx_message_sentdate ON Message(SentDate);
CREATE INDEX inx_review_rating ON Reveiw(Rating);