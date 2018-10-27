SELECT * FROM customer;

select * from customer
 where state = 'ca'
 order by name desc;
 
select name, city, state, sales as 'Sales Total', active as 'Is Active?'
 from customer
 where state = 'ca'
 order by name desc;
 
select * from customer
 where state = 'ca'
 and city = 'Fresno'
 order by name desc;