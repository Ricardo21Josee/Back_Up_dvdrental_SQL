/*De la tabla "Customer" retornar el apellido de todos los que se llamen "Mary"*/

SELECT 
	first_name,
	last_name
FROM customer
WHERE first_name = 'Mary';