# SQL DELETE — Deleting Data

The `DELETE` statement is used to **remove existing rows from a table**.

### Basic Syntax

```sql
DELETE FROM <table_name>
WHERE <condition>;
```

> ⚠️ **Important:** Always be careful with the `WHERE` clause. A `DELETE` without a `WHERE` clause removes **all rows** from the table.

---

# 1. Select the Database

```sql
USE startersql;
```

---

# 2. View the Existing Data

Before deleting data, it's a good practice to check the current contents of the table.

```sql
SELECT *
FROM users;
```

---

# 3. Delete a Specific User

### Delete the user whose ID is `3`

```sql
DELETE FROM users
WHERE id = 3;
```

### Verify

```sql
SELECT *
FROM users;
```

Or, more specifically:

```sql
SELECT *
FROM users
WHERE id = 3;
```

If the delete was successful, this query should return no rows.

---

# 4. Delete Users Based on Salary

### Delete users whose salary is less than ₹65,000

First, check which rows will be affected:

```sql
SELECT *
FROM users
WHERE salary < 65000;
```

Then delete them:

```sql
DELETE FROM users
WHERE salary < 65000;
```

### Verify

```sql
SELECT *
FROM users;
```

> **Good Practice:** Before executing a `DELETE`, run the same condition with `SELECT` first. This allows you to see exactly which rows will be deleted.

---

# 5. Delete Using Multiple Conditions

### Delete users whose:

* Salary is less than ₹80,000
* Gender is not Male

First, check the affected rows:

```sql
SELECT *
FROM users
WHERE salary < 80000
  AND gender <> 'Male';
```

Then delete them:

```sql
DELETE FROM users
WHERE salary < 80000
  AND gender <> 'Male';
```

### Verify

```sql
SELECT *
FROM users
WHERE salary < 80000
  AND gender <> 'Male';
```

If the delete was successful, this should return no matching rows.

---

# 6. Delete All Rows

You can delete **all rows** from a table by omitting the `WHERE` clause.

```sql
DELETE FROM users;
```

This removes all records from `users`, but the **table itself remains**.

The following still exists:

```text
users
├── id
├── name
├── email
├── gender
├── date_of_birth
├── salary
└── created_at
```

Only the data is removed.

> 🚨 **WARNING:** `DELETE FROM users;` affects every row in the table.

---

# 7. Drop the Entire Table

`DROP TABLE` removes the **entire table**, including:

* All rows
* Table structure
* Columns
* Indexes
* Constraints

```sql
DROP TABLE users;
```

After executing this, the `users` table no longer exists.

> 🚨 **Use with extreme caution.** This is very different from `DELETE`.

---

# 🔥 DELETE vs DROP TABLE

| Command             |  Removes Rows | Removes Table Structure | Table Still Exists? |
| ------------------- | ------------: | ----------------------: | ------------------: |
| `DELETE ... WHERE`  | Selected rows |                       ❌ |                   ✅ |
| `DELETE FROM users` |      All rows |                       ❌ |                   ✅ |
| `DROP TABLE users`  |      All rows |                       ✅ |                   ❌ |

### Example

```sql
-- Delete one or more specific rows
DELETE FROM users
WHERE id = 3;
```

```sql
-- Delete ALL rows but keep the table
DELETE FROM users;
```

```sql
-- Delete the entire table
DROP TABLE users;
```

---

# 🛡️ Safe DELETE Practice

Before executing a `DELETE`, first run the corresponding `SELECT`.

### Example

Instead of immediately doing:

```sql
DELETE FROM users
WHERE salary < 65000;
```

First run:

```sql
SELECT *
FROM users
WHERE salary < 65000;
```

Check the returned rows.

If they are the rows you actually want to delete, then execute:

```sql
DELETE FROM users
WHERE salary < 65000;
```

Think of the process as:

```text
SELECT → Check affected rows
           ↓
        DELETE
           ↓
SELECT → Verify deletion
```

---

# 🚨 Never Forget the `WHERE` Clause

### ❌ Dangerous

```sql
DELETE FROM users;
```

This deletes **every row**.

### ✅ Safer

```sql
DELETE FROM users
WHERE id = 3;
```

This deletes only the row matching `id = 3`.

---

# 📌 Complete Example

```sql
-- Select the database
USE startersql;


-- View existing data
SELECT *
FROM users;


-- Delete the user whose ID is 3
DELETE FROM users
WHERE id = 3;


-- Verify
SELECT *
FROM users;


-- Delete users whose salary is less than ₹65,000

-- First check the affected rows
SELECT *
FROM users
WHERE salary < 65000;

-- Delete the affected rows
DELETE FROM users
WHERE salary < 65000;


-- Delete users whose salary is less than ₹80,000
-- and whose gender is not Male

-- First check the affected rows
SELECT *
FROM users
WHERE salary < 80000
  AND gender <> 'Male';

-- Delete the affected rows
DELETE FROM users
WHERE salary < 80000
  AND gender <> 'Male';

-- Verify
SELECT *
FROM users
WHERE salary < 80000
  AND gender <> 'Male';


-- Delete ALL rows but keep the table
-- WARNING: This removes every row
DELETE FROM users;


-- Drop the entire table
-- WARNING: This removes the table structure and all data
DROP TABLE users;
```

---

# 🧠 Quick Cheat Sheet

| Operation                        | SQL                                                            |
| -------------------------------- | -------------------------------------------------------------- |
| Delete a specific row            | `DELETE FROM users WHERE id = 3;`                              |
| Delete rows matching a condition | `DELETE FROM users WHERE salary < 65000;`                      |
| Delete using multiple conditions | `DELETE FROM users WHERE salary < 80000 AND gender <> 'Male';` |
| Delete all rows                  | `DELETE FROM users;`                                           |
| Delete the entire table          | `DROP TABLE users;`                                            |

---

## 🧠 Interview Tip

Remember the difference:

```text
DELETE
  ↓
Removes rows
  ↓
Table remains
```

```text
DROP TABLE
  ↓
Removes rows + table structure
  ↓
Table no longer exists
```

The most important rule:

> **Before running `DELETE`, use `SELECT` with the same `WHERE` condition to verify which rows will be affected.**
