USE sql_lesson_3;
-- Question 1
SELECT 
	a.AccountID,
    a.Email,
    a.Username,
    a.FullName,
    b.DepartmentName
FROM 
	`account` a 
LEFT JOIN 
	department b ON a.DepartmentID = b.DepartmentID;
    
-- Question 2
SELECT 
	a.AccountID,
    a.Email,
    a.Username,
    a.FullName,
    b.PositionName,
    a.CreateDate
FROM 
	`account` a
LEFT JOIN 
	`position` b ON a.PositionID = b.PositionID
WHERE 
	a.CreateDate < '2019-09-09';
-- Question 3
SELECT
	a.Email,
    a.Username,
    a.FullName,
    b.PositionName
FROM
	`account` a
LEFT JOIN 
	`position` b ON a.PositionID = b.PositionID
WHERE PositionName = 'Dev';

-- Question 4
SELECT
    b.DepartmentName,
    count(a.AccountID)
FROM
	`account` a
LEFT JOIN 
	department b ON a.DepartmentID = b.DepartmentID
GROUP BY
	b.DepartmentID
HAVING
	count(a.AccountID) >= 3;
-- Question 5
SELECT
	b.Content,
    COUNT(a.ExamID)
FROM 
	examquestion a 
LEFT JOIN question b ON a.QuestionID = b.QuestionID
GROUP BY
	a.QuestionID
ORDER BY 
count(a.ExamID) DESC LIMIT 1;

-- Question 6
SELECT 
	a.CategoryID,
    a.CategoryName,
    COUNT(QuestionID) AS total
FROM categoryquestion a 
LEFT JOIN question b ON a.CategoryID = b.CategoryID
GROUP BY
a.CategoryID;

-- Question 7
SELECT
	a.QuestionID,
    a.content,
    COUNT(b.ExamID) as total
FROM question a
LEFT JOIN examquestion b ON a.QuestionID = b.QuestionID
GROUP BY
a.QuestionID;

-- Question 8
SELECT
	a.QuestionID,
    a.content,
    COUNT(b.AnswerID) as total
FROM question a
LEFT JOIN answer b ON a.QuestionID = b.QuestionID
GROUP BY
a.QuestionID
ORDER BY COUNT(b.AnswerID) DESC LIMIT 1;

-- Question 9
SELECT 
a.GroupID,
COUNT(b.AccountID) AS total
FROM groupaccount a
LEFT JOIN `account` b ON a.AccountID = b.AccountID
GROUP BY
a.GroupID;

-- Question 10
SELECT
a.PositionName,
COUNT(a.PositionID) AS total
FROM position a
LEFT JOIN `account` b ON a.PositionID = b.PositionID
GROUP BY
a.PositionName
ORDER BY 
COUNT(a.PositionID) ASC ;

-- Question 11 *******
SELECT
a.DepartmentName,
COUNT(b.DepartmentID) As total
FROM department a
LEFT JOIN `account` b ON a.DepartmentID = b.DepartmentID
GROUP BY
a.DepartmentName;
SELECT 
a.PositionName,
COUNT(b.PositionID) as total
FROM position a
LEFT JOIN `account` b ON a.PositionID = b.PositionID
GROUP BY
a.PositionName
ORDER BY
a.PositionID;


-- Question 12
SELECT 
a.QuestionID,
a.content,
b.CategoryName,
c.TypeName,
d.AccountID,
d.Username,
d.FullName
FROM question a
LEFT JOIN categoryquestion b ON a.CategoryID = b.CategoryID
 LEFT JOIN typequestion c ON a.TypeID = c.TypeID
 LEFT JOIN `account` d ON a.CreatorID = d.AccountID
 GROUP BY
 a.QuestionID;




-- Question 13
SELECT 
a.TypeID,
a.TypeName,
COUNT(b.TypeID) As total
FROM typequestion a
LEFT JOIN question b ON a.TypeID = b.TypeID
GROUP BY
a.TypeName;

-- Question 14
SELECT 
a.GroupID,
COUNT(b.AccountID) as total
FROM `group` a
LEFT JOIN groupaccount b ON a.GroupID = b.GroupID
GROUP BY 
a.GroupID
HAVING COUNT(b.AccountID) = 0;
-- Question 16
SELECT 
a.QuestionID,
a.content,
COUNT(b.QuestionID) as total
FROM question a
LEFT JOIN answer b ON a.QuestionID = b.QuestionID
GROUP BY
a.QuestionID
HAVING 
COUNT(b.QuestionID) = 0 ;





    

