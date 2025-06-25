{% snapshot parts_snapshot %}

{{
    config(
      unique_key='part_key',
      strategy='check',
      check_cols='all'
    )
}}

SELECT * FROM {{ ref('parts') }}

{% endsnapshot %}