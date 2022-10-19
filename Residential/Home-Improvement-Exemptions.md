# Overview 

The State of Illinois has a [Home Improvement Exemption statute](https://www.ilga.gov/legislation/ilcs/fulltext.asp?DocName=003502000K15-180) which allows property owners to deduct up to $75,000 (market value) per year of any value created by improvements to a residential property. Internally, these exemptions are known as 288s (based on the class they are recorded under) or HIEs (Home Improvement Exemptions).

288s essentially "freeze" a home's characteristics at whatever they were prior to the start of the improvement project. For example, if a property owner adds an additional bedroom and applies for a 288, the property will be valued as if the new bedroom does not exist until the 288 expires and as long as the increase in market value is less than $75,000. Any value beyond the $75,000 threshold is included in the property's assessment.

Note that 288s apply only to residential properties, excluding condominiums.

#### Timeline

Per Illinois statute, 288s expire after 4 years or until the next assessment cycle, whichever is longer. Since Cook County reassessments occur every 3 years, 288s can be active for up to 6 years. For example, a 288 activated in 2015 for a property in West Chicago (with assessment years 2015, 2018, and 2021) will last 6 years (until 2021, the next reassessment year). Visually, this looks like Option C below:

![](/Residential/Exemptions/288-timeline.png)

#### Data Model

288s work by storing any updated property characteristics in a separate file/row from the main set of characteristics. When a 288 expires, these updated characteristics are automatically rolled into the main set of characteristics. A sample 288 might look something like:

| PIN        | TAX_YEAR | TOWN    | UPLOAD_DATE    | SQFT_BLD    | ROOMS    | EXT_WALL    |
|------------|----------|---------|----------------|-------------|----------|-------------|
| 12345      | 2015     | 77      | 150703         | 300         | 1        | 4           |

The update process is complicated by some characteristics being additive, while others are replacements. In this instance, the above 288 would:

- *Add* 300 square feet to the total existing square footage of the building
- *Add* 1 additional room to the total number of existing rooms in the building
- *Replace* the existing exterior wall type of the building

A list of which characteristics are additive and which are replacements is available in the [ccao R package](https://gitlab.com/ccao-data-science---modeling/packages/ccao) (see the `chars_cols` data set).

# Administration 

288 data is currently used in three different contexts.

1. Expiring 288s permanently update property characteristics data at the end of each year. This happens (mostly) automatically and is handled by the Valuations department. In certain cases, such as modeling future years or displaying public characteristic information, it can be beneficial to manually update property characteristics as if certain 288s are expired.

2. 288 data is *always* used to update characteristics when modeling or performing sales ratio studies. This is because a property's sale price will reflect the value of its *actual* characteristics (i.e. those stored by the 288), not the value of the frozen characteristics used for assessment. When training [the model](https://gitlab.com/ccao-data-science---modeling/models/ccao_res_avm) and evaluating its performance, all training data [is updated to include 288
characteristic updates](https://gitlab.com/ccao-data-science---modeling/processes/etl_res_data/-/blob/master/scripts/create_modeldata.R).

3. The characteristic updates resulting from 288s must be evaluated to ensure they do not exceed the $75,000 market value cap. Currently, this is accomplished using a cost table which values the individual improvements resulting from a 288. For example, one additional bedroom might be worth $10K, one bathroom $5K, etc. If the sum total of these improvements exceeds $75,000, then any remainder is added to the property's assessment. In the future, this method will likely be changed to use a model, rather than cost table, approach. 

All of these tasks rely on the [ccao R package](https://gitlab.com/ccao-data-science---modeling/packages/ccao) to manually update characteristics using 288 data.

# R Package

The [ccao R package](https://gitlab.com/ccao-data-science---modeling/packages/ccao) contains a set of functions (prefixed with `chars_`) designed to make handling 288s easier and more consistent. Two sample data sets, `chars_sample_addchars` and `chars_sample_universe` are included to simulate real-world use.

- `chars_sample_addchars` contains sample 288 updates for a set of random PINs. Each row contains a PIN, start date, class, and any associated characteristic updates.
- `chars_sample_universe` contains the properties to which the updates in `chars_sample_addchars` are applied.

For more information on the structure of 288 data and the individual `chars_` functions, visit the [ccao R package documentation site](https://ccao-data-science---modeling.gitlab.io/packages/ccao/reference/).
