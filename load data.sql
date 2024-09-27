SHOW GLOBAL VARIABLES LIKE 'local_infile';

SET GLOBAL local_infile = true;

#loading the data

#loading AUTHORS data
LOAD DATA LOCAL INFILE '/Users/madalinateaca/Desktop/Data Analytics/Portfolio Projects/Library Management System/Library Data/authors.csv'
INTO TABLE authors
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

#loading BOOKS data
LOAD DATA LOCAL INFILE '/Users/madalinateaca/Desktop/Data Analytics/Portfolio Projects/Library Management System/Library Data/books.csv'
INTO TABLE books
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

#loading MEMBERS data
LOAD DATA LOCAL INFILE '/Users/madalinateaca/Desktop/Data Analytics/Portfolio Projects/Library Management System/Library Data/members.csv'
INTO TABLE members
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

#loading TRANSACTIONS data
LOAD DATA LOCAL INFILE '/Users/madalinateaca/Desktop/Data Analytics/Portfolio Projects/Library Management System/Library Data/transactions.csv'
INTO TABLE transactions
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;