{{ config(materialized='table') }}

SELECT 
    {{ dbt_utils.generate_surrogate_key(['n_nationkey']) }} as nation_key,
    n_nationkey as nation_id,
    n_name as nation_name,
    {{ dbt_utils.generate_surrogate_key(['n_regionkey']) }} as region_key,
    n_regionkey as region_id,
    n_comment as nation_comment
FROM {{ source('bronze', 'nation') }}