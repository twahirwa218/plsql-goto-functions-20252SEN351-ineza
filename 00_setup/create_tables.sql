-- ============================================================
-- create_tables.sql
-- Creates tables for the PL/SQL GOTO & Functions assignment
-- Run this FIRST before any other script
-- ============================================================

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE employees CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE departments CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/

CREATE TABLE departments (
    dept_id     NUMBER PRIMARY KEY,
    dept_name   VARCHAR2(50) NOT NULL
);

CREATE TABLE employees (
    emp_id       NUMBER PRIMARY KEY,
    first_name   VARCHAR2(30),
    last_name    VARCHAR2(30),
    salary       NUMBER(10,2),
    hire_date    DATE,
    dept_id      NUMBER REFERENCES departments(dept_id)
);

INSERT INTO departments VALUES (10, 'IT');
INSERT INTO departments VALUES (20, 'HR');
INSERT INTO departments VALUES (30, 'Finance');
INSERT INTO departments VALUES (40, 'Marketing');

INSERT INTO employees VALUES (1, 'Alice',  'Mukamana', 50000, DATE '2020-01-15', 10);
INSERT INTO employees VALUES (2, 'Bob',    'Niyonzima', 75000, DATE '2018-06-01', 20);
INSERT INTO employees VALUES (3, 'Carol',  'Uwase',     45000, DATE '2022-03-10', 30);
INSERT INTO employees VALUES (4, 'David',  'Habimana',  90000, DATE '2015-11-20', 10);
INSERT INTO employees VALUES (5, 'Eve',    'Ingabire',  60000, DATE '2019-09-05', 40);

COMMIT;

SET SERVEROUTPUT ON;
BEGIN
   DBMS_OUTPUT.PUT_LINE('Setup complete. Tables created and populated.');
END;
/