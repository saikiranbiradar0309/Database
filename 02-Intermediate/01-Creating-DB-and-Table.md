# Creating a Database and Table

## 1. Create a Database

To create a database, we use the `CREATE DATABASE` statement:

```sql
CREATE DATABASE <name>;
```

**Example:**

```sql
CREATE DATABASE selenium;
```

> [!NOTE]
> Don't forget to add a semicolon (`;`) at the end of the query!

---

## 2. Set a Database as Default Schema

In our case, we are using the `selenium` database. We need to set it as the default schema so that MySQL knows to run queries in this specific database.

### Using a Query:

```sql
USE <database_name>;
```

**Example:**

```sql
USE selenium;
```

### From the UI (e.g., MySQL Workbench):

1. On the left sidebar, right-click on your database name.
2. Click on **"Set as Default Schema"**.

> [!NOTE]
> We are setting the "Default Schema" to tell MySQL to run our queries in this database only.

---

## 3. Create a Table

To create a table, use the `CREATE TABLE` statement:

```sql
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    gender ENUM('Male', 'Female', 'Others'),
    date_of_birth DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

---

## 4. Check if the Table is Created (View All Data)

To view all data and verify the table structure:

```sql
SELECT * FROM <table_name>;
```

**Example:**

```sql
SELECT * FROM users;
```

---

## 5. Select Specific Columns from a Table

To get only specific columns (e.g., `id` and `email`) from the table:

```sql
SELECT id, email FROM <table_name>;
```

**Example:**

```sql
SELECT id, email FROM users;
```