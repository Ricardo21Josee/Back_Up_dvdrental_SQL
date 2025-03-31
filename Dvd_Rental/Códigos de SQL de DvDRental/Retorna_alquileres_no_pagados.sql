/*Retorna todos los alquileres que no han sido pagados*/
/*Returns all unpaid rents*/

SELECT 
	*
FROM rental LEFT JOIN payment ON rental.rental_id = payment.rental_id	
WHERE payment.payment_id IS NULL
ORDER BY payment.rental_id ASC;
