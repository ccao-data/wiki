---
title: Onboarding
description: Get started with the Data Science department
published: true
date: 2020-05-04T19:51:18.972Z
tags: setup
---



## Accounts to Create
- [GitLab](https://gitlab.com/)
- [Bitbucket](https://bitbucket.org/)

## Progams to Install

* [Sourcetree](https://www.sourcetreeapp.com/) - Frontend UI for git version control and GitLab
* [R](https://cloud.r-project.org/) - Main CCAO programming language (use version 3.6.3 or greater
* [R Studio](https://rstudio.com/products/rstudio/download/#download) - Integrated development environment for R
* [SQL Server Management Studio](https://aka.ms/ssmsfullsetup) (SMSS) - SQL client that plays well with SQL Server
* [SSMSBoost](https://www.ssmsboost.com/) - Add-on to SMSS that adds handy features
* [PuTTY](https://www.putty.org/) - SSH client and key generator
* [Teams](https://products.office.com/en-us/microsoft-teams/download-app) - Main CCAO communications app

## Setup

### Git and Sourcetree
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
   * Press the *Clone* button at the bottom of the page
   * Clone the repositories to `"My Documents"`, or file paths will need to be rewritten in several scripts

### R
* If at any point R cannot contact CRAN mirrors to download packages, run `options(download.file.method="libcurl")`
* if at any point R returns the errors `LAPACK routines cannot be loaded` or `maximal number of DLLs reached`, run `file.edit('~/.Renviron')`, enter `R_MAX_NUM_DLLS=1000` in the viewer, save, and reboot RStudio

### SQL
For use in R:
 * contact @sweatyhandshake for read credentials and place them in the top level of your local utility repository once it's been cloned from gitlab.
 * the `odbc.credentials` function provides an example of how to connect to the SQL server from within R.

For use in SSMS:
 * Go to `SSMSBoost > Settings > Preferred Connections > List` where you can store server credentials provided by @sweatyhandshake for all databases you'll need to access. Select `Connect object explorer at startup` for each connection.
 * Go to `Tools > Options > Environment > Startup` and select `Open empty environment`

### Teams
 * After installation, ask @sweatyhandshake for an invite to the data science "Team" in the CCAO group
 
### VPN Client
 * You should recieve and email during onboarding from Admins or NCC with instructions on how to set up and access the CCAO network through a VPN. Confirm it works and contact Admins if it does not.

## Issue Resolution
Our current workflow process is based on the basci branch-per-issue system. In this workflow, issues are tied to branches and merge requests.

For example: 

Issue #118, Branch 118-update-internal-contribution-guidelines, with a merge request.

1. After being assigned an issue,
* Check to see if there is a branch associated with your issue.
   * If there is not, please ask your supervisor to create one. Please **do not** create a branch yourself.
In Sourcetree,
   * Click Repository --> Checkout --> select the branch associated with the issue you have been assigned.
   * This branch should now appear bolded under BRANCHES on the left side of Sourcetree. You are now tracking that branch.
   
2. Work the issue. Please use the issue page comments to communicate with your supervisor about the issue.

3. At the end of each work day, commit your work and push to your issue branch. Commmitting and pushing more often is fine.

4. When you have finished working on the issue, let your supervisor know in the comments.

---
:fire:
