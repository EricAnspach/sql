-- All Movie Credits in Database
select a.firstname, a.LastName, c.charactername, m.title
	from credit c
    join actor a
    on c.actorID = a.ID
    join movie m
    on c.movieID = m.ID;

-- All credits with names concatenated    
select concat(a.firstname," ", a.LastName) as "Name",
	c.charactername as "Character Name",
    m.title as "Movie"
	from credit c
    join actor a
    on c.actorID = a.ID
    join movie m
    on c.movieID = m.ID;
    
-- All movies where Oscar Isaac had a credit
select concat(a.firstname," ", a.LastName) as "Name",
	c.charactername as "Character Name",
    m.title as "Movie"
	from credit c
    join actor a
    on c.actorID = a.ID
    join movie m
    on c.movieID = m.ID
    where a.firstName = 'Oscar' && a.LastName = 'Isaac';
    
-- All movies with a credit for actors with the last name Gleeson
select concat(a.firstname," ", a.LastName) as "Name",
	c.charactername as "Character Name",
    m.title as "Movie"
	from credit c
    join actor a
    on c.actorID = a.ID
    join movie m
    on c.movieID = m.ID
    where a.LastName = 'Gleeson';

-- All actor credits for Star Wars: The Last Jedi
select concat(a.firstname," ", a.LastName) as "Name",
	c.charactername as "Character Name",
    m.title as "Movie"
	from credit c
    join actor a
    on c.actorID = a.ID
    join movie m
    on c.movieID = m.ID
    where m.title = 'Star Wars: The Last Jedi';
    
-- Subquery - all movie credits by actors who had a credit in Star Wars: The Last Jedi
select concat(a.firstname," ", a.LastName) as "Name",
	c.charactername as "Character Name",
    m.title as "Movie"
	from credit c
    join actor a
    on c.actorID = a.ID
    join movie m
    on c.movieID = m.ID
    where a.ID in (
		select a.ID
			from credit c
			join actor a
			on c.actorID = a.ID
			join movie m
			on c.movieID = m.ID
			where m.title = 'Star Wars: The Last Jedi'
		);    
        
-- Subquery - all movie credits by actors who had a 
-- credit in 'Drive' and 'Inside Llewyn Davis'
select concat(a.firstname," ", a.LastName) as "Name",
	c.charactername as "Character Name",
    m.title as "Movie"
	from credit c
    join actor a
    on c.actorID = a.ID
    join movie m
    on c.movieID = m.ID
    where a.ID in (
		select a.ID
			from credit c
			join actor a
			on c.actorID = a.ID
			join movie m
			on c.movieID = m.ID
			where m.title = 'Drive'
		) &&
        a.ID in (
		select a.ID
			from credit c
			join actor a
			on c.actorID = a.ID
			join movie m
			on c.movieID = m.ID
			where m.title = 'Inside Llewyn Davis'
		);    
        
-- Subquery - all movie credits with an R rating by actors who had a 
-- credit in 'Ex Machina' or 'The Grand Budapest Hotel'
-- order by actors' last names
select concat(a.firstname," ", a.LastName) as "Name",
	c.charactername as "Character Name",
    m.title as "Movie"
	from credit c
    join actor a
    on c.actorID = a.ID
    join movie m
    on c.movieID = m.ID
    where (a.ID in (
		select a.ID
			from credit c
			join actor a
			on c.actorID = a.ID
			join movie m
			on c.movieID = m.ID
			where m.title = 'The Grand Budapest Hotel'
		) ||
        a.ID in (
		select a.ID
			from credit c
			join actor a
			on c.actorID = a.ID
			join movie m
			on c.movieID = m.ID
			where m.title = 'Ex Machina'
		))
        &&
        m.rating = 'R'
        order by a.lastName;    