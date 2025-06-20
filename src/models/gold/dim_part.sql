{{ config(materialized='table') }}

SELECT 
    part_key,
    part_id,
    part_name,
    manufacturer,
    brand,
    part_type,
    part_size,
    container,
    retail_price
FROM {{ ref('parts_snapshot') }}
WHERE dbt_valid_to IS NULL