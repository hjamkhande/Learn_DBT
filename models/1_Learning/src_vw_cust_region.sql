{{ config(
    materialiazed="view",
    schema="retail"
)
}}

select Name ,
phone,
address,
n.Country country,
Region,
from 
{{ref("src_brdg_customer_nation")}}  n join
{{ref("src_brdg_nation_region")}} r 
on n.country_id = r.country_id
