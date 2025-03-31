/*De la tabla "Payment" retornar el monto de todos los pagos hechos por el cliente 341*/
/*From the "Payment" table, return the amount of all payments made by customer 341*/

SELECT 
	customer_id,
	amount,
	payment_date
FROM 
	payment
WHERE
	customer_id =341;
