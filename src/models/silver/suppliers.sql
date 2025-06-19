{{ config(materialized='table') }}

SELECT 
    s_suppkey as supplier_id,
    s_name as supplier_name,
    s_address as supplier_address,
    s_nationkey as nation_id,
    s_phone as supplier_phone,
    s_acctbal as account_balance,
    s_comment as supplier_comment
FROM {{ source('bronze', 'supplier') }}