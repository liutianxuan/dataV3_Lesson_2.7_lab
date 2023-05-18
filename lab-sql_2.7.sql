-- Lab SQL Join (Part I)
use sakila;

-- How many films are there for each of the categories in the category table. Use appropriate join to write this query.
SELECT c.name as category_name, count(f.film_id) as film_num
FROM sakila.category c
INNER JOIN sakila.film_category f
ON c.category_id = f.category_id
GROUP BY category_name
ORDER BY film_num DESC;

-- Display the total amount rung up by each staff member in August of 2005.
SELECT p.staff_id, SUM(p.amount) as total_amount
FROM sakila.payment p
WHERE p.payment_date BETWEEN '2005-08-01' AND '2005-08-31'
GROUP BY p.staff_id;

-- Which actor has appeared in the most films?
SELECT a.first_name, a.last_name, count(fa.actor_id) as acted_in
FROM sakila.film_actor fa
INNER JOIN sakila.actor a
ON fa.actor_id = a.actor_id
GROUP BY a.actor_id
ORDER BY acted_in DESC;

-- Most active customer (the customer that has rented the most number of films)
SELECT c.first_name, c.last_name, count(r.customer_id) as rented
FROM sakila.rental r
INNER JOIN sakila.customer c
ON r.customer_id = c.customer_id
GROUP BY r.customer_id, c.first_name, c.last_name
ORDER BY rented DESC;

-- Display the first and last names, as well as the address, of each staff member.
SELECT pp.first_name, pp.last_name, ad.address
FROM sakila.staff pp
INNER JOIN sakila.address ad
ON pp.address_id = ad.address_id
GROUP BY pp.staff_id;

-- List each film and the number of actors who are listed for that film.
SELECT fa.film_id, f.title, count(fa.actor_id) as actor_num
FROM sakila.film_actor fa
INNER JOIN sakila.film f
ON fa.film_id = f.film_id
GROUP BY fa.film_id, f.title;

-- Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
SELECT c.last_name, c. first_name, SUM(p.amount) as total_paid
FROM sakila.payment p
INNER JOIN sakila.customer c
ON p.customer_id = c.customer_id
GROUP BY c.customer_id
ORDER BY c.last_name ASC;

-- List number of films per category.
SELECT c.name, count(f.film_id) as film_num
FROM sakila.category c
INNER JOIN sakila.film_category f
ON c.category_id = f.category_id
GROUP BY c.name;

