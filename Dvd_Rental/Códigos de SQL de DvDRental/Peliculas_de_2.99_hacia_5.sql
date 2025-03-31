/*Retornar el titulo de todas las peliculas que se alquilan por 2.99 y que se alquilen por más de 5*/
/*Return the title of all movies rented for 2.99 and rented for more than 5*/

SELECT 
    title
FROM 
    film
WHERE 
    rental_rate = 2.99 
    AND rental_duration >= 5;
