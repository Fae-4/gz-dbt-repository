WITH sales_data AS (

  SELECT
      s.products_id,
      s.date_date,
      s.orders_id,
      s.revenue,
      s.quantity,
      p.purchase_price,
      {{ margin_percent('s.revenue', 's.quantity * CAST(p.purchase_price AS FLOAT64)') }}
  FROM {{ref("stg_raw__sales")}} as s
  LEFT JOIN {{ref("stg_raw__product")}} as p
      ON s.products_id = p.products_id
)

SELECT * FROM sales_data