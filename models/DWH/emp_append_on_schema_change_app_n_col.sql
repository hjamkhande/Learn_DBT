{{
config(materialized ='incremental'
        , transient=false
        ,on_schema_change='append_new_column'
        )

}}

select a.* 
from {{source('stage','src_emp')}} a