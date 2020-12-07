/* SQL "Sakila" database query exercises - phase 1 */

-- Database context
USE sakila;

-- Your solutions...
--1
select first_name, last_name from actor where first_name = 'Scarlett';

--2
select first_name, last_name from actor where last_name = 'Johansson';

--3
select count(distinct(last_name)) distinct_last_name from actor;

--4
select last_name, count(*) from actor
group by last_name having count(*) = 1;

--5
select last_name, count(*) from actor
group by last_name having count(*) > 1;

--6
select a.first_name, a.last_name, count(fa.film_id) film_max
from film_actor fa join actor a on fa.actor_id = a.actor_id
group by fa.actor_id order by film_max desc limit 1;

--7
select f.title, i.store_id from inventory i
right join film f on i.film_id = f.film_id
where f.title = 'Academy Dinosaur';

--8
select * from customer where first_name = 'Mary' and last_name = 'Smith';
select film_id, title from film where title = 'Academy Dinosaur';
select staff_id, store_id from staff where first_name = 'Mike' and last_name = 'Hillyer';
insert into rental (customer_id, inventory_id, staff_id, rental_date) values (1, 1, 1, now());

--9

--10
select avg(length) as average_run_time from film_list;

--11
select category, avg(length) as average_run_time
from film_list group by category;

--12
--The last_update column is common between the two tables, but its not likely that
--both the film_id (the other matching column) and the last_update column will both
--match between the two tables because date time is very specific.