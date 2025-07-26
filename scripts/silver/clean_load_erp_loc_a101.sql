-- Inserting the clean data into the silver.erp_loc_a101 table
INSERT INTO silver.erp_loc_a101
    (
        cid,
        cntry
    )
SELECT
    REPLACE(cid, '-', '') AS cid,
    CASE
        WHEN TRIM(cntry) = '' OR cntry IS NULL THEN 'n/a'
        WHEN UPPER(TRIM(cntry)) IN ('US', 'USA','UNITED STATES OF AMERICA') THEN 'United States'
        WHEN UPPER(TRIM(cntry)) = 'DE' THEN 'Germany'
        ELSE TRIM(cntry)
    END AS cntry
FROM bronze.erp_loc_a101;