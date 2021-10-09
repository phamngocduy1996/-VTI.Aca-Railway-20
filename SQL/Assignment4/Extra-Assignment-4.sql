DROP DATABASE IF EXISTS EX_Ass_4;
CREATE DATABASE IF NOT EXISTS EX_Ass_4;
USE EX_Ass_4;
CREATE TABLE Department (
Department_Number 	INT AUTO_INCREMENT PRIMARY KEY,
Department_Name 	varchar(50) NOT NULL
);

CREATE TABLE Employee_Table (
Employee_Number 	INT AUTO_INCREMENT PRIMARY KEY,
Employee_Name 		varchar(50) NOT NULL,
Department_Number 	INT,
FOREIGN KEY (Department_Number) REFERENCES Department (Department_Number) 
);

CREATE TABLE Employee_Skill_Table (
Employee_Number 	INT,
Skill_Code 			varchar(50) NOT NULL,
Date_Registered 	DATE,
FOREIGN KEY (Employee_Number) REFERENCES Employee_Table (Employee_Number)
);


-- Question 2
INSERT INTO Department (Department_Name) 
VALUES ('IT Manager'),
		('Developer'),
        ('Database Administrator'),
        ('Computer System Analysist'),
        ('Software Testers'),
        ('IT Support Manage'),
        ('Junior Software Engineer'),
        ('Computer Programmer'),
        ('Computer Support Specialis'),
        ('Computer Network Architects');



INSERT INTO Employee_Table  (Employee_Name, Department_Number)
VALUES ('Nguyen Dinh A',1),
		('Tran Van B',2),
		('Le Hao C',6),
        ('Vo Le D',2),
        ('Pham Minh E',3),
        ('Tran Thi F',4),
        ('Ngo Ba G',5),
        ('Nguyen LE H',7),
        ('Tran Dinh J',9),
        ('Tran Duc Q',10);
        INSERT INTO Employee_Table  (Employee_Name, Department_Number)
VALUES ('Vu Thi K','2');
INSERT INTO Employee_Skill_Table (Employee_Number, Skill_Code, Date_Registered)
VALUES (1,'Java', '2020-10-8'),
(1,'Python', '2020-12-18'),
(1,'PHP', '2021-08-28'),
(3,'Java', '2021-10-08'),
(4,'Ruby', '2021-10-08'),
(5,'Java', '2021-10-08'),
(5,'Python', '2021-10-10'),
(6,'Java', '2021-10-02'),
(7,'Java', '2021-10-19'),
(8,'Ruby', '2021-10-20'),
(9,'Python', '2021-11-21'),
(10,'PHP', '2021-12-10'),
(11,'Python', '2021-12-15');

-- Question 3
SELECT
a.Employee_Number,
a.Employee_Name,
b.Skill_Code
FROM employee_table a
LEFT JOIN employee_skill_table b ON a.Employee_Number = b.Employee_Number
WHERE b.Skill_Code = 'Java';

-- Question 4 
SELECT 
a.Department_Number,
a.Department_Name,
COUNT(b.Department_Number) as total
FROM department a
LEFT JOIN employee_table b ON a.Department_Number = b.Department_Number
GROUP BY
a.Department_Number
HAVING COUNT(b.Department_Number) >= 3;

-- Question 5
SELECT 
a.Department_Name,
b.Employee_Name
FROM department a
RIGHT JOIN employee_table b ON a.Department_Number = b.Department_Number
GROUP BY
b.Employee_Name
ORDER BY 
a.Department_Number;

-- Question 6
SELECT
a.Employee_Name,
COUNT(b.Employee_Number) as total
FROM employee_table a
LEFT JOIN employee_skill_table b ON a.Employee_Number = b.Employee_Number
GROUP BY 
a.Employee_Name
HAVING COUNT(b.Employee_Number) > 1;





        

        		
