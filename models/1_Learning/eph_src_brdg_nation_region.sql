{{config (  
    materialized="ephemeral",
    schema="retail"

)}}

select n.n_nationkey country_id, 
n.n_name Country ,
r.r_name Region 
from 
{{ source("src_retail","src_country") }} n join
{{ source("src_retail","src_region") }} r 
on n.n_regionkey = r.r_regionkey