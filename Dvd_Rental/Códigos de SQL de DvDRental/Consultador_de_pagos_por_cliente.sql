/*Codigo para consultar el ID de los pagos hechos por el cliente*/
/*Code to consult the ID of the payments made by the client*/

SELECT
	payment.payment_id,
	payment.customer_id,
	customer.first_name,
	customer.last_name
FROM payment LEFT JOIN customer ON payment.customer_id = customer.customer_id 
ORDER BY payment.customer_id ASC;
