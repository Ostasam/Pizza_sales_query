select * from pizza_sales

1. Total Revenue:

Select Sum(total_price) As Total_revenue From pizza_sales


2. Average Order Value: 

Select SUM(total_price)/  count(distinct order_id) As Avg_order_value
From pizza_sales

3. Total Pizza Sold:

Select Sum(quantity) As Total_pizza_sold 
From pizza_sales

4. Total Orders:

Select Count(distinct order_id) AS Total_order
From pizza_sales

5. Average Pizza per orders:


SELECT CAST(CAST(SUM(quantity) 
AS DECIMAL(10,2))/ CAST(COUNT(DISTINCT order_id)
AS DECIMAL (10,2)) AS DECIMAL(10,2)) 
AS Avg_Pizzas_Per_Order FROM pizza_sales



SELECT DATENAME(DW, order_date) AS Order_Day, COUNT(DISTINCT order_id)
AS Total_Orders FROM pizza_sales GROUP BY DATENAME(DW, order_date);

SELECT DATEPART(HOUR, order_time) AS Order_Hours, COUNT(DISTINCT order_id)
AS Total_Orders FROM pizza_sales GROUP BY DATEPART(HOUR, order_time)
ORDER BY DATEPART(HOUR, order_time);

SELECT pizza_category, SUM(total_price) * 100 / (SELECT SUM(total_price)
FROM pizza_sales) AS Percent_of_TotalSales FROM pizza_sales GROUP BY pizza_category;

SELECT pizza_size, SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales)
AS Percent_Of_TotalSales FROM pizza_sales GROUP BY pizza_size;

SELECT pizza_category, SUM(quantity) AS Total_Pizzas_Sold FROM pizza_sales
GROUP BY pizza_category;

SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Pizzas_sold FROM pizza_sales
GROUP BY pizza_name ORDER BY SUM(quantity) DESC;

SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Pizzas_sold FROM pizza_sales
GROUP BY pizza_name ORDER BY SUM(quantity) ASC;