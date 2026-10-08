# Reflection — PL/SQL GOTO Statements and Functions

**Student:** Ineza
**Student ID:** 20252SEN351
**Course:** Database Development with PL/SQL (INSY 8311)
**Assignment:** Individual Assignment III
**Date:** October 2026

---

## 1. GOTO Statements — What I Learned

The GOTO statement in PL/SQL transfers control unconditionally to a labeled statement. While it can simplify certain jumps, I learned that it comes with **strict rules**:

- GOTO **cannot jump into** a loop, a nested block, or an IF statement.
- GOTO **cannot jump out of** a subprogram or into an exception handler.
- GOTO **can jump** forward or backward within the same block, or to an enclosing block.

In **A3_illegal_goto.sql**, I demonstrated an illegal jump into a loop, which caused the compile error `PLS-00375: illegal GOTO statement`. I then fixed it by placing the label inside the loop and jumping forward within the same block.

## 2. When to Avoid GOTO

GOTO makes code harder to read and reason about — it's often called "spaghetti code." In **A4_rewrite_no_goto.sql**, I rewrote the earlier GOTO-based classifiers using only `IF/ELSIF/ELSE`. The result was shorter, clearer, and easier to maintain. In modern PL/SQL, GOTO should be a last resort.

## 3. PL/SQL Functions

Functions are named PL/SQL blocks that **return a value**. Key things I learned:

- Syntax: `CREATE OR REPLACE FUNCTION name (params) RETURN datatype IS ... BEGIN ... END;`
- They must include a `RETURN` statement.
- They can contain exception handlers (`NO_DATA_FOUND`, `OTHERS`, etc.).
- Functions can be called from SQL (`SELECT fn_name(...) FROM ...`), unlike procedures — **provided they don't perform DML** or have side effects.
- Creating small, focused functions (B1–B4) and then composing them (C1) makes complex logic manageable.

## 4. Exception Handling

Every function I wrote includes exception handling:
- `NO_DATA_FOUND` → returns `NULL` or a friendly message
- `OTHERS` → catches unexpected errors and prints `SQLERRM`

This makes the functions robust — they never crash the calling SQL statement.

## 5. Functions in SQL (B5)

I learned that user-defined functions can be used in:
- The `SELECT` list
- The `WHERE` clause
- The `ORDER BY` clause

This makes them powerful for reusing logic across queries, though calling functions per-row can affect performance on large tables.

## 6. Challenges Faced

- **Illegal GOTO error:** Initially tried jumping into a loop, got `PLS-00375`, and had to restructure.
- **Subquery inside function call:** In `fn_validate_payroll`, I first wrote `fn_dept_name((SELECT dept_id ...))`, which caused a compile error. Fixed by fetching `dept_id` into a variable first.
- **Saving `.sql` files:** Initially saved files as `.txt` because Notepad defaults to "Text Documents" — learned to always select "All Files" in Save As.

## 7. AI Usage Disclosure

I used an AI assistant (ChatGPT) for guidance on:
- Repository setup and Git commands
- Clarifying GOTO rules and function syntax
- Structuring the assignment deliverables

All SQL code was reviewed, executed, and verified by me in Oracle SQL Developer before submission. I understand and can explain every submitted line.

## 8. Conclusion

This assignment strengthened my understanding of PL/SQL control flow, function creation, exception handling, and the practical workflow of using Git and GitHub for coursework. Writing the "combined" payroll validator (C1) showed how small, reusable functions compound into larger business logic — a key principle in database development.