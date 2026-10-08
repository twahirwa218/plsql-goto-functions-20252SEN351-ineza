-- ============================================================
-- A1_number_classifier.sql
-- Uses GOTO to classify a number as positive, negative, or zero
-- ============================================================
SET SERVEROUTPUT ON;

DECLARE
    v_num NUMBER := &enter_number;
BEGIN
    IF v_num > 0 THEN
        GOTO positive_label;
    ELSIF v_num < 0 THEN
        GOTO negative_label;
    ELSE
        GOTO zero_label;
    END IF;

    <<positive_label>>
    DBMS_OUTPUT.PUT_LINE(v_num || ' is POSITIVE.');
    GOTO end_label;

    <<negative_label>>
    DBMS_OUTPUT.PUT_LINE(v_num || ' is NEGATIVE.');
    GOTO end_label;

    <<zero_label>>
    DBMS_OUTPUT.PUT_LINE(v_num || ' is ZERO.');

    <<end_label>>
    DBMS_OUTPUT.PUT_LINE('Classification complete.');
END;
/