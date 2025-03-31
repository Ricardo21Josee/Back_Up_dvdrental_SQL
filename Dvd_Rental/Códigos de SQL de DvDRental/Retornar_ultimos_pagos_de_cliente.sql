/*De la tabla "Payments" retorna los ultimos 3 pagos menores o iguales a 4.99 hechos por el cliente 322*/
/*From the "Payments" table, return the last 3 payments less than or equal to 4.99 made by customer 322*/

SELECT *
FROM payment
WHERE amount <= 4.99 AND customer_id = 322
ORDER BY payment_date DESC
LIMIT 5;
