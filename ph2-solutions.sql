/* SQL "Sakila" database query exercises - phase 1 */

-- Database context
USE sakila;

-- Your solutions...
--1a
select first_name, last_name from actor;

--1b
select concat(upper(first_name), ' ',upper(last_name)) 'Actor Name' from actor;

--2a
select actor_id, first_name, last_name from actor
where first_name = 'Joe';

--2b
select first_name, last_name from actor
where last_name like '%gen%';

--2c
select last_name, first_name from actor
where last_name like '%li%' order by last_name, first_name;

--2d
select country_id, country from country
where country in ('Afghanistan','Bangladesh', 'China');

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
update actor set first_name = if(first_name = 'HARPO', 'GROUCHO', 'MUCHO GROUCHO')
where last_name = 'Williams' and first_name = 'Harpo';

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
select title from film
where (title like '\K%' OR title like '\Q%')
AND language_id = (select language_id from language where name = 'English');

--7b
select concat(a.first_name, ' ', a.last_name) actor from film_actor fa
join actor a on fa.actor_id = a.actor_id
where fa.film_id = (select f.film_id from film f where f.title = 'Alone Trip');

--7c
select c.first_name, c.last_name, c.email
from customer c where c.customer_id in
(select c.customer_id from customer c
join customer_list cl on c.customer_id = cl.ID
where cl.country = 'Canada');

--7d
select f.title from film f
join film_category fc on f.film_id = fc.film_id
where f.film_id in
(select fc.film_id from film_category fc
left join category c on fc.category_id = c.category_id
where c.name = 'family');

--7e
select f.title, x.num_rent
from (select i.film_id id, count(*) num_rent from rental r
left join inventory i on r.inventory_id = i.inventory_id group by i.film_id) x
left join film f on x.id = f.film_id order by x.num_rent desc;

--7f
select store, total_sales from sales_by_store;
--or
select i.store_id, sum(p.amount) business_in_dollars from inventory i
join rental r on i.inventory_id = r.inventory_id
join payment p on r.rental_id = p.rental_id group by i.store_id;

--7g
select s.store_id, c.city, ct.country from store s
join address a on s.address_id = a.address_id
join city c on a.city_id = c.city_id
join country ct on c.country_id = ct.country_id

--7h
select category, total_sales from sales_by_film_category
order by total_sales desc;

--7g
select cat.name, sum(p.amount) revenue from category cat
join film_category fc on cat.category_id = fc.category_id
join inventory i on fc.film_id = i.film_id
join rental r on i.inventory_id = r.inventory_id
join payment p on r.rental_id = p.rental_id
group by cat.category_id order by revenue desc limit 5;

--8a
create view top_five_genres_rev as
select cat.name, sum(p.amount) revenue from category cat
join film_category fc on cat.category_id = fc.category_id
join inventory i on fc.film_id = i.film_id
join rental r on i.inventory_id = r.inventory_id
join payment p on r.rental_id = p.rental_id
group by cat.category_id order by revenue desc limit 5;

--8b
select * from top_five_genres_rev;

 --8c
 drop view top_five_genres_rev;