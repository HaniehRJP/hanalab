USE lab_mysql;

INSERT INTO customers (customer_ID, name, phone_number, email, address, city, state_province, country, zip_postal_code)
VALUES 
    (10001, 'Pablo Picasso', '+34 636 17 63 82', '-', 'Paseo de la Chopera 14', 'Madrid', 'Madrid', 'Spain', 28045),
    (20001, 'Abraham Lincoln', '+1 305 907 7086', '-', '120 SW 8th St', 'Miami', 'Florida', 'United States', 33130),
    (30001, 'Napoléon Bonaparte', '+33 1 79 75 40 00', '-', '40 Rue du Colisée', 'Paris', 'Île-de-France', 'France', 75008);

INSERT INTO Sales_person (staff_ID, name, store) 
VALUES 
	(00001,	'Petey Cruiser', 'Madrid'), 
    (00002,	'Anna Sthesia',	'Barcelona'),
    (00003,	'Paul Molive', 'Berlin'),
    (00004,	'Gail Forcewind', 'Paris'), 
    (00005,	'Paige Turner', 'Miami'), 
    (00006,	'Bob Frapples',	'Mexico City'), 
    (00007,	'Walter Melon',	'Amsterdam'), 
    (00008,	'Shonda Leer', 'São Paulo');
    
INSERT INTO Cars (VIN, manufacturer, model, year, colour)
VALUES 
	(3K096I98581DHSNUP, 'Volkswagen', 'Tiguan', 2019, 'Blue'),
    (ZM8G7BEUQZ97IH46V, 'Peugeot', 'Rifter', 2019, 'Red'),
    (RKXVNNIHLVVZOUB4M,	'Ford', 'Fusion', 2018, 'White'),
    (HKNDGS7CU31E9Z7JW,	'Toyota', 'RAV4', 2018, 'Silver'), 
    (DAM41UDN3CHU2WVF6,	'Volvo', 'V60', 2019, 'Gray');

INSERT INTO Invoices (invoice_number, date, car, salesperson) 
VALUES 
	(852399038,	'22-08-2018',	'3K096I98581DHSNUP', '00003'),
	(731166526,	'31-12-2018',	'RKXVNNIHLVVZOUB4M', '00005'),
	(271135104,	'22-01-2019',	'ZM8G7BEUQZ97IH46V', '00007'); 
  
