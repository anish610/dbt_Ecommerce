select order_id,customer_id,
cast(order_timestamp as timestamp) as order_timestamp,
cast(order_timestamp as date) as order_date,
shipping_city,
lower(order_status) as order_status,
lower(payment_status) as payment_status,
cast(updated_at as timestamp) as updated_at
from {{ref('raw_orders')}}