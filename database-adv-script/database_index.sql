--Index on UserID for UserTable
CREATE INDEX idx_user_id ON User(UserID);

--Index on BookingID for Booking table
CREATE INDEX idx_booking_id ON Booking(BookingID);

--Index on UserID in Booking table
CREATE INDEX idx_booking_user_id ON Booking(UserID);

--Index on PropertyID in Booking table
CREATE INDEX idx_booking_property_id ON Booking(PropertyID);

--Index on PropertyID for Property table
CREATE INDEX idx_property_id ON Property(PropertyID);