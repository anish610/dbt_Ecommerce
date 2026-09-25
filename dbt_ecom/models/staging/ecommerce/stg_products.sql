select product_id,product_name,category,subcategory,
cast(unit_price as decimal(18,2)) as unit_price,
stock_quantity
from {{ref('raw_products')}}
