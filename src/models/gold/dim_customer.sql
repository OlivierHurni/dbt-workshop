{{ config(materialized='table') }}

SELECT 
    c.customer_key,
    c.customer_id,
    c.customer_name,
    c.customer_address,
    c.customer_phone,
    c.account_balance,
    c.market_segment,
    n.nation_name,
    r.region_name
FROM {{ ref('customers_snapshot') }} c
JOIN {{ ref('nations_snapshot') }} n ON c.nation_key = n.nation_key
JOIN {{ ref('regions_snapshot') }} r ON n.region_key = r.region_key
WHERE c.dbt_valid_to IS NULL  -- Current records only
  AND n.dbt_valid_to IS NULL
  AND r.dbt_valid_to IS NULL