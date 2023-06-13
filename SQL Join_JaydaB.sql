use sakila;

# 1. List the number of films per category.

select fc.category_id, c.name as category_name, count(*) as film_count
from film_category as fc
left join category as c on fc.category_id = c.category_id
group by fc.category_id;

# 2. Display the first and the last names, as well as the address, of each staff member.

select first_name, last_name, address.address
from staff
left join address on staff.address_id = address.address_id;

# 3. Display the total amount rung up by each staff member in August 2005.

select r.staff_id, sum(p.amount) as total_amount
from rental as r
left join payment as p on r.rental_id = p.rental_id
where r.rental_date >= '2005-08-01' and r.rental_date < '2005-09-01'
group by r.staff_id;

# 4. List all films and the number of actors who are listed for each film.

select f.title, count(a.actor_id) as actor_count
from film as f
left join film_actor as fa on f.film_id = fa.film_id
left join actor as a on fa.actor_id = a.actor_id
group by f.title;

# 5. Using the payment and the customer tables as well as the JOIN command, list the total amount paid by each customer. List the customers alphabetically by their last names.

select c.customer_id, c.last_name, SUM(p.amount) AS total_amount
from customer as c
left join payment as p on c.customer_id = p.customer_id
group by c.customer_id, c.last_name
order by c.last_name;