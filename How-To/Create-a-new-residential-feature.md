# How to Create a New Residential Feature

For the model, features coloquially refer to the independent variables that predict fair market values. These are compiled either through an R / Python query in ETL or SQL queries which often utilize DBT macros. Below are instructions for either of these two processes. Both structures merge in "collective steps".

## Structure A - Use R / Python in the [ETL folder](https://github.com/ccao-data/data-architecture/tree/master/etl)

### Step 1 - Ingest into [etl/scripts-ccao-data-raw-us-east-1](https://github.com/ccao-data/data-architecture/tree/master/etl/scripts-ccao-data-raw-us-east-1)

Data comes from multiple sources and is ingested at different intervals; annually from trusted sources (census data), a single time (Great Schools), or created by CCAO employees (ccao-condominium-pin_condo_char). Complete this task in R or Python, keeping data "raw", i.e. close to it's original structure. This file can be uploaded to the correct [S3 bucket](https://us-east-1.console.aws.amazon.com/s3/home?region=us-east-1#) in either parquet or excel format.

### Step 2 - Transformation into [etl/scripts-ccao-data-warehouse-us-east-1](https://github.com/ccao-data/data-architecture/tree/master/etl/scripts-ccao-data-warehouse-us-east-1)

Raw data often includes unwanted variables, column names that don't align with CCAO coding practices, or data outside of Cook County / IL. Clean the data in Python so that it can be run through DBT / Github actions. Upon completion of data cleaning, make sure that data is uploaded in Parquet format to the correct S3 Bucket.

## Structure B - Use SQL and Existing DBT Macros

Over time, CCAO has developed a series of [macro functions](https://github.com/ccao-data/data-architecture/tree/master/dbt/macros) which implement standardized transformations. These use existing resources (i.e. vw_pin_parcel) in AWS to create new features, often utilizing spatial joins.

### Step 1 - Create a SQL Query in [data_architecture/dbt/models](https://github.com/ccao-data/data-architecture/tree/master/dbt/models)

Take existing data from one of the CCAO's AWS buckets, create a SQL query that utilizes one of the macro functions, and write that into a configured parquet table. This will then be uploaded to an S3 bucket.

## Collective Steps

### Step 1 - Run Crawler for Ingest into AWS Athena.
Once final data has been uploaded to the AWS S3, it needs to be transfered to [AWS Athena](https://us-east-1.console.aws.amazon.com/athena/home?region=us-east-1#/query-editor) via the [crawler](https://us-east-1.console.aws.amazon.com/glue/home?region=us-east-1#/v2/data-catalog/crawlers). Find the correct bucket, and then click 'Run Crawler' in the upper right. 

### Step 2 - Include in the Model Pipeline

To include the feature in the model pipeline, the sql queries vw_pin_condo_input, vw_res_card_input, and vw_shared_input located in the [data_architecture/dbt/models/model/](https://github.com/ccao-data/data-architecture/tree/master/dbt/models/model) folder need to be modified.

### Step 3 - Update Documentation

CCAO data is largely mantained through DBT. To ensure data integrity, documentation needs to be updated alongside the new feature. These can be found in data_architecture/dbt/models/.../schema.yml, dbt/models/shared_columns.md, dbt/models/.../docs.md, and dbt/models/.../schema.yml.

## Final Step - An Optional Horrah

Test the impact of the feature by running the model via the following [guide](https://github.com/ccao-data/model-res-avm/blob/master/README.md). 
