/*Retorna las fechas del primer y ultimo alquiler hecho por cada cliente*/
/*Returns the dates of the first and last rental made by each client*/

SELECT 
	customer_id,
	MAX (rental_date), MIN (rental_date)
FROM rental
GROUP BY customer_id
ORDER BY customer_id ASC
