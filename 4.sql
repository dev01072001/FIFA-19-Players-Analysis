create database fifa19;
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
load  data local infile 'D:\GOOGLE DATA ANALYST\ANALYTICS VIDHYA\SQL\players.csv' into table fifa_19
fields terminated by ','
ignore 1 lines;
SHOW VARIABLES LIKE 'secure_file_priv';
LOAD DATA INFILE 'D:\\GOOGLE DATA ANALYST\\ANALYTICS VIDHYA\\SQL\\players.csv' INTO TABLE fifa_19
FIELDS TERMINATED BY ','
IGNORE 1 LINES;
ALTER TABLE fifa_19 CONVERT TO CHARACTER SET utf8mb4;
LOAD DATA INFILE 'D:\\GOOGLE DATA ANALYST\\ANALYTICS VIDHYA\\SQL\\players.csv' 
INTO TABLE fifa_19 
CHARACTER SET utf8mb4 
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES;
select * from fifa_19;
#Answer-1
 select count(*) from fifa_19;
 #Answer-2
 select count(distinct nationality) from fifa_19; 
 #Answer-3
 select nationality,count(nationality) from fifa_19 group by nationality order by count(nationality) desc limit 3;
 #Answer-4
 select sum(wage) from fifa_19;
 select avg(wage) from fifa_19;
 select stddev(wage) from fifa_19;
 #Answer 5
 SELECT name, wage
FROM fifa_19
WHERE wage = (SELECT MAX(wage) FROM fifa_19);

SELECT name, wage
FROM fifa_19
WHERE wage = (SELECT min(wage) FROM fifa_19);
#answer-6
SELECT name, overallrating
FROM fifa_19
WHERE overallrating = (SELECT min(overallrating) FROM fifa_19);

SELECT name, overallrating
FROM fifa_19
WHERE overallrating = (SELECT max(overallrating) FROM fifa_19);

#Answer-7
select club,sum(overallrating) from fifa_19 group by club order by sum(overallrating) desc limit 1; 

select club,avg(overallrating) from fifa_19 group by club order by avg(overallrating) desc limit 1; 
#Answer-8
select club,avg(overallrating) from fifa_19 group by club order by avg(overallrating) desc limit 5; 
#Answer-9
select preferredfoot,count(preferredfoot) from fifa_19 group by preferredfoot;
#Answer-10
select name,jersey from fifa_19 where value = (select max(value) from fifa_19);
select name,jersey from fifa_19 where overallrating = (select max(overallrating) from fifa_19);
select name,jersey from fifa_19 where wage = (select max(wage) from fifa_19);

#Answer 11;

SELECT club, nationality, COUNT(nationality) AS count
FROM fifa_19
WHERE club LIKE 'm%'
GROUP BY club, nationality;

#Answer-12
select count(joined) from fifa_19 data where joined between '2018-05-20' and '2019-04-10';

#Answer-13
select date(joined),count(*) from fifa_19 group by date(joined);

#Answer-14
select year(joined),count(*) from fifa_19 group by year(joined);