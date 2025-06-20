{% snapshot orders_snapshot %}

{{
    config(
      target_schema='ek_silver_snapshots',
      unique_key='order_key',
      strategy='check',
      check_cols='all'
    )
}}

SELECT * FROM {{ ref('orders') }}

{% endsnapshot %}