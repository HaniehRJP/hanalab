USE sakila;

#List the number of films per category.
SELECT name, COUNT(film_id) AS number_of_films
FROM film
INNER JOIN category
USING(last_update)
GROUP BY category;

#Retrieve the store ID, city, and country for each store
SELECT store_id, city, country
FROM store
INNER JOIN address
USING(address_id)
INNER JOIN city
USING(city_id)
INNER JOIN country
USING(country_id);

#Calculate the total revenue generated by each store in dollars.
SELECT SUM(payment.amount) AS total_revenue, store_id
FROM store
INNER JOIN staff
USING(store_id)
INNER JOIN payment
USING(staff_id)
GROUP BY store_id;

#Determine the average running time of films for each category.
SELECT category_id, AVG(film.length)
FROM category
INNER JOIN film_category
USING(category_id)
INNER JOIN film
USING(film_id)
GROUP BY category_id;