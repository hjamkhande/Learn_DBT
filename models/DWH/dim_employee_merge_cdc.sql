{{
config( database='dwh',
        schema='public',
        materialized='incremental',
        incremental_strategy='merge',
        unique_key='emp_id',
        merge_update_columns = ['emp_name','salary','src_load_date','updated_dt','updated_by']

)
}}
select id emp_id,
    name emp_name,
    salary salary,
    load_date src_load_date,
    current_timestamp() created_dt,
    current_timestamp() updated_dt,
    'dbt_create_load' created_by ,
    'dbt_update_load' updated_by 
    from {{source("stage","src_emp")}}

{% if is_incremental() %}
where load_date >= (select max(src_load_date) from {{this}} )
{% elif flags.FULL_REFRESH  %}

where load_date >= '2024-01-01'

{% endif %}