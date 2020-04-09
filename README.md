# The-Tech-Academy-SQL-Coding-Projects
This folder is host to a many to many relational database. This database simulates a library and has 7 different tables connected by
foreign keys. After I created the tables I inserted data into the tables using the phrase ``` INSERT INTO ``` followed by what table you
would like to insert the data into and then in parentheses you would place the columns of the table that you would like to insert data into
followed by the word ``` VALUES ``` and in parentheses the data you would like to insert. All together it would look like the following. 
``` INSERT INTO books_copies_table
		(book_id, branch_id, number_of_copies)
		VALUES
		(1, 1, 3),
		(11, 1, 3),  
    (20, 5, 21)
;

```
After the insert statements I have a series of queries. Here is an example of one of the queries: 
``` 
SELECT borrower_table.borrower_name, borrower_table.borrower_address, COUNT(books_loans_table.card_no) as 'Books loaned'
FROM books_loans_table
INNER JOIN borrower_table ON books_loans_table.card_no = borrower_table.card_no
GROUP BY borrower_table.borrower_name, borrower_table.borrower_address
HAVING COUNT(books_loans_table.card_no) >= 5; 
```
In the above example I am trying to figure out the names and addresses of people who have 5 or more books checked out.
I can get the borrowers name and address from the borrowers table and the number of books from the books_loans_table so I will reference
them in my SELECT statement and then I can use the built in function ``` COUNT() ``` so that I may see how many times each library card number
appears in the books_loans_table after that I will rename the query 'Books loaned' by putting ``` as 'Books loaned' ``` at the end of the 
select statement. When I am creating a query I try to see what tables I wish to receive data from and which of those tables has the most
connections to the other tables by means of primary and foreign keys. Whichever table has the most will be referenced in the FROM clause.
After this I need a way to link the two tables so I will use the keyword ``` INNER JOIN ``` and connect the tables using the primary key
from card_no on the borrower_table and the foreign key card_no in the book_loans_table. Then using the ``` GROUP BY ``` statement I
can dictate which rows I would like returned in the query and as I only need the borrowers name and address I only have to include those rows.
Finally we have the ``` HAVING ``` clause. Using the COUNT function we are saying if any card number appears 5 or more times then they meet
the criteria and should be included in this query.
 
