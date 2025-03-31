/*Encuentra todos los alquileres hehcos por Barbara Jones*/
/*Find all rentals made by Barbara Jones*/

SELECT 
	*
FROM rental INNER JOIN customer ON rental.customer_id = customer.customer_id
WHERE first_name = 'Barbara' AND last_name = 'Jones'
ORDER BY rental_date ASC
