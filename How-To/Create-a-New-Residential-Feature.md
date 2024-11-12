# How to Add a New Feature to the Residential Model

The Cook County Assessor's Office manages features which are used predict assessed values for Cook County properties. Many of these are created by staff members, either by modifying data that the Assessor's office already possesses (e.g. location to different types of parcels) or data which has to be queried from other sources (i.e. distance to OpenStreetMap roads). This guide provides a template for each step of this process: downloading the raw data, transforming it into a usable structure, creating the view which will be referenced by the model, incorporating it in the model view, and running an updated model.

It is important to note that for many features, not all of these steps will be needed. For example, some data will come in a clean format, and thus will not need a raw file stored in `etl/scripts-ccao-data-raw-us-east-1/`, or data may come from internal sources, requiring no extraction at all. All feature creation occurs in the [`data-architecture`](https://github.com/ccao-data/data-architecture) repository, and any changes to the model pipeline occurs in the [model-res-avm](https://github.com/ccao-data/model-res-avm/) repository.

------------------------------------------------------------------------

## Step 1: Extract and Load the Raw Data

### Option A: Use a Python or R Script in the [etl Directory](https://github.com/ccao-data/data-architecture/tree/master/etl)

Data extraction scripts are typically created in R or Python in the `etl/scripts-ccao-data-raw-us-east-1/` folder. In the circumstance that the file requires no cleaning afterwards, they can be placed directly in the `scripts-ccao-data-warehouse-us-east-1` folder. Data sources often contain information which is relevant for institutional knowledge, but are not useful for modeling. Keeping data in its raw form provides redundancy in case there are complications from the data transformation or the data source changes over time.

-   Identify which folder the script should go in. Although folders are often self-explanatory, the location may switch throughout the feature creation process. For example, `spatial/spatial-environment-secondary_road.R` is created as a `spatial` feature, but during the transformation step (`proximity.dist_pin_to_secondary_roads.sql)`, it shifts to the `proximity` folder since the metric (distance) is in relation to PINs.

-   Load the required imports for Python or libraries for R.

``` python
import os
import boto3
from dotenv import load_dotenv
```

``` r
library(arrow)
library(aws.s3)
```

-   Set the `AWS_S3_RAW_BUCKET` environment variable to an S3 bucket where output files will be stored:

``` python
AWS_S3_RAW_BUCKET = os.environ.get("AWS_S3_RAW_BUCKET")
```

``` r
AWS_S3_RAW_BUCKET <- Sys.getenv("AWS_S3_RAW_BUCKET")
```

-   Extract the necessary data. This can be done through a few methods: scraping a webpage, utilizing an API, or downloading a file. Be aware that we may need to extract data at different time intervals. For data such as the [Central Business District](https://github.com/ccao-data/data-architecture/blob/master/etl/scripts-ccao-data-raw-us-east-1/spatial/spatial-economy.R), where the geographies are set in stone, the script can reference a geography in a single year. On the other hand, [Secondary Streets](https://github.com/ccao-data/data-architecture/blob/master/etl/scripts-ccao-data-raw-us-east-1/spatial/spatial-environment-secondary_road.R) is structured to download a different set of geographies for every year.

-   Choose the output location based on your transformation strategy. If the file is already clean, and a SQL query can be easily implemented on it, the script should be stored in `ccao-data-warehouse-us-east-1`. If the file needs additional cleaning, place it in `ccao-data-raw-us-east-1`. Use a modification of the following script to upload the data to S3 in python. Note how it joins the aforementioned `AWS_S3_RAW_BUCKET`, as well as identifying the correct prefix, in this case `/housing`, before creating the unique folder `dci`.

``` python
def upload_to_s3(file_content, bucket, key_prefix, file_name):
    s3 = boto3.resource("s3")
    object_key = f"{key_prefix}/{file_name}"
    s3.Bucket(bucket).put_object(Key=object_key, Body=file_content)
    return f"File uploaded to {bucket}/{object_key}"

upload_to_s3(df, AWS_S3_RAW_BUCKET, "housing/dci", "dci.csv")
```

-   If you export the data to `ccao-data-warehouse-us-east-1` for direct use in a dbt model, make sure that the data is written as a parquet file. If it is written to `ccao-data-raw-us-east-1`, it can be either parquet or csv.
-   Now that the file has been built, crawl the output with [Glue](https://us-east-1.console.aws.amazon.com/glue/home?region=us-east-1#/v2/data-catalog/crawlers) by navigating to the crawler that is configured to crawl your bucket and then selecting `Run Crawler` in the upper right.

### Option B: Use a Seed to Create the Data in [dbt/seeds](https://github.com/ccao-data/data-architecture/tree/master/dbt/seeds)

-   For data that is rarely changing and small enough to store in a CSV file, we can upload the file as a [seed](https://docs.getdbt.com/docs/build/seeds).
-   Construct this manually as a .csv file and upload it to the local `dbt/seeds/xxx` folder.
-   Once your file is within your local directory, test building it in your dev environment by running the command `dbt seed`.
-   Add an entry for your seed in the `schema.yml` file that lives in its sub directory, so that the dbt DAG knows about it. Some directories do not have seeds yet, in which case you should modify the `seeds` attribute in `dbt/dbt_project.yml` to add the correct schema for your seed and also add a `schema.yml` file to the new subdirectory under `dbt/seeds/`.
-   Since a seed is a part of the dbt DAG, refer to it with [`ref()`](https://docs.getdbt.com/reference/dbt-jinja-functions/ref) instead of [`source()`](https://docs.getdbt.com/reference/dbt-jinja-functions/source) in downstream models.

```         
FROM {{ ref('spatial.stadium_raw') }} AS stadium

## rather than

FROM {{ source('spatial', 'parcel') }} AS parcel
```

------------------------------------------------------------------------

## Step 2: Clean any Raw Data and Store it in [ccao-data-warehouse-us-east-1](https://github.com/ccao-data/data-architecture/tree/master/etl/scripts-ccao-data-warehouse-us-east-1)

Once we've extracted the raw data necessary to construct our feature, we can transform it into a format that is easier to work with.

This step is only necessary if A) some transformation is required in order to use the data and B) the transformation is too complex to accomplish using a dbt model, since otherwise we can just output raw data directly to `ccao-data-warehouse-us-east-1` and skip to step 3.

-   Just as with the the `raw` script, you need to define S3 bucket locations, but this time, set one bucket location variable to `ccao-data-raw-us-east-1` and another to `ccao-data-warehouse-us-east-1`. This will ensure that you can download from the raw bucket, and export to the warehouse bucket.

-   Clean the data, reducing the number of variables, constraining the geography to Cook County, abiding by snake_formatting, or sub-setting the data.

-   Moving forward, the data department is veering towards the use of Python scripts for data transformation so that they can be configured as [dbt Python models](https://docs.getdbt.com/docs/build/python-models). This means that although there are scripts in R, new scripts should be produced in Python.

-   Upload the cleaned version to `ccao-data-warehouse-us-east-1` as a parquet file, grouping the file by year.

------------------------------------------------------------------------

## Step 3: [Add a Model to the dbt DAG](https://github.com/ccao-data/data-architecture/blob/master/dbt/README.md#-how-to-add-a-new-model) to Transform the Data into a [Model View](https://github.com/ccao-data/data-architecture/tree/master/dbt/models).

-   Once data has been cleaned and is ready for processing, it can be can be turned into a dbt model using either a SQL query or a Python script that makes use of Athena PySpark's [built-in third-party packages](https://docs.aws.amazon.com/athena/latest/ug/notebooks-spark-preinstalled-python-libraries.html). Some commonly used SQL operations are defined for reuse as [macros](https://docs.getdbt.com/docs/build/jinja-macros) and are stored in [`dbt/macros`](https://github.com/ccao-data/data-architecture/tree/master/dbt/macros). The most commonly used macros involve spatial transformations, such as identifying the distance to nearest geography of a particular type (i.e. stadiums).
-   At the top of your script, make sure that the parquet outputs are partitioned by year. For SQL queries these are done with the following structure:

```         
{{
      config(          
        materialized='table',         
        partitioned_by=['year'],          
        bucketed_by=['pin10'],          
        bucket_count=1
      )
    }}
```

If the output does not have the partition column as the final column, you will receive the following error:

```         
HIVE_COLUMN_ORDER_MISMATCH: Partition keys must be the last columns in the table and in the same order as the table properties: 
```

-   Build out the transformation. To ensure consistency, use one of the macros whenever possible, each of which utilizes a specific coding structure. For example, the `dist_to_nearest_geometry.sql` requires a value for `pin`, `year`, `x_3435`, and `y_3435`. These also need to be structured in accordance with specific data types. In this case, if geographies are classified as a string, you will run into the following error.

```         
Runtime Error in model spatial.spatial_stadium (models/spatial/spatial.spatial_stadium.sql) line 9:5: Unknown type: STRING
```

To remedy this, you can recast the geometry value as a binary points.

```         
ST_ASBINARY(ST_POINT(stadium.lon, stadium.lat)) AS geometry
```

-   Once your model is defined correctly, run `dbt build` in your terminal to construct the output in your development database:

```         
dbt build --select proximity.dist_pin_to_stadium
```

-   Complete the documentation by configuring it as a [model](https://docs.getdbt.com/docs/build/models) in the folder's dbt `schema.yml` file, and update the folder's `docs.md` and `columns.md` files.

------------------------------------------------------------------------

## Step 4: Incorporate the Transformed Data into the [Final Model View](https://github.com/ccao-data/data-architecture/tree/master/dbt/models/model).

-   Now that the relevant view(s) have been created, they need to be incorporated in the model view.

-   Identify if the new feature is relevant in the condo and/or the residential model. Then, in `dbt/models/model`, update the relevant `vw_pin_condo_input`, `vw_res_card_input`, or `vw_shared_input` view.

-   If the attribute is spatial, you should also update `crosswalk_year_fill.sql`, `proximity.vw_pin10_proximity_fill.sql`, and `location.vw_pin10_location_fill.sql`. Make sure to fill in missing years of data: If certain years are missing from the data but we think that it did not change during that period, we can forward- or backward-fill it.

------------------------------------------------------------------------

## Step 5: Update the [Model Pipeline](https://github.com/ccao-data/model-res-avm/tree/master) to Use the New Versions of the Model Input Views

-   Create a new branch in the `model-res-avm` repository.

-   Add the new feature to the `predictor` section of `params.yaml`.

-   To test the impact, you can run the full model with the command

```         
dvc repro -f
```

-   If you want others to be able to reproduce your work, you can push the updated model data to DVC using the following commands. If you do this, make sure to set the `run_type` to `test` in `params.yaml`.

```         
dvc commit
dvc push 
```

------------------------------------------------------------------------

## Troubleshooting

-   Some staff members do not have permission to write to AWS buckets or run `dvc push`. If you run into an `Access Denied` error at any point, ask senior staff to run your code for you. This is most likely to occur during step 1 or step 5.
-   Make sure that you have authenticated to AWS using MFA by running `aws-mfa` in the terminal and typing in the correct credentials.
-   Whenever you commit to an open pull request against `data-architecture`, the `build-and-test-dbt` workflow will build all tables and views you have modified. If a table or view that the modified model depends on has not been built yet, you will receive an error message. In the following, the SQL query is identifying that `cyf`, a reference to the `proximity.crosswalk_year_fill` model, has not been built but is a prerequisite for building `vw_pin10_proximity_fill.sql`.

```         
line 176:9: Column 'cyf.nearest_stadium_data_year' cannot be resolved
```

-   Relevant docs also need to be properly constructed. If a [docs block](https://docs.getdbt.com/docs/build/documentation#using-docs-blocks) cannot be properly identified, you will receive an error like this.

```         
Documentation for 'model.ccao_data_athena.proximity.vw_pin10_proximity_fill' depends on doc 'column_nearest_new_construction_char_yrblt'  which was not found
```
