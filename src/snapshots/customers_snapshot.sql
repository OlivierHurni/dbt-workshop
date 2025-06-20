{% snapshot customers_snapshot %}

{{
    config(
      target_schema='ek_silver_snapshots',
      unique_key='customer_key',
      strategy='check',
      check_cols='all'
    )
}}

SELECT * FROM {{ ref('customers') }}

{% endsnapshot %}