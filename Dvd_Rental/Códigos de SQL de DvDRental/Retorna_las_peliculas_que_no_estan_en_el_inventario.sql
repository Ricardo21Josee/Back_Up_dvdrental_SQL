/*El codigo retorna los titulos de peliculas que no estan en el inventario*/
/*The code returns movie titles that are not in the inventory*/

SELECT 
	title
FROM film LEFT JOIN inventory ON inventory.film_id = film.film_id
WHERE inventory_id is NULL
