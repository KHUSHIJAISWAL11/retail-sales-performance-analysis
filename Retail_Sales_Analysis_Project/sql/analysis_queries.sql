USE superstore_project;
SELECT * FROM orders
LIMIT 5;

-- Total Sales--
SELECT ROUND(SUM(Sales),2) AS Total_Sales
FROM orders;

 -- Total Profit --
 SELECT ROUND(SUM(Profit),2) AS Total_Profit
FROM orders;

-- Total Orders --
SELECT COUNT(DISTINCT `Order ID`) AS Total_Orders
FROM orders;

-- top 10 customer --
SELECT `Customer Name`,
ROUND(SUM(Sales),2) AS Total_Sales
FROM orders
GROUP BY `Customer Name`
ORDER BY Total_Sales DESC
LIMIT 10;

-- Region wise Sales --
SELECT Region,
ROUND(SUM(Sales),2) AS Revenue
FROM orders
GROUP BY Region
ORDER BY Revenue DESC;

-- Category Wise Profit --
SELECT Category,
ROUND(SUM(Profit),2) AS Total_Profit
FROM orders
GROUP BY Category
ORDER BY Total_Profit DESC;

-- Monthly Sales Trend --
SELECT
YEAR(`Order Date`) AS Year,
MONTH(`Order Date`) AS Month,
ROUND(SUM(Sales),2) AS Revenue
FROM orders
GROUP BY Year, Month
ORDER BY Year, Month;

-- Top Selling Products --
SELECT `Product Name`,
SUM(Quantity) AS Total_Quantity
FROM orders
GROUP BY `Product Name`
ORDER BY Total_Quantity DESC
LIMIT 10;

-- Average Shipping Days --
SELECT
AVG(DATEDIFF(`Ship Date`,`Order Date`))
AS Avg_Shipping_Days
FROM orders;

-- Loss-Making Products --
SELECT `Product Name`,
ROUND(SUM(Profit),2) AS Total_Loss
FROM orders
GROUP BY `Product Name`
HAVING Total_Loss < 0
ORDER BY Total_Loss;

-- Most Profitable Sub-Category --
SELECT `Sub-Category`,
ROUND(SUM(Profit),2) AS Profit
FROM orders
GROUP BY `Sub-Category`
ORDER BY Profit DESC;

-- Sales by Market --
SELECT Market,
ROUND(SUM(Sales),2) AS Revenue
FROM orders
GROUP BY Market
ORDER BY Revenue DESC;