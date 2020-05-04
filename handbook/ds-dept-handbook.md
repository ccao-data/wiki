---
title: Data Science Departmental Handbook
description: Everything you need to know about the mission and work of the CCAO Data Science department
published: true
date: 2020-05-04T20:46:38.013Z
tags: handbook
---

Introduction
============

This document outlines the purpose, procedures, and best practices of
the Data Science Department at the Cook County Assessor's Office.

Data Science Department
=======================

Mission
-------

The rationale for having a separate department in the CCAO that
specifically deals with data science is similar to that in the private
sector: data, apart from the IT systems that store it, is a valuable
enterprise asset and must be managed accordingly. This is particularly
true for the CCAO, where data is absolutely critical to the mission of
the agency.

The mission of this new department is to build, maintain, organize, and
utilize data to create value for taxpayers and facilitate production of
annual property assessments. This is separate from the role of the IT
department, which is to build and maintain technological enterprise
assets. The Data Science Department's Mission is to facilitate
production of annual property assessments in Cook County by:

-   Leveraging computing and statistical techniques to estimate
    property's fair market values;
-   Leveraging existing data bases to generate insights into valuation
    processes;
-   Support other CCAO departments in generating machine-readable data
    and analyzing it;
-   Maintaining and improving relationships between data sets to
    increase their value;
-   Identifying opportunities to generate new valuable data;
-   Improving intra-office data and statistical literacy.

Vision
------

Our vision is to enhance the CCAO's reputation among taxpayer and peers
as a technological leader in the field of property tax assessment, known
for innovative, ethical, transparent, and fair assessments.

Core Values
-----------

### Precision and Accuracy

The Data Science Department is dedicated to providing precise and
accurate values and analysis. It is not enough to get the numbers right
some of the time, or on average. We strive for the highest level of
precision and accuracy achievable, and we are committed to evaluating
ourselves against the fundamental question \`\`did we get it right?"

### Growth and Innovation

The Data Science Department is committed to continual improvement and
innovation. We believe that moving forward is keeping up, and standing
still is falling behind. We are committed to learning and testing
state-of-the-art algorithms and analytic techniques in our work.

### Transparency and Ethics

The Data Science Department is committed to radical transparency and
high ethical standards. We operate under the assumption that all of our
work will be available to highly skilled outside reviewers, and that all
of our decisions will be scrutinized. As such, we will hold ourselves to
the highest ethical standards, and always evaluate our work on the basis
of fairness.

### Efficiency and Productivity

The Data Science Department will never stand idle. We will strive to
hold ourselves to a rigorous production schedule that results in
tangible, high quality, useful work product on a regular basis. We will
strive to hold ourselves to agreed timelines, and take responsibility
for missed deadlines or low quality work.

Project Management
------------------

The Data Science Department follows principles of agile project
management in its work. This management approach is designed for
institutions that produce a large amount of complex, customized,
tangible work product in a high-stakes environment. In the case of the
CCAO, these work products are software, algorithms, analysis, and policy
recommendations that can have a large impact on property tax assessments
in Cook County. Our end users are either internal staff executing the
duties of the office, or external stakeholders, like taxpayers or
elected representatives.

Agile Principles
----------------

In order to deliver accurate and timely work products, the Data Science
Department follows the following agile principles:

### Continuous Delivery

The Data Science Department produces tools and analysis to support CCAO
operations. In order to ensure that this is accomplished, development
times should be shortened so that products are delivered to the end user
more quickly. This is done by limiting the number and complexity of the
feature in each version. By producing incrementally better versions with
shorter build times, the Data Science Department can solicit user
feedback more regularly, and more frequently. This increases the
usability of the final product.

### Embrace Change

The Data Science Department should be very flexible in terms of making
changes to tools to suit the end-users needs. Changes to tools and
scripts should be considered even at late stage of development.

### Developers work with Management

Senior Data Scientists and developers are regularly involved in
managerial discussions so that they have an intimate knowledge of
institutional and end-user needs.

### Measuring Progress

The primary metric by which the Data Science Department judges its work
is by functional products. The continuous deployment of increasingly
useful, functional tools is really what matters.

### Self-organization and initiative

The Deputy Assessor Chief Data Office should not micro-manage staff. The
Senior Data Scientists should be given tasks to accomplish and left to
determine for themselves how exactly to accomplish that task, within
departmental guidelines. Developers and employees should feel free to
raise problems quickly with the Deputy Assessor Chief Data Officer so
that project goals may be adjusted, where necessary.

### Reflect and Adapt

At regular intervals the staff of the Data Science Department should
reflect on their work to date, and identify ways to become more
efficient. Workflow processes should be treated in the same manner as
work-product, constantly evolving to meet the demands of the enterprise.

Agile Practices
---------------

In addition to these principles, the Data Science Department adheres to
two regular practices:

### Daily Standup

There is a standing departmental meeting from 8:45-9:00 a.m. which all
departmental staff are required to attend. The purpose of this meeting
is to discuss the day's tasks and raise issues that staff may have
encountered in the previous day.

### Weekly Spring Planning 

There is a standing departmental meeting from 9:00 - 10:00 which select
senior staff is required to attend. The purpose of this meeting is to
discuss the goals of the week, and review the progress of the past week.
During this meeting, Issues (\\ref{Issues) are created, discussed,
modified, and/or assigned, and priorities are reviewed. Milestone
(\\ref{Milestones) burndown charts are reviewed. Members of other
departments may attend to keep apprised of progress.

### Limiting Work-in-Progress 

Staff should not be assigned more than a few issues to work
simultaneously. Work should be executed in the order in which it is due.
Work should be accomplished within the sprint in which it was assigned.
The Deputy Assessor Chief Data Officer and the Senior Data Scientists
should adjust their assignments and expectations based on milestone
burndown charts and the open issue list.

### Limiting mid-sprint objective changes 

Staff should not be re-assigned to different issue tickets mid-sprint.
This is extremely detrimental to productivity, and wastes time.

Database Map
------------

Organizational Structure
------------------------

Training and Continuous Development
-----------------------------------

Work-Terminal Setup
===================

### Accounts to create

-   [gitlab](https://gitlab.com/)
-   [bitbucket](https://bitbucket.org/)

### Progams to install

-   [Sourcetree](https://www.sourcetreeapp.com/)
-   [R](https://cloud.r-project.org/)
-   [R Studio](https://download1.rstudio.org/RStudio-1.1.463.exe)
-   [Java](https://www.java.com/en/download/manual.jsp) (Use Chrome to
    ensure you download a 64-bit version)
-   [MikeTex](https://miktex.org/download)
-   [TexStudio](https://www.texstudio.org/)
-   [SQL Server Management
    Studio](https://docs.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms?view=sql-server-2017)
-   [SSMSBoost](https://www.ssmsboost.com/)
-   [Slack](https://slack.com/downloads/windows)

### Git

1.  set up accounts
2.  If you don't already have a pending invite to the CCAO Group, ask
    @sweatyhandshake for one
3.  install programs
    -   link your bitbucket account to sourcetree during sourcetree
        installation
    -   when sourcetree asks you to install mercucial and git, select
        yes for both
4.  create a .ssh folder
    -   One way to do this is to open the Start Menu and type `cmd` in
        the search box. Click on `cmd.exe` when it comes up in the
        search results. This will open up a Windows command prompt.
        Enter `mkdir .ssh` in the command prompt. This will create a
        folder called `.ssh` in your home directory.
5.  open sourcetree (if you'd like to generate an SSH key pair without
    sourcetree, see instructions
    [here](https://docs.gitlab.com/ee/ssh/#generating-a-new-ssh-key-pair))
    -   go to “tools”
    -   select “create or import SSH keys”
    -   select “generate”
    -   save the public and private keys in your .ssh folder (add a
        password to your private key if you desire)
    -   keep the sourcetree window with your newly generated ssh key up
        and copy it: **pasting this version of your ssh key into putty,
        gitlab, and bitbucket will help avoid errors**
6.  right click the putty icon in the system tray (bottom right portion
    of task bar)
    -   click “add key”
    -   locate your key in your .ssh folder and add it
7.  add your ssh keys to gitlab and bitbucket
    -   in gitlab, go to settings under your profile icon in the
        top-right corner
        -   on the left-hand side of the settings window, scroll down to
            `SSH Keys` and paste in your public key. title it whatever
            you like.
    -   in bitbucket go to settings under your profile icon in the
        bottom-left corner
        -   under `security` click `SSH Keys` then `Add Key`
8.  in sourcetree, select “clone”
    -   from gitlab, view the repository you'd like to clone
    -   on the left hand side select “projects” and “details”
    -   on the right-hand select the blue “clone” button and hit the
        chain button under “Clone with SSH”
    -   paste this into the top line of the “clone” page in sourcetree,
        and click out of the box
    -   if source tree encoutners an error, restart it and repaste the
        text into the “clone” field
    -   under “Advanced Options”, select the `master` branch
    -   press the “clone” button at the bottom of the page
    -   clone the repositories to `"My Documents"`, or file paths will
        need to be rewritten in several scripts
    -   for work in any repository it is likely you will need to clone
        the `UTILITY` repository as well

### R

-   if at any point R cannont contact CRAN mirrors to download packages,
    run `options(download.file.method="libcurl")`
-   if at any point R returns the errors
    `LAPACK routines cannot be loaded` or
    `maximal number of DLLs reached`, run `file.edit('~/.Renviron')`,
    enter `R_MAX_NUM_DLLS=1000` in the viewer, save, and reboot RStudio

### SQL

For use in R: \* contact @sweatyhandshake for read credentials and place
them in the top level of your local utility repository once it's been
cloned from gitlab. \* the `odbc.credentials` function provides an
example of how to connect to the SQL server from within R.

For use in SSMS: \* Go to
`SSMSBoost > Settings > Preferred COnnections > List` where you can
store server credentials provided by @sweatyhandshake for all databases
you'll need to access. Select `Connect object explorer at startup` for
each connection. \* Go to `Tools > Options > Environment > Startup` and
select `Open empty environment`

### Slack

-   After installation, ask @sweatyhandshake for an invite to the slack
    group

Version Control and Workflow
============================

The Data Science Department uses
\\href{<a href="https://gitlab.com/ccao-data-science---modeling%7BGitLab" class="uri">https://gitlab.com/ccao-data-science---modeling{GitLab</a>
as a workflow and version control process. The Department's work is
oriented around GitLab code repositories, with each repository
representing an area of responsibility for the department.

Public Repositories
-------------------

These repositories are available to the public in their entirety, for
free, via the internet.

Residential Code base for the computer assisted mass appraisal programs supporting residential valuation.
---------------------------------------------------------------------------------------------------------

Utility A collection of commonly used functions across multiple repositories.
-----------------------------------------------------------------------------

Data Architecture A collection of commonly used functions across multiple repositories.
---------------------------------------------------------------------------------------

Non-public Repositories
-----------------------

These repositories are available to the public through FOIA. Only the
main branch of each repository is available through FOIA - all other
branches are drafts and deliberative materials and are not subject to
FOIA.

Income Producing
----------------

Code base for the computer assisted mass appraisal programs supporting
industrial/commercial valuation. \#\# Policy Policy documents, draft
legislation, and other written material. \#\# Enterprise Intelligence A
repository to contain all ad-hoc data requests, investigations, or other
non-production analysis. \#\# FOIA A repository to contain code and data
produced in response to FOIA requests. \#\# Reporting A repository to
contain scripts relating to diagnostic and external reports. \#\#
Training A repository to contain materials related to training.

Issues
--------------------

An
\\href{<a href="https://docs.gitlab.com/ee/user/project/issues/%7BIssue" class="uri">https://docs.gitlab.com/ee/user/project/issues/{Issue</a>
is a work-assignment that should take one to two work weeks to complete
(see \\ref{Continuous Delivery). Work products that take longer than one
to two weeks to complete should be broken into multiple issues and,
where appropriate, grouped into a milestone (see \\ref{Milestones)).

Issues may be created by anyone in the organization. Issue deadlines are
assigned by the Deputy Assessor Chief Data Officer in consultation with
their Senior Data Scientists (see \\ref{Weekly Sprint Planning). Issues
should always correspond to a
\\href{<a href="https://docs.gitlab.com/ee/gitlab-basics/add-merge-request.html%7Bmerge" class="uri">https://docs.gitlab.com/ee/gitlab-basics/add-merge-request.html{merge</a>
request that closes the issue.

### Labels

All labels should be maintained at the group level. Issues should be
labeled so that work is more easily searchable and categorized. Labels
are maintained by the Senior Data Scientists.

### Weights

Issues should be assigned weights relative to their importance. Weights
should be in (1,5,15).

Working Issues
--------------

When working an issue, departmental staff should follow these steps:

    *  Make sure the issue has a due date, time estimate, label, and associated merge request. If any of these are missing, notify the issue creator.
    *  Make sure you are tracking the branch associated with this issue in Sourcetree.
    *  Work the issue. Follow the coding standards (\ref{Coding Standards). Use the comment section of the issue to discuss the work. This creates a record that can be referenced in the future.
    *  Upon completion of the work, resolve the WIP status of the merge request and notify your supervisor that you have completed the work.

### Merge request approvals

In collaboration with the Senior Data Scientists, the Deputy Assessor
Chief Data Officer can set approvals for merge requests. Branches will
not be merged into the production branch until all approvals are made.

### Work In Progress Status

Draft working documents are not available under FOIA. The WIP status of
branches should not be resolved until the branch is merged into
production. Work on branches labeled with WIP status are not available
to FOIA. WIP status should be resolved and branches should be merged
into production upon the delivery of the work product to either internal
or external stakeholders.

Milestones
----------------------------

Issues are organized into Milestones. Milestones are large projects that
take 6 - 9 months to accomplish. Milestones allow us to group issues
together based on their long-term goals. The Chief Data Officer creates
and tracks Milestones to ensure timely delivery of work-product.

Residential Automated Valuation
===================================================

Models
------

A model is a mathematic characterization of the relationship between an
outcome and a set of predictors. In the case of the residential
automated valuation program, the outcome is the sale price of a
property. Our modeling script loops over a menu of models that contains
every model the CCAO has ever built. Models in this menu can be set to
'inactive' if they are low-quality or otherwise unnecessary. However,
models should never be removed from the list, since inactive models sill
provide important information about what does and does not work.

Coding Standards
========================================

Replicability
-------------

All work-product produced by the Data Science Department should be
replicable by either a third party, or another staff member, at any
point in the future. This both increases productivity by reducing
confusion and technological debt, and facilitates transparency and
accountability. In order to ensure replicability of work, departmental
staff should adhere to the following coding standards.

Comments
--------

Function names
--------------

Program Headers
---------------

Integrity Checks
----------------

Simplicity
----------

Data Architecture Standards
----------------------------------------------

Developer Engagement Program
============================
