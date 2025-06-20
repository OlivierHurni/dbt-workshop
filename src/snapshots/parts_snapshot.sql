{% snapshot parts_snapshot %}

{{
    config(
      target_schema='ek_silver_snapshots',
      unique_key='part_key',
      strategy='check',
      check_cols='all'
    )
}}

SELECT * FROM {{ ref('parts') }}

{% endsnapshot %}