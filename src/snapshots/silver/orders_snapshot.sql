{% snapshot orders_snapshot %}

{{
    config(
      unique_key='order_key',
      strategy='check',
      check_cols='all'
    )
}}

SELECT * FROM {{ ref('orders') }}

{% endsnapshot %}