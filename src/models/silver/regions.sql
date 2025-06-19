{{ config(materialized='table') }}

SELECT 
    {{ dbt_utils.generate_surrogate_key(['r_regionkey']) }} as region_key,
    r_regionkey as region_id,
    r_name as region_name,
    r_comment as region_comment
FROM {{ source('bronze', 'region') }}