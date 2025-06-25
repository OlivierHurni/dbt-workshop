{% snapshot regions_snapshot %}

{{
    config(
      unique_key='region_key',
      strategy='check',
      check_cols='all'
    )
}}

SELECT * FROM {{ ref('regions') }}

{% endsnapshot %}