# ELT Data Pipeline with DBT, Snowflake, and Amazon S3

## Overview
This project demonstrates an end-to-end ELT (Extract, Load, Transform) data pipeline using **DBT (Data Build Tool)**, **Snowflake**, and **Amazon S3**. It processes the MovieLens 25M dataset, which contains over 25 million movie ratings, to create analytics-ready models for data analysis and reporting.

## Architecture
- **Amazon S3**: Raw CSV data storage.
- **Snowflake**: Data warehouse for raw data ingestion and transformations.
- **DBT**: Performs modular SQL transformations on raw data within Snowflake.

## Key Features
- Efficient ingestion of large-scale data from S3 into Snowflake.
- Modular DBT models with staging, dimension, and fact layers.
- Incremental models for processing new data efficiently.
- Implementation of Slowly Changing Dimensions Type 2 (SCD2) using DBT snapshots.
- Automated data quality testing (uniqueness, null checks, referential integrity).
- Auto-generated documentation with model lineage for easy data pipeline understanding.
- Custom macros and DBT packages to enhance transformation capabilities.

## Technologies Used
- DBT Core with Snowflake adapter
- Snowflake cloud data warehouse
- Amazon S3 storage service
- SQL for transformations
- Python virtual environment for DBT management


