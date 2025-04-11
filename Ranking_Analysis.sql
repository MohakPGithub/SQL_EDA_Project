-- File Name: Ranking Analysis
-- Description: Order the values of dimensions by measure to find top and bottom performers in product and subcategory revenue.

--------------------------------------------------------------------------------
-- Q1: Which 5 products generate the highest revenue?
--------------------------------------------------------------------------------

SELECT 
    dp.product_name AS Product, 
    SUM(fs.sales_amount) AS Revenue,
    ROW_NUMBER() OVER (ORDER BY SUM(fs.sales_amount) DESC) AS Ranked
FROM fact_sales fs
JOIN dim_products dp 
    ON fs.product_key = dp.product_key
GROUP BY dp.product_name 
ORDER BY Revenue DESC 
LIMIT 5;

-- Result:
-- 'Mountain-200 Black- 46',       1373454
-- 'Mountain-200 Black- 42',       1363128
-- 'Mountain-200 Silver- 38',      1339394
-- 'Mountain-200 Silver- 46',      1298709
-- 'Mountain-200 Black- 38',       1292559

--------------------------------------------------------------------------------
-- Q2: Which 5 products generate the worst revenue?
--------------------------------------------------------------------------------

SELECT 
    dp.product_name AS Product, 
    SUM(fs.sales_amount) AS Revenue,
    ROW_NUMBER() OVER (ORDER BY SUM(fs.sales_amount) DESC) AS Ranked
FROM fact_sales fs
JOIN dim_products dp 
    ON fs.product_key = dp.product_key
GROUP BY dp.product_name 
ORDER BY Revenue ASC 
LIMIT 5;

-- Result:
-- 'Racing Socks- L',              2430
-- 'Racing Socks- M',              2682
-- 'Patch Kit/8 Patches',          6378
-- 'Bike Wash - Dissolver',        7272
-- 'Touring Tire Tube',            7435

--------------------------------------------------------------------------------
-- Q3: Which 5 product subcategories generate the highest revenue?
--------------------------------------------------------------------------------

SELECT 
    dp.subcategory AS SubCategory, 
    SUM(fs.sales_amount) AS Revenue,
    ROW_NUMBER() OVER (ORDER BY SUM(fs.sales_amount) DESC) AS Ranked
FROM fact_sales fs
JOIN dim_products dp 
    ON fs.product_key = dp.product_key
GROUP BY dp.subcategory 
ORDER BY Revenue DESC 
LIMIT 5;

-- Result:
-- 'Road Bikes',                   14519438
-- 'Mountain Bikes',               9947639
-- 'Touring Bikes',                3844580
-- 'Tires and Tubes',              244445
-- 'Helmets',                      225400

--------------------------------------------------------------------------------
-- Q4: Which 5 product subcategories generate the worst revenue?
--------------------------------------------------------------------------------

SELECT 
    dp.subcategory AS SubCategory, 
    SUM(fs.sales_amount) AS Revenue,
    ROW_NUMBER() OVER (ORDER BY SUM(fs.sales_amount) DESC) AS Ranked
FROM fact_sales fs
JOIN dim_products dp 
    ON fs.product_key = dp.product_key
GROUP BY dp.subcategory  
ORDER BY Revenue ASC 
LIMIT 5;

-- Result:
-- 'Socks',                        5112
-- 'Cleaners',                     7272
-- 'Caps',                         19710
-- 'Gloves',                       34296
-- 'Vests',                        36160

--------------------------------------------------------------------------------
-- INSIGHTS:
-- 
-- 1. The top 5 highest revenue-generating products are all variants of the Mountain-200 bike, showing strong demand for this specific model line.
-- 2. Low-revenue products are primarily inexpensive accessories like socks, patches, and cleaning kits—indicating limited standalone profitability.
-- 3. At a subcategory level, 'Road Bikes', 'Mountain Bikes', and 'Touring Bikes' dominate revenue generation, reinforcing the idea that core bicycle products are the main revenue drivers.
-- 4. Categories like 'Socks', 'Cleaners', and 'Caps' contribute the least revenue, and may be better positioned as add-ons, bundled products, or promotional giveaways.
-- 5. A strategic opportunity exists in upselling high-margin items and bundling low-performing accessories with premium bike models to increase their overall contribution.