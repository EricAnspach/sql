-- create and select the database
DROP DATABASE IF EXISTS country;
CREATE DATABASE country;
USE country;

CREATE TABLE Country
(
  ID    INT            PRIMARY KEY  AUTO_INCREMENT,
  Name  VARCHAR(100)
);

INSERT INTO Country VALUES 
(1, 'India'), 
(2, 'Japan'),
(3, 'Mexico'),
(4, 'Spain'),
(5, 'United States'),
(6, 'Portugal');

-- create A USER AND GRANT PRIVILEGES TO THAT USER
create USER IF NOT EXISTS country_user@localhost identified BY 'sesame';
GRANT select, insert, delete, update on country.* to country_user@localhost;
