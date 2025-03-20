/*Retorna la cantidad de pagos hechos por cada monto por cada cliente*/

SELECT 
    p.amount,
    c.first_name,
    c.last_name,
    c.customer_id,
    COUNT(*) AS payment_count
FROM 
    payment p
JOIN 
    customer c ON p.customer_id = c.customer_id  
GROUP BY 
    p.amount, c.first_name, c.last_name, c.customer_id  
ORDER BY 
    c.customer_id ASC;