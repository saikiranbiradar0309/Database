# SQL UPDATE — Updating Data

The `UPDATE` statement is used to **modify existing data** in a table.

### Basic Syntax

```sql
UPDATE <table_name>
SET <column_name> = <new_value>
WHERE <condition>;
```

> ⚠️ **Important:** Always be careful with the `WHERE` clause. Without it, the `UPDATE` statement will affect **every row** in the table.

---

## 1. Select the Database

```sql
USE startersql;
```

---

## 2. View the Existing Data

Before making changes, it's a good practice to check the current data.

```sql
SELECT *
FROM users;
```

---

# 3. Update a Single Column

### Update the salary of the employee whose ID is `1`

```sql
UPDATE users
SET salary = 68000
WHERE id = 1;
```

Here:

* `UPDATE users` → tells SQL which table to modify
* `SET salary = 68000` → changes the salary
* `WHERE id = 1` → ensures only the employee with ID `1` is updated

### Verify the Update

```sql
SELECT *
FROM users
WHERE id = 1;
```

---

# 4. Update Multiple Columns

You can update **two or more columns** in a single `UPDATE` statement.

### Update salary and email of the employee whose ID is `1`

```sql
UPDATE users
SET salary = 70000,
    email = 'aarav@cloud.com'
WHERE id = 1;
```

### Verify the Update

```sql
SELECT *
FROM users
WHERE id = 1;
```

---

# 5. Update Another User

### Update the salary of the user whose ID is `5` to ₹70,000

```sql
UPDATE users
SET salary = 70000
WHERE id = 5;
```

### Verify

```sql
SELECT *
FROM users
WHERE id = 5;
```

---

# 6. Update a User Based on Email

You don't always have to use the ID in the `WHERE` clause.

### Change the name of the user with email `aisha@example.com`

```sql
UPDATE users
SET name = 'Aisha Khan'
WHERE email = 'aisha@example.com';
```

### Verify

```sql
SELECT *
FROM users
WHERE email = 'aisha@example.com';
```

> **Tip:** If `email` is defined as `UNIQUE`, this query should affect at most one user.

---

# 7. Update Salary Using an Existing Value

You can use the existing column value in an `UPDATE` expression.

### Increase the salary by ₹10,000 for all users whose salary is less than ₹60,000

First, check which rows will be affected:

```sql
SELECT *
FROM users
WHERE salary < 60000;
```

Then update them:

```sql
UPDATE users
SET salary = salary + 10000
WHERE salary < 60000;
```

### Example

Before:

| name  | salary |
| ----- | -----: |
| Rahul | 45,000 |
| Priya | 55,000 |
| Amit  | 65,000 |

After:

| name  | salary |
| ----- | -----: |
| Rahul | 55,000 |
| Priya | 65,000 |
| Amit  | 65,000 |

Only employees whose original salary was below ₹60,000 are affected.

---

# 8. Update Based on a Name

### Set the gender of the user `Ishaan` to `Other`

First, find the user:

```sql
SELECT *
FROM users
WHERE name = 'Ishaan';
```

Then update the gender:

```sql
UPDATE users
SET gender = 'Other'
WHERE name = 'Ishaan';
```

### Verify

```sql
SELECT *
FROM users
WHERE name = 'Ishaan';
```

> **Tip:** If multiple users have the name `Ishaan`, this query will update **all of them**. Using a unique identifier such as `id` is generally safer.

---

# 9. Update All Rows

You can update every row by **omitting the `WHERE` clause**.

### Reset the salary of all users to ₹50,000

First, view the existing data:

```sql
SELECT *
FROM users;
```

Then:

```sql
UPDATE users
SET salary = 50000;
```

This updates the salary of **every user**.

> ⚠️ **WARNING:** This query intentionally affects all rows.

---

# 🚨 Important: Always Be Careful With `WHERE`

Consider:

```sql
UPDATE users
SET salary = 50000;
```

Because there is **no `WHERE` clause**, every user's salary will be changed to ₹50,000.

Compare that with:

```sql
UPDATE users
SET salary = 50000
WHERE id = 5;
```

Only the user with ID `5` will be updated.

### Easy Rule

```text
UPDATE + WHERE
      ↓
Update specific rows

UPDATE without WHERE
      ↓
Update ALL rows
```

---

# 🛡️ Safe Update Practice

Before running an important `UPDATE`, first run the same condition with `SELECT`.

For example:

```sql
-- Step 1: Check which rows will be affected
SELECT *
FROM users
WHERE salary < 60000;

-- Step 2: Update those rows
UPDATE users
SET salary = salary + 10000
WHERE salary < 60000;
```

This gives you a chance to verify that the `WHERE` condition is correct.

---

# 📌 Complete Example

```sql
-- Select the database
USE startersql;


-- View existing data
SELECT *
FROM users;


-- Update salary of employee with ID 1
UPDATE users
SET salary = 68000
WHERE id = 1;


-- Verify
SELECT *
FROM users
WHERE id = 1;


-- Update multiple columns
UPDATE users
SET salary = 70000,
    email = 'aarav@cloud.com'
WHERE id = 1;


-- Verify
SELECT *
FROM users
WHERE id = 1;


-- Update salary of user with ID 5
UPDATE users
SET salary = 70000
WHERE id = 5;


-- Verify
SELECT *
FROM users
WHERE id = 5;


-- Change name based on email
UPDATE users
SET name = 'Aisha Khan'
WHERE email = 'aisha@example.com';


-- Verify
SELECT *
FROM users
WHERE email = 'aisha@example.com';


-- Increase salary by ₹10,000
-- for users whose salary is less than ₹60,000

-- First check the affected rows
SELECT *
FROM users
WHERE salary < 60000;

-- Perform the update
UPDATE users
SET salary = salary + 10000
WHERE salary < 60000;


-- Set Ishaan's gender to Other

-- First check the user
SELECT *
FROM users
WHERE name = 'Ishaan';

-- Perform the update
UPDATE users
SET gender = 'Other'
WHERE name = 'Ishaan';


-- Reset salary of ALL users to ₹50,000
-- WARNING: This affects every row

SELECT *
FROM users;

UPDATE users
SET salary = 50000;
```

---

# 🧠 Quick Cheat Sheet

| Operation                   | Query Pattern                                                             |
| --------------------------- | ------------------------------------------------------------------------- |
| Update one column           | `UPDATE users SET salary = 70000 WHERE id = 1;`                           |
| Update multiple columns     | `UPDATE users SET salary = 70000, email = 'x@y.com' WHERE id = 1;`        |
| Update using existing value | `UPDATE users SET salary = salary + 10000 WHERE salary < 60000;`          |
| Update based on email       | `UPDATE users SET name = 'Aisha Khan' WHERE email = 'aisha@example.com';` |
| Update multiple rows        | `UPDATE users SET salary = 50000 WHERE salary < 60000;`                   |
| Update all rows             | `UPDATE users SET salary = 50000;`                                        |

---

## 🧠 Interview Tip

The most important pattern to remember is:

```sql
UPDATE table_name
SET column_name = new_value
WHERE condition;
```

For example:

```sql
UPDATE users
SET salary = salary + 10000
WHERE salary < 60000;
```

Think of it as:

```text
UPDATE → Which table?
   ↓
SET    → What should change?
   ↓
WHERE  → Which rows should change?
```

And always remember:

> **`UPDATE` without `WHERE` can modify every row in the table.**
