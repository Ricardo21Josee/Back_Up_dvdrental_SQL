/*De la tabla "Payment" retornar el monto de todos los pagos hechos por el cliente 341*/

SELECT 
	customer_id,
	amount,
	payment_date
FROM 
	payment
WHERE
	customer_id =341;