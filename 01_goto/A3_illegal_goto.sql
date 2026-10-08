-- ============================================================
-- A3_illegal_goto.sql
-- Part 1: Demonstrates an ILLEGAL GOTO (will fail to compile)
-- Part 2: Shows the FIXED version (legal GOTO)
-- ============================================================
SET SERVEROUTPUT ON;

-- ============================================================
-- PART 1: ILLEGAL GOTO (uncomment to test the error)
-- Rule: You cannot jump INTO a loop from outside it.
-- ============================================================
/*
BEGIN
    GOTO inside_loop;   -- ILLEGAL: jumping into a loop

    FOR i IN 1..5 LOOP
        <<inside_loop>>
        DBMS_OUTPUT.PUT_LINE('i = ' || i);
    END LOOP;
END;
/
*/

-- ============================================================
-- PART 2: FIXED VERSION (legal GOTO within same block)
-- Rule: You CAN jump forward within the same block/loop.
-- ============================================================
BEGIN
    DBMS_OUTPUT.PUT_LINE('=== Fixed GOTO Demo ===');

    FOR i IN 1..5 LOOP
        IF i = 3 THEN
            GOTO skip_three;
        END IF;
        DBMS_OUTPUT.PUT_LINE('i = ' || i);

        <<skip_three>>
        NULL;  -- placeholder for the GOTO target
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('=== Done ===');
END;
/