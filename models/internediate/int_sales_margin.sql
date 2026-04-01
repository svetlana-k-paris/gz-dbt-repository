WITH sales AS (
    SELECT *
    FROM {{ ref('stg_gz_raw_sales') }}
),

products AS (
    SELECT *
    FROM {{ ref('stg_gz_raw_product') }}
)

SELECT
    sales.orders_id,
    sales.date_date,
    sales.revenue,
    sales.quantity,

    products.purchase_price,
    products.products_id,

    sales.quantity * products.purchase_price AS purchase_cost,
    ROUND(sales.revenue - (sales.quantity * products.purchase_price), 2) AS margin

FROM sales
LEFT JOIN products
    ON sales.products_id = products.products_id