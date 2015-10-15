#http://sqlzoo.net/wiki/SELECT_within_SELECT_Tutorial

#1.List each country name where the population is larger than 'Russia'. 

select name
from world
where population>(select population from world where name='Russia')

#2.Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.

select name
from world
where continent='Europe'
and gdp/population>(select gdp/population from world where name='United Kingdom')

#3.List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country.

select name,continent
from world
where continent in (select continent from world where name in ('Argentina','Australia'))
order by name 

#4.Which country has a population that is more than Canada but less than Poland? Show the name and the population.

select name,population
from world
where population>(select population from world where name='Canada') 
and population<(select population from world where name='Poland')

#5.Show the name and the population of each country in Europe. Show the population as a percentage of the population of Germany.

select name, concat(round(population*100/(select population from world where name='Germany'),0),'%')
from world
where continent='Europe'

#6.Which countries have a GDP greater than every country in Europe? 

select name
from world
where gdp>(select max(gdp) from world where continent='Europe')

#7.Find the largest country (by area) in each continent, show the continent, the name and the area: 

select w1.continent,w1.name,w1.area
from world w1
where w1.area=(select max(w2.area) from world w2 where w1.continent=w2.continent)

#8.List each continent and the name of the country that comes first alphabetically.

select w1.continent,w1.name
from world w1
where w1.name<=all(select w2.name from world w2 where w1.continent=w2.continent)


