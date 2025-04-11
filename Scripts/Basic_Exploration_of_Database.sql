-- ====================================================================
-- SQL Script: Explore and Clean DataWarehouseAnalytics Database
-- Description: This script explores table metadata and performs 
--              data cleaning on the dim_customers table.
-- Author: Mohak Pachpor
-- ====================================================================

-- =============================================================
-- 1. View all table names in the database
-- =============================================================
SELECT TABLE_NAME 
FROM INFORMATION_SCHEMA.TABLES 
WHERE TABLE_SCHEMA = 'DataWarehouseAnalytics';

-- =============================================================
-- 2. View schema (structure) of all tables
-- =============================================================
SELECT 
    TABLE_NAME,
    COLUMN_NAME,
    DATA_TYPE,
    IS_NULLABLE,
    COLUMN_DEFAULT,
    CHARACTER_MAXIMUM_LENGTH
FROM 
    INFORMATION_SCHEMA.COLUMNS
WHERE 
    TABLE_SCHEMA = 'DataWarehouseAnalytics'
ORDER BY 
    TABLE_NAME, ORDINAL_POSITION;

-- =============================================================
-- 3. Preview customer data
-- =============================================================
SELECT * FROM dim_customers;

-- =============================================================
-- 4. Data Cleaning - Fixing incorrect column types
-- (Only after ensuring all values are valid or NULL)
-- =============================================================

-- Disable safe updates (if necessary)
SET SQL_SAFE_UPDATES = 0;

-- Replace empty string dates with NULL to enable proper type casting
UPDATE dim_customers
SET birthdate = NULL
WHERE birthdate = '';

UPDATE dim_customers
SET create_date = NULL
WHERE create_date = '';

-- Change column data types to DATE
ALTER TABLE dim_customers
MODIFY COLUMN birthdate DATE;

ALTER TABLE dim_customers
MODIFY COLUMN create_date DATE;

-- (Optional) Re-enable safe updates
-- SET SQL_SAFE_UPDATES = 1;

-- =============================================================
-- End of Script
-- =============================================================