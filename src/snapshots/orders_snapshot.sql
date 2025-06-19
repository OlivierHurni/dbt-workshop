{% snapshot orders_snapshot %}

{{
    config(
      target_schema='ek_silver_snapshots',
      unique_key='order_id',
      strategy='check',
      check_cols='all'
    )
}}

SELECT * FROM {{ ref('orders') }}

{% endsnapshot %}