# Resources

Resources, notes, and helpful links used by the Data Department. Organized by section and ordered by importance.

- :exclamation: denotes ***required*** reading for interns and new hires. However, feel free to skip the reading if you're already very familiar with the topic
- :star: denotes a recommended resource

## Useful Bookmarks

> [!IMPORTANT]
> See the [member org README](https://github.com/ccao-data?view_as=member) for a list of useful internal links and bookmarks.

- [:exclamation: CCAO GitHub](https://github.com/ccao-data) - Main source for all Data Department code
- [CCAO GitLab](https://gitlab.com/ccao-data-science---modeling) - Archived. Previous source of all CCAO code
- [Cook County Assessor's PIN Search](https://www.cookcountyassessor.com/address-search) - Our office's application to find information about a PIN
- [Cook County Property Info](http://www.cookcountypropertyinfo.com/) - The County's application to find information about a PIN
- [Cook County Data Portal](https://datacatalog.cookcountyil.gov/) - Public data portal for Cook County
- [Cook Viewer](https://maps.cookcountyil.gov/cookviewer/mapViewer.html) - A GIS application for finding PINs
- Subscribe to the [CCAO’s external newsletter](https://public.govdelivery.com/accounts/ILCOOK/signup/12686)
- Subscribe to the CCAO’s social media channels:
  - [Facebook](https://www.facebook.com/CookCountyAssessorsOffice/)
  - [Instagram](https://www.instagram.com/cookcountyassessor/)
  - [LinkedIn](https://www.linkedin.com/company/cookcountyassessorsoffice/)
  - [Twitter](https://twitter.com/AssessorCook)
  - [YouTube](https://www.youtube.com/channel/UC9w4Q3ZJyRS5J27eYKSjwZQ)
- [IAAO Technical Standards](https://iaao.org/wcm/Resources/Technical_Standards/wcm/Resources_Content/Pubs/Technical_Standards.aspx) - Technical standards and measurements for the assessment field

## Property Tax Guides and Reporting

Useful materials that give an overview of Cook County's property tax system and provide context about our office, its history, and its problems:

- [:exclamation: Cook County Property Taxes 101](https://maps.cookcountyil.gov/propertytax101/index.html) - Brief intro to property taxes, created by the Clerk's office
- [:exclamation: The Tax Divide - Chicago Tribune](https://www.chicagotribune.com/investigations/ct-tax-divide-investigation-20180425-storygallery.html) - An excellent outline of the historical problems with the CCAO
- [:star: The Cook County Property Tax Extension Process: A Primer](https://www.civicfed.org/civic-federation/publications/cook-county-property-tax-extension-process-primer-levies-tax-caps-and-) - Incredibly useful guide to the intricacies of the entire Cook County tax system
- [:star: How Lower-Income Americans Get Cheated on Property Taxes - NYTimes](https://www.nytimes.com/2021/04/03/opinion/sunday/property-taxes-housing-assessment-inequality.html) - Concise and accessible overview of the nation-wide issue of inequitable assessments
- [:star: Why Are Property Taxes in Chicago so High?](https://youtu.be/zp5dHWnk2NE) - Chi Hack Night presentation by @dfsnow that introduces the Cook County property tax system and describes some of the root causes of high bills
- [How the Illinois Property Tax System Works](https://cookcountytreasurer.com/pdfs/understandingyourtaxbill/propertytaxprimer.pdf) - The Cook County Treasurer's property tax primer, explains the extension process and some additional things like the scavenger sale and tax liens
- [Chicago Inside Out (2018) - Places Journal](https://placesjournal.org/article/chicago-inside-out) - Deep dive into the roles and recent histories of the offices that comprise Cook County government, with a particular focus on the impact of property taxes on county services
- [Chicago Triad Assessment Report (2018) - Civic Consulting Alliance](https://prodassets.cookcountyassessor.com/s3fs-public/reports/2018ChicagoTriadSRSvf.pdf) - Study of 2018 assessment quality in the Chicago triad
- [Learn About Illinois' Property Tax System](https://www.youtube.com/watch?v=l9YVudOQuZ4) - Illinois Realtors’ video about property tax system and bills
- [Why Are My Property Taxes so High?](https://www.chicagobusiness.com/crains-forum-taxes/forum-why-are-my-property-taxes-so-high) - Neat interactive from Crain's that compares two very different homes that pay roughly the same amount of property tax
- [Report on Property Taxes in Wicker Park - Block Club Chicago](https://blockclubchicago.org/2021/03/23/after-decades-in-wicker-park-senior-homeowners-forced-out-by-skyrocketing-property-taxes-this-neighborhood-has-broken-my-heart/) - Story on how increases in assessed value are affecting Wicker Park
- [How Our Property Tax System Robs The Poor to Pay For The Wealthy (2023) - Strong Towns](https://youtu.be/8MjjHKIlKko) - Documentary about the assessment gap e.g. disparities between low-value and high-value home assessments
- [State of Illinois Property Tax System](https://tax.illinois.gov/content/dam/soi/en/web/tax/research/publications/documents/localgovernment/ptax-1004.pdf) - A long PDF from the Illinois Department of Revenue explaining property taxes in Illinois
- [Chicago's Pension Challenge: Understanding Why the Pension Funds are Underfunded - Chi Hack Night](https://www.youtube.com/watch?v=wofivGCqBTk) - Excellent overview of the problems with Chicago's pension funds

## R

##### Books and Guides

- [:exclamation: R for Data Science](https://r4ds.hadley.nz) - Classic book on data munging and the basics of modeling, highly recommended
- [:star: Advanced R](https://adv-r.hadley.nz/) - Extremely good overview of the R language, its quirks, and how to use it effectively
- [:star: Package Development in R](https://r-pkgs.org/) - Book on how to develop, use, and test R packages
- [:star: Efficient R Programming](https://csgillespie.github.io/efficientR/) - Online book covering how make R code faster to type and run
- [Debugging with RStudio](https://support.rstudio.com/hc/en-us/articles/200713843?version=1.3.959&mode=server#introduction) - How to use RStudio's built-in debugging features
- [Sharing Data](https://github.com/jtleek/datasharing) - A nice guide on how to share data with others
- [Stat 545](https://stat545.com/) - A very thorough walkthrough of data wrangling and exploration in R, does not cover stats
- [Tidy Data](http://vita.had.co.nz/papers/tidy-data.pdf) - Paper describing the structure and utility of 'tidy' data

##### Cheatsheets

- [:star: Colorbrewer 2](https://colorbrewer2.org/) - Interactive color picker for cartography
- [RStudio Official Cheatsheets](https://posit.co/resources/cheatsheets/) - The official cheatsheets maintained by RStudio. These are 1-2 page printouts covering the vital functions of individual libraries
- [R Color Palette Cheatsheet](https://www.nceas.ucsb.edu/sites/default/files/2020-04/colorPaletteCheatsheet.pdf) - Useful printout covering the colors available in base R

##### Specific Libraries

- [:exclamation: renv Overview](https://rstudio.github.io/renv/articles/renv.html) - A short vignette on how to use `renv`, R's local dependency management system
- [Unit Testing in R](https://stirlingcodingclub.github.io/code_testing/testing_notes.html) - Brief overview of unit testing in R using the `testthat` library
- [Programming with dplyr](https://cran.r-project.org/web/packages/dplyr/vignettes/programming.html) - A quick rundown on how to write functions using the `dplyr` library
- [Using LightGBM in R](https://lightgbm.readthedocs.io/en/latest/R/index.html) - How to use the LightGBM boosted tree framework in R
- [Parallel Parameter Tuning in Tidymodels](https://tune.tidymodels.org/articles/extras/optimizations.html#parallel-processing)

##### Shiny

- [:star: Shiny Best Practices](https://mastering-shiny.org/best-practices.html) - An outline of best practices + an entire book of Shiny resources
- [Advanced Shiny](https://github.com/daattali/advanced-shiny#readme) - A collection of various Shiny tricks for common tasks
- [Docker + ShinyProxy Setup](https://www.prunux.ch/blog/docker-shinyproxy-setup/) - A nice overview of using ShinyProxy with Docker and Docker Compose
- [Shiny Modules](https://shiny.rstudio.com/articles/modules.html) - An overview of how to use Shiny Modules to better organize your code
- [ShinyProxy Config](https://www.shinyproxy.io/) - Website for ShinyProxy, the launcher we used to manage the [Data Science Application Server](https://datascience.cookcountyassessor.com/)

## Git, Linux, and DevOps

- [:exclamation: The Missing Semester of Your CS Education](https://missing.csail.mit.edu) - Start here if you're unfamiliar with the command line interface, build tooling, scripting, etc.

##### Git

- [:exclamation: commit.style](https://commit.style/) - Super brief guide on how to style a commit message. Follow these guidelines
- [:exclamation: Git - The Simple Guide](https://rogerdudler.github.io/git-guide/) - A simple guide on what git does and how to use it (via the command line)
- [:exclamation: pre-commit introduction](https://pre-commit.com/#intro) - How to install and use pre-commit, our local automatic code review system
- [:star: How to Write a Git Commit Message](https://chris.beams.io/posts/git-commit/) - A longer explanation on how to write git commit messages

##### Docker

- [:star: Docker Overview](https://docs.docker.com/get-started/overview/) - Read this to get started with Docker
- [:star: Dockerfile Best Practices](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/) - Required reading if you need to write a Dockerfile
- [:star: Open Containers Labels Spec](https://github.com/opencontainers/image-spec/blob/master/annotations.md) - Standardized schema for container labels. Always use when creating new images
- [Docker Security Best Practices](https://snyk.io/blog/10-docker-image-security-best-practices/) - Tips for creating secure containers/images
- [Reducing Docker Image Size](https://www.ardanlabs.com/blog/2020/02/docker-images-part1-reducing-image-size.html) - Blog post on how to reduce the size of images
- [Deploying R Models in Production](https://medium.com/bbc-data-science/deploying-r-models-in-production-with-apache-airflow-and-aws-batch-9182b0c8ed83) - Walkthrough of how to productionize an R model using Docker. Somewhat outdated now
- [Containerizing Data Workflows](https://medium.com/enigma-engineering/containerizing-data-workflows-95df1d338048) - Using Airflow with Docker to create DAGs

##### DevOps

- [:star: The Twelve-Factor App](https://12factor.net/) - Framework/tips for building a stable application in the modern era
- [:star: Production Readiness Checklist](https://gruntwork.io/devops-checklist/) - Checklist for productionizing an application on AWS
- [:star: SemVer (Semantic Versioning)](https://semver.org/) - Standard for how to version applications, images, or any software
- [Creating Models as Microservices](https://cnr.sh/essays/models-microservices-should-be-using-same-continuous-delivery-stack) - How to functionalize models as APIs
- [Site Reliability Engineering Resources](https://sre.xyz/) - Huge curated list of useful DevOps/SRE resources
- [DevOps Roadmap](https://roadmap.sh/devops) - Guide for skills needed for DevOps roles

## Modeling and Statistics

##### OLS

- [:star: A Deep Dive Into How R Fits a Linear Model](http://madrury.github.io/jekyll/update/statistics/2016/07/20/lm-in-R.html) - Excellent blog post on how R's `lm()` function works under the hood
- [Linear Regressions in R](http://r-statistics.co/Linear-Regression.html) - Basic overview of creating and visualizing linear regressions in R
- [Gradient Descent Overview](https://ruder.io/optimizing-gradient-descent/) - Nice visual overview of how different gradient descent algorithms work
- [Ridge Regression Overview](https://courses.cs.washington.edu/courses/cse446/17wi/slides/ridgeregression-annotated.pdf) - Mathy overview of regularization of overfit models

##### Tree-Based Models

- [:star: Gradient-Boosted Decision Trees, Explained](https://arogozhnikov.github.io/2016/06/24/gradient_boosting_explained.html) - An incredible visual explanation of how boosted trees work
- [xgboost's Introduction to Boosted Trees](https://xgboost.readthedocs.io/en/latest/tutorials/model.html) - Great overview of the math involved in tree-based models
- [LightGBM vs. Catboost Feature Engineering](https://www.kaggle.com/c/zillow-prize-1/discussion/47283) - Nice insight from Kaggle on housing-specific feature engineering

##### Predictive Modeling

- [:star: Max Kuhn's Applied Predictive Modeling](http://appliedpredictivemodeling.com/toc) - One of the best books on predictive modeling. Extremely clear and comprehensive
- [Stacked Model Example with Ames Housing Dataset](https://www.kaggle.com/hansjoerg/glmnet-xgboost-and-svm-using-tidymodels)
- [Scikit-learn Algorithm Cheatsheet](https://scikit-learn.org/stable/tutorial/machine_learning_map/index.html) - A flowchart to choosing an ML estimator

##### Statistics

- [:star: 3Blue1Brown](https://www.youtube.com/channel/UCYO_jab_esuFRV4b17AJtAw) - The best YouTube channel about math, statistics, and machine learning that has ever existed
- [:star: Statistics Done Wrong](https://www.statisticsdonewrong.com/) - Guide to statistics errors, gotchas, and slip-ups
- [:star: Elements of Statistical Learning](https://web.stanford.edu/~hastie/ElemStatLearn/) - Fairly technical book about stats and prediction. A classic
- [Introduction to Statistical Learning](https://www.statlearning.com/) - Excellent book on basic stats and techniques. Less technical than Elements
- [Statistical Rethinking](https://xcelab.net/rm/statistical-rethinking/) - Well-known treatment of Bayesian statistics in R

## SQL

- [:exclamation: Select Star SQL](https://selectstarsql.com/) - Excellent interactive book for learning SQL
- [:star: Use The Index Luke](https://use-the-index-luke.com/) - Explanation of SQL indexing for developers, highly recommended
- [Common Table Expression (CTE) Overview](https://www.essentialsql.com/introduction-common-table-expressions-ctes/) - Short guide to using SQL's WITH statement to unnest complicated queries
- [SQL Server Tutorials](https://www.sqlservertutorial.net/advanced-sql-server/) - Advanced tutorials specifically for SQL Server

## Spatial Data

- [:exclamation: R-Spatial Spatial Data Science Book](https://www.r-spatial.org/book) - Extremely thorough, brand-new book on spatial data in R. Also covers general GIS concepts like reference systems, geometry types, etc.
- [:star: CSDS Spatial Data Tutorials](https://spatialanalysis.github.io/tutorials/) - List of tutorials for manipulating spatial data in R, created by UChicago's Center for Spatial Data Science
- [Simple Features for R](https://r-spatial.github.io/sf/articles/sf1.html) - Long vignette on R's `sf` library, its design, and how to use it
- [Geofabrik](https://download.geofabrik.de/) - Data extracts from the entire OpenStreetMap (OSM) database. Useful for calculating distances
- [Osmium Tool](https://osmcode.org/osmium-tool/manual.html) - Tool for manipulating and filtering OSM data. Requires using a command line
- [Geocomputation in R](https://geocompr.robinlovelace.net/intro.html) - Free book covering lots of geospatial munging in R

