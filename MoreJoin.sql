#http://sqlzoo.net/wiki/More_JOIN_operations

#1.List the films where the yr is 1962 [Show id, title] 

SELECT id, title
 FROM movie
 WHERE yr=1962

#2.Give year of 'Citizen Kane'. 

select yr
from movie
where title='Citizen Kane'

#3.List all of the Star Trek movies, include the id, title and yr 
(all of these movies include the words Star Trek in the title). Order results by year. 

select id,title,yr
from movie
where title like 'Star Trek%'
order by yr

#4.What are the titles of the films with id 11768, 11955, 21191 

select title
from movie
where id in (11768,11955,21191)

#5.What id number does the actress 'Glenn Close' have? 

select id
from actor
where name='Glenn Close'

#6.What is the id of the film 'Casablanca' 

select id
from movie
where title='Casablanca'

#7.Obtain the cast list for 'Casablanca'. 

select name
from casting join actor on actorid=id
where movieid=11768
	
#8.Obtain the cast list for the film 'Alien' 

select name
from casting join actor on actorid=id
where movieid=(select id from movie where title='Alien')

#9.List the films in which 'Harrison Ford' has appeared 

select title
from movie join casting on movieid=id
where actorid=(select id from actor where name='Harrison Ford')

#10.List the films where 'Harrison Ford' has appeared - but not in the starring role.

select title
from movie join casting on movieid=id
where actorid=(select id from actor where name='Harrison Ford') and ord<>1

#11.List the films together with the leading star for all 1962 films. 
	
select movie.title,actor.name
from (movie join casting on movie.id=casting.movieid) 
	join actor on actor.id=casting.actorid
where movie.yr=1962 and casting.ord=1

#12.Which were the busiest years for 'John Travolta', show the year and the number of movies 
he made each year for any year in which he made more than 2 movies.

select yr,count(title) 
from movie join casting on movie.id=movieid
	join actor on actorid=actor.id
where name='John Travolta'
group by yr
having count(title)=(select max(c) 
from(
(select count(title) as c
from movie join casting on movieid=movie.id 
	join actor ON actorid=actor.id
 where name='John Travolta'
 group by yr)as t)

#13.List the film title and the leading actor for all of the films 'Julie Andrews' played in. 

select title,actor.name
from movie join casting on movie.id=movieid
	join actor on actorid=actor.id
where movieid in 
(select movieid from casting where actorid= 
(select id from actor where name='Julie Andrews'))
and ord=1

#14.Obtain a list, in alphabetical order, of actors who've had at least 30 starring roles. 

select actor.name
from actor join casting on actorid=id
where ord=1
group by actorid
having count(movieid)>=30
order by actor.name

#15.List the films released in the year 1978 ordered by the number of actors in the cast. 

select title,count(actorid) as actors
from movie join casting on id=movieid
where yr=1978
group by title
order by actors DESC 

#16.List all the people who have worked with 'Art Garfunkel'. 

select name
from actor join casting on actorid=id
where movieid in (
select movieid from actor join casting on actorid=id
where name='Art Garfunkel') and name<>'Art Garfunkel'




