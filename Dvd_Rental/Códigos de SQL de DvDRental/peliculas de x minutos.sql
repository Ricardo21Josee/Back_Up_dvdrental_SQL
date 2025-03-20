/*De la tabla "Film" retorna la cantidad de valores únicos en la columna "rental_rate" para aquellas 
peliculas que duren 90 min exactos*/


SELECT 
    title, 
    COUNT(DISTINCT rental_rate) AS unique_rental_rates
FROM 
    film
WHERE 
    length = 90
GROUP BY 
    title;