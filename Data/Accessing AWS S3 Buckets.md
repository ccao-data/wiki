The Data Department utilizes AWS to store raw data within a lake, as well as the products of various ETLs within a warehouse. The department's S3 buckets can be easily accessed through Athena in R using the package "noctua". To get connected, follow the instructions below:

### 1. Installations

- [Athena ODBC driver](https://docs.aws.amazon.com/athena/latest/ug/connect-with-odbc.html)
- [AWS command line interface](https://aws.amazon.com/cli/), which allows users to store credentials needed to query S3 buckets with Athena
- Python - [Anaconda](https://www.anaconda.com/products/individual) is recommended. During installation on Windows, make sure to add python to PATH.

### 2. Set up multi-factor authentication in AWS

- Log into [AWS](https://ccao-ds.signin.aws.amazon.com/console) and under your account select "My Security Credentials". Enable multi-factor authentication, and then create an access key. You'll need both the `access key ID`, the `secret access key`, and the name of the `assigned MFA device`. Do not include ` (Virtual)` when copying the name of the MFA device.

### 3. Set up 'aws-mfa'

- In the command line:
  - Run `aws configure` and enter your `access key ID`, `secret access key`, region (`us-east-1`), and `json` for output.
  - Run `pip install aws-mfa`
- Open your credentials file located at `~/.aws/credentials` on Linux or macOS, or at `C:\Users\USERNAME\.aws\credentials` on Windows and rename `[default]` to `[default-long-term]`.
- Underneath `aws_secret_access_key` type `aws_mfa_device = assigned MFA device` where `assigned MFA device` is the `name of your assigned MFA device`, and save.
- In the command line, run `aws-mfa` and enter the current MFA token provided by your `assigned MFA device`.
- Note, this command will only store MFA credentials for 12 hours (unless the duration is explicitly changed when running `aws-mfa`).

### 4. Create a .environ variable for the the data team's S3 bucket name

- Run `usethis::edit_r_environ()` in R, and add a variable named `AWS_BUCKET`.
- Message @SweatyHandshake or @dfsnow for the name of the bucket.
- Set the value for `AWS_BUCKET`, save the updated file, and restart the R session.

### 5. Connect to Athena

```r
# Load necessary packages
library(noctua)
library(DBI)

# Establish connection
con <- dbConnect(noctua::athena(),
                 s3_staging_dir = Sys.getenv("AWS_BUCKET"),
                 aws_session_token = readline(prompt = "one time use MFA token: ")
                 )

# Test the connection
dbGetQuery(conn = con, "SELECT * FROM dev_poc_ccao_archive.archive_aasysjur LIMIT 10")
```

Most of this README originates from these sources:

- https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html
- https://github.com/broamski/aws-mfa