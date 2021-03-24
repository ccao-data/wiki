Resources, notes, and helpful links used by the Data Science Department. Organized by section and ordered alphabetically. 

- :star: denotes required reading/usage for interns and new hires
- :star2: denotes a recommended resource

## Useful Bookmarks

Take a moment to bookmark these commonly used CCAO links:

#### For Employees Only

- [:star: CCAO Webmail](https://webmail.cookcountyassessor.com/owa/#path=/mail/inbox) - Web-based version of Outlook available to employees
- [:star: CCT](https://www.cookcountyil.gov/cct) - Cook County Time and Attendance, the web-based portal for tracking hours, time-off, etc.
- [Data Science Application Server](https://datascience.cookcountyassessor.com/) - Shiny server that launches CCAO Shiny applications. Login with Windows credentials. **Must be connected to the VPN to access**. May throw a security warning when you first visit. This warning can safely be ignored. Click **Advanced --> Accept the risk** to bypass the warning.
- [Employee Self-Service (ESS)](https://ccgprod.cookcountyil.gov/) - Benefits enrollment and tracking

#### External Links

- [:star: CCAO GitLab](https://gitlab.com/ccao-data-science---modeling) - Main source for all Data Science Department code
- [Cook County Assessor's PIN Search](https://www.cookcountyassessor.com/address-search) - Our office's application to find information about a PIN
- [Cook County Property Info](http://www.cookcountypropertyinfo.com/) - The County's application to find information about a PIN
- [Cook Viewer](https://maps.cookcountyil.gov/cookviewer/mapViewer.html) - A GIS application for finding PINs
- Subscribe to the [CCAO’s external newsletter](https://public.govdelivery.com/accounts/ILCOOK/signup/12686)
- Subscribe to the CCAO’s social media channels: 
  - [Facebook](https://www.facebook.com/CookCountyAssessorsOffice)
  - [Instagram](https://www.instagram.com/cookcountyassessor/)
  - [LinkedIn](https://www.linkedin.com/company/35589706)
  - [Twitter](https://twitter.com/AssessorCook)
  - [YouTube](https://www.youtube.com/channel/UC9w4Q3ZJyRS5J27eYKSjwZQ)
- [IAAO Technical Standards](https://iaao.org/wcm/Resources/Technical_Standards/wcm/Resources_Content/Pubs/Technical_Standards.aspx) - Technical standards and measurements for the assessment field

## Reporting

Useful reports that provide context about our office, its history, and its problems:

- [Chicago Triad Assessment Report (2018) - Civic Consulting Alliance](https://prodassets.cookcountyassessor.com/s3fs-public/reports/2018ChicagoTriadSRSvf.pdf) - Study of 2018 assessment quality in the Chicago triad
- [Report on Property Taxes in Wicker Park - Block Club Chicago](https://blockclubchicago.org/2021/03/23/after-decades-in-wicker-park-senior-homeowners-forced-out-by-skyrocketing-property-taxes-this-neighborhood-has-broken-my-heart/) - Story on how increases in assessed value are affecting Wicker Park
- [:star: The Tax Divide - Chicago Tribune](https://www.chicagotribune.com/investigations/ct-tax-divide-investigation-20180425-storygallery.html) - An excellent outline of the historical problems with the CCAO

## R

### Books and Guides

- [:star2: Advanced R](http://adv-r.had.co.nz/Introduction.html) - Extremely good overview of the R language, its quirks, and how to use it effectively
- [Debugging with RStudio](https://support.rstudio.com/hc/en-us/articles/200713843?version=1.3.959&mode=server#introduction) - How to use RStudio's built-in debugging features
- [:star2: Efficient R Programming](https://csgillespie.github.io/efficientR/) - Online book covering how make R code faster to type and run
- [Linear Regressions in R](http://r-statistics.co/Linear-Regression.html) - Basic overview of creating and visualizing linear regressions in R
- [Making R Code Faster](https://robinsones.github.io/Making-R-Code-Faster-A-Case-Study/) - Blog post on the basics of speeding up slow code
- [Optimizing Your R Code](https://www.statworx.com/ch/blog/optimising-your-r-code-a-guided-example/) - Blog post on how to benchmark and optimize bottlenecks
- [:star2: Package Development in R](https://r-pkgs.org/) - Book on how to develop, use, and test R packages
- [:star2: R for Data Science](https://r4ds.had.co.nz/) - Classic book on data munging and the basics of modeling, highly recommended
- [Sharing Data](https://github.com/jtleek/datasharing) - A nice guide on how to share data with others
- [Stat 545](https://stat545.com/) - A very thorough walkthrough of data wrangling and exploration in R, does not cover stats
- [Tidy Data](http://vita.had.co.nz/papers/tidy-data.pdf) - Paper describing the structure and utility of 'tidy' data

### Cheatsheets

- [:star2: Colorbrewer 2](https://colorbrewer2.org/) - Interactive color picker for cartography
- [RStudio Official Cheatsheets](https://rstudio.com/resources/cheatsheets/) - The official cheatsheets maintained by RStudio. These are 1-2 page printouts covering the vital functions of individual libraries
- [R Color Palette Cheatsheet](https://www.nceas.ucsb.edu/sites/default/files/2020-04/colorPaletteCheatsheet.pdf) - Useful printout covering the colors available in base R

### Specific Libraries

- [LightGBM in R](https://lightgbm.readthedocs.io/en/latest/R/index.html) - How to use the LightGBM boosted tree framework in R
- [Programming with dplyr](https://cran.r-project.org/web/packages/dplyr/vignettes/programming.html) - A quick rundown on how to write functions using the `dplyr` library
- [:star: renv Overview](https://rstudio.github.io/renv/articles/renv.html) - A short vignette on how to use `renv`, R's local dependency management system
- [Speeding Up OLS](https://nelsonareal.net/blog/2017/06/speeding_up_ols.html) - Using `fastLm()` for quicker regressions
- [Testing in R](https://github.com/SchlossLab/intro-testing-r) - Brief overview of unit testing in R using the `testthat` library

### Shiny

- [Advanced Shiny](https://github.com/daattali/advanced-shiny#readme) - A collection of various Shiny tricks for common tasks
- [Docker + ShinyProxy Setup](https://www.prunux.ch/blog/docker-shinyproxy-setup/) - A nice overview of using ShinyProxy with Docker and Docker Compose
- [:star2: Shiny Best Practices](https://mastering-shiny.org/best-practices.html) - An outline of best practices + an entire book of Shiny resources
- [Shiny Modules](https://shiny.rstudio.com/articles/modules.html) - An overview of how to use Shiny Modules to better organize your code
- [ShinyProxy Config](https://www.shinyproxy.io/) - Website for ShinyProxy, the launcher we used to manage the [Data Science Application Server](https://datascience.cookcountyassessor.com/)

## Git

- [:star: commit.style](https://commit.style/) - Super brief guide on how to style a commit message. Follow these guidelines
- [How to Write a Git Commit Message](https://chris.beams.io/posts/git-commit/) - A longer explanation on how to write git commit messages
- [Git - The Simple Guide](https://rogerdudler.github.io/git-guide/) - A simple guide on what git does and how to use it (via the command line)
- [Sourcetree Guides](https://confluence.atlassian.com/get-started-with-sourcetree) - Documentation for Sourcetree (if you prefer a GUI git client)

