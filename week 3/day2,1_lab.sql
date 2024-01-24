USE sakila;

#Display all available tables in the Sakila database.
SHOW TABLES;
#Retrieve all the data from the tables actor, film and customer
SELECT * FROM actor;
SELECT * FROM film;
SELECT * FROM customer;
#Retrieve the following columns from their respective tables:
#Titles of all films from the film table
SELECT title 
FROM film;
#List of languages used in films, with the column aliased as language from the language table
SELECT  DISTINCT name 
FROM language;
#List of first names of all employees from the staff table

SELECT DISTINCT first_name 
FROM staff;
#Retrieve unique release years
SELECT DISTINCT release_year
FROM film;
#Determine the number of stores that the company has.
SELECT COUNT(store_id)
FROM store;
#Determine the number of employees that the company has.
SELECT COUNT(staff_id)
FROM staff;
#Determine how many films are available for rent and how many have been rented.
SELECT DISTINCT COUNT(film_id)
FROM film;

SELECT DISTINCT COUNT(film_id)
FROM inventory;
#Determine the number of distinct last names of the actors in the database.
SELECT DISTINCT COUNT(last_name)
FROM actor
#Retrieve the 10 longest films.

SELECT length, film_id
FROM film
ORDER BY length DESC
LIMIT 10;
#Use filtering techniques in order to:
#7.1 Retrieve all actors with the first name "SCARLETT".

SELECT actor_id, first_name
FROM actor
WHERE first_name = 'SCARLETT';
