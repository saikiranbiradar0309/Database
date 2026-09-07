-- Write a query to display all columns and all employees from the users table.
SELECT * FROM users;

-- Display only the name and email of all employees.
SELECT name, email FROM users;

-- Display only the name, gender, and salary of all employees.
SELECT name, gender, salary FROM users;

-- Display the name and date of birth of all employees.
SELECT name, date_of_birth from users;


-- Find all employees whose gender is Male.
SELECT * from users where gender='Male';

-- Find all employees whose gender is Female.
SELECT * from users where gender='Female';

-- Find all employees whose salary is greater than 50,000.
SELECT * from users where salary>'50000';

-- Find all employees whose salary is less than 40,000.
SELECT * from users where salary<'40000';

-- Find all employees whose salary is greater than or equal to 60,000.
SELECT * from users where salary>='60000';

-- Find all employees whose ID is less than 10.
SELECT * from users where id<10;

-- Find all female employees whose salary is greater than 70,000.
SELECT * from users where gender='Female' AND salary>'70000';

-- Find all male employees whose salary is less than 60,000.
SELECT * from users where gender='Male' and salary<'60000';

-- Find all employees whose gender is Male OR salary is greater than 80,000.
SELECT * from users where gender='Male' OR salary>'80000';

-- Find all employees whose gender is Female AND salary is less than 50,000.
SELECT * from users where gender='Female' AND salary<'50000';

-- Find all employees whose salary is greater than 50,000 AND less than 90,000.
SELECT * from users where salary>'50000' AND salary<'90000';

-- Find all employees whose gender is either Male or Others using IN.
SELECT * from users where gender IN ('Male', 'Others');

-- Find all employees whose salary is between 50,000 and 80,000 using BETWEEN.
SELECT * from users where salary BETWEEN 50000 AND 80000;

-- Find all employees whose date of birth is between January 1, 1990 and December 31, 1999.
SELECT * FROM users WHERE date_of_birth BETWEEN '1990-01-01' AND '1999-12-31';

-- Find all employees whose email is NULL.
SELECT * FROM users where email IS NULL;

-- Find all employees whose email is not NULL.
SELECT * FROM users where email IS NOT NULL;

-- Find all employees whose gender is not Female using <>.
SELECT * FROM users where gender<>'Female';

-- Find all employees whose gender is not Male using !=.
SELECT * FROM users where gender!='Male';

-- Display all employees ordered by salary from lowest to highest.
SELECT * FROM users ORDER BY salary ASC;

-- Display all employees ordered by salary from highest to lowest.
SELECT * FROM users ORDER BY salary DESC;

-- Display all employees ordered by date of birth from oldest to youngest.
SELECT * FROM users ORDER BY date_of_birth ASC;

-- Display all employees ordered by date of birth from youngest to oldest.
SELECT * FROM users ORDER BY date_of_birth DESC;

-- Display only female employees, sorted by salary from highest to lowest.
SELECT * FROM users where gender='Female' ORDER BY salary DESC;

-- Display employees whose salary is greater than 50,000, sorted by salary in ascending order.
SELECT * FROM users where salary>'50000' 
ORDER BY salary ASC;

-- Display only the first 5 employees.
SELECT * FROM users LIMIT 5;

-- Display the 5 highest-paid employees.
SELECT * FROM users ORDER BY salary DESC LIMIT 5;

-- Display the 3 lowest-paid employees.
SELECT * FROM users ORDER BY salary ASC LIMIT 3;

-- Display the first 5 female employees when sorted by salary from highest to lowest.
SELECT * FROM users where gender='Female' ORDER BY salary DESC LIMIT 5;

-- Display the first 10 employees whose salary is greater than 60,000.
SELECT * FROM users where salary>'60000' LIMIT 10;

-- Find the 5 highest-paid female employees.
SELECT * from users WHERE gender='Female'  ORDER BY salary DESC LIMIT 5;

-- Find all male employees whose salary is greater than 65,000, and sort them by salary from highest to lowest.
SELECT * from users WHERE gender='Male' AND salary>'65000' ORDER BY salary DESC;

-- Find all employees born between 1990 and 2000 whose salary is greater than 50,000.
SELECT * from users WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-01-01' AND salary>'50000';

-- Find employees whose gender is either Male or Female and whose salary is greater than 60,000.
SELECT * FROM users WHERE gender IN ('Male', 'Female') AND salary>'60000';

-- Find the 10 youngest employees based on date_of_birth.
SELECT * FROM users ORDER BY date_of_birth DESC LIMIT 10;

-- Find the 5 oldest employees based on date_of_birth.
SELECT * FROM users ORDER BY date_of_birth ASC LIMIT 5;

-- Find all employees whose salary is not between 40,000 and 70,000.
SELECT * FROM users WHERE salary<=40000 OR salary>=70000;

-- Find all employees who are not Female and whose salary is greater than 50,000.
SELECT * FROM users WHERE gender<>'Female' and salary>'50000';

-- Find all employees whose email is not NULL, sorted alphabetically by name.
SELECT * FROM users where email IS NOT NULL ORDER BY name;
