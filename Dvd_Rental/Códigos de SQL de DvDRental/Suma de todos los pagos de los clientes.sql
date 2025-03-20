/*Retornar la suma de todos los pagos por cliente que han pagado más de $7.99 alguna vez*/

SELECT 
	c.first_name,
    c.last_name,
    p.customer_id,
SUM (amount)
FROM payment p JOIN customer c ON p.customer_id = c.customer_id  
GROUP BY 
    c.first_name, c.last_name, p.customer_id
HAVING MAX (amount) > 7.99
ORDER BY customer_id ASC