-- 1. List all customers who live in Texas (use JOINs)
    
SELECT first_name, last_name, district
FROM customer
FULL JOIN address
ON customer.address_id = address.address_id
WHERE district = 'Texas';

-- 2. Get all payments above $6.99 with the Customer's Full Name

SELECT first_name, last_name, amount
FROM customer
FULL JOIN payment
ON customer.customer_id = payment.customer_id
WHERE amount > 6.99;

-- 3. Show all customers names who have made payments over $175(use subqueries)

SELECT first_name, last_name, customer_id
FROM customer
WHERE customer_id IN(
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING SUM(amount) > 175
);

-- 4. List all customers that live in Nepal (use the city table)

SELECT first_name, last_name, city
FROM customer
FULL JOIN address
ON customer.address_id = address.address_id
FULL JOIN city
ON address.city_id = city.city_id
WHERE city = 'Nepal';

-- 5. Which staff member had the most transactions?

-- Jon Stephens - 7292
SELECT COUNT(first_name)
FROM (
    SELECT first_name, last_name, payment.staff_id 
    FROM staff
    FULL JOIN payment
    ON payment.staff_id = staff.staff_id
    ORDER BY first_name ASC
) AS temp
WHERE staff_id = 1

-- Mike Hillyer - 7304
SELECT COUNT(first_name)
FROM (
    SELECT first_name, last_name, payment.staff_id 
    FROM staff
    FULL JOIN payment
    ON payment.staff_id = staff.staff_id
    ORDER BY first_name DESC
) AS temp
WHERE staff_id = 2

-- 6. How many movies of each rating are there? -- IN INVENTORY...  

-- 791
SELECT count(inventory_id)
FROM (
    SELECT film.film_id, rating, inventory_id
    FROM inventory
    FULL JOIN film
    ON film.film_id = inventory.film_id
) AS temp
WHERE rating = 'G'

-- 924
SELECT count(inventory_id)
FROM (
    SELECT film.film_id, rating, inventory_id
    FROM inventory
    FULL JOIN film
    ON film.film_id = inventory.film_id
) AS temp
WHERE rating = 'PG'

-- 1018
SELECT count(inventory_id)
FROM (
    SELECT film.film_id, rating, inventory_id
    FROM inventory
    FULL JOIN film
    ON film.film_id = inventory.film_id
) AS temp
WHERE rating = 'PG-13'

-- 904
SELECT count(inventory_id)
FROM (
    SELECT film.film_id, rating, inventory_id
    FROM inventory
    FULL JOIN film
    ON film.film_id = inventory.film_id
) AS temp
WHERE rating = 'R'

-- 940
SELECT count(inventory_id)
FROM (
    SELECT film.film_id, rating, inventory_id
    FROM inventory
    FULL JOIN film
    ON film.film_id = inventory.film_id
) AS temp
WHERE rating = 'NC-17'


-- 7.Show all customers who have made a single payment above $6.99 (Use Subqueries)

SELECT first_name, last_name, customer_id
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    WHERE amount > 6.99
    GROUP BY customer_id
);

-- 8. How many rentals did our stores give away?  -- DOES THIS MEAN FOR FREE?  If so, then NONE.  

SELECT COUNT (rental_id)
FROM payment
WHERE rental_id IN (
    SELECT rental_id
    FROM payment
    WHERE amount = 0
)

-- If not free, then the total number of rentals would be:

SELECT COUNT (rental_id)
FROM payment


