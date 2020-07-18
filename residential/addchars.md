# Home Improvement Exemptions (288s)

# Overview 

The State of Illinois has a home improvement exemption program which allows property owners to deduct up to $75,000 per year of any value created by improvements to a residential property.

This has the effect of essentially "freezing" a home's characteristics at whatever they were prior to the start of the improvement project. For example, if a property owner adds an additional bedroom and applies for a 288, the property will be valued as if the new bedroom does not exist until the 288 expires and as long as the increase in valuation is less than $75,000.

[Per Illinois statute](https://www.ilga.gov/legislation/ilcs/fulltext.asp?DocName=003502000K15-180), 288s expire after 4 years or until the next assessment cycle, whichever is longer. For example, a 288 received in 2016 for a property in Northfield (with assessment years 2016, 2019, and 2022) will last 6 years (until 2021, the year before the 2022 reassessment).

# Package Usage

The `chars_` set of functions in the [ccao package](https://gitlab.com/ccao-data-science---modeling/packages/ccao) are designed to make handling 288s simpler and more consistent. Two sample datasets, `chars_sample_addchars` and `chars_sample_universe` are included to simulate real-world use. The `chars_sample_addchars` dataset is a direct sample of data from the ADDCHARS SQL table and includes individual rows listing the PIN, start date, class, and characteristic updates associated with a 288 Home Improvement Exemption. This data format is difficult to work with and complicated by that fact that multiple 288s can be active at the same time for different periods, and some columns from ADDCHARS add to existing characteristics, while some overwrite existing characteristics.

The included `chars_sparsify()` function transforms these single rows into a sparse data frame which lists a row and characteristic update per PIN per year per class. This is most easily visualized with a mock dataset:

The base ADDCHARS data syntax looks like:

| QU_PIN     | TAX_YEAR | QU_TOWN | QU_UPLOAD_DATE | QU_SQFT_BLD | QU_ROOMS |
|------------|----------|---------|----------------|-------------|----------|
| 12345      | 2013     | 77      | 130702         | 200         | 0        |
| 12345      | 2015     | 77      | 150703         | 300         | 1        |

This function will transform it into:

| QU_PIN | YEAR | QU_SQFT_BLD | QU_ROOMS |
|--------|------|-------------|----------|
| 12345  | 2013 | 200         | 0        |
| 12345  | 2014 | 200         | 0        |
| 12345  | 2015 | 500         | 1        |
| 12345  | 2016 | 500         | 1        |
| 12345  | 2017 | 500         | 1        |
| 12345  | 2018 | 300         | 1        |
| 12345  | 2019 | 300         | 1        |
| 12345  | 2020 | 300         | 1        |

