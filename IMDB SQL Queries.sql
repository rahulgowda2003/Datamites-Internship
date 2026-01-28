use project_movie_database;
select 
*
from movies;

select
*
from directors;
------------------------------------------------------------------------------------------------------

#a)	Can you get all data about movies? 
select 
*
from movies;

#b)	How do you get all data about directors?
select
*
from directors;

#c)	Check how many movies are present in IMDB.
select
count(*)
from movies;

#d)	Find these 3 directors: James Cameron ; Luc Besson ; John Woo
select
*
from directors
where name in ('James Cameron' , 'Luc Besson' , 'John Woo');

#e)	Find all directors with name starting with S.
select
name
from directors
where name like 's%';

#f)	Count female directors.
select
distinct count(gender) `Total Female directors`
from directors
where gender =  1;

#g)	Find the name of the 10th first women directors?
select
name 
from directors
where gender = 1
order by name
limit 10;
 
#h)	What are the 3 most popular movies?
select
original_title movie,
popularity 
from movies
order by popularity desc
limit 3;

#i)	What are the 3 most bankable movies?
select
original_title movie,
revenue 
from movies
order by revenue desc
limit 3;

#j)	What is the most awarded average vote since the January 1st, 2000?
select
original_title,
vote_average
from movies
where year(release_date) >= '2000'
order by vote_average desc
limit 1;

#k)	Which movie(s) were directed by Brenda Chapman?
select
m.original_title
from movies m
join
directors d
on m.director_id = d.id
where d.name = 'Brenda Chapman';

#l)	Which director made the most movies?
select
d.name,
count(m.uid) movie_count
from movies m
join
directors d
on m.director_id = d.id
group by d.name
order by movie_count desc
limit 1;

#m)	Which director is the most bankable?
select
d.name,
m.revenue
from movies m
join
directors d
on m.director_id = d.id
order by m.revenue desc
limit 1;
