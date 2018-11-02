-- create and select the database
DROP DATABASE IF EXISTS bmdb;
CREATE DATABASE bmdb;
USE bmdb;

-- create the Movie table
CREATE TABLE Movie (
  ID			        INT             PRIMARY KEY  AUTO_INCREMENT,
  Title           VARCHAR(100)    NOT NULL,
  Rating          VARCHAR(5)      NOT NULL,
  Year            INT             NOT NULL
  Director        VARCHAR(50)     NOT NULL
);

-- create Genre table
CREATE TABLE Genre (
  ID			        INT				      PRIMARY KEY  AUTO_INCREMENT,  
  Name	          VARCHAR(10)		  NOT NULL
);

-- create Actor table
CREATE TABLE Actor (
  ID			        INT				      PRIMARY KEY  AUTO_INCREMENT,
  FirstName       VARCHAR(25)     NOT NULL,
  LastName        VARCHAR(25)     NOT NULL,
  Gender          VARCHAR(6)      NOT NULL,
  BirthDate       DATE            NOT NULL     
);

-- create MovieGenre table
CREATE TABLE MovieGenre (
  ID			        INT				      PRIMARY KEY  AUTO_INCREMENT,
  MovieID		      INT				      NOT NULL,
  GenreID		      INT				      NOT NULL,
  FOREIGN KEY (MovieID) REFERENCES Movie (ID),
  FOREIGN KEY (GenreID) REFERENCES Genre (ID)
);

-- create Credit table
CREATE TABLE Credit (
  ID			        INT				      PRIMARY KEY  AUTO_INCREMENT,
  MovieID		      INT				      NOT NULL,
  ActorID		      INT				      NOT NULL,
  CharacterName   VARCHAR(25) NOT NULL,
  FOREIGN KEY (MovieID) REFERENCES Movie (ID),
  FOREIGN KEY (ActorID) REFERENCES Actor (ID)
);

-- insert some rows into the Movie table
INSERT INTO Movie
  (ID, Title, Rating, Year, Director)
VALUES
  (1, 'In Bruges', 'R', 2008, 'Martin McDonagh'),
  (2, 'The Killing', 'NR', 1956, 'Stanley Kubrick'),
  (3, 'Michael Clayton', 'R', 2007, 'Tony Gilroy'),
  (4, 'The Grand Budapest Hotel', 'R', 2014, 'Wes Anderson'),
  (5, 'Ex Machina', 'R', 2014, 'Alex Garland'),
  (6, 'Star Wars: The Last Jedi', 'PG-13', 2017, 'Rian Johnson'),
  (7, 'Inside Llewyn Davis', 'R', 2013, 'Ethan Coen'),
  (8, 'Drive', 'R', 2017, 'Nicholas Winding Refn'),
  (9, 'The Ides of March', 'R', 2011, 'George Clooney');

-- insert some rows into the Genre table
INSERT INTO Genre
  (ID, Name)
VALUES
  (1, 'Comedy'),
  (2, 'Sci-Fi'),
  (3, 'Horror'),
  (4, 'Romance'),
  (5, 'Action'),
  (6, 'Thriller'),
  (7, 'Drama'),
  (8, 'Mystery'),
  (9, 'Crime'),
  (10, 'Animation'),
  (11, 'Adventure'),
  (12, 'Fantasy'),
  (13, 'Superhero');

-- insert some rows into the Actor table
INSERT INTO Actor
  (ID, FirstName, LastName, Gender, BirthDate)
VALUES
  (1, 'Colin', 'Farrell', 'Male', '1976-5-31'),
  (2, 'Brenden', 'Gleeson', 'Male', '1955-3-29'),  
  (3, 'Ralph', 'Fiennes', 'Male', '1962-12-22'),
  (4, 'Sterling', 'Hayden', 'Male', '1916-3-26'),
  (5, 'Coleen', 'Gray', 'Female', '1922-10-23'),
  (6, 'Vince', 'Edwards', 'Male', '1928-7-9'),
  (7, 'George', 'Clooney', 'Male', '1961-5-6'),
  (8, 'Tilda', 'Swinton', 'Female', '1960-11-5'),
  (9, 'Tom', 'Wilkinson', 'Male', '1948-2-5'),
  (10, 'F. Murray', 'Abraham', 'Male', '1939-10-24'),
  (11, 'Jeff', 'Goldblum', 'Male', '1952-10-22'),
  (12, 'Alicia', 'Vikander', 'Female', '1988-10-3'),
  (13, 'Domhnall', 'Gleeson', 'Male', '1983-5-12'),
  (14, 'Oscar', 'Isaac', 'Male', '1979-3-9'),
  (15, 'Adam', 'Driver', 'Male', '1983-11-19'),
  (16, 'John', 'Boyega', 'Male', '1992-3-17'),
  (17, 'Carey', 'Mulligan', 'Female', '1985-5-28'),
  (18, 'Ryan', 'Gosling', 'Male', '1980-11-12');

-- insert some rows into the MovieGenre table
INSERT INTO MovieGenre
  (MovieID, GenreID)
VALUES
  (1, 1),
  (1, 6),
  (1, 9);

-- insert some rows into the Credit table
INSERT INTO Credit
  (MovieID, ActorID, CharacterName)
VALUES
  (1, 1, 'Ray'),
  (1, 2, 'Ken'),
  (1, 3, 'Harry'),
  (4, 3, 'M. Gustave'),
  (2, 4, 'Johnny Clay'),
  (2, 5, 'Fay'),
  (2, 6, 'Val Cannon'),
  (3, 7, 'Michael Clayton'),
  (9, 7, 'Mike Morris'),
  (4, 8, 'Madame D.'),
  (3, 8, 'Karen Crowder'),
  (4, 9, 'Author'),
  (3, 9, 'Arthur Edens'),
  (4, 10, 'Mr. Moustafa'),
  (7, 10, 'Bud Grossman');



-- create a user and grant privileges to that user