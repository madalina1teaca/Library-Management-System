# All borrowed books
SELECT b.title,
	m.first_name,
	m.last_name,
	t.borrow_date
FROM transactions t 
JOIN books b ON t.book_id = b.book_id
JOIN members m ON t.member_id = m.member_id;

# The number of books per genre and the percentage they were borrowed
SELECT b.genre, 
	COUNT(*)
		AS number_of_books,
	ROUND(
		COUNT(t.transaction_id) * 100.0 / 
			(SELECT COUNT(*) FROM transactions)
        , 0)
        AS borrows_percentage
FROM books b
JOIN transactions t ON t.book_id = b.book_id
GROUP BY b.genre;

# The most popular authors
SELECT a.name, COUNT(*) as number_of_borrows
FROM transactions t 
JOIN books b ON t.book_id = b.book_id
JOIN authors a ON b.author_id = a.author_id
GROUP BY a.name
ORDER BY number_of_borrows DESC 
LIMIT 10;

# Books borrowed within the last month
SELECT b.title,
	m.first_name,
	m.last_name,
	t.borrow_date
FROM transactions t
JOIN books b ON t.book_id = b.book_id
JOIN members m ON t.member_id = m.member_id
WHERE t.borrow_date >= DATE_SUB(CURDATE(), INTERVAL 30 DAY);

# Top 5 most borrowed books
SELECT b.title, COUNT(t.transaction_id) AS borrow_count
FROM transactions t
JOIN books b ON t.book_id = b.book_id
GROUP BY b.title
ORDER BY borrow_count DESC
LIMIT 5;

# Monthly borrowing trend for the last year
SELECT 
	DATE_FORMAT(borrow_date, '%m') AS month,
    COUNT(*) AS borrow_count
FROM transactions
WHERE borrow_date >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
GROUP BY month
ORDER BY month;

# Authors with no borrowd books
SELECT a.name
FROM authors a
LEFT JOIN books b ON a.author_id = b.author_id
LEFT JOIN transactions t ON b.book_id = t.book_id
WHERE t.transaction_id IS NULL;

# Most active members
SELECT 	
	CONCAT(m.first_name, ' ', m.last_name) AS member_name,
	COUNT(t.transaction_id) AS borrow_count
FROM transactions t
JOIN members m ON t.member_id = m.member_id
GROUP BY member_name
ORDER BY borrow_count DESC
LIMIT 10;

# Average Borrowing Time
SELECT AVG(DATEDIFF(return_date, borrow_date)) AS average_borrow_time
FROM transactions
WHERE return_date IS NOT NULL;

# Borrowing statistics by member
SELECT 
	m.first_name,
	m.last_name,
    COUNT(t.transaction_id) AS number_of_borrowed_books,
    GROUP_CONCAT(b.title SEPARATOR ', ') AS borrowed_books
FROM members m
LEFT JOIN transactions t ON m.member_id = t.member_id
LEFT JOIN books b ON t.book_id = b.book_id
GROUP BY m.member_id;

# Overdue books
SELECT b.title, m.first_name, m.last_name, t.borrow_date, t.return_date
FROM transactions t 
JOIN books b ON t.book_id = b.book_id
JOIN members m ON t.member_id = m.member_id
WHERE t.return_date < CURDATE() AND t.return_date IS NOT NULL;

#Books borrowed more than once
SELECT b.title, COUNT(t.transaction_id) AS times_borrowed
FROM transactions t 
JOIN books b ON t.book_id = b.book_id
GROUP BY b.book_id
HAVING times_borrowed > 1;

# All members who borrowed books in a specific genre - e.g. Mystery
SELECT DISTINCT CONCAT(m.first_name, ' ', m.last_name) as member_name
FROM members m 
JOIN transactions t ON m.member_id = t.member_id
JOIN books b ON t.book_id = b.book_id
WHERE b.genre = 'Mystery';
