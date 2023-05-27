-- Singular test 
-- This test is to detect when the total amount for an order is zero when the payment status is success.
-- Therefore return records where this isn't true to make the test fail.

with payments as (
    select * from {{ ref('stg_payments') }}
)
select
    order_id,
    status,
    sum(amount) as total_amount
from payments
--where status = 'success'
group by 1,2
having total_amount < 0