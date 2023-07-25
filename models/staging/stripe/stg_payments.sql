select
    id as payment_id,
    order_id,
    payment_method,
    status,
    -- amount is stored in cents, convert it to dollars
    {{ cents_to_dollars ('amount') }} as amount,
    created as created_at

from {{ source('stripe', 'payments') }}
