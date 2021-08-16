The Cook County Assessor's Office is committed to transparency. In order to fulfill that commitment, the Data Department is tasked with creating and maintaining public data sets. This document outlines these data, their uses, and pertinent source code. 

The Cook County Assessor's Office publishes data on the [Cook County Open Data Portal](https://datacatalog.cookcountyil.gov/browse?tags=cook%20county%20assessor). The [AssessR](https://ccao-data-science---modeling.gitlab.io/packages/assessr/articles/example-ratio-study.html) package leverages this open data in its documentation.

## Curated Data 

The Data Department will create and maintain or update the following open data sets. Due to ongoing upgrades to the system of record used to maintain and update assessment data, many updates will occur later in 2021.

### Residential Property Characteristics: [2010-2020](https://datacatalog.cookcountyil.gov/Property-Taxation/Cook-County-Assessor-s-Residential-Property-Charac/bcnq-qi2z), [2021](https://datacatalog.cookcountyil.gov/Property-Taxation/Cook-County-Assessor-s-Residential-Modeling-Charac/8f9d-wy2d)

**Universe:** [Regression-class](https://gitlab.com/ccao-data-science---modeling/models/ccao_res_avm#data-used) residential parcels. In the 2010-2020 data set, each row is unique by PIN and its characteristic vector. For example, consider a home that was built in 1950, and then renovated in 2015. This home would have two rows in the data: one for its characteristics before renovation, and one for after.

**Update frequency:** Annually, with the creation of each year's characteristics file used to produce initial estimates of home values.  

**Use cases:** This data describes the location and physical characteristics of all residential property in the County. It can be used on its own to characterize the housing stock in a specific location. It can also be joined against other data to produce analysis. Joining characteristics on assessments allows analysis of assessments across geographies and housing types. The 2021 Chicago data set also includes recent sales.

**Code:** [etl_residential_characteristics](https://gitlab.com/ccao-data-science---modeling/processes/etl_residential_characteristics).

**Dictionary:** See data sets.

### [Residential Sales](https://datacatalog.cookcountyil.gov/Property-Taxation/Cook-County-Assessor-s-Residential-Sales-Data/5pge-nu6u)

**Universe:** Deeds associated with 2-00 Class PINs 2010-2019. This data is unique by deed number. The [2021 Chicago data](https://datacatalog.cookcountyil.gov/Property-Taxation/Cook-County-Assessor-s-Residential-Modeling-Charac/8f9d-wy2d) also includes sales up through the end of 2020.

**Update frequency:** Annually, with the creation of each year's sales file. 

**Use cases:** Alone, sales data can be used to characterize residential housing markets. Sales paired with characteristics can be used to find comparable properties or as an input to an automated modeling application. Sales paired with assessments can be used to calculate sales ratio statistics.

**Code:** [etl_res_data](https://gitlab.com/ccao-data-science---modeling/processes/etl_res_data)

### [Assessments 2010 through 2020](https://datacatalog.cookcountyil.gov/Finance-Administration/Cook-County-Assessor-s-Assessments/tnes-dgyi)

This data replaces both [Residential Assessments 2015-2019](https://datacatalog.cookcountyil.gov/Property-Taxation/Cook-County-Assessor-s-Residential-Assessments/uqb9-r7vn) and [Archived -- First Pass Values](https://datacatalog.cookcountyil.gov/Property-Taxation/Archive-Cook-County-Assessor-s-First-Pass-Values/x88m-e569). 

**Universe:** All PINs

**Update frequency:** Pending data architecture.

**Use cases:** Alone, can characterize assessments in a given area. Can be combined with characteristic data to make more narrow generalizations about assessments. Can be combined with sales data to conduct ratio studies. 

**Code:** [VW_OPENDATA_ASSESSMENTS](https://gitlab.com/ccao-data-science---modeling/data-architecture/-/blob/master/code.sql/CCAODATA/VW_OPENDATA_ASSESSMENTS.sql)

### Exemptions by Tax Code [2010-2019](https://datacatalog.cookcountyil.gov/Finance-Administration/Cook-County-Assessor-s-Residential-Exemption-Amoun/a536-gjbq/)

**Universe:** Exemptions administered in each tax code. When available, may also includes value of residential exemptions totaled to the tax code level, calculated by the [Cook County Clerk](https://www.cookcountyclerkil.gov/service/tax-agency-reports).

**Update frequency:** TBD.

**Use cases:** Determining how many and which homestead exemptions have been administered by the Assessor's Office in each tax code. 

**Code:** TBD

### Commercial Apartment Valuation Data

**Universe:** TBD

**Update frequency:** TBD

**Use cases:** There are a wide range of research and public service applications for this data. 

**Code:** TBD

### [Neighborhood Boundaries](https://datacatalog.cookcountyil.gov/Finance-Administration/Cook-County-Assessor-s-Residential-Neighborhood-Bo/wyzt-dzf8)

**Universe:** All CCAO residential 'neighborhoods.'

**Update frequency:** With changes to neighborhood definitions. None are pending.

**Use cases:** Thematic mapping and location references. 

**Code:** There is no code associated with this data. 

### [COVID Replication Data](https://datacatalog.cookcountyil.gov/Finance-Administration/Cook-County-Assessor-s-Residential-COVID-Adjustmen/sypz-gxn2)

During April of 2020, we calculated a set of neighborhood-level adjustments to apply to residential property in order to account for the COVID pandemic. This data can be used to execute the report and analysis for that adjustment.

**Universe:** All CCAO residential assessment neighborhoods.

**Update frequency:** Never; this is a one-time analysis.

**Use cases:** Replicating our COVID analysis.

**Code:** [COVID Impact on Residential Home Values](https://gitlab.com/ccao-data-science---modeling/covid-impact-on-residential-home-values)

### [PIN Locations](https://datacatalog.cookcountyil.gov/Property-Taxation/Cook-County-Assessor-s-Residential-Property-Charac/bcnq-qi2z)

**Universe:** All 14-character PIN Numbers, associated  parcel centroid lat/long coordinates, and other geographies. 

**Update frequency:** Annually, with the finalization of each parcel map.

**Use cases:** Finding PINs and plotting them on maps.

**Code:**  [etl_pinlocations](https://gitlab.com/ccao-data-science---modeling/processes/etl_pinlocations)

### [Parcel Shapes](https://hub-cookcountyil.opendata.arcgis.com/datasets/3d3375ac11d147308815d5cf4bb43f4e_21)

Parcel shapes are published by the Cook County Bureau of Technology and noted here for reference.
