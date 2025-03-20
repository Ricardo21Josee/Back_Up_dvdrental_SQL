/*Retorna todos los clientes que tienen un promedio de pago mayor a $5*/

SELECT 
    c.first_name,
    c.last_name,
    p.customer_id,
    ROUND(AVG(p.amount), 2) AS promedio 
FROM 
    payment p JOIN customer c ON p.customer_id = c.customer_id  
GROUP BY 
    c.first_name, c.last_name, p.customer_id  
HAVING 
    ROUND(AVG(p.amount), 2) > 5  
ORDER BY 
    p.customer_id ASC;  

