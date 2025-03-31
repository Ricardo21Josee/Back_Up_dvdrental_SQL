/*Muestra el historial de pagos del cliente "222" y además meustra el acumulado de sus pagos hasta el momento*/
/*Displays the payment history of customer "222" and also shows the accumulated payments so far*/

SELECT *,
SUM (amount) OVER (PARTITION BY customer_id ORDER BY payment_date ASC) AS "Suma Correlativa"
FROM payment
WHERE customer_id = 222
ORDER BY payment_date ASC;
