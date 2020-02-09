CREATE DATABASE FinalProject3;
USE FinalProject3;

CREATE TABLE library_branch_table (
	branch_id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	branch_name VARCHAR(50) NOT NULL,
	branch_address VARCHAR(50) NOT NULL
);

CREATE TABLE borrower_table (
	card_no INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	borrower_name VARCHAR(50) NOT NULL,
	borrower_address VARCHAR(50) NOT NULL,
	borrower_phone VARCHAR(50) NOT NULL
);

CREATE TABLE publisher_table (
	publisher_name VARCHAR(50) PRIMARY KEY NOT NULL,
	publisher_address VARCHAR(50) NOT NULL,
	publisher_phone VARCHAR(50) NOT NULL
);

CREATE TABLE books_table (
	books_id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	books_title VARCHAR(50) NOT NULL,	
	publisher_name VARCHAR(50) NOT NULL  CONSTRAINT fk_publisher_name FOREIGN KEY REFERENCES publisher_table(publisher_name)
);


CREATE TABLE books_authors_table (
	book_id INT NOT NULL CONSTRAINT fk_book_id FOREIGN KEY REFERENCES books_table(books_id),	
	author_name VARCHAR(50) NOT NULL
);

CREATE TABLE books_copies_table (
	book_id INT NOT NULL CONSTRAINT fk_book2_id FOREIGN KEY REFERENCES books_table(books_id),
	branch_id INT NOT NULL CONSTRAINT fk_branch_id FOREIGN KEY REFERENCES library_branch_table(branch_id),
	number_of_copies INT
);

CREATE TABLE books_loans_table (
	book_id INT NOT NULL CONSTRAINT fk_book3_id FOREIGN KEY REFERENCES books_table(books_id),
	branch_id INT NOT NULL CONSTRAINT fk_branch2_id FOREIGN KEY REFERENCES library_branch_table(branch_id),
	card_no INT NOT NULL CONSTRAINT fk_card_no FOREIGN KEY REFERENCES borrower_table(card_no),
	date_out DATE NOT NULL,
	date_due DATE NOT NULL
);


INSERT INTO library_branch_table
		(branch_name, branch_address)
		VALUES
		('Sharpstown', '243 Main Street'),
		('Central', 'Livingston Avenue'),
		('Greenpark', 'Holloway Drive'),
		('Ferntown', 'Grassor Place'),
		('Filonte', 'Piedmont Road')
;

INSERT INTO publisher_table
		(publisher_name, publisher_address, publisher_phone)
		VALUES
		('Anne Minto', '2 Publisher Street', '222-555-1110-'),
		('Mike somfur', '3 Publisher Street', '222-555-2221'),
		('Tina Grill', '4 Publisher Street', '222-555-3332'),
		('Wristy Myers', '5 Publisher Street', '222-555-4443'),
		('Mike Timmer', '6 Publisher Street', '222-555-5554'),
		('Samantha Sarruci', '7 Publisher Street', '222-555-0005'),
		('Erica Lint', '8 Publisher Street', '222-555-6667'),
		('Eric Lind', '9 Publisher Street', '222-555-7778'),
		('Rick Ling', '10 Publisher Street', '222-555-1119'),
		('Patricia Highsmith', '11 Publisher Street', '222-555-2202'),
		('Mike well', '12 Publisher Street', '222-555-3313'),
		('Sam turin', '13 Publisher Street', '222-555-4424'),
		('Tom Forn', '14 Publisher Street', '222-555-5535'),
		('Ciro Parondi', '15 Publisher Street', '222-555-0040'),
		('Yorn michaels', '16 Publisher Street', '222-555-6656'),
		('Rock Samuels', '17 Publisher', '222-555-7767'),
		('Cary Gront', '18 Publisher Street', '222-555-5575'),
		('York Peterson', '19 Publisher Street', '222-555-0080'),
		('Idin Smith', '20 Publisher Street', '222-555-6696'),
		('Tim Corpinto', '21 Publisher Street', '222-555-7077')
;

INSERT INTO books_table
		(books_title, publisher_name)
		VALUES
		('The Lost Tribe', 'Anne Minto'),
		('This Wheel''s ''on Fire', 'Mike somfur'),
		('Testimony', 'Tina Grill'),
		('Luchino Visconti a biography', 'Wristy Myers'),
		('Nine fish', 'Mike Timmer'),
		('eight fish', 'Samantha Sarruci'),
		('seven fish', 'Erica Lint'),
		('six fish', 'Eric Lind'),
		('five fish', 'Rick Ling'),
		('four fish', 'Patricia Highsmith'),
		('three fish', 'Mike well'),
		('two fish', 'Sam turin'),
		('one fish', 'Tom Forn'),
		('no fish', 'Ciro Parondi'),
		('Paper towels', 'Yorn michaels'),
		('Lanterns', 'Rock Samuels'),
		('Beach', 'Cary Gront'),
		('Sand', 'York Peterson'),
		('Waves', 'Idin Smith'),
		('Sun', 'Tim Corpinto')
;

INSERT INTO books_authors_table
		(book_id, author_name)
		VALUES
		(1,'Stephen King'),
		(2,'Levon Helm'),
		(3,'Robbie Robertson'),
		(4,'Gaia Servadio'),
		(5,'Ross Finley'),
		(6,'Ross Finley'),
		(7,'Ross Finley'),
		(8,'Ross Finley'),
		(9,'Ross Finley'),
		(10,'Ross Finley'),
		(11,'Ross Finley'),
		(12,'Ross Finley'),
		(13,'Ross Finley'),
		(14,'Ross Finley'),
		(15,'Stephen King'),
		(16,'Tom hooplin'),
		(17,'Claudia Point'),
		(18,'Mike Earl'),
		(19,'Sarah Martinez'),
		(20,'Grace fint')
;

INSERT INTO borrower_table
		(borrower_name, borrower_address, borrower_phone)
		VALUES
		('Sammy Sunday', '215 Main Street', '111-555-1111'),
		('Sammy Monday', '225 Main Street', '111-555-2222'),
		('Sammy Tuesday', '235 First Street', '111-555-3333'),
		('Ron Ohr', '196 Michigan Avenue', '111-555-4444'),
		('Grace Tillint', '111 Grain Street', '111-555-5555'),
		('Orica Pentil', '202 Floral Road', '111-555-0000'),
		('Mike Grain', '215 Road Street', '111-555-6666'),
		('Shade Carpenter', '215 Harp Court', '111-555-7777')
;


INSERT INTO books_loans_table
		(book_id, branch_id, card_no, date_out, date_due)
		VALUES
		(1, 1, 1, '1996-08-12', '1996-08-24'),
		(2, 1, 1, '1996-08-15','1996-09-02'),
		(3, 1, 1, '1996-08-17', '1996-09-04'),
		(4, 2, 1, '1996-08-19', '1996-09-05'),
		(5, 2, 1, '1996-08-22','1996-09-10'),
		(6, 3, 1, '1996-08-25', '1996-09-15'),
		(7, 2, 2, '1996-08-27', '1996-09-20'),
		(8, 5, 2, '1996-08-28', '1996-09-21'),
		(9, 1, 2, '1996-09-05', '1996-09-27'),
		(10, 1, 2, '1996-09-11', '1996-10-01'),
		(11, 4, 2, '1996-09-12', '1996-10-05'),
		(12, 2, 2, '1996-09-12', '1996-10-03'),
		(13, 5, 2, '1996-09-15', '1996-10-08'),
		(14, 5, 3, '1996-09-18', '1996-10-11'),
		(15, 2, 4, '1996-09-23', '1996-10-15'),
		(16, 4, 5, '1996-09-24', '1996-10-17'),
		(17, 4, 6, '1996-10-07', '1996-10-24'),
		(18, 5,  7, '1996-10-13', '1996-11-03'),
		(19, 3, 7, '1996-10-13', '1996-11-04'),
		(19, 3, 7, '1996-10-15', '1996-11-06'),
		(1, 2, 7, '1996-10-18', '1996-11-08'),
		(2, 5, 7, '1996-10-19', '1996-11-09'),
		(3, 3, 7, '1996-10-20', '1996-11-10'),
		(4, 3, 8, '1996-10-21', '1996-11-11'),
		(5, 2, 8, '1996-10-22', '1996-11-12'),
		(6, 1, 7, '1996-10-23', '1996-11-13'),
		(7, 3, 7, '1996-10-24', '1996-11-14'),
		(8, 1, 7, '1996-10-25', '1996-11-15'),
		(9, 2, 7, '1996-10-26', '1996-11-16'),
		(10, 1, 7, '1996-10-27', '1996-11-17'),
		(11, 4, 7, '1996-10-28', '1996-11-18'),
		(12, 5, 7, '1996-10-29', '1996-11-19'),
		(13, 5, 8, '1996-10-30', '1996-11-20'),
		(14, 5, 8, '1996-10-31', '1996-11-21'),
		(15, 5, 8, '1996-11-01', '1996-11-22'),
		(16, 2, 7, '1996-11-02', '1996-11-23'),
		(17, 1, 7, '1996-11-03', '1996-11-24'),
		(18, 1, 7, '1996-11-04', '1996-11-25'),
		(19, 4, 1, '1996-11-05', '1996-11-26'),
		(1, 4, 3, '1996-11-06', '1996-11-27'),
		(2, 4, 7, '1996-11-07', '1996-11-28'),
		(3, 1, 7, '1996-11-08', '1996-11-29'),
		(4, 2, 7, '1996-11-09', '1996-11-30'),
		(5, 2, 7, '1996-11-10', '1996-12-04'),
		(7, 5, 6, '1996-11-11', '1996-12-05'),
		(8, 5, 7, '1996-11-12', '1996-12-06'),
		(9, 3, 5, '1996-11-13', '1996-12-07'),
		(10, 3, 7, '1996-11-14', '1996-12-08'),
		(12, 3, 4, '1996-11-15', '1996-12-09'),
		(14, 1, 7, '1996-11-16', '1996-12-10'),
		(20, 4, 8, '1996-11-17', '1996-12-11')
;

INSERT INTO books_copies_table
		(book_id, branch_id, number_of_copies)
		VALUES
		(1, 1, 3),
		(11, 1, 3),
		(16, 1, 12),
		(15, 1, 7),
		(17, 1, 3),
		(13, 1, 4),
		(18, 1, 3),
		(1, 2, 5),
		(12, 2, 5),
		(13, 2, 15),
		(14, 2, 7),
		(15, 2, 2),
		(16, 2, 3),
		(17, 2, 5),
		(18, 2, 25),
		(2, 1, 2),
		(3, 1, 4),
		(4, 1, 5),
		(5, 2, 4),
		(6, 2, 12),
		(7, 2, 17),
		(8, 2, 9),
		(19, 3, 2),
		(9, 3, 1),
		(8, 3, 7),
		(7, 3, 5),
		(6, 3, 2),
		(5, 3, 24),
		(4, 3, 23),
		(3, 3, 12),
		(2, 3, 2),
		(1, 3, 2),
		(10, 3, 35),
		(11, 3, 2),
		(12, 3, 8),
		(13, 4, 10),
		(16, 4, 1),
		(17, 4, 19),
		(18, 4, 12),
		(19, 4, 7),
		(12, 4, 10),
		(11, 4, 10),
		(10, 4, 10),
		(9, 4, 10),
		(8, 4, 10),
		(4, 4, 4),
		(2, 2, 19),
		(3, 4, 23),
		(17, 5, 5),
		(18, 5, 3),
		(19, 5, 12),
		(16, 5, 1),
		(15, 5, 2),
		(14, 5, 8),
		(13, 5, 5),
		(12, 5, 7),
		(11, 5, 5),
		(10, 5, 15),
		(9, 5, 5),
		(20, 5, 21)
;

/* Query 1 */
SELECT number_of_copies, branch_name
FROM books_copies_table
INNER JOIN library_branch_table ON library_branch_table.branch_id = books_copies_table.branch_id
INNER JOIN books_table ON books_table.books_id = books_copies_table.book_id
WHERE books_title = 'The Lost Tribe' AND library_branch_table.branch_id= 1;

/* Query 2 */
SELECT number_of_copies, branch_name
FROM books_copies_table
INNER JOIN library_branch_table ON library_branch_table.branch_id = books_copies_table.branch_id
INNER JOIN books_table ON books_table.books_id = books_copies_table.book_id
WHERE books_title = 'The Lost Tribe';

/* Query 3 */
SELECT borrower_name
FROM borrower_table
LEFT OUTER JOIN books_loans_table ON books_loans_table.card_no = borrower_table.card_no
WHERE books_loans_table.card_no IS NULL;

/* Query 4 */
SELECT books_table.books_title, borrower_table.borrower_name, borrower_table.borrower_address, library_branch_table.branch_name
FROM borrower_table
INNER JOIN books_loans_table ON books_loans_table.card_no = borrower_table.card_no
INNER JOIN books_table ON books_table.books_id = books_loans_table.book_id
INNER JOIN library_branch_table ON  library_branch_table.branch_id = books_loans_table.branch_id
WHERE library_branch_table.branch_id = 1 AND date_due = '1996-09-02';

/* Query 5 */
SELECT library_branch_table.branch_name, COUNT(books_loans_table.card_no) as 'Total loaned books'
FROM books_loans_table
INNER JOIN library_branch_table ON library_branch_table.branch_id = books_loans_table.branch_id
GROUP BY library_branch_table.branch_name
ORDER BY COUNT(books_loans_table.card_no) DESC
 ;

/* Query 6 */
SELECT borrower_table.borrower_name, borrower_table.borrower_address, COUNT(books_loans_table.card_no) as 'Books loaned'
FROM books_loans_table
INNER JOIN borrower_table ON books_loans_table.card_no = borrower_table.card_no
GROUP BY borrower_table.borrower_name, borrower_table.borrower_address
HAVING COUNT(books_loans_table.card_no) >= 5;

/* Query 7 */
SELECT books_table.books_title, books_copies_table.number_of_copies
FROM books_copies_table
INNER JOIN library_branch_table ON library_branch_table.branch_id = books_copies_table.branch_id
INNER JOIN books_table ON books_table.books_id = books_copies_table.book_id
INNER JOIN books_authors_table ON books_authors_table.book_id =books_copies_table.book_id
WHERE library_branch_table.branch_id = 2 AND books_authors_table.author_name = 'Stephen King';









SELECT * FROM library_branch_table;
SELECT * FROM borrower_table;
SELECT * FROM books_table;
SELECT * FROM publisher_table;
SELECT * FROM books_authors_table;
SELECT * FROM books_copies_table;
SELECT * FROM books_loans_table;




