select
--from raw orders
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
{{ markup('ordercostselling', 'ordercostprice') }} as markup
from {{ ref('raw_orders') }} as o
left join {{ ref('raw_customer') }} as c
on o.customerid = c.customerid
left join {{ ref('raw_product') }} as p
on o.productid = p.productid

{{limit_data_in_dev('orderdate')}}