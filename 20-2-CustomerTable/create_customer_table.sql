USE mma;

DROP TABLE IF EXISTS Customer;

CREATE TABLE Customer
(
    CustomerID   INT          PRIMARY KEY  AUTO_INCREMENT,
    FirstName    VARCHAR(50), 
    LastName     VARCHAR(50), 
    EmailAddress VARCHAR(50)
);

INSERT INTO Customer VALUES 
(3, 'John', 'Smith', 'johnsmith@hotmail.com'), 
(4, 'Frank', 'Jones', 'frankjones@yahoo.com'), 
(5, 'Cynthia', 'Green', 'seagreen@levi.com'), 
(6, 'Wendy', 'Kowolski', 'wendyk@warners.com');