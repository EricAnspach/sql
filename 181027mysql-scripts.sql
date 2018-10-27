select * from product;

select * from invoice;

select * from lineitem;

select *
	from invoice
    where id = 1;
    
select *
	from product
    where code = 'java';
    
select * from product where id = 4;

insert into product (code, description, listprice)
values ('python', 'Murach''s Python Programming', '57.50'),
('vue', 'Murach''s Vue Framework', '52.50'),
('angular', 'Murach''s Angular', '52.50');

