{{ config(
            materialized="ephemeral",
            schema="retail"


)}}

select c.c_name  Name,
c_phone phone,
c.c_address address, 
n.n_name  Country , 
n.n_nationkey country_id
from 
 {{ source('src_retail','src_customer') }} c
join 
 {{ source('src_retail','src_country') }} n
on c.c_nationkey = n.n_nationkey

