select 
    productid,
    productname,
    category,
    sum(orderprofit) as profit
from {{ ref('stg_orders') }}
group by 
    productid,
    productname,
    category