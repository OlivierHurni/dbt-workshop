{{ config(materialized='table') }}

SELECT 
    {{ dbt_utils.generate_surrogate_key(['s_suppkey']) }} as supplier_key,
    s_suppkey as supplier_id,
    s_name as supplier_name,
    s_address as supplier_address,
    {{ dbt_utils.generate_surrogate_key(['s_nationkey']) }} as nation_key,
    s_nationkey as nation_id,
    s_phone as supplier_phone,
    s_acctbal as account_balance,
    s_comment as supplier_comment
FROM {{ source('bronze', 'supplier') }}