-- Quality check for gold.dim_customers
SELECT *
FROM gold.dim_customers;

SELECT DISTINCT gender
FROM gold.dim_customers;

-- Quality check for gold.dim_products

/* After joining table, check if any duplicates were introduced
by the join logic */
SELECT prd_key, COUNT(*) count_duplicates FROM (
SELECT
    pn.prd_id,
    pn.cat_id,
    pn.prd_key,
    pn.prd_nm,
    pn.prd_cost,
    pn.prd_line,
    pn.prd_start_dt,
    pc.cat,
    pc.subcat,
    pc.maintenance
FROM silver.crm_prd_info AS pn
LEFT JOIN silver.erp_px_cat_g1v2 AS pc
ON pn.cat_id = pc.id
WHERE pn.prd_end_dt IS NULL -- Filter out all historical data
) t
GROUP BY prd_key
HAVING COUNT(*) > 1;

SELECT *
FROM gold.dim_products;

-- Quality check for gold.fact_sales
SELECT *
FROM gold.fact_sales;

-- Foreign Key Integrity (Dimensions)
SELECT *
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
ON f.customer_key = c.customer_key
LEFT JOIN gold.dim_products p
ON f.product_key = p.product_key
WHERE c.customer_key IS NULL OR p.product_key IS NULL;