{{ config(materialized='table') }}

SELECT 
    n_nationkey as nation_id,
    n_name as nation_name,
    n_regionkey as region_id,
    n_comment as nation_comment
FROM {{ source('bronze', 'nation') }}