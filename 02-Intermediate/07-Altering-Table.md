# ALTER TABLE

The `ALTER TABLE` statement is used to **modify an existing table**.

You can use it to:

* Add a new column
* Drop an existing column
* Modify a column's data type
* Move a column to a different position *(MySQL-specific)*

> **Note:** SQL syntax can vary between database systems. The `MODIFY COLUMN`, `AFTER`, and `FIRST` syntax shown below is primarily **MySQL syntax**.

---

## 1. Add a Column

### Syntax

```sql
ALTER TABLE <table_name>
ADD COLUMN <column_name> <column_type>;
```

### Example

Add a `location` column:

```sql
ALTER TABLE users
ADD COLUMN location VARCHAR(100);
```

Add an `is_active` column with a default value:

```sql
ALTER TABLE users
ADD COLUMN is_active BOOLEAN DEFAULT TRUE;
```

### Result

The `users` table will now contain the new columns:

```text
users
├── id
├── name
├── email
├── location
└── is_active
```

---

# 2. Drop a Column

The `DROP COLUMN` clause is used to **remove an existing column** from a table.

### Syntax

```sql
ALTER TABLE <table_name>
DROP COLUMN <column_name>;
```

### Example

```sql
ALTER TABLE users
DROP COLUMN is_active;
```

> ⚠️ **Warning:** Dropping a column permanently removes the column and its stored data. Make sure you really want to remove it.

---

# 3. Modify a Column's Data Type

In **MySQL**, you can use `MODIFY COLUMN` to change a column's definition.

### Syntax

```sql
ALTER TABLE <table_name>
MODIFY COLUMN <column_name> <new_data_type>;
```

### Example

Change the `name` column from its current definition to `VARCHAR(150)`:

```sql
ALTER TABLE users
MODIFY COLUMN name VARCHAR(150);
```

For example, if the column was previously:

```sql
name VARCHAR(100)
```

you can change it to:

```sql
name VARCHAR(150)
```

---

# 4. Move a Column After Another Column

In **MySQL**, you can use `AFTER` to change the position of a column.

For example, suppose you have:

```text
users
├── id
├── name
└── email
```

You want `email` to appear immediately after `id`.

### Syntax

```sql
ALTER TABLE <table_name>
MODIFY COLUMN <column_name> <column_definition> AFTER <existing_column>;
```

### Example

```sql
ALTER TABLE users
MODIFY COLUMN email VARCHAR(100) AFTER id;
```

The column order becomes:

```text
users
├── id
├── email
└── name
```

> **Important:** When using `MODIFY COLUMN`, you should specify the column's definition (`VARCHAR(100)`, etc.). Don't accidentally change other attributes such as `NOT NULL`, `DEFAULT`, or `UNIQUE` if they already exist.

---

# 5. Move a Column to the First Position

In **MySQL**, you can use `FIRST` to move a column to the beginning of the table.

### Syntax

```sql
ALTER TABLE <table_name>
MODIFY COLUMN <column_name> <column_definition> FIRST;
```

### Example

Move `name` to the first position:

```sql
ALTER TABLE users
MODIFY COLUMN name VARCHAR(150) FIRST;
```

Before:

```text
users
├── id
├── email
└── name
```

After:

```text
users
├── name
├── id
└── email
```

---

# 📌 Quick Cheat Sheet

| Operation         | MySQL Syntax    | Purpose                          |
| ----------------- | --------------- | -------------------------------- |
| Add column        | `ADD COLUMN`    | Add a new column                 |
| Drop column       | `DROP COLUMN`   | Remove a column                  |
| Modify column     | `MODIFY COLUMN` | Change a column definition       |
| Move after column | `AFTER`         | Move column after another column |
| Move to first     | `FIRST`         | Move column to the beginning     |

### Examples

```sql
-- Add a column
ALTER TABLE users
ADD COLUMN location VARCHAR(100);

-- Add a column with a default value
ALTER TABLE users
ADD COLUMN is_active BOOLEAN DEFAULT TRUE;

-- Drop a column
ALTER TABLE users
DROP COLUMN is_active;

-- Modify a column
ALTER TABLE users
MODIFY COLUMN name VARCHAR(150);

-- Move a column after another column
ALTER TABLE users
MODIFY COLUMN email VARCHAR(100) AFTER id;

-- Move a column to the first position
ALTER TABLE users
MODIFY COLUMN name VARCHAR(150) FIRST;
```

---

## 🧠 Interview Tip

Remember:

```text
ALTER TABLE
    ↓
Modify existing table

ADD COLUMN
    ↓
Add a column

DROP COLUMN
    ↓
Remove a column

MODIFY COLUMN
    ↓
Change column definition (MySQL)

AFTER
    ↓
Move column after another column (MySQL)

FIRST
    ↓
Move column to the first position (MySQL)
```

> **Note:** Column ordering is usually not important to application logic. `AFTER` and `FIRST` are mainly useful for organizing the table definition when working directly with the database.
