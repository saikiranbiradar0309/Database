USE selenium;

-- Lets first check what all cloumns we have in which order
SELECT * from users;

-- Insert Data into Columns
INSERT INTO users VALUES 
('Saikiran',1,'sai@gmail.com','Male','1997-09-03',DEFAULT);

-- Lets check whether the data is inserted or not
SELECT * from users;

-- INSERT DATA into Specific COlumns (Like here we dont need created_at because anyhow it will take default value)
INSERT INTO users (name, id, email, date_of_birth, gender) VALUES
('Sneha', 2, 'sneha@gmail.com', '1999-10-02', 'Female');

-- Lets check whether the data is inserted or not
SELECT * from users;


-- WE CAN INSERT MULTIPLE VALUES AT ONCE (HERE we DIDNT TOOK ID as IT WILL AUTO INCREMENT)
INSERT INTO users (name, email, date_of_birth, gender) VALUES 
('Abhishek','abhi@gmail.com', '1999-07-31', 'Male'),
('Niranjan','miru@gmail.com', '1997-04-23', 'Male'),
('Datta','datta@gmail.com', '1999-07-25', 'Male');

-- Lets check whether the data is inserted or not
SELECT * from users;