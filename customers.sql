WITH customer_orders AS (

    SELECT
        customer_id,
        MIN(created_at) AS first_order_at,
        MAX(created_at) AS last_order_at,
        COUNT(DISTINCT id) AS number_orders
    FROM coffee_shop.orders
    GROUP BY 1

)

SELECT
    customers.id,
    customers.name,
    customers.email,
    customer_orders.first_order_at,
    customer_orders.number_orders,
    customer_orders.last_order_at
FROM coffee_shop.customers
LEFT JOIN customer_orders
    ON customers.id = customer_orders.customer_id
ORDER BY first_order_at DESC
LIMIT 5;