/*Retorna todos los alquileres junto la info del pago correpondiente, si es que existe*/

SELECT 
	*
FROM rental LEFT JOIN payment ON rental.rental_id = payment.rental_id
ORDER BY payment.rental_id ASC;