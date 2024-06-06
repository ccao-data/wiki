
1. Extract and load raw data
    * Do this by adding a raw data extraction script to `etl/scripts-ccao-data-raw-us-east-1/` using Python or R
    * Choose the output location based on the transformation strategy in step 2: The script should push data to `ccao-data-warehouse-us-east-1` if transforming the data using a dbt model, or `ccao-data-raw-us-east-1` if transforming the data using a Python/R script
2. Transform the raw data
    * Option 1: [Add a model to the dbt DAG](https://github.com/ccao-data/data-architecture/blob/master/dbt/README.md#-how-to-add-a-new-model) to transform the data
        * This requires that the raw data you pushed in step 1 live in the `ccao-data-warehouse-us-east-1` bucket, be crawled by Glue, and be configured as a [source](https://docs.getdbt.com/docs/build/sources) in a dbt `schema.yml` file
        * This is a good option if your transformation is simple enough to be written as a SQL query, or as a Python script using Athena PySpark's [built-in third-party packages](https://docs.aws.amazon.com/athena/latest/ug/notebooks-spark-preinstalled-python-libraries.html)
    * Option 2: Add a Python/R script to `etl/scripts-ccao-data-warehouse-us-east-1/`
        * This requires that the raw data you pushed in step 1 live in the `ccao-data-raw-us-east-1` bucket
        * This is a good option if your transformation is complex enough to require a Python or R script using third-party packages beyond what is built-in to Athena PySpark
        * If you choose this option, you'll need to configure your output table as a [source](https://docs.getdbt.com/docs/build/sources) in a dbt `schema.yml` file and set up a Glue crawler for it
3. Incorporate the transformed data into the model input views
    * The views in question include `vw_pin_condo_input`, `vw_res_card_input`, and `vw_shared_input`; choose the correct view depending on whether the feature should be available to the condo model, the res model, or both, and update the view definition in the appropriate dbt model to join to the transformation table you created in step 2
4. Update each model to use the new versions of the model input views
    * For each model:
        1. Rerun the model ingest steps to pull from the new versions of the input views
        2. Push the updated model input data to DVC
        3. Update the `predictor` attribute in `params.yml` to add the new columns as predictors 
