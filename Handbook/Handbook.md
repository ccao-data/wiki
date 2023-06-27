# The Data Department

This document outlines the purpose, procedures, and best practices of the Data Department at the Cook County Assessor's Office (CCAO).

The Data Department's primary responsibilities are to:

* Estimate the value of over 1.8 million parcels in Cook County
* Create tools and software to support the broader mission of the CCAO
* Handle other data-related tasks such as reporting, creating analyses, and collecting new data

The rationale for having a separate data department is similar to that of the private sector: data, apart from the IT systems that store it, is a valuable enterprise asset and must be managed accordingly. This is particularly true for the CCAO, where data is absolutely critical to the mission of the agency.

# Mission, Vision, and Values

See [Mission, Vision, and Values](Mission-Vision-Values.md)

## Core Technical Competencies

* **R**
* **Git**
* **SQL**
* **Excel**
* **Markdown**
* **Leadership**
* **Command Line**

For more information, see the [People repository](https://github.com/ccao-data/people).

## Project Management

The Data Department follows the principles of agile project management. This management approach is designed for institutions that produce a large amount of complex, customized, tangible work product in a high-stakes environment.

For the Data Department, these work products are software, algorithms, analyses, and policy recommendations that can have a large impact on property tax assessments in Cook County. Our end-users are either internal staff executing the duties of the office, or external stakeholders, like taxpayers or elected representatives.

In order to deliver accurate and timely work products, the Data Department adheres to the following agile principles:

**Continuous Delivery** - The Data Department produces tools and analyses to support CCAO operations. In order to ensure that these are delivered, development times should be shortened and products delivered to end-users more quickly. This is done by limiting the number and complexity of the features in each version. By producing incrementally better versions with shorter build times, the Data Department can solicit user feedback more frequently, ultimately increasing the usability of the final product.

**Embrace Change** - The Data Department should be flexible and able to accommodate changes to suit end-users' needs. Changes to tools and scripts should be considered even at late stages of development.

**Developers Work with Management** - Senior Data Scientists and developers should be regularly involved in managerial discussions so they have an intimate knowledge of institutional and end-user needs.

**Measuring Progress** - The Data Department should judge its work by the functionality of its products. The continuous deployment of increasingly useful, functional tools is what really matters.

**Self-Organization and Initiative** - The Deputy Assessor Chief Data Officer should not micro-manage staff. Senior Data Scientists should determine for themselves how to accomplish tasks, within departmental guidelines. Developers and employees should feel free to raise problems quickly with the Deputy Assessor Chief Data Officer so that project goals may be adjusted, where necessary.

**Reflect and Adapt** - At regular intervals the staff of the Data Department should reflect on their work and identify ways to increase efficiency. Workflow processes should be treated in the same manner as work-product; they should evolve to meet the demands of the enterprise.

**Limiting Work-In-Progress** - Staff should not be assigned more than a few issues to work simultaneously. Work should be executed in order of priority. Work should be accomplished within the sprint in which it was assigned. The Deputy Assessor Chief Data Officer and Senior Data Scientists should adjust their assignments and expectations based on milestone burndown charts and the open issue list.

**Limiting Mid-Sprint Objective Changes** - Staff should not be re-assigned to different issue tickets mid-sprint. This is detrimental to productivity and wastes time.

## Organizational Structure

The Data Department is broken into two sub-departments:

1. **Data Science** is responsible for building models and tools that enhance the CCAO's mission. It creates and maintains applications, pipelines, models, and databases.
2. **Data Analytics** is responsible for reporting on and analyzing the performance of the Data Department and the CCAO. It creates extracts, writes reports, and builds dashboards.

A full CCAO organizational chart can be [found on the CCAO intranet](http://intranet/filedownloads/CCAOOrgChart.pdf).

### Leadership Pipelines

The Data Department is currently building a framework for career advancement. A 'leadership pipeline' is a well-articulated set of criteria that describes how each member of the team can advance their career to the next step in the pipeline. We anticipate two different pipeline tracks:

**Technical Track** - This track terminates at the level of Senior Data Scientist and is designed to cultivate highly capable data scientists. Staff in this track focus on acquiring and maintaining a wide array of advance skills in computer science, statistics, and application programming.

**Leadership Track** - This track terminates at the level of Chief Data Officer and is designed to cultivate policy leaders that create and implement data-informed policy. Staff in this track are expected to master statistical concepts and advanced data analysis in excel, as well as intuition about how to create value for the organization and its stakeholders.

A more detailed description of this pipeline can be found in the [People repository](https://github.com/ccao-data/people).

## Performance Reviews and Feedback

The Data Department believes consistent performance evaluation is necessary for both employees and managers. Formal performance evaluations help employees identify and eliminate barriers to their individual professional success, while informal feedback sessions help employees and managers identify any performance/communication issues and keep the department running smoothly.

### Formal Performance Evaluation

For information on the formal CCAO performance evaluation process, see [Section 3 of the CCAO Employee Handbook](http://intranet/filedownloads/EmployeeHandbook.pdf).

### Informal Feedback

In addition to the formal performance evaluation process, the Data Department maintains a separate process for sharing informal feedback. The ultimate goal of this process is to make the Data Department function as well as possible by:

* Raising any performance issues early, rather than at the formal evaluation stage
* Providing a mechanism to resolve internal conflicts within the Data Department
* Allowing employees and interns to provide feedback to their supervisor

#### Check-ins

Interns and new employees have weekly check-ins with their immediate supervisor. During these check-ins, the supervisor will:

* Ensure that assigned work is on-track and likely to meet any upcoming deadlines
* Provide feedback on work completed so far
* Try to remove any blockers preventing further work (e.g. give guidance on a particularly difficult coding problem)

#### 1-on-1s

Every 2 weeks all employees will have a 1-on-1 with their immediate supervisor. The goal of this meeting is to exchange feedback, both from supervisor to employee and from employee to supervisor (i.e. managing up).

This meeting is also typically used to discuss organization goals, manage ongoing projects, discuss any upcoming blockers, and ensure that the employee has everything they need to perform optimally.

# CCAO Documents and Forms

* See the [CCAO HR intranet site](http://intranet/humanresources.aspx) for general forms and information, including the Employee Handbook, Employment Plan, and pay schedule

# Work Terminal Setup

* See [Onboarding](/People/Onboarding.md) for computer and equipment setup
* See the [How-To](/How-To) section of the wiki for further tutorials and troubleshooting

# Working Remotely

The Data Department works a hybrid schedule typically consisting of 2 days in-office and 3 days remote. All employees share the same in-office days, usually Wednesday and Thursday. This section contains tips, tricks, and requirements for working remotely.

* **Workspace:** Make sure you have a quite space with good internet access from which to work. Please make sure you have a microphone to participate in remote meetings. A camera is also a good thing to have, though not required.
* **Socializing:** The Data Department tries to facilitate regular social events, time permitting. Please feel free to join these, though they are not mandatory in any way.

## Agile Project Management Practices

* **Daily Standup:** 9:00 - 9:15 AM CT every day. Employees are required to attend, interns may optionally attend. Each attendee states the following:
  1. What they worked on the prior work day
  2. What they plan to work on today
  3. Any blockers impeding their progress
* **Monthly Sprint Review, Retrospective, and Planning:** Once per month, Senior Data Scientists, Directors, and the Chief Data Officer do the following:
  1. Review projects they've completed or worked on in the past month. Each attendee will briefly present their results, discuss blockers, and lay out any next steps.
  2. Participate in an informal retrospective of the previous month, outlining what worked, what didn't, what needs attention, etc.
  3. Create project plans and issues for the next month, starting with a rough outline of "things that need to be done" and ending with digestible, actionable issues.

## Communicating in a Remote Work Environment

Data Department staff are often working on multiple projects simultaneously. This means that our communication style and norms are somewhat different from those of a co-located team. Here are a few points to highlight the differences between communicating in a remote environment, and communicating in a co-located one.

* **Low-Context Communication:** Assume that the person you are communicating with does not know the context of your work and/or question. A simple question like 'What's the difference between `AS_HEADT` and `AS_HEADBR`?' actually has a very lengthy response, depending on the context of the question. In order to make communication efficient, try signaling the context of the question. E.g. "I am trying to report 'final' assessed values for 2019 to compare to 'initial' assessed values. Which HEAD file should I use for each set?" Take the extra time to contextualize your question.
* **Asynchronous Communication:** In general, each team member should not expect other team members to respond quickly to questions. This is due to the variety and timing of the work we do. When you hit a stumbling block and need to ask a clarifying question, do so, and then work on a different task while you wait for a response. Similarly, unless otherwise indicated, do not interpret questions from other team members as requiring an immediate response.

# Version Control and Workflow

## Repositories

The Data Department uses [GitHub](https://github.com/ccao-data) as a workflow and version control tool. The Department's work is oriented around GitHub code repositories, with each repository representing an area of responsibility for the department or a specific service/application that it runs.

### Structure

The Data Department uses two standard git branching strategies for most repositories, GitHub flow and GitLab flow.

#### GitHub Flow

For most repositories, the Data Department uses [GitHub flow](https://docs.github.com/en/get-started/quickstart/github-flow). This system uses a simple branch-per-issue workflow with a single main branch, typically called `main` or `master`. In this structure, the main branch is occasionally committed to directly.

This repository structure has a few advantages:

* It is simple and easy-to-maintain
* There is only one definitive version of the code
* The main branch should always be in a deployable state

Typical CCAO repositories that use this structure include:

* Models
* Packages
* One-off reports

#### GitLab Flow

More complicated projects are structured using [GitLab flow](https://docs.gitlab.com/ee/topics/gitlab_flow.html). This system has a `main` or `master` branch that represents the production version of the code. The production branch is *never* committed to directly. Rather, it is updated by merging a separate intermediate branch. This intermediate branch, usually called `staging`, is the long-lived default branch of each repository. Issues are created off of and merged into `staging`, and only once the updated code is tested are those changes then merged into `master`.

This repository structure has a few advantages:

* Continuous integration and delivery features work well with this workflow
* Having a separate staging branch is easy to understand vs other models like Git flow
* Breaking changes that might make it into the staging environment are not sent to the production application, meaning users rarely see them

Typical CCAO repositories that use this structure include:

* Applications
* Services

### Public Repositories

Most CCAO repositories are fully visible to the public, including all issue branches, comments, and documentations. As such, be cautious and courteous with your issue comments and commit messages. Perhaps more importantly, *never commit sensitive material, such as API keys or database passwords to CCAO repositories* (or any repository). If sensitive material is committed accidentally, notify a Senior Data Scientist or Director immediately.

### Private Repositories

These repositories are available to the public through FOIA. Only the main branch of each repository is available through FOIA - all other branches are drafts/deliberative materials and are not subject to FOIA.

## Issues

An [issue](https://docs.github.com/en/issues/tracking-your-work-with-issues/about-issues) is a work assignment that should take less than 1-2 work weeks to complete. Work products that take longer than one to two weeks to complete should be broken into multiple issues and, where appropriate, grouped into a milestone (see [Milestones](#milestones)).

Issues may be created by anyone in the organization. Issue deadlines are assigned by the Deputy Assessor Chief Data Officer in consultation with Senior Data Scientists and/or Directors (see [Agile Project Management Practices](#agile-project-management-practices)). Issues should always correspond to a [pull request](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/about-pull-requests) that closes the issue.

## Working Issues

When working an issue, departmental staff should follow these steps:

* Make sure the issue has a due date, time estimate, label, and associated pull request. If any of these are missing, notify the issue creator.
* Make sure you are tracking the branch associated with this issue in git.
* Work the issue. Follow all [coding standards](#coding-standards). Use the comment section of the issue to discuss the work. This creates a record that can be referenced in the future.
* Upon completion of the work, resolve the draft status of the pull request and notify your supervisor that you have completed the work.

### Pull Request Approvals

In collaboration with Senior Data Scientists and Directors, the Deputy Assessor Chief Data Officer can set approvals for pull requests. Branches will not be merged into the production branch until all approvals are made.

### Draft Status

The draft status of branches should not be resolved until the branch is merged into production. Work on branches labeled with draft status are not available to FOIA. Draft status should be resolved and branches should be merged into production upon the delivery of the work product to either internal or external stakeholders.

## Milestones

Issues are organized into Milestones. Milestones are large projects that take multiple weeks or months to accomplish. Milestones allow the Data Department to group issues together based on long-term goals. The Chief Data Officer creates and tracks Milestones to ensure timely delivery of work-product.

# Coding Standards

All work-product produced by the Data Department should be replicable by either a third-party or another staff member, at any point in the future. This both increases productivity by reducing confusion and technical debt, and facilitates transparency and accountability. In order to ensure replicability of work, Data Department staff should adhere to the following coding standards.

## Comments

Comments in R are denoted with a `#` on the commented line. Comments should be frequent and useful. The golden rule of code commenting is: **Code tells you how, comments tells you why**. Code comments should provide context that is not immediately apparent from the code itself. For example, this is **not** a useful comment:

```r
# Filter ratios by quantile
ratios %>%
  filter(between(ratio, quantile(ratio, 0.05), quantile(ratio, 0.95))
```

It doesn't explain why the author made the choice they did, what the end result is, or point out any dangers in changing the code. It is a waste of space. A better version of this comment might be:

```r
# Drop extreme outliers from sales ratios in accordance with CCAO SOPs
ratios %>%
  filter(between(ratio, quantile(ratio, 0.05), quantile(ratio, 0.95))
```

This comment provides context, it tells you **why** this code was written.

Of course, there are still cases where the function of especially complicated pieces of code is not immediately obvious. In this case, comments should both explain what the code is doing and explain why it's doing that thing.

If you have doubts about whether or not to add a comment, then add one. Most CCAO code is public, so it's better to err on the side of over-explaining than being tidy.

## Code Style

Code style is important. It makes your code more readable and ensures that other people working on the same project use the same syntax. The CCAO Data Department mostly follows the [Tidyverse Style Guide](https://style.tidyverse.org/). This is the most widely accepted style guide for R, but it is also quite lengthy and difficult to remember.

Fortunately, two packages exist that support the Tidyverse style guide:

* [styler](https://github.com/r-lib/styler) allows you to automagically restyle text, files, or entire projects. It includes an RStudio add-in, the easiest way to re-style existing code.
* [lintr](https://github.com/r-lib/lintr) automatically checks your code for style errors.

These packages make it easy to conform to the Tidyverse style guide. Simply run `styler` and then `lintr` on your entire project before each commit. This will automatically restyle your code and then tell you if there are any remaining issues. You can even setup pre-commit [git hooks](https://githooks.com) to do this for you.

> :warning: The Data Department does not strictly enforce Tidyverse style for most repositories. However, certain very important repositories (R packages) will automatically reject changes that doesn't conform to Tidyverse style or that have linting errors.

## Commit Style

People who frequently use git follow a [de-facto set of rules](https://commit.style/) for writing good commit messages. A detailed breakdown of those rules can be found [here](https://cbea.ms/git-commit/), but they can largely be condensed to:

  1.  Separate subject from body with a blank line
  2.  Limit the subject line to 50 characters
  3.  Capitalize the subject line
  4.  Do not end the subject line with a period
  5.  Use the imperative mood in the subject line (Use "Fix bug" instead of "Fixed bug")
  6.  Wrap the body at 72 characters
  7.  Use the body to explain what and why vs. how

Following these rules makes reading commit logs much easier, which is extremely helpful when working on projects with multiple people or even just when looking back at your own commit history.

