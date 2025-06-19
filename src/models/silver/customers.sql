{{ config(materialized='table') }}

SELECT 
    {{ dbt_utils.generate_surrogate_key(['c_custkey']) }} as customer_key,
    c_custkey as customer_id,
    c_name as customer_name,
    c_address as customer_address,
    {{ dbt_utils.generate_surrogate_key(['c_nationkey']) }} as nation_key,
    c_nationkey as nation_id,
    c_phone as customer_phone,
    c_acctbal as account_balance,
    c_mktsegment as market_segment,
    c_comment as customer_comment
FROM {{ source('bronze', 'customer') }}