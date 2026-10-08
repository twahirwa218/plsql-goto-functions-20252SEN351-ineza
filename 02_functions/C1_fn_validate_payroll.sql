-- ============================================================
-- C1_fn_validate_payroll.sql
-- Combined task: validates an employee's payroll data
-- Uses all previously created functions
-- ============================================================
CREATE OR REPLACE FUNCTION fn_validate_payroll (
    p_emp_id IN NUMBER
) RETURN VARCHAR2
IS
    v_salary    NUMBER;
    v_hire_date DATE;
    v_dept_id   NUMBER;
    v_annual    NUMBER;
    v_tax       NUMBER;
    v_net       NUMBER;
    v_years     NUMBER;
    v_dept      VARCHAR2(50);
BEGIN
    -- Get employee data
    SELECT salary, hire_date, dept_id
    INTO v_salary, v_hire_date, v_dept_id
    FROM employees
    WHERE emp_id = p_emp_id;

    -- Use our other functions
    v_annual := fn_annual_salary(p_emp_id);
    v_tax    := fn_calculate_tax(v_salary);
    v_net    := v_annual - v_tax;
    v_years  := fn_years_of_service(p_emp_id);
    v_dept   := fn_dept_name(v_dept_id);

    -- Validation rules
    IF v_salary < 0 THEN
        RETURN 'INVALID: Negative salary';
    ELSIF v_years < 0 THEN
        RETURN 'INVALID: Future hire date';
    ELSIF v_net < 0 THEN
        RETURN 'INVALID: Net pay negative';
    ELSE
        RETURN 'VALID | Dept: ' || v_dept ||
               ' | Years: ' || v_years ||
               ' | Tax: ' || v_tax ||
               ' | Net annual: ' || v_net;
    END IF;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'INVALID: Employee not found';
    WHEN OTHERS THEN
        RETURN 'ERROR: ' || SQLERRM;
END fn_validate_payroll;
/