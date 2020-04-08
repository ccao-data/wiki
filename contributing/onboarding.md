---
title: Onboarding
description: Getting setup to contribute to the Data Science department
published: true
date: 2020-04-08T21:29:47.013Z
tags: required, data
---

# Contributors external to CCAO

We are happy to announce a new Developer Engagement Program at the Cook County Assessor's Office. In this program, developers, coders, data scientists, and others can partner with our office. In this partnership, the CCAO provides data and knowledge, and outside contributors build solutions that advance the mission of the agency.

Please review the documents in [collaborator.documents](https://gitlab.com/ccao-data-science---modeling/ccao_sf_cama_dev/tree/master/collaborator.documents) for additional information.

# Contributors internal to CCAO
## GETTING SET UP
### Accounts to create
- [gitlab](https://gitlab.com/)
- [bitbucket](https://bitbucket.org/)

### Progams to install
- [Sourcetree](https://www.sourcetreeapp.com/)
- [R](https://cloud.r-project.org/)
- [R Studio](https://download1.rstudio.org/RStudio-1.1.463.exe)
- [Java](https://www.java.com/en/download/manual.jsp) (Use Chrome to ensure you download a 64-bit version)
- [SQL Server Management Studio](https://docs.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms?view=sql-server-2017)
- [SSMSBoost](https://www.ssmsboost.com/)
- [Slack](https://slack.com/downloads/windows)

### Git
1. set up accounts
2. If you don't already have a pending invite to the CCAO Group, ask @sweatyhandshake for one
3. install programs
   * link your bitbucket account to sourcetree during sourcetree installation
   * when sourcetree asks you to install mercucial and git, select yes for both
4. create a .ssh folder
   * One way to do this is to open the Start Menu and type `cmd` in the search box. Click on `cmd.exe` when it comes up in the search results. This will open up a Windows command prompt. Enter `mkdir .ssh` in the command prompt. This will create a folder called `.ssh` in your home directory.
5. open sourcetree (if you'd like to generate an SSH key pair without sourcetree, see instructions [here](https://docs.gitlab.com/ee/ssh/#generating-a-new-ssh-key-pair))
   * go to "tools"
   * select "create or import SSH keys"
   * select "generate"
   * save the public and private keys in your .ssh folder (add a password to your private key if you desire)
   * keep the sourcetree window with your newly generated ssh key up and copy it: **pasting this version of your ssh key into putty, gitlab, and bitbucket will help avoid errors**
6. right click the putty icon in the system tray (bottom right portion of task bar)
   * click "add key"
   * locate your key in your .ssh folder and add it
7. add your ssh keys to gitlab and bitbucket
   * in gitlab, go to settings under your profile icon in the top-right corner
     * on the left-hand side of the settings window, scroll down to `SSH Keys` and paste in your public key. title it whatever you like.
   * in bitbucket go to settings under your profile icon in the bottom-left corner
     * under `security` click `SSH Keys` then `Add Key`
8. in sourcetree, select "clone"
   * from gitlab, view the repository you'd like to clone
   * on the left hand side select "projects" and "details"
   * on the right-hand select the blue "clone" button and hit the chain button under "Clone with SSH"
   * paste this into the top line of the "clone" page in sourcetree, and click out of the box
   * if source tree encoutners an error, restart it and repaste the text into the "clone" field
   * under "Advanced Options", select the `master` branch
   * press the "clone" button at the bottom of the page
   * clone the repositories to `"My Documents"`, or file paths will need to be rewritten in several scripts
   * for work in any repository it is likely you will need to clone the `UTILITY` repository as well

### R
* if at any point R cannont contact CRAN mirrors to download packages, run `options(download.file.method="libcurl")`
* if at any point R returns the errors `LAPACK routines cannot be loaded` or `maximal number of DLLs reached`, run `file.edit('~/.Renviron')`, enter `R_MAX_NUM_DLLS=1000` in the viewer, save, and reboot RStudio

### SQL
For use in R:
 * contact @sweatyhandshake for read credentials and place them in the top level of your local utility repository once it's been cloned from gitlab.
 * the `odbc.credentials` function provides an example of how to connect to the SQL server from within R.

For use in SSMS:
 * Go to `SSMSBoost > Settings > Preferred COnnections > List` where you can store server credentials provided by @sweatyhandshake for all databases you'll need to access. Select `Connect object explorer at startup` for each connection.
 * Go to `Tools > Options > Environment > Startup` and select `Open empty environment`

### Slack
 * After installation, ask @sweatyhandshake for an invite to the slack group

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
