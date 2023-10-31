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

### R (Small Queries)

You can use the `noctua` R package to pull small amounts of data from Athena. This package uses the `paws` R package to directly grab query results, but it can be significantly slower and more memory-intensive than the JDBC connector. The benefit of `noctua` is that is can cache query results for faster reload of the same data. See [here](https://dyfanjones.github.io/noctua/articles/aws_athena_query_caching.html) for more details.

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

    # Optionally enable query caching
    noctua_options(cache_size = 10)

    # Establish connection
    AWS_ATHENA_CONN_NOCTUA <- dbConnect(noctua::athena())

    # Test the connection
    dbGetQuery(
      conn = AWS_ATHENA_CONN_NOCTUA,
      "SELECT year, geoid FROM census.acs5 LIMIT 10"
    )
    ```

### R (Large Queries)

Athena queries that pull a large amount of data are best handled by Amazon's JDBC driver.

1. Install and setup the [AWS CLI and aws-mfa](How-To/Setup-the-AWS-Command-Line-Interface-and-Multi‐factor-Authentication)
2. Authenticate with `aws-mfa` via the command line
3. Install the [JDBC Driver with AWS SDK](https://docs.aws.amazon.com/athena/latest/ug/connect-with-jdbc.html) - move the downloaded `.jar` file to `C:\Users\$USER\Documents\drivers` on Windows and `~/drivers` on Linux or macOS
4. In your root-level `.Renviron` file, add the environmental variables below. Message @SweatyHandshake or @dfsnow for the name of the Athena results bucket. Save the file and restart your R session
    ```
    AWS_REGION=us-east-1
    AWS_ATHENA_S3_STAGING_DIR=$RESULTS_BUCKET
    AWS_CREDENTIALS_PROVIDER_CLASS=com.simba.athena.amazonaws.auth.DefaultAWSCredentialsProviderChain
    AWS_ATHENA_JDBC_URL=jdbc:awsathena://athena.us-east-1.amazonaws.com:443
    ```
5. Run the following code to instantiate your connection and run a test query

    ```r
    # Preallocate java memory (necessary for large queries)
    options(java.parameters = "-Xmx10g")
    gc()

    # Load necessary libraries
    library(DBI)
    library(RJDBC)

    # Connect to the JDBC driver
    aws_athena_jdbc_driver <- RJDBC::JDBC(
      driverClass = "com.simba.athena.jdbc.Driver",
      classPath = list.files("~/drivers", "^Athena.*jar$", full.names = TRUE),
      identifier.quote = "'"
    )

    # Establish connection
    AWS_ATHENA_CONN_JDBC <- dbConnect(
      aws_athena_jdbc_driver,
      url = Sys.getenv("AWS_ATHENA_JDBC_URL"),
      aws_credentials_provider_class = Sys.getenv("AWS_CREDENTIALS_PROVIDER_CLASS"),
      Schema = "Default"
    )

    # Test connection
    dbGetQuery(
      conn = AWS_ATHENA_CONN_JDBC,
      "SELECT year, geoid FROM census.acs5 LIMIT 10"
    )
    ```
    
### Python
Using python, the `pyathena` package is an excellent option for ingesting data from AWS Athena.

1. Install and setup the [AWS CLI and aws-mfa](How-To/Setup-the-AWS-Command-Line-Interface-and-Multi‐factor-Authentication)
2. Authenticate with `aws-mfa` via the command line
3. Install the pyathena package into your python environment using `pip install PyAthena`
4. Add the following environment variables to your environment
    - Every time we ingest data from athena, the data has to be created as a file and stored somewhere before it arrives in our coding environment. The `$ATHENA_RESULTS_BUCKET` is our designated bucket for these intermediate files, which in this example is meant to be replaced with our actual bucket name.
    ```
    AWS_ATHENA_S3_STAGING_DIR=$ATHENA_RESULTS_BUCKET
    AWS_REGION=us-east-1
    ```
5. Run the following code to instantiate your connection and run test query
    
    ```python
    # Load necessary libraries
    import os
    import pandas
    from pyathena import connect
    from pyathena.pandas.util import as_pandas
    
    # Connect to Athena
    conn = connect(
        s3_staging_dir=os.getenv("AWS_ATHENA_S3_STAGING_DIR"),
        region_name=os.getenv("AWS_REGION"),
    )

    # Define test query
    SQL_QUERY = "SELECT * from default.vw_pin_sale LIMIT 10;"

    # Execute query and return as pandas df
    cursor = conn.cursor()
    cursor.execute(SQL_QUERY)
    
    df = as_pandas(cursor)
    ```


### Tableau

1. Install the [JDBC Driver with AWS SDK](https://docs.aws.amazon.com/athena/latest/ug/connect-with-jdbc.html) - move the downloaded .jar file to `C:\Program Files\Tableau\Drivers` on Windows or `~/Library/Tableau/Drivers` on Mac.
2. Make sure [Java SE Development Kit](https://www.oracle.com/java/technologies/downloads/) is installed.
3. Create a file called `athena.properties` in `C:\Users\$USER\Documents\My Tableau Repository\Datasources` on Windows or `~/Users/$USER/Documents/My Tableau Repository/Datasources` on Mac with the following lines:
    ```
    workgroup=read-only-with-scan-limit
    MetadataRetrievalMethod=ProxyAPI
    ```
3. Open Tableau and on the `Connect` sidebar under `To a Server`, navigate to `Amazon Athena`.
4. Message a [core team](https://github.com/orgs/ccao-data/teams/core-team) member for the necessary server info and credentials. Tableau will not save the `Secret Access Key` field.
