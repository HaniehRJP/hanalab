CREATE DATABASE IF NOT EXISTS lab_mysql;

USE lab_mysql;


create table Cars(

VIN INT PRIMARY KEY NOT NULL UNIQUE,
manufacturer VARCHAR(45),
model VARCHAR(45),
year VARCHAR(45),
color VARCHAR(45),
customers_customer_ID INT,
customers_email VARCHAR(45),
Sales_person_staff_ID INT,
Invoices_invoice_number INT,
Invoices_customer VARCHAR(45));



Create TABLE customers (

customer_ID INT PRIMARY KEY UNIQUE NOT NULL,
name VARCHAR(20),
phone_number VARCHAR(45),
email VARCHAR(45),
address VARCHAR(45),
city VARCHAR(45),
state_province VARCHAR(45),
country VARCHAR(45),
zip_postal_code VARCHAR(45));



Create TABLE Sales_person(
staff_ID INT PRIMARY KEY UNIQUE NOT NULL,
name VARCHAR(45),
store VARCHAR(45),
Invoices_invoice_number INT ,
Invoices_customer VARCHAR(45),
customers_customer_ID INT ,
customers_email VARCHAR(45));


Create TABLE Invoices(
invoice_number INT PRIMARY KEY UNIQUE NOT NULL,
date VARCHAR(45),
car VARCHAR(45),
customer VARCHAR(45),
salesperson VARCHAR(45),
customers_customer_ID INT,
customers_email VARCHAR(45));

ALTER TABLE Invoices
ADD CONSTRAINT fk_customer_id
FOREIGN KEY (customers_customer_ID) REFERENCES customers(customer_ID);

ALTER TABLE Cars
ADD CONSTRAINT cars_fk_customer_id
FOREIGN KEY (customers_customer_ID) REFERENCES customers(customer_id);


ALTER TABLE Invoices
ADD CONSTRAINT invoice_fk_number
FOREIGN KEY (invoice_number) REFERENCES Sales_person(Invoices_invoice_number);

ALTER TABLE Cars
ADD CONSTRAINT fk_staff_ID
FOREIGN KEY (Sales_person_staff_ID) REFERENCES Sales_person(staff_ID);

SELECT * FROM lab_mysql.Cars;

