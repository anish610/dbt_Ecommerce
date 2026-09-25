select payment_id,order_id,cast(payment_timestamp as timestamp) as payment_timestamp,
lower(payment_method) as payment_method,
cast(payment_amount as decimal(18,2)) as payment_amount,
lower(payment_status) as payment_status
from {{ref('raw_payments')}}

