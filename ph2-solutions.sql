/* SQL "Sakila" database query exercises - phase 1 */

-- Database context
USE sakila;

-- Your solutions...
--1a
select first_name, last_name from actor;

--1b
select concat(upper(first_name), ' ',upper(last_name)) 'Actor Name' from actor;

--2a
select actor_id, first_name, last_name from actor where first_name = 'Joe';

--2b
select first_name, last_name from actor where last_name like '%gen%';

--2c
select last_name, first_name from actor where last_name like '%li%' order by last_name, first_name;

--2d
select country_id, country from country where country in ('Afghanistan','Bangladesh', 'China');

--3a
alter table actor add middle_name varchar(45) after first_name;

--3b
alter table actor modify column middle_name blob;

--3c
alter table actor drop column middle_name;

--4a
select last_name, count(*)
from actor group by last_name
order by count(*) desc;

--4b
select last_name, count(*)
from actor group by last_name
having count(*) > 1 order by count(*) desc;

--4c
update actor set first_name = 'HARPO'
where last_name = 'Williams' and first_name = 'Groucho';

--4d





--5a
show create table address;

--6a
select concat(s.first_name, ' ', s.last_name), a.address
from staff s
left join address a on s.address_id = a.address_id;

--6b
select concat(s.first_name, ' ', s.last_name), count(*) transactions
from payment p right join staff s on p.staff_id = s.staff_id
where p.payment_date like '%2005-08%' group by p.staff_id;

--6c
select f.title, count(*) num_actors
from film_actor fa inner join film f on fa.film_id = f.film_id
group by fa.film_id order by count(*) desc;

--6d
select film_id, title from film where title = 'Hunchback Impossible';
select film_id, count(*) copies from inventory where film_id = 439;
--or
select f.title, count(*) copies
from inventory i join film f on i.film_id = f.film_id
where f.title = 'Hunchback Impossible';

--6e
select c.last_name, c.first_name, sum(p.amount) total_payment
from payment p join customer c on p.customer_id = c.customer_id
group by c.last_name, c.first_name order by c.last_name;

--7a


