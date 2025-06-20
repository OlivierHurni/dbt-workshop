{% snapshot nations_snapshot %}

{{
    config(
      target_schema='ek_silver_snapshots',
      unique_key='nation_key',
      strategy='check',
      check_cols='all'
    )
}}

SELECT * FROM {{ ref('nations') }}

{% endsnapshot %}