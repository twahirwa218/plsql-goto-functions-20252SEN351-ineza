-- ============================================================
-- test_validate_payroll.sql
-- Tests fn_validate_payroll for all employees and invalid IDs
-- ============================================================
SET SERVEROUTPUT ON;

BEGIN
    DBMS_OUTPUT.PUT_LINE('===== Validating All Employees =====');
    FOR r IN (SELECT emp_id, first_name FROM employees ORDER BY emp_id) LOOP
        DBMS_OUTPUT.PUT_LINE(r.first_name || ': ' || fn_validate_payroll(r.emp_id));
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE('===== Invalid Employee IDs =====');
    DBMS_OUTPUT.PUT_LINE('ID 999: ' || fn_validate_payroll(999));
    DBMS_OUTPUT.PUT_LINE('ID -1:  ' || fn_validate_payroll(-1));
END;
/