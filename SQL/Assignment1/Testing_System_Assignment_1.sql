drop database if exists TestingSystem1;
create database if not exists TestingSystem1;
use TestingSystem1;

create table Department (
 DepartmentID 		SMALLINT,
 DepartmentName 	VARCHAR(50)
);

create table `Position` (
 PositionID    		SMALLINT,
 PositionName 		ENUM('Dev','Test','Scrum Master','PM')
);

create table `Account` (
AccountID 			INT ,
Email 				VARCHAR(50),
Username 			VARCHAR(50),
FullName 			VARCHAR(50),
DepartmentID 		SMALLINT,
PositionID 			SMALLINT,
CreateDate 			DATE
);
create table `Group` (
 GroupID 			INT,
 GroupName 			VARCHAR(50),
 CreatorID 			INT,
 CreateDate 		DATE
);

create table GroupAccount (
 GroupID 			INT,
 AccountID 			INT,
 JoinDate 			DATE
);
create table TypeQuestion (
 TypeID 			INT,
 TypeName 			ENUM('Essay','Multiple-Choice')
);
create table CategoryQuestion (
 CategoryID 		INT,
 CategoryName 		VARCHAR(50)
);
create table Question (
QuestionID 			INT,
Content 			TEXT,
CategoryID 			INT,
TypeID 				INT,
CreatorID 			INT,
CreateDate 			DATE
);
create table Answer (
AnswerID 			INT,
Content 			TEXT,
QuestionID 			INT,
isCorrect 			BOOLEAN
);

CREATE TABLE Exam (
    ExamID 		INT,
    `Code` 		VARCHAR(50) ,
    Title 		VARCHAR(100) ,
    CategoryID 	INT,
    Duration 	INT,
    CreatorID 	INT,
    CreateDate 	DATE
);
create table ExamQuestion (
 ExamID 			INT,
 QuestionID 		INT
);













