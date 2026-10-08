-- ============================================================
-- B3_fn_calculate_tax.sql
-- Function: Calculates tax on a given salary using tax brackets
-- ============================================================
CREATE OR REPLACE FUNCTION fn_calculate_tax (
    p_salary IN NUMBER
) RETURN NUMBER
IS
    v_tax NUMBER := 0;
BEGIN
    IF p_salary IS NULL OR p_salary < 0 THEN
        RETURN 0;
    ELSIF p_salary <= 30000 THEN
        v_tax := 0;
    ELSIF p_salary <= 60000 THEN
        v_tax := (p_salary - 30000) * 0.15;
    ELSIF p_salary <= 100000 THEN
        v_tax := 4500 + (p_salary - 60000) * 0.25;
    ELSE
        v_tax := 14500 + (p_salary - 100000) * 0.35;
    END IF;

    RETURN ROUND(v_tax, 2);

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error in fn_calculate_tax: ' || SQLERRM);
        RETURN NULL;
END fn_calculate_tax;
/