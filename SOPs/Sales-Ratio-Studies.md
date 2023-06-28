# Overview

This policy governs the calculation and reporting of sales ratio studies for residential property.

A **sales ratio** is the ratio of the assessor's estimate of a property's value to its sale price. A **sales ratio study** is a statistical analysis of how accurately, uniformly, and equitably an assessor estimated property values.

## Related Information

This policy governs functions contained in the [ccao R package](https://github.com/ccao-data/ccao).

This policy references the [IAAO Standard on Ratio Studies](https://www.iaao.org/media/standards/Standard_on_Ratio_Studies.pdf).

# Methods

## Stratification

**Reporting Groups.** The Data Department groups relevant [residential property classes](https://github.com/ccao-data/model-res-avm#primary-data) into Single-Family, Multi-Family, and Condominium modeling and reporting groups.

**Geography.** Properties are stratified according to geography (triennial region and township).

**Other.** Properties may also be stratified according to sale price, assessed value, physical characteristics, other geographies, and other attributes.

## Minimum Sample Size

A valid ratio study requires at least 30 observations.

## Sales Selection

### Data Source

Sales are obtained from the MyDec Web Service ('MyDec'), a service by the Illinois Department of Revenue. They are [pre-processed](/SOPs/Open-Data.md#parcel-sales) to correct, for example, multiple deeds recorded on a given PIN on a single day listing different transaction amounts.

### Exclusion Criteria

Sales ratio studies may exclude the following:

* **Multi-parcel sales.** Deeds transacted on multiple PINs are excluded.
* **Foreclosures and bank sales.** Foreclosure and Real Estate Owned sales may be excluded from the sales samples. Sales are excluded based on deed type: Quitclaim Deeds, Executor Deeds, 'B' type deeds.
* **Outlier sales.** Sales with amounts less than $10,000, and sales otherwise determined by the CCAO to be unlikely to reflect arms-length transactions, are excluded.
* **Properties with known characteristic changes.** Properties known to have undergone physical and/or legal characteristic changes between the time of sale and assessment are excluded.
* **Special properties.** Some residential properties classified as 'Single-Family' are valued by the 'Special Properties' division of the Valuations Department. These are excluded from the sales ratio study.

### Comparison Years

For ratio studies used to evaluate current-year or past-year assessments, assessments should be compared to sales that occurred in the prior year. For example, 2020 assessments should be compared to sales that occurred in 2019.

The Data Department may also, in preparation for an upcoming revaluation, conduct ratio studies of past assessments and current sales. This helps to set informal expectations to indicate magnitude and direction of market changes in the years since the past assessment.

## Ratio Study Code and Data Publication

The Data Department publishes its ratio study code in [AssessR](https://github.com/ccao-data/assessr). The Data Department also publishes sales and Fair Cash Values on [Cook County's Open Data portal](https://datacatalog.cookcountyil.gov/stories/s/9bqn-cfsv).

## Outlier Trimming

The top and bottom 5% of sales in terms of sales ratios are excluded from sales ratio studies.

# Results and Interpretation

## Results

The following statistics must be included in any sales ratio study. See appendix for calculations.

* COD
* PRD
* PRB
* Median Assessment Ratio
* The measure of sales chasing as defined by E.4 in the IAAO Standard on Ratio Studies

**Measures of Variance/Reliability.** Confidence intervals should accompany point estimates for COD, PRD, PRB, and Median Ratio.

The ratio study must also include the following descriptive statistics:

* Sample size (count of sold properties in the ratio study)
* Population size (count of sold and unsold properties in the strata to which the ratio study may generalize)
* Median sale price
* Median estimated value

## Interpretation

Each statistic's point estimate is evaluated to see whether it falls within the acceptable ranges below.

| Statistic  | Acceptable Range  | Interpretation  |
|---|---|---|
|Coefficient of Dispersion (COD)   | 5 - 15   |The COD measures Uniformity: how often properties with the same sale price receive the same predicted market value. Lower CODs indicate more fairness between similarly priced properties.   |
|Price-related Differential (PRD)   | .98 - 1.03  |The PRD measures Vertical Equity: how often properties with lower vs. higher sale prices receive proportionately similar assessments.   |
|Price-related Bias (PRB)   | -.05 - .05  |PRB is a different approach to measuring Vertical Equity, by measuring the slope of ratios of homes with lower vs. higher sale prices.   |
|Median Sales Ratio   |  .90 - 1.00 |The median ratio measures Accuracy: whether most estimates accurately reflect sale prices.   |
|Sales Chasing (E.4)   | $`\le`$ 5%  |Measures the degree to which the statistics above are true reflections of the quality of assessments for sold and unsold properties.   |

**Standard Met.** Below are the criteria to measure whether standards for Uniformity, Vertical Equity, and Accuracy have been met.

* Uniformity: if the COD is within the acceptable range, then assessments have met the standard for uniformity.
* Vertical Equity: if either the PRD or PRB is within the acceptable range, then assessments have met the standard for vertical equity.
* Accuracy: if the Median Ratio is within the acceptable range, then assessments have met the standard for accuracy.

**High-quality assessment.** Assessments can be said to have met standards for high-quality assessments if standards for Uniformity, Vertical Equity, and Accuracy have been met.

## Validity

If the COD is lower than 5.0 and the test for Sales Chasing suggests sales chasing has occurred, further investigation is needed to ensure validity of the ratio study before it is used internally or externally.

Note: CODs lower than 5.0, according to IAAO's Standard on Ratio Studies Section 9.2, may indicate issues with the validity of the ratio study (due to sales chasing), or may indicate a valid study conducted on a homogeneous strata of properties. As such, when the COD is lower than 5.0, the interpretation is nonetheless that the COD standard is met.

# Publication

In addition to using ratio studies internally, the Assessor's Office is committed to periodically publishing ratio studies.

**Annual Reporting:** The Cook County Assessor's Office publishes annual reports to the public and submits reports to Cook County for its annual reporting. These reports contain the results of a sales ratio study of residential properties in the County.

**Township Reporting:** The Data Department shall produce sales ratio studies for each triennially reassessed township.

The Data Department shall produce additional sales ratio studies as requested by the Cook County Assessor.

# Appendix

## Definitions

**Fair Cash Value (FCV):** The amount for which a property can be sold in the due course of business and trade, not under duress, between a willing buyer and a willing seller. (35 ILCS 200/1-50)

**Sales Ratio:** The ratio of the assessor's estimated Fair Cash Value in year t to that property's sale price in period $`t \pm z`$:

```math
\text{Sales Ratio}_t = \frac{\text{Assessor's Estimated Fair Cash Value}_t}{\text{Sale Price}_{t \pm z}}
```

**Assessment ratio:** The ratio of a certified assessment to the assessor's estimated Fair Cash Value in period t:

```math
\text{Assessment Ratio}_t = \frac{\text{Assessment}_t}{\text{Sale Price}_{t \pm z}}
```

**Sales Ratio Study:** A statistical analysis to evaluate the quality of assessments with respect to accuracy, uniformity, and vertical equity.

**Residential Property:** A property valued solely on the market valuation standard that is used, or intended to be used, for a residential purposes, and includes:

* a) Residential condominiums;
* b) Property with six or fewer self-contained dwelling units;
* c) Vacant and marginally improved land used, or intended to be used in in conjunction with a residential property.

**Arm's-Length:** Of or relating to dealings between two parties who are not related or not on close terms and who are presumed to have roughly equal bargaining power; not involving a confidential relationship.

**95% Confidence Interval:** The range in which it is likely that an unknown parameter lies given an observed sample distribution. The confidence interval is given by the mean of the sample statistic plus and minus the product of the z-score (1.96) and the ratio of the standard deviation or bootstrapped standard deviation to the square root of the sample size:

```math
CI = \text{Mean} \pm \sigma / \sqrt n
```

**Sales Chasing:** 'Sales Chasing,' also known as 'Selective Appraisal,' is the practice of changing a property's assessed value in response to a recent sale.

**Coefficient of Dispersion (COD):** COD is a measure of uniformity (horizontal equity). The COD is the average percentage deviation of ratios from the median ratio. It is calculated as the ratio of the Average Absolute Deviation from the Median Sales Ratio to the Median Sales Ratio:

```math
COD = \frac{\text{Average Absolute Deviation From Median Ratio}}{\text{Median Ratio}}*100
```

**Price Related Differential (PRD):** PRD is a statistical measure of price-related (vertical) equity in assessment. It is the mean prediction ratio divided by the sale-price weighted mean prediction ratio.

```math
PRD = \frac{\text{Mean Sales Ratio}}{\Big(\sum{\text{Sales Ratio}_i}*w\Big)/n}*100
```

**Price Related Bias (PRB):** PRB is a statistical measure of price-related (vertical) equity. The statistic is obtained by running a linear regression:

```math
\frac{\text{Sales Ratio}_i-\text{Meidan Sales Ratio}}{\text{Median Sales Ratio}}=\beta_0 +\beta_1\Bigg[\frac{Ln\bigg(\Big(\frac{\text{EFCV}_i}{\text{Median EFCV}}\Big) + \text{Sale Price}_i\bigg)/2}{Ln(2)} \Bigg]+\mu_i
```

The recovered coefficient $`\beta_1`$ is the PRB statistic.
