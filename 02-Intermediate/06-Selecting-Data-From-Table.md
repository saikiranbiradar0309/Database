Selecting data from tables

1. Select all columns

SELECT * FROM <table_name>;
SELECT * FROM users;

This will fetch every column and every row from the users table.


2. Select Specific Columns

SELECT name, email FROM <table_name>;
SELECT name, email FROM users;

This will only fetch the name and email columns from the users table.


3. Renaming an existing table

RENAME TABLE <table_name> To <new_table_name>;
RENAME TABLE users TO customers;


4. To rename it back

RENAME TABLE customers TO users;