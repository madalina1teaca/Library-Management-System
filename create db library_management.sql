# droping the library_management database in case it exists
DROP DATABASE IF EXISTS `library_management`;

#creating the database
CREATE DATABASE library_management;

USE library_management;

#creating the tables
CREATE TABLE authors (
	author_id INT PRIMARY KEY,
    name VARCHAR(255),
    bio TEXT
);

CREATE TABLE books (
	book_id INT PRIMARY KEY,
    title VARCHAR(255),
    author_id INT,
    genre VARCHAR(50),
    isbn VARCHAR(20),
    published_date DATE,
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

CREATE TABLE members (
	member_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(20)
);

CREATE TABLE transactions (
	transaction_id INT PRIMARY KEY,
    book_id INT,
    member_id INT,
    borrow_date DATE,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    FOREIGN KEY (member_id) REFERENCES members(member_id)
);