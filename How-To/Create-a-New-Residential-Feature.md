1. Context: 

The Cook County Assessor's Office uses a series of features to predict assessed values for Cook County Properties. Many of these features are created by staff members, either by modifying data that the Assessor's office already posesses (i.e. location to different types of parcels) or data which has to be queried from other sources (i.e. distance to OpenStreetMap roads). This guide provides a template for each step of this process, from upload to running the model with new features. Model creation will happen in the `data_architecture` repository, and any changes to the model pipeline will occur in the `model_res_avm` repository.
---
2. Extract and load raw data
    * Data extraction scripts can be created in R or Python in the `etl/scripts-ccao-data-raw-us-east-1/` folder.
    * Within the script, activate the AWS environment through the python code of 
    ```
    AWS_S3_RAW_BUCKET = os.getenv("AWS_S3_RAW_BUCKET")[5:]  # type: ignore
    ```
    or the R code of 
    ```
    AWS_S3_RAW_BUCKET <- Sys.getenv("AWS_S3_RAW_BUCKET")
    ```
    This will allow you to access AWS to upload the file at the end of the script.

    * Query and download the data. This can be done through a few methods, such as scraping a webpage, utilizing an API, or downloading a file. Be aware of the fact that data can be downloaded at different rates. 

    * For raw data, you should not significantly modify the file unless it is very large. This entails keeping all columns which could be considered relevant at a future date, or keeping column names in their raw identity.

    * Choose the output location based on the transformation strategy in step 2: The script should push data to `ccao-data-warehouse-us-east-1` if transforming the data using a dbt model, or `ccao-data-raw-us-east-1` if transforming the data using a Python/R script. You can use a modification of the following script to upload the data to S3 in python
    ```
    key_prefix = os.path.join("housing", "ari")

    data = download_excel(file_url)

    result = upload_to_s3(data, AWS_S3_RAW_BUCKET, key_prefix, file_name)
    ```
    or in R
    ```
    remote_file <- file.path(output_bucket, paste0("ihs_price_index_data.parquet"))
    arrow::write_parquet(remote_file)
    ```
    * If you export the data to `ccao-data-warehouse-us-east-1`, for use in a SQL / DBT model, make sure that the data is written as a parquet file. If it is written to `ccao-data-raw-us-east-1`, it can be in either parquet or csv. 

    * Some features use existing CCAO data, in which case, you do not need to write a new extraction script.
---
2. Transform the raw data

    * Option 1: [Add a model to the dbt DAG](https://github.com/ccao-data/data-architecture/blob/master/dbt/README.md#-how-to-add-a-new-model) to transform the data: This is a good option for simple transformations which can be written using a SQL query, or as a Python script using Athena PySpark's [built-in third-party packages](https://docs.aws.amazon.com/athena/latest/ug/notebooks-spark-preinstalled-python-libraries.html)
        * A list of commonly used queries exist in [dbt-macros](https://github.com/ccao-data/data-architecture/tree/master/dbt/macros). The most common function are spatial transformations, identifying nearby features.
        * This requires that the raw data you pushed in step 1 live in the `ccao-data-warehouse-us-east-1`, be [crawled by Glue](https://us-east-1.console.aws.amazon.com/glue/home?region=us-east-1#/v2/data-catalog/crawlers), and be configured as a [source](https://docs.getdbt.com/docs/build/sources) in a dbt `schema.yml` file.
        * Create the table using the DBT build 
    * Option 2: Add a Python/R script to `etl/scripts-ccao-data-warehouse-us-east-1/`
        * This is a good option if your transformation is complex enough to require a Python or R script using third-party packages beyond what is built-in to Athena PySpark.
        * This requires that the raw data you pushed in step 1 live in the `ccao-data-raw-us-east-1` bucket.
        * Moving forward, the data department will try to use Python scripts for this step, so that they can be configured with DBT actions.
        * If you choose this option, you'll need to upload your file as a parquet, configure your output table as a [source](https://docs.getdbt.com/docs/build/sources) in a dbt `schema.yml` file, and set up a Glue crawler for it.
    * Overarching guidelines
        * Make sure that outputs are parquet files, and are partitioned by year. A commonly used code chunk for this is:
        * For smaller datasets which we expect to stay consistent over time, you can update a .csv file as a [seed](https://github.com/ccao-data/data-architecture/tree/master/dbt/seeds). This ensures that data is consistently referenced. 
---
3. Incorporate the transformed data into the model input views
    * The views in question include `vw_pin_condo_input`, `vw_res_card_input`, and `vw_shared_input`; choose the correct view depending on whether the feature should be available to the condo model, the res model, or both, and update the view definition in the appropriate dbt model to join to the transformation table you created in step 2. 
    * If the attribute is spatial, you should also update `crosswalk_year_fill.sql` and `proximity.vw_pin10_proximity_fill.sql` / `location.vw_pin10_location_fill.sql`. 
        * Processes for forward and backward filling are largely conceptual, where if we think that the data is time invariant, we can forward fill the data. If we believe that the data has historically been the same, we can backwards fill the data. 
---
4. Update each model to use the new versions of the model input views
    * For each model:
        1. Rerun the [model ingest steps](https://github.com/ccao-data/model-res-avm?tab=readme-ov-file#usage) to pull from the new versions of the input views. You can do that with the following code. To do this, make sure that you unfreeze the relevant stages with
        `dvc unfreeze {stage}`.
        3. Update the `predictor` attribute in `params.yml` to add the new columns as predictors
        4. To test the impact, you can run the full model with the following:
        ```
        dvc repro -f
        ```
        5. If you want this information to be shared, you can push the updated model data to DVC using the following code. If you do this, make sure that the param for run_type is "test".
        ```
        dvc commit
        dvc push
        ``` 
---
5. Troubleshooting
    * Some staff types do not have permission to write to AWS Buckets. If your query returns `Access Denied`, ask Senior Staff to run the query for you.
    * Make sure that you are connected to aws through `aws-mfa` and typing in the correct credentials.
