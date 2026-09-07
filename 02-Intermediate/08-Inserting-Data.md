# SQL INSERT — Inserting Data into Tables

Before inserting data, we can select the database we want to work with:

```sql
USE selenium;
```

---

# 1. Check the Existing Table

Let's first check the data currently present in the `users` table.

```sql
SELECT * FROM users;
```

> `SELECT *` retrieves all columns and rows from the table.

---

# 2. Insert Data into All Columns

When inserting data into **all columns**, we can omit the column names and provide values in the same order as the table definition.

```sql
INSERT INTO users
VALUES (
    'Saikiran',
    1,
    'sai@gmail.com',
    'Male',
    '1997-09-03',
    DEFAULT
);
```

Here, `DEFAULT` tells the database to use the column's **default value**.

### ⚠️ Important

When you don't specify column names, the values must be provided in the **exact order of the columns in the table**.

For example, if the table is:

```text
name | id | email | gender | date_of_birth | created_at
```

then the values must follow that same order:

```text
Saikiran
1
sai@gmail.com
Male
1997-09-03
DEFAULT
```

### Check the Inserted Data

```sql
SELECT * FROM users;
```

---

# 3. Insert Data into Specific Columns

Instead of providing values for every column, we can specify exactly which columns we want to insert data into.

For example, if `created_at` already has a default value, we don't need to provide it.

```sql
INSERT INTO users
    (name, id, email, date_of_birth, gender)
VALUES
    ('Sneha', 2, 'sneha@gmail.com', '1999-10-02', 'Female');
```

Since `created_at` is not included, the database will use its **default value**.

### Check the Inserted Data

```sql
SELECT * FROM users;
```

---

# 4. Insert Multiple Rows at Once

We can insert **multiple rows with a single `INSERT` statement**.

If the `id` column is configured as `AUTO_INCREMENT`, we don't need to provide the `id` manually.

```sql
INSERT INTO users
    (name, email, date_of_birth, gender)
VALUES
    ('Abhishek', 'abhi@gmail.com', '1999-07-31', 'Male'),
    ('Niranjan', 'miru@gmail.com', '1997-04-23', 'Male'),
    ('Datta', 'datta@gmail.com', '1999-07-25', 'Male');
```

Here:

* `id` is not specified → the database generates it automatically.
* `created_at` is not specified → the database uses its default value.
* Three rows are inserted using a single `INSERT` statement.

### Check the Inserted Data

```sql
SELECT * FROM users;
```

---

# 📌 Complete Example

```sql
USE selenium;

-- 1. Check the existing data
SELECT * FROM users;


-- 2. Insert data into all columns
-- Values must follow the table's column order
INSERT INTO users
VALUES (
    'Saikiran',
    1,
    'sai@gmail.com',
    'Male',
    '1997-09-03',
    DEFAULT
);


-- Check the inserted data
SELECT * FROM users;


-- 3. Insert data into specific columns
-- created_at is omitted because it has a DEFAULT value
INSERT INTO users
    (name, id, email, date_of_birth, gender)
VALUES
    ('Sneha', 2, 'sneha@gmail.com', '1999-10-02', 'Female');


-- Check the inserted data
SELECT * FROM users;


-- 4. Insert multiple rows at once
-- id is omitted because it is AUTO_INCREMENT
INSERT INTO users
    (name, email, date_of_birth, gender)
VALUES
    ('Abhishek', 'abhi@gmail.com', '1999-07-31', 'Male'),
    ('Niranjan', 'miru@gmail.com', '1997-04-23', 'Male'),
    ('Datta', 'datta@gmail.com', '1999-07-25', 'Male');


-- Check the inserted data
SELECT * FROM users;
```

---

# 🧠 Key Points to Remember

### Insert into all columns

```sql
INSERT INTO users
VALUES (...);
```

The values must match the **column order**.

### Insert into specific columns

```sql
INSERT INTO users (name, email)
VALUES ('Rahul', 'rahul@gmail.com');
```

This is generally **safer and more readable** because you explicitly specify which columns you're inserting into.

### Insert multiple rows

```sql
INSERT INTO users (name, email)
VALUES
    ('Rahul', 'rahul@gmail.com'),
    ('Priya', 'priya@gmail.com'),
    ('Amit', 'amit@gmail.com');
```

### Use a default value

You can explicitly use:

```sql
DEFAULT
```

or omit the column entirely if you want the database to apply its default value.

### Auto-increment ID

If `id` is defined as `AUTO_INCREMENT`:

```sql
id INT AUTO_INCREMENT PRIMARY KEY
```

you normally don't need to provide the `id` when inserting a new row.

The database generates it automatically.
