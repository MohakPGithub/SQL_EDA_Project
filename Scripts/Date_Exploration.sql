-- ================================================================
-- Date Exploration Section: Exploring Date Boundaries, Time Span, 
-- and Age of Customers
-- ================================================================

-- View All Orders (for context)
SELECT * FROM fact_sales;

-- Find the date of the first and last order, and how many years of sales are available
SELECT 
    MIN(order_date) AS First_Order_Date,
    MAX(order_date) AS Latest_Order_Date,
    TIMESTAMPDIFF(YEAR, MIN(order_date), MAX(order_date)) AS TimeSpan_Of_Order_Years
FROM
    fact_sales;
-- Remarks: TimeSpan of total 3 years is covered in this table.

-- Find the date of the first and last order, and how many months of sales are available
SELECT 
    MIN(order_date) AS First_Order_Date,
    MAX(order_date) AS Latest_Order_Date,
    TIMESTAMPDIFF(MONTH, MIN(order_date), MAX(order_date)) AS TimeSpan_Of_Order_Months
FROM
    fact_sales;
-- Remarks: TimeSpan of total 36 months is covered in this table.

-- View All Customers (for context)
SELECT * FROM dim_customers;

-- Find the youngest customer
SELECT 
    first_name,
    TIMESTAMPDIFF(YEAR, (SELECT 
            MAX(birthdate)
        FROM
            dim_customers), CURDATE()) AS Youngest_Age
FROM
    dim_customers
WHERE
    birthdate = (SELECT 
            MAX(birthdate)
        FROM
            dim_customers);
-- Remarks: 'Logan', 'Roger' are the youngest customers in the customer cohort, aged 38 years.

-- Find the oldest customer
SELECT 
    first_name,
    TIMESTAMPDIFF(YEAR, (SELECT 
            MIN(birthdate)
        FROM
            dim_customers), CURDATE()) AS Oldest_Age
FROM
    dim_customers
WHERE
    birthdate = (SELECT 
            MIN(birthdate) 
        FROM
            dim_customers); 
-- Remarks: 'Gabrielle' is the oldest in the customer cohort, aged 106 years. Seems very old!

-- Final Remarks:
-- We don't really have any young customers as the minimum age is 38 years.