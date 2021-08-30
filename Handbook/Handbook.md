# The Data Department

This document outlines the purpose, procedures, and best practices of the Data Department at the Cook County Assessor's Office (CCAO).

The Data Department's primary responsibilities are to:

* Estimate the value of over 1.8 million parcels in Cook County
* Create tools and software to support the broader mission of the CCAO
* Handle other data-related tasks such as reporting, creating analyses, and collecting new data

The rationale for having a separate data science department is similar to that of the private sector: data, apart from the IT systems that store it, is a valuable enterprise asset and must be managed accordingly. This is particularly true for the CCAO, where data is absolutely critical to the mission of the agency.

# Mission, Vision, and Values

See [Mission, Vision, and Values](Handbook/Mission Vision Values)

## Core Technical Competencies

* **R**
* **Shiny**
* **Git**
* **Excel**
* **Markdown**
* **Leadership**
* **SQL**

## Project Management

The Data Department follows the principles of agile project management. This management approach is designed for institutions that produce a large amount of complex, customized, tangible work product in a high-stakes environment.

For the Data Department, these work products are software, algorithms, analyses, and policy recommendations that can have a large impact on property tax assessments in Cook County. Our end-users are either internal staff executing the duties of the office, or external stakeholders, like taxpayers or elected representatives.

In order to deliver accurate and timely work products, the Data Department adheres to the following agile principles:

**Continuous Delivery** - The Data Department produces tools and analyses to support CCAO operations. In order to ensure that these are delivered, development times should be shortened and products delivered to end-users more quickly. This is done by limiting the number and complexity of the features in each version. By producing incrementally better versions with shorter build times, the Data Department can solicit user feedback more frequently, ultimately increasing the usability of the final product.

**Embrace Change** - The Data Department should be flexible and able to accommodate changes to suit end-users' needs. Changes to tools and scripts should be considered even at late stages of development.

**Developers Work with Management** - Senior Data Scientists and developers should be regularly involved in managerial discussions so they have an intimate knowledge of institutional and end-user needs.

**Measuring Progress** - The Data Department should judge its work by the functionality of its products. The continuous deployment of increasingly useful, functional tools is what really matters.

**Self-organization and Initiative** - The Deputy Assessor Chief Data Officer should not micro-manage staff. Senior Data Scientists should determine for themselves how to accomplish tasks, within departmental guidelines. Developers and employees should feel free to raise problems quickly with the Deputy Assessor Chief Data Officer so that project goals may be adjusted, where necessary.

**Reflect and Adapt** - At regular intervals the staff of the Data Department should reflect on their work and identify ways to increase efficiency. Workflow processes should be treated in the same manner as work-product; they should evolve to meet the demands of the enterprise.

**Limiting Work-In-Progress** - Staff should not be assigned more than a few issues to work simultaneously. Work should be executed in order of priority (see [Labels](#Labels)). Work should be accomplished within the sprint in which it was assigned. The Deputy Assessor Chief Data Officer and Senior Data Scientists should adjust their assignments and expectations based on milestone burndown charts and the open issue list.

**Limiting Mid-sprint Objective Changes** - Staff should not be re-assigned to different issue tickets mid-sprint. This is detrimental to productivity and wastes time.

## Organizational Structure

The Data Department is broken into two sub-departments: 

 1. **Data Science** is responsible for building models and tools that enhance the CCAO's mission. It creates and maintains applications, pipelines, models, and databases.
 2. **Data Analytics** is responsible for reporting on and analyzing the performance of the Data Department and the CCAO. It creates extracts, writes reports, and builds dashboards.

An organization chart can be found [here](https://gitlab.com/ccao-data-science---modeling/people/talent/-/blob/master/documents/Data%20Science%20Organization%20Chart.pdf).

### Leadership Pipelines 

The Data Science department is currently building a framework for career advancement. A 'leadership pipeline' is a well-articulated set of criteria that describes how each member of the team can advance their career to the next step in the pipeline. We anticipate two different pipeline tracks:

**Technical Track** - This track terminates at the level of Senior Data Scientist and is designed to cultivate highly capable data scientists. Staff in this track focus on acquiring and maintaining a wide array of advance skills in computer science, statistics, and application programming.

**Leadership Track** - This track terminates at the level of Chief Data Officer and is designed to cultivate policy leaders that create and implement data-informed policy. Staff in this track are expected to master statistical concepts and advanced data analysis in excel, as well as intuition about how to create value for the organization and its stakeholders.

A more detailed description of this pipeline can be found in [these slides](https://gitlab.com/ccao-data-science---modeling/people/talent/-/blob/master/pipeline/Data%20Science%20Leadership%20Pipeline.pptx) and [this excel workbook](https://gitlab.com/ccao-data-science---modeling/people/talent/-/blob/master/pipeline/Leadership%20Pipeline.xlsx).

## Performance Review 

The Data Department is committed to fostering the development of its members. We believe that 360 performance evaluation is necessary to foster the development of both employees and managers. Performance reviews are designed to help employees identify and eliminate barriers to their individual professional advancement. There are four components to the performance review process.

Each employee's performance review will be coordinated using a GitLab issue populated from a [template](https://gitlab.com/ccao-data-science---modeling/people/employment/-/tree/master/.gitlab/issue_templates). The title of the issue should be "Annual Performance Review: [Employee Name]." The due date should be two days after the scheduled performance review meeting.

### Self-evaluation

Each employee should complete a [self-evaluation](https://gitlab.com/ccao-data-science---modeling/people/employment/-/blob/master/forms/performance-eval/360%20Evaluation%20-%20Employee%20Self%20Evaluation.docx) of their work performance prior to participating in a performance review meeting with their supervisor. The purpose of the self-evaluation is two-fold. First, it helps employees understand the framework under which they are being evaluated. Second, by comparing an employee's self-evaluation to their supervisor's evaluation, we can identify instances where the employee was unable to anticipate their supervisor's comments. The annual performance review should now be the first time an employee is made aware of issues. 

Employees can choose not to share their self-evaluations with their supervisor.

### Supervisor Evaluation

Each employee should complete a supervisor evaluation appropriate to the level of their supervisor. This evaluation will be shared with the supervisor and is designed to help managers identify areas of weakness in their management practices. Supervisor evaluations are specific to each supervisory level:

* [Deputy](https://gitlab.com/ccao-data-science---modeling/people/employment/-/blob/master/forms/performance-eval/360%20Evaluation%20-%20Employee%20Evaluating%20Deputy.docx)
* Director
* Senior Data Scientist
 
Employees can choose not to share their supervisor-evaluations with their supervisor. 

### Peer Evaluation

Employees can request [peer evaluations](https://gitlab.com/ccao-data-science---modeling/people/employment/-/blob/master/forms/performance-eval/360%20Evaluation%20-%20Employee%20Peer%20Evaluation.docx) from another employee of the Cook County Assessor's Office. This peer cannot be in the supervisory chain for the employee, and must have worked with the employee on a significant project, or regularly as part of their assigned duties. Peer evaluations will be shared with both the employee and the supervisor. Supervisors cannot request peer evaluations for their employees.

### Performance Evaluation Templates

Performance evaluations are a two-part process. First, the evaluator creates two issue tickets in the [employment repository](https://gitlab.com/ccao-data-science---modeling/people/employment). The first issue ticket covers the work the evaluator and evaluatee must complete *prior* to the performance management meeting. The second issue ticket covers the meeting itself, and is blocked by the first ticket. 

The first issue ticket should be populated by the correct template, depending on the job title of the evaluator, and the Shakman exempt status of the evaluatee. The grid below indicates which template should be used.

| Evaluator | Evaluatee | Template Name |
| :---------| :---------|:--------------|
| Deputy    | Shakman exempt | [Deputy evaluating Shakman exempt ](https://gitlab.com/ccao-data-science---modeling/people/employment/-/blob/master/.gitlab/issue_templates/deputy-performance-eval-preparation-exempt.md) |
| Deputy    | Shakman non-exempt | [Deputy evaluating Shakman non-exempt](https://gitlab.com/ccao-data-science---modeling/people/employment/-/blob/master/.gitlab/issue_templates/deputy-performance-eval-preparation-non-exempt.md) |
| Non deputy    | Shakman Exempt | TBD |
| Non deputy    | Shakman Non-exempt | TBD |

The supervisor and employee complete the performance evaluation process as outlined in the employee handbook.

# Work Terminal Setup

* [See Onboarding](People/Onboarding)

# Working Remotely 

Due to the COVID global pandemic, the Data Department is working 100% remotely until further notice. This section contains tips, tricks, and requirements for working with CCAO Data Science remotely.

* **Workspace:** Make sure you have a quite space with good internet access from which to work. Please make sure you have a microphone to participate in remote meetings. A camera is also a good thing to have, though not required.
* **Socializing:** The Data Department tries to facilitate regular social events, time and COVID permitting. Please feel free to join these, though they are not mandatory in any way.

## Agile Project Management Practices

* **Weekly Sprint Planning:** 8:45 - 9:30 AM CT every Monday, the Data Science team meets to discuss ongoing work, problems, and new projects. Please be prepared to discuss any questions you have about your work during these meetings.
* **Daily Standup:** Each day when you start work, please message the General chat on Microsoft Teams with a short description of the work you plan to do that day.
* **Monthly Sprint Reviews:** At the end of each month, Senior Data Scientists, Director of Data Analytics, and the Chief Data Officer should be prepared to present updates on the projects they own. Other staff will present as needed.

## Communicating in a Remote Work Environment

Data Science staff are often working on multiple projects simultaneously. This means that our communication style and norms are somewhat different from those of a co-located team. Here are a few points to highlight the differences between communicating in a remote environment, and communicating in a co-located one.

* **Low-context Communication:**  Assume that the person you are communicating with does not know the context of your work and/or question. A simple question like 'What's the difference between `AS_HEADT` and `AS_HEADBR`?' actually has a very lengthy response, depending on the context of the question. In order to make communication efficient, try signaling the context of the question. E.g. "I am trying to report 'final' assessed values for 2019 to compare to 'initial' assessed values. Which HEAD file should I use for each set?" Take the extra time to contextualize your question.
* **Asynchronous Communication:** In general, each team member should not expect other team members to respond quickly to questions. This is due to the variety and timing of the work we do. When you hit a stumbling block and need to ask a clarifying question, do so, and then work on a different task while you wait for a response. Similarly, unless otherwise indicated, do not interpret questions from other team members as requiring an immediate response.

# Version Control and Workflow

## Repositories

The Data Department uses [GitLab](https://gitlab.com/ccao-data-science---modeling) as a workflow and version control tool. The Department's work is oriented around GitLab code repositories, with each repository representing an area of responsibility for the department or a specific service/application that it runs.

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

The Data Department uses 4 scoped labels: priority, type, status, and stakeholder. All issues should have 1 variant of each of these labels, in addition to any project-specific labels. When triaging issues, the following priority intentions should be used:

| Label                | Importance | Intention                                                                                               |
|----------------------|------------|---------------------------------------------------------------------------------------------------------|
| `priority::critical` | Critical   | We will address this as soon as possible, typically within the next few days                            |
| `priority::high`     | High       | We will address this as capacity becomes available, typically within the next few weeks                 |
| `priority::medium`   | Medium     | We will address this but have higher priority items. It will be addressed within the next 6-12 months   |
| `priority::low`      | Low        | We don't have visibility on when this will be addressed but want to keep it back-of-mind                |

For a full list of labels and their descriptions, see the [Labels section](https://gitlab.com/groups/ccao-data-science---modeling/-/labels) of the CCAO group.

### Weights

Issues should be assigned weights relative to their importance. Weights are a relative number without a distinct meaning, their actual value is arbitrary. The Data Department typically makes higher weights = more important.

## Working Issues

When working an issue, departmental staff should follow these steps:

  *  Make sure the issue has a due date, time estimate, label, and associated merge request. If any of these are missing, notify the issue creator.
  *  Make sure you are tracking the branch associated with this issue in Sourcetree.
  *  Work the issue. Follow all [coding standards](#coding-standards). Use the comment section of the issue to discuss the work. This creates a record that can be referenced in the future.
  *  Upon completion of the work, resolve the WIP status of the merge request and notify your supervisor that you have completed the work.

### Merge Request Approvals

In collaboration with the Senior Data Scientists, the Deputy Assessor Chief Data Officer can set approvals for merge requests. Branches will not be merged into the production branch until all approvals are made.

### Work in Progress Status

Draft working documents are not available under FOIA. The WIP status of branches should not be resolved until the branch is merged into production. Work on branches labeled with WIP status are not available to FOIA. WIP status should be resolved and branches should be merged into production upon the delivery of the work product to either internal or external stakeholders.

## Milestones

Issues are organized into Milestones. Milestones are large projects that take multiple weeks or months to accomplish. Milestones allow the Data Department to group issues together based on its long-term goals. The Chief Data Officer creates and tracks Milestones to ensure timely delivery of work-product. Epics can also be used to organize issues and milestones into even larger grouping.

# Coding Standards

All work-product produced by the Data Department should be replicable by either a third-party, or another staff member, at any point in the future. This both increases productivity by reducing confusion and technological debt, and facilitates transparency and accountability. In order to ensure replicability of work, departmental staff should adhere to the following coding standards.

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

Code style is important. It makes your code more readable and ensures that other people working on the same project use the same syntax. The CCAO Data Department mostly follows the [Tidyverse Style Guide](https://style.tidyverse.org/). This is the most widely accepted style for R, but it is also quite lengthy an difficult to remember.

Fortunately, two packages exist that support the Tidyverse style guide:

  *  [styler](https://cran.r-project.org/web/packages/styler/vignettes/introducing_styler.html) allows you to automagically restyle text, files, or entire projects. It includes an RStudio add-in, the easiest way to re-style existing code.
  *  [lintr](https://github.com/jimhester/lintr) automatically checks your code for style errors.

These packages make it easy to conform to the Tidyverse style guide. Simply run `styler` and then `lintr` on your entire project before each commit. This will automatically restyle your code and then tell you if there are any remaining issues.

> :warning: The Data Department does not strictly enforce Tidyverse style for most repositories. However, certain very important repositories (R packages) will automatically reject merges that doesn't conform to Tidyverse style.

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

