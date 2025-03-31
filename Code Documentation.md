<h1>DVD Rental Database Documentation</h1>
    
  <div class="section">
        <h2>Database Schema Overview</h2>
        <p>The DVD Rental database is designed to manage a movie rental business, tracking films, actors, customers, rentals, payments, and store information.</p>
    </div>

  <div class="section">
        <h2>Tables</h2>
        
   <h3>actor</h3>
        <table>
            <tr><th>Column</th><th>Type</th><th>Constraints</th><th>Description</th></tr>
            <tr>
                <td><code>actor_id</code></td>
                <td>integer</td>
                <td>PRIMARY KEY</td>
                <td>Unique identifier for each actor</td>
            </tr>
            <tr>
                <td><code>first_name</code></td>
                <td>varchar(45)</td>
                <td>NOT NULL</td>
                <td>Actor's first name</td>
            </tr>
            <tr>
                <td><code>last_name</code></td>
                <td>varchar(45)</td>
                <td>NOT NULL</td>
                <td>Actor's last name</td>
            </tr>
            <tr>
                <td><code>last_update</code></td>
                <td>timestamp</td>
                <td>NOT NULL, DEFAULT now()</td>
                <td>When the record was last updated</td>
            </tr>
        </table>

   <h3>category</h3>
        <table>
            <tr><th>Column</th><th>Type</th><th>Constraints</th><th>Description</th></tr>
            <tr>
                <td><code>category_id</code></td>
                <td>integer</td>
                <td>PRIMARY KEY</td>
                <td>Unique identifier for each category</td>
            </tr>
            <tr>
                <td><code>name</code></td>
                <td>varchar(25)</td>
                <td>NOT NULL</td>
                <td>Name of the category</td>
            </tr>
            <tr>
                <td><code>last_update</code></td>
                <td>timestamp</td>
                <td>NOT NULL, DEFAULT now()</td>
                <td>When the record was last updated</td>
            </tr>
        </table>

  <h3>film</h3>
        <table>
            <tr><th>Column</th><th>Type</th><th>Constraints</th><th>Description</th></tr>
            <tr>
                <td><code>film_id</code></td>
                <td>integer</td>
                <td>PRIMARY KEY</td>
                <td>Unique identifier for each film</td>
            </tr>
            <tr>
                <td><code>title</code></td>
                <td>varchar(255)</td>
                <td>NOT NULL</td>
                <td>Title of the film</td>
            </tr>
            <tr>
                <td><code>description</code></td>
                <td>text</td>
                <td></td>
                <td>Description of the film</td>
            </tr>
            <tr>
                <td><code>release_year</code></td>
                <td>year</td>
                <td></td>
                <td>Year the film was released</td>
            </tr>
            <tr>
                <td><code>language_id</code></td>
                <td>smallint</td>
                <td>NOT NULL</td>
                <td>Language of the film</td>
            </tr>
            <tr>
                <td><code>rental_duration</code></td>
                <td>smallint</td>
                <td>NOT NULL, DEFAULT 3</td>
                <td>Duration of rental period in days</td>
            </tr>
            <tr>
                <td><code>rental_rate</code></td>
                <td>numeric(4,2)</td>
                <td>NOT NULL, DEFAULT 4.99</td>
                <td>Cost to rent the film</td>
            </tr>
            <tr>
                <td><code>length</code></td>
                <td>smallint</td>
                <td></td>
                <td>Length of the film in minutes</td>
            </tr>
            <tr>
                <td><code>replacement_cost</code></td>
                <td>numeric(5,2)</td>
                <td>NOT NULL, DEFAULT 19.99</td>
                <td>Cost to replace the film if lost/damaged</td>
            </tr>
            <tr>
                <td><code>rating</code></td>
                <td>mpaa_rating</td>
                <td>DEFAULT 'G'</td>
                <td>MPAA rating of the film</td>
            </tr>
            <tr>
                <td><code>last_update</code></td>
                <td>timestamp</td>
                <td>NOT NULL, DEFAULT now()</td>
                <td>When the record was last updated</td>
            </tr>
            <tr>
                <td><code>special_features</code></td>
                <td>text[]</td>
                <td></td>
                <td>Special features available on the film</td>
            </tr>
            <tr>
                <td><code>fulltext</code></td>
                <td>tsvector</td>
                <td>NOT NULL</td>
                <td>Full-text search index</td>
            </tr>
        </table>

  <h3>film_actor</h3>
        <table>
            <tr><th>Column</th><th>Type</th><th>Constraints</th><th>Description</th></tr>
            <tr>
                <td><code>actor_id</code></td>
                <td>smallint</td>
                <td>NOT NULL</td>
                <td>Reference to actor</td>
            </tr>
            <tr>
                <td><code>film_id</code></td>
                <td>smallint</td>
                <td>NOT NULL</td>
                <td>Reference to film</td>
            </tr>
            <tr>
                <td><code>last_update</code></td>
                <td>timestamp</td>
                <td>NOT NULL, DEFAULT now()</td>
                <td>When the record was last updated</td>
            </tr>
        </table>
        <p><strong>Primary Key:</strong> (<code>actor_id</code>, <code>film_id</code>)</p>

  <h3>film_category</h3>
        <table>
            <tr><th>Column</th><th>Type</th><th>Constraints</th><th>Description</th></tr>
            <tr>
                <td><code>film_id</code></td>
                <td>smallint</td>
                <td>NOT NULL</td>
                <td>Reference to film</td>
            </tr>
            <tr>
                <td><code>category_id</code></td>
                <td>smallint</td>
                <td>NOT NULL</td>
                <td>Reference to category</td>
            </tr>
            <tr>
                <td><code>last_update</code></td>
                <td>timestamp</td>
                <td>NOT NULL, DEFAULT now()</td>
                <td>When the record was last updated</td>
            </tr>
        </table>
        <p><strong>Primary Key:</strong> (<code>film_id</code>, <code>category_id</code>)</p>

   <h3>language</h3>
        <table>
            <tr><th>Column</th><th>Type</th><th>Constraints</th><th>Description</th></tr>
            <tr>
                <td><code>language_id</code></td>
                <td>integer</td>
                <td>PRIMARY KEY</td>
                <td>Unique identifier for each language</td>
            </tr>
            <tr>
                <td><code>name</code></td>
                <td>char(20)</td>
                <td>NOT NULL</td>
                <td>Name of the language</td>
            </tr>
            <tr>
                <td><code>last_update</code></td>
                <td>timestamp</td>
                <td>NOT NULL, DEFAULT now()</td>
                <td>When the record was last updated</td>
            </tr>
        </table>

  <h3>inventory</h3>
        <table>
            <tr><th>Column</th><th>Type</th><th>Constraints</th><th>Description</th></tr>
            <tr>
                <td><code>inventory_id</code></td>
                <td>integer</td>
                <td>PRIMARY KEY</td>
                <td>Unique identifier for each inventory item</td>
            </tr>
            <tr>
                <td><code>film_id</code></td>
                <td>smallint</td>
                <td>NOT NULL</td>
                <td>Reference to film</td>
            </tr>
            <tr>
                <td><code>store_id</code></td>
                <td>smallint</td>
                <td>NOT NULL</td>
                <td>Reference to store</td>
            </tr>
            <tr>
                <td><code>last_update</code></td>
                <td>timestamp</td>
                <td>NOT NULL, DEFAULT now()</td>
                <td>When the record was last updated</td>
            </tr>
        </table>

   <h3>rental</h3>
        <table>
            <tr><th>Column</th><th>Type</th><th>Constraints</th><th>Description</th></tr>
            <tr>
                <td><code>rental_id</code></td>
                <td>integer</td>
                <td>PRIMARY KEY</td>
                <td>Unique identifier for each rental</td>
            </tr>
            <tr>
                <td><code>rental_date</code></td>
                <td>timestamp</td>
                <td>NOT NULL</td>
                <td>Date when the film was rented</td>
            </tr>
            <tr>
                <td><code>inventory_id</code></td>
                <td>integer</td>
                <td>NOT NULL</td>
                <td>Reference to inventory item</td>
            </tr>
            <tr>
                <td><code>customer_id</code></td>
                <td>smallint</td>
                <td>NOT NULL</td>
                <td>Reference to customer</td>
            </tr>
            <tr>
                <td><code>return_date</code></td>
                <td>timestamp</td>
                <td></td>
                <td>Date when the film was returned</td>
            </tr>
            <tr>
                <td><code>staff_id</code></td>
                <td>smallint</td>
                <td>NOT NULL</td>
                <td>Reference to staff member who processed the rental</td>
            </tr>
            <tr>
                <td><code>last_update</code></td>
                <td>timestamp</td>
                <td>NOT NULL, DEFAULT now()</td>
                <td>When the record was last updated</td>
            </tr>
        </table>

   <h3>payment</h3>
        <table>
            <tr><th>Column</th><th>Type</th><th>Constraints</th><th>Description</th></tr>
            <tr>
                <td><code>payment_id</code></td>
                <td>integer</td>
                <td>PRIMARY KEY</td>
                <td>Unique identifier for each payment</td>
            </tr>
            <tr>
                <td><code>customer_id</code></td>
                <td>smallint</td>
                <td>NOT NULL</td>
                <td>Reference to customer</td>
            </tr>
            <tr>
                <td><code>staff_id</code></td>
                <td>smallint</td>
                <td>NOT NULL</td>
                <td>Reference to staff member who processed the payment</td>
            </tr>
            <tr>
                <td><code>rental_id</code></td>
                <td>integer</td>
                <td>NOT NULL</td>
                <td>Reference to rental</td>
            </tr>
            <tr>
                <td><code>amount</code></td>
                <td>numeric(5,2)</td>
                <td>NOT NULL</td>
                <td>Payment amount</td>
            </tr>
            <tr>
                <td><code>payment_date</code></td>
                <td>timestamp</td>
                <td>NOT NULL</td>
                <td>Date when payment was made</td>
            </tr>
        </table>

  <h3>customer</h3>
        <table>
            <tr><th>Column</th><th>Type</th><th>Constraints</th><th>Description</th></tr>
            <tr>
                <td><code>customer_id</code></td>
                <td>integer</td>
                <td>PRIMARY KEY</td>
                <td>Unique identifier for each customer</td>
            </tr>
            <tr>
                <td><code>store_id</code></td>
                <td>smallint</td>
                <td>NOT NULL</td>
                <td>Reference to store where customer registered</td>
            </tr>
            <tr>
                <td><code>first_name</code></td>
                <td>varchar(45)</td>
                <td>NOT NULL</td>
                <td>Customer's first name</td>
            </tr>
            <tr>
                <td><code>last_name</code></td>
                <td>varchar(45)</td>
                <td>NOT NULL</td>
                <td>Customer's last name</td>
            </tr>
            <tr>
                <td><code>email</code></td>
                <td>varchar(50)</td>
                <td></td>
                <td>Customer's email address</td>
            </tr>
            <tr>
                <td><code>address_id</code></td>
                <td>smallint</td>
                <td>NOT NULL</td>
                <td>Reference to customer's address</td>
            </tr>
            <tr>
                <td><code>activebool</code></td>
                <td>boolean</td>
                <td>NOT NULL, DEFAULT true</td>
                <td>Whether the customer account is active</td>
            </tr>
            <tr>
                <td><code>create_date</code></td>
                <td>date</td>
                <td>NOT NULL, DEFAULT ('now'::text)::date</td>
                <td>Date when customer account was created</td>
            </tr>
            <tr>
                <td><code>last_update</code></td>
                <td>timestamp</td>
                <td>DEFAULT now()</td>
                <td>When the record was last updated</td>
            </tr>
            <tr>
                <td><code>active</code></td>
                <td>integer</td>
                <td></td>
                <td>Additional active status indicator</td>
            </tr>
        </table>

  <h3>staff</h3>
        <table>
            <tr><th>Column</th><th>Type</th><th>Constraints</th><th>Description</th></tr>
            <tr>
                <td><code>staff_id</code></td>
                <td>integer</td>
                <td>PRIMARY KEY</td>
                <td>Unique identifier for each staff member</td>
            </tr>
            <tr>
                <td><code>first_name</code></td>
                <td>varchar(45)</td>
                <td>NOT NULL</td>
                <td>Staff member's first name</td>
            </tr>
            <tr>
                <td><code>last_name</code></td>
                <td>varchar(45)</td>
                <td>NOT NULL</td>
                <td>Staff member's last name</td>
            </tr>
            <tr>
                <td><code>address_id</code></td>
                <td>smallint</td>
                <td>NOT NULL</td>
                <td>Reference to staff member's address</td>
            </tr>
            <tr>
                <td><code>email</code></td>
                <td>varchar(50)</td>
                <td></td>
                <td>Staff member's email address</td>
            </tr>
            <tr>
                <td><code>store_id</code></td>
                <td>smallint</td>
                <td>NOT NULL</td>
                <td>Reference to store where staff member works</td>
            </tr>
            <tr>
                <td><code>active</code></td>
                <td>boolean</td>
                <td>NOT NULL, DEFAULT true</td>
                <td>Whether the staff member is active</td>
            </tr>
            <tr>
                <td><code>username</code></td>
                <td>varchar(16)</td>
                <td>NOT NULL</td>
                <td>Staff member's username</td>
            </tr>
            <tr>
                <td><code>password</code></td>
                <td>varchar(40)</td>
                <td></td>
                <td>Staff member's password (hashed)</td>
            </tr>
            <tr>
                <td><code>last_update</code></td>
                <td>timestamp</td>
                <td>NOT NULL, DEFAULT now()</td>
                <td>When the record was last updated</td>
            </tr>
            <tr>
                <td><code>picture</code></td>
                <td>bytea</td>
                <td></td>
                <td>Staff member's photo</td>
            </tr>
        </table>

  <h3>store</h3>
        <table>
            <tr><th>Column</th><th>Type</th><th>Constraints</th><th>Description</th></tr>
            <tr>
                <td><code>store_id</code></td>
                <td>integer</td>
                <td>PRIMARY KEY</td>
                <td>Unique identifier for each store</td>
            </tr>
            <tr>
                <td><code>manager_staff_id</code></td>
                <td>smallint</td>
                <td>NOT NULL</td>
                <td>Reference to staff member who manages the store</td>
            </tr>
            <tr>
                <td><code>address_id</code></td>
                <td>smallint</td>
                <td>NOT NULL</td>
                <td>Reference to store's address</td>
            </tr>
            <tr>
                <td><code>last_update</code></td>
                <td>timestamp</td>
                <td>NOT NULL, DEFAULT now()</td>
                <td>When the record was last updated</td>
            </tr>
        </table>

  <h3>address</h3>
        <table>
            <tr><th>Column</th><th>Type</th><th>Constraints</th><th>Description</th></tr>
            <tr>
                <td><code>address_id</code></td>
                <td>integer</td>
                <td>PRIMARY KEY</td>
                <td>Unique identifier for each address</td>
            </tr>
            <tr>
                <td><code>address</code></td>
                <td>varchar(50)</td>
                <td>NOT NULL</td>
                <td>First line of address</td>
            </tr>
            <tr>
                <td><code>address2</code></td>
                <td>varchar(50)</td>
                <td></td>
                <td>Second line of address</td>
            </tr>
            <tr>
                <td><code>district</code></td>
                <td>varchar(20)</td>
                <td>NOT NULL</td>
                <td>District or neighborhood</td>
            </tr>
            <tr>
                <td><code>city_id</code></td>
                <td>smallint</td>
                <td>NOT NULL</td>
                <td>Reference to city</td>
            </tr>
  <tr>
                <td><code>postal_code</code></td>
                <td>varchar(10)</td>
                <td></td>
                <td>Postal or zip code</td>
            </tr>
            <tr>
                <td><code>phone</code></td>
                <td>varchar(20)</td>
                <td>NOT NULL</td>
                <td>Phone number</td>
            </tr>
            <tr>
                <td><code>last_update</code></td>
                <td>timestamp</td>
                <td>NOT NULL, DEFAULT now()</td>
                <td>When the record was last updated</td>
            </tr>
        </table>

   <h3>city</h3>
  <table>
            <tr><th>Column</th><th>Type</th><th>Constraints</th><th>Description</th></tr>
            <tr>
                <td><code>city_id</code></td>
                <td>integer</td>
                <td>PRIMARY KEY</td>
                <td>Unique identifier for each city</td>
            </tr>
            <tr>
                <td><code>city</code></td>
                <td>varchar(50)</td>
                <td>NOT NULL</td>
                <td>Name of the city</td>
            </tr>
            <tr>
                <td><code>country_id</code></td>
                <td>smallint</td>
                <td>NOT NULL</td>
                <td>Reference to country</td>
            </tr>
            <tr>
                <td><code>last_update</code></td>
                <td>timestamp</td>
                <td>NOT NULL, DEFAULT now()</td>
                <td>When the record was last updated</td>
            </tr>
        </table>

  <h3>country</h3>
        <table>
            <tr><th>Column</th><th>Type</th><th>Constraints</th><th>Description</th></tr>
            <tr>
                <td><code>country_id</code></td>
                <td>integer</td>
                <td>PRIMARY KEY</td>
                <td>Unique identifier for each country</td>
            </tr>
            <tr>
                <td><code>country</code></td>
                <td>varchar(50)</td>
                <td>NOT NULL</td>
                <td>Name of the country</td>
            </tr>
            <tr>
                <td><code>last_update</code></td>
                <td>timestamp</td>
                <td>NOT NULL, DEFAULT now()</td>
                <td>When the record was last updated</td>
            </tr>
        </table>

  <h3>mpaa_rating Enum</h3>
        <div class="enum-values">
            <p>Possible values for film ratings:</p>
            <ul>
                <li><code>"G"</code> - General Audiences</li>
                <li><code>"PG"</code> - Parental Guidance Suggested</li>
                <li><code>"PG-13"</code> - Parents Strongly Cautioned</li>
                <li><code>"R"</code> - Restricted</li>
                <li><code>"NC-17"</code> - Adults Only</li>
            </ul>
        </div>
    </div>

<div class="section">
        <h2>Relationships</h2>
        
<div class="relationship">
            <p><strong>- film.language_id</strong> → <strong>language.language_id</strong></p>
            <p>Each film has one language</p>
        </div>
<br>
<div class="relationship">
            <p><strong>- film_actor.actor_id</strong> → <strong>actor.actor_id</strong></p>
            <p>Many-to-many relationship between films and actors</p>
        </div>
<br>
<div class="relationship">
            <p><strong>- film_actor.film_id</strong> → <strong>film.film_id</strong></p>
            <p>Many-to-many relationship between actors and films</p>
        </div>
<br>
  <div class="relationship">
            <p><strong>- film_category.film_id</strong> → <strong>film.film_id</strong></p>
            <p>Many-to-many relationship between films and categories</p>
        </div>
<br>
  <div class="relationship">
            <p><strong>- film_category.category_id</strong> → <strong>category.category_id</strong></p>
            <p>Many-to-many relationship between categories and films</p>
        </div>
<br>
  <div class="relationship">
            <p><strong>- inventory.film_id</strong> → <strong>film.film_id</strong></p>
            <p>Each inventory item is a copy of a film</p>
        </div>
<br>
  <div class="relationship">
            <p><strong>- rental.inventory_id</strong> → <strong>inventory.inventory_id</strong></p>
            <p>Each rental is for a specific inventory item</p>
        </div>
<br>
  <div class="relationship">
            <p><strong>- rental.customer_id</strong> → <strong>customer.customer_id</strong></p>
            <p>Each rental is made by a customer</p>
        </div>
<br>
  <div class="relationship">
            <p><strong>- rental.staff_id</strong> → <strong>staff.staff_id</strong></p>
            <p>Each rental is processed by a staff member</p>
        </div>
<br>
  <div class="relationship">
            <p><strong>- payment.customer_id</strong> → <strong>customer.customer_id</strong></p>
            <p>Each payment is made by a customer</p>
        </div>
<br>
  <div class="relationship">
            <p><strong>- payment.staff_id</strong> → <strong>staff.staff_id</strong></p>
            <p>Each payment is processed by a staff member</p>
        </div>
<br>
  <div class="relationship">
            <p><strong>- payment.rental_id</strong> → <strong>rental.rental_id</strong></p>
            <p>Each payment is for a rental</p>
        </div>
<br>
<div class="relationship">
            <p><strong>- customer.address_id</strong> → <strong>address.address_id</strong></p>
            <p>Each customer has an address</p>
        </div>
<br>
<div class="relationship">
            <p><strong>- customer.store_id</strong> → <strong>store.store_id</strong></p>
            <p>Each customer is associated with a store</p>
        </div>
<br>
<div class="relationship">
            <p><strong>- staff.address_id</strong> → <strong>address.address_id</strong></p>
            <p>Each staff member has an address</p>
        </div>
<br>
<div class="relationship">
            <p><strong>- staff.store_id</strong> → <strong>store.store_id</strong></p>
            <p>Each staff member works at a store</p>
        </div>
<br>
  <div class="relationship">
            <p><strong>- store.manager_staff_id</strong> → <strong>staff.staff_id</strong></p>
            <p>Each store has a manager (who is a staff member)</p>
        </div>
<br>
  <div class="relationship">
            <p><strong>- store.address_id</strong> → <strong>address.address_id</strong></p>
            <p>Each store has an address</p>
        </div>
<br>
  <div class="relationship">
            <p><strong>- address.city_id</strong> → <strong>city.city_id</strong></p>
            <p>Each address is in a city</p>
        </div>
<br>
  <div class="relationship">
            <p><strong>- city.country_id</strong> → <strong>country.country_id</strong></p>
            <p>Each city is in a country</p>
        </div>
    </div>
