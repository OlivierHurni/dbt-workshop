{{ config(materialized='table') }}

SELECT 
    c_custkey as customer_id,
    c_name as customer_name,
    c_address as customer_address,
    c_nationkey as nation_id,
    c_phone as customer_phone,
    c_acctbal as account_balance,
    c_mktsegment as market_segment,
    c_comment as customer_comment
FROM {{ source('bronze', 'customer') }}