/*De la tabla "Film" retorna la cantidad de valores únicos en la columna "rental_rate" para aquellas peliculas que duren 90 min exactos*/
/*From the "Film" table, return the number of unique values ​​in the "rental_rate" column for those movies that last exactly 90 minutes*/

SELECT 
    title, 
    COUNT(DISTINCT rental_rate) AS unique_rental_rates
FROM 
    film
WHERE 
    length = 90
GROUP BY 
    title;
