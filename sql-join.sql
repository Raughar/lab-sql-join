USE sakila;

-- List the number of films per category.
SELECT category.name AS Category, COUNT(film_category.film_id) AS Number_Of_Films
FROM category
INNER JOIN film_category ON category.category_id = film_category.category_id
GROUP BY category.name
ORDER BY Number_Of_Films DESC;

-- Display the first and the last names, as well as the address, of each staff member.
SELECT staff.first_name, staff.last_name, address.address
FROM staff
INNER JOIN address ON staff.address_id = address.address_id;

-- Display the total amount rung up by each staff member in August 2005.
SELECT staff.staff_id, staff.first_name, staff.last_name, SUM(payment.amount) AS Total_Amount
FROM staff
JOIN payment ON staff.staff_id = payment.staff_id
JOIN rental ON payment.rental_id = rental.rental_id
WHERE payment.payment_date LIKE '2005-08%' 
GROUP BY staff.staff_id, staff.first_name, staff.last_name
ORDER BY Total_Amount DESC;

-- List all films and the number of actors who are listed for each film.
SELECT film.title AS Film_Title, COUNT(film_actor.actor_id) AS Number_Of_Actors
FROM film
LEFT JOIN film_actor ON film.film_id = film_actor.film_id
GROUP BY film.title
ORDER BY Number_Of_Actors DESC;

-- Using the payment and the customer tables as well as the JOIN command, list the total amount paid by each customer. List the customers alphabetically by their last names.
SELECT customer.customer_id, customer.last_name, customer.first_name, SUM(payment.amount) AS Total_Amount_Paid
FROM customer
LEFT JOIN payment ON customer.customer_id = payment.customer_id
GROUP BY customer.customer_id, customer.last_name, customer.first_name
ORDER BY customer.last_name, customer.first_name;