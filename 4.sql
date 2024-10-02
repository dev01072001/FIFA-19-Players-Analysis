#creating a Database
create database fifa19;

# creating a table using above databse
use fifa19;
create table fifa_19 (id int(10),
name varchar(50),
age int(5),
nationality varchar(50),
overallrating int(11),
potentialrating int(11),
club varchar(50),
value int(11),
wage int(11),
preferredfoot enum('right','left'),
jersey int(3),
joined date,
height varchar(10),
weight int(5),
penalties int(3));
desc fifa_19;

#loading data into table
LOAD DATA INFILE 'D:\\GOOGLE DATA ANALYST\\ANALYTICS VIDHYA\\SQL\\players.csv' 
INTO TABLE fifa_19 
CHARACTER SET utf8mb4 
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES;
select * from fifa_19;

 #Answer-1 
 (How many Players are there in the dataset?)
 select count(*) from fifa_19;

 #Answer-2
 (How Many Nationalities do these Players Belog to?)
 select count(distinct nationality) from fifa_19; 

 #Answer-3
 (Which Nationality has he highest number of players, what are the top 3 nationalities by number of Players?)
 select nationality,count(nationality) from fifa_19 group by nationality order by count(nationality) desc limit 3;

 #Answer-4
 (What is the total wage given to all players? What is the average and standard deviation?)
 select sum(wage) from fifa_19;
 select avg(wage) from fifa_19;
 select stddev(wage) from fifa_19;

 #Answer 5
 (Which player has the heighest wage and who has the lowest?)
 SELECT name, wage
FROM fifa_19
WHERE wage = (SELECT MAX(wage) FROM fifa_19);

SELECT name, wage
FROM fifa_19
WHERE wage = (SELECT min(wage) FROM fifa_19);

#answer-6
(Who are the players having best and worst overall ratings?)
SELECT name, overallrating
FROM fifa_19
WHERE overallrating = (SELECT min(overallrating) FROM fifa_19);

SELECT name, overallrating
FROM fifa_19
WHERE overallrating = (SELECT max(overallrating) FROM fifa_19);

#Answer-7
(Clubs having the highest total of overall rating and highest average of overall rating?) 
select club,sum(overallrating) from fifa_19 group by club order by sum(overallrating) desc limit 1; 

select club,avg(overallrating) from fifa_19 group by club order by avg(overallrating) desc limit 1; 

#Answer-8
(Which are the top 5 clubs based on the average rating of their players?)
select club,avg(overallrating) from fifa_19 group by club order by avg(overallrating) desc limit 5; 

#Answer-9
(What is distribution of palyers based on preferred foot?)
select preferredfoot,count(preferredfoot) from fifa_19 group by preferredfoot;

#Answer-10 (Which jersey number is the luckiest?)
select name,jersey from fifa_19 where value = (select max(value) from fifa_19);
select name,jersey from fifa_19 where overallrating = (select max(overallrating) from fifa_19);
select name,jersey from fifa_19 where wage = (select max(wage) from fifa_19);

#Answer 11
(What is the frequency distribution of nationalities among players whose club name starts with M?)
SELECT club, nationality, COUNT(nationality) AS count
FROM fifa_19
WHERE club LIKE 'm%'
GROUP BY club, nationality;

#Answer-12
(How many plyers have joined their respective clubs in the data range 20 may 2018 to 10 April 2019(both included)?)
select count(joined) from fifa_19 data where joined between '2018-05-20' and '2019-04-10';

#Answer-13
( How many players have Joined their respective clubs date wise?)
select date(joined),count(*) from fifa_19 group by date(joined);

#Answer-14 
( How many players have joined their respective clubs yearly?)
select year(joined),count(*) from fifa_19 group by year(joined);
