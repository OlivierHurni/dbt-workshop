{% snapshot parts_snapshot %}

{{
    config(
      target_schema='<YOUR INITIALS>_silver_snapshots',
      unique_key='part_key',
      strategy='check',
      check_cols='all'
    )
}}

SELECT * FROM {{ ref('parts') }}

{% endsnapshot %}