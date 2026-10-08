-- ============================================================
-- A4_rewrite_no_goto.sql
-- Rewrites A1 and A2 WITHOUT using GOTO
-- Demonstrates cleaner control flow with IF/ELSE and LOOP
-- ============================================================
SET SERVEROUTPUT ON;

-- ------------------------------------------------------------
-- PART 1: Number Classifier (rewrite of A1, no GOTO)
-- ------------------------------------------------------------
DECLARE
    v_num NUMBER := &enter_number;
BEGIN
    IF v_num > 0 THEN
        DBMS_OUTPUT.PUT_LINE(v_num || ' is POSITIVE.');
    ELSIF v_num < 0 THEN
        DBMS_OUTPUT.PUT_LINE(v_num || ' is NEGATIVE.');
    ELSE
        DBMS_OUTPUT.PUT_LINE(v_num || ' is ZERO.');
    END IF;

    DBMS_OUTPUT.PUT_LINE('Classification complete.');
END;
/

-- ------------------------------------------------------------
-- PART 2: Salary Review (rewrite of A2, no GOTO)
-- ------------------------------------------------------------
DECLARE
    CURSOR c_emp IS
        SELECT emp_id, first_name, salary
        FROM employees;

    v_new_salary NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('=== Salary Review (No GOTO) ===');

    FOR r IN c_emp LOOP
        IF r.salary >= 80000 THEN
            DBMS_OUTPUT.PUT_LINE(r.first_name || ': ' || r.salary
                                 || ' (no raise - already high)');
        ELSIF r.salary >= 50000 THEN
            v_new_salary := r.salary * 1.10;
            DBMS_OUTPUT.PUT_LINE(r.first_name || ': ' || r.salary
                                 || ' -> ' || ROUND(v_new_salary, 2));
        ELSE
            v_new_salary := r.salary * 1.15;
            DBMS_OUTPUT.PUT_LINE(r.first_name || ': ' || r.salary
                                 || ' -> ' || ROUND(v_new_salary, 2));
        END IF;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('=== Review Complete ===');
END;
/