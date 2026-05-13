-- 1. Find the top 5 most ordered menu items.
select top 5 mi.item_name, COUNT(*) as total_order
from dbo.order_details od
join dbo.menu_items mi
on try_cast(od.item_id as int) = mi.menu_item_id
group by mi.item_name
order by total_order desc;


-- 2. Calculate the total revenue generated from all orders.
select sum(price) as revenue
from dbo.order_details od
join dbo.menu_items mi
on try_cast(od.item_id as int) = mi.menu_item_id

-- 3. Find the category with the highest number of orders.
select mi.category, Count(od.order_id) as number_order
from dbo.order_details od
join dbo.menu_items mi
on TRY_CAST(od.item_id as int) = mi.menu_item_id
group by category
order by category

-- 4. Display all orders placed between 12 PM and 2 PM along with item names and prices.
select od.order_id,mi.price,mi.item_name,od.order_time
from dbo.order_details od
join dbo.menu_items mi
on try_CAST(od.item_id as int) = mi.menu_item_id
where try_cast(order_time as time) 
between '12:00:00' and '14:00:00';

-- 5. Find the top 3 highest revenue-generating menu items.
select Top 3 sum(mi.price) as total_revenue,mi.item_name
from dbo.order_details od
join dbo.menu_items mi
on try_CAST(od.item_id as int) = mi.menu_item_id
group by item_name
order by item_name DESC;


-- 6. Count how many times each category was ordered.
select COUNT(order_id) as number_orders, mi.item_name
from dbo.order_details od
join dbo.menu_items mi
on try_CAST(od.item_id as int) = mi.menu_item_id
group by mi.item_name
order by number_orders DESC;

-- 7. Find the average price of items ordered in each category.
select item_name, AVG(price) as avg_price
from dbo.order_details od
join dbo.menu_items mi
on try_CAST(od.item_id as int) = mi.menu_item_id
group by item_name
order by avg_price DESC

-- 8. Identify the busiest hour of the day based on total orders.
select Top 1 Datepart(hour, order_time) as order_hour,COUNT(*) as total_orders
from dbo.order_details od
join dbo.menu_items mi
on try_CAST(od.item_id as int) = mi.menu_item_id
group by DATEPART(hour,order_time)

-- 9. Find menu items that were never ordered.
SELECT mi.item_name,
       mi.menu_item_id
FROM dbo.menu_items mi
LEFT JOIN dbo.order_details od
ON mi.menu_item_id = TRY_CAST(od.item_id AS INT)
WHERE od.item_id IS NULL
ORDER BY mi.menu_item_id ASC;
-- 10. Rank menu items based on total revenue generated.
select item_name, sum(price) as total_revenue, RANK() over (Order by sum(price) DESC) as revenue_rank
from dbo.order_details od
join dbo.menu_items mi
on TRY_CAST(od.item_id as int) = mi.menu_item_id
group by item_name

select *
from dbo.order_details od
join dbo.menu_items mi
on TRY_CAST(od.item_id as int) = mi.menu_item_id

