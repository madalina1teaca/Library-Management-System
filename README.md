# Library Management System

## Introduction
The Library Management System is a project designed to manage library operations efficiently. It allows librarians to manage books, patrons, and transactions within the library.

## Project Structure

The project consists of the following files and folders:

- `library_management.sql`: This SQL file contains the script for creating the database and its tables.
- `load_data.sql`: This script is used to load initial data into the library database from CSV files.
- `Queries.sql`: This file contains various SQL queries to interact with the database.
- `sample_dataset.py`: A Python script that generates fake data for the library database.
- **Folder: `Library Data`**
  - `authors.csv`: A CSV file containing generated author data.
  - `books.csv`: A CSV file containing generated book data.
  - `members.csv`: A CSV file containing generated member data.
  - `transactions.csv`: A CSV file containing generated transaction data.

## Database Schema

The following tables are created within the `library_management` database:

### Tables

1. **authors**
   - `author_id` (INT, Primary Key): Unique identifier for each author.
   - `name` (VARCHAR): Name of the author.
   - `bio` (TEXT): Biography of the author.

2. **books**
   - `book_id` (INT, Primary Key): Unique identifier for each book.
   - `title` (VARCHAR): Title of the book.
   - `author_id` (INT, Foreign Key): ID of the author (references `authors.author_id`).
   - `genre` (VARCHAR): Genre of the book.
   - `isbn` (VARCHAR): International Standard Book Number.
   - `published_date` (DATE): Date the book was published.

3. **members**
   - `member_id` (INT, Primary Key): Unique identifier for each library member.
   - `first_name` (VARCHAR): First name of the member.
   - `last_name` (VARCHAR): Last name of the member.
   - `email` (VARCHAR): Email address of the member.
   - `phone` (VARCHAR): Phone number of the member.

4. **transactions**
   - `transaction_id` (INT, Primary Key): Unique identifier for each transaction.
   - `book_id` (INT, Foreign Key): ID of the borrowed book (references `books.book_id`).
   - `member_id` (INT, Foreign Key): ID of the borrowing member (references `members.member_id`).
   - `borrow_date` (DATE): Date the book was borrowed.
   - `return_date` (DATE): Date the book was returned.

## Data Loading Mechanism

The `load_data.sql` file loads data into the database from CSV files located in the `Library Data` folder. It requires the local file loading feature to be enabled. To do this, run the following commands before executing the data loading script:

```sql
SHOW GLOBAL VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile = true;
