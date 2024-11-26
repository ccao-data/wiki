The Data Department utilizes AWS for data storage (S3), data cleaning (Glue), and querying (Athena). To connect to these services, follow the instructions below:

---

## S3

1. Install and setup the [AWS CLI and aws-mfa](/How-To/Setup-the-AWS-Command-Line-Interface-and-Multi-factor-Authentication.md)
2. Authenticate with `aws-mfa` via the command line
3. That's it, calls to S3 should work automatically
    - You can use the `aws.s3` library in R or `boto3` in Python to upload, download, and manipulate S3 objects
    - Certain packages, such as `arrow`, can also read from S3 directly (for example `read_parquet("s3://bucket-name/object")`

#### R Example

```r
# Load necessary libraries
library(aws.s3)

# Test connection
aws.s3::bucket_list_df()

# Save object
aws.s3::save_object("s3://bucket-name/object", file = "filename")
```

#### Python Example

```python
# Load necessary packages
import boto3

# Establish connection
s3 = boto3.resource(
    service_name='s3',
    region_name='us-east-1'
    )

# Test connection
for bucket in s3.buckets.all():
    print(bucket.name)

# Or, depending on your needs
s3 = boto3.client(
    service_name='s3',
    region_name='us-east-1',
    )
```

## Athena

### R

You can use the `noctua` R package to pull data from Athena. `noctua` has two useful options for speeding up queries: [caching](https://dyfanjones.github.io/noctua/articles/aws_athena_query_caching.html) and [unload](https://dyfanjones.github.io/noctua/articles/aws_athena_unload.html).

- Caching allows you to re-use locally-stored query results rather than constantly re-pulling from AWS. It is useful for situations like rendering a Quarto document, where you need to re-run the whole file but may not want to re-pull data.
- The `unload = TRUE` option uses a different method of storing and transferring query results. It tends to be a bit faster on our hardware, and thus we recommend using it by default. NOTE: The `unload` option only works correctly on `noctua>=2.6.3`.

To setup and use `noctua` in an R project:

1. Install and setup the [AWS CLI and aws-mfa](/How-To/Setup-the-AWS-Command-Line-Interface-and-Multi‐factor-Authentication.md)
2. Authenticate with `aws-mfa` via the command line
3. In your root-level `.Renviron` file, add the environmental variables below. Message @SweatyHandshake or @dfsnow for the name of the Athena results bucket. Save the file and restart your R session
    ```
    AWS_REGION=us-east-1
    AWS_ATHENA_S3_STAGING_DIR=$RESULTS_BUCKET
    ```
4. Run the following code to instantiate your connection and run a test query

    ```r
    # Load necessary libraries
    library(DBI)
    library(noctua)

    # Optionally enable query caching and unload
    noctua_options(cache_size = 10, unload = TRUE)

    # Establish connection
    AWS_ATHENA_CONN_NOCTUA <- dbConnect(
      noctua::athena(),
      # Disable the Connections tab entry for this database. Always use this if
      # you don't want to browser the tables in the Connections tab, since it
      # speeds up instantiating the connection significantly
      rstudio_conn_tab = FALSE
    )

    # Test the connection
    dbGetQuery(
      conn = AWS_ATHENA_CONN_NOCTUA,
      "SELECT year, geoid FROM census.acs5 LIMIT 10"
    )
    ```
If the connection to Athena is successful but [your test query returns zero rows](https://github.com/DyfanJones/noctua/pull/215), you may need to install the development version of `noctua`:

```
remotes::install_github("dyfanjones/noctua")
```

### Python

Using python, the `pyathena` package is an excellent option for ingesting data from AWS Athena.

As with R, enabling [unload](https://laughingman7743.github.io/PyAthena/pandas.html#pandascursor) via `cursor(unload=TRUE)` uses a different method of storing and transferring query results. It tends to be a bit faster on our hardware, and thus we recommend using it by default.

1. Install and setup the [AWS CLI and aws-mfa](/How-To/Setup-the-AWS-Command-Line-Interface-and-Multi‐factor-Authentication.md)
2. Authenticate with `aws-mfa` via the command line
3. Install the `pyathena` package into your python environment using `pip install PyAthena`
4. Add the following environment variables to your environment
    - Every time we ingest data from Athena, the data has to be created as a file and stored somewhere before it arrives in our coding environment. The `$ATHENA_RESULTS_BUCKET` is our designated bucket for these intermediate files, which in this example is meant to be replaced with our actual bucket name.
    ```
    AWS_ATHENA_S3_STAGING_DIR=$ATHENA_RESULTS_BUCKET
    AWS_REGION=us-east-1
    ```
5. Run the following code to instantiate your connection and run test query

    ```python
    # Load necessary libraries
    import os
    import pandas
    import pyarrow
    from pyathena import connect
    from pyathena.pandas.util import as_pandas
    from pyathena.pandas.cursor import PandasCursor

    # Connect to Athena
    cursor = connect(
        # We add '+ "/"' to the end of the line below because enabling unload
        # requires that the staging directory end with a slash
        s3_staging_dir=os.getenv("AWS_ATHENA_S3_STAGING_DIR") + "/",
        region_name=os.getenv("AWS_REGION"),
        cursor_class=PandasCursor,
    ).cursor(unload=True)

    # Define test query. Note that the query CANNOT end with a semi-colon
    SQL_QUERY = "SELECT * from default.vw_pin_sale LIMIT 10"

    # Execute query and return as pandas df
    cursor.execute(SQL_QUERY)

    df = cursor.as_pandas()
    ```

### Tableau

You will likely need to work with IT admins for permissions to do the following.

1. Install [Tableau Desktop version 2022.1](https://www.tableau.com/support/releases/desktop/2022.1.23) if you plan to publish a file to the CCAO's Tableau Server. The version of Tableau Desktop [cannot be more recent](https://help.tableau.com/current/desktopdeploy/en-us/desktop_deploy_version_compat_top.htm) than the version of Tableau Server.
2. Install the [JDBC 2.x Driver with AWS SDK](https://docs.aws.amazon.com/athena/latest/ug/jdbc-v2.html). Then move the downloaded .jar file to `C:\Program Files\Tableau\Drivers` on Windows or `~/Library/Tableau/Drivers` on Mac.
3. Make sure [Java SE Development Kit](https://www.oracle.com/java/technologies/downloads/) is installed.
4. Create a file called `athena.properties` in `C:\Users\$USER\Documents\My Tableau Repository\Datasources` on Windows or `~/Users/$USER/Documents/My Tableau Repository/Datasources` on Mac with the following lines:
    ```
    workgroup=read-only-with-scan-limit
    MetadataRetrievalMethod=ProxyAPI
    ```
3. Open Tableau and on the `Connect` sidebar under `To a Server`, navigate to `Amazon Athena`.
4. Message a [core team](https://github.com/orgs/ccao-data/teams/core-team) member for the necessary server info and credentials. Tableau will not save the `Secret Access Key` field.

### Troubleshooting

As documented [here](https://github.com/DyfanJones/noctua/issues/96), when making an Athena query, `noctua` tries to keep the S3 results bucket tidy. It does this by trying to delete the Athena query output from S3. If the query initiator doesn't have permission to do this, it returns the following warning:

`Info: (Data scanned: 625.16 GB)  additional arguments ignored in warning()  Warning: AccessDenied (HTTP 403). Access Denied`

For the most part, this error message does not affect the query. However, it can cause operations such as knitting to fail. To remedy this, you disable the deletion behavior using `noctua` caching. Inside of R, use:

 ```
 noctua_options(cache_size = 10)
 ```
