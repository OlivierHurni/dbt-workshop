{% snapshot regions_snapshot %}

{{
    config(
      target_schema='ek_silver_snapshots',
      unique_key='region_key',
      strategy='check',
      check_cols='all'
    )
}}

SELECT * FROM {{ ref('regions') }}

{% endsnapshot %}