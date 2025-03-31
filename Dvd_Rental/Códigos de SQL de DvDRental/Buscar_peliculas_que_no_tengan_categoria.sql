/*Hace que aparezcan las películas que tengan categoría definida*/
/*Makes movies that have a defined category appear*/
SELECT 
    film.film_id,
    film.title,
    film.description,
    film_category.category_id,
    category.name AS category_name
FROM film
LEFT JOIN film_category ON film.film_id = film_category.film_id
LEFT JOIN category ON film_category.category_id = category.category_id;


--Other Option--
/*Codigo para ver si hay peliculas que no tengan una categoría definida*/
/*Code to see if there are movies that don't have a defined category*/

/*
SELECT 
    film.*
FROM film
LEFT JOIN film_category ON film.film_id = film_category.film_id
WHERE film_category.category_id IS NULL;
*/
