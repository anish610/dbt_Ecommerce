select order_id,line_number,product_id,quantity,cast(unit_price as decimal(18,2)) as unit_price,cast(line_amount as decimal(18,2)) as line_amount 
from {{ref('raw_order_items')}}

