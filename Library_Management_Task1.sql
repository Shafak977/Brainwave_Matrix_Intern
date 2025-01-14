CREATE DATABASE library;

USE library;

-- Create 'category' table
CREATE TABLE category (
    id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL
);

-- Create 'author' table
CREATE TABLE author (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL
);

-- Create 'member_status' table
CREATE TABLE member_status (
    id INT AUTO_INCREMENT PRIMARY KEY,
    status_name VARCHAR(50) NOT NULL
);

-- Create 'member' table
CREATE TABLE member (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    joined_date DATE NOT NULL,
    active_status_id INT,
    FOREIGN KEY (active_status_id) REFERENCES member_status(id)
);

-- Create 'book' table
CREATE TABLE book (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    category_id INT,
    publication_date DATE,
    copies_owned INT,
    FOREIGN KEY (category_id) REFERENCES category(id)
);

-- Create 'book_author' table (many-to-many relationship between books and authors)
CREATE TABLE book_author (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES book(id),
    FOREIGN KEY (author_id) REFERENCES author(id)
);

-- Create 'reservation_status' table
CREATE TABLE reservation_status (
    id INT AUTO_INCREMENT PRIMARY KEY,
    status_name VARCHAR(50) NOT NULL
);

-- Create 'reservation' table
CREATE TABLE reservation (
    id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT,
    member_id INT,
    reservation_date DATE,
    reservation_status_id INT,
    FOREIGN KEY (book_id) REFERENCES book(id),
    FOREIGN KEY (member_id) REFERENCES member(id),
    FOREIGN KEY (reservation_status_id) REFERENCES reservation_status(id)
);


-- Insert data into 'category' table
INSERT INTO category (category_name) VALUES
('Science Fiction'),
('Fantasy'),
('Mystery'),
('Biography'),
('Technology');

-- Insert data into 'author' table
INSERT INTO author (first_name, last_name) VALUES
('Isaac', 'Asimov'),
('J.K.', 'Rowling'),
('Agatha', 'Christie'),
('Stephen', 'Hawking'),
('Elon', 'Musk');

-- Insert data into 'member_status' table
INSERT INTO member_status (status_name) VALUES
('Active'),
('Inactive');

-- Insert data into 'member' table
INSERT INTO member (first_name, last_name, joined_date, active_status_id) VALUES
('John', 'Doe', '2022-01-15', 1),
('Jane', 'Smith', '2023-03-22', 1),
('Alice', 'Johnson', '2021-11-10', 2);

-- Insert data into 'book' table
INSERT INTO book (title, category_id, publication_date, copies_owned) VALUES
('The Foundation', 1, '1951-05-10', 3),
('Harry Potter and the Philosopher\'s Stone', 2, '1997-06-26', 5),
('Murder on the Orient Express', 3, '1934-01-01', 4),
('A Brief History of Time', 4, '1988-04-01', 2),
('Tesla: A Biography', 5, '2018-11-01', 6);

-- Insert data into 'book_author' table
INSERT INTO book_author (book_id, author_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- Insert data into 'reservation_status' table
INSERT INTO reservation_status (status_name) VALUES
('Reserved'),
('Checked Out'),
('Cancelled');

-- Insert data into 'reservation' table
INSERT INTO reservation (book_id, member_id, reservation_date, reservation_status_id) VALUES
(1, 1, '2023-12-01', 1),
(2, 2, '2023-12-15', 2),
(3, 3, '2023-12-20', 3);
