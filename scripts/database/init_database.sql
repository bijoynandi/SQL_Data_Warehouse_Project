/*
===========================
Create Database and Schemas
===========================

Script Purpose:
    This script creates a new database named 'DataWarehouse' after checking if it already exists.
    If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas
    within the database: 'bronze', 'silver', and 'gold'.

WARNING:
    Running the script will drop the entire 'DataWarehouse' database if it exists.
    All data in the database will be permanently deleted. Proceed with caution 
    and ensure you have proper backups before running this script.
 */


-- Switch to the master database context, which is necessary to drop or alter other databases.
USE master;
GO

-- Check if the database named 'DataWarehouse' exists in the system.
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    -- Change the database to SINGLE_USER mode to disconnect any active connections.
    -- This allows us to drop the database without encountering errors from active sessions.
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;

    -- Drop the existing 'DataWarehouse' database.
    DROP DATABASE DataWarehouse;

    -- Print a message indicating that the database has been dropped successfully.
    PRINT 'Database DataWarehouse dropped successfully.';
END;
GO

-- Create a new database named 'DataWarehouse'.
CREATE DATABASE DataWarehouse;

-- Print a message indicating that the new database has been created successfully.
PRINT 'Database DataWarehouse created successfully.';
GO

-- Using Database DataWarehouse
USE DataWarehouse;
GO

-- Create Schemas
CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
GO