-- ============================================================
-- B2_fn_years_of_service.sql
-- Function: Returns how many full years an employee has worked
-- ============================================================
CREATE OR REPLACE FUNCTION fn_years_of_service (
    p_emp_id IN NUMBER
) RETURN NUMBER
IS
    v_hire_date DATE;
BEGIN
    SELECT hire_date INTO v_hire_date
    FROM employees
    WHERE emp_id = p_emp_id;

    RETURN TRUNC(MONTHS_BETWEEN(SYSDATE, v_hire_date) / 12);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error in fn_years_of_service: ' || SQLERRM);
        RETURN NULL;
END fn_years_of_service;
/