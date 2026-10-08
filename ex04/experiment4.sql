-- Ex No: 4
-- Implicit Cursors

DECLARE
  total_rows NUMBER(2);
BEGIN
  UPDATE customers SET salary = salary + 500;
  IF sql%NOTFOUND THEN
    dbms_output.put_line('no customers selected');
  ELSIF sql%FOUND THEN
    total_rows := sql%ROWCOUNT;
    dbms_output.put_line(total_rows || ' customers selected');
  END IF;
END;
/

-- Output:
-- 6 customers selected
-- PL/SQL procedure successfully completed.

-- Explicit Cursors

DECLARE
  c_id   customers.id%TYPE;
  c_name customers.name%TYPE;
  c_addr customers.address%TYPE;
  CURSOR c_customers IS
    SELECT id, name, address FROM customers;
BEGIN
  OPEN c_customers;
  LOOP
    FETCH c_customers INTO c_id, c_name, c_addr;
    EXIT WHEN c_customers%NOTFOUND;
    dbms_output.put_line(c_id || ' ' || c_name || ' ' || c_addr);
  END LOOP;
  CLOSE c_customers;
END;
/

-- Sample Output:
-- 1 Ramesh Ahmadabad
-- 2 Khilan Delhi
-- 3 Kaushik Kota
-- 4 Chaitali Mumbai
