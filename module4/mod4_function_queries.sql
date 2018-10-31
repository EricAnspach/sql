select * from customer;
select state, avg(creditLimit) as 'AvgLimit' from customer
	group by state
    order by AvgLimit desc;
    
select state, max(creditLimit) as 'MaxLimit' from customer
	group by state
    order by MaxLimit desc;
    
select name, concat('$',format(creditLimit, 2)) as 'Credit Limit'
	from customer
    group by state;
    
select name, concat('$',format(creditLimit, 2)) as 'Credit Limit'
	from customer;