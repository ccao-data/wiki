# Data Science Department Handbook

# Data Science Department

This document outlines the purpose, procedures, and best practices of the Data Science Department at the Cook County Assessor's Office.

The rationale for having a separate department in the CCAO that specifically deals with data science is similar to that in the private sector: data, apart from the IT systems that store it, is a valuable enterprise asset and must be managed accordingly. This is particularly true for the CCAO, where data is absolutely critical to the mission of the agency.

# Mission, Vision, and Values

See [Mission, Vision, & Values](handbook/mission vision values.md)

## Core Technical Competencies

### R

### Shiny

### Git

### Excel

### Markdown

### Leadership

### SQL

## Project Mangagement

The Data Science Department follows principles of agile project management in its work. This management approach is designed for institutions that produce a large amount of complex, customized, tangible work product in a high-stakes environment.

In the case of the Data Science Department, these work products are software, algorithms, analysis, and policy recommendations that can have a large impact on property tax assessments in Cook County. Our end users are either internal staff executing the duties of the office, or external stakeholders, like taxpayers or elected representatives.

In order to deliver accurate and timely work products, the Data Science Department follows the following agile principles:

**Continuous Delivery** - The Data Science Department produces tools and analyses to support CCAO operations. In order to ensure that these are delivered, development times should be shortened so that products are delivered to the end user more quickly. This is done by limiting the number and complexity of the features in each version. By producing incrementally better versions with shorter build times, the Data Science Department can solicit user feedback more frequently, ultimately increasing the usability of the final product.

**Embrace Change** - The Data Science Department should be very flexible in terms of making changes to tools to suit the end-users' needs. Changes to tools and scripts should be considered even at late stage of development.

**Developers Work with Management** - Senior Data Scientists and developers are regularly involved in managerial discussions so that they have an intimate knowledge of institutional and end-user needs.

**Measuring Progress** - The primary metric by which the Data Science Department judges its work is by functional products. The continuous deployment of increasingly useful, functional tools is really what matters.

**Self-organization and Initiative** - The Deputy Assessor Chief Data Office should not micro-manage staff. The Senior Data Scientists should be given tasks to accomplish and left to determine for themselves how exactly to accomplish that task, within departmental guidelines. Developers and employees should feel free to raise problems quickly with the Deputy Assessor Chief Data Officer so that project goals may be adjusted, where necessary.

**Reflect and Adapt** - At regular intervals the staff of the Data Science Department should reflect on their work to date, and identify ways to become more efficient. Workflow processes should be treated in the same manner as work-product, constantly evolving to meet the demands of the enterprise.

**Limiting Work-in-Progress** - Staff should not be assigned more than a few issues to work simultaneously. Work should be executed in the order in which it is due. Work should be accomplished within the sprint in which it was assigned. The Deputy Assessor Chief Data Officer and the Senior Data Scientists should adjust their assignments and expectations based on milestone burndown charts and the open issue list.

**Limiting Mid-sprint Objective Changes** - Staff should not be re-assigned to different issue tickets mid-sprint. This is extremely detrimental to productivity, and wastes time.

**Agile Practices** - In addition to these principles, the Data Science Department adheres to two regular practices:

 * *Daily Standup* - There is a standing departmental meeting from 8:45-9:00 a.m. which all departmental staff are required to attend. The purpose of this meeting is to discuss the day's tasks and raise issues that staff may have encountered in the previous day.
 * *Weekly Sprint Planning* - There is a standing departmental meeting from 8:45 - 9:30 a.m. which select senior staff is required to attend. The purpose of this meeting is to discuss the goals of the week, and review the progress of the past week. During this meeting, Issues are created, discussed, modified, and/or assigned, and priorities are reviewed. Milestone burndown charts are reviewed. Members of other departments may attend to keep apprised of progress.

## Organizational Structure

The Data Science Department into two sub-departments: Data Science, which is responsible for building models and tools that enhance the CCAO's mission, and Data Analytics, which is responsible for reporting on and analyzing the performance of the Data Science Department. An [organisation chart](https://gitlab.com/ccao-data-science---modeling/ccao_ds_training/-/blob/master/Documentation/Data%20Science%20Organisation%20Chart.pdf) for the department can be found on the common drive.

There are two units inside of the Data Science Department: Data Science and Data Analytics. These units perform reltated, but different types of work. The Data Science unit builds and maintains applications, pipelines, and databases. The Data Analytics department provides data extracts, writes reports, and builds dashboards. 

### Leadership pipelines 

The Data Science department is building a rigorous framework for career advancement. A 'leadership pipeline' is a well-articulated set of criteria that describes how each member of the team can advance their careers to the next step in the pipeline. We anticipate two different pipelines: tracks

** Technical Track:** This track terminates at the level of Sr. Data Scientist, and is designed to cultivate highly capable data scientists. Staff in this track focus on aquiring and maintaining a wide array of advance skills in computer science, statistics, and application programming in R and Shiny.

** Leadership Track:** This track termins at the level of Chief Data Officer, and is designed to cultivate policy leaders that create and implement data-informed policy. Staff in this track are expected to master statistical concepts and advanced data analysis in excel, as well as intuition about creating value for the organisation.

A more detailed description of this pipeline can be found in [these slides](https://gitlab.com/ccao-data-science---modeling/ccao_ds_training/-/blob/master/Slides/Data%20Science%20Leadership%20Pipeline.pptx) and [this excel workbook](https://gitlab.com/ccao-data-science---modeling/ccao_ds_training/-/blob/master/Documentation/Leadership%20Pipeline.xlsx).

## Performance Review 

The data science department is committed to fostering the development of its members. We believe that 360 performance evaluation is necessary to foster the development of both employees and managers. Performance reviews are designed to help employees identify and eliminate barriers to their individual professional advancement. There are four components to the performance review process.

Each employee's performance review will be coordinated using a GitLab issue popuated from a [template](https://gitlab.com/ccao-data-science---modeling/career-development/employment/-/blob/master/.gitlab/issue_templates/ds-performance%20evaluation.md). The title of the issue should be "Annual Performance Review: [Employee Name]." The due date should be two days after the scheduled performance review meeting.

### Self-evaluation

Each exmployee should complete a [self-evaluation](https://gitlab.com/ccao-data-science---modeling/career-development/employment/-/blob/master/forms/360%20Evaluation%20-%20Employee%20Self%20Evaluation.docx) of their work performance prior to participating in a performance review meeting with their supervisor. The purpose of the self-evaluation is two-fold. First, it helps employees understand the framework under which they are being evaluated. Second, by comparing an employee's self-evaluation to their supervisor's evaluation, we can identify instances where the employee was unable to anticipate their supervisor's comments. The annual performance review should now be the first time an employee is made aware of issues. 

Employees can choose not to share their self-evaluations with their supervisor.

### Supervisor evalution

Each exmployee should complete a supervisor evaluation appropriate to the level of their supervisor. This evaluation will be shared with the supervisor and is designed to help managers identify areas of weakness in their management practices. Supervisor evaluations are specific to each supervisory level:
* [Deputy](https://gitlab.com/ccao-data-science---modeling/career-development/employment/-/blob/master/forms/360%20Evaluation%20-%20Employee%20Evaluating%20Deputy.docx)
* Director
* Senior Data Scientist
 
Employees can choose not to share their supervisor-evaluations with their supervisor. 

### Peer evaluation

Employees can request [peer evaluations](https://gitlab.com/ccao-data-science---modeling/career-development/employment/-/blob/master/forms/360%20Evaluation%20-%20Employee%20Evaluating%20Deputy.docx) from another employee of the Cook County Assessor's Office. This peer cannot be in the supervisory chain for the employee, and must have worked with the employee on a significant project, or regularly as part of their assigned duties. Peer evalautions will be shared with both the employee and the supervisor. Supervisors cannot request peer evaluations for their employees.

### Performance evaluation templates

Performance evalautions are a two-part process. First, the evaluator creates two issue tickets in the [employment repository](https://gitlab.com/ccao-data-science---modeling/career-development/employment). The first issue ticket covers the work the evaluator and evaluateee must complete *prior* to the performance management meeting. The second issue ticket covers the meeting itself, and is blocked by the first ticket. 

The first issue ticket should be populated by the correct template, depending on the job title of the evaluator, and the Shakman exempt status of the evaluatee. The grid below indicates which template should be used.

| Evaluator | Evaluatee | Template name |
| :---------| :---------|:--------------|
| Deputy    | Shakman exempt | [Deputy evaluating Shakman exempt ](https://gitlab.com/ccao-data-science---modeling/career-development/employment/-/blob/master/.gitlab/issue_templates/ds-deputy_performance_eval_preparation_exempt.md) |
| Deputy    | Shakman non-exempt | ds-ds-deputy_performance_eval_preparation_non_exempt |
| Non deputy    | Shakman exempt | TBD |
| Non deputy    | Shakman non-exempt | TBD |

The supervisor and employee complete the performance evaluation process as outlined in the employee handbook.


# Work Terminal Setup

* [See Onboarding](onboarding.md)

# Working Remotely 

Due to the COVID global pandemic, the Data Science Department is working 100% remotely until further notice. This section contains tips, tricks, and requirements for working with CCAO Data Science remotely.

* **Workspace:** Make sure you have a quite space with good internet access from which to work. Please make sure you have a microphone to participate in remote meetings. A camera is also a good thing to have, though not required.
* **Socializing:** The Data Science Department tries to facilitate regular social events, time and COVID permitting. Please feel free to join these, though they are not mandatory in any way.

## Agile Project Management Practices

* **Weekly sprint planning:** 8:45 - 9:30 AM CT every Monday, the Data Science team meets to discuss ongoing work, problems, and new projects. Please be prepared to discuss any questions you have about your work during these meetings.
* **Daily Standup:** Each day when you start work, please message the General chat on Microsoft Teams with a short description of the work you plan to do that day.
* **Monthly sprint reviews:** At the end of each month, Senior Data Scientists, Director of Data Analytics, and the Chief Data Officer should be prepared to present updates on the projects they own. Other staff will present as needed.

## Communicating in a remote work environment

Data Science staff are often working on multiple projects simultaneously. This means that our communication style and norms are somewhat different from those of a co-located team. Here are a few points to highlight the differences between communicating in a remote environment, and communicating in a co-located one.

* **Low-context communication:**  Assume that the person you are communicating with does not know the context of your work and/or question. A simple question like 'What's the difference between AS_HEADT and AS_HEADBR?' actually has a very lengthy response, depending on the context of the question. In order to make communication efficient, try signaling the context of the question. E.g. "I am trying to report 'final' assessed values for 2019 to compare to 'initial' assessed values. Which HEAD file should I use for each set?" Take the extra time to contextualize your question.
* **Asynchronous Communication:** In general, each team member should not expect other team members to respond quickly to questions. This is due to the variety and timing of the work we do. When you hit a stumbling block and need to ask a clarifying question, do so, and then work on a different task while you wait for a response. Similarly, unless otherwise indicated, do not interpret questions from other team members as requiring an immediate response.


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

> :warning: The Data Science Department does not strictly enforce Tidyverse style for most repositories. However, certain very important repositories (R packages) will automatically reject merges that doesn't conform to Tidyverse style.

## Commit Style

People who frequently use git follow a [de-facto set of rules](https://commit.style/) for writing good commit messages. A detailed breakdown of those rules can be found [here](https://chris.beams.io/posts/git-commit/), but they can largely be condensed to:

  1.  Separate subject from body with a blank line
  2.  Limit the subject line to 50 characters
  3.  Capitalize the subject line
  4.  Do not end the subject line with a period
  5.  Use the imperative mood in the subject line (Use "Fix bug" instead of "Fixed bug")
  6.  Wrap the body at 72 characters
  7.  Use the body to explain what and why vs. how

Following these rules makes reading commit logs much easier, which is extremely helpful when working on projects with multiple people or even just when looking back at your own commit history.

