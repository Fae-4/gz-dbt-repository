WITH sales_data AS (

  SELECT
      s.products_id,
      s.date_date,
      s.orders_id,
      s.revenue,
      s.quantity,
      p.purchase_price,
      ROUND(s.quantity*p.purchase_price, 2) AS purchase_cost,
      ROUND(s.revenue - s.quantity*p.purchase_price, 2) AS margin
  FROM {{ref("stg_raw__sales")}} as s
  LEFT JOIN {{ref("stg_raw__product")}} as p
      ON s.products_id = p.products_id
)

SELECT * FROM sales_data