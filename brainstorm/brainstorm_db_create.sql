-- create and select the database
DROP DATABASE IF EXISTS brainstorm;
CREATE DATABASE brainstorm;
USE brainstorm;

-- create the User table
CREATE TABLE User (
  ID			        INT             PRIMARY KEY  AUTO_INCREMENT,
  Username           VARCHAR(100)    NOT NULL,
  Password			VARCHAR(25)		NOT NULL,
  FirstName          VARCHAR(20)      NOT NULL,
  LastName			VARCHAR(20)      NOT NULL,
  Phone				VARCHAR(12)      NOT NULL,
  HireDate			date			NOT NULL
);

-- create Actor table
CREATE TABLE Project (
  ID			        INT				      PRIMARY KEY  AUTO_INCREMENT,
  Name       VARCHAR(25)     NOT NULL,
  ShortDescription        VARCHAR(50)     NOT NULL,
  FullDescription        VARCHAR(255)     NOT NULL,
  PrimarySponsor          VARCHAR(20)      NOT NULL,
  EstStartDate			date				NOT NULL,
  ActualStartDate			date, 
  EstEndDate			date				NOT NULL, 
  ActualEndtDate			date, 
  EstHours				int						NOT NULL,
  Budget				double					NOT NULL,
  Status				VARCHAR(20)      default "new"
);

-- create Role table
CREATE TABLE Roles (
  ID			        INT				      PRIMARY KEY  AUTO_INCREMENT,
  UserID		      INT				      NOT NULL,
  ProjectID		      INT				      NOT NULL,
  RoleTitle				varchar(30)			Not Null,
  FOREIGN KEY (UserID) REFERENCES User (ID),
  FOREIGN KEY (ProjectID) REFERENCES Project (ID)
);

-- create Task table
CREATE TABLE Task (
  ID			        INT				      PRIMARY KEY  AUTO_INCREMENT,
  RoleID		      INT				      NOT NULL,
  ProjectID		      INT				      NOT NULL,
  Name  		 VARCHAR(25) NOT NULL,
  Description	VARCHAR(100) NOT NULL,
  EstHours		int		NOT NULL,
  FOREIGN KEY (RoleID) REFERENCES Role (ID),
  FOREIGN KEY (ProjectID) REFERENCES Project (ID)
);

-- insert some rows into the User table
INSERT INTO User (ID, Username, Password, FirstName, LastName, Phone, HireDate)
VALUES (1, 'Seson', 'Sesone1', 'Yelena', 'Lapina','5134008204',2016-02-04),
 (2, 'Eanspach', 'Sesame', 'Eric', 'Anspach','513423536',2015-03-06),
 (3, 'Winter', 'February', 'Gary', 'Henderson','5132368062',2013-05-24),
(4, 'Summer', 'July2', 'Shannon', 'White','5136048316',2012-01-24),
(5, 'Spring', 'March', 'Robert', 'Johnson','8006214934',2010-05-12),
(6, 'Fall', 'September7', 'Jack', 'Gabes','5136334267',2010-04-24);

INSERT INTO Project (ID, name, shortdescription, fulldescription, primarysponsor, EstStartDate,
ActualStartDate, EstEndDate, ActualEndDate, EstHours, budget, status) VALUES
(1, "Update Web Controllers", "Fix web functionality", "New controller methods for scalability", "Microsoft", 2019-05-01,
null, 2019-08-20, null, 600, 500000),
(2, "Clearing AR", "Clear account receivables", "This project will clear all debts from last year.", "AR Dept", 2019-09-10,
null, 2019-12-05, null, 800, 45000),
(3, "Update User Interface", "Add additional features", "Add About page and front-end graphics", "Apple", 2019-06-15,
null, 2020-03-07, null, 1200, 480000);

INSERT INTO Roles (ID, UserID, ProjectID, RoleTitle) VALUES
(1, 1, 2, 'Director'),
(2, 2, 3, 'Project Manager'),
(3, 3, 1, 'Director'),
(4, 1, 1, 'Contributor'),
(5, 2, 2, 'Contributor'),
(6, 5, 1, 'Contributor');

INSERT INTO Task (ID, RoleID, ProjectID,NAme, Description, EstHours) VALUES
(1,4,3, 'Add header buttoms', 'create header buttoms using style guide' ,40),
(2,5,2, 'Clear claims', 'clear debts for previous year' ,160),
(3,6,1, 'Web Controllers', 'fix web functionality using new standarts' ,300);


-- create a user and grant privileges to that user
create user springuser@localhost identified by 'ThePassword'; -- Creates the user
grant all on brainstorm.* to springuser@localhost; 