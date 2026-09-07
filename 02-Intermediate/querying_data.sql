use startersql;

show tables;

select * from users;

-- Select Only Name and Gender from users
SELECT name, gender from users;

-- To only get list of female employees from table
SELECT * from users where gender='Female';

-- We can use not equal to in 2 diff forms 
-- a. !=
-- b. <>

-- Now only get list of employees who is not equal to female
SELECT * from users where gender<>'Female';

-- List all the employees who's date of birth is less than 1999
SELECT * from users where date_of_birth<'1999-09-09';

-- List all the employees who's id is greater than 10
SELECT * from users where id>10;

-- List all the employees who's id is greater than or equal to 10
SELECT * from users where id>=10;

-- List all the employees who's ID is null
SELECT * from users where id IS null;

-- List all the employees who's ID is not null
SELECT * from users where id IS not null;

-- List all the employees who's date_of_birth is between 1999-09-09 AND 1989-09-09
SELECT * from users where date_of_birth BETWEEN '1989-09-09' AND '1999-09-09';

-- List the gender in men and others
SELECT * from users where gender in ('Male', 'Others');

-- List all the female employees whos salary is greater than 70000
SELECT * from users where gender='Female' AND salary>'70000';

-- List all the employees whos gender is male or salary is greater than 65000
SELECT * from users where gender='Male' OR salary>'65000';

-- List all the employees whos gender is male or salary is greater than 65000 and in ascending order by date_of_birth
SELECT * from users where gender='Male' OR salary>'65000' ORDER BY date_of_birth ASC;


-- List all the employees whos gender is male or salary is greater than 65000 and in descending order by date_of_birth
SELECT * from users where gender='Male' OR salary>'65000' ORDER BY date_of_birth DESC;

-- List all the employees whos salary is less than 60000 limit by 5 (Means only give 5 employees)
SELECT * from users where salary<'60000' LIMIT 5;

