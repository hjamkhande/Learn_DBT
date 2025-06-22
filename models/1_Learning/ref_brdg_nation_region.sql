{{config (  
    materialized="table",
    transient=false,
    schema="retail"
)}}

select n.n_nationkey country_id, 
n.n_name Country ,
r.r_name Region 
from 
retail.nation n join
retail.region r 
on n.n_regionkey = r.r_regionkey