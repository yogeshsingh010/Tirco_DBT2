-- {{ config(materialized='table') }}

SELECT
  order_id,
  customer_id,
  order_date,
  TOTAL_AMOUNT,
  -- Light transforms: alias and timezone change
  order_id AS order_key,  -- Example alias
  status,
 -- TO_TIMESTAMP_TZ(order_date, 'UTC') AS order_date_utc  -- Example timezone adjustment
FROM {{ source('netsuite_iceberg', 'orders') }}
--WHERE order_date >= '2023-01-01'  -- Optional filter for trial