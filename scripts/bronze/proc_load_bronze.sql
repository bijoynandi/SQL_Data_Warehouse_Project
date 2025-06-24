-- Procedure to full load the data into the bronze layer from the source files
-- 1. Defining the procedure
CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
    DECLARE @start_time DATETIME2, @end_time DATETIME2, @batch_start_time DATETIME2, @batch_end_time DATETIME2;
    BEGIN TRY
        SET @batch_start_time = GETDATE();
        PRINT '======================================================================';
        PRINT 'Loading Bronze Layer...';
        PRINT '======================================================================';

        PRINT '----------------------------------------------------------------------';
        PRINT 'Loading CRM Tables...';
        PRINT '----------------------------------------------------------------------';

        -- Truncating the table in order to get the latest data from the source file (Full Load)
        SET @start_time = GETDATE();
        PRINT '>> Truncating Table: bronze.crm_cust_info...';
        TRUNCATE TABLE bronze.crm_cust_info;
        -- Bulk Inserting cust_info.csv into bronze.crm_cust_info
        PRINT '>> Inserting Data Into: bronze.crm_cust_info...';
        BULK INSERT bronze.crm_cust_info
        FROM 'C:\Users\bijoy\OneDrive\Documents\Data Analytics 2025\SQL\SQL Data Warehouse Project\SQL_Data_Warehouse_Project\datasets\source_crm\cust_info.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
        SET @end_time = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(MILLISECOND, @start_time, @end_time) AS NVARCHAR) + ' milliseconds';
        PRINT '-----------------';

        -- Truncating the table in order to get the latest data from the source file (Full Load)
        SET @start_time = GETDATE();
        PRINT '>> Truncating Table: bronze.crm_prd_info...';
        TRUNCATE TABLE bronze.crm_prd_info;
        -- Bulk Inserting prd_info.csv into bronze.crm_prd_info
        PRINT '>> Inserting Data Into: bronze.crm_prd_info...';
        BULK INSERT bronze.crm_prd_info
        FROM 'C:\Users\bijoy\OneDrive\Documents\Data Analytics 2025\SQL\SQL Data Warehouse Project\SQL_Data_Warehouse_Project\datasets\source_crm\prd_info.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
        SET @end_time = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(MILLISECOND, @start_time, @end_time) AS NVARCHAR) + ' milliseconds';
        PRINT '-----------------';

        -- Truncating the table in order to get the latest data from the source file (Full Load)
        SET @start_time = GETDATE();
        PRINT '>> Truncating Table: bronze.crm_sales_details...';
        TRUNCATE TABLE bronze.crm_sales_details;
        -- Bulk Inserting sales_details.csv into bronze.crm_sales_details
        PRINT '>> Inserting Data Into: bronze.crm_sales_details...';
        BULK INSERT bronze.crm_sales_details
        FROM 'C:\Users\bijoy\OneDrive\Documents\Data Analytics 2025\SQL\SQL Data Warehouse Project\SQL_Data_Warehouse_Project\datasets\source_crm\sales_details.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
        SET @end_time = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(MILLISECOND, @start_time, @end_time) AS NVARCHAR) + ' milliseconds';
        PRINT '-----------------';

        PRINT '----------------------------------------------------------------------';
        PRINT 'Loading ERP Tables...';
        PRINT '----------------------------------------------------------------------';

        -- Truncating the table in order to get the latest data from the source file (Full Load)
        SET @start_time = GETDATE();
        PRINT '>> Truncating Table: bronze.erp_cust_az12...';
        TRUNCATE TABLE bronze.erp_cust_az12;
        -- Bulk Inserting cust_az12.csv into bronze.erp_cust_az12
        PRINT '>> Inserting Data Into: bronze.erp_cust_az12...';
        BULK INSERT bronze.erp_cust_az12
        FROM 'C:\Users\bijoy\OneDrive\Documents\Data Analytics 2025\SQL\SQL Data Warehouse Project\SQL_Data_Warehouse_Project\datasets\source_erp\CUST_AZ12.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
        SET @end_time = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(MILLISECOND, @start_time, @end_time) AS NVARCHAR) + ' milliseconds';
        PRINT '-----------------';

        -- Truncating the table in order to get the latest data from the source file (Full Load)
        SET @start_time = GETDATE();
        PRINT '>> Truncating Table: bronze.erp_loc_a101...';
        TRUNCATE TABLE bronze.erp_loc_a101;
        -- Bulk Inserting loc_a101.csv into bronze.erp_loc_a101
        PRINT '>> Inserting Data Into: bronze.erp_loc_a101...';
        BULK INSERT bronze.erp_loc_a101
        FROM 'C:\Users\bijoy\OneDrive\Documents\Data Analytics 2025\SQL\SQL Data Warehouse Project\SQL_Data_Warehouse_Project\datasets\source_erp\LOC_A101.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
        SET @end_time = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(MILLISECOND, @start_time, @end_time) AS NVARCHAR) + ' milliseconds';
        PRINT '-----------------';

        -- Truncating the table in order to get the latest data from the source file (Full Load)
        SET @start_time = GETDATE();
        PRINT '>> Truncating Table: bronze.erp_px_cat_g1v2...';
        TRUNCATE TABLE bronze.erp_px_cat_g1v2;
        -- Bulk Inserting px_cat_g1v2.csv into bronze.erp_px_cat_g1v2
        PRINT '>> Inserting Data Into: bronze.erp_px_cat_g1v2...';
        BULK INSERT bronze.erp_px_cat_g1v2
        FROM 'C:\Users\bijoy\OneDrive\Documents\Data Analytics 2025\SQL\SQL Data Warehouse Project\SQL_Data_Warehouse_Project\datasets\source_erp\PX_CAT_G1V2.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
        SET @end_time = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(MILLISECOND, @start_time, @end_time) AS NVARCHAR) + ' milliseconds';
        PRINT '-----------------';

        SET @batch_end_time = GETDATE();
        PRINT '================================'
        PRINT 'Loading Bronze Layer Completed';
        PRINT '   - Total Load Duration: ' + CAST(DATEDIFF(MILLISECOND, @batch_start_time, @batch_end_time) AS NVARCHAR) + ' milliseconds';
        PRINT '================================';
    END TRY
    BEGIN CATCH
        PRINT '===========================================';
        PRINT 'ERROR OCCURRED WHILE LOADING BRONZE LAYER';
        PRINT 'Error Message' + ERROR_MESSAGE();
        PRINT 'Error Number' + CAST(ERROR_NUMBER() AS NVARCHAR(10));
        PRINT 'Error State' + CAST(ERROR_STATE() AS NVARCHAR(10));
        PRINT '===========================================';
    END CATCH
END;


-- 2. Executing the stored procedure
-- EXEC bronze.load_bronze;