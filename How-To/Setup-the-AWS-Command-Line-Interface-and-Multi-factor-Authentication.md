The AWS CLI allows users to interact directly with AWS services such S3, Athena, and Glue. Authenticating via the CLI also allows users to interact with these services through analytics tools like R and Tableau.

Our account setup requires multi-factor authentication (MFA) to use most services. The easiest way to setup MFA is using the third-party `aws-mfa` tool.

---
  
1. Install the AWS command line interface using [the provided executable](https://aws.amazon.com/cli/) or `pip install awscli`, which allows users to store credentials, query Athena, move S3 objects, etc. The CLI on Windows can be accessed via PowerShell. On Linux or macOS it can be accessed via a standard terminal.
2. Log into the [AWS Console](https://ccao-data.signin.aws.amazon.com/console) and under your account select "My Security Credentials". Enable MFA, then create an access key. You'll need both the `Access Key ID`, the `Secret Access Key`, and the name of the `Assigned MFA Device`. Do not include `(Virtual)` when copying the name of the MFA device.
3. In the command line run:
   - `aws configure` and enter your `Access Key ID`, `Secret Access Key`, region (`us-east-1`), and `json` for output.
   - `pip install aws-mfa`
4. Open your credentials file located at `~/.aws/credentials` on Linux or macOS, or at `C:\Users\$USERNAME\.aws\credentials` on Windows and rename `[default]` to `[default-long-term]`.
5. Underneath `aws_secret_access_key` type `aws_mfa_device = $MFA_DEVICE` where `$MFA_DEVICE` is the previously copied `Assigned MFA Device` from the AWS Console. Save the file.
6. In the command line, run `aws-mfa` and enter the current MFA token provided by your `Assigned MFA Device`.
7. Note, this command will only store MFA credentials for 12 hours (unless the duration is explicitly changed when running `aws-mfa`).

---

Note, when connecting through the VPN or working in-office, you may encounter a TLS error when trying to authenticate with AWS on Windows. This error is due to certificate chain issues with the AWS CLI. You can fix it by exporting the CCAO's root CA bundle and providing the path in the `C:\Users\$USERNAME\.aws\config` file.

1. Search `Manage user certificates` in the Windows search bar. Then find the CCAO-specific root certificate under `Trusted Root Certificate Authorities > Certificates`.
2. Right-click the CCAO CA, then click `All Tasks > Export`.
3. Export the CA bundle in the base-64 X.509 format. Save the exported CA bundle somewhere accessible.
4. Open the configuration file at `C:\Users\$USERNAME\.aws\config` and add the line `ca_bundle = $PATH_TO_EXPORTED_CERT`, where `$PATH_TO_EXPORTED_CERT` is the path to the root CA file you just generated.

---
  
Most of this README originates from these sources:
  
- [Configuration Basics - AWS Command Line Interface](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html)
- [aws-mfa: Easily manage your AWS Security Credentials when using Multi-Factor Authentication (MFA)](https://github.com/broamski/aws-mfa)
