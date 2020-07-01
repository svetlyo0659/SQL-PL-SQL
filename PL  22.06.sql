SET SERVEROUTPUT ON

------ PACKAGE

CREATE OR REPLACE PACKAGE
    pkg1 AS
    var1 VARCHAR(200) := 'Code Academy';

    PROCEDURE procedure1;
END;
/

CREATE OR REPLACE PACKAGE BODY pkg1 AS

    var2 DATE;

    FUNCTION function1 RETURN VARCHAR2 IS
    BEGIN
        RETURN to_char(sysdate, 'DD.MM.YYYY HH24:MI:SS');
    END;

    PROCEDURE procedure1 IS
        var3 VARCHAR(200);
    BEGIN
        var3 := function1
                || ' '
                || to_char(var2)
                || ' '
                || to_char(var1);

        var1 := var3;
    END;

END;
/

DECLARE 
res1 VARCHAR (200) := pkg1.procedure1;
BEGIN
dbms_output.put_line(res1);
END;
/



BEGIN
pkg1.procedure1;
END;


 