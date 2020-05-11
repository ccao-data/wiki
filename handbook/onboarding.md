# Onboarding

# Bookmarks

Take a moment to bookmark these commonly used CCAO links:

**External**
* [CCAO GitLab](https://gitlab.com/ccao-data-science---modeling) - Main source for all Data Science Department code
* [IAAO Technical Standards](https://iaao.org/wcm/Resources/Technical_Standards/wcm/Resources_Content/Pubs/Technical_Standards.aspx) - Technical standards and measurements for the assessment field

**Internal**
* [Data Science Wiki](https://datascience.cookcountyassessor.com/wiki) - This wiki, you're already here!
* [Data Science Application Server](https://datascience.cookcountyassessor.com/shiny) - Shiny server that launches CCAO Shiny applications. Login with Windows credentials
* [App Monitoring Server](https://datascience.cookcountyassessor.com/grafana/) - Dashboards for monitoring app usage, pipeline processes, etc. Ask `@dfsnow` for login

> :warning: The internal application locations above will have a security warning when you first visit them. This warning can safely be ignored. Click **Advanced --> Accept the risk** to bypass the warning.

# Accounts to Create

* [GitLab](https://gitlab.com/) - Needed to contribute to the CCAO codebase (use your @cookcountyassessor.com email to make an account)
* [Bitbucket](https://bitbucket.org/) - Needed for Sourcetree install

# Progams to Install

* [Sourcetree](https://www.sourcetreeapp.com/) - Frontend UI for git version control and GitLab
* [R](https://cloud.r-project.org/) - Main CCAO programming language (use version 3.6.3 or greater)
* [R Studio](https://rstudio.com/products/rstudio/download/#download) - Integrated development environment for R
* [SQL Server Management Studio (SMSS)](https://aka.ms/ssmsfullsetup) - SQL client that plays well with CCAO's SQL Server
* [SSMSBoost](https://www.ssmsboost.com/) - Add-on to SMSS that adds handy features
* [PuTTY](https://www.putty.org/) - SSH client and key generator
* [Teams](https://products.office.com/en-us/microsoft-teams/download-app) - Main CCAO DS communications app

# Initial Setup

## Git, GitLab, and Sourcetree

1. Set up your GitLab and Bitbucket accounts
2. If you don't already have a pending invite to the [CCAO GitLab](https://gitlab.com/ccao-data-science---modeling) group, request one from `@sweatyhandshake`.
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

## R

* If at any point R cannot contact CRAN mirrors to download packages, run `options(download.file.method="libcurl")`
* If at any point R returns the errors `LAPACK routines cannot be loaded` or `maximal number of DLLs reached`, run `file.edit('~/.Renviron')`, enter `R_MAX_NUM_DLLS=1000` in the viewer, save, and reboot RStudio

## SQL

For use in R:
 * Contact `@sweatyhandshake` for read credentials and place them in the top level of your local utility repository once it's been cloned from GitLab
 * The `odbc.credentials` function provides an example of how to connect to the SQL server from within R

For use in SSMS:
 * Go to **SSMSBoost > Settings > Preferred Connections > List**.  Here you can store server credentials provided by `@sweatyhandshake` for all databases you'll need to access. Select **Connect object explorer at startup** for each connection
 * Go to **Tools > Options > Environment > Startup** and select **Open empty environment**

## Teams

 After installation, ask `@sweatyhandshake` for an invite to the Data Science "Team" within the CCAO group

## VPN Client

 You should recieve and email during onboarding from Admins or NCC with instructions on how to set up and access the CCAO network through a VPN. For VPN troubleshooting, email the CCAO [Admins](mailto:admins@cookcountyassessor.com).

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

---

:fire:
