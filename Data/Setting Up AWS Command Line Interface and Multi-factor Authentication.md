ASW CLI allows users to interact directly with AWS services such as sync through the command line.A AWS services may require multi-factor authentication to use, in which case users must setup aws-mfa.

***

1. Install [AWS command line interface](https://aws.amazon.com/cli/), which allows users to store credentials needed to query S3 buckets with Athena
2. Log into [AWS](https://ccao-ds.signin.aws.amazon.com/console) and under your account select "My Security Credentials". Enable multi-factor authentication, and then create an access key. You'll need both the `access key ID`, the `secret access key`, and the name of the `assigned MFA device`. Do not include ` (Virtual)` when copying the name of the MFA device.
3. In the command line run:
   - `aws configure` and enter your `access key ID`, `secret access key`, region (`us-east-1`), and `json` for output.
   - `pip install aws-mfa`
4. Open your credentials file located at `~/.aws/credentials` on Linux or macOS, or at `C:\Users\USERNAME\.aws\credentials` on Windows and rename `[default]` to `[default-long-term]`.
5. Underneath `aws_secret_access_key` type `aws_mfa_device = assigned MFA device` where `assigned MFA device` is the `name of your assigned MFA device`, and save.
6. In the command line, run `aws-mfa` and enter the current MFA token provided by your `assigned MFA device`.
7. Note, this command will only store MFA credentials for 12 hours (unless the duration is explicitly changed when running `aws-mfa`).