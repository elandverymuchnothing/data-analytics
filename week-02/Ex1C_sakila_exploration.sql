/*
a)  actor_id, first_name, last_name, & last_update
b) film_id, title, description, release_year, language_id, original_language_id, rental_duration, rental_rate, length, replacement_cost, rating, special_features, & last_update
c) The film_actor table contains columns for both actor_id & film_id
d) The rental table contains all information for rental_id, rental_date, inventory_id, customer_id, return_date, staff_id, & last_update
e) The inventory table contains all information on inventory_id, film_id, store_id, & last_update
f) For this, you will need to look at the inventory & rental table.
*/

SELECT rental_date, inventory_id
FROM rental
;
SELECT inventory_id, film_id
FROM inventory
;
SELECT film_id, title
FROM film



