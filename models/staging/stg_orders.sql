select
--from raw orders
{{ dbt_utils.surrogate_key(['o.orderid', 'c.customerid','p.productid']) }} as sk_orders,
o.orderid,
o.orderdate,
o.shipadate,
o.shipmode,
o.ordercostselling - o.ordercostprice as orderprofit,
o.ordercostprice,
o.ordercostselling,
--from raw customer
c.customerid,
c.customername,
c.segment,
c.country,
--from raw product
p.category,
p.productid,
p.productname,
p.subcategory,
{{ markup('ordercostselling', 'ordercostprice') }} as markup,
d.delivery_team
from {{ ref('raw_orders') }} as o
left join {{ ref('raw_customer') }} as c
on o.customerid = c.customerid
left join {{ ref('raw_product') }} as p
on o.productid = p.productid
left join {{ ref('delivery_team') }} as d
on o.shipmode = d.shipmode

{{limit_data_in_dev('orderdate')}}