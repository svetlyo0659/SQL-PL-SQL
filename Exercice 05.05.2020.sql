--1-- Create Procedure for books table
CREATE OR REPLACE PROCEDURE
    INSERT_BOOK
AS
    cat INT:= 9;
BEGIN
--Insert into books
INSERT INTO books(book_id, author_first_name, author_last_name,book_name, price, category_id)
VALUES(1009, 'George', 'Lucas','A new Hope', 35.25, cat);
--Inser into books
INSERT INTO books(book_id, author_first_name, author_last_name,book_name, price, category_id)
VALUES(1010, 'Brian', 'Johnson','Dissapoitment', 0.25, cat);
--Insert into books
INSERT INTO books(book_id, author_first_name, author_last_name,book_name, price, category_id)
VALUES(1011, 'Edgar', 'Wright','Baby Driver', 105.25, cat);
COMMIT;
END;
--Execute procedure
EXEC INSERT_BOOK;
SELECT * FROM BOOKS;
--2-- Create procedure for category table
CREATE OR REPLACE PROCEDURE
    INSERT_CATEGORY (cat_id NUMBER, cat_name VARCHAR)
AS
BEGIN
--Delete inserted data
DELETE FROM
    book_category
WHERE
    category_id = cat_id;
COMMIT;
--Insert into book_category
INSERT INTO book_category(category_id, category_name)
VALUES(cat_id, cat_name);
COMMIT;
END;
--Execute procedure
EXEC INSERT_CATEGORY(9, 'SciFi');
--Pray it worked
SELECT * FROM BOOK_CATEGORY;
--Create table old_books
CREATE TABLE old_books(
BOOK_ID NUMBER(38),
BOOK_NAME VARCHAR2(35),
change_date DATE
);
--3-- Create Trigger Update Books
CREATE OR REPLACE TRIGGER UPDATE_BOOKS
AFTER
UPDATE OF book_name
ON books
FOR EACH ROW
BEGIN
--Save old data beffore update
INSERT INTO old_books(book_id, book_name, change_date)
VALUES (:OLD.book_id, :OLD.book_name, SYSDATE);
END;
--Update book_name
UPDATE books b
SET b.book_name = 'Novata Kniga'
WHERE book_id = 1004;
SELECT * FROM old_books;
--4-- Create Trigger Update Book Category
CREATE OR REPLACE TRIGGER UPDATE_CATEGORY
BEFORE
DELETE
ON book_category
FOR EACH ROW
BEGIN
--Delete books with the same ID as  the deleted category
DELETE FROM
    books
WHERE
    books.category_id = :OLD.category_id;
END;
--Delete statement to trigger update_category
DELETE FROM
    book_category
WHERE
    category_id = 9;
--Check if it worked
SELECT * FROM BOOKS;
SELECT * FROM BOOK_CATEGORY;

CREATE TABLE books_catalog (
author_first_name VARCHAR2(25),
author_last_name VARCHAR2(25),
book_name VARCHAR2(25),
category_name VARCHAR2(25) NOT NULL,
insertion_date DATE);

CREATE OR REPLACE PROCEDURE LOAD_BOOKS_CATALOGS 
AS 
BEGIN
TRUNCAT (book_category);
INSERT INTO BOOK_CATALOG (author_first_name,author_last_name,book_name,category_name,insertion_date) VALUES (
SELECT 
b.author_first_name,
b.author_last_name,
b.book_name,
bc.category_name,
SYSDATE
FROM books b
INNER JOIN book_category bc
ON b.category_id = bc.category_id);
COMMIT;
END;


SELECT 
b.author_first_name,
b.author_last_name,
b.book_name,
bc.category_name,
SYSDATE
FROM books b
INNER JOIN book_category bc
ON b.category_id = bc.category_id;

EXEC LOAD_BOOKS_CATALOGS;

SELECT * FROM books_catalog;




