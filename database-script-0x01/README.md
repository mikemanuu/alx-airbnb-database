# Database Schema Creation

This document provides an overview of the database schema creation process for the project. The schema defines the structure of the database by specifying the tables, attributes, relationships, and constraints needed to store and manage the application data.

---

## Objective

The goal is to design a well-structured and normalized database schema using SQL CREATE TABLE statements. The schema adheres to best practices and ensures data integrity, consistency, and optimal performance.

---

## Entities and Attributes

The database consists of the following entities, along with their key attributes:

### 1. *User*
- UserID (Primary Key): Unique identifier for each user.
- Name: Full name of the user.
- Email: Unique email address.
- Phone: Contact phone number.
- Address: Residential address.
- Role: User role (e.g., Guest, Host, Admin).

### 2. *Property*
- PropertyID (Primary Key): Unique identifier for each property.
- Name: Name or title of the property.
- Location: Address or location of the property.
- Type: Type of property (e.g., apartment, house).
- Price: Cost of booking the property per day.

### 3. *Booking*
- BookingID (Primary Key): Unique identifier for each booking.
- BookingDate: Date when the booking was created.
- StartDate: Check-in date for the booking.
- EndDate: Check-out date for the booking.
- TotalCost: Total cost of the booking.
- UserID (Foreign Key): References the user who made the booking.
- PropertyID (Foreign Key): References the booked property.

### 4. *Message*
- MessageID (Primary Key): Unique identifier for each message.
- SentDate: Timestamp when the message was sent.
- Content: Message text.
- BookingID (Foreign Key): References the associated booking.

### 5. *Review*
- ReviewID (Primary Key): Unique identifier for each review.
- Rating: Numerical rating (e.g., 1-5).
- Comment: Textual review content.
- BookingID (Foreign Key): References the associated booking.

### 6. *Payment*
- PaymentID (Primary Key): Unique identifier for each payment.
- PaymentDate: Date of payment.
- Amount: Payment amount.
- BookingID (Foreign Key): References the associated booking.

---

## Relationships

The relationships between the entities are as follows:
- *User to Booking*: A user can make multiple bookings, but a booking belongs to one user.
- *Property to Booking*: A property can be booked multiple times, but a booking is associated with one property.
- *Booking to Message*: A booking can have multiple messages.
- *Booking to Review*: A booking can have one review.
- *Booking to Payment*: A booking can have one payment.

---

## SQL Schema

### Example: User Table
```sql
CREATE TABLE User (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Phone VARCHAR(15),
    Address VARCHAR(255),
    Role ENUM('Admin', 'Host', 'Guest') NOT NULL DEFAULT 'Guest'
);

Additional Tables

The schema includes additional tables for Property, Booking, Message, Review, and Payment. Each table contains well-defined attributes, primary keys, foreign keys, and constraints to enforce data integrity. Refer to the full SQL script in the project repository for detailed table definitions.


---

Indexes

Indexes are created on frequently queried columns to optimize performance:

User.Email

Property.Location

Booking.StartDate, Booking.EndDate

Message.SentDate

Review.Rating



---

Usage

1. Copy the provided SQL script into your database management tool (e.g., MySQL Workbench, PostgreSQL, SQLite).


2. Execute the script to create the schema.


3. Verify the schema using queries or an ERD tool to ensure it aligns with the design.




---

Notes

The schema is designed to be in Third Normal Form (3NF), ensuring minimal redundancy and maintaining data integrity.

Foreign key constraints enforce relationships between tables and cascade updates or deletions.

