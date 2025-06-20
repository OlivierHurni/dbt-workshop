{{ config(materialized='table') }}

SELECT 
    s.supplier_key,
    s.supplier_id,
    s.supplier_name,
    s.supplier_address,
    s.supplier_phone,
    s.account_balance,
    n.nation_name,
    r.region_name
FROM {{ ref('suppliers_snapshot') }} s
JOIN {{ ref('nations_snapshot') }} n ON s.nation_key = n.nation_key
JOIN {{ ref('regions_snapshot') }} r ON n.region_key = r.region_key
WHERE s.dbt_valid_to IS NULL
  AND n.dbt_valid_to IS NULL
  AND r.dbt_valid_to IS NULL