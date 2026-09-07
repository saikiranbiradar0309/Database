select * from users;

-- This will only fetch the name and email columns from the users table.
select id, email from users;

-- Renaming an existing table
RENAME TABLE users TO customers;

-- Lets Verify
SHOW TABLES;

-- To Rename back from customers to users
RENAME TABLE customers TO users;

-- Again You can Verify using
SHOW TABLES;