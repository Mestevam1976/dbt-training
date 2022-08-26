with 
orders as (
    select * from {{ ref('raw_orders') }}
)

select
    orderid,
    sum(ordercostselling) as total_sp
from orders
group by orderid
having total_sp <0