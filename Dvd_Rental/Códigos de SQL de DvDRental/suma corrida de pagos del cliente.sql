/*Suma corrida de pagos del cliente*/

SELECT 
    customer_id,
    amount AS "PAGOS",
    SUM(amount) OVER (PARTITION BY customer_id ORDER BY payment_date ASC) AS "SUMA CORRIDA",
    SUM(amount) OVER (PARTITION BY customer_id) AS "SUMA TOTAL",
    (amount / SUM(amount) OVER (PARTITION BY customer_id)) * 100 AS "PORCENTAJE DEL TOTAL"
FROM 
    payment;