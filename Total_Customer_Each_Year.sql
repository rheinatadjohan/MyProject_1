select count(customer_id) as "Total_customer", YEAR(order_purchase_timestamp) as "Tahun"
from order_customer_dataset 
inner join order_dataset using(customer_id)
group by Tahun
