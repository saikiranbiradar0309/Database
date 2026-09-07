# SQL SELECT, WHERE, Operators, ORDER BY & LIMIT

These SQL examples cover some of the most commonly used clauses and operators when retrieving data from a table.

---

## 1. Select a Database

```sql
USE startersql;
```

`USE` selects the database that you want to work with.

---

## 2. Show All Tables

```sql
SHOW TABLES;
```

Displays all tables available in the currently selected database.

---

## 3. Select All Data

```sql
SELECT * FROM users;
```

`*` means **all columns**.

This query retrieves all rows and all columns from the `users` table.

---

# 4. Select Specific Columns

If you only need certain columns, specify their names instead of using `*`.

### Example: Select only `name` and `gender`

```sql
SELECT name, gender
FROM users;
```

This returns only:

```text
name | gender
```

---

# 5. `WHERE` Clause

The `WHERE` clause is used to **filter rows** based on a condition.

### Example: Get all female employees

```sql
SELECT *
FROM users
WHERE gender = 'Female';
```

Only rows where `gender` is `'Female'` will be returned.

---

# 6. Not Equal Operator

SQL provides two commonly supported ways to represent **not equal**:

```text
!=
<>
```

Both can be used to mean "not equal to."

### Using `!=`

```sql
SELECT *
FROM users
WHERE gender != 'Female';
```

### Using `<>`

```sql
SELECT *
FROM users
WHERE gender <> 'Female';
```

> **Note:** `<>` is the standard SQL operator. `!=` is also widely supported by databases such as MySQL, PostgreSQL, and SQL Server.

---

# 7. Comparison Operators

SQL provides several comparison operators:

| Operator | Meaning                  |
| -------- | ------------------------ |
| `=`      | Equal to                 |
| `!=`     | Not equal to             |
| `<>`     | Not equal to             |
| `>`      | Greater than             |
| `<`      | Less than                |
| `>=`     | Greater than or equal to |
| `<=`     | Less than or equal to    |

---

## 8. Less Than `<`

### Example: Employees born before September 9, 1999

```sql
SELECT *
FROM users
WHERE date_of_birth < '1999-09-09';
```

This returns employees whose date of birth is **earlier than** `1999-09-09`.

---

## 9. Greater Than `>`

### Example: Employees whose ID is greater than 10

```sql
SELECT *
FROM users
WHERE id > 10;
```

---

## 10. Greater Than or Equal To `>=`

### Example: Employees whose ID is 10 or greater

```sql
SELECT *
FROM users
WHERE id >= 10;
```

This includes employees with:

```text
10
11
12
13
...
```

---

# 11. Checking for `NULL`

`NULL` represents a **missing or unknown value**.

You should use `IS NULL` and `IS NOT NULL` to check for `NULL` values.

## `IS NULL`

### Example: Employees whose ID is `NULL`

```sql
SELECT *
FROM users
WHERE id IS NULL;
```

## `IS NOT NULL`

### Example: Employees whose ID is not `NULL`

```sql
SELECT *
FROM users
WHERE id IS NOT NULL;
```

> ⚠️ **Important:** Don't use `= NULL` or `<> NULL`.
>
> ```sql
> -- ❌ Incorrect
> WHERE id = NULL
>
> -- ❌ Incorrect
> WHERE id <> NULL
> ```
>
> Use:
>
> ```sql
> -- ✅ Correct
> WHERE id IS NULL
>
> -- ✅ Correct
> WHERE id IS NOT NULL
> ```

---

# 12. `BETWEEN` Operator

`BETWEEN` is used to check whether a value falls within a specified range.

### Example: Employees born between 1989-09-09 and 1999-09-09

```sql
SELECT *
FROM users
WHERE date_of_birth BETWEEN '1989-09-09' AND '1999-09-09';
```

`BETWEEN` is **inclusive**, meaning the boundary values are included.

So this:

```sql
WHERE date_of_birth BETWEEN '1989-09-09' AND '1999-09-09'
```

is equivalent to:

```sql
WHERE date_of_birth >= '1989-09-09'
  AND date_of_birth <= '1999-09-09';
```

---

# 13. `IN` Operator

The `IN` operator is used to match a value against **multiple possible values**.

### Example: Employees whose gender is Male or Others

```sql
SELECT *
FROM users
WHERE gender IN ('Male', 'Others');
```

This is easier to read than:

```sql
SELECT *
FROM users
WHERE gender = 'Male'
   OR gender = 'Others';
```

---

# 14. `AND` Operator

`AND` is used when **all conditions must be true**.

### Example: Female employees with salary greater than 70,000

```sql
SELECT *
FROM users
WHERE gender = 'Female'
  AND salary > 70000;
```

Both conditions must be satisfied:

```text
gender = Female
        AND
salary > 70000
```

> **Tip:** Since `salary` is a numeric column, don't use quotes around `70000`. Write `salary > 70000`, not `salary > '70000'`.

---

# 15. `OR` Operator

`OR` is used when **at least one condition must be true**.

### Example: Employees who are male OR have a salary greater than 65,000

```sql
SELECT *
FROM users
WHERE gender = 'Male'
   OR salary > 65000;
```

An employee will be returned if either condition is true.

---

# 16. `ORDER BY`

`ORDER BY` is used to **sort the result**.

It can be used with:

```text
ASC  → Ascending order
DESC → Descending order
```

---

## Ascending Order

### Example: Male employees or employees with salary greater than 65,000, sorted by date of birth

```sql
SELECT *
FROM users
WHERE gender = 'Male'
   OR salary > 65000
ORDER BY date_of_birth ASC;
```

`ASC` sorts from earlier dates to later dates.

---

## Descending Order

```sql
SELECT *
FROM users
WHERE gender = 'Male'
   OR salary > 65000
ORDER BY date_of_birth DESC;
```

`DESC` sorts from later dates to earlier dates.

> **Note:** `ASC` is the default sort direction, so this is also valid:
>
> ```sql
> ORDER BY date_of_birth;
> ```

---

# 17. `LIMIT`

`LIMIT` is used to restrict the **number of rows returned**.

### Example: Get only 5 employees whose salary is less than 60,000

```sql
SELECT *
FROM users
WHERE salary < 60000
LIMIT 5;
```

This returns **at most 5 rows** that satisfy the condition.

> **Important:** Without `ORDER BY`, the database does not guarantee which 5 matching rows will be returned.

For example, if you want the 5 lowest-paid employees:

```sql
SELECT *
FROM users
WHERE salary < 60000
ORDER BY salary ASC
LIMIT 5;
```

---

# 📌 Quick Cheat Sheet

| Clause / Operator | Purpose                             | Example                             |
| ----------------- | ----------------------------------- | ----------------------------------- |
| `SELECT *`        | Select all columns                  | `SELECT * FROM users;`              |
| `SELECT name`     | Select specific columns             | `SELECT name FROM users;`           |
| `WHERE`           | Filter rows                         | `WHERE salary > 50000`              |
| `=`               | Equal to                            | `gender = 'Male'`                   |
| `!=`              | Not equal to                        | `gender != 'Female'`                |
| `<>`              | Not equal to                        | `gender <> 'Female'`                |
| `>`               | Greater than                        | `salary > 50000`                    |
| `<`               | Less than                           | `salary < 50000`                    |
| `>=`              | Greater than or equal to            | `id >= 10`                          |
| `<=`              | Less than or equal to               | `id <= 10`                          |
| `IS NULL`         | Check for NULL                      | `id IS NULL`                        |
| `IS NOT NULL`     | Check for non-NULL                  | `id IS NOT NULL`                    |
| `BETWEEN`         | Check a range                       | `salary BETWEEN 50000 AND 80000`    |
| `IN`              | Match multiple values               | `gender IN ('Male', 'Others')`      |
| `AND`             | All conditions must be true         | `age > 20 AND salary > 50000`       |
| `OR`              | At least one condition must be true | `gender = 'Male' OR salary > 65000` |
| `ORDER BY`        | Sort results                        | `ORDER BY salary ASC`               |
| `LIMIT`           | Limit number of rows                | `LIMIT 5`                           |

---

# 🧠 Easy Way to Remember

A basic SQL query can be thought of in this order:

```text
SELECT
   ↓
FROM
   ↓
WHERE
   ↓
ORDER BY
   ↓
LIMIT
```

Example:

```sql
SELECT name, salary
FROM users
WHERE salary > 50000
ORDER BY salary DESC
LIMIT 5;
```

This means:

> **Select** the `name` and `salary` → **from** `users` → **where** salary is greater than 50,000 → **sort** by salary from highest to lowest → **return** only 5 rows.
