## Project Title
Modern Data Warehouse with SQL Server.

## Project Overview
This project is designed to demonstrate proficiency in SQL development, data architecture, data engineering, ETL pipelines, data modeling, and data analytics.

## Data Architecture
The data architecture for this project follows Medallion Architecture **Bronze**, **Silver**, and **Gold** layers:

1. **Bronze Layer**: Stores raw data as-is from the source systems. Data is ingested from CSV Files into SQL Server Database.

2. **Silver Layer**: This layer includes data cleansing, standardization, and normalization processes to prepare data for analysis.

3. **Gold Layer**: Houses business-ready data modeled into a star schema required for reporting and analytics.

## Data Model

The data model is designed to support the following business requirements:

- **Customer Behavior**: Analyze customer demographics, purchase history, and preferences.
- **Product Performance**: Track product sales, inventory, and performance metrics.
- **Sales Trends**: Monitor sales trends over time to identify patterns and make informed decisions.

## Data Engineering

The data engineering process includes:
- **Data Ingestion**: Import data from CSV files into SQL Server.
- **Data Cleansing**: Resolve data quality issues and ensure data consistency.
- **Data Integration**: Combine data from multiple sources into a single, user-friendly data model.
- **Data Modeling**: Design a star schema for efficient data analysis.

## Analytics and Reporting
The analytics and reporting process includes:
- **SQL-based Analytics**: Develop SQL queries to extract insights from the data model.
- **Reporting**: Generate reports and dashboards to visualize key business metrics.

## Project Structure
- `datasets/`: Contains raw datasets used for the project.
- `docs/`: Project documentation and architecture details.
- `scripts/`: SQL scripts for data ingestion, cleansing, and analytics.
- `tests/`: Test scripts for data quality and analytics for the silver and gold layers.
- `LICENSE`: License information.
- `README.md`: This file.

## Usage
To use this project, follow these steps:
1. Clone this repository.
2. Set up SQL Server and create the necessary databases and tables.
3. Run the ETL scripts to ingest data from CSV files.
4. Explore the data model and analytics queries.

## Contributing
Contributions are welcome! Please open an issue or submit a pull request for any improvements or bug fixes.

## License
This project is licensed under the MIT License.