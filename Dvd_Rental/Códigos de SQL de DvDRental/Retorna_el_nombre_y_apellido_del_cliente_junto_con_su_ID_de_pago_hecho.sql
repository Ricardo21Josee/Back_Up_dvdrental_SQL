/*Esta consulta devuelve el nombre y apellido junto con los ID de pagos que han hehco los clientes*/

SELECT payment.payment_id,
	   payment.customer_id,
	   customer.first_name,
	   customer.last_name
FROM payment LEFT JOIN customer ON payment.customer_id = customer.customer_id
ORDER BY customer_id ASC
