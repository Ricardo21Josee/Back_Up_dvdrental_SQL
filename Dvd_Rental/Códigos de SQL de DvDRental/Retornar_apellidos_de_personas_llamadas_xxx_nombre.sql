/*De la tabla "Customer" retornar el apellido de todos los que se llamen "Mary"*/
/*From the "Customer" table, return the last name of all those named "Mary"*/

SELECT 
	first_name,
	last_name
FROM customer
WHERE first_name = 'Mary';
