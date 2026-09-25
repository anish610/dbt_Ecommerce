select 
o.order_id,
c.customer_id,
c.customer_name,
    c.email,
    c.city,
    c.state,

    o.order_date,
    o.order_timestamp,
    o.order_status,
    o.payment_status,
    o.shipping_city,
    o.updated_at
from 
{{ref('stg_orders')}} o
left join {{ref('stg_customers')}} c
on o.customer_id = c.customer_id
