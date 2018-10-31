select o.customerID, o.date, o.total from orders o;

select o.customerID, c.name as 'cust. name', o.date, o.total 
	from orders o 
	join customer c 
    on o.customerID = c.ID
    where o.total > (
		select avg(total) as 'Average Total'
        from orders
    )
    order by total;
    
select * from customer where id in (1, 2, 3);

set @startDate = '2017-03-01';
set @endDate = '2017-03-15';

select o.id, o.date, c.name, o.total
	from orders o
    join customer c
    on o.customerID = c.id
    where o.date >= @startDate
    and o.date <= @endDate;