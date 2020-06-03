# Residential Modeling Upgrade 2020-2021

# Purpose

This document outlines the CCAO&#39;s vision and plan for improvements to its residential modeling pipeline in 2020. Its purpose is twofold:

1. Define the future state of the residential modeling pipeline in 2021 and how it relates to the CCAO&#39;s mission and values
2. Structure the development process by establishing clear goals, tasks, due dates, and delineation of work such that work is aligned to the agency&#39;s core mission

# Vision

The overall goal of this upgrade is to increase the **flexibility, resiliency, portability, fairness, longevity, and transparency** of the residential modeling pipeline. Each of these five tenants has a corresponding current state, future state, and set of epics/milestones:

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

# Epics and Milestones

Rebuilding the residential modeling pipeline will require significant upfront development time, but will lead to a more robust, scalable, and extensible system in the future.

**Total development time is at least 6 months**. However, the overall development can be **split into discrete chunks (GitLab calls them Epics)** that are largely independent projects. If a crisis arises or development is interrupted, efforts from previous epics can still be utilized within the existing residential modeling framework.

Square brackets at the end of tasks represent the corresponding ID in the residential modeling feature list. See the spreadsheet for information about each task. Development can be split into 3 epics:

## Package and rebuild the existing residential codebase (2 months)

The current residential code needs to be updated, simplified, and packaged in order to facilitate further development. Building new complexity on top of our existing codebase will not be maintainable long-term and will not meet the goals outlined above. This epic can be broken down into 4 milestones:

### Milestone 1: Convert existing residential repository functions into an R package

**Due:** May 15, 2020

**Goal:** Move existing _CCAO-specific_ functionality into its own package (named ccao). This will allow us better add, maintain, share, and document functions like COD calculation or adding characteristics.

**Parties involved:**

- Dan Snow: lead developer
- Billy Ridgeway: maintainer and advisor on functions needs

**Time estimate:** 32-64 hours

**Problem to solve:** Difficulty in distributing and maintaining critical model performance assessment functions and other utility functions used widely within the assessment pipeline. Dependency on the existence of local files (99\_utility.R).

**Problem severity:** Moderate to low (Minor time cost associated with current distribution method. More significant cost if existing measurement functions are not used consistently).

**Project risk level:** Low (Little to no potential for failure, minor problems if failed)

**Tasks involved:**

1. Create a separate repo with a new git history (suggested package name = assessr)
2. Transfer existing utility code to new repo, generalize all functions
3. Transfer existing Residential code to new repo (functions only), generalize
4. Add standardized documentation to all functions (roxygen2)
5. Add unit tests to all functions
6. Add integration tests to all functions where applicable
7. Integrate roxygen documentation into GitLab and DS Wiki
8. Build CI scripts to automatically run unit and integration tests

### Milestone 2: Simplify and extend data ingest methods

**Due:** May 22, 2020

**Goal:** Simplify and clean existing SQL tables and views, as well as add functionality to allow novel, non-SQL data such as data from the Open Data portal or new spatial data.

**Parties involved:**

- Dan Snow: lead developer
- IT Admins: May be needed for certain SQL permissions, help moving and optimizing tables

**Time estimate:** 32-64 hours

**Problem to solve:** Current structure of the SQL server is largely ad-hoc and undocumented. New people joining the organization or using internal data must rediscover existing knowledge. Current data ingest architecture leads to reproducibility but very slow iteration and data updates. Data ingest is largely not separable from modeling.

**Problem severity:** Moderate (Moderate resource/organizational cost associated with people relearning SQL knowledge, moderate to severe time cost associated with long SQL query and data retrieval times. Low impact on public outcomes)

**Project risk level:** Very low (Almost no potential for failure, very minor problems if failed)

**Tasks involved:**

1. Inventory existing SQL tables and views
2. Remove/archive unused tables and views
3. Ensure all views and tables have appropriate, well-designed indices
4. Optimize existing SQL queries and views
5. Better define/update the residential universe of PINs needed for modeling [43]
6. If possible, add data transformation or feature extraction for modeling to SQL views
7. Separate R ingest files and SQL queries into discrete files
8. Create a Dockerized ETL pipeline that can run the ingest portion of the residential pipeline (create model data)
9. Create a Dockerized ETL pipeline to allow data ingest from Open Data portal [36]
10. Document all data ingest functionality [22]

### Milestone 3: Setup new data warehouse infrastructure

**Due:** May 29, 2020

**Goal:** Setup the hardware infrastructure and software to create a data warehouse. This warehouse would store cleaned modeling data, intermediate data, model objects, and results. Clean data would be ingested into this warehouse via ETL processes that run automatically via [Airflow](https://airflow.apache.org/). This facilitates faster model iteration, easy replication, and public sharing.

**Parties involved:**

- Dan Snow: lead developer
- IT Admins: Computing and storage resources will be needed to set this up internally. MinIO can run on existing hardware or Nutanix VMs.

**Time estimate:** 32-64 hours

**Problem to solve:** Current data setup is slow, cumbersome, and system dependent. Currently, model data is ingested from SQL every time the modeling script is run. Different users must recreate the same model data for each pipeline run, leading to slow iteration and ad-hoc data storage. Models that produced assessed values are saved locally or on the O: drive but do not have standardized schema or set of associated performance statistics. Final model objects are stored on the O: drive or user machines.

**Problem severity:** Moderate (Current data structure is tenable but disorganized and could lead to long term difficulties. For example, it would be difficult for us to provide the exact model and code that produced the 2018 assessed values. As modeling data grows in size the current system will become less tenable).

**Project risk level:** Moderate (Some potential for failure given lack of resources. Storing data always bring risk of drive failure that could slow progress. Failure of this project could significantly limit progress on the rest of the pipeline).

**Tasks involved:**

1. Provision new VMs or servers with the help of IT
2. Setup [minIO](https://github.com/minio/minio/) to serve as a storage server backend. This replicates Amazon&#39;s S3 storage service
3. Setup monitoring of minIO usage via Grafana
4. Test interface of minIO and integration with R via S3 API
5. Setup PSQL server to server as backend for modeling data
6. Point ETL pipelines created in step 2 toward new warehouse
7. Setup Airflow to automatically run ETL processes and future pipeline
8. Document new changes to data and model object storage in wiki

### Milestone 4: Update residential pipeline to use new CCAO package, tidymodels syntax

**Due:** June 19, 2020

**Goal:** Simplify the residential modeling pipeline to make it easier to use, more robust, and simpler to maintain. Make iterating on models and testing new ones _significantly_ easier.

**Parties involved:**

- Dan Snow: lead developer
- Billy Ridgeway: maintainer and advisor

**Time estimate:** 4-5 weeks

**Problem to solve:** Current residential modeling pipeline is complex and difficult to change. Small errors and data quality issues sometimes arise that lead to significant misvaluations (though they are usually caught). Adding new models to the pipeline is a manual task only able to be done by 1-2 people.

**Problem severity:** Moderate to severe (Maintenance and model iteration using the current residential pipeline costs a significant amount of organization time/resources on a regular basis. Complexity in the existing codebase sometimes leads to errors that are discovered by the public).

**Project risk level:** Moderate (Rebuilding the pipeline carries a risk of changing _how_ values are created, making us internally inconsistent with our past selves. Failure of this project would stop progress on any further milestones).

**Tasks involved:**

1. Create a fork of the existing residential repository (called V2)
2. Replace existing CCAO functions with those from new CCAO package
3. Replace current package management system with renv environment
4. Replace data ingest with ETL processes created in Milestones 2/3
5. Convert existing pipeline steps/scripts into tidyverse syntax
6. Replace preprocessing, model selection, and tuning with tidymodels syntax [32]
7. Modify trimming of outliers using tidymodels [47]
8. Add better cross-validation to prevent overfitting [42]
9. Integrate model and data storage with MinIO
10. Integrate model and metrics collection with PSQL
11. Document these changes to the residential pipeline in the res and DS wikis [23, 24]
12. Document data integrations and usage
13. Update post-modeling adjustment scripts and functionality
14. Document post-modeling adjustments [25]

### Milestone 5: Get modeling sandbox/comparison operational

**Due:** June 26, 2020

**Goal:** Create a simplified UI layer on top of the modeling pipeline that allows end users to create and test new models.

**Parties involved:**

- Dan Snow: lead developer
- Damini Sharma: secondary developer/consulting on original code

**Time estimate:** 32-64 hours

**Problem to solve:** Current residential pipeline can only by run by highly technical people. This prevents other users and members of the office from contributing domain knowledge about which models/features may perform best.

**Problem severity:** Severe (If the modeling pipeline is to be long-lived and useful, it must be accessible. If this project is not completed, testing new models will be much more burdensome).

**Project risk level:** Low (This project has a low change of failure and a high reward. Do this project.).

**Tasks involved:**

1. Refactor Damini&#39;s existing sandbox code to sit on top of the new pipeline code.
  1. Change data ingest to use data warehouse
  2. Change RMarkdown file to interface with new pipeline
  3. Alter results storage to output to data warehouse? Need to think about how to store and compare model results
2. Document the usage of the sandbox
3. Create a graph of dependencies that shows points of potential failure

## Setup integrity checks, integrations, and new data pipelines (2 months)

This epic encompasses data integrity checks, new data discovery, feature engineering, and data architecture tasks that need to occur before modeling.

### Milestone 1: Verify existing data integrity and create better data validation processes

**Due:** July 3, 2020

**Goal:** The goal of this milestone is to design systems or modules that verify the integrity of CCAO data.

**Parties involved:**

- Dan Snow: lead developer
- Billy Ridgeway: advisor and data expert
- Tristan G. Calvo: already designed some data integrity checks
- IT Admins: knowledge about existing data systems and eccentricities

**Time estimate:** 32-64 hours

**Problem to solve:** CCAO&#39;s current data architecture is designed specifically to accommodate a legacy system. This introduces constant data integrity issues such as: randomly missing entire SQL tables, extremely strange handling of otherwise common fields (age), data errors from users, etc. These issues can sometimes go undetected and lead to misvaluations.

**Problem severity:** Severe (Data integrity issues happen almost constantly (at least weekly) and significantly affect the ability of the department to produce accurate valuations. The public sometimes discovers valuations that are a result of these data issues).

**Project risk level:** Low (Very little potential for failure with enormous benefits. Do this project).

**Tasks involved:**

1. Integrate the data integrity report into model data creation as an Airflow pipeline component
2. Create a process for spreadsheet based desktop review process outside of the AS400
3. Add a function to automatically flag properties with incorrect classes [44]
4. Create a minimal script which automatically outputs model values in AS400 format [46]
5. Automatic detection of invalid fixed effects (low number of sales in neighborhood, few of specific class of sale) [34]
6. Document (wiki) and create SOPs for desktop review process [26, 27]
7. Document any process changes to the residential pipeline
8. Investigate whether fire data can be used to update property records or offer reductions in AV automatically [28]

### Milestone 2: Integrate 288s, 299s, and 399s into modeling data

**Due:** July 17, 2020

**Goal:** Create an improved process for handling 288s, 299s, and 399s and create process documentation.

**Parties involved:**

- Dan Snow: lead developer
- Billy Ridgeway: advisor and data expert
- Valuations: advice on how to best handle 299s and 399s

**Time estimate:** 1-2 weeks

**Problem to solve:** Currently, properties with 288 exemptions are valued in a hybrid manner. First, we model the original structure. Then, the value of the 288 is determined by M&S cost tables. This may produce disuniformity, and it is certainly complicated and opaque.Commercial valuations spends a lot of time on 399s, and different valuation approaches may produce differences in valuation. Often, there is no material difference between 299s and 399s and they can be effectively bundled.

**Problem severity:** Moderate to severe (The complication created by the current 288 process leads to strange valuations and disuniformity. This is sometimes discovered by the public. Valuations for 299s and 399s are sometimes inconsistent).

**Project risk level:** Moderate to high (Given the difficulty of accurately integrating 288 characteristics across all properties, this project carries some risk. Done poorly, this could lead to misvaluations).

**Tasks involved:**

1. Build an updated function (addchars) or module that can add characteristics data from 288s to model data [16]
2. Document this new process for 288 handling [17]
3. Test the effect of including 288s on sales ratio studies [18]
4. Update SOPs to account for 288 inclusion in modeling data [19]
5. Bundle 299s with 399s in the modeling data [40]

### Milestone 3: Investigate and collect new sources of spatial data

**Due:** July 24, 2020

**Goal:** Investigate the viability of new spatial data sources and incorporate them into the pipeline if warranted. Validate existing spatial methods. Create metrics for measuring spatial discontinuity and autocorrelation.

**Parties involved:**

- Dan Snow: lead developer
- Center for Spatial Data Science (CSDS) at UChicago: can help verify methods and data
- Data Science for Social Good (DSSG): can significantly assist with data exploration and collection and can help measure the validity of spatial models

**Time estimate:** 1-2 weeks

**Problem to solve:** The existing residential pipeline lacks spatial information needed for more accurate and unbiased predictions. The current use of spatial fixed effects models sometimes produces sharp discontinuities in assessed value along neighborhood/township boundaries.

**Problem severity:** Moderate to severe (Lack of spatial information leads to less accurate models. Public may find existing spatial discontinuities strange).

**Project risk level:** Moderate (Incorrectly including spatial information could lead to worse performance and/or model bias. Project failure could hurt long-term model performance).

**Tasks involved:**

1. Investigate/integrate walking distance to CTA/Metra stations [1, 2]
2. Investigate/integrate straight-line distance to noisy rail lines and roads [3, 4]
3. Investigate/integrate measures of local crime rate [5, 6, 7]
4. Investigate school quality and distance [8, 9, 10, 11]
5. Investigate walk-score and other measures of neighborhood spatial quality [12, 13]
6. Measure percentage of vacant land nearby [14]
7. Measure of historic redlining [15]
8. Investigate whether new neighborhood boundaries or strata can improve model performance [33]
9. Better account for the effects of spatial autocorrelation
10. Include measure of the distance to Austin Blvd in Oak Park [37]
11. Investigate the effect of local hedonic pricing indices [39]
12. Investigate the potential for matching building footprint data to res characteristics data [49]

### Milestone 4: Build better sale comp finding algorithms

**Due:** July 31, 2020

**Goal:** Update the methodology used to find sales comps to be more logical, performant, and consistent. Provide documentation on the process of finding these comparables.

**Parties involved:**

- Dan Snow: lead developer
- Data Science for Social Good (DSSG): may be able to assist the developing new algorithms

**Time estimate:** 1-2 weeks

**Problem to solve:** Property owners expect to see sensible nearby sales comps, which we currently struggle to provide. When we do provide sales comps, we are largely unable to explain how we found them. Additionally, the existing models that use sales comparables underperform standard regression models. This may be the fault of the comparables finding algorithm rather than the fault of the model.

**Problem severity:** Severe (We must be able explain to property owners how we find any comps we show them. The current methods for comp finding result in strange and inconsistent comps (sometimes very far away from the target property)).

**Project risk level:** High (There is high potential for this project to fail due to poor data and data capacity issues. Additionally, this is essentially a separate, very difficult machine learning problem that is separate from the primary task of modeling).

**Tasks involved:**

1. Design and test new algorithms for identifying sales comparables [29]
2. Create a whitepaper explaining our comp finding methodology [30]
3. Create a system to export comparables to other systems or store them in SQL [31]
4. Document the new comp finding process in the wiki

## Build new models and improve existing ones (3 months)

Once the data and modeling framework is complete (Epic 1) and new sources of data are investigated and collected (Epic 2), we can begin the process of actually modeling. This epic will likely be the most difficult and time consuming. Modeling in the wake of Covid-19 may prove especially difficult.

### Milestone 1: Replicate existing model results, establish baselines, document process

**Due:** August 7, 2020

**Goal:** Replicate (to the extent possible) existing model results to ensure validity and internal consistency. Create a baseline model of all Cook County to use as a performance minimum/baseline. Document the process of running the model from end-to-end.

**Parties involved:**

- Dan Snow: lead developer
- Billy Ridgeway: advisor on previous model design and performance

**Time estimate:** 16-32 hours

**Problem to solve:** Our new pipeline should be internally consistent when compared to previous models. This does not mean having exactly the same numbers for every property. Rather, we want the coefficients of a baseline model to be in line with those of previous models.

**Problem severity:** Low (This is more of a nice-to-have, no a need-to-have).

**Project risk level:** Low (This project has a very low potential for failure and could possibly be skipped).

**Tasks involved:**

1. Run a baseline model using the old residential pipeline, using microbenchmark to do timing tests
2. Run a baseline (lm) model using new pipeline, compare to previous
3. Run baseline non-linear models for the entire county
4. Compare the baseline model results to previous model results
5. Diagnose and correct any potential problems with the modeling pipeline
6. Document the full pipeline run process

### Milestone 2: Feature engineering, tweak modeling pipeline for different attributes/classes

**Due:** August 21, 2020

**Goal:** Build modules that increase the performance of the model for specific types of properties or for specific scenarios. Additionally, do feature engineering to discover highly predictive attributes.

**Parties involved:**

- Dan Snow: lead developer
- David Aarons and William Caballero: knowledge of most impactful features
- Data Science for Social Good (DSSG): may be able to assist with new feature development

**Time estimate:** 2-3 weeks

**Problem to solve:** The current modeling pipeline must be manually adjusted to account for different scenarios and property classes. It may be possible to automate some of this adjustment. Additionally, the highest performing models require significant upfront work to determine which features/attributes of the data will yield the most predictive power. Without this work, our models will always be suboptimal.

**Problem severity:** Moderate to severe (Our current models cannot account for certain property types such as vacant land, or certain situations such as recessions. This could lead to misvaluations or errors).

**Project risk level:** High (Poorly implementing one of these adjustments could lead to significant misvaluations. If the project fails we may need to scramble for an alternative for these specific properties).

**Tasks involved:**

1. Create a mechanism for detecting and modeling major market fluctuations [45]
2. Create a mechanism that automatically adjusts for regressivity in our predictions [41]
3. Create a mechanism for valuing vacant and developed land [35]
4. Create a mechanism for valuing cooperatives [48]
5. Rebuild/redesign the existing condominium strata functionality
6. Design and test new features, interaction terms, etc

### Milestone 3: Build the best model possible for the 2021 city assessment

**Due:** 2021

**Goal:** Build a model (or set of models) that performs better than the baseline established in milestone 1. This model should be broadly generalizable to the rest of the county (not overfit to the City).

**Parties involved:**

- Dan Snow: lead developer
- Data Science for Social Good (DSSG): may be able to assist with new feature development

**Time estimate:** 2 months

This milestone is more open-ended and doesn&#39;t have a discrete set of tasks. We will need to continuously iterate and experiment to find a model (or models) that perform well but are not overfit to the city.

This process will be time consuming and will require significant statistical expertise. This will likely be the hardest task of the proposal, but has high potential payoff as it could ultimately yield significantly more accurate assessed values. We will also need to determine exactly how to measure model performance against the baseline.

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

See [diagram PDF](residential/pipeline/upgrade-diagram-2020.pdf) or [Visio file](residential/pipeline/upgrade-diagram-2020.vsdx)

# Resources

### Workflow

- Outline of a standard data science workflow we can use as a template: [https://towardsdatascience.com/the-data-science-workflow-43859db0415](https://towardsdatascience.com/the-data-science-workflow-43859db0415)
- Rstudio::conf course on 2020 methods for applied machine learning. This is the workflow and methodology we should replicate: [https://github.com/rstudio-conf-2020/applied-ml](https://github.com/rstudio-conf-2020/applied-ml)
- Giant list of data quality metrics that we should attempt to use: [https://reddit.com/r/datascience/comments/fzweaf/my\_giant\_data\_quality\_checklist/](https://reddit.com/r/datascience/comments/fzweaf/my_giant_data_quality_checklist/)
- Useful blog post on containerizing data workflows: [https://medium.com/enigma-engineering/containerizing-data-workflows-95df1d338048](https://medium.com/enigma-engineering/containerizing-data-workflows-95df1d338048)

### Tools

- **MinIO:** Self-hosted object storage equivalent to Amazon S3 to host our data warehouse: [https://github.com/minio/minio/](https://github.com/minio/minio/)
- **Airflow:** Tool to create visual pipelines of steps that can be run via GUI: [https://airflow.apache.org/](https://airflow.apache.org/)
- **Metaflow:** Data science project management and pipeline construction: [https://docs.metaflow.org/introduction/what-is-metaflow](https://docs.metaflow.org/introduction/what-is-metaflow)

### Walkthroughs

- Extremely thorough book on designing data workflows and applications: [https://dataintensive.net/](https://dataintensive.net/)
- Basic overview of tidymodels R package workflow: [https://rviews.rstudio.com/2019/06/19/a-gentle-intro-to-tidymodels/](https://rviews.rstudio.com/2019/06/19/a-gentle-intro-to-tidymodels/)
- Kaggle competitions on housing that we may be able to steal models and features from: [https://www.kaggle.com/mgmarques/houses-prices-complete-solution](https://www.kaggle.com/mgmarques/houses-prices-complete-solution) [https://www.kaggle.com/jesucristo/1-house-prices-solution-top-1](https://www.kaggle.com/jesucristo/1-house-prices-solution-top-1)

### Feedback Posts

- On r/datascience: [https://old.reddit.com/r/datascience/comments/g8ojeg/critiquehelp\_with\_the\_mlops\_plan\_for\_a\_small\_ds/](https://old.reddit.com/r/datascience/comments/g8ojeg/critiquehelp_with_the_mlops_plan_for_a_small_ds/)
- On r/dataengineering: [https://old.reddit.com/r/dataengineering/comments/g93bs5/critiquehelp\_with\_the\_data\_engineering\_plan\_for\_a/](https://old.reddit.com/r/dataengineering/comments/g93bs5/critiquehelp_with_the_data_engineering_plan_for_a/)
