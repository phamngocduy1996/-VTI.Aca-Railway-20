USE sql_lesson_3;
-- Question 2
SELECT * FROM department;
-- Question 3
SELECT DepartmentID FROM department WHERE DepartmentName = 'Sale';
-- Question 4
SELECT * FROM `account` ORDER BY char_length(FullName) DESC LIMIT 1 ;
SELECT Max(char_length(FullName)) FROM `account`;
SELECT * FROM `account` WHERE char_length(FullName) = 15;
-- Question 5
SELECT * FROM `account` WHERE DepartmentID = 3  ORDER BY length(FullName) DESC LIMIT 1 ;
SELECT MAX(char_length(FullName)) FROM `account` WHERE DepartmentID = 3;
SELECT * FROM `account` WHERE char_length(FullName)= 15 AND DepartmentID = 3;

-- Question 6
SELECT GroupName, CreateDate FROM `group` WHERE CreateDate < '2019-12-20';
-- Question 7
SELECT QuestionID, COUNT(AnswerID) FROM answer GROUP BY QuestionID HAVING COUNT(AnswerID) >= 4;

-- Question 8
SELECT ExamID FROM exam WHERE Duration > 3600 AND CreateDate < '2019-12-20';
-- Question 9
SELECT * FROM `Group` ORDER BY CreateDate DESC LIMIT 5;
-- Question 10
SELECT count(AccountID) FROM `account` WHERE DepartmentID = 2;
-- Question 11
SELECT * FROM `account` WHERE FullName LIKE('D%o');
-- Question 12
SELECT * FROM testingsystem.exam;
COMMIT;
DELETE FROM exam WHERE CreateDate < '2019-12-20';
ROLLBACK;
-- Question 13
SELECT * FROM testingsystem.question;
DELETE FROM question WHERE Content LIKE('Cau hoi%');
-- Question 14
UPDATE account SET FullName = 'Nguyen Ba Loc', Email = 'loc.nguyenba@vti.com.vn' WHERE AccountID = 5;
SELECT * FROM `account`;
-- Question 15
UPDATE groupaccount SET GroupID = 4 WHERE AccountID = 5;
SELECT * FROM groupaccoexamquestionunt;
