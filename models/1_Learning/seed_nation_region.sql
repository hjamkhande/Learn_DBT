{{
config( materialiazed = "table"
        , database = 'learndbt'
        , schema = 'practice'
        )

}}

select n.n_name  country,
R_NAME region
from {{ source('src_snow','nation') }} n join {{ ref("Region") }} r
on n.n_regionkey = r.r_regionkey
