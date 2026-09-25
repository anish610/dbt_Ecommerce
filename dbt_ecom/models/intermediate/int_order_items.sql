Select 
oi.order_id,
    oi.line_number,
    oi.product_id,

    p.product_name,
    p.category,
    p.subcategory,

    oi.quantity,
    oi.unit_price,
    oi.line_amount
 from 
{{ref('stg_order_item')}} oi 
left join {{ref('stg_products')}} p
on oi.product_id = p.product_id


