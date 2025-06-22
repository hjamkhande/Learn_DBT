{{
config(materialized ='incremental'
        , transient=false
        ,on_schema_change='ignore'
        )

}}

select a.* 
from {{source('stage','src_emp')}} a