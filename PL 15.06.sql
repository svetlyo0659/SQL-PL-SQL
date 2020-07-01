SET SERVEROUTPUT ON;

DECLARE
    lambda      NUMBER; -- wave length
    text1       VARCHAR(20) := 'Infrared';
    text2       VARCHAR(30) := 'Sun Light';
    text3       VARCHAR(30) := 'Untraviolet';
    decision    BOOLEAN;
    decision1   BOOLEAN;
BEGIN
    lambda := &input_data;
    dbms_output.put_line('');
    decision := lambda > 0.65;
    decision1 := lambda < 0.41;
    dbms_output.put_line(lambda);
    IF ( decision ) THEN
        dbms_output.put_line(text1);
        dbms_output.put_line(lambda);
    ELSIF ( decision1 ) THEN
        dbms_output.put_line(text3);
    ELSE
        dbms_output.put_line(text2);
    END IF;

END;

--------CONTINUE

BEGIN
    FOR i IN 1..100 LOOP
        CONTINUE WHEN MOD(i, 7) != 0;
        dbms_output.put_line(i);
    END LOOP;
END;

DECLARE
    step NUMBER;
BEGIN
    step := &input_data;
    FOR i IN 1..70 LOOP IF MOD(i, step) = 0 THEN
        CONTINUE WHEN i = 30;
        dbms_output.put_line(i);
    END IF;
    END LOOP;

END;


------- LOOPSTART GOTO operator

DECLARE
    var1 NUMBER(2) := 1;
BEGIN
    WHILE var1 < 12 LOOP
        << loopstart >> dbms_output.put_line('value of a: ' || var1);
        var1 := var1 + 1;
        IF var1 = 7 THEN
            dbms_output.put_line('Jump ' || var1);
            var1 := var1 + 1;
            GOTO loopstart;
        END IF;

    END LOOP;
END;


--------------------- EXCEPTIONS 

DECLARE
    i NUMBER;
BEGIN
    i := 1 / 0;
EXCEPTION
    WHEN zero_divide THEN
        dbms_output.put_line('CAN NOT DIVIDE BY ZERO');
END;



---- custom exceptions

DECLARE
    i NUMBER;
    exception_number_to_big EXCEPTION;
BEGIN
    i := &input_data;
    IF i > 10 THEN
        RAISE exception_number_to_big;
    ELSIF i < 0 THEN
        RAISE standard.invalid_number;
    ELSE
        dbms_output.put_line('your number is: ' || i);
    END IF;

EXCEPTION
    WHEN exception_number_to_big THEN
        dbms_output.put_line('NUMBER TO BIG');
    WHEN invalid_number THEN
        dbms_output.put_line('NUMBER TO SMALL');
END;

CREATE OR REPLACE PROCEDURE error_proc IS
    i INTEGER;
BEGIN
    i := 1 / 0;
    i := 15;
END;

CREATE OR REPLACE PROCEDURE parent_proc IS
BEGIN
    error_proc;
END;

BEGIN parent_proc;
EXCEPTION
WHEN others THEN
    dbms_output.put_line('SQLCODE: ' || sqlcode);
    dbms_output.put_line('SQLERRM: ' || sqlerrm);
    dbms_output.put_line('DBMS_UTILITY.FORMAT_ERROR_BACKTRACE:');
    dbms_output.put_line(dbms_utility.format_error_backtrace);
END;


