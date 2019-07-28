-- 1a.
-- SELECT first_name, last_name
-- FROM actor;

-- 1b.
-- SELECT concat(first_name, " ", last_name) AS actor_name
-- FROM actor;

-- 2a.
-- SELECT actor_id, first_name, last_name
 -- FROM actor
-- WHERE first_name = 'Joe';

-- 2b.
-- SELECT first_name, last_name
-- FROM actor
-- WHERE last_name LIKE '%GEN%';

-- 2c.
-- SELECT first_name, last_name
-- FROM actor
-- WHERE last_name LIKE '%LI%'
-- ORDER BY last_name, first_name;

-- 2d.
-- SELECT country_id, country
-- FROM country
-- WHERE country IN ('Afghanistan', 'Bangladesh', 'China');

-- 3a.
-- ALTER TABLE actor
-- ADD COLUMN description BLOB;

-- 3b.
-- ALTER TABLE actor
-- DROP COLUMN description;

-- 4a.
-- SELECT last_name, COUNT(last_name) AS name_count
-- FROM actor
-- GROUP BY last_name
-- ORDER BY name_count DESC;

-- 4b.
-- SELECT last_name, COUNT(last_name) AS name_count
-- FROM actor
-- GROUP BY last_name
-- HAVING name_count >= 2
-- ORDER BY name_count DESC;

-- 4c.
-- UPDATE actor
-- SET first_name = 'HARPO'
-- WHERE last_name = 'WILLIAMS'
-- AND first_name = 'GROUCHO';

-- 4d.
-- UPDATE actor
-- SET first_name = 'GROUCHO'
-- WHERE last_name = 'WILLIAMS'
-- AND first_name = 'HARPO';

-- 5a.
-- SHOW CREATE TABLE address

-- 6a.
-- SELECT s.first_name, s.last_name, a.address
-- FROM staff s
-- 	JOIN address a ON a.address_id = s.address_id;

-- 6b.
-- SELECT s.first_name, s.last_name, SUM(p.amount) AS total_payments
-- FROM staff s
-- 	JOIN payment p ON p.staff_id = s.staff_id
-- GROUP BY s.staff_id;

-- 6c.
-- SELECT f.title, COUNT(fa.actor_id) AS actor_count
-- FROM film f
-- 	JOIN film_actor fa ON f.film_id = fa.film_id
-- GROUP BY f.film_id;

-- 6d.
-- SELECT f.title, COUNT(fa.actor_id) AS actor_count
--  FROM film f
--  	JOIN film_actor fa ON f.film_id = fa.film_id
-- WHERE f.title = 'Hunchback Impossible'
-- GROUP BY f.film_id;

-- 6e.
-- SELECT c.first_name, c.last_name, SUM(p.amount)
-- FROM customer c
-- 	JOIN payment p ON c.customer_id = p.customer_id
-- GROUP BY c.last_name;

-- 7a.
-- SELECT t.title, t.name AS language
-- FROM (
-- 	SELECT f.title, l.name
-- 	FROM film f
-- 		JOIN language l ON f.language_id = l.language_id
-- 	WHERE f.title LIKE 'K%' OR f.title LIKE 'Q%') AS t
-- WHERE t.name = 'English';

-- 7b.
-- SELECT a.first_name, a.last_name
-- FROM (
-- 	SELECT f.title, fa.actor_id
-- 	FROM film f
-- 		JOIN film_actor fa ON f.film_id = fa.film_id
-- 	WHERE f.title = 'Alone Trip') as t
--     JOIN actor a ON t.actor_id = a.actor_id;

-- 7c.
-- SELECT c.first_name, c.last_name, c.email
-- FROM customer c
-- 	JOIN address a ON c.address_id = a.address_id
--    JOIN city ct ON ct.city_id = a.city_id
--     JOIN country cy ON cy.country_id = ct.country_id
-- WHERE cy.country = 'CANADA';

-- 7d.
-- SELECT f.title
-- FROM film f
-- 	JOIN film_category fc ON fc.film_id = f.film_id
--  JOIN category c ON c.category_id = fc.category_id
-- WHERE c.name = 'family';

-- 7e.
-- SELECT f.title, COUNT(r.rental_date) AS total_rentals
-- FROM film f
-- 	JOIN inventory i ON i.film_id = f.film_id
--  JOIN rental r ON r.inventory_id = i.inventory_id
-- GROUP BY f.title
-- ORDER BY COUNT(r.rental_date) DESC;

-- 7f.
-- SELECT s.store_id, SUM(p.amount) AS total_business
-- FROM payment p
-- 	JOIN staff s ON p.staff_id = s.staff_id
-- GROUP BY s.store_id;

-- 7g.
-- SELECT s.store_id, c.city, cy.country
-- 	FROM store s
-- 		JOIN address a ON s.address_id = a.address_id
--         JOIN city c ON a.city_id = c.city_id
--         JOIN country cy ON c.country_id = cy.country_id
-- GROUP BY s.store_id;

-- 7h.
-- SELECT c.name, SUM(p.amount) AS gross_revenue
-- FROM category c
-- 	JOIN film_category fc ON fc.category_id = c.category_id
--     JOIN inventory i ON i.film_id = fc.film_id
--     JOIN rental r ON r.inventory_id = i.inventory_id
--     JOIN payment p ON p.rental_id = r.rental_id
-- GROUP BY c.name;

-- 8a.
-- CREATE VIEW top_5_genres AS
-- SELECT c.name, SUM(p.amount) AS gross_revenue
-- FROM category c
-- 	JOIN film_category fc ON fc.category_id = c.category_id
-- 	JOIN inventory i ON i.film_id = fc.film_id
--     JOIN rental r ON r.inventory_id = i.inventory_id
--     JOIN payment p ON p.rental_id = r.rental_id
-- GROUP BY c.name
-- ORDER BY SUM(p.amount) DESC
-- LIMIT 5;

-- 8b.
-- SELECT * 
-- FROM top_5_genres;

-- 8c.
-- DROP VIEW top_5_genres;