-- Ex No: 5
-- Procedure

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE Sum(a IN NUMBER, b IN NUMBER) IS
  c NUMBER;
BEGIN
  c := a + b;
  dbms_output.put_line('Sum of two nos = ' || c);
END Sum;
/

-- Execution example:
-- EXEC Sum(10, 20);
-- Output: Sum of two nos = 30

-- Function

SET SERVEROUTPUT ON;

CREATE OR REPLACE FUNCTION Sum_fn(a IN NUMBER, b IN NUMBER)
RETURN NUMBER IS
  c NUMBER;
BEGIN
  c := a + b;
  RETURN c;
END;
/

-- Execution example:
-- SELECT Sum_fn(5, 5) FROM dual;
-- Output: Sum of two nos = 10
