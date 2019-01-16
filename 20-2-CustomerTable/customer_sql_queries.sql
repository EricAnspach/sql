insert into customer values (customerid, 'Clark', 'Kent', 'superman@dailyplanet.com');

DELETE FROM customer WHERE EMAILADDRESS = 'frankjones@yahoo.com';

SELECT * FROM customer WHERE EMAILADDRESS = 'seagreen@levi.com';

UPDATE customer SET FirstName = 'Super', LastName = 'Man' WHERE EmailAddress = 'superman@dailyplanet.com';