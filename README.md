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

## What I Learned
- **SQL Server**: I gained hands-on experience with SQL Server, including database creation, data ingestion, and data modeling.
- **Data Engineering**: I learned the importance of data quality, data cleansing, and data integration in a data engineering project.
- **Data Modeling**: I gained insights into designing a star schema for efficient data analysis.
- **Project Management**: I learned how to manage a data engineering project from start to finish.
- **Data Architecture**: I gained a deeper understanding of data architecture, including the Medallion Architecture and its layers.
- **Data Warehousing**: I learned about data warehousing concepts and best practices.
- **ETL Pipelines**: I gained experience in building ETL pipelines using SQL Server.
- **Data Quality**: I learned about data quality management and best practices.

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

## Conclusion
This project demonstrates proficiency in SQL development, data architecture, data engineering. It provides a solid foundation for further data-driven projects and analytics. Feel free to explore the code and adapt it to your specific needs. If you have any questions or feedback, please don't hesitate to reach out. Happy data engineering!

## Acknowledgments
I would like to express my sincere gratitude to [Baraa Khatib Salkini](https://github.com/DataWithBaraa) for providing the guidance and resources that made this project possible. The expertise was invaluable in helping me build this data warehouse project from scratch and understand the intricacies of data warehousing. I am deeply grateful for the knowledge and support provided by Baraa. Thank you, Baraa!

## Contact
If you have any questions or would like to connect, feel free to reach out to me at [bijoynandi31@gmail.com](mailto:bijoynandi31@gmail.com).