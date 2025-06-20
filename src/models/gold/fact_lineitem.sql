{{
    config(
        materialized='incremental',
        unique_key='order_key || lineitem_key',
        incremental_strategy='append',
        on_schema_change='fail'
    )
}}

SELECT
    l.lineitem_key,
    o.order_date,
    l.line_number,
    -- Foreign keys to dimensions
    o.customer_key,
    l.part_key,
    l.supplier_key,
    l.quantity,

    -- Measures
    l.extended_price,
    l.discount,
    l.tax,
    l.return_flag,
    l.line_status,

    -- Shipping information and dates formatted for dim_date
    date_format(l.ship_date, 'yyyyMMdd') as ship_date,
    date_format(l.commit_date, 'yyyyMMdd') as commit_date,
    date_format(l.receipt_date, 'yyyyMMdd') as receipt_date,
    l.ship_instructions,
    l.ship_mode,
    
    -- Calculated measures
    l.extended_price * (1 - l.discount) as discounted_price,
    l.extended_price * (1 - l.discount) * (1 + l.tax) as total_price,
    
    -- Audit fields
    o.dbt_updated_at
    
FROM {{ ref('orders_snapshot') }} o
JOIN {{ ref('lineitems') }} l ON o.order_key = l.order_key
WHERE o.dbt_valid_to IS NULL

{% if is_incremental() %}
    -- Only process new orders
    AND o.order_date > (SELECT max(order_date) FROM {{ this }})
{% endif %}