-- File Name: Measures_Exploration.sql
-- Description: Calculate Key Metrics for Business (Big Numbers)

-- Reminder: Metrics are calculated at the highest level of aggregation.
-- To drill deeper, use queries with the lowest level of details.

-- KPI Questions to Answer:
-- 01. Find the Total Sales
-- 02. Find how many items are sold
-- 03. Find the average selling price
-- 04. Find the Total number of Orders
-- 05. Find the total number of products
-- 06. Find the total number of customers
-- 07. Find the total number of customers that have placed an order

-- Load Fact Table (Transactional Sales Data)
SELECT * FROM fact_sales;

-- 01. Total Sales
SELECT 
    SUM(revenue) AS Total_Sales 
FROM 
    (SELECT quantity * price AS revenue FROM fact_sales) AS rev;
-- Output: $29,351,258

-- 02. Total Quantity Sold
SELECT 
    SUM(quantity) AS Total_Quantity 
FROM 
    fact_sales;
-- Output: 60,404 items sold

-- 03. Average Selling Price
SELECT 
    AVG(price) AS Average_Selling_Price 
FROM 
    fact_sales;
-- Output: $486.1081

-- 04. Total Number of Orders (Raw Count and Distinct)
SELECT 
    COUNT(order_number) AS Total_Orders 
FROM 
    fact_sales;
-- Output: 60,379 total order rows

SELECT 
    COUNT(DISTINCT order_number) AS Distinct_Orders 
FROM 
    fact_sales;
-- Output: 27,657 distinct orders

-- 05. Total Number of Products
SELECT 
    COUNT(DISTINCT product_name) AS Total_Products 
FROM 
    dim_products;
-- Output: 295 products

-- 06. Total Number of Customers in Database
SELECT 
    COUNT(DISTINCT customer_id) AS Total_Customers 
FROM 
    dim_customers;

SELECT 
    COUNT(DISTINCT customer_key) AS Total_Customers_Alt 
FROM 
    dim_customers;
-- Output: 18,484 customers

-- 07. Total Number of Customers Who Placed an Order
SELECT 
    COUNT(DISTINCT customer_key) AS Customers_Who_Ordered 
FROM 
    fact_sales;
-- Output: 18,482 customers placed orders (99.99% activation!)

-- Top 7 Insights – Updated with Unique POV
-- 	1.Massive Customer Engagement: 99.99% Customers Have Ordered
-- Out of 18,484 total customers, 18,482 have placed an order — that’s nearly 100% activation. It suggests your data is super clean and the platform is highly transaction-efficient — or maybe it only captures active customers!
-- 	2.A $29.35M Business Riding on 60K Orders
-- The total sales of $29.35M on 60,379 transactions signals strong revenue velocity. Combined with an average selling price of $486, you’re selling high-value items consistently.
-- 	3.Bundle or Cross-Sell Strategy Works!
-- With 60,404 items sold across 27,657 unique orders, each order averages ~2.18 items/order — excellent for pushing bundles or complementary products.
-- 	4.Orders vs Order Lines Gap Shows Cart Diversity
-- The gap between total order lines (60,379) and distinct orders (27,657) suggests customers are buying multiple products in a single transaction, not just repeating the same item — a healthy sign of catalog strength.
-- 	5.	Average Selling Price ($486) = Premium Pricing
-- You’re not in the discount game. This ASP indicates a premium brand/product positioning, and efforts should focus on experience, quality, and value over price.
-- 	6.Rich Catalog with 295 Products
-- A product catalog of nearly 300 distinct items opens opportunities for deep personalization and market segmentation — think recommendation engines, A/B testing, or niche campaigns.
-- 	7.	Metric Design Encourages Smart Drilldowns
-- Your metric design adheres to the principle: Big Numbers at the Top, Details via Drilldowns. This allows stakeholders to go from a bird’s-eye view to transaction-level detail — ideal for dashboards and decision-making.

-- ⸻
