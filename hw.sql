SELECT *
FROM address
ORDER BY district DESC;

SELECT *
FROM customer;

-- Question 1
SELECT first_name, last_name, district
FROM address
JOIN customer
ON address.address_id = customer.address_id
WHERE district = 'Texas';

--Question 2
SELECT first_name, last_name, amount
FROM customer
JOIN payment
ON customer.customer_id = payment.customer_id
WHERE amount > 6.99;

-- Question 3
SELECT first_name, last_name
FROM customer
WHERE customer_id IN(
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) > 175.00
);

-- Question 4
SELECT customer.customer_id, first_name, last_name, city, country
FROM customer
JOIN address
ON customer.address_id = address.address_id
JOIN city
ON address.city_id = city.city_id
JOIN country
ON city.country_id = country.country_id
WHERE country = 'Nepal';


--Question 5
SELECT staff.staff_id, first_name, last_name, SUM(rental.staff_id)
FROM staff
JOIN rental
ON staff.staff_id = rental.staff_id
GROUP BY staff.staff_id
ORDER BY sum DESC
LIMIT 1;

-- Question 6
SELECT rating, COUNT(rating)
FROM film
GROUP BY rating;

-- Question 7
SELECT customer_id, first_name, last_name
FROM customer
WHERE customer_id IN(
	SELECT customer_id
	FROM payment
	WHERE amount > 6.99
	GROUP BY customer_id
);

--Question 8
SELECT COUNT(amount)
FROM payment
WHERE amount = 0.00;
