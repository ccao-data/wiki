The Cook County Assessor's Office is committed to transparency. In order to fulfill that commitment, the Data Department is tasked with creating and maintaining public data sets. This document outlines these data, their uses, and pertinent source code. 

The Cook County Assessor's Office publishes data on the [Cook County Open Data Portal](https://datacatalog.cookcountyil.gov/browse?tags=cook+county+assessor). The [AssessR](https://ccao-data-science---modeling.gitlab.io/packages/assessr/articles/example-ratio-study.html) package leverages this open data in its documentation.

## Curated Data 

The Data Department creates and maintains the following open data sets.

### [Parcel Universe](https://datacatalog.cookcountyil.gov/Property-Taxation/Assessor-Parcel-Universe/3su6-m52d)

| Timeframe    | Property Classes | Unique By | Row    | Updated |
| :---:        | :---:            | :---:     | :---:  | :---:   |
| 1999-Present | All              | PIN, Year | Parcel | Monthly |

**Notes**: Contains a cornucopia of locational and spatial data for all parcels in Cook County.

**Use cases:** Joining parcel-level data to this dataset allows analaysis and reporting across a number of different poltiical, tax, census, and other boundaries. Distances to a number of common ammenities can be used for spatial analysis.

**Code:** [default-vw_pin_universe.sql](https://gitlab.com/ccao-data-science---modeling/data-architecture/-/blob/master/aws-athena/views/default-vw_pin_universe.sql)

### [Single and Multi-Family Improvement Characteristics](https://datacatalog.cookcountyil.gov/Property-Taxation/Assessor-Single-and-Multi-Family-Improvement-Chara/x54s-btds)

| Timeframe    | Property Classes | Unique By | Row                         | Updated   |
| :---:        | :---:            | :---:     | :---:                       | :---:     |
| 1999-Present | [Regression-class](https://gitlab.com/ccao-data-science---modeling/models/ccao_res_avm#data-used)         | PIN, Card, Year | Residential Improvement | Bi-Weekly |

**Notes**: Residential PINs with multiple improvements (living structures) will have one card for _each_ improvement.

**Use cases:** This data describes the location and physical characteristics of all single and multi-family improvements in the county. It can be used

- on its own to characterize the housing stock in a specific location
- joined to assessments for analysis of assessments across geographies and housing types
- joined to sales for the construction of hedonic home value estimates

**Code:** [default-vw_card_res_char.sql](https://gitlab.com/ccao-data-science---modeling/data-architecture/-/blob/master/aws-athena/views/default-vw_card_res_char.sql)

### [Residential Condominium Parcel Characteristics](https://datacatalog.cookcountyil.gov/Property-Taxation/Assessor-Residential-Condominium-Parcel-Characteri/3r7i-mrz4)

| Timeframe    | Property Classes | Unique By | Row              | Updated  |
| :---:        | :---:            | :---:     | :---:            | :---:    |
| 1999-Present | 299, 399         | PIN, Year | Condominium Unit | Bi-Weekly |

**Notes:**

**Use cases:** This data describes the location and physical characteristics of all condominium units in the county. Condominium units are associated with substantially less characteristics data than single and multi-family improvements. It can be used

- on its own to characterize the housing stock in a specific location
- joined to assessments for analysis of assessments across geographies and housing types
- joined to sales for the construction of hedonic home value estimates

**Code:** [default-vw_pin_condo_char.sql](https://gitlab.com/ccao-data-science---modeling/data-architecture/-/blob/master/aws-athena/views/default-vw_pin_condo_char.sql)

### [Parcel Sales](https://datacatalog.cookcountyil.gov/Property-Taxation/Assessor-Parcel-Sales/wvhk-k5uv)

| Timeframe    | Property Classes | Unique By        | Row         | Updated |
| :---:        | :---:            | :---:            | :---:       | :---:   |
| 1999-Present | All              | Sale Deed Number | Parcel Sale | Monthly |

**Notes:** Refreshed monthly, though data may only change roughly quarterly depending on how often new sales are added to iasWorld. 

**Use cases:** Alone, sales data can be used to characterize real estate markets. Sales paired with characteristics can be used to find comparable properties or as an input to an automated modeling application. Sales paired with assessments can be used to calculate sales ratio statistics. Outliers can be easily removed using filters constructed on class, township, and year.

**Code:** [default-vw_pin_sale.sql](https://gitlab.com/ccao-data-science---modeling/data-architecture/-/blob/master/aws-athena/views/default-vw_pin_sale.sql)

### [Historic Parcel Values](https://datacatalog.cookcountyil.gov/Property-Taxation/Assessor-Historic-Parcel-Values/uzyt-m557)

| Timeframe    | Property Classes | Unique By | Row    | Updated |
| :---:        | :---:            | :---:     | :---:  | :---:   |
| 1999-Present | All              | PIN, Year | Parcel | Monthly |

**Notes:** Refreshed monthly, data is updated as towns are mailed/certified by valuations and the Board of Review. 

**Use cases:** Alone, can characterize assessments in a given area. Can be combined with characteristic data to make more nuanced generalizations about assessments. Can be combined with sales data to conduct ratio studies. 

**Code:** [default-vw_pin_history.sql](https://gitlab.com/ccao-data-science---modeling/data-architecture/-/blob/master/aws-athena/views/default-vw_pin_history.sql)

### [Neighborhood Boundaries](https://datacatalog.cookcountyil.gov/Property-Taxation/Assessor-Neighborhood-Boundaries/pcdw-pxtg)

| Timeframe | Property Classes | Unique By        | Row                  | Updated  |
| :---:     | :---:            | :---:            | :---:                | :---:    |
| 2021      | —                | Neighborhood Code | Neighborhood Polygon | Annually |

**Notes:** Refreshed yearly, but only changes with new neighborhood definitions. None are pending.

**Use cases:** Thematic mapping and location references. 

**Code:** [spatial-ccao-neighborhood.R](https://gitlab.com/ccao-data-science---modeling/data-architecture/-/blob/master/aws-s3/scripts-ccao-data-warehouse-us-east-1/spatial-ccao-neighborhood.R) 
