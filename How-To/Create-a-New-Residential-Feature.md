# Context:

The Cook County Assessor's Office creates new features which are used predict assessed values for Cook County properties. Many of these are created by staff members, either by modifying data that the Assessor's office already possesses (i.e. location to different types of parcels) or data which has to be queried from other sources (i.e. distance to OpenStreetMap roads). This guide provides a template for each step of this process; downloading the raw data, transforming it to a usable structure, incorporating it in the model, and running an updated model version. Feature creation occurs in the `data_architecture` repository, and any changes to the model pipeline occurs in the `model_res_avm` repository.

------------------------------------------------------------------------

## Step 1: Extract and Load the Raw Data

Data extraction scripts can be created in R or Python in the `etl/scripts-ccao-data-raw-us-east-1/` folder. Within the script, activate the AWS environment. For this, you will need the following python packages:

```         
import os
import boto3
from dotenv import load_dotenv
```

or the following R packages:

```         
library(arrow)
library(aws.s3)
```

These will allow you to connect with AWS and upload the file at the end of the script. Once activating the correct packages, you need to set the AWS environment. You can do that with the following Python code, in this case, setting the output bucket to RAW, the eventual file location.

```         
AWS_S3_RAW_BUCKET = os.environ.get("AWS_S3_RAW_BUCKET")
```

or R the code:

```         
AWS_S3_RAW_BUCKET <- Sys.getenv("AWS_S3_RAW_BUCKET")
```

Once the AWS environment has been activated, you can extract the necessary data. This can be done through a few methods, such as scraping a webpage, utilizing an API, or downloading a file. Be aware that data CCAO may need to update data at different rates. For data such as the [Central Business District](https://github.com/ccao-data/data-architecture/blob/master/etl/scripts-ccao-data-raw-us-east-1/spatial/spatial-economy.R), where the geographies are set in stone, the script can reference a single file. On the other hand, [Secondary Streets](https://github.com/ccao-data/data-architecture/blob/master/etl/scripts-ccao-data-raw-us-east-1/spatial/spatial-environment-secondary_road.R) is structured to download new data every year using a looped function. When downloading data at this stage, you should not significantly modify the file unless the output is very large.

Choose the output location based on the transformation strategy in `Step 2`: The script should push data to `ccao-data-warehouse-us-east-1` if you plan on using a dbt model, or `ccao-data-raw-us-east-1` if it will use a Python script. You can use a modification of the following script to upload the data to S3 in python. Note how it joins the aforementioned AWS_S3_RAW_BUCKET, as well as identifying the correct sub-bucket, in this case `housing`, before creating the unique file `dci`.

```         
def upload_to_s3(file_content, bucket, key_prefix, file_name):
    try:
        s3 = boto3.resource("s3")
        object_key = f"{key_prefix}/{file_name}"
        s3.Bucket(bucket).put_object(Key=object_key, Body=file_content)
        return f"File uploaded to {bucket}/{object_key}"
        file_name = os.path.join("housing", "dci", "dci.csv") 
        upload_df_to_s3(df, AWS_S3_RAW_BUCKET, file_name)
```

If you export the data to `ccao-data-warehouse-us-east-1`, for use in an SQL / DBT model, make sure that the data is written as a parquet file. If it is written to `ccao-data-raw-us-east-1`, it can be either parquet or csv. Some features use existing CCAO data, in which case, you do not need to write a new extraction script.

Now that the view has been built, crawl the output with [Glue](https://us-east-1.console.aws.amazon.com/glue/home?region=us-east-1#/v2/data-catalog/crawlers) by navigating to the correct bucket, and then selecting `Run Crawler` in the upper right.

## Using a Seed to Create the Raw Data

For data that is `very` consistent over time, we can upload the file as a [seed](https://github.com/ccao-data/data-architecture/tree/master/dbt/seeds). These are manually created as a .csv file. Once your file is within your local directory, construct it in the DBT architecture with the terminal command `dbt seed`. Some directories do not have seeds yet, so DBT will not recognize that a new file has been created. If this is the case, modify `dbt/dbt_project.yml` to add the correct schema. You will also need to update the `schema.yml` and `docs.md` files in the directory.

Since a seed is an existing component of the DBT project, references to it will be different than when querying a table outside of the structure (AWS tables). For example, use

```         
FROM {{ ref('spatial.stadium_raw') }} AS stadium
```

rather than

```         
FROM {{ source('spatial', 'parcel') }} AS parcel
```

## Step 2: Transform the Raw Data.

### Option A: [Add a model to the dbt DAG](https://github.com/ccao-data/data-architecture/blob/master/dbt/README.md#-how-to-add-a-new-model) to transform the data:

This is a good option for simple transformations which can be written using a SQL query, or as a Python script using Athena PySpark's [built-in third-party packages](https://docs.aws.amazon.com/athena/latest/ug/notebooks-spark-preinstalled-python-libraries.html) A list of commonly used queries exist in [dbt-macros](https://github.com/ccao-data/data-architecture/tree/master/dbt/macros). The most commonly used macros involve spatial transformations, such as identifying the distance to nearest geography of a particular type (i.e. university).

Macros require a specific structure to be utililized correctly. For example, the `dist_to_nearest_geometry.sql` requires a value for `pin`, `year`, `x_3435`, and `y_3435`. These also need to be structured in accordance with specific data types. In this case, if geographies are classified as a string, you will run into the following error.

```         
Runtime Error in model spatial.spatial_stadium (models/spatial/spatial.spatial_stadium.sql) line 9:5: Unknown type: STRING
```

To remedy this, you can recast the geometry value as a binary points.

```         
ST_ASBINARY(ST_POINT(stadium.lon, stadium.lat)) AS geometry
```

When beginning the script, make sure that the parquet outputs are partitioned by year. For SQL queries these are done with the following structure:

```         
{{config(         
materialized='table',        
partitioned_by=['year'],         
bucketed_by=['pin10'],         
bucket_count=1)}
```

When configuring the table, the partition column needs to be the final column or you will receive the following error:

```         
HIVE_COLUMN_ORDER_MISMATCH: Partition keys must be the last columns in the table and in the same order as the table properties: 
```

Upon completion of the query, you can run a modified version of the following in your terminal, constructing the output in your development database of `AWS Athena`.

```         
dbt build --select proximity.dist_pin_to_stadium
```

Finally, complete the documentation by configuring it as a [source](https://docs.getdbt.com/docs/build/sources) in a dbt `schema.yml` file, and update the relevant `docs.md` and `columns.md` files.

### Option B: Add a Python/R script to `etl/scripts-ccao-data-warehouse-us-east-1/`.

Some scripts are going to be too complicated for the typical SQL queries. For this, we use a Python or R script using third-party packages beyond what is built-in to Athena PySpark.

This requires accessing the raw data you pushed in step 1 live in the `ccao-data-raw-us-east-1` bucket. Just as with the the `raw` script, you need to activate the AWS environment, but this time, set one to `ccao-data-raw-us-east-1` and the other set to `ccao-data-warehouse-us-east-1`. This will ensure that you can download from the raw bucket, and export to the warehouse bucket.

Moving forward, the data department has veered towards the use of Python scripts for data transformation, so that they can be configured with DBT actions. This means that although there are scripts in R, new scripts should be produced in Python. If you choose this option, you will need to upload your file as a parquet. Finally, complete the documentation by configuring it as a [source](https://docs.getdbt.com/docs/build/sources) in a dbt `schema.yml` file, and update the relevant `docs.md` and `columns.md` files.

## Step 3: Incorporate the Transformed Data into the Model Input Views.

Now that the relevant views have been created, they need to be incorporated in the model. To do this, identify if the new variable is relevant in the condo and/or the residential model. Then, in `dbt/models/model`, update the relevant `vw_pin_condo_input`, `vw_res_card_input`, and `vw_shared_input` view. Within the `model` directory, update the definitions in the appropriate dbt model to join to the transformation table you created in step 2.

If the attribute is spatial, you should also update `crosswalk_year_fill.sql`, `proximity.vw_pin10_proximity_fill.sql`, and `location.vw_pin10_location_fill.sql`. Processes for forward and backward filling are largely conceptual. If we think that the data is time invariant, we can forward fill the data. If we believe that the data has historically been the same, we can backwards fill the data.

------------------------------------------------------------------------

## Step 4: Update each Model to use the New Versions of the Model Input Views

Rerun the [model ingest steps](https://github.com/ccao-data/model-res-avm?tab=readme-ov-file#usage) to pull from the new versions of the input views. Make sure that you unfreeze the desired `stage(s)` with `dvc unfreeze {stage}`. Update the `predictor` attribute in `params.yml` to add the new columns as predictors. To test the impact, you can run the full model with the following:

```         
dvc repro -f
```

If you want this information to be shared, you can push the updated model data to DVC using the following code. If you do this, make sure that the param for run_type is `test`.

```         
dvc commit dvc push 
```

------------------------------------------------------------------------

## Step 5. Troubleshooting

-   Some staff types do not have permission to write to AWS Buckets. If your export of data to `aws` returns `Access Denied`, ask senior staff to run the query for you. This is most likely to occur during `step 1`.
-   Make sure that you are connected to aws by running `aws-mfa` in the terminal and typing in the correct credentials.
-   Whenever an active pull request is open, committing your file build all modified views. If a file is not constructed, you will receive an error message. In the following, the sql query is identifying that cyf, a reference to crosswalk_year_fill not being properly built, a prerequisite for building `vw_pin10_proximity_fill.sql`.

```         
line 176:9: Column 'cyf.nearest_stadium_data_year' cannot be resolved
```

-   Docs also need to be properly referenced. If a file cannot be properly identified, you will receive an error like this:

```         
Documentation for 'model.ccao_data_athena.proximity.vw_pin10_proximity_fill' depends on doc 'column_nearest_new_construction_char_yrblt'  which was not found
```
