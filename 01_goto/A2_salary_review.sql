-- ============================================================
-- A2_salary_review.sql
-- Uses GOTO to apply salary raises based on salary ranges
-- ============================================================
SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_emp IS
        SELECT emp_id, first_name, salary
        FROM employees;

    v_new_salary NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('=== Salary Review ===');

    FOR r IN c_emp LOOP
        -- Skip employees already earning 80000 or more
        IF r.salary >= 80000 THEN
            GOTO skip_raise;
        END IF;

        -- Calculate raise based on salary range
        IF r.salary >= 50000 THEN
            v_new_salary := r.salary * 1.10;  -- 10% raise
        ELSE
            v_new_salary := r.salary * 1.15;  -- 15% raise
        END IF;

        DBMS_OUTPUT.PUT_LINE(r.first_name || ': ' || r.salary
                             || ' -> ' || ROUND(v_new_salary, 2));

        <<skip_raise>>
        IF r.salary >= 80000 THEN
            DBMS_OUTPUT.PUT_LINE(r.first_name || ': ' || r.salary
                                 || ' (no raise - already high)');
        END IF;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('=== Review Complete ===');
END;
/