-- ============================================================
-- B1_fn_annual_salary.sql
-- Function: Returns the annual salary (monthly salary x 12)
-- ============================================================
CREATE OR REPLACE FUNCTION fn_annual_salary (
    p_emp_id IN NUMBER
) RETURN NUMBER
IS
    v_salary NUMBER;
BEGIN
    SELECT salary INTO v_salary
    FROM employees
    WHERE emp_id = p_emp_id;

    RETURN v_salary * 12;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error in fn_annual_salary: ' || SQLERRM);
        RETURN NULL;
END fn_annual_salary;
/