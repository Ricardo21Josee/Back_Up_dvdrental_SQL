/*Consulta para saber cuales peliculas no estan en el inventario*/
/*Check to see which movies aren't in the inventory*/

SELECT DISTINCT
    film.film_id,
	film.title
FROM film
LEFT JOIN inventory ON inventory.film_id = film.film_id
WHERE inventory.inventory_id IS NULL;
