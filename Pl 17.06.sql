SET SERVEROUTPUT ON;

SELECT
    *
FROM
    tab1;

CREATE OR REPLACE PROCEDURE insert_record (
    arg1 NUMBER
) AS
    coeff CONSTANT NUMBER := 0.2;
BEGIN
    INSERT INTO tab1 VALUES (
        coeff * arg1,
        sysdate
    );

EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line(sqlerrm);
END;

DECLARE
    parameter NUMBER := 500;
BEGIN
    insert_record(parameter);
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line(sqlerrm);
END;
/

EXECUTE insert_record(10600);

SELECT
    *
FROM
    tab1;

DROP TABLE tab1;

CREATE OR REPLACE FUNCTION sumcolumn (
    par1   IN   DATE,
    par2   IN   DATE
) RETURN NUMBER AS
    sum_var NUMBER := 0;
BEGIN
    SELECT
        SUM(arg1)
    INTO sum_var
    FROM
        tab1
    WHERE
        arg2 BETWEEN par1 AND par2;

    RETURN sum_var;
END;
/

DECLARE
    res NUMBER;
BEGIN
    res := sumcolumn(sysdate - 1, sysdate);
    dbms_output.put_line(res);
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line(sqlerrm);
END;
/

COMMIT;


--- RECURSION FACTORIEL
CREATE OR REPLACE FUNCTION facRec (
    n IN INTEGER
) RETURN INTEGER AS
BEGIN
    IF n >= 1 THEN
        RETURN n * facRec(n - 1);
        RETURN 1;
    ELSE
        RETURN 1;
    END IF;
END;
/

DECLARE
    res NUMBER;
    num NUMBER := 7;
BEGIN
    res := facRec(num);
    dbms_output.put_line('Factoriel of: '|| num ||' is : '|| res);
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line(sqlerrm);
END;
/

COMMIT;

CREATE OR REPLACE PROCEDURE print(phrase IN VARCHAR2, punctuation_mark IN CHAR) IS 
BEGIN 
dbms_output.put_line(phrase || ' ' || punctuation_mark);
END;
/

BEGIN
    print('Hello CodeAcademy', '!');
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line(sqlerrm);
END;
/

CREATE OR REPLACE PROCEDURE test
   (p1 IN INTEGER,   p2 OUT INTEGER, p3 IN OUT INTEGER) 
IS 
BEGIN 
    
  p2 := 11; 
  p3 := 12; 

END; 
/

DECLARE 
arg1 INTEGER := 5;
arg2 INTEGER := 6;
arg3 INTEGER := 7;
BEGIN
dbms_output.put_line('BEFORE ARG2 =' || arg2);
dbms_output.put_line('BEFORE ARG3 =' || arg3);
test( p1 >= arg1, p2 >= arg2, p3 >= arg3 );
dbms_output.put_line('AFTER ARG2 =' || arg2);
dbms_output.put_line('AFTER ARG3 =' || arg3);
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line(sqlerrm);
END;
/


CREATE TABLE tab2(atr1 NUMBER);
INSERT INTO tab2 VALUES(1);
INSERT INTO tab2 VALUES(3);
INSERT INTO tab2 VALUES(5);

SELECT * FROM tab2;

CREATE TRIGGER tr_tb1 
BEFORE INSERT ON tab2 FOR EACH ROW 
DECLARE 
  stat_avg NUMBER; 
  stat_std NUMBER; 
  stat_n NUMBER; 
BEGIN 
SELECT COUNT(atr1),SUM(atr1),STDDEV(atr1)
INTO stat_n,stat_avg,stat_std FROM tab2;
   IF (ABS(stat_avg-stat_n*(:NEW.atr1))/(SQRT(stat_n)*stat_std)>3) THEN
       --RAISE_APPLICATION_ERROR(-20002, 'Too big deviation');
       DBMS_OUTPUT.PUT_LINE('Too big deviation!');
END IF;
END;
/

INSERT INTO tab2 VALUES(200);


------TRIGGERS