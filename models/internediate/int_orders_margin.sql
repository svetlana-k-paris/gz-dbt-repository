SELECT
    orders_id,
    date_date,
    ROUND(SUM(revenue), 2) AS order_revenue,
    SUM(quantity) AS quantity,
    ROUND(SUM(purchase_cost), 2) AS order_purchase_cost,
    ROUND(SUM(margin), 2) AS order_margin
FROM {{ ref('int_sales_margin') }}
GROUP BY orders_id, date_date