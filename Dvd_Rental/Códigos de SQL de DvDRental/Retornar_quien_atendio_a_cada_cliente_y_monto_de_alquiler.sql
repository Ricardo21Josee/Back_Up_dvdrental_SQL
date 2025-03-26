/*Retornar quiena atendio a cada cliente y cuanto fue el monto de su alquiler*/

SELECT 
	customer.customer_id AS ID_Cliente,
	customer.first_name AS Nombre_Cliente,
	customer.last_name AS Apellido_Cliente,
	staff.first_name AS Nombre_Empleado,
	staff.last_name AS Apellido_Empleado,
	payment.amount AS Monto_que_cliente_pago_al_Empleado
FROM customer INNER JOIN payment ON payment.customer_id = customer.customer_id
INNER JOIN staff ON payment.staff_id = staff.staff_id
ORDER BY customer.customer_id ASC
