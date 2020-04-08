---
title: SOP on Sales Ratio Studies
description: Standard Operating Procedures and policies for CCAO sales ratio studies
published: true
date: 2020-04-08T21:10:49.337Z
tags: sop, policy
---

# Overview

### Purpose

This policy governs the calculation and reporting of sales ratio study statistics for residential property. Sales ratio studies are one of the few ways the Assessor can measure the 'quality' of the assessment. This policy is designed to ensure that sales ratio statistics truthfully and accurately reflect the overall quality of assessment.

### Employees Affected

Senior Data Scientists, the Chief Data Officer, the Chief Communications Officer.

### Related Information

This policy references the [IAAO Standard on Ratio Studies](https://www.iaao.org/media/standards/Standard_on_Ratio_Studies.pdf). The Cook County Assessor’s Office does not have a residential sales validation unit, and therefore cannot adhere to the [IAAO Standard on Verification and Adjustment of Sales](https://www.iaao.org/media/standards/Verification_Adjustment_of_Sales.pdf). The Cook County Assessor’s Office recognizes that there exists an institutional bias to self-report favorable sales ratio statistics. This policy is constructed in such a way as to minimize the impact of that bias on self-reported sales ratio statistics.

### Definitions

**Fair Cash Value (FCV):** “The amount for which a property can be sold in the due course of business and trade, not under duress, between a willing buyer and a willing seller.” (35 ILCS 200/1-50)

**Sales Ratio:** The ratio of the assessor’s estimated Fair Cash Value in year t to that property’s sale price in period $t \pm z$:

$$
\text{Sales Ratio}_t = \frac{\text{Assessor's Estimated Fair Cash Value}_t}{\text{Sale Price}_{t \pm z}}
$$

The value of z is governed by this standard (See 3.3.2.1 and 3.3.2.2).

**Assessment ratio:** The ratio of a certified assessment to the assessor’s estimated Fair Cash Value in period t:

$$
\text{Assessment Ratio}_t = \frac{\text{Assessment}_t}{\text{Sale Price}_{t \pm z}}
$$

**Sales Ratio Study:** A statistical analysis to evaluate the quality of assessments with respect to accuracy, uniformity, and vertical equity. 

**Residential Property:** A property valued solely on the market valuation standard that is used, or intended to be used, for a residential purposes, and includes: 
a) Residential condominiums;
b) Property with up to seven self-contained dwelling units;
c) Vacant and marginally improved land used, or intended to be used in in conjunction with a residential property.

**Arm’s length:** Of or relating to dealings between two parties who are not related or not on close terms and who are presumed to have roughly equal bargaining power; not involving a confidential relationship.

**Bootstrapped Standard Deviation:** The standard deviation of 100 or more calculations of the same statistic, with each calculation based on a random sample of the overall population. 

**95% Confidence Interval:** The range in which it is likely that an unknown parameter lies given an observed sample distribution. The confidence interval is given by the mean of the sample statistic plus and minus the product of the z-score (1.96) and the ratio of the standard deviation or bootstrapped standard deviation to the square root of the sample size:

$$
CI = \text{Mean} \pm \sigma / \sqrt n
$$

**Sales Chasing:** “Sales Chasing,” also known as “Selective Appraisal,” is the practice of changing a property’s assessed value in response to a recent sale. 

**Coefficient of Dispersion (COD):** COD is a measure of horizontal equity and uniformity. The COD is the average percentage deviation of ratios from the median ratio. It is calculated as the ratio of the Average Absolute Deviation from the Median Sales Ratio to the Median Sales Ratio:

$$
COD = \frac{\text{Average Absolute Deviation From Median Ratio}}{\text{Median Ratio}}*100
$$

**Price Related Differential (PRD):** PRD is a statistical measure of vertical equity in assessment. It is the mean prediction ratio divided by the sale-price weighted mean prediction ratio.

$$
PRD = \frac{\text{Mean Sales Ratio}}{\Big(\sum{\text{Sales Ratio}_i}*w\Big)/n}*100
$$

**Price Related Bias (PRB):** PRB is a statistical measure of vertical equity. The statistic is obtained by running a linear regression:

$$
\frac{\text{Sales Ratio}_i-\text{Meidan Sales Ratio}}{\text{Median Sales Ratio}}=\beta_0 +\beta_1\Bigg[\frac{Ln\bigg(\Big(\frac{\text{EFCV}_i}{\text{Median EFCV}}\Big) + \text{Sale Price}_i\bigg)/2}{Ln(2)} \Bigg]+\mu_i
$$

The recovered coefficient $\beta_1$ is the PRB statistic. 


# Reporting Requirements

### Annual Report

The Chief Communications Officer shall publish an annual report within four months of the Assessor certifying all assessments in the County. This report shall contain the results of a sales ratio study of residential properties in the County. The Chief Data Officer and Senior Data Scientists shall provide the necessary statistics for this publication, according to this policy. 

### Township Reporting. 

The Chief Data Officer shall produce sales ratio studies for each township within one month after each stage in the assessment process: initial values are sent to taxpayer, assessments are certified by the assessor, and assessments are certified by the Board of Review.  The Chief Communications Officer shall publish limited sales ratio studies for public consumption after each aforementioned stages as well.

### Other Reporting. 

The Chief Data Officer shall produce sales ratio studies as requested by the Cook County Assessor.

### Required Statistics. 

The following statistics must be included in any sales ratio study:

* COD
* PRD
* PRB
* Median Assessment Ratio
* The measure of sales chasing as defined by E.4 in the IAAO Standard on Ratio Studies
* Sample size (i.e., number of properties with sales being used in the sales ratio study)
* Population size (i.e., number of properties to which the sales ratio study is intended to generalize). 

**Measures of Variance.**
Each statistic in 1.4 must be reported with an accompanying measure of statistical precision. Where mathematic definitions of a statistic’s standard deviation does not exist, standard deviations should be obtained via bootstrapping.

### Data Publication.
The Chief Data Officer shall make all necessary data and code for replication available to the public free of charge. This should include, but is not limited to: the universe of sales available to the CCAO for the sales ratio study, indicators for which sales were excluded, reasons for their exclusion, code to perform the necessary calculations for the sales ratio study, and a report of the results of the study.


# Standards for High Quality Assessment

### Target Ranges. 

Assessments within a strata are considered ‘high quality’ if they fall within the defined ranges below. 


| Statistic  | Acceptable Range  |
|---|---|
|COD   | 5 - 15   |
|PRD   | .98 - 1.03  |
|PRB   | -.05 - .05  |
|Median Assessment Ratio   |  .095 - 1.05 |
|Sales Chasing (E.4)   | $\le$ 5%  |

**Standards Met.**
Statistics that fall within the target ranges as defined in 2.1 may be said to have ‘met the standard for high quality assessment.'

**Standards Statistically Met.**
Statistics that fall outside the target ranges as defined in 2.1, but whose 95% confidence interval contains part of the range defined in 2.1 may be said to have ‘statistically met the standard for high quality assessment.'

**Differentiation Between Standards Met and Standards Statistically Met.**
The Chief Communications Officer shall at all times make clear the distinction between statistics that meet 2.1.1 and statistics that meet 2.1.2.


# Sample Selection

### Reporting Groups

Residential Properties are grouped into four groups according to minor property assessment class:

* Single-Family: 202, 203, 204, 205, 206, 207, 208, 209, 210, 234, 278, 295.
* Multi-Family: 211, 212.
* Residential Condominiums: 299.
* Vacant Land: 200, 201, 241.

**Exclusion of Special Properties.**
Some residential properties classified as ‘Single-Family’ by 2.1 are valued by the ‘Special Properties’ division of the Valuations Department. These are excluded from the sales ratio study. 

### Stratification

Properties may be stratified according to geography, sale price, assessed value, physical characteristics, and other attributes. 

**Maximum Variance of Strata Statistic.**
Stratification should not be so granular as to produce unduly large standard errors.

**Minimum Observations within Strata.**
Statistics should not be reported on a strata with fewer than 30 observations.


## Matching Appraisal Data and Market Data

### Physical and Legal Characteristics. 

The physical and legal characteristics of each property used in the ratio study must be the same when appraised for tax purposes and when sold. 

### Timing and Sales Sample Selection

**Multi-Parcel Sales.**
Deeds transacted on multiple PINs are excluded from the sales sample.

**Foreclosures and Bank Sales.**
Foreclosure and Real Estate Owned sales may be excluded from the sales samples.

**Selective Appraisal.**
Properties are appraised on the first day of the re-assessment year. Assessments are calculated and produced over the course of the assessment year. Where sales chasing occurs, it can only occur for properties with a sale prior to the date the assessed value of a property was certified. Sales ratios calculated using sales following the certification date will exhibit much less bias from sales chasing than sales ratios calculated using sales prior to the certification date. 

**Matching Assessment Years to Sale Years for Ratio Studies.** 
This section follows 9.2, p 33, of the IAAO Standard on Ratio Studies. In order to minimize the influence of sales chasing on reported statistics, sales used in calculating statistic for years prior to the year prior to the current assessment year should utilize sales following the date of assessment. For A sale will be included in the study for prior years if the transaction date is between the first day of the year in which the property was re-assessed, and the same day in the following calendar year. 

$$
\text{Sales Ratio}_t = \frac{\text{Assessor's Estimated Fair Cash Value}_t}{\text{Sale Price}_{t + 1}} \\
\forall \; \;  t \in [\infty, t-2]
$$

For example, sales ratios reported during the 2019 re-assessment for assessments in 2017 should use sales in 2018 sales respectively in their denominators.

A sale will be included in the study for the current and prior year if the transaction date is within one year prior to the first day of the year in which the property was re-assessed.

$$
\text{Sales Ratio}_t = \frac{\text{Assessor's Estimated Fair Cash Value}_t}{\text{Sale Price}_{t - 1}} \\ \forall \; \;  t \in [t-1, t]
$$

For example, sales ratios reported during the 2019 re-assessment for assessments in 2018 and 2019 should use sales in 2017 and 2018 respectively in their denominators.


## Sales Selection. 

### Data Source. 

Sales are obtained by the CCAO from MyDec Web Service (“MyDec”), a service by the Illinois Department of Revenue. 

### Pre-processing of sales. 

The sales data obtained via MyDec Web Service contain irregularities that require correction. These include multiple deeds recorded on a given PIN on a single day listing different amounts and typographic errors in consideration amounts. A query is executed to produce a list of sales that are unique by PIN and date recorded. 

### Excluded Deed Types. 

Deeds are excluded based on deed type: Quitclaim Deeds, Executor Deeds, ‘B’ type deeds.

### Adjusting Sale Amounts. 

Sale prices are not adjusted for sales ratio studies. 


## Outlier Trimming

### Limit Sale Amounts. 

Sales with amounts less than $10,000 are excluded from sales ratio studies.

### Unusually Large or Small Ratios. 

The top and bottom 5% of sales in terms of sales ratios are excluded from sales ratio studies.


## Forms

There are no forms associated with this policy.
