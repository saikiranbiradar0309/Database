# SQL Data Types

In SQL, a **data type** tells the database what kind of value a column is allowed to store.

For example:

* A person's **age** should be a number.
* A person's **name** should be text.
* A person's **salary** should be a precise decimal value.
* A person's **date of birth** should be a date.

```text
name    → VARCHAR
age     → INT
salary  → DECIMAL
DOB     → DATE
```

> **Note:** The exact data types available vary slightly between databases such as **MySQL, PostgreSQL, Oracle, and SQL Server**, but the major categories are similar.

---

## 1. Numeric Data Types

Numeric data types are used to store numbers.

### `INT`

Used to store **whole numbers**.

```sql
age INT
```

Examples:

```text
25
30
100
-10
```

---

### `BIGINT`

Used to store **very large whole numbers**.

```sql
employee_id BIGINT
```

Useful when `INT` isn't large enough for the required values.

Example:

```text
9876543210
```

---

### `DECIMAL`

Used when **exact decimal precision** is important, especially for financial values such as salaries, prices, and account balances.

```sql
salary DECIMAL(10,2)
```

Examples:

```text
50000.50
125000.75
```

#### Understanding `DECIMAL(10,2)`

```text
DECIMAL(total_digits, decimal_digits)
```

* `10` → Total number of digits
* `2` → Number of digits after the decimal point

For example:

```text
12345678.90
```

has **10 digits in total**, with **2 digits after the decimal point**.

> **Interview Tip:** Use `DECIMAL` rather than `FLOAT` when exact values are required, especially for money.

---

### `FLOAT` / `REAL`

Used for **approximate decimal numbers**.

```sql
temperature FLOAT
```

Examples:

```text
36.5
98.6
```

Floating-point numbers can have rounding and precision issues because they are stored approximately.

> **Important:** For financial values, `DECIMAL` is generally preferred over `FLOAT`.

---

# 2. Character / String Data Types

String data types are used to store **text**.

### `CHAR`

Used to store a **fixed-length string**.

```sql
gender CHAR(1)
```

Examples:

```text
M
F
```

Another example:

```sql
country_code CHAR(3)
```

This is designed for values with a fixed length of 3 characters.

---

### `VARCHAR`

Used to store **variable-length strings**.

```sql
name VARCHAR(100)
```

Examples:

```text
Rahul
Priya
Amit Kumar
```

`VARCHAR` is one of the most commonly used SQL data types for storing text.

---

### `TEXT`

Used to store **larger amounts of text**.

```sql
description TEXT
```

Example:

```text
This is a long product description...
```

The exact size and behavior of `TEXT` can vary between database systems.

---

# 3. Date and Time Data Types

Date and time data types are used to store dates, times, or both.

### `DATE`

Stores **only the date**.

```sql
dob DATE
```

Example:

```text
1997-05-15
```

---

### `TIME`

Stores **only the time**.

```sql
login_time TIME
```

Example:

```text
10:30:45
```

---

### `DATETIME`

Stores **date + time**.

```sql
created_at DATETIME
```

Example:

```text
2026-09-07 10:30:45
```

> Availability and behavior of `DATETIME` vary between database systems.

---

### `TIMESTAMP`

Also represents a **date and time**, but its behavior and features depend on the database system.

It is commonly used for tracking when records are created or updated.

```sql
created_at TIMESTAMP
updated_at TIMESTAMP
```

Example:

```text
2026-09-07 10:30:45
```

> **Interview Tip:** `TIMESTAMP` is frequently seen in columns such as `created_at` and `updated_at`.

---

# 4. Boolean Data Type

Used to represent **true/false** values.

```sql
is_active BOOLEAN
```

Possible values:

```text
TRUE
FALSE
```

Example:

| `is_active` |
| ----------- |
| `TRUE`      |
| `FALSE`     |
| `TRUE`      |

> **Note:** The internal representation and exact behavior of `BOOLEAN` can differ between database systems.

---

# 5. Binary Data Types

Binary data types are used to store **raw binary data / bytes**.

Common examples include:

```text
BINARY
VARBINARY
BLOB
```

### `BLOB`

`BLOB` stands for **Binary Large Object**.

It can be used for storing binary data such as:

* Images
* Documents
* Audio
* Other raw binary files

Example:

```sql
profile_image BLOB
```

> **Real-world Tip:** In many modern applications, large files are stored in object storage, while the database stores a URL or file path instead.

---

# 6. JSON Data Type

Modern databases such as **MySQL** and **PostgreSQL** provide JSON-related data types and functionality.

Example:

```sql
user_details JSON
```

You could store data such as:

```json
{
  "name": "Rahul",
  "age": 29,
  "skills": ["Java", "Selenium"]
}
```

JSON is useful when dealing with **semi-structured data**.

For example, different users might have different sets of attributes:

```json
{
  "name": "Rahul",
  "skills": ["Java", "Selenium"]
}
```

```json
{
  "name": "Priya",
  "skills": ["Python", "SQL", "API Testing"],
  "experience": 5
}
```

---

# 7. Other Specialized Data Types

Some database systems provide additional specialized data types.

## `ENUM`

`ENUM` allows a column to contain **one value from a predefined list**.

Example:

```sql
status ENUM('ACTIVE', 'INACTIVE', 'BLOCKED')
```

Possible values:

```text
ACTIVE
INACTIVE
BLOCKED
```

> **Note:** `ENUM` support and implementation vary between databases.

---

## `UUID`

`UUID` is used to represent **Universally Unique Identifiers**.

Example:

```text
550e8400-e29b-41d4-a716-446655440000
```

UUID support and storage options vary between database systems.

---

## Spatial Data Types

Spatial data types are used for **geographical and geometric information**.

Common examples include:

```text
POINT
LINESTRING
POLYGON
```

They are particularly useful for:

* Maps
* Location-based applications
* GIS systems
* Distance calculations
* Geographical searches

---

# 📌 SQL Data Types — Quick Cheat Sheet

| Data Type   | Used For                            | Example               |
| ----------- | ----------------------------------- | --------------------- |
| `INT`       | Whole numbers                       | `25`                  |
| `BIGINT`    | Very large integers                 | `9876543210`          |
| `DECIMAL`   | Exact decimal values                | `50000.50`            |
| `FLOAT`     | Approximate decimal values          | `36.5`                |
| `CHAR`      | Fixed-length text                   | `"M"`                 |
| `VARCHAR`   | Variable-length text                | `"Rahul"`             |
| `TEXT`      | Large text                          | Long description      |
| `DATE`      | Date                                | `2026-09-07`          |
| `TIME`      | Time                                | `10:30:00`            |
| `DATETIME`  | Date + time                         | `2026-09-07 10:30:00` |
| `TIMESTAMP` | Date/time with DB-specific behavior | `2026-09-07 10:30:00` |
| `BOOLEAN`   | True/false                          | `TRUE`                |
| `BLOB`      | Binary data                         | Raw bytes             |
| `JSON`      | JSON/semi-structured data           | `{"name":"Rahul"}`    |

---

# 🧠 SQL Data Types to Remember for Interviews

If you're starting SQL, focus heavily on these data types first:

| Data Type                | Remember It As           |
| ------------------------ | ------------------------ |
| `INT`                    | Numbers                  |
| `BIGINT`                 | Very large numbers       |
| `VARCHAR`                | Text                     |
| `DECIMAL`                | Money / precise decimals |
| `DATE`                   | Date                     |
| `DATETIME` / `TIMESTAMP` | Date + time              |
| `BOOLEAN`                | True / false             |
| `TEXT`                   | Large text               |
| `JSON`                   | JSON data                |

### Easy Memory Trick

```text
INT          → Whole numbers
BIGINT       → Very large numbers
DECIMAL      → Exact decimals / Money
FLOAT        → Approximate decimals
CHAR         → Fixed-length text
VARCHAR      → Variable-length text
TEXT         → Large text
DATE         → Date
TIME         → Time
DATETIME     → Date + Time
TIMESTAMP    → Date + Time
BOOLEAN      → TRUE / FALSE
BLOB         → Binary data
JSON         → JSON data
```

> **Key takeaway:** For everyday SQL development and testing, the most commonly encountered types are **`INT`, `VARCHAR`, `DECIMAL`, `DATE`, `TIMESTAMP`/`DATETIME`, `BOOLEAN`, `TEXT`, and `JSON`**.
