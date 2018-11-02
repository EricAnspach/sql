select u.ID, u.name, c.name as "Course"
	from user u
    join course c
    on u.courseID = c.ID;
    
select c.name as 'Course', u.name
	from course c
    join user u
    on c.ID = u.courseID;
    
-- another way to join data, but don't use this way
select c.name as 'Course', u.name
	from course c, user u
    where c.ID = u.courseID;
    
-- Left Join
select u.ID, u.name, c.name as "Course"
	from user u
    left join course c
    on u.courseID = c.ID;
    
-- Right Join
select u.ID, u.name, c.name as "Course"
	from user u
    right join course c
    on u.courseID = c.ID;
    
-- Union - need to complete example