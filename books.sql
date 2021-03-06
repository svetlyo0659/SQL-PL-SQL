BEGIN 
    EXECUTE IMMEDIATE 'DROP TABLE TBL_BOOKS';
    EXECUTE IMMEDIATE 'DROP TABLE TBL_AUTHORS';
    EXECUTE IMMEDIATE 'DROP TABLE TBL_GENRE';
    
EXCEPTION
    WHEN OTHERS THEN NULL;
END;
/

CREATE TABLE TBL_AUTHORS(
author_id NUMBER GENERATED BY DEFAULT AS IDENTITY,
first_name VARCHAR2(255) NOT NULL,
last_name  VARCHAR(255) NOT NULL,
PRIMARY KEY (author_id)
);


INSERT INTO tbl_authors (first_name, last_name) VALUES('First name 1','Last Name 1'); 
INSERT INTO tbl_authors (first_name, last_name) VALUES('First name 2','Last Name 2'); 
INSERT INTO tbl_authors (first_name, last_name) VALUES('First name 3','Last Name 3'); 
INSERT INTO tbl_authors (first_name, last_name) VALUES('First name 4','Last Name 4'); 


CREATE TABLE TBL_BOOKS(
book_id NUMBER GENERATED BY DEFAULT AS IDENTITY,
isbn VARCHAR2(255) NOT NULL,
PRIMARY KEY (book_id)
);

INSERT INTO tbl_books (isbn) VALUES('123456'); 
INSERT INTO tbl_books (isbn) VALUES('101010'); 
INSERT INTO tbl_books (isbn) VALUES('202020'); 

CREATE TABLE TBL_BOOKS(
book_id NUMBER GENERATED BY DEFAULT AS IDENTITY,
isbn VARCHAR2(255) NOT NULL,
PRIMARY KEY (book_id)
);




