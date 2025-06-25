{% snapshot suppliers_snapshot %}

{{
    config(
      unique_key='supplier_key',
      strategy='check',
      check_cols='all'
    )
}}

SELECT * FROM {{ ref('suppliers') }}

{% endsnapshot %}