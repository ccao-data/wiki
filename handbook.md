---
title: Data Science Departmental Handbook
description: Everything you need to know about the mission and work of the CCAO Data Science department
published: true
date: 2020-05-05T00:01:05.339Z
tags: handbook
---

# Data Science Department

This document outlines the purpose, procedures, and best practices of the Data Science Department at the Cook County Assessor's Office.

## Mission

The rationale for having a separate department in the CCAO that specifically deals with data science is similar to that in the private sector: data, apart from the IT systems that store it, is a valuable enterprise asset and must be managed accordingly. This is particularly true for the CCAO, where data is absolutely critical to the mission of the agency.

The mission of the Data Science Department is to build, maintain, organize, and utilize data to create value for taxpayers and facilitate production of annual property assessments. This is separate from the role of the IT department, which is to build and maintain technological enterprise assets. Specifically, the Data Science Department's Mission is to facilitate production of annual property assessments in Cook County by:

  *  Leveraging computing and statistical techniques to estimate property's fair market values;
  *  Leveraging existing data bases to generate insights into valuation processes;
  *  Supporting other CCAO departments in generating machine-readable data and analyzing it;
  *  Maintaining and improving relationships between data sets to increase their value;
  *  Identifying opportunities to generate new valuable data;
  *  Improving intra-office data and statistical literacy.

## Vision

The Data Science Department's vision is to enhance the CCAO's reputation among taxpayers and peers as a technological leader in the field of property tax assessment, and to become known for innovative, ethical, transparent, and fair assessments.

## Core Values

### Precision and Accuracy

The Data Science Department is dedicated to providing precise and accurate values and analysis. It is not enough to get the numbers right some of the time, or on average. We strive for the highest level of precision and accuracy achievable, and we are committed to evaluating ourselves against the fundamental question: "did we get it right?"

### Growth and Innovation

The Data Science Department is committed to continual improvement and innovation. We believe that moving forward is keeping up, and standing still is falling behind. We are committed to learning and testing state-of-the-art algorithms and analytic techniques in our work.

### Transparency and Ethics

The Data Science Department is committed to radical transparency and high ethical standards. We operate under the assumption that all of our work will be available to highly skilled outside reviewers, and that all of our decisions will be scrutinized. As such, we will hold ourselves to the highest ethical standards, and always evaluate our work on the basis of fairness.

### Efficiency and Productivity

The Data Science Department will never stand idle. We will strive to hold ourselves to a rigorous production schedule that results in tangible, high quality, and useful work product on a regular basis. We will strive to hold ourselves to agreed timelines, and take responsibility for missed deadlines or low quality work.

## Project Mangagement

The Data Science Department follows principles of agile project management in its work. This management approach is designed for institutions that produce a large amount of complex, customized, tangible work product in a high-stakes environment. 

In the case of the Data Science Department, these work products are software, algorithms, analysis, and policy recommendations that can have a large impact on property tax assessments in Cook County. Our end users are either internal staff executing the duties of the office, or external stakeholders, like taxpayers or elected representatives.

### Agile Principles

In order to deliver accurate and timely work products, the Data Science Department follows the following agile principles:

#### Continuous Delivery

The Data Science Department produces tools and analyses to support CCAO operations. In order to ensure that these are delivered, development times should be shortened so that products are delivered to the end user more quickly. This is done by limiting the number and complexity of the features in each version. By producing incrementally better versions with shorter build times, the Data Science Department can solicit user feedback more frequently, ultimately increasing the usability of the final product.

#### Embrace Change

The Data Science Department should be very flexible in terms of making changes to tools to suit the end-users' needs. Changes to tools and scripts should be considered even at late stage of development.

#### Developers Work with Management

Senior Data Scientists and developers are regularly involved in managerial discussions so that they have an intimate knowledge of institutional and end-user needs.

#### Measuring Progress

The primary metric by which the Data Science Department judges its work is by functional products. The continuous deployment of increasingly useful, functional tools is really what matters.

#### Self-organization and Initiative

The Deputy Assessor Chief Data Office should not micro-manage staff. The Senior Data Scientists should be given tasks to accomplish and left to determine for themselves how exactly to accomplish that task, within departmental guidelines. Developers and employees should feel free to raise problems quickly with the Deputy Assessor Chief Data Officer so that project goals may be adjusted, where necessary.

#### Reflect and Adapt

At regular intervals the staff of the Data Science Department should reflect on their work to date, and identify ways to become more efficient. Workflow processes should be treated in the same manner as work-product, constantly evolving to meet the demands of the enterprise.

#### Limiting Work-in-Progress 

Staff should not be assigned more than a few issues to work simultaneously. Work should be executed in the order in which it is due. Work should be accomplished within the sprint in which it was assigned. The Deputy Assessor Chief Data Officer and the Senior Data Scientists should adjust their assignments and expectations based on milestone burndown charts and the open issue list.

#### Limiting Mid-sprint Objective Changes 

Staff should not be re-assigned to different issue tickets mid-sprint. This is extremely detrimental to productivity, and wastes time.

#### Agile Practices

In addition to these principles, the Data Science Department adheres to two regular practices:

**Daily Standup**
There is a standing departmental meeting from 8:45-9:00 a.m. which all departmental staff are required to attend. The purpose of this meeting is to discuss the day's tasks and raise issues that staff may have encountered in the previous day.

**Weekly Sprint Planning** 
There is a standing departmental meeting from 9:00 - 10:00 which select senior staff is required to attend. The purpose of this meeting is to discuss the goals of the week, and review the progress of the past week. During this meeting, Issues are created, discussed, modified, and/or assigned, and priorities are reviewed. Milestone burndown charts are reviewed. Members of other departments may attend to keep apprised of progress.


## Database Map

## Organizational Structure

## Training and Continuous Development

# Work Terminal Setup

* [See Onboarding](/handbook/onboarding)
{.links-list}

# Version Control and Workflow

## Repositories

The Data Science Department uses [GitLab](https://gitlab.com/ccao-data-science---modeling) as a workflow and version control tool. The Department's work is oriented around GitLab code repositories, with each repository representing an area of responsibility for the department or a specific service/application that it runs.

### Structure 

Repositories are structured following the best practices laid out in [GitLab Flow](https://docs.gitlab.com/ee/topics/gitlab_flow.html). Each repository has a `master` branch that represents the production version of that code. This `master` branch is *never* committed to directly. Rather, it is updated by merging a separate intermediate branch. This intermediate branch, usually called `staging`, is the long-lived default branch of each repository. Issues are created off of and merged into `staging`, and only once the updated code is tested are those changes then merged into `master`. 

This repository structure has a few advantages:

  *  GitLab's continuous integration and delivery features work well with this workflow
  *  Having a separate staging branch is easy to understand vs other models like Git Flow or GitHub Flow
  *  Breaking changes that might make it into the staging environment are not sent to the production application, meaning users rarely see them

> Not all CCAO repositories are set up this way, but most future ones will be. If you need to work on a repository without a `staging` branch, simply use `master` as the default branch rather than `staging` (make issue branches off of and merge requests into `master`).
{.is-note}

### Public Repositories

These repositories are fully visible to the public, including all issue branches, comments, and documentations. As such, be cautious and courteous with your issue comments and commit messages. Perhaps more importantly, *never commit sensitive material, such as API keys or database passwords to one of these repositories* (or any repository). If sensitive material is committed accidentally, notify a Senior Data Scientist immediately.

### Private Repositories

These repositories are available to the public through FOIA. Only the main branch of each repository is available through FOIA - all other branches are drafts/deliberative materials and are not subject to FOIA.

## Issues

An [issue](https://docs.gitlab.com/ee/user/project/issues/) is a work assignment that should take less than 1-2 work weeks to complete (see [Continuous Delivery](#continuous-delivery)). Work products that take longer than one to two weeks to complete should be broken into multiple issues and, where appropriate, grouped into a milestone (see [Milestones](#milestones)).

Issues may be created by anyone in the organization. Issue deadlines are assigned by the Deputy Assessor Chief Data Officer in consultation with Senior Data Scientists (see [Weekly Sprint Planning](#weekly-sprint-planning)). Issues should always correspond to a [merge request](https://docs.gitlab.com/ee/user/project/merge_requests/creating_merge_requests.html) that closes the issue.

### Labels

All labels should be maintained at the group level. Issues should be labeled so that work is more easily searchable and categorized. Labels are maintained by the Senior Data Scientists.

### Weights

Issues should be assigned weights relative to their importance. Weights are a relative number without a distinct meaning, their actual value is arbitrary. The Data Science Department typically makes higher weights = more important.

## Working Issues

When working an issue, departmental staff should follow these steps:

  *  Make sure the issue has a due date, time estimate, label, and associated merge request. If any of these are missing, notify the issue creator.
  *  Make sure you are tracking the branch associated with this issue in Sourcetree.
  *  Work the issue. Follow all [coding standards](#coding-standards). Use the comment section of the issue to discuss the work. This creates a record that can be referenced in the future.
  *  Upon completion of the work, resolve the WIP status of the merge request and notify your supervisor that you have completed the work.

### Merge Request Approvals

In collaboration with the Senior Data Scientists, the Deputy Assessor Chief Data Officer can set approvals for merge requests. Branches will not be merged into the production branch until all approvals are made.

### Work In Progress Status

Draft working documents are not available under FOIA. The WIP status of branches should not be resolved until the branch is merged into production. Work on branches labeled with WIP status are not available to FOIA. WIP status should be resolved and branches should be merged into production upon the delivery of the work product to either internal or external stakeholders.

## Milestones

Issues are organized into Milestones. Milestones are large projects that take multiple weeks or months to accomplish. Milestones allow the Data Science Department to group issues together based on its long-term goals. The Chief Data Officer creates and tracks Milestones to ensure timely delivery of work-product. Epics can also be used to organize issues and milestones into even larger grouping.

# Coding Standards

All work-product produced by the Data Science Department should be replicable by either a third-party, or another staff member, at any point in the future. This both increases productivity by reducing confusion and technological debt, and facilitates transparency and accountability. In order to ensure replicability of work, departmental staff should adhere to the following coding standards.

## Comments

Comments in R are denoted with a `#` on the commented line. Comments should be frequent and useful. The golden rule of code commenting is: **Code tells you how, comments tells you why**. Code comments should provide context that is not immediately apparent from the code itself. For example, this is **not** a useful comment:

```r
# Filter ratios by quantile
ratios %>%
  filter(between(ratio, quantile(ratio, 0.05), quantile(ratio, 0.95))
```

It doesn't explain why author made the choice they did, what the end result is, or point out any dangers in changing the code. It is a waste of space. A better version of this comment might be:

```r
# Drop extreme outliers from sales ratios in accordance with CCAO SOPs
ratios %>%
  filter(between(ratio, quantile(ratio, 0.05), quantile(ratio, 0.95))
```

This comment provides context, it tells you **why** this code was written. 

Of course, there are still cases where the function of especially complicated pieces of code is not immediately obvious. In this case, comments should both explain what the code is doing and explain why it's doing that thing.

## Code Style

Code style is important. It makes your code more readable and ensures that other people working on the same project use the same syntax. The CCAO Data Science Department mostly follows the [Tidyverse Style Guide](https://style.tidyverse.org/). This is the most widely accepted style for R, but it is also quite lengthy an difficult to remember.

Fortunately, two packages exist that support the Tidyverse style guide:

  *  [styler](https://cran.r-project.org/web/packages/styler/vignettes/introducing_styler.html) allows you to automagically restyle text, files, or entire projects. It includes an RStudio add-in, the easiest way to re-style existing code.
  *  [lintr](https://github.com/jimhester/lintr) automatically checks your code for style errors.

These packages make it easy to conform to the Tidyverse style guide. Simply run `styler` and then `lintr` on your entire project before each commit. This will automatically restyle your code and then tell you if there are any remaining issues.

> The Data Science Department does not strictly enforce style guide on most repositories. However, certain very important repositories (R packages) will automatically reject merges that doesn't conform to Tidyverse style. 
{.is-warning}

### Program Headers

### Integrity Checks


### Simplicity


### Data Architecture Standards


Developer Engagement Program
============================
