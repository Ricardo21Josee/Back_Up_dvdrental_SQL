/*Suma en cascada de todos los pagos que han hecho los clientes*/
/*Cascade sum of all payments made by customers*/

SELECT 
	customer_id,
	payment_id,
	payment_date,
	amount,
SUM (amount) OVER (PARTITION BY customer_id ORDER BY payment_date ASC) AS "Suma Acumulada"
FROM payment
