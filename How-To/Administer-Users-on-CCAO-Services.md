# CCAO Services

Nearly all the services used by the Data Department are administered either by the County's Bureau of Technology (BoT) or the CCAO's in-house IT. Below is a list of commonly-used services along with contact information for their respective user account administrators.

| Owner   | Service | Contact |
| ------- | ------- | ------- |
| Cook County | [Web Clock](https://www.cookcountyil.gov/cct) | [Admins](mailto:Assessor.Admins@cookcountyil.gov) |
| Cook County | [Office 365](https://outlook.office365.com/cookcountyil.gov) | [Admins](mailto:Assessor.Admins@cookcountyil.gov) |
| Cook County | VPN | [Admins](mailto:Assessor.Admins@cookcountyil.gov) |
| Cook County | iasWorld Backend | Mirella |
| Cook County | [iasWorld Frontend](https://iptsweb.ccounty.com/) | Mirella/[Admins](mailto:Assessor.Admins@cookcountyil.gov) |
| CCAO        | [SQL Server](http://10.129.122.31) | Derrick S |
| CCAO        | [Tableau](https://tableau.cookcountyassessor.com/#/signin) | Nicole/[Admins](mailto:Assessor.Admins@cookcountyil.gov) |
| CCAO        | [Nearmap](https://www.nearmap.com/us/en) | [Admins](mailto:Assessor.Admins@cookcountyil.gov) |
| IAAO        | [IAAO Resources](https://www.iaao.org/IAAO_Core/Contacts/Sign_In.aspx) | Isalia/[Admins](mailto:Assessor.Admins@cookcountyil.gov) |

# Data Department Services

A few services are administered directly by the Data Department and must therefore be managed manually. Most of this manual management involves provisioning (and deleting) new user accounts for interns and staff. This section will walk through that process for each of Data's self-managed services.

## Data Server

The Data Department uses an on-premise Linux server for compute, scheduled jobs, and running applications. Two applications on the server use PAM (local user accounts) to authenticate users:

- [RStudio Server](https://datascience.cookcountyassessor.com/rstudio/)
- [JupyterLab](https://datascience.cookcountyassessor.com/jupyter/)

To add new users to the Data server (and these applications), complete the following steps:

1. SSH into the Data server. `$YOUR_USER` is your existing username on the server:
    ```bash
    ssh $YOUR_USER@datascience.cookcountyassessor.com
    ```
2. Create a new user. `$THEIR_USER` should be the same username as their Windows login (e.g. `dfsnow`). NOTE: You must be a super-user to create a new user. If you are not a super-user, ask Mike F. or Dan (@dfsnow) to add you to the sudoers group.
    ```bash
    sudo adduser $THEIR_USER
    ```
3. Follow the prompts for user creation. Ask the user to create a password (if they are present) or generate a random one and share it with them securely.
4. Test the new account. Visit the [RStudio](https://datascience.cookcountyassessor.com/rstudio/) login page and test the new account credentials. The account should work immediately.

To delete users on the Data server, complete the following steps:

1. SSH to the Data server, same as above.
2. If the user has significant/valuable work in their home directory, first backup the directory. Backups can be stored in the `CCAODATA` directory on the `O:` shared drive.
    ```bash
    sudo tar -cfz $THEIR_USER.tar.gz /home/$THEIR_USER
    ```
3. Delete the user account. This will remove their user and group but *not* their home directory.
    ```bash
    sudo deluser $THEIR_USER
    ```
4. (Optional) Delete their home directory. This is only really necessary if their home directory is consuming a lot of space.
    ```bash
    sudo rmdir /home/$THEIR_USER
    ```
## AWS

The Data Department stores most of its active data on AWS. Reading this data requires an authenticated AWS user account. Most users, such as interns and analysts, only require read access. To add a read-only user, complete the following steps:

1. Login to the [CCAO's AWS Console](https://ccao-ds.signin.aws.amazon.com/console) using an account with an administrator role.
2. Visit the **IAM** service, click **Users** in the sidebar, then click **Add users** in the top-right corner.
3. Create a user following the prompts:
    * The user name should be a Cook County email address.
    * Access type should be both programmatic and console.
    * Add the user to the `cookcounty-readonly` user group.
    * Ignore tags and click **Create user** on the final screen.
4. The new account will be *unable to access resources until an MFA device is added*. Users must have their device manually added by an administrator. To add a device:
    * Return to the **Users** tab of the **IAM** service. Click the username you just created.
    * Click the **Security credentials**, scroll down to **Multi-factor authentication (MFA)**, then click **Assign MFA device** and follow the prompts.
5. Login to the AWS Console with the new user account. Run a test query in Athena to ensure that MFA and all permissions are correctly configured.

## Open Data Portal

The Data Department also administers the CCAO account on the [Cook County Data Portal](https://datacatalog.cookcountyil.gov). The main administrator account can delegate permissions to other user accounts on the portal.

Ask a [core team](https://github.com/orgs/ccao-data/teams/core-team) member for administrator account credentials. For any issues, contact the current main administrator of the portal [Josh K](mailto:josh.kalov@cookcountyil.gov).
