SELECT TOP (1000) [order_details_id]
      ,[order_id]
      ,[order_date]
      ,[order_time]
      ,[item_id]
  FROM [Dave].[dbo].[order_details]

-- 1. Display all records from the order_details table.
select *
from dbo.order_details

--2. Show only the order_id and item_id columns.
select order_id, item_id
from dbo.order_details

--3. Find the total number of records in the table.
select count(order_details_id) as order_num
from dbo.order_details

--4. Find all unique item IDs.
select distinct([order_details_id])
from dbo.order_details

--5. Display all orders made on '1/1/23'.
select *
from dbo.order_details
where order_date ='1/1/23'

--6. Count how many times each item_id appears.
select COUNT(item_id) as num_item, order_id
from dbo.order_details
group by order_id

--7. Find the most ordered item_id.
select Top 1 item_id, COUNT(*) as total_order
from dbo.order_details
group by item_id
order by total_order DESC

--8. Find the least ordered item_id.
select Top 1 item_id, COUNT(*) as total_order
from dbo.order_details
group by item_id
order by total_order ASC

--9. Find the maximum item_id.
select Max(item_id) as Max_id
from dbo.order_details

--10. Find the minimum item_id.
select Min(item_id) as Min_id
from dbo.order_details

--11. Group records by order_date and count total orders per day.
select order_date, COUNT(*) as total_order
from dbo.order_details
group by order_date
order by total_order ASC

--12. Group records by item_id and count how many times each item was ordered.
select item_id, COUNT(*) as num_order
from dbo.order_details
group by item_id
order by num_order DESC

--13. Find the top 5 most ordered item_ids.
SELECT TOP 5 
    order_id,
    COUNT(*) AS most_order
FROM dbo.order_details
GROUP BY order_id
ORDER BY most_order DESC;

--14. Find the bottom 5 least ordered item_ids.
select TOP 5
order_id, COUNT(*) as least_order
from dbo.order_details
group by order_id
order by least_order asc;

--15. Count the number of orders placed in each hour of the day.
select datepart(hour, order_time) as order_hours, COUNT(*) as total_orders
from dbo.order_details
group by DATEPART(hour,order_time)
order by order_hours ASC

--16. Find the busiest day based on total orders.
select top 1 order_date, COUNT(*) as total_orders
from dbo.order_details
group by order_date
order by total_orders DESC

--17. Find the busiest hour based on total orders.
select TOP 1 datepart(hour, order_time) as order_hours, COUNT(*) as total_orders
from dbo.order_details
group by DATEPART(hour,order_time)
order by total_orders desc

--18. Display all orders placed between 12 PM and 2 PM.
select *
from dbo.order_details
where cast(order_time as time) 
between '12:00:00'and  '14:00:00';

--19. Find the first 10 orders of the day.
select top 10 *
from dbo.order_details
order by order_time ASC

--20. Count how many orders were made after 6 PM.
select COUNT(*) as evening_order
from dbo.order_details
where cast(order_time as time) >'18:00:00'

--21. Find orders that contain more than one item.
select TOP 10 order_id, COUNT(item_id) as total_item
from dbo.order_details
group by order_id
having COUNT(item_id) > 1;

--22. Find the order_id with the highest number of items.
SELECT TOP 1 order_id, COUNT(item_id) AS total_item
FROM dbo.order_details
GROUP BY order_id
ORDER BY total_item desc;

--23. Find all order_ids that contain item_id 109.
select *
from dbo.order_details
where order_id = 109;

--24. Find the percentage contribution of each item_id to total orders.
select item_id, COUNT(*) * 100.0/(select count(*) from dbo.order_details) as percentage_contribution
from dbo.order_details
group by item_id