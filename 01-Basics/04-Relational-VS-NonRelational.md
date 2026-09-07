# Relational vs Non-Relational Databases

The easiest way to understand Relational vs Non-Relational databases is to think about how they store data.

## 1. Relational Database

A Relational Database stores data in tables, made up of rows and columns.

Think of it like an Excel spreadsheet.

**Example: `employees` table**

| employee_id | name | department | salary |
|---|---|---|---|
| 101 | Rahul | IT | 50000 |
| 102 | Priya | HR | 60000 |
| 103 | Amit | IT | 55000 |

You can have multiple tables and connect them using relationships.

For example:

```
Employees Table
       ↓
Department Table
       ↓
Projects Table
```

These relationships are usually created using **Primary Keys** and **Foreign Keys**.

### Examples

- MySQL
- PostgreSQL
- Oracle
- Microsoft SQL Server

Relational databases generally use SQL to interact with the data.

```sql
SELECT * FROM employees
WHERE department = 'IT';
```

## 2. Non-Relational Database

A Non-Relational Database does not require data to be stored in traditional tables with fixed rows and columns.

It is often called a **NoSQL database**.

Data can be stored as:

- Documents
- Key-value pairs
- Graphs
- Wide-column structures

For example, a document database such as **MongoDB** could store an employee like this:

```json
{
  "employee_id": 101,
  "name": "Rahul",
  "department": "IT",
  "salary": 50000
}
```

Another employee could have additional information:

```json
{
  "employee_id": 102,
  "name": "Priya",
  "department": "HR",
  "salary": 60000,
  "skills": ["Java", "Selenium"]
}
```

Notice that the second document has skills, while the first one doesn't.

That's one of the important characteristics of many NoSQL databases: **the structure can be more flexible**.

### Examples

- MongoDB
- Redis
- Cassandra
- Amazon DynamoDB
- Neo4j

## ⚖️ Relational vs Non-Relational

| Feature | Relational | Non-Relational |
|---|---|---|
| **Data structure** | Tables | Documents, key-value, graphs, etc. |
| **Schema** | Usually predefined/fixed | Usually more flexible |
| **Relationships** | Strong support | Usually less dependent on relationships |
| **Query language** | Mainly SQL | Depends on database |
| **Scaling** | Traditionally vertical; horizontal scaling also possible | Often designed with horizontal scaling in mind |
| **Data consistency** | Strong consistency commonly supported | Depends on the database; many support tunable/eventual consistency |
| **Best for** | Structured, related data | Flexible or rapidly changing data |
| **Examples** | MySQL, PostgreSQL, Oracle | MongoDB, Redis, Cassandra |

## 🔥 Simple real-world example

Imagine you're building an e-commerce application.

### Relational approach

You might have:

```
CUSTOMERS
---------
Customer_ID
Name
Email

ORDERS
---------
Order_ID
Customer_ID
Order_Date

PRODUCTS
---------
Product_ID
Name
Price
```

And connect them:

```
Customer
   ↓
Orders
   ↓
Products
```

This is very useful when you have lots of relationships between data.

### Non-relational approach

You could store an entire order as a document:

```json
{
  "order_id": 5001,
  "customer": {
    "name": "Rahul",
    "email": "rahul@example.com"
  },
  "products": [
    {
      "name": "Laptop",
      "price": 60000
    },
    {
      "name": "Mouse",
      "price": 1000
    }
  ]
}
```

Here, related information can be stored together in one document.

## 🧠 The easiest way to remember

**Relational = Tables + Relationships**

```
Table
 ├── Row
 ├── Row
 └── Row
```

*Multiple tables can be related*

**Non-Relational = Flexible data structures**

```
Document
 ├── name
 ├── email
 ├── skills
 └── orders
```

## 💡 Interview answer

If the interviewer asks:

> "What is the difference between relational and non-relational databases?"

You can say:

> "A relational database stores structured data in tables with predefined schemas and uses relationships between tables. Examples are MySQL, PostgreSQL, and Oracle. A non-relational or NoSQL database stores data in flexible structures such as documents, key-value pairs, or graphs. It is generally more flexible for changing data models and is commonly used in applications that require large-scale distributed storage. MongoDB, Redis, and Cassandra are examples."

> [!IMPORTANT]
> Don't say "SQL databases cannot scale horizontally" or "NoSQL databases don't support relationships" in an interview. Those are oversimplifications. Modern relational databases can scale horizontally, and some NoSQL databases provide relationship capabilities—the key differences are data model, schema, consistency/transaction model, and typical scaling patterns.
