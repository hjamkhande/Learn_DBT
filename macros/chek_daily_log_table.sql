{% macro chek_daily_log_table() %}


{% set checkTblQuery %}
select count(1) from dbtlog.information_schema.tables
        where table_name='AUDIT_LOG_DBT'
{% endset %}
{{ log(checkTblQuery, info = true) }}

{% set chektble = dbt_utils.get_single_value(checkTblQuery) %}
{{log(chektble, info= true ) }}

{% if chektble >0  %}
{{log(" Log table exist", info= true)}}

{% else %}

    {% set creatTable %}
        create table dbtlog.audit.AUDIT_LOG_DBT
        (
        model_name varchar(100),
        start_time datetime ,
        end_time datetime,
        status varchar(100)
        )
    {% endset %}

    {% do run_query(creatTable) %}


{%endif%}

{% endmacro %}