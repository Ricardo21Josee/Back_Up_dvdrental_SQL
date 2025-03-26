/*Hace que aparezcan las películas que tengan categoría definida*/
SELECT 
    film.film_id,
    film.title,
    film.description,
    film_category.category_id,
    category.name AS category_name
FROM film
LEFT JOIN film_category ON film.film_id = film_category.film_id
LEFT JOIN category ON film_category.category_id = category.category_id;



/*Codigo para ver si hay peliculas que no tengan una categoría definida*/
/*
SELECT 
    film.*
FROM film
LEFT JOIN film_category ON film.film_id = film_category.film_id
WHERE film_category.category_id IS NULL;
*/
