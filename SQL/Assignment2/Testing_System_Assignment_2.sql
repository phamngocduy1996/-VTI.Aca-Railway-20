drop database if exists TestingSystem;
create database if not exists TestingSystem;
use TestingSystem;

create table Department (
 DepartmentID 		INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 DepartmentName 	VARCHAR(50) NOT NULL
);

create table `Position` (
 PositionID    		INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 PositionName 		VARCHAR(50)
);

create table `Account` (
AccountID 			INT 		UNSIGNED 	AUTO_INCREMENT PRIMARY KEY,
Email 				VARCHAR(50)	NOT NULL	UNIQUE KEY,
Username 			VARCHAR(50)	NOT NULL	UNIQUE KEY,
FullName 			VARCHAR(50) NOT NULL,
DepartmentID 		INT 		UNSIGNED	NOT NULL,
PositionID 			INT			UNSIGNED	NOT NULL,
CreateDate 			DATETIME,
FOREIGN KEY (PositionID) REFERENCES `Position`(PositionID) ,
FOREIGN KEY (DepartmentID) REFERENCES Department (DepartmentID) 
);
create table `Group` (
 GroupID 			INT			UNSIGNED 	AUTO_INCREMENT PRIMARY KEY,
 GroupName 			VARCHAR(50) NOT NULL,
 CreatorID 			INT			UNSIGNED	NOT NULL,
 CreateDate 		DATETIME,
 FOREIGN KEY (CreatorID) REFERENCES `Account` (AccountID) 
);

create table GroupAccount (
 GroupID 			INT	UNSIGNED  NOT NULL,
 AccountID 			INT	UNSIGNED  NOT NULL,
 JoinDate 			DATETIME,
 FOREIGN KEY (GroupID) 	 REFERENCES `Group`(GroupID) ,
 FOREIGN KEY (AccountID) REFERENCES `Account` (AccountID) 
);
create table TypeQuestion (
 TypeID 			INT UNSIGNED	AUTO_INCREMENT	 PRIMARY KEY,
 TypeName 			ENUM('Essay','Multiple-Choice')
);
create table CategoryQuestion (
 CategoryID 		INT 		UNSIGNED	AUTO_INCREMENT	 PRIMARY KEY,
 CategoryName 		VARCHAR(50)	NOT NULL	UNIQUE
);
create table Question (
QuestionID 			INT UNSIGNED	AUTO_INCREMENT PRIMARY KEY,
Content 			TEXT,
CategoryID 			INT UNSIGNED,
TypeID 				INT UNSIGNED,
CreatorID 			INT UNSIGNED,
CreateDate 			DATETIME,
FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion (CategoryID) ,
FOREIGN KEY (TypeID) REFERENCES TypeQuestion (TypeID) ,
FOREIGN KEY (CreatorID) REFERENCES `Account` (AccountID)
);
create table Answer (
AnswerID 			INT UNSIGNED	AUTO_INCREMENT PRIMARY KEY,
Content 			TEXT,
QuestionID 			INT	UNSIGNED,
isCorrect 			BOOLEAN,
FOREIGN KEY (QuestionID) REFERENCES Question (QuestionID) 
);

CREATE TABLE Exam (
    ExamID 		INT 		UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `Code` 		VARCHAR(50) ,
    Title 		VARCHAR(100) ,
    CategoryID 	INT 		UNSIGNED,
    Duration 	INT,
    CreatorID 	INT 		UNSIGNED,
    CreateDate 	DATETIME,
    FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion (CategoryID),
    FOREIGN KEY (CreatorID)  REFERENCES `Group` (CreatorID)
);
create table ExamQuestion (
 ExamID 			INT UNSIGNED,
 QuestionID 		INT UNSIGNED, 
 FOREIGN KEY (ExamID) REFERENCES Exam (ExamID) ,
 FOREIGN KEY (QuestionID) REFERENCES Answer (QuestionID) 
);



/*
INSERT DATA
*/

INSERT INTO Department (DepartmentName) VALUES ('Sale');
INSERT INTO Department (DepartmentName) VALUES ('Marketing');
INSERT INTO Department (DepartmentName) VALUES ('CSKH');
INSERT INTO Department (DepartmentName) VALUES ('Human Resources');
INSERT INTO Department (DepartmentName) VALUES ('Administration');


INSERT INTO `Position` (PositionName) VALUES ('Dev');
INSERT INTO `Position` (PositionName) VALUES ('Test');
INSERT INTO `Position` (PositionName) VALUES ('Scrum Master');
INSERT INTO `Position` (PositionName) VALUES ('PM');
INSERT INTO `Position` (PositionName) VALUES ('IT Manager');

INSERT INTO `Account` (Email, Username, Fullname, DepartmentID, PositionID, CreateDate) 
			VALUES ('A@gmail.com', 'username1', 'Nguyen Van A', 1, 1, '2021-10-02 10:35:13' );
INSERT INTO `Account` (Email, Username, Fullname, DepartmentID, PositionID, CreateDate) 
			VALUES ('B@gmail.com', 'username2', 'Nguyen Van B', 2, 2, '2021-10-02 10:35:15' );
INSERT INTO `Account` (Email, Username, Fullname, DepartmentID, PositionID, CreateDate) 
			VALUES ('C@gmail.com', 'username3', 'Le Thi C', 3, 3, '2021-10-02 10:35:20' );
INSERT INTO `Account` (Email, Username, Fullname, DepartmentID, PositionID, CreateDate) 
			VALUES ('D@gmail.com', 'username4', 'Pham Van D', 4, 4, '2021-10-02 10:40:30' );
INSERT INTO `Account` (Email, Username, Fullname, DepartmentID, PositionID, CreateDate) 
			VALUES ('E@gmail.com', 'username5', 'Tran Minh E', 5, 5, '2021-10-02 11:10:50' );
            
INSERT INTO `Group` (GroupName, CreatorID, CreateDate)
			VALUES ('Nhom-1', 2,'2021-10-03 09:10:30');
INSERT INTO `Group` (GroupName, CreatorID, CreateDate)
			VALUES ('Nhom-2', 5,'2021-10-03 09:30:40');
INSERT INTO `Group` (GroupName, CreatorID, CreateDate)
			VALUES ('Nhom-3', 1,'2021-10-03 10:12:20');
INSERT INTO `Group` (GroupName, CreatorID, CreateDate)
			VALUES ('Nhom-4', 3,'2021-10-03 11:10:10');
INSERT INTO `Group` (GroupName, CreatorID, CreateDate)
			VALUES ('Nhom-5', 4,'2021-10-03 12:15:30');
            
INSERT INTO GroupAccount (GroupID, AccountID, JoinDate)
			VALUES (1, 2,'2021-10-04 08:10:20');
INSERT INTO GroupAccount (GroupID, AccountID, JoinDate)
			VALUES (2, 5,'2021-10-04 09:20:10');
INSERT INTO GroupAccount (GroupID, AccountID, JoinDate)
			VALUES (3, 1,'2021-10-04 10:40:50');
INSERT INTO GroupAccount (GroupID, AccountID, JoinDate)
			VALUES (4, 3,'2021-10-04 11:11:21');
INSERT INTO GroupAccount (GroupID, AccountID, JoinDate)
			VALUES (5, 4,'2021-10-04 12:12:20');

INSERT INTO TypeQuestion (TypeName) VALUES ('Essay');
INSERT INTO TypeQuestion (TypeName) VALUES ('Multiple-Choice');

INSERT INTO CategoryQuestion (CategoryName) VALUES ('Java');
INSERT INTO CategoryQuestion (CategoryName) VALUES ('.NET');
INSERT INTO CategoryQuestion (CategoryName) VALUES ('SQL');
INSERT INTO CategoryQuestion (CategoryName) VALUES ('Postman');
INSERT INTO CategoryQuestion (CategoryName) VALUES ('Ruby');

INSERT INTO Question (Content, CategoryID, TypeID, CreatorID, CreateDate) 
	   VALUES ('AAAAAA', 2, 1, 2, '2021-10-05 11:42:31');
INSERT INTO Question (Content, CategoryID, TypeID, CreatorID, CreateDate) 
	   VALUES ('BBBBB', 4, 2, 5, '2021-10-05 12:52:10');
INSERT INTO Question (Content, CategoryID, TypeID, CreatorID, CreateDate) 
	   VALUES ('CCCCC', 5, 2, 3, '2021-10-05 13:20:51');
INSERT INTO Question (Content, CategoryID, TypeID, CreatorID, CreateDate) 
	   VALUES ('DDDD', 1, 1, 1, '2021-10-05 14:12:32');
INSERT INTO Question (Content, CategoryID, TypeID, CreatorID, CreateDate) 
	   VALUES ('EEEEE', 3, 1, 4, '2021-10-05 15:42:31');
       
INSERT INTO Answer (Content, QuestionID, isCorrect) 
		VALUES ('AQWER', 5, True);
INSERT INTO Answer (Content, QuestionID, isCorrect) 
		VALUES ('ASDF', 1, True);
INSERT INTO Answer (Content, QuestionID, isCorrect) 
		VALUES ('ZXCVV', 2, False);
INSERT INTO Answer (Content, QuestionID, isCorrect) 
		VALUES ('IOPU', 3, True);
INSERT INTO Answer (Content, QuestionID, isCorrect) 
		VALUES ('YUIOIO', 4, False);
        
INSERT INTO Exam (`Code`, Title, CategoryID, Duration, CreatorID, CreateDate)
	   VALUES ('A1', 'AAAA', 1, 5400, 1, '2021-10-05 08:10:22');
INSERT INTO Exam (`Code`, Title, CategoryID, Duration, CreatorID, CreateDate)
	   VALUES ('B1', 'BBBB', 2, 5400, 2, '2021-10-05 09:20:12');
INSERT INTO Exam (`Code`, Title, CategoryID, Duration, CreatorID, CreateDate)
	   VALUES ('C1', 'CCCC', 3, 5400, 3, '2021-10-05 10:21:40');
INSERT INTO Exam (`Code`, Title, CategoryID, Duration, CreatorID, CreateDate)
	   VALUES ('D1', 'DDDD', 4, 5400, 4, '2021-10-05 15:30:22');
INSERT INTO Exam (`Code`, Title, CategoryID, Duration, CreatorID, CreateDate)
	   VALUES ('E1', 'EEEE', 5, 5400, 5, '2021-10-05 17:33:42');
       
INSERT INTO ExamQuestion (ExamID, QuestionID) VALUES (1,1);
INSERT INTO ExamQuestion (ExamID, QuestionID) VALUES (1,2);
INSERT INTO ExamQuestion (ExamID, QuestionID) VALUES (2,3);
INSERT INTO ExamQuestion (ExamID, QuestionID) VALUES (2,4);
INSERT INTO ExamQuestion (ExamID, QuestionID) VALUES (3,5);




