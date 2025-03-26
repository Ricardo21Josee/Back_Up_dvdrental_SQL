/*Para cada alquiler encuentra el nombre del cliente que alquilo y el empleado que hizo la transaccion*/ 

SELECT 
    customer.customer_id AS id_cliente,
    customer.first_name AS nombre_cliente,
    customer.last_name AS apellido_cliente,
    staff.staff_id AS id_empleado,
    staff.first_name AS nombre_empleado,
    staff.last_name AS apellido_empleado
FROM rental
INNER JOIN customer ON rental.customer_id = customer.customer_id
INNER JOIN staff ON rental.staff_id = staff.staff_id
ORDER BY customer.customer_id ASC;
