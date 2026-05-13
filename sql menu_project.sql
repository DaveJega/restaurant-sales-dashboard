SELECT TOP (1000) [menu_item_id]
      ,[item_name]
      ,[category]
      ,[price]
  FROM [Dave].[dbo].[menu_items]

  -- 1. View all menu

  select *
  from dbo.menu_items

  -- 2. Show only item names and prices

  select item_name, price
  from dbo.menu_items

  -- 3. Find all items in a specific category
  select item_name, category
  from dbo.menu_items
  where category ='American'


  -- 4. Find menu items price above 15
  select item_name, price
  from dbo.menu_items
  where price >15
  order by price ASC

  -- 5. Show the most expensive item
  select *
  from dbo.menu_items
  order by price DESC

  -- 6. Show the cheapest items
  select *
  from dbo.menu_items
  order by price ASC

  -- 7.Find items between two prices
  select *
  from dbo.menu_items
  where price between 5 and 9 
  
  -- 8.Find the average menu price
  select AVG(price) as avg_price
  from dbo.menu_items

  -- 9. Find the highest priced item
  select MAX(price) as Max_price
  from dbo.menu_items

  -- 10.Find the cheapest item
  select MIN(Price) as Min_price
  from dbo.menu_items

  -- 11. Count total menu items
  select COUNT(*) as Num_item
  from dbo.menu_items

  -- 12. Count items in each category
  select COUNT(item_name) as num_item, category
  from dbo.menu_items
  group by category

  -- 13. Find average price by category
  select AVG(price) as Avg_price, category
  from dbo.menu_items
  group by category

  -- 14. Find the most expensive item in each category
  select MAX(price) as Max_price, category
  from dbo.menu_items
  group by category

  -- 15. Find categories with average price greater than $15
  select AVG(price) as Avg_price, category
  from dbo.menu_items
  group by category
  having AVG(price) > 15

  -- 16. Find duplicate prices
  select price, COUNT(*) as occurences
  from dbo.menu_items
  group by price
  Having COUNT(*)>1

  -- 17. Find menu items containing a keyword
  select item_name, category
  from dbo.menu_items
  where item_name Like '%Hot%';
  
  -- 18. Which category is the most expensive on average
  select AVG(price) as avg_price, category
  from dbo.menu_items
  group by category
  order by category DESC

  -- 19 Which category has the most items?
  select count(*) as num_item, category
  from dbo.menu_items
  group by category

  -- 20. What percentage of items belong to each category?
  select category, COUNT(*) * 100.0/ (select COUNT(*) from menu_items) as percentage
  from dbo.menu_items
  group by category;

  -- 21. Rank items from most expensive to cheapest
  select item_name, category, price,
  dense_Rank() OVER(ORDER by price desc) as price_rank
   from dbo.menu_items
  
  
