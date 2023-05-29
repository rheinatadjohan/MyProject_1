select Tahun, 
Total_customer,
((Total_customer-lag(Total_customer,1) over(order by Tahun))/lag(Total_customer,1) over(order by Tahun)*100) as Growth_rate
from( 
select count(customer_id) as "Total_customer", 
YEAR(order_purchase_timestamp) as "Tahun"
from order_customer_dataset 
inner join order_dataset using(customer_id)
group by Tahun)t 
order by Tahun
