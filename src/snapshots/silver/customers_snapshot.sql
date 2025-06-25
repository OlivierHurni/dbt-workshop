{% snapshot customers_snapshot %}

{{
    config(
      unique_key='customer_key',
      strategy='check',
      check_cols='all'
    )
}}

SELECT * FROM {{ ref('customers') }}

{% endsnapshot %}