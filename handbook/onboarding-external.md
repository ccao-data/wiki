# Onboarding for External Contributors

Thank you for partnering with the Cook County Assessor's Data Science Department.

Please read the content below to get started. 

# Bookmarks

Take a moment to bookmark these commonly used CCAO links:

**External**

* [CCAO GitLab](https://gitlab.com/ccao-data-science---modeling) - Main source for all Data Science Department code
* [IAAO Technical Standards](https://iaao.org/wcm/Resources/Technical_Standards/wcm/Resources_Content/Pubs/Technical_Standards.aspx) - Technical standards and measurements for the assessment field
* [The Cook County Assessor's PIN Search](https://www.cookcountyassessor.com/address-search) - Our office's application to find information about a PIN
* [Cook County Property Info](http://www.cookcountypropertyinfo.com/) - The County's application to find information about a PIN
* [Cook Viewer](https://maps.cookcountyil.gov/cookviewer/mapViewer.html) - A GIS application for finding PINs.

# Developer Engagement Documents

Before we can begin collaborating on a project, we need a collaborator agreement. Please review the [introduction letter](https://gitlab.com/ccao-data-science---modeling/ccao_sf_cama_dev/-/blob/master/collaborator.documents/Developer%20Engagement%20Introduction%20Letter.pdf) for an overview of the documents that are required by our external collaboration program. Please email the completed documents to datascience@cookcountyassessor.com.

# Virtural Private Network

You will need a VPN to access internal CCAO databases and servers. Please request VPN documents from datascience@cookcountyassessor.com, complete them, and return them to datascience@cookcountyassessor.com. 

# Accounts to Create

* [GitLab](https://gitlab.com/) - Needed to contribute to the CCAO codebase.
* [Bitbucket](https://bitbucket.org/) - Needed only for Sourcetree install

# Programs to Install

* [Sourcetree](https://www.sourcetreeapp.com/) - Frontend UI for git version control and GitLab
* [R](https://cloud.r-project.org/) - Main CCAO programming language (use version 3.6.3 or greater)
* [R Studio](https://rstudio.com/products/rstudio/download/#download) - Integrated development environment for R
* [SQL Server Management Studio (SMSS)](https://aka.ms/ssmsfullsetup) - SQL client that plays well with CCAO's SQL Server
* [SSMSBoost](https://www.ssmsboost.com/) - (Optional) Add-on to SMSS that adds handy features
* [PuTTY](https://www.putty.org/) - SSH client and key generator
* [Teams](https://products.office.com/en-us/microsoft-teams/download-app) - Main CCAO DS communications app
* [Microsoft ODBC Driver 17 for SQL Server](https://www.microsoft.com/en-us/download/details.aspx?id=56567) - Necessary to connect to SQL through R

# Initial Setup

## Git, GitLab, and Sourcetree

1. Set up your GitLab and Bitbucket accounts
2. If you don't already have a pending invite to the [CCAO GitLab](https://gitlab.com/ccao-data-science---modeling) group, request one from datascience@cookcountyassessor.com.
3. Install programs
   * Link your Bitbucket account to Sourcetree during Sourcetree installation
   * When Sourcetree asks you to install mercurial and git, select **Yes** for both
4. Create a .ssh folder in your home directory
   * One way to do this is to open the Start Menu and type `cmd` in the search box. Click on `cmd.exe` when it comes up in the search results. This will open up a Windows command prompt. Enter `mkdir .ssh` in the command prompt. This will create a folder called `.ssh` in your home directory.
5. Generate SSH keys with Sourcetree (if you'd like to generate an SSH key pair without sourcetree, see instructions [here](https://docs.gitlab.com/ee/ssh/#generating-a-new-ssh-key-pair))
   * Open Sourcetree and go to **Tools**
   * Select **Create or import SSH keys**
   * Select **Generate**
   * Save the public and private keys to your `.ssh` folder (add a password to your private key if you desire)
   * Copy your newly generated SSH keys from the Sourcetree window. **Pasting this version of your ssh key into PuTTY and GitLab will help avoid errors.**
6. Right click the PuTTY icon in the system tray (bottom right portion of task bar)
   * Click **Add key**
   * Locate the private key in your `.ssh` folder (no .pub ending) and add it to PuTTY
7. Add your SSH keys to GitLab
   * In GitLab, go to **Settings** under your profile icon in the top-right corner
   * On the left-hand side of the settings window, click **SSH Keys**, then paste your public key into the box (the title and expiration date are arbitrary and can be whatever you'd like)
8. Clone your desired CCAO project
   * In Sourcetree, select **Clone**
   * Within GitLab, find the repository you'd like to clone
   * From the main page of the project, select the blue **Clone** button on the top right-hand side of the page. Click the **Clone with SSH** button to copy the SSH URI to your clipboard.
   * Paste this into the top line of the **Clone** page in Sourcetree, and click out of the box
   * If Sourcetree encounters an error, restart it and repaste the text into the **Clone** field
   * Under **Advanced Options**, select the `master` branch
   * Press the **Clone** button at the bottom of the page
   * Clone the repositories to `"My Documents"`, or file paths will need to be rewritten in several scripts

## SQL Credentials

The Data Science Department uses a few SQL servers to store most of its backend data. The IP addresses and details of each database are:

| Common Name           | Usage                                  | IP Address     | Port | DB Name  | User      | Password | Permissions | Type     |
|-----------------------|----------------------------------------|----------------|------|----------|-----------|----------|-------------|----------|
| CCAODATA / SQL Server | All DS operations                      | 10.124.134.118 | 1433 | CCAODATA | CCAODATAR | Ask      | Read only   | MS SQL   |
| Reporting Server      | Reporting only, has subset of CCAODATA | 10.124.134.121 | 1433 | CCAODATA | CCAORSRV  | Ask      | Read/index  | MS SQL   |
| RPIE Server           | RPIE backend data                      | 10.124.134.120 | 1433 | RPIE     | CCAORPIE  | Ask      | Read only   | MS SQL   |
| Monitoring Server     | Monitors DS applications               | 10.124.101.1   | 5432 | shiny    | shiny     | Ask      | Read/write  | Postgres |


**For use in R (old way):**

1. Contact `@sweatyhandshake` for read credentials and place them in the top level of your local utility repository once it's been cloned from GitLab
2. The `odbc.credentials` function provides an example of how to connect to the SQL server from within R

**For use in R (new way):**

R will automatically load [environmental variables](https://medium.com/chingu/an-introduction-to-environment-variables-and-how-to-use-them-f602f66d15fa) into memory from your [.Renviron file](https://www.dartistics.com/renviron.html). This can be used to load sensitive information like credentials and API keys without depending on a third-party library or function. To use this method:

1. Create a `.Renviron` file inside your HOME folder (`"My Documents"` on Windows, `~` on *nix systems)
2. Create an environmental variable equal to an ODBC-formatted connection string for the server you want to connect to within the `.Renviron` file. For example, `DB_CONFIG_CCAODATA=Driver={ODBC Driver 17 for SQL Server};Server=10.124.134.118;Database=CCAODATA;Uid=CCAODATAR;Pwd=PASSWORD;`. This will create a variable named `DB_CONFIG_CCAODATA`.
3. Restart R/RStudio to load the environmental variable into R. You can access the variable's value using `Sys.getenv()`. For example, `Sys.getenv("DB_CONFIG_CCAODATA")` will access the variable created above.
4. Connect to the database using the `.connection_string` argument of the `dbConnect()` function from `DBI`. A full example would look like:
 
```r
library(DBI) # required for DB connection
library(odbc) # required for ODBC specification

# Instantiate a database connection object, where DB_CONFIG_CCAODATA is equal
# to the environmental variable stored in the .Renviron file
CCAODATA <- dbConnect(odbc(), .connection_string = Sys.getenv("DB_CONFIG_CCAODATA"))

```

**For use in SSMS (only if SMSSBoost is installed):**

1. Go to **SSMSBoost > Settings > Preferred Connections > List**.  Here you can store server credentials provided by `@sweatyhandshake` for all databases you'll need to access. Select **Connect object explorer at startup** for each connection
2. Go to **Tools > Options > Environment > Startup** and select **Open empty environment**

## Teams

 After installation, ask `@sweatyhandshake` for an invite to the Data Science "Team" within the CCAO group.

# Issue Resolution

The CCAO Data Science team uses [GitLab Flow](https://docs.gitlab.com/ee/topics/gitlab_flow.html) to structure its workflow. GitLab Flow uses a basic branch-per-issue system. Each issue or new feature is tied to a branch and merge request. Work is done on the branch, then merged to `master` after testing and review. Here's an example of a typical workflow:

1. You are assigned **Issue #118, Update Internal Contribution Guidelines** within GitLab.
   * Check to see if there is a branch associated with your issue within GitLab. Branches created via issues usually have a similar name, in this case the branch name would be `118-update-internal-contribution-guidelines`.
   * If a branch doesn't exist, please ask your supervisor to create one. Please *do not* create a branch yourself.

2. Checkout the issue branch.
   * Within Sourcetree, click **Repository --> Checkout**, then select the branch associated with the issue you have been assigned. In this case, `118-update-internal-contribution-guidelines`. You can also double-click different branch names to check them out.
   * The branch you selected should now appear bolded under **BRANCHES** on the left side of Sourcetree. You are now working within that branch.

2. Work the issue. Please use the issue page comments to communicate with your supervisor about the issue.

3. Commit often and use [descriptive commit messages](https://commit.style/). Only push to your issue branch, never directly to `master`.

4. When you have finished working on the issue, request approval for your merge request let your supervisor know you've finished working the issue.

See the [Version Control and Workflow](handbook.md#version-control-and-workflow) section of the handbook for more information.

---

:fire:
