-- ============================================================
-- B4_fn_dept_name.sql
-- Function: Returns the department name given a department ID
-- ============================================================
CREATE OR REPLACE FUNCTION fn_dept_name (
    p_dept_id IN NUMBER
) RETURN VARCHAR2
IS
    v_name VARCHAR2(50);
BEGIN
    SELECT dept_name INTO v_name
    FROM departments
    WHERE dept_id = p_dept_id;

    RETURN v_name;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'Unknown Department';
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error in fn_dept_name: ' || SQLERRM);
        RETURN 'Error';
END fn_dept_name;
/