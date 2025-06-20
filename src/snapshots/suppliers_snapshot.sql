{% snapshot suppliers_snapshot %}

{{
    config(
      target_schema='ek_silver_snapshots',
      unique_key='supplier_key',
      strategy='check',
      check_cols='all'
    )
}}

SELECT * FROM {{ ref('suppliers') }}

{% endsnapshot %}