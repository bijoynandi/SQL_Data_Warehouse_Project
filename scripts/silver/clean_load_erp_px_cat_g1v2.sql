-- Inserting the clean data into the silver.erp_px_cat_g1v2 table
INSERT INTO silver.erp_px_cat_g1v2
    (
        id,
        cat,
        subcat,
        maintenance
    )
SELECT
    id,
    cat,
    subcat,
    maintenance
FROM bronze.erp_px_cat_g1v2;