select
    order_id,
    customer_id,
    order_date,
    order_timestamp,
    shipping_city,
    order_status,
    payment_status

from {{ ref('int_customer_orders') }}