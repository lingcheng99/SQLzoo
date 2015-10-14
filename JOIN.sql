#http://sqlzoo.net/wiki/The_JOIN_operation

#1.Show matchid and player name for all goals scored by Germany. 

select matchid,player
from goal
where teamid='GER'

#2.From the previous query you can see that Lars Bender's goal was scored in game 1012.

select id,stadium,team1,team2
from game 
where id=1012

#3.Show the player, teamid and mdate and for every German goal. 

select player,teamid,mdate
from game join goal on matchid=id
where teamid='GER'

#4.Show the team1, team2 and player for every goal scored by a player called Mario

select team1,team2,player
from game join goal on matchid=id
where player like 'Mario%'

#5.Show player, teamid, coach, gtime for all goals scored in the first 10 minutes gtime<=10

select player, teamid, coach,gtime
from goal join eteam on teamid=id
where gtime<=10

#6.List the the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.

select mdate,eteam.teamname
from game join eteam on team1=eteam.id
where eteam.coach='Fernando Santos'

#7.List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'

select goal.player
from goal join game on matchid=game.id
where stadium='National Stadium, Warsaw'

#8.Instead show the name of all players who scored a goal against Germany.

select distinct player
from game join goal on matchid=game.id
where (team1='GER' or team2='GER') and teamid<>'GER'

#9.Show teamname and the total number of goals scored.

select teamname,count(*)
from eteam join goal on eteam.id=teamid
group by teamname

#10.Show the stadium and the number of goals scored in each stadium. 

select stadium,count(*)
from goal join game on game.id=matchid
group by stadium

#11.For every match involving 'POL', show the matchid, date and the number of goals scored.

select matchid,mdate, count(*)
from game JOIN goal ON matchid = id 
where (team1 = 'POL' OR team2 = 'POL')
group by matchid,mdate

#12.For every match where 'GER' scored, show matchid, match date and the number of goals scored by 'GER'

select matchid, mdate,count(teamid)
from game join goal on matchid=id
where teamid='GER'
group by matchid,mdate

#13.List every match with the goals scored by each team as shown















