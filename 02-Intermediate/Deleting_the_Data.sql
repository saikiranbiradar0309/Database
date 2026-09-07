-- DELETING THE DATA

USE startersql;

SELECT * FROM users;


-- DELETE the user whos id=3
DELETE from users WHERE id=3;
SELECT * FROM users;


-- IMPORTANT: NEVER DELETE WIHTOUT WHERE CLAUSE

-- DELETE the users whos salary is less than 65000
SELECT * from users;

DELETE from users
WHERE salary<65000;



-- DELETE the users whos salary is less than 80000 and They are not Male
SELECT * from users WHERE salary<80000 AND gender<>'Male';

DELETE FROM users 
WHERE salary<80000 AND
gender<>'Male';

SELECT * from users WHERE salary<80000 AND gender<>'Male';


-- Delete All Rows (but keep table structure)
DELETE FROM users;


-- Drop the Entire Table (use with caution)
DROP TABLE users;

