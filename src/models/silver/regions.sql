{{ config(materialized='table') }}

SELECT 
    r_regionkey as region_id,
    r_name as region_name,
    r_comment as region_comment
FROM {{ source('bronze', 'region') }}