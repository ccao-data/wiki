# Residential Modeling Upgrade 2020-2021

# Purpose

This document outlines the CCAO&#39;s vision and plan for improvements to its residential modeling pipeline in 2020. Its purpose is twofold:

1. Define the future state of the residential modeling pipeline in 2021 and how it relates to the CCAO&#39;s mission and values
2. Structure the development process by establishing clear goals, tasks, due dates, and delineation of work such that work is aligned to the agency&#39;s core mission

# Vision

The overall goal of this upgrade is to increase the **flexibility, resiliency, portability, fairness, longevity, and transparency** of the residential modeling pipeline. Each of these five tenants has a corresponding current state, future state, and set of phases/milestones:

## Flexibility

**Defined as:** the ability of our pipeline to _quickly_ adapt to new requirements/organizational needs

**Current state:**

1. Pipeline must be manually retooled for specific scenarios and models, e.g. floodplains, unexpected economic shocks, etc. This typically takes 2-3 days of full-time work.
2. Adding new, more accurate or specialized models is a mostly manual task, and it can take days or weeks to fully integrate them into the pipeline.
3. Pipeline is difficult to extend to new data schema (such as Tyler&#39;s). It would need to be refactored heavily to account for changes in data format and structure.

**Future state/goals:**

1. Ability to quickly (within hours) run one-off and or specialized models and store the output/work in a standardized format or template (such as Data Version Control).
2. Ability to add new models and features is built-in. Testing new models is either done via a GUI or by simple writing an additional script. No need to rewrite existing code. Integrating new models should take less than a few hours.
3. Residential pipeline data ingestion is separated from the actual modeling process. This allows the data source to be easily changed to Tyler, Open Data portal, etc.

## Resiliency

**Defined as:** the ability of our pipeline to withstand problems (particularly with bad data) and still deliver sound results

**Current state:**

1. Pipeline is heavily dependent on specific data inputs and will fail when encountering unexpected or missing values. Checks for data integrity issues are minimal.
2. Changes to the existing residential codebase may break something downstream. These errors are typically only encountered when re-running the pipeline.
3. Significant technical debt means the current system architecture will degrade over time. Layering on fixes for data issues and one-off analyses will make the system fragile.

**Future state/goals:**

1. Pipeline rewritten to be data-agnostic. Additionally, built-in or modularized data integrity checks will guarantee that input data is as expected and complete.
2. Use new GitLab features for built-in unit testing, meaning that all changes incorporated into the pipeline are tested at the time of commit. If changes break the pipeline they are automatically rejected.
3. Rebuilt system will lead to long-term stability and be able to operate autonomously for months or years with little to no debugging or user-input.

## Portability

**Defined as:** the ability of our pipeline to run on a wide variety of systems, both internal and external to the CCAO

**Current state:**

1. Pipeline depends on highly specific file and data inputs. Windows file paths, CCAO SQL, and O: drive dependencies make the pipeline specific to CCAO Windows machines.
2. The software environment for running the pipeline is not reproducible. Software/package dependencies are not locked and setting up new employees/interns is time consuming.
3. Running the pipeline on remote systems, such as servers or external user machines, is currently impossible due to Windows specific dependencies.

**Future state/goals:**

1. Replace data ingest and pipeline infrastructure with a data warehouse system that stores intermediate data, cleaned data, and model objects in shared storage. This storage can even be made public to allow external users to easily run our models.
2. Lock the software environment using the renv R package and Docker. This will ensure that the dependencies needed to run the pipeline are easily restored and that updates to dependencies don&#39;t break existing code.
3. Replace existing codebase with an independent and generalized package that can be easily exported to other machines. This package could even be used by other assessors&#39; offices.

## Fairness

**Defined as:** the ability of our pipeline to accurately assess all residential property values, accounting for disparities in geography, information, etc.

The current pipeline is a massive improvement over previous modeling techniques, but still struggles with some specific areas:

**Current state:**

1. Pipeline struggles with areas that have poor data and/or data integrity issues, particularly in the South Tri. High CODs in these areas are persistent despite new modeling techniques.
2. Geographic information included in the model is limited. The use of geographic fixed effects can lead to spatial discontinuities in assessed values.
3. Characteristics data may not be 100% up-to-date due to messy data from exemptions and 288s.

**Future state/goals:**

1. Create new models with a focus on accuracy over explainability. Utilize ML techniques such as lasso/elasticnet, neural nets, and GBM to squeeze the most predictive power possible out of our existing data. Additionally, created automated data integrity checks to ensure data quality.
2. Add new geographic and/or index data to each property, possibly in collaboration with outside contributors. Utilize more advanced spatial data techniques to eliminate the hard boundaries formed by neighborhoods (kriging, spatial autocorrelation).
3. Create new data-handling modules/scripts specifically for 288s and exemptions. Model based on the updated characteristics.

## Longevity

**Defined as:** the ability of our pipeline to operate with minimal input and maintenance. It should be able to function well after its creators leave the office, and its user interface should be simple enough for non-coders to use.

**Current state:**

1. Pipeline is highly dependent on specific inputs and the existence of certain files and paths. This makes the pipeline difficult to run and maintain for anyone except for the core data science team.
2. Missing version locking on R packages and version means that existing functionality may break as packages are automatically updated.
3. Existing pipeline complexity means that it can only be run by highly technical users.

**Future state/goals:**

1. Build the new pipeline to be system agnostic. It should be easily portable and its dependencies should be extremely explicit.
2. Add version locking of packages via renv and Docker to ensure that future updates don&#39;t break functionality.
3. Add a UI layer to allow non-technical users to test new models and compare their results. Also use Airflow to automatically trigger/schedule data ingestion and results reporting. This is equivalent to/an extension of the current modeling sandbox.

## Transparency

**Defined as:** the ability of the data science department to share and explain pipeline results and decisions to both internal and external stakeholders

**Current state:**

1. The current pipeline process produces a variety of internal performance statistics as part of its output. However, these statistics are difficult to share and interpret even within the CCAO.
2. Towns are currently modeled on an as-needed basis, leading to large jumps in assessment after 3 years of not being modeled.
3. Current modeling results and decision-making are difficult to explain to outside stakeholders and individual taxpayers. We offer topline statistics but struggle to answer the question &quot;How did you arrive at my valuation?&quot;
4. Documentation for our current modeling process is sparse and scattered, leading to duplication of efforts and significant time repeatedly answering the same questions.
5. Current pipeline code is difficult to use outside of the CCAO office, so it is difficult to contribute to our existing modeling efforts or reproduce our work.

**Future state/goals:**

1. Consolidate model performance statistics into a quicklook application, rather than keeping them in CSV or Excel files.
2. Replace triennial modeling with continuous modeling done automatically on a monthly or even weekly basis.
3. Create model APIs to backend an interactive application. APIs enable users to change property variables to see how their assessment is affected (for example, how much does an extra bedroom add to their AV).
4. Consolidate documentation that currently exists on GitLab, the O: drive, and elsewhere into a single data science wiki. This wiki will explain the entire residential modeling process.
5. Create an R package for modeling that can be used by external parties. Version existing and future pipeline code with GitLab.

# Phases and Milestones

Rebuilding the residential modeling pipeline will require significant upfront development time, but will lead to a more robust, scalable, and extensible system in the future.

**Total development time is at least 6 months**. However, the overall development can be **split into discrete chunks (GitLab calls them Milestones)** that are largely independent projects. If a crisis arises or development is interrupted, efforts from previous milestones can still be utilized within the existing residential modeling framework.

Development can be split into 3 phases, all contained within a [single epic](https://gitlab.com/groups/ccao-data-science---modeling/-/epics/1) on GitLab:

## Phase 1

**Package and rebuild the existing residential codebase (2 months)**

The current residential code needs to be updated, simplified, and packaged in order to facilitate further development. Building new complexity on top of our existing codebase will not be maintainable long-term and will not meet the goals outlined above. This phase can be broken down into 4 milestones:

* [Milestone 1: Consolidate Res. Functions Into Packages](https://gitlab.com/groups/ccao-data-science---modeling/-/milestones/13)
* [Milestone 2: Simplify Data Ingest for Res. Rebuild](https://gitlab.com/groups/ccao-data-science---modeling/-/milestones/11)
* [Milestone 3: Setup Data Warehouse Infrastructure](https://gitlab.com/groups/ccao-data-science---modeling/-/milestones/12)
* [Milestone 4: Update Residential Pipeline Codebase](https://gitlab.com/groups/ccao-data-science---modeling/-/milestones/14)

## Phase 2

**Setup integrity checks, integrations, and new data pipelines (2 months)**

This phase encompasses data integrity checks, new data discovery, feature engineering, and data architecture tasks that need to occur before modeling.

* [Milestone 1: Setup Data Integrity Checks](https://gitlab.com/groups/ccao-data-science---modeling/-/milestones/16)
* [Milestone 2: Integrate 288s, 299s, and 399s in Modeling Data](https://gitlab.com/groups/ccao-data-science---modeling/-/milestones/17)
* [Milestone 3: Collect New Spatial Data](https://gitlab.com/groups/ccao-data-science---modeling/-/milestones/18)
* [Milestone 4: Build Better Sales Comps Algorithm](https://gitlab.com/groups/ccao-data-science---modeling/-/milestones/19)

## Phase 3

**Build new models and improve existing ones (3 months)**

Once the data and modeling framework is complete (Phase 1) and new sources of data are investigated and collected (Phase 2), we can begin the process of actually modeling. This phase will likely be the most difficult and time consuming. Modeling in the wake of Covid-19 may prove especially difficult.

* [Milestone 1: Run Baseline Models with New Pipeline](https://gitlab.com/groups/ccao-data-science---modeling/-/milestones/20)
* [Milestone 2: Complete Feature Engineering and Automatic Modeling Adjustments](https://gitlab.com/groups/ccao-data-science---modeling/-/milestones/21)
* [Milestone 3: Build 2021 City Assessment Model](https://gitlab.com/groups/ccao-data-science---modeling/-/milestones/22)

# Constraints

This project has multiple path dependencies which could potentially limit its outcomes. These dependencies are largely outside of the control of the data science department. This project also has a number of constraints that alter its scope, make it more difficult, or force it to deviate from industry best practices.

## Non-critical Path Dependencies

These are tasks that _should_ be completed in order for the project to be completed as scoped.

**Task/Milestone:** Milestone 1.2 (SQL server optimization)

**Dept. Needed:** Technology/IT

**Needs:** May require some input from IT, primarily:

- Permissions needed for performance profiling (ANALYZE) on SQL queries
- Collaboration on setting up new sets of indices
- Advice on best practices re: indices and table structure, particularly w.r.t. legacy system

**Cost of not completing:** Worse SQL server performance overall which will lead to slower modeling times, more data science down-time, and less responsive applications

**Task/Milestone:** Milestone 2.1 (data integrity)

**Dept. Needed:** Technology/IT

**Needs:** May require collaboration with IT to:

- Verify the expected structure, content, and format of specific datasets
- Correct any issues discovered by the integrity checks created

**Cost of not completing:** Less accurate data overall will lead to longer modeling time (as DS will need to manually check data) and potentially less accurate models (as outliers or bad data slip into the models)

## Critical Path Dependencies

These are tasks that _must_ be completed in order for the project to be completed as scoped.

**Task/Milestone:** Milestone 1.3 (data storage server setup)

**Dept. Needed:** Technology/IT

**Needs:** Will require significant input from IT, primarily:

- New VM or server setup specifically for data storage with the following:
  - At least 16 Gb of RAM
  - Network accessible from other VMs and the VPN
  - Estimated 1 Tb of storage space (for model data and model objects)
- Routing assistance to ensure connectivity to internal storage:
  - If setup with an external domain: will need NAT loopback/hairpin routing to ensure access to storage server from inside of CCAO network
- Internal storage of intermediate data and final models will be mission critical and as such will require a robust backup solution

**Cost of not completing:** New pipeline is critically dependent on being able to store some intermediate objects for both speed, reproducibility, and transparency. Being unable to store these objects will force a pipeline redesign early in the build phase.

## Other Constraints

- Lack of additional funding for cloud compute/storage resources puts additional burden on IT for the setup and maintenance of equivalent on-prem hardware. Most firms would likely use cloud services for a project similar to the one scoped here.
- Lack of funding also leads to a dependence on open source and free tools. Overall this is good but can lead to more work for the data science team since industry standard or best-in-class software is often easier to use and maintain.
- Any newly setup technology has to be stable long-term and useable by people with the expected skill set of a senior data scientist. This is good overall since it forces the data science toolchain to remain light, but it can lead to issues where we avoid easy-to-use tools with high setup/maintenance costs in favor of harder-to-use tools with low setup/maintenance costs.
- Using exclusively R severely limits the number of industry-standard tools we can use. Most data engineering and ML Ops tools are written in Python or Go.

# System Diagrams

See [diagram PDF](upgrade-diagram-2020.pdf) or [Visio file](upgrade-diagram-2020.vsdx)

# Resources

## Workflow

- Outline of a standard data science workflow we can use as a template: [https://towardsdatascience.com/the-data-science-workflow-43859db0415](https://towardsdatascience.com/the-data-science-workflow-43859db0415)
- Rstudio::conf course on 2020 methods for applied machine learning. This is the workflow and methodology we should replicate: [https://github.com/rstudio-conf-2020/applied-ml](https://github.com/rstudio-conf-2020/applied-ml)
- Giant list of data quality metrics that we should attempt to use: [https://reddit.com/r/datascience/comments/fzweaf/my\_giant\_data\_quality\_checklist/](https://reddit.com/r/datascience/comments/fzweaf/my_giant_data_quality_checklist/)
- Useful blog post on containerizing data workflows: [https://medium.com/enigma-engineering/containerizing-data-workflows-95df1d338048](https://medium.com/enigma-engineering/containerizing-data-workflows-95df1d338048)

## Tools

- **MinIO:** Self-hosted object storage equivalent to Amazon S3 to host our data warehouse: [https://github.com/minio/minio/](https://github.com/minio/minio/)
- **Airflow:** Tool to create visual pipelines of steps that can be run via GUI: [https://airflow.apache.org/](https://airflow.apache.org/)
- **Metaflow:** Data science project management and pipeline construction: [https://docs.metaflow.org/introduction/what-is-metaflow](https://docs.metaflow.org/introduction/what-is-metaflow)

## Walkthroughs

- Extremely thorough book on designing data workflows and applications: [https://dataintensive.net/](https://dataintensive.net/)
- Basic overview of tidymodels R package workflow: [https://rviews.rstudio.com/2019/06/19/a-gentle-intro-to-tidymodels/](https://rviews.rstudio.com/2019/06/19/a-gentle-intro-to-tidymodels/)
- Kaggle competitions on housing that we may be able to steal models and features from: [https://www.kaggle.com/mgmarques/houses-prices-complete-solution](https://www.kaggle.com/mgmarques/houses-prices-complete-solution) [https://www.kaggle.com/jesucristo/1-house-prices-solution-top-1](https://www.kaggle.com/jesucristo/1-house-prices-solution-top-1)

## Feedback Posts

- On r/datascience: [https://old.reddit.com/r/datascience/comments/g8ojeg/critiquehelp\_with\_the\_mlops\_plan\_for\_a\_small\_ds/](https://old.reddit.com/r/datascience/comments/g8ojeg/critiquehelp_with_the_mlops_plan_for_a_small_ds/)
- On r/dataengineering: [https://old.reddit.com/r/dataengineering/comments/g93bs5/critiquehelp\_with\_the\_data\_engineering\_plan\_for\_a/](https://old.reddit.com/r/dataengineering/comments/g93bs5/critiquehelp_with_the_data_engineering_plan_for_a/)
