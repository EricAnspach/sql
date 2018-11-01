select u.ID, u.name, c.name as "Course"
	from user u
    join course c
    on u.courseID = c.ID;