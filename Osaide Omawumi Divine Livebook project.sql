use project1;
select * from actions;
select * from top_events;
select * from top_three_actions;
select * from time_of_day_event_count;
select * from hourly_event_count;
select * from event_count;
select * from daily_event_count;
select * from hourly_event_count;
select * from time_of_day_event_count;
select * from top_three_actions;
select * from top_three_ids;
select * from total_entries;
select * from total_users;
select * from users_events;

select count(*) from actions;

select event_type, count(event_type) as event_count from actions group by event_type order by event_count desc;

create table event_count as (select event_type, count(event_type) as event_count from actions group by event_type order by event_count desc);

create table least_events as (select event_type, count(event_type) as event_count from actions group by event_type order by event_count limit 5);

create table top_events as (select event_type, count(event_type) as event_count from actions group by event_type order by event_count desc limit 5);

select product_id, count(product_id) as product_count from actions group by product_id order by product_count desc;

select account_id, count(event_type) as events from actions group by account_id order by events desc;

create table users_events as (select account_id, count(event_type) as events from actions group by account_id order by events desc);

select account_id, count(event_type) as events from actions group by account_id order by events desc limit 3;

create table top_three_ids as (select account_id, count(event_type) as events from actions group by account_id order by events desc limit 3);

 create table total_entries as (select count(account_id) as Total_Entries from actions);
 create table total_users as (select count(distinct account_id) as Total_Users from actions);
 
 select date_format(event_time, '%H:%i') as time_of_the_day, count(*) as event_count
 from actions group by time_of_the_day order by time_of_the_day;
 
 create table time_of_day_event_count as (select date_format(event_time, '%H:%i') as time_of_the_day, count(*) as event_count
 from actions group by time_of_the_day order by time_of_the_day);
 
 
 select date_format(event_time, '%Y') as Year, date_format(event_time, '%M') as Month, date_format(event_time, '%D') as Day, count(*) as event_count
 from actions group by  year,month,day order by month desc,day ; 
 
 select date_format(event_time, "%Y-%m-%d") as event_date , count(*) as event_count
 from actions group by  event_date order by event_date; 
 
 create table daily_event_count as ( select date_format(event_time, "%Y-%m-%d") as event_date , count(*) as event_count
 from actions group by  event_date order by event_date);
 
 select date_format(event_time, '%H') as Hourly_entry, count(*) as event_count
 from actions group by Hourly_entry order by Hourly_entry;
 
 create table hourly_event_count as (select date_format(event_time, '%H') as Hourly_entry, count(*) as event_count
 from actions group by Hourly_entry order by Hourly_entry);
  
 SELECT * FROM actions 
WHERE account_id IN ('caffe2b03e6057845c52212acaaa1a34', '0c2a23a1ce63aa22296072df5cd065f7', '954c5420b7247345858b62c84d606bb7');

create table top_three_actions as (SELECT * FROM actions 
WHERE account_id IN ('caffe2b03e6057845c52212acaaa1a34', '0c2a23a1ce63aa22296072df5cd065f7', '954c5420b7247345858b62c84d606bb7'));

 create table daily_users as ( select date_format(event_time, "%Y-%m-%d") as event_date , count(distinct account_id) as users
 from actions group by  event_date order by event_date);
show tables; 
