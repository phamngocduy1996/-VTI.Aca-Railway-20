USE TestingSystemSQL_Ass1_2;
SELECT * FROM Trainee;

-- Question 1
INSERT INTO Trainee (Full_Name,Birth_Date, Gender, ET_IQ, ET_Gmath, ET_English, Training_Class, Evaluation_Notes,VTI_Account ) 
			VALUES 
					('Le Minh B', '1992-11-20', 'male', 15, 16, 40, 'SQL1', 'BBBB', 'VTI2'),
                    ('Nguyen Thi C', '1994-05-09', 'female', 20, 20, 46, 'SQL1', 'ccccc', 'VTI3'),
                    ('Vu Le D', '1990-02-09', 'male', 5, 10, 16, 'SQL1', 'ddddd', 'VTI4'),
                    ('Trinh Minh E', '1995-08-20', 'male', 6, 7, 15, 'SQL1', 'eeeeee', 'VTI5'),
                    ('Vo Van F', '1997-05-15', 'male', 15, 15, 40, 'SQL2', 'fffff', 'VTI6'),
                    ('Nguyen Quang G', '1997-12-19', 'male', 20, 20, 50, 'SQL2', 'gggg', 'VTI7'),
                    ('Do Huy H', '1996-11-10', 'male', 18, 17, 45, 'SQL2', 'hhhhhh', 'VTI8'),
                    ('Le S', '1998-01-20', 'male', 14, 13, 35, 'SQL2', 'ssssss', 'VTI9'),
                    ('Huynh Minh I', '2000-08-10', 'female', 20, 20, 50, 'SQL2', 'iiiiii', 'VTI10');

-- Question 2
SELECT * 
FROM trainee
WHERE ET_IQ >= 10 AND ET_Gmath >= 10 AND ET_English >= 25 
ORDER BY 
month(Birth_Date);

-- Question 3
SELECT 
*,
char_length(Full_Name) as Length_of_name
FROM trainee
GROUP BY 
TraineeID
ORDER BY char_length(Full_Name) DESC LIMIT 1;

-- Question 4
SELECT *
FROM trainee
WHERE ET_IQ + ET_IQ >= 20 AND ET_IQ >= 8 AND ET_Gmath >= 8 AND ET_English >=18;
-- Question 5
DELETE FROM trainee
WHERE TraineeID = 3;
-- Question 6
UPDATE trainee
SET Training_Class = 'SQL2'
WHERE TraineeID = 5;



