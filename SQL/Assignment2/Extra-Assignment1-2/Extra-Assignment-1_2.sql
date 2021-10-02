DROP DATABASE IF EXISTS TestingSystemSQL_Ass1_2;
CREATE DATABASE IF NOT EXISTS TestingSystemSQL_Ass1_2;
USE TestingSystemSQL_Ass1_2;

DROP TABLE IF EXISTS Trainee;
CREATE TABLE Trainee (
	TraineeID			TINYINT 		AUTO_INCREMENT,
    Full_Name			VARCHAR	(10) 	NOT NULL,
    Birth_Date			DATE		 	NOT NULL,
    Gender				ENUM ('male','female','unknow'),
    ET_IQ				TINYINT 		UNSIGNED			CHECK(ET_IQ >= 20)			NOT NULL,
    ET_Gmath			TINYINT 		UNSIGNED			CHECK(ET_Gmath >= 20)	 	NOT NULL,
    ET_English			TINYINT			UNSIGNED			CHECK(ET_English >= 50)		NOT NULL,
    Training_Class 		VARCHAR(50)		NOT NULL,
    Evaluation_Notes 	TEXT,
    VTI_Account			VARCHAR(50)		NOT NULL,
    PRIMARY KEY (TraineeID),
    UNIQUE KEY (VTI_Account)
);

DROP TABLE IF EXISTS Data_Types_1;
CREATE TABLE Data_Types_1 (
	ID		 		BIGINT		AUTO_INCREMENT		PRIMARY KEY,
    `Name`	 		VARCHAR(50)	NOT NULL,
    `Code`			VARCHAR(5)	NOT NULL,
 	ModifiedDate	TIMESTAMP
);


DROP TABLE IF EXISTS Data_Types_2;
CREATE TABLE Data_Types_2 (
	ID				BIGINT			AUTO_INCREMENT		PRIMARY KEY,
    `Name`			VARCHAR (50)	NOT NULL,
    BirthDate		DATE,
    Gender			ENUM('Male', 'Female', 'Unknown'),
    IsDeletedFlag	ENUM('0.Online','1.Delete')
);



