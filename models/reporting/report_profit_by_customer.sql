select
    customerid,
    segment,
    country,
    sum(orderprofit) as profit
from {{ ref('stg_orders') }}
group by
    customerid,
    segment,
    country
