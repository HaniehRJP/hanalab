#Step 1: Create a View
#First, create a view that summarizes rental information for each customer. The view should include the customer's ID, name, email address, 
#and total number of rentals (rental_count).
USE sakila;

CREATE VIEW summarizes_rental_information AS
SELECT customer_id, first_name, email, COUNT(rental_id) AS total_number_of_rentals
FROM customer
INNER JOIN rental
USING(customer_id)
GROUP BY customer_id
ORDER BY COUNT(rental_id);

SELECT * FROM summarizes_rental_information;

#2.Create a Temporary Table
#Next, create a Temporary Table that calculates the total amount paid by each customer (total_paid). 
#The Temporary Table should use the rental summary view created in Step 1 to join with the payment table and calculate the total 
#amount paid by each customer.
CREATE TEMPORARY TABLE total_paid_amount AS
SELECT 
customer_id, 
SUM(amount) AS total_paid,
first_name, 
email,
total_number_of_rentals
FROM summarizes_rental_information
INNER JOIN payment
USING(customer_id)
GROUP BY customer_id;

SELECT * FROM total_paid;
                        
#3: Create a CTE and the Customer Summary Report
WITH cte_Customer_Summary_Report  AS (SELECT 
											summarizes_rental_information.first_name, 
											summarizes_rental_information.email, 
											summarizes_rental_information.total_number_of_rentals, 
											SUM(total_paid_amount.total_paid) AS total_paid
									 FROM summarizes_rental_information
                                     INNER JOIN total_paid_amount
                                     USING(customer_id)
                                     GROUP BY customer_id)
   
SELECT * FROM cte_Customer_Summary_Report;
				
                    
#using the CTE, create the query to generate the final customer summary report
WITH cte_Customer_Summary_Report AS (
    SELECT 
        sr.customer_id,
        sr.first_name, 
        sr.email, 
        sr.total_number_of_rentals, 
        SUM(tpa.total_paid) AS total_paid
    FROM 
        summarizes_rental_information sr
    INNER JOIN 
        total_paid_amount tpa ON sr.customer_id = tpa.customer_id
    GROUP BY 
        sr.customer_id, sr.first_name, sr.email, sr.total_number_of_rentals
)

-- Final Customer Summary Report
SELECT 
    customer_id,
    first_name,
    email,
    total_number_of_rentals AS rental_count,
    total_paid,
    total_paid / total_number_of_rentals AS average_payment_per_rental
FROM 
    cte_Customer_Summary_Report;



