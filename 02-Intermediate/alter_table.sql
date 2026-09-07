-- ADD Another Column to our Existing Table

-- Lets Verify first what all columns we have
SELECT * from users;

-- Lets add a Column called "is_active" in our existing table
ALTER TABLE users ADD COLUMN is_active BOOLEAN DEFAULT true;

-- Now Lets verify where the new column has been created inside our table or not
SELECT * from users;

-- Drop a Column
ALTER TABLE users DROP is_active;

-- Now lets verify if the column is dropped or not
SELECT * FROM users;

-- Modify a Column Type
ALTER TABLE users MODIFY COLUMN name VARCHAR(150);

-- I want to have email after id (Like moving a column)
ALTER TABLE users MODIFY COLUMN email VARCHAR(100) AFTER id;

-- Lets verify if the column has moved or not
SELECT * FROM users;

-- TO move a COLUMN to FIRST place
ALTER TABLE users MODIFY COLUMN name VARCHAR(150) FIRST;