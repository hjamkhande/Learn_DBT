{% snapshot dim_emp_scd2_ts %}

{{
    config( database='dwh',
    schema='public',
    strategy='timestamp',
    unique_key='id',
    updated_at='src_load_dt'

    )
}}
select id,name,salary,TO_TIMESTAMP_NTZ(load_date) src_load_dt
 from {{source('stage','src_emp')}}

{% endsnapshot %}