<h1>Documentación de la Base de Datos DVD Rental</h1>
    
  <div class="section">
        <h2>Descripción General del Esquema</h2>
        <p>La base de datos DVD Rental está diseñada para gestionar un negocio de alquiler de películas, almacenando información sobre películas, actores, clientes, alquileres, pagos y tiendas.</p>
    </div>

  <div class="section">
        <h2>Tablas</h2>
        
  <h3>actor</h3>
        <table>
            <tr><th>Columna</th><th>Tipo</th><th>Restricciones</th><th>Descripción</th></tr>
            <tr>
                <td><code>actor_id</code></td>
                <td>integer</td>
                <td>PRIMARY KEY</td>
                <td>Identificador único para cada actor</td>
            </tr>
            <tr>
                <td><code>first_name</code></td>
                <td>varchar(45)</td>
                <td>NOT NULL</td>
                <td>Nombre del actor</td>
            </tr>
            <tr>
                <td><code>last_name</code></td>
                <td>varchar(45)</td>
                <td>NOT NULL</td>
                <td>Apellido del actor</td>
            </tr>
            <tr>
                <td><code>last_update</code></td>
                <td>timestamp</td>
                <td>NOT NULL, DEFAULT now()</td>
                <td>Fecha de última actualización del registro</td>
            </tr>
        </table>

  <h3>category</h3>
        <table>
            <tr><th>Columna</th><th>Tipo</th><th>Restricciones</th><th>Descripción</th></tr>
            <tr>
                <td><code>category_id</code></td>
                <td>integer</td>
                <td>PRIMARY KEY</td>
                <td>Identificador único para cada categoría</td>
            </tr>
            <tr>
                <td><code>name</code></td>
                <td>varchar(25)</td>
                <td>NOT NULL</td>
                <td>Nombre de la categoría</td>
            </tr>
            <tr>
                <td><code>last_update</code></td>
                <td>timestamp</td>
                <td>NOT NULL, DEFAULT now()</td>
                <td>Fecha de última actualización del registro</td>
            </tr>
        </table>

  <h3>film</h3>
        <table>
            <tr><th>Columna</th><th>Tipo</th><th>Restricciones</th><th>Descripción</th></tr>
            <tr>
                <td><code>film_id</code></td>
                <td>integer</td>
                <td>PRIMARY KEY</td>
                <td>Identificador único para cada película</td>
            </tr>
            <tr>
                <td><code>title</code></td>
                <td>varchar(255)</td>
                <td>NOT NULL</td>
                <td>Título de la película</td>
            </tr>
            <tr>
                <td><code>description</code></td>
                <td>text</td>
                <td></td>
                <td>Descripción de la película</td>
            </tr>
            <tr>
                <td><code>release_year</code></td>
                <td>year</td>
                <td></td>
                <td>Año de lanzamiento de la película</td>
            </tr>
            <tr>
                <td><code>language_id</code></td>
                <td>smallint</td>
                <td>NOT NULL</td>
                <td>Idioma de la película</td>
            </tr>
            <tr>
                <td><code>rental_duration</code></td>
                <td>smallint</td>
                <td>NOT NULL, DEFAULT 3</td>
                <td>Duración del período de alquiler en días</td>
            </tr>
            <tr>
                <td><code>rental_rate</code></td>
                <td>numeric(4,2)</td>
                <td>NOT NULL, DEFAULT 4.99</td>
                <td>Costo para alquilar la película</td>
            </tr>
            <tr>
                <td><code>length</code></td>
                <td>smallint</td>
                <td></td>
                <td>Duración de la película en minutos</td>
            </tr>
            <tr>
                <td><code>replacement_cost</code></td>
                <td>numeric(5,2)</td>
                <td>NOT NULL, DEFAULT 19.99</td>
                <td>Costo para reemplazar la película si se pierde o daña</td>
            </tr>
            <tr>
                <td><code>rating</code></td>
                <td>mpaa_rating</td>
                <td>DEFAULT 'G'</td>
                <td>Clasificación MPAA de la película</td>
            </tr>
            <tr>
                <td><code>last_update</code></td>
                <td>timestamp</td>
                <td>NOT NULL, DEFAULT now()</td>
                <td>Fecha de última actualización del registro</td>
            </tr>
            <tr>
                <td><code>special_features</code></td>
                <td>text[]</td>
                <td></td>
                <td>Características especiales disponibles en la película</td>
            </tr>
            <tr>
                <td><code>fulltext</code></td>
                <td>tsvector</td>
                <td>NOT NULL</td>
                <td>Índice de búsqueda de texto completo</td>
            </tr>
        </table>

  <h3>film_actor</h3>
        <table>
            <tr><th>Columna</th><th>Tipo</th><th>Restricciones</th><th>Descripción</th></tr>
            <tr>
                <td><code>actor_id</code></td>
                <td>smallint</td>
                <td>NOT NULL</td>
                <td>Referencia al actor</td>
            </tr>
            <tr>
                <td><code>film_id</code></td>
                <td>smallint</td>
                <td>NOT NULL</td>
                <td>Referencia a la película</td>
            </tr>
            <tr>
                <td><code>last_update</code></td>
                <td>timestamp</td>
                <td>NOT NULL, DEFAULT now()</td>
                <td>Fecha de última actualización del registro</td>
            </tr>
        </table>
        <p><strong>Llave Primaria:</strong> (<code>actor_id</code>, <code>film_id</code>)</p>

  <h3>film_category</h3>
        <table>
            <tr><th>Columna</th><th>Tipo</th><th>Restricciones</th><th>Descripción</th></tr>
            <tr>
                <td><code>film_id</code></td>
                <td>smallint</td>
                <td>NOT NULL</td>
                <td>Referencia a la película</td>
            </tr>
            <tr>
                <td><code>category_id</code></td>
                <td>smallint</td>
                <td>NOT NULL</td>
                <td>Referencia a la categoría</td>
            </tr>
            <tr>
                <td><code>last_update</code></td>
                <td>timestamp</td>
                <td>NOT NULL, DEFAULT now()</td>
                <td>Fecha de última actualización del registro</td>
            </tr>
        </table>
        <p><strong>Llave Primaria:</strong> (<code>film_id</code>, <code>category_id</code>)</p>

  <h3>language</h3>
        <table>
            <tr><th>Columna</th><th>Tipo</th><th>Restricciones</th><th>Descripción</th></tr>
            <tr>
                <td><code>language_id</code></td>
                <td>integer</td>
                <td>PRIMARY KEY</td>
                <td>Identificador único para cada idioma</td>
            </tr>
            <tr>
                <td><code>name</code></td>
                <td>char(20)</td>
                <td>NOT NULL</td>
                <td>Nombre del idioma</td>
            </tr>
            <tr>
                <td><code>last_update</code></td>
                <td>timestamp</td>
                <td>NOT NULL, DEFAULT now()</td>
                <td>Fecha de última actualización del registro</td>
            </tr>
        </table>

  <h3>inventory</h3>
        <table>
            <tr><th>Columna</th><th>Tipo</th><th>Restricciones</th><th>Descripción</th></tr>
            <tr>
                <td><code>inventory_id</code></td>
                <td>integer</td>
                <td>PRIMARY KEY</td>
                <td>Identificador único para cada ítem de inventario</td>
            </tr>
            <tr>
                <td><code>film_id</code></td>
                <td>smallint</td>
                <td>NOT NULL</td>
                <td>Referencia a la película</td>
            </tr>
            <tr>
                <td><code>store_id</code></td>
                <td>smallint</td>
                <td>NOT NULL</td>
                <td>Referencia a la tienda</td>
            </tr>
            <tr>
                <td><code>last_update</code></td>
                <td>timestamp</td>
                <td>NOT NULL, DEFAULT now()</td>
                <td>Fecha de última actualización del registro</td>
            </tr>
        </table>

   <h3>rental</h3>
        <table>
            <tr><th>Columna</th><th>Tipo</th><th>Restricciones</th><th>Descripción</th></tr>
            <tr>
                <td><code>rental_id</code></td>
                <td>integer</td>
                <td>PRIMARY KEY</td>
                <td>Identificador único para cada alquiler</td>
            </tr>
            <tr>
                <td><code>rental_date</code></td>
                <td>timestamp</td>
                <td>NOT NULL</td>
                <td>Fecha cuando se alquiló la película</td>
            </tr>
            <tr>
                <td><code>inventory_id</code></td>
                <td>integer</td>
                <td>NOT NULL</td>
                <td>Referencia al ítem de inventario</td>
            </tr>
            <tr>
                <td><code>customer_id</code></td>
                <td>smallint</td>
                <td>NOT NULL</td>
                <td>Referencia al cliente</td>
            </tr>
            <tr>
                <td><code>return_date</code></td>
                <td>timestamp</td>
                <td></td>
                <td>Fecha cuando se devolvió la película</td>
            </tr>
            <tr>
                <td><code>staff_id</code></td>
                <td>smallint</td>
                <td>NOT NULL</td>
                <td>Referencia al empleado que procesó el alquiler</td>
            </tr>
            <tr>
                <td><code>last_update</code></td>
                <td>timestamp</td>
                <td>NOT NULL, DEFAULT now()</td>
                <td>Fecha de última actualización del registro</td>
            </tr>
        </table>

  <h3>payment</h3>
        <table>
            <tr><th>Columna</th><th>Tipo</th><th>Restricciones</th><th>Descripción</th></tr>
            <tr>
                <td><code>payment_id</code></td>
                <td>integer</td>
                <td>PRIMARY KEY</td>
                <td>Identificador único para cada pago</td>
            </tr>
            <tr>
                <td><code>customer_id</code></td>
                <td>smallint</td>
                <td>NOT NULL</td>
                <td>Referencia al cliente</td>
            </tr>
            <tr>
                <td><code>staff_id</code></td>
                <td>smallint</td>
                <td>NOT NULL</td>
                <td>Referencia al empleado que procesó el pago</td>
            </tr>
            <tr>
                <td><code>rental_id</code></td>
                <td>integer</td>
                <td>NOT NULL</td>
                <td>Referencia al alquiler</td>
            </tr>
            <tr>
                <td><code>amount</code></td>
                <td>numeric(5,2)</td>
                <td>NOT NULL</td>
                <td>Cantidad del pago</td>
            </tr>
            <tr>
                <td><code>payment_date</code></td>
                <td>timestamp</td>
                <td>NOT NULL</td>
                <td>Fecha cuando se realizó el pago</td>
            </tr>
        </table>

  <h3>customer</h3>
        <table>
            <tr><th>Columna</th><th>Tipo</th><th>Restricciones</th><th>Descripción</th></tr>
            <tr>
                <td><code>customer_id</code></td>
                <td>integer</td>
                <td>PRIMARY KEY</td>
                <td>Identificador único para cada cliente</td>
            </tr>
            <tr>
                <td><code>store_id</code></td>
                <td>smallint</td>
                <td>NOT NULL</td>
                <td>Referencia a la tienda donde se registró el cliente</td>
            </tr>
            <tr>
                <td><code>first_name</code></td>
                <td>varchar(45)</td>
                <td>NOT NULL</td>
                <td>Nombre del cliente</td>
            </tr>
            <tr>
                <td><code>last_name</code></td>
                <td>varchar(45)</td>
                <td>NOT NULL</td>
                <td>Apellido del cliente</td>
            </tr>
            <tr>
                <td><code>email</code></td>
                <td>varchar(50)</td>
                <td></td>
                <td>Correo electrónico del cliente</td>
            </tr>
            <tr>
                <td><code>address_id</code></td>
                <td>smallint</td>
                <td>NOT NULL</td>
                <td>Referencia a la dirección del cliente</td>
            </tr>
            <tr>
                <td><code>activebool</code></td>
                <td>boolean</td>
                <td>NOT NULL, DEFAULT true</td>
                <td>Indica si la cuenta del cliente está activa</td>
            </tr>
            <tr>
                <td><code>create_date</code></td>
                <td>date</td>
                <td>NOT NULL, DEFAULT ('now'::text)::date</td>
                <td>Fecha cuando se creó la cuenta del cliente</td>
            </tr>
            <tr>
                <td><code>last_update</code></td>
                <td>timestamp</td>
                <td>DEFAULT now()</td>
                <td>Fecha de última actualización del registro</td>
            </tr>
            <tr>
                <td><code>active</code></td>
                <td>integer</td>
                <td></td>
                <td>Indicador adicional del estado activo</td>
            </tr>
        </table>

  <h3>staff</h3>
        <table>
            <tr><th>Columna</th><th>Tipo</th><th>Restricciones</th><th>Descripción</th></tr>
            <tr>
                <td><code>staff_id</code></td>
                <td>integer</td>
                <td>PRIMARY KEY</td>
                <td>Identificador único para cada empleado</td>
            </tr>
            <tr>
                <td><code>first_name</code></td>
                <td>varchar(45)</td>
                <td>NOT NULL</td>
                <td>Nombre del empleado</td>
            </tr>
            <tr>
                <td><code>last_name</code></td>
                <td>varchar(45)</td>
                <td>NOT NULL</td>
                <td>Apellido del empleado</td>
            </tr>
            <tr>
                <td><code>address_id</code></td>
                <td>smallint</td>
                <td>NOT NULL</td>
                <td>Referencia a la dirección del empleado</td>
            </tr>
            <tr>
                <td><code>email</code></td>
                <td>varchar(50)</td>
                <td></td>
                <td>Correo electrónico del empleado</td>
            </tr>
            <tr>
                <td><code>store_id</code></td>
                <td>smallint</td>
                <td>NOT NULL</td>
                <td>Referencia a la tienda donde trabaja el empleado</td>
            </tr>
            <tr>
                <td><code>active</code></td>
                <td>boolean</td>
                <td>NOT NULL, DEFAULT true</td>
                <td>Indica si el empleado está activo</td>
            </tr>
            <tr>
                <td><code>username</code></td>
                <td>varchar(16)</td>
                <td>NOT NULL</td>
                <td>Nombre de usuario del empleado</td>
            </tr>
            <tr>
                <td><code>password</code></td>
                <td>varchar(40)</td>
                <td></td>
                <td>Contraseña del empleado (encriptada)</td>
            </tr>
            <tr>
                <td><code>last_update</code></td>
                <td>timestamp</td>
                <td>NOT NULL, DEFAULT now()</td>
                <td>Fecha de última actualización del registro</td>
            </tr>
            <tr>
                <td><code>picture</code></td>
                <td>bytea</td>
                <td></td>
                <td>Foto del empleado</td>
            </tr>
        </table>

  <h3>store</h3>
        <table>
            <tr><th>Columna</th><th>Tipo</th><th>Restricciones</th><th>Descripción</th></tr>
            <tr>
                <td><code>store_id</code></td>
                <td>integer</td>
                <td>PRIMARY KEY</td>
                <td>Identificador único para cada tienda</td>
            </tr>
            <tr>
                <td><code>manager_staff_id</code></td>
                <td>smallint</td>
                <td>NOT NULL</td>
                <td>Referencia al empleado que gestiona la tienda</td>
            </tr>
            <tr>
                <td><code>address_id</code></td>
                <td>smallint</td>
                <td>NOT NULL</td>
                <td>Referencia a la dirección de la tienda</td>
            </tr>
            <tr>
                <td><code>last_update</code></td>
                <td>timestamp</td>
                <td>NOT NULL, DEFAULT now()</td>
                <td>Fecha de última actualización del registro</td>
            </tr>
        </table>

  <h3>address</h3>
        <table>
            <tr><th>Columna</th><th>Tipo</th><th>Restricciones</th><th>Descripción</th></tr>
            <tr>
                <td><code>address_id</code></td>
                <td>integer</td>
                <td>PRIMARY KEY</td>
                <td>Identificador único para cada dirección</td>
            </tr>
            <tr>
                <td><code>address</code></td>
                <td>varchar(50)</td>
                <td>NOT NULL</td>
                <td>Primera línea de la dirección</td>
            </tr>
            <tr>
                <td><code>address2</code></td>
                <td>varchar(50)</td>
                <td></td>
                <td>Segunda línea de la dirección</td>
            </tr>
            <tr>
                <td><code>district</code></td>
                <td>varchar(20)</td>
                <td>NOT NULL</td>
                <td>Distrito o barrio</td>
            </tr>
            <tr>
                <td><code>city_id</code></td>
                <td>smallint</td>
                <td>NOT NULL</td>
                <td>Referencia a la ciudad</td>
            </tr>
            <tr>
                <td><code>postal_code</code></td>
                <td>varchar(10)</td>
                <td></td>
                <td>Código postal</td>
            </tr>
            <tr>
                <td><code>phone</code></td>
                <td>varchar(20)</td>
                <td>NOT NULL</td>
                <td>Número de teléfono</td>
            </tr>
            <tr>
                <td><code>last_update</code></td>
                <td>timestamp</td>
                <td>NOT NULL, DEFAULT now()</td>
                <td>Fecha de última actualización del registro</td>
            </tr>
        </table>

  <h3>city</h3>
        <table>
            <tr><th>Columna</th><th>Tipo</th><th>Restricciones</th><th>Descripción</th></tr>
            <tr>
                <td><code>city_id</code></td>
                <td>integer</td>
                <td>PRIMARY KEY</td>
                <td>Identificador único para cada ciudad</td>
            </tr>
            <tr>
                <td><code>city</code></td>
                <td>varchar(50)</td>
                <td>NOT NULL</td>
                <td>Nombre de la ciudad</td>
            </tr>
            <tr>
                <td><code>country_id</code></td>
                <td>smallint</td>
                <td>NOT NULL</td>
                <td>Referencia al país</td>
            </tr>
            <tr>
                <td><code>last_update</code></td>
                <td>timestamp</td>
                <td>NOT NULL, DEFAULT now()</td>
                <td>Fecha de última actualización del registro</td>
            </tr>
        </table>

  <h3>country</h3>
        <table>
            <tr><th>Columna</th><th>Tipo</th><th>Restricciones</th><th>Descripción</th></tr>
            <tr>
                <td><code>country_id</code></td>
                <td>integer</td>
                <td>PRIMARY KEY</td>
                <td>Identificador único para cada país</td>
            </tr>
            <tr>
                <td><code>country</code></td>
                <td>varchar(50)</td>
                <td>NOT NULL</td>
                <td>Nombre del país</td>
            </tr>
            <tr>
                <td><code>last_update</code></td>
                <td>timestamp</td>
                <td>NOT NULL, DEFAULT now()</td>
                <td>Fecha de última actualización del registro</td>
            </tr>
        </table>

  <h3>mpaa_rating Enum</h3>
        <div class="enum-values">
            <p>Valores posibles para las clasificaciones de películas:</p>
            <ul>
                <li><code>"G"</code> - Audiencia General</li>
                <li><code>"PG"</code> - Se recomienda orientación de padres</li>
                <li><code>"PG-13"</code> - Se advierte fuertemente a los padres</li>
                <li><code>"R"</code> - Restringido</li>
                <li><code>"NC-17"</code> - Solo adultos</li>
            </ul>
        </div>
    </div>

<div class="section">
        <h2>Relaciones</h2>
        
  <div class="relationship">
            <p><strong>- film.language_id</strong> → <strong>language.language_id</strong></p>
            <p>Cada película tiene un idioma asociado</p>
        </div>

  <div class="relationship">
            <p><strong>- film_actor.actor_id</strong> → <strong>actor.actor_id</strong></p>
            <p>Relación muchos-a-muchos entre películas y actores</p>
        </div>

   <div class="relationship">
            <p><strong>- film_actor.film_id</strong> → <strong>film.film_id</strong></p>
            <p>Relación muchos-a-muchos entre actores y películas</p>
        </div>

  <div class="relationship">
            <p><strong>- film_category.film_id</strong> → <strong>film.film_id</strong></p>
            <p>Relación muchos-a-muchos entre películas y categorías</p>
        </div>

  <div class="relationship">
            <p><strong>- film_category.category_id</strong> → <strong>category.category_id</strong></p>
            <p>Relación muchos-a-muchos entre categorías y películas</p>
        </div>

  <div class="relationship">
            <p><strong>- inventory.film_id</strong> → <strong>film.film_id</strong></p>
            <p>Cada ítem de inventario es una copia de una película</p>
        </div>

  <div class="relationship">
            <p><strong>- rental.inventory_id</strong> → <strong>inventory.inventory_id</strong></p>
            <p>Cada alquiler es para un ítem de inventario específico</p>
        </div>

  <div class="relationship">
            <p><strong>- rental.customer_id</strong> → <strong>customer.customer_id</strong></p>
            <p>Cada alquiler es realizado por un cliente</p>
        </div>

  <div class="relationship">
            <p><strong>- rental.staff_id</strong> → <strong>staff.staff_id</strong></p>
            <p>Cada alquiler es procesado por un empleado</p>
        </div>

  <div class="relationship">
            <p><strong>- payment.customer_id</strong> → <strong>customer.customer_id</strong></p>
            <p>Cada pago es realizado por un cliente</p>
        </div>

  <div class="relationship">
            <p><strong>- payment.staff_id</strong> → <strong>staff.staff_id</strong></p>
            <p>Cada pago es procesado por un empleado</p>
        </div>

  <div class="relationship">
            <p><strong>- payment.rental_id</strong> → <strong>rental.rental_id</strong></p>
            <p>Cada pago corresponde a un alquiler</p>
        </div>

  <div class="relationship">
            <p><strong>- customer.address_id</strong> → <strong>address.address_id</strong></p>
            <p>Cada cliente tiene una dirección asociada</p>
        </div>

  <div class="relationship">
            <p><strong>- customer.store_id</strong> → <strong>store.store_id</strong></p>
            <p>Cada cliente está asociado a una tienda</p>
        </div>

  <div class="relationship">
            <p><strong>- staff.address_id</strong> → <strong>address.address_id</strong></p>
            <p>Cada empleado tiene una dirección asociada</p>
        </div>

  <div class="relationship">
            <p><strong>- staff.store_id</strong> → <strong>store.store_id</strong></p>
            <p>Cada empleado trabaja en una tienda</p>
        </div>

  <div class="relationship">
            <p><strong>- store.manager_staff_id</strong> → <strong>staff.staff_id</strong></p>
            <p>Cada tienda tiene un gerente (que es un empleado)</p>
        </div>

   <div class="relationship">
            <p><strong>- store.address_id</strong> → <strong>address.address_id</strong></p>
            <p>Cada tienda tiene una dirección asociada</p>
        </div>

   <div class="relationship">
            <p><strong>- address.city_id</strong> → <strong>city.city_id</strong></p>
            <p>Cada dirección está en una ciudad</p>
        </div>

  <div class="relationship">
            <p><strong>- city.country_id</strong> → <strong>country.country_id</strong></p>
            <p>Cada ciudad está en un país</p>
        </div>
    </div>
