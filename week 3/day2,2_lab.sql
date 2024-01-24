#Determine the shortest and longest movie durations and name the values as max_duration and min_duration.
USE sakila;
SELECT
    MAX(length) AS max_duration,
    MIN(length) AS min_duration
FROM film;

# Express the average movie duration in hours and minutes. Don't use decimals.
#Hint: Look for floor and round functions.

SELECT
    FLOOR(AVG(length) / 60) AS average_hours,
    FLOOR(AVG(length) % 60 )AS average_minutes
FROM film;

#Calculate the number of days that the company has been operating.
#Hint: To do this, use the rental table, and the DATEDIFF() function to subtract the earliest date in the rental_date column from the latest date.

SELECT DATEDIFF(MAX(rental_date), MIN(rental_date)) AS operating_dates
FROM rental;

#Retrieve rental information and add two additional columns to show the month and weekday of the rental. Return 20 rows of results.

SELECT 
    rental_id,
    rental_date,
    MONTH(rental_date) AS 'month of the rental',
    DAYNAME(rental_date) AS 'weekday of the rental'
FROM rental
LIMIT 20;


#You need to ensure that customers can easily access information about the movie collection. To achieve this, 
#retrieve the film titles and their rental duration. If any rental duration value is NULL, replace it with the string 
#'Not Available'. Sort the results of the film title in ascending order.

SELECT 
	title,
    rental_duration,
    IFNULL(rental_duration, 'Not Available') AS adjusted_duration
FROM film
ORDER BY title ASC;

