/*Retornar el titulo de todas las peliculas que se alquilan por 2.99 y que se alquilen por más de 5*/

SELECT 
    title
FROM 
    film
WHERE 
    rental_rate = 2.99 
    AND rental_duration >= 5;