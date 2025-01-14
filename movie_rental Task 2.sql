-- CREATE DATABASE 
CREATE DATABASE movie_rental;


-- USE DATABASE
USE movie_rental;

-- Create tables for movie_rental database
CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    address VARCHAR(255)
);

CREATE TABLE Movies (
    movie_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100),
    genre VARCHAR(50),
    release_year YEAR,
    rating VARCHAR(10),
    available_copies INT
);

CREATE TABLE Rentals (
    rental_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    movie_id INT,
    rental_date DATETIME,
    return_date DATETIME,
    status ENUM('rented', 'returned'),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id)
);

CREATE TABLE Payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    rental_id INT,
    amount DECIMAL(10, 2),
    payment_date DATETIME,
    payment_method ENUM('credit_card', 'paypal', 'cash'),
    FOREIGN KEY (rental_id) REFERENCES Rentals(rental_id)
);


/*Insert commands*/
-- Insert Customers
INSERT INTO Customers (first_name, last_name, email, phone, address) VALUES
('John', 'Doe', 'john.doe@example.com', '1234567890', '123 Elm St'),
('Jane', 'Smith', 'jane.smith@example.com', '0987654321', '456 Oak St');

-- Insert Movies
INSERT INTO Movies (title, genre, release_year, rating, available_copies) VALUES
('Inception', 'Sci-Fi', 2010, 'PG-13', 5),
('The Godfather', 'Crime', 1972, 'R', 3),
('The Dark Knight', 'Action', 2008, 'PG-13', 4);

-- Insert Rentals
INSERT INTO Rentals (customer_id, movie_id, rental_date, status) VALUES
(1, 1, NOW(), 'rented'),
(2, 2, NOW(), 'rented');

-- Insert Payments
INSERT INTO Payments (rental_id, amount, payment_date, payment_method) VALUES
(1, 4.99, NOW(), 'credit_card'),
(2, 3.99, NOW(), 'paypal');

-- Step 3. Queries to Handle Customer Orders
-- Get All Movies Available for Rent
SELECT * FROM Movies WHERE available_copies > 0;

-- Update Customer Information
UPDATE Customers 
SET phone = '555-5678', address = '101 Maple St' 
WHERE customer_id = 1;  -- Assuming customer_id 1 is the customer to update

-- 	Retrieve All Customers
SELECT * FROM Customers;

-- Retrieve a Specific Customer by ID
SELECT * FROM Customers 
WHERE customer_id = 1;  -- Replace with the desired customer_id

-- 	Retrieve Customers with Active Membership
SELECT * FROM Customers 
WHERE membership_status = 'Active';

-- 	Retrieve Customer Count by Membership Status
SELECT membership_status, COUNT(*) AS count 
FROM Customers 
GROUP BY membership_status;

