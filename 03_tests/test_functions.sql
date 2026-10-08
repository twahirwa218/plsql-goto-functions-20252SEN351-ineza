-- ============================================================
-- test_functions.sql
-- Tests all PL/SQL functions using DBMS_OUTPUT
-- ============================================================
SET SERVEROUTPUT ON;

BEGIN
    DBMS_OUTPUT.PUT_LINE('===== TEST: fn_annual_salary =====');
    FOR r IN (SELECT emp_id, first_name, salary FROM employees) LOOP
        DBMS_OUTPUT.PUT_LINE(r.first_name || ' | monthly: ' || r.salary
                             || ' | annual: ' || fn_annual_salary(r.emp_id));
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE('===== TEST: fn_years_of_service =====');
    FOR r IN (SELECT emp_id, first_name FROM employees) LOOP
        DBMS_OUTPUT.PUT_LINE(r.first_name || ' | years: '
                             || fn_years_of_service(r.emp_id));
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE('===== TEST: fn_calculate_tax =====');
    FOR r IN (SELECT emp_id, first_name, salary FROM employees) LOOP
        DBMS_OUTPUT.PUT_LINE(r.first_name || ' | salary: ' || r.salary
                             || ' | tax: ' || fn_calculate_tax(r.salary));
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE('===== TEST: fn_dept_name =====');
    FOR r IN (SELECT dept_id FROM departments) LOOP
        DBMS_OUTPUT.PUT_LINE('Dept ' || r.dept_id || ': ' || fn_dept_name(r.dept_id));
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE('===== Edge cases =====');
    DBMS_OUTPUT.PUT_LINE('fn_annual_salary(999): ' || fn_annual_salary(999));
    DBMS_OUTPUT.PUT_LINE('fn_dept_name(999): ' || fn_dept_name(999));
    DBMS_OUTPUT.PUT_LINE('fn_calculate_tax(-100): ' || fn_calculate_tax(-100));
END;
/