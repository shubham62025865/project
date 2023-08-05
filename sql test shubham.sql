create database score_db;
use score_db;
## 1. From the following table, write a SQL query to count the number of countries that par cipated in the 2016-EURO Cup. 
-- use table player_mast 
select*from player_mast;
select count(distinct playing_club)
from player_mast
where dt_of_bir =2016;

# 2. From the following table, write a SQL query to find the number of matches that ended with a result. 
-- use table match_mast 
select*from match_mast;
select count(*)
from match_mast
where results <> 'draw';

# 3. From the following table, write a SQL query to find out when the Football EURO cup 2016 will begin. 
-- use table match_mast 
select min(play_date)
from match_mast
where venue_id="2016";

# 4. From the following table, write a SQL query to find out where the final match of the EURO cup 2016 was played.  
-- Return venue name, city. 
-- use tables: soccer_venue, soccer_city, match_mast 
select*from soccer_venue;
select*from soccer_city;
select*from match_mast;

select venue_name,city
from soccer_venue
join soccer_city on soccer_venue.city_id=soccer_city.city_id
where match_mast.venue_id="2016"
and match_mast.results="final";

# 5. From the following tables, write a SQL query to find the number of goals scored by each team in each match during normal play.  
-- Return match number, country name and goal score.  
-- use tables: match_details, soccer_country 
 select*from match_details;
 select*from soccer_country;
 select md.match_no,sc.country_name,md.goal_score
 from match_details md
 join soccer_country sc on md.country_id=sc.country_id
 where md.decide_by="n";
 
 # 6. From the following table, write a SQL query to count the number of goals scored by each player within a normal play schedule.  
-- Group the result set on player name and country name and sorts the result-set according to the highest to the lowest scorer.  
-- Return player name, number of goals and country name. 
-- use tables: goal_details, player_mast, soccer_country 
 select*from goal_details;
 select*from player_mast;
 select*from soccer_country;
 
 select p.player_name,count(gd.goal_id) as number_of_goal,c.country_name
 from goal_details gd
 join player_mast p on gd.player_id=p.player_id
 join soccer_country c on p.country_id=c.country_id
 where gd.goal_schedule="nt"
 group by p.player_name,c.country_name
 order by goal_time desc;
 
 # 7. From the following table, write a SQL query to find out who scored the most goals in the 2016 Euro Cup.  
-- Return player name, country name and highest individual scorer.  
-- use tables: goal_details, player_mast, soccer_country 
select p.player_name,c.country_name,max(gd.goal_scored) as highest_individual_scorer
from goal_details gd
join player_mast p on gd.player_id=player_id
join soccer_country c on p.country_id= c.country_id
where gd.tournament_year=2016
group by p.player_name,c.country_name
order by highest_individual_scorer desc
limit 1;

# 8. From the following table, write a SQL query to find out which teams played the first match of the 2016 Euro Cup.  
-- Return match number, country name. 
-- use tables match_details, soccer_country
select*from match_details;
select*from soccer_country; 
select md.match_no,sc.country_name
from match_details md
join soccer_country sc on md.team_id=sc.country_id
where md.tournament_year and md.match_no=1;

# 9. From the following table, write a SQL query to find the highest audience match.  
-- Return match_no, play_stage, goal_score, audience. 
-- use table match_mast 
 
select match_no,play_stage,goal_score,audience
from match_mast
order by audience desc
limit 1;
# 10. Write a SQL query to find the players who scored goals in each match.  
-- Group the result set on match number, country name and player name.  
-- Sort the result-set in ascending order by match number.  
-- Return match number, country name, player name and number of goals. 

 

 

