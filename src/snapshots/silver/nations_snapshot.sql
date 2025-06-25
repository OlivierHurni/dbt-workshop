{% snapshot nations_snapshot %}

{{
    config(
      unique_key='nation_key',
      strategy='check',
      check_cols='all'
    )
}}

SELECT * FROM {{ ref('nations') }}

{% endsnapshot %}