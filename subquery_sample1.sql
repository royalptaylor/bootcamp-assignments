SELECT t.customer_id, MIN(t.payment_date), t.last_name, t.first_name, t.amount
FROM (
    SELECT c.customer_id, c.last_name, c.first_name, p.payment_date, p.amount
	FROM payment p
		JOIN customer c ON p.customer_id = c.customer_id
	ORDER BY c.customer_id) AS T
GROUP BY t.customer_id;