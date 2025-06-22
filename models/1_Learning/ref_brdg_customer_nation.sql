{{ config(
            materialized="table",
            transient=false,
            schema="retail"


)}}

select c.c_name  Name,
c_phone phone,
c.c_address address, 
n.n_name  Country , 
n.n_nationkey country_id
from retail.customer c join retail.nation n
on c.c_nationkey = n.n_nationkey