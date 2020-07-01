CREATE TABLE TBL_CUSTOMERS(
customer_id INTEGER NOT NULL,
first_name VARCHAR(30)NOT NULL,
last_name VARCHAR(30)NOT NULL,
age NUMBER NOT NULL,
department VARCHAR(30)NOT NULL,
salary NUMBER NOT NULL,
city VARCHAR(30) NOT NULL,
country VARCHAR(30)
);


INSERT INTO TBL_CUSTOMERS (customer_id, first_name, last_name,age, department, salary,city,country) VALUES (100001,'Jon','Doe',19,'SOFTWARE',1900,'London','UK');
INSERT INTO TBL_CUSTOMERS (customer_id, first_name, last_name,age, department, salary,city,country) VALUES (100002,'Francic','Hoffman',34,'HARDWARE',3500,'Berlin','Germany');
INSERT INTO TBL_CUSTOMERS (customer_id, first_name, last_name,age, department, salary,city,country) VALUES (100003,'Georgi','Georgiev',29,'SOFTWARE',2100,'Sofia','Bulgaria');
INSERT INTO TBL_CUSTOMERS (customer_id, first_name, last_name,age, department, salary,city,country) VALUES (100004,'Guedo','Lopes',21,'ENGINEERING',4900,'Mexico', NULL);
INSERT INTO TBL_CUSTOMERS (customer_id, first_name, last_name,age, department, salary,city,country) VALUES (100005,'Jeremy','Bowers',43,'SHIPPING',5500,'London','UK');

CREATE TABLE Salespeople(
SNUM NUMBER NOT NULL,
SNAME VARCHAR(20) NOT NULL,
CITY VARCHAR(20) DEFAULT 'London',
COMN NUMBER(10,2) CHECK (comn<1)
);



INSERT INTO Salespeople (snum, sname, city,comn) VALUES (1001,'Peel','New York',0.12);
INSERT INTO Salespeople (snum, sname, city,comn) VALUES (1002,'Peter',null,0.14);
INSERT INTO Salespeople (snum, sname, comn) VALUES (1003,'Robert',0.12);
INSERT INTO Salespeople (snum, sname, city,comn) VALUES (1004,'Elisabeth','London',0.02);

SELECT * FROM Salespeople

DELETE FROM Salespeople WHERE snum = 1003

SELECT 
    c.customer_id,
    c.first_name,
    c.age AS age_of_customer,
    c.city
FROM TBL_CUSTOMERS c

SELECT 
    c.customer_id,
    c.first_name,
    c.age AS age_of_customer,
    c.city
FROM TBL_CUSTOMERS c
WHERE c.city = 'Sofia'

SELECT 
    c.customer_id,
    c.first_name,
    c.age AS age_of_customer,
    c.city
FROM TBL_CUSTOMERS c
WHERE NOT  c.city = 'Sofia'

SELECT 
    c.customer_id,
    c.first_name,
    c.age AS age_of_customer,
    c.city
FROM TBL_CUSTOMERS c
WHERE city = 'London' AND salary < 3000


SELECT 
    c.customer_id,
    c.first_name,
    c.age AS age_of_customer,
    c.city
FROM TBL_CUSTOMERS c
WHERE city = 'London' OR salary < 3000

SELECT 
    c.customer_id,
    c.first_name,
    c.age AS age_of_customer,
    c.city
    c.salary
FROM TBL_CUSTOMERS c
WHERE city = 'Sofia' OR salary < > 3500

SELECT 
    customer_id,
    first_name,
    age AS age_of_customer,
    city
    salary
FROM TBL_CUSTOMERS 
WHERE city = 'Sofia' OR salary < > 3500

SELECT 
    c.first_name,
    c.salary, --- old salary
    c.salary*1.2 AS NEW_SALARY --- new salary 
FROM TBL_CUSTOMERS c

SELECT 
    customer_id,
    first_name,
    age AS age_of_customer,
    city
    salary
FROM TBL_CUSTOMERS 
WHERE city IN('Sofia','Mexico')

SELECT 
    s.snum, 
    s.sname, 
    s.city,
    s.comn
FROM Salespeople s
WHERE comn BETWEEN  0.02 AND 0.12 

SELECT 
    customer_id,
    first_name,
    age AS age_of_customer,
    city
    salary
FROM TBL_CUSTOMERS 
WHERE city LIKE  '%n'

---------------------------------------------- The SQL COUNT(), AVG() and SUM() Functions
SELECT 
    AVG(salary) AS average_salary
FROM TBL_CUSTOMERS 

SELECT 
    MAX(salary) AS max_salary
FROM TBL_CUSTOMERS 

SELECT 
    MIN(salary) AS min_salary
FROM TBL_CUSTOMERS 


SELECT 
    COUNT(salary) AS count_of_salary
FROM TBL_CUSTOMERS 

SELECT 
    SUM(salary) AS total_sum_of_salary
FROM TBL_CUSTOMERS 


--------------------------------------------- ORDER BY GROUP BY 
SELECT 
    first_name
FROM TBL_CUSTOMERS 
ORDER BY first_name DESC

SELECT  ---- NAME ASC
    first_name,
    salary
FROM TBL_CUSTOMERS 
ORDER BY first_name,salary

SELECT  ----- SALARY ASC
    first_name,
    salary
FROM TBL_CUSTOMERS 
ORDER BY salary,first_name

SELECT 
    salary*1.4 AS "SALARY"
FROM TBL_CUSTOMERS 
WHERE salary > 3100
ORDER BY salary DESC

SELECT DISTINCT 
    city
FROM tbl_customers

-------------------------------??
SELECT 
    city, 
    COUNT(*) as cnt, 
    AVG(salary)AS salary_avg 
FROM TBL_CUSTOMERS
GROUP BY city

SELECT 
    city,
    DEPARTMENT,
    SUM(salary) AS avg_salary
FROM tbl_customers
GROUP BY city,DEPARTMENT


--25
SELECT 
    city, 
    COUNT(*) as cnt, 
    AVG(salary)AS salary_avg 
FROM TBL_CUSTOMERS
GROUP BY city
HAVING AVG(salary) > 4000

--26

SELECT 
    city, 
    COUNT(*) as cnt, 
    AVG(salary)AS salary_avg 
FROM TBL_CUSTOMERS
WHERE age>25
GROUP BY city
HAVING AVG(salary) > 4000

--- London	1	5500





