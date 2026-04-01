SELECT
    orders_id,
    date_date,
    SUM(revenue) AS order_revenue,
    SUM(quantity) AS quantity,
    SUM(purchase_cost) AS order_purchase_cost,
    SUM(margin) AS order_margin
FROM {{ ref('int_sales_margin') }}
GROUP BY orders_id, date_date