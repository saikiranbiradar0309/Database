# What is a Query?

A query is simply a request you give to a database to get or manipulate data.

Think of it like asking a question to the database.

## 📝 Simple example

Suppose we have a `students` table:

| id | name | age | city |
|---|---|---|---|
| 1 | Rahul | 25 | Bangalore |
| 2 | Priya | 24 | Mumbai |
| 3 | Amit | 27 | Delhi |

If you want to get all students, you write a query:

```sql
SELECT * FROM students;
```

This means:

> "Database, give me all the data from the students table."

## 🔍 Another example

If you want only Rahul's information:

```sql
SELECT * FROM students
WHERE name = 'Rahul';
```

The database searches for Rahul and returns his information.

## 🛠️ Queries aren't only for retrieving data

You can use queries to:

- **SELECT**  → Get data
- **INSERT**  → Add data
- **UPDATE**  → Change data
- **DELETE**  → Remove data

For example:

```sql
INSERT INTO students (name, age, city)
VALUES ('Kiran', 26, 'Bangalore');
```

This tells the database:

> "Add a new student named Kiran."

## 🧠 Easy way to remember

- **Database** = where the data is stored
- **Query** = the instruction/question you give to the database
- **SQL** = the language used to write many database queries

For example:

```
You
 ↓
SQL Query
 ↓
Database
 ↓
Result
```

In your Selenium automation, queries become useful when you need to verify whether the data entered through the UI was correctly stored in the database.
