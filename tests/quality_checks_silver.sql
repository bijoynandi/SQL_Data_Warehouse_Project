-- Different types of Quality Checks for the Silver Layer
SELECT *
FROM silver.erp_px_cat_g1v2;

-- Checking for duplicate & NULL values in a unique id column
-- Expecting 0 rows
SELECT
    sls_ord_num,
    COUNT(*)
FROM silver.crm_sales_details
GROUP BY sls_ord_num
HAVING COUNT(*) > 1 OR sls_ord_num IS NULL;

-- Check for Unwanted Spaces in the data
-- Expecting 0 rows
SELECT *
FROM bronze.erp_px_cat_g1v2
WHERE cat != TRIM(cat) OR subcat != TRIM(subcat) OR maintenance != TRIM(maintenance)

-- Check for NULLs or Negative Numbers in the columns sls_sales
-- Expecting 0 rows
SELECT
    maintenance
FROM bronze.erp_px_cat_g1v2
WHERE maintenance IS NULL

-- Data Standardization & Consistency for columns prd_gndr & prd_marital_status
SELECT DISTINCT
    maintenance    
FROM bronze.erp_px_cat_g1v2
ORDER BY maintenance;

-- Check for Invalid Dates
SELECT
    sls_order_dt,
    sls_ship_dt,
    sls_due_dt
FROM silver.crm_sales_details
WHERE sls_due_dt <=0 
OR LEN(sls_due_dt) != 8 
OR sls_due_dt > 20500101 
OR sls_due_dt < 19000101;

-- Identify Out-of-Range Dates
SELECT
    bdate
FROM silver.erp_cust_az12
WHERE bdate < '1925-01-01' OR bdate > GETDATE();

-- Checking data types
SELECT
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'erp_cust_az12'
AND COLUMN_NAME = 'bdate'
AND TABLE_SCHEMA = 'bronze';

-- Check for Invalid Date Orders
SELECT *
FROM silver.crm_sales_details
WHERE sls_order_dt > sls_ship_dt OR sls_order_dt > sls_due_dt;

-- Check Data Consistency: Between Sales, Quantity and Price
-- >> Sales = Quantity * Price
-- >> Values must not be NULL, 0 or Negative
SELECT DISTINCT
    sls_sales,
    sls_quantity,
    sls_price
FROM silver.crm_sales_details
WHERE sls_sales != sls_quantity * sls_price
OR sls_sales IS NULL OR sls_quantity IS NULL OR sls_price IS NULL
OR sls_sales <= 0 OR sls_quantity <= 0 OR sls_price <= 0
ORDER BY sls_sales, sls_quantity, sls_price;