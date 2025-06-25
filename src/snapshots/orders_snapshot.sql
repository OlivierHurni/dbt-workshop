{% snapshot orders_snapshot %}

{{
    config(
      target_schema='<YOUR INITIALS>_silver_snapshots',
      unique_key='order_key',
      strategy='check',
      check_cols='all'
    )
}}

SELECT * FROM {{ ref('orders') }}

{% endsnapshot %}