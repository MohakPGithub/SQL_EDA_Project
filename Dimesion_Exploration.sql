-- Check for duplicate customer_key
SELECT customer_key, COUNT(customer_key) AS count_key
FROM dim_customers
GROUP BY customer_key
HAVING COUNT(customer_key) != 1;

-- No Duplicates Found
SELECT * FROM dim_customers;

-- Check for duplicate customer_id
SELECT customer_id, COUNT(customer_id) AS count_key
FROM dim_customers
GROUP BY customer_id
HAVING COUNT(customer_id) != 1;
-- No Duplicates Found

-- Check for duplicate customer_number
SELECT customer_number, COUNT(customer_number) AS count_key
FROM dim_customers
GROUP BY customer_number
HAVING COUNT(customer_number) != 1;
-- No Duplicates Found

-- Check for frequency of country
SELECT country, COUNT(country) AS count_key
FROM dim_customers
GROUP BY country
HAVING COUNT(country) != 1;
-- Countries repeat – which is expected

-- Final Remarks:
-- Repetition in columns like country, marital_status, gender, birthdate, and create_date is acceptable and expected.



-- Unique countries our customers belong to
SELECT DISTINCT country FROM dim_customers;
-- Customers come from 6 different countries



-- Explore all major product categories
SELECT DISTINCT category FROM dim_products;
-- Total: 4 product categories

-- Explore unique subcategories within each category
SELECT DISTINCT category, subcategory FROM dim_products;

-- Count of subcategories under each category
SELECT category, COUNT(DISTINCT subcategory) AS subcategory_count
FROM dim_products
GROUP BY category;

-- Explore distinct product names within each category and subcategory
SELECT DISTINCT category, subcategory, product_name FROM dim_products;

-- Count of products under each category → subcategory combination
SELECT category, subcategory, COUNT(product_name) AS product_count
FROM dim_products
GROUP BY category, subcategory;

-- Final Remarks:
-- 	category → Level 1
-- 	subcategory → Level 2
-- 	product_name → Level 3

-- This hierarchical structure is clearly visible from the data:
-- 	'Bikes' → 'Mountain Bikes' → 'Mountain-100 Black- 42'
-- 	'Components' → 'Road Frames' → 'ML Road Frame - Red- 60'
-- 	'Clothing' → 'Vests' → 'Classic Vest- M'