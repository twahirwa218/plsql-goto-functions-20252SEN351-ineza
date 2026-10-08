-- ============================================================
-- B5_functions_in_select.sql
-- Demonstrates calling user-defined functions inside SQL SELECT
-- ============================================================
SET SERVEROUTPUT ON;

-- 1. All functions used together in one SELECT
SELECT e.emp_id,
       e.first_name,
       e.salary,
       fn_annual_salary(e.emp_id)    AS annual_salary,
       fn_years_of_service(e.emp_id) AS years_of_service,
       fn_calculate_tax(e.salary)    AS tax_amount,
       fn_dept_name(e.dept_id)       AS department
FROM employees e
ORDER BY e.emp_id;

-- 2. Functions inside a WHERE clause
SELECT emp_id, first_name, salary
FROM employees
WHERE fn_calculate_tax(salary) > 3000
ORDER BY salary DESC;

-- 3. Functions inside ORDER BY
SELECT emp_id,
       first_name,
       fn_annual_salary(emp_id) AS annual_salary
FROM employees
ORDER BY fn_annual_salary(emp_id) DESC;