/*De la tabla "Film" retorna el titulo y la duracion de las 10 peliculas con mayor duracion
en orden alfabetico*/

SELECT *
FROM film
WHERE length > 180
ORDER BY title ASC, length DESC Limit 10;