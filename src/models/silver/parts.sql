{{ config(materialized='table') }}

SELECT 
    {{ dbt_utils.generate_surrogate_key(['p_partkey']) }} as part_key,
    p_partkey as part_id,
    p_name as part_name,
    p_mfgr as manufacturer,
    p_brand as brand,
    p_type as part_type,
    p_size as part_size,
    p_container as container,
    p_retailprice as retail_price,
    p_comment as part_comment
FROM {{ source('bronze', 'part') }}