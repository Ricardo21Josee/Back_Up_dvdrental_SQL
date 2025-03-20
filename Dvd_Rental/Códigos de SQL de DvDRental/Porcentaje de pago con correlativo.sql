/*Retorna el "customer_id", la fecha y el porcentaje acumulado que representa cada pago 
del total de pagos hecho por el cliente.*/

SELECT 
    customer_id,
    payment_date,
    amount AS "PAGO",
    SUM(amount) OVER (PARTITION BY customer_id ORDER BY payment_date ASC) AS "Correlativo de Pago",
    ROUND(
        (SUM(amount) OVER (PARTITION BY customer_id ORDER BY payment_date ASC) / 
        SUM(amount) OVER (PARTITION BY customer_id)) * 100, 2
    ) AS "Porcentaje Acumulado"
FROM 
    payment
WHERE 
    customer_id = 341
ORDER BY 
    payment_date ASC;

