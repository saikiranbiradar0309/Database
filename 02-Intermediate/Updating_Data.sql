-- UPDATING THE DATA

USE startersql;


SELECT * FROM users;

-- UPDATING the salary of employee whos ID is 1
UPDATE users SET salary = 68000 WHERE id = 1;

-- VERIFY if salary is updated or not
SELECT * FROM users;

-- WE can also UPDATE 2 or more than that records 
UPDATE users SET salary = 70000, email='aarav@cloud.com' WHERE id=1;

-- VERIFY if salary and email is updated or not
SELECT * FROM users;

-- NOTE: ALWAYS USE WHERE CLAUSE TO UPDATE THE TABLE ELSE EVERY DATA IN THE TABLE FOR THAT PARTICULAR ROW WILL BE UPDATED

-- Update the salary of user with id=5 to 70000
UPDATE users SET salary=70000 WHERE id=5;

SELECT * FROM users where id=5;


-- Change name of the user with email aisha@example.com to Aisha Khan
UPDATE users SET name='Aisha Khan' WHERE email='aisha@example.com';
SELECT * FROM users WHERE email='aisha@example.com';

-- Increase salary by ₹10,000 for all users whose salary is less than ₹60,000.
SELECT * FROM users where salary<60000;

UPDATE users 
SET salary = salary + 10000 
WHERE salary < 60000;


-- Set the gender of user Ishaan to Other 
SELECT * FROM users WHERE name='Ishaan';

UPDATE users
SET gender='Other'
WHERE name='Ishaan';


-- Reset salary of all users to ₹50,000 (Careful - affects all rows).
SELECT * FROM users;

UPDATE users SET salary=50000;



