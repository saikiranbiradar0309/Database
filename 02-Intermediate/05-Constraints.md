# SQL Constraints

## What are Constraints in SQL?

**Constraints** are rules applied to columns in a database table to control what kind of data can be stored.

They help maintain **data accuracy, consistency, and integrity** in the database.

### Simple Example

Imagine a student table:

```sql
CREATE TABLE students (
    student_id INT,
    name VARCHAR(100),
    age INT
);
```

Without constraints, invalid or duplicate data could potentially be inserted.

With constraints, we can tell the database:

> "This column cannot be empty."

> "This value must be unique."

> "This column must contain a valid reference to another table."

---

# Types of SQL Constraints

The most commonly used SQL constraints are:

1. `NOT NULL`
2. `UNIQUE`
3. `PRIMARY KEY`
4. `FOREIGN KEY`
5. `CHECK`
6. `DEFAULT`

---

## 1. NOT NULL

`NOT NULL` ensures that a column **cannot contain NULL values**.

### Example

```sql
CREATE TABLE students (
    student_id INT,
    name VARCHAR(100) NOT NULL
);
```

Here, `name` must have a value.

This is valid:

```sql
INSERT INTO students (student_id, name)
VALUES (101, 'Rahul');
```

This is not valid:

```sql
INSERT INTO students (student_id, name)
VALUES (102, NULL);
```

### Simple meaning

> **NOT NULL = This field is mandatory.**

---

# 2. UNIQUE

`UNIQUE` ensures that all values in a column are **different**.

### Example

```sql
CREATE TABLE students (
    student_id INT,
    email VARCHAR(100) UNIQUE
);
```

You can have:

```text
rahul@gmail.com
priya@gmail.com
amit@gmail.com
```

But you cannot have:

```text
rahul@gmail.com
rahul@gmail.com
```

because the email must be unique.

### Simple meaning

> **UNIQUE = Duplicate values are not allowed.**

---

# 3. PRIMARY KEY

A `PRIMARY KEY` is used to **uniquely identify each row in a table**.

A primary key must be:

* Unique
* Not NULL

### Example

```sql
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT
);
```

Example data:

| student_id | name  | age |
| ---------: | ----- | --: |
|        101 | Rahul |  25 |
|        102 | Priya |  24 |
|        103 | Amit  |  26 |

Each student has a unique `student_id`.

You cannot have:

```text
101 Rahul
101 Amit
```

because `student_id` is the primary key.

### Simple meaning

> **PRIMARY KEY = Unique identity of each row.**

### Important

A table normally has **one primary key constraint**, but that key can consist of **multiple columns**. This is called a **composite primary key**.

---

# 4. FOREIGN KEY

A `FOREIGN KEY` is used to create a **relationship between two tables**.

It usually references the **primary key of another table**.

### Example

Suppose we have a `departments` table:

```sql
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);
```

Now we create an `employees` table:

```sql
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    department_id INT,
    FOREIGN KEY (department_id)
        REFERENCES departments(department_id)
);
```

Here:

```text
departments
------------
department_id
      ↑
      |
      |
employees
------------
department_id
```

The `department_id` in `employees` is a **foreign key** that refers to `department_id` in `departments`.

This prevents an employee from being assigned to a department that doesn't exist, subject to the database's constraint behavior.

### Simple meaning

> **FOREIGN KEY = Connects two tables and maintains referential integrity.**

---

# 5. CHECK

`CHECK` is used to ensure that a value satisfies a specific condition.

### Example

```sql
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT CHECK (age >= 18)
);
```

Now:

```sql
INSERT INTO students
VALUES (101, 'Rahul', 25);
```

is valid.

But:

```sql
INSERT INTO students
VALUES (102, 'Amit', 15);
```

will fail because the condition is:

```text
age >= 18
```

### Another example

```sql
salary DECIMAL(10,2) CHECK (salary > 0)
```

This ensures that salary must be greater than zero.

### Simple meaning

> **CHECK = Data must satisfy a specific condition.**

---

# 6. DEFAULT

`DEFAULT` provides a **default value** when no value is supplied for that column during insertion.

### Example

```sql
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100),
    status VARCHAR(20) DEFAULT 'ACTIVE'
);
```

Now if we insert:

```sql
INSERT INTO employees (employee_id, name)
VALUES (101, 'Rahul');
```

The database can automatically use:

```text
employee_id → 101
name        → Rahul
status      → ACTIVE
```

because `ACTIVE` is the default value.

### Simple meaning

> **DEFAULT = Use this value when no value is provided.**

---

# SQL Constraints Summary

| Constraint    | Purpose                              |
| ------------- | ------------------------------------ |
| `NOT NULL`    | Prevents NULL values                 |
| `UNIQUE`      | Prevents duplicate values            |
| `PRIMARY KEY` | Uniquely identifies each row         |
| `FOREIGN KEY` | Creates relationships between tables |
| `CHECK`       | Ensures a condition is satisfied     |
| `DEFAULT`     | Provides a default value             |

---

# Real-World Example

Let's create an employee table using multiple constraints:

```sql
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE,
    age INT CHECK (age >= 18),
    status VARCHAR(20) DEFAULT 'ACTIVE'
);
```

Here:

```text
employee_id → PRIMARY KEY
name        → NOT NULL
email       → UNIQUE
age         → CHECK
status      → DEFAULT
```

So the database automatically enforces these rules.

---

# Easy Way to Remember

```text
NOT NULL    → Cannot be empty
UNIQUE      → Cannot be duplicate
PRIMARY KEY → Unique identity
FOREIGN KEY → Connects tables
CHECK       → Must satisfy a condition
DEFAULT     → Automatically provides a value
```

## Interview Answer

> **SQL constraints are rules applied to columns in a database table to maintain data accuracy, consistency, and integrity. The commonly used constraints are NOT NULL, UNIQUE, PRIMARY KEY, FOREIGN KEY, CHECK, and DEFAULT.**
