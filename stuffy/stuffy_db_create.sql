-- create and select the database
DROP DATABASE IF EXISTS stuffy;
CREATE DATABASE stuffy;
USE stuffy;

-- create the stuffy table
CREATE TABLE Stuffy (
    ID                  INT            PRIMARY KEY  AUTO_INCREMENT,
    Type	            VARCHAR(20)    NOT NULL,
    Color           	VARCHAR(10)    NOT NULL,
    Size		        VARCHAR(20)    NOT NULL
);

INSERT INTO Stuffy
    (ID, Type, Color, Size)
VALUES
    (1, 'Pig', 'green', 'big'),
	(2, 'Cow', 'red', 'medium'),
    (3, 'Bird', 'yellow', 'Big'),
    (4, 'Porcupine', 'Purple', 'Small'),
    (5, 'Hedgehog', 'Orange', 'Large');
    
-- create A USER AND GRANT PRIVILEGES TO THAT USER
create USER IF NOT EXISTS stuffy_user@localhost identified BY 'sesame';
GRANT select, insert, delete, update on stuffy.* to stuffy_user@localhost;

    
    