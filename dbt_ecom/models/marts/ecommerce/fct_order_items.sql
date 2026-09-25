select
    order_id,
    line_number,
    product_id,
    quantity,
    unit_price,
    line_amount

from {{ ref('int_order_items') }}