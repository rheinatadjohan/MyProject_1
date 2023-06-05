-- Product arrived late and the percentage of orders that are delivered on schedule or faster.
Select Status, 
count(Order_ID) as "AmountOf_Order",
100 * count(Order_ID) / sum(count(Order_ID)) over () as "Precentage"
from
(Select order_id as "Order_ID",
order_estimated_delivery_date as "Promised_date", -- Promised delivery date 
order_delivered_customer_date as "Actual_date", -- Actual order delivery date to the customer
Case 
WHEN order_delivered_customer_date>order_estimated_delivery_date THEN "LATE"
ELSE "ON TIME | FASTER" -- Menampilkan order yg datang tepat waktu ataupun faster
END AS "Status"
from order_dataset
WHERE order_delivered_customer_date is not null
AND order_delivered_customer_date is not null)t
Group By Status
