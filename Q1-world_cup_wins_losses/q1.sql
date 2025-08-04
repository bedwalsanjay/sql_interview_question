-- DDL
create table icc_world_cup
(
Team_1 Varchar(20),
Team_2 Varchar(20),
Winner Varchar(20)
);

-- DML
INSERT INTO icc_world_cup values('India','SL','India');
INSERT INTO icc_world_cup values('SL','Aus','Aus');
INSERT INTO icc_world_cup values('SA','Eng','Eng');
INSERT INTO icc_world_cup values('Eng','NZ','NZ');
INSERT INTO icc_world_cup values('Aus','India','India');

-- Q1: Write a query to find the number of matches won and lost by each team in the ICC World Cup.
-- Solution
with cte as 
(
select Team_1 as Team  
, case when winner = Team_1 then 1 else 0 end as matches_win
, case when winner <> Team_1 then 1 else 0 end as matches_lost
from icc_world_cup
union all
select Team_2 as team 
, case when winner = Team_2 then 1 else 0 end as matches_win
, case when winner <> Team_2 then 1 else 0 end as matches_lost
from icc_world_cup
)
select 
team 
,count(1) total_match_played
,sum(matches_win) as matches_win 
,sum(matches_lost) as matches_lost
from cte group by team
