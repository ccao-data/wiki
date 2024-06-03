# Feature Overview

For the model, features coloquially refer to the independent variables which are used to predict fair market values. 
These come from multiple sources, but are compiled through a relatively standardized process 

# Structure 1 - Creating a feature using R / Python in the ETL bucket

## Step 1 Ingest into etl/scripts-ccao-data-raw-us-east-1

Data can be come from multiple sources. Some of them will be updated annually from trusted
sources, others will be downloaded a single time, and some of them are created by CCAO employees. 

## Step 2 Transformation in etl/scripts-ccao-data-warehouse-us-east-1

Raw data includes unwanted variables, column names that don't align with our coding
techniques, or data outside of Cook County / IL. implement this cleaning in Python so that it can be
run through DBT / Github actions. Upon completion of data cleaning, make sure that data is uploaded in 
Parquet format to the correct S3 bucket.

## Step 3 - Run Crawler for ingest into AWS Athena.
Once final data has been uploaded to the correct S3 bucket, it needs to be manually transfered
to AWS Athena via the crawler. Simply follow the link to the correct bucket, and click Run crawler in the upper right. 

## Step 4 - Documentation

Because data is mantained through DBT, there are definitions / references which need to be updated with the 
new feature. These can be found in dbt/models/.../schema.yml, dbt/models/shared_columns.md, dbt/models/.../docs.md.

## Step 5 - Include in Model Pipeline

The final step is to include the feature in the model pipeline. To do this, include the new feature in the files vw_pin_condo_input.sql, vw_res_card_input.sql, and vw_shared_input.sql files in the dbt/models/model/ folder. 


# Structure 2 - Creating a feature using SQL and existing DBT macros

Over time, CCAO has developed a series of macro functions which implement standardized standardized
transformations. These use existing resources in AWS to create new features, often involving spatial
joins.

## Step 1 - Create a sql query in dbt/models
Taking existing data from one of the CCAO's AWS buckets, create a SQL query that utilizes one of the


## Step 2 - Update documentation

In the same dbt/models/... folder, there are column.md and docs.md files which need to be updated with


## Step 3 - Include in the model pipeline

The final step is to include the feature in the model pipeline. To do this, include the new feature in the files vw_pin_condo_input.sql, vw_res_card_input.sql, and vw_shared_input.sql files in the dbt/models/model/ folder. 

# Final Step - An optional horray

Test the impact of the feature by running the model via the following instructions. 

