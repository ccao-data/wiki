The Cook County Assessor's Office is committed to transparency. In order to fulfill that committment, the Data Science Department is tasked with creating and maintaining public data sets. This document outlines these data, their uses, and pertinent source code. 

The Cook County Assessor's Office publishes data on the [Cook County Open Data Portal](https://datacatalog.cookcountyil.gov/browse?tags=cook%20county%20assessor). The [AssessR](https://ccao-data-science---modeling.gitlab.io/packages/assessr/articles/example-ratio-study.html) package leverages this open data in its documentation.

## Curated Data 

The Chief Data Officer will create and maintain the following open data sets. 

### [Residential Property Characteristics](https://datacatalog.cookcountyil.gov/Property-Taxation/Cook-County-Assessor-s-Residential-Property-Charac/bcnq-qi2z)

**Universe:** 2-00 Class PIN Numbers 2010 - present. The data is organised such that it is unique by PIN and its characteristic vector. For example, consider a home that was built in 1950, and then rennovated in 2015. This home would have two observations in the data, one that contained its characteristics pre-rennovation, and one for post.

**Update frequency:** Anually, with the creation of each year's characteristics file. 

**Use cases:** This data describes the location and physical characteristics of all residential property in the County. It can be used on its own to characterize the housing stock in a specific location. It can also be joined against other data to produce analysis. Joining characteristics on assessments allows analysis of assessments across geographies and housing types. 

**Code:** [etl_residential_characteristics](https://gitlab.com/ccao-data-science---modeling/processes/etl_residential_characteristics).

**Dictionary:**

### [Residential Sales](https://datacatalog.cookcountyil.gov/Property-Taxation/Cook-County-Assessor-s-Residential-Sales-Data/5pge-nu6u)

**Universe:** Deeds associated with 2-00 Class PINs 2010-present. This data is unique by deed number. 

**Update frequency:** Anually, with the creation of each year's sales file. 

**Use cases:** Alone, sales data can be used to characterize residential housing markets. Sales paired with characteristics can be used as an input to an automated modeling application. Sales paird with assessments can be used to calculate sales ratio statistics.

**Code:** [etl_res_data](https://gitlab.com/ccao-data-science---modeling/processes/etl_res_data)

### Assessments (2021)

This data replaces both [Residential Assessments](https://datacatalog.cookcountyil.gov/Property-Taxation/Cook-County-Assessor-s-Residential-Assessments/uqb9-r7vn) and [First Pass Values](https://datacatalog.cookcountyil.gov/Property-Taxation/Archive-Cook-County-Assessor-s-First-Pass-Values/x88m-e569). 

**Universe:** All PINs

**Update frequency:** Semi-anually. Once towards the end of the calendar year after the CCAO certifies all towns, and once in the spring of the following year when the Board of Review certifies all towns.

**Use cases:** Alone can charactarize assessments in a given area. Can be combined with characgeristic data to make more narrow generalisations about assessments. Can be combined with sales data to conduct ratio studies. 

**Code:** [VW_OPENDATA_ASSESSMENTS](https://gitlab.com/ccao-data-science---modeling/data-architecture/-/blob/master/code.sql/CCAODATA/VW_OPENDATA_ASSESSMENTS.sql)

### Exemptions by Tax Code (2021)

**Universe:** Value of residential exemptions totaled to the tax code level.

**Update frequency:** Anually, with the creation of each year's exemption roll.

**Use cases:** Calculating tax bases.

**Code:** TBD

### Commercial Apartment Valuation Data

**Universe:** Data driving the [commercial automated valuation model](https://gitlab.com/ccao-data-science---modeling/models/commercial-apartments-automated-valuation-model).

**Update frequency:** TBD

**Use cases:** There are a wide range of research and public service applications for this data. 

**Code:** TBD

### [Neighborhood Boundaries](https://datacatalog.cookcountyil.gov/Finance-Administration/Cook-County-Assessor-s-Residential-Neighborhood-Bo/wyzt-dzf8)

**Universe:** All CCAO residential 'neighborhoods.'

**Update frequency:** With changes to neighborhood definitions. These changes are very rare. 

**Use cases:** Thematic mapping and location references. 

**Code:** There is no code associated with this data. 

### [COVID Replication Data](https://datacatalog.cookcountyil.gov/Finance-Administration/Cook-County-Assessor-s-Residential-COVID-Adjustmen/sypz-gxn2)

During April of 2020, we calculated a set of neighborhood-level adjustments to apply to residential property in order to account for the COVID pandemic. This data can be used to execute the report and analysis for that adjustment.

**Universe:** All CCAO residential 'neighborhoods' in the south triennial area.

**Update frequency:** Never, this is a one-time analysis.

**Use cases:** Replicating our COVID analysis.

**Code:** [COVID Impact on Residential Home Values](https://gitlab.com/ccao-data-science---modeling/covid-impact-on-residential-home-values)

### [PIN Locations](https://datacatalog.cookcountyil.gov/Property-Taxation/Cook-County-Assessor-s-Residential-Property-Charac/bcnq-qi2z)

**Universe:** All 14-character PIN Numbers, their parcel centoid lat/long coordinates, and associated geographies.

**Update frequency:** Anually, with the finalization of each parcel map.

**Use cases:** Finding PINs and plotting them on maps.

**Code:**  [etl_pinlocations](https://gitlab.com/ccao-data-science---modeling/processes/etl_pinlocations)

### [Parcel Shapes](https://hub-cookcountyil.opendata.arcgis.com/datasets/3d3375ac11d147308815d5cf4bb43f4e_21)

Parcel shapes are published by the Cook County Bureau of Technology and noted here for reference.
