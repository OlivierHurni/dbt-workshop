{{ config(materialized='table') }}

SELECT 
    {{ dbt_utils.generate_surrogate_key(['l_orderkey', 'l_linenumber']) }} as lineitem_key,
    {{ dbt_utils.generate_surrogate_key(['l_orderkey']) }} as order_key,
    l_orderkey as order_id,
    {{ dbt_utils.generate_surrogate_key(['l_partkey']) }} as part_key,
    l_partkey as part_id,
    {{ dbt_utils.generate_surrogate_key(['l_suppkey']) }} as supplier_key,
    l_suppkey as supplier_id,
    l_linenumber as line_number,
    l_quantity as quantity,
    l_extendedprice as extended_price,
    l_discount as discount,
    l_tax as tax,
    l_returnflag as return_flag,
    l_linestatus as line_status,
    l_shipdate as ship_date,
    l_commitdate as commit_date,
    l_receiptdate as receipt_date,
    l_shipinstruct as ship_instructions,
    l_shipmode as ship_mode,
    l_comment as line_comment
FROM {{ source('bronze', 'lineitem') }}