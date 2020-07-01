CREATE TABLE t_My_Date(
f_Id int,
f_Date DATE
);

DROP TABLE t_My_Date;

INSERT INTO t_My_Date VALUES(1,SYSDATE);

SELECT * FROM t_My_Date;

ALTER SESSION SET NLS_DATE_FORMAT = 'YY/MM/DD';

SELECT * FROM t_My_Date;

ALTER SESSION SET NLS_NUMERIC_CHARACTERS = '.';

SELECT 
TO_CHAR(1.1234)
FROM dual;


ALTER SESSION SET NLS_NUMERIC_CHARACTERS='. ';

SELECT TO_CHAR(1.1234) FROM dual;

ALTER SESSION SET NLS_NUMERIC_CHARACTERS=', ';

SELECT TO_CHAR(1.1234) FROM dual;

SELECT TO_CHAR(123456789.1234,'999,999,999,999,999.9999') FROM dual;


ALTER SESSION SET NLS_CURRENCY='$';

SELECT TO_CHAR('1876.54','L99,999.00') AS BALANCE
FROM dual;


SELECT TO_CHAR('1876.54','99,999.00L') AS BALANCE
FROM dual;


SELECT * FROM nls_database_parameters
WHERE parameter = 'NLS_CHARACTERSET';

DROP TABLE orders;
DROP TABLE orders_new;

CREATE TABLE orders (
    id_order   NUMBER(20) NOT NULL,
    f_dats     DATE,
    f_value    NUMBER(10),
    CONSTRAINT id_order_pk PRIMARY KEY ( id_order )
);
CREATE TABLE orders_new (
    id_ord    NUMBER(20) NOT NULL,
    f_dat     DATE,
    f_value   NUMBER(10),
    CONSTRAINT id_ord_pk PRIMARY KEY ( id_ord )
);
CREATE SEQUENCE order_sequence START WITH 1 INCREMENT BY 1
MAXVALUE 500 MINVALUE 1;
INSERT INTO orders VALUES(order_sequence.NEXTVAL, TO_DATE('20/03/23'), 100);
INSERT INTO orders_new VALUES(1, TO_DATE('20/03/23'), 1);
--INSERT INTO orders VALUES(2, TO_DATE('05.05.2020'), 200);error ALTER SESSION SET NLS_DATE_FORMAT='YY.MM.DD';
INSERT INTO orders VALUES(order_sequence.NEXTVAL, TO_DATE('20/05/05'), 200);
INSERT INTO orders_new VALUES(2, TO_DATE('20/05/06'), 3);
INSERT INTO orders VALUES(order_sequence.NEXTVAL, TO_DATE('20/05/07'), 300);
INSERT INTO orders_new VALUES(3, TO_DATE('20/05/08'), 100);
SELECT * FROM orders;

COMMIT;

CREATE TABLE BOOK_CATEGORY_new (
    category_id NUMBER(20) NOT NULL,
    category_name VARCHAR2(255) NOT NULL
);

INSERT INTO BOOK_CATEGORY_new VALUES (1,'comp science');

INSERT INTO BOOK_CATEGORY_new VALUES (8,'cemistry');

INSERT INTO BOOK_CATEGORY_new VALUES (3,'biology science');

INSERT INTO BOOK_CATEGORY_new VALUES (9,'Magic');

MERGE INTO BOOK_CATEGORY bc
USING BOOK_CATEGORY_new  nbc
ON (bc.category_id = nbc.category_id)
WHEN MATCHED THEN
UPDATE SET bc.category_name = nbc.category_name
WHEN NOT MATCHED THEN
INSERT VALUES (nbc.category_id, nbc.category_name);

SELECT * FROM BOOK_CATEGORY;







