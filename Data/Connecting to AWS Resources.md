The Data Department utilizes AWS to store raw data within a lake, as well as the products of various ETLs within a warehouse. The department's AWS services can be easily accessed a number of ways. To get connected, follow the instructions below:

***

### R

- Install and setup [AWS CLI and MFA](Data/Setting Up AWS Command Line Interface and Multi-factor Authentication)
- Install [Athena ODBC driver](https://docs.aws.amazon.com/athena/latest/ug/connect-with-odbc.html)
- Install Python - [Anaconda](https://www.anaconda.com/products/individual) is recommended. During installation on Windows, make sure to add python to PATH
- Run `usethis::edit_r_environ()` in R, and add a variable named `S3_STAGING_DIR`
- Message @SweatyHandshake or @dfsnow for the name of the bucket
- Set the value for `AWS_BUCKET`, save the updated file, and restart the R session

```r
# load necessary packages
library(noctua)
library(DBI)

# establish connection
con <- dbConnect(noctua::athena(),
                 s3_staging_dir = Sys.getenv("S3_STAGING_DIR"),
                 aws_session_token = readline(prompt = "one time use MFA token: ")
)

# test the connection replacing the X's with a known table
dbGetQuery(conn = con, "SELECT * FROM XXX.XXX LIMIT 10")
```

### Python

- Install and setup [AWS CLI and MFA](Data/Setting Up AWS Command Line Interface and Multi-factor Authentication)
- Install boto3 - run `conda install -c anaconda boto3` from terminal after Anaconda is installed

```python
# load necessary packages
import boto3

# establish connection
s3 = boto3.resource(
    service_name='s3',
    region_name='us-east-1',
    aws_session_token=input("one time use MFA token: ")
    )
  
# test connection
for bucket in s3.buckets.all():
    print(bucket.name)
    
# or, depending on your needs
s3 = boto3.client(
    service_name='s3',
    region_name='us-east-1',
    aws_session_token=input("one time use MFA token: ")
    )
```

### Tableau

- Install the [JDBC Driver with AWS SDK](https://docs.aws.amazon.com/athena/latest/ug/connect-with-jdbc.html) - move the downloaded .jar file to `C:\Program Files\Tableau\Drivers` on Windows
- Open Tableau and on the "Connect" sidebar under "To a Server", navigate to "Amazon Athena"
- Message @SweatyHandshake or @dfsnow for the necessary server info and credentials. Tableau will not save the `Secret Access Key` field
