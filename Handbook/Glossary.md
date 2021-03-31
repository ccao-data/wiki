The property assessment world is filled with lots of technical jargon that can make things confusing, even for veteran employees. This glossary of terms should clarify some of the confusion. Terms are listed by section in alphabetical order. If you have questions about a term or think something is omitted, please ping @dfsnow.

## General

##### Arm's Length Sale

1. A sale between a willing buyer and a willing seller that are unrelated and are not acting under duress, abnormal pressure or undue influences.
2. A sale between two unrelated parties, both seeking to maximize their positions from the transaction. 


##### Assessed Value (AV)

The value set by the CCAO for the purpose of computing property taxes. In some jurisdictions, assessed value is equal to [Fair Cash Value](#fair-cash-value-fcv). In Cook County, assessed value is:

   - 10% of fair cash value for [residential properties](#residential-property) (all class 200 properties, including condominiums)
   - 25% of fair cash value for commercial properties (all class 500 properties) 

These percentage multipliers are known as Assessment Levels.

##### Fair Cash Value (FCV)

The amount for which a property can be sold in the due course of business and trade, not under duress, between a willing buyer and a willing seller. (35 ILCS 200/1-50)

##### Fair Market Value (FMV)

Identical to [Fair Cash Value](#fair-cash-value-fcv). These terms are used interchangeably at the CCAO. 

##### Residential Property

A property valued solely on the market valuation standard that is used, or intended to be used, for a residential purposes. This includes:

* Residential condominiums
* Property with up to seven self-contained dwelling units
* Vacant and marginally improved land used, or intended to be used, in conjunction with a residential property

##### Sales Chasing

Also known as 'Selective Appraisal,' sales chasing is the practice of changing a property's assessed value in response to a recent sale.

## Sales Ratio Studies

##### Assessment Ratio

The ratio of a certified assessment to the assessor's estimated [Fair Cash Value](#fair-cash-value-fcv) in period $`t`$:

```math
\text{Assessment Ratio}_t = \frac{\text{Assessment}_t}{\text{Sale Price}_{t \pm z}}
```

##### Coefficient of Dispersion (COD)

COD is a measure of horizontal equity and uniformity. The COD is the average percentage deviation of ratios from the [median ratio](#sales-ratio). It is calculated as the ratio of the Average Absolute Deviation from the Median Sales Ratio to the Median Sales Ratio:

```math
COD = \frac{\text{Average Absolute Deviation From Median Ratio}}{\text{Median Ratio}}*100
```

##### Price Related Bias (PRB)

PRB is a statistical measure of vertical equity. The statistic is obtained by running a linear regression:

```math
\frac{\text{Sales Ratio}_i-\text{Median Sales Ratio}}{\text{Median Sales Ratio}}=\beta_0 +\beta_1\Bigg[\frac{Ln\bigg(\Big(\frac{\text{EFCV}_i}{\text{Median EFCV}}\Big) + \text{Sale Price}_i\bigg)/2}{Ln(2)} \Bigg]+\mu_i
```

The recovered coefficient $`\beta_1`$ is the PRB statistic.

##### Price Related Differential (PRD)

PRD is a statistical measure of vertical equity in assessment. It is the mean prediction ratio divided by the sale-price weighted mean prediction [ratio](#sales-ratio).

```math
PRD = \frac{\text{Mean Sales Ratio}}{\Big(\sum{\text{Sales Ratio}_i}*w\Big)/n}*100
```

##### Sales Ratio

The ratio of the assessor's estimated [Fair Cash Value](#fair-cash-value-fcv) in year $`t`$ to that property's sale price in period $`t \pm z`$:

```math
\text{Sales Ratio}_t = \frac{\text{Assessor's Estimated Fair Cash Value}_t}{\text{Sale Price}_{t \pm z}}
```

The value of $`z`$ is governed by the [CCAO's Sales Ratio Study SOP](/SOPs/Sales%20Ratio%20Studies) (See 3.3.2.1 and 3.3.2.2).

##### Sales Ratio Study

A statistical analysis to evaluate the quality of assessments with respect to accuracy, uniformity, and vertical equity.

## Statistics

##### Bootstrapped Standard Deviation

The standard deviation of 100 or more calculations of the same statistic, with each calculation based on a random sample of the overall population.

##### 95% Confidence Interval

The range in which it is likely that an unknown parameter lies given an observed sample distribution. The confidence interval is given by the mean of the sample statistic plus and minus the product of the z-score (1.96) and the ratio of the standard deviation or bootstrapped standard deviation to the square root of the sample size:

```math
CI = \text{Mean} \pm \sigma / \sqrt n
```

## CCAO/Cook County Specific

##### Board of Review (BoR)

An independent office created by Illinois statute and governed by 3 commissioners who are elected to two or four-year terms. The Board of Review acts as a second round of assessment appeals (after the intial round of appeals processed by the CCAO).

##### Assessment Review

The review of an assessment placed on a property. The first place to appeal an assessment is at the Assessor’s Office; the second level of appeal is the [Board of Review (BOR)](#board-of-review-bor); the third avenue for appeal is the Property Tax Appeal Board (PTAB); the fourth is to file an objection in Circuit Court (only if filed at BOR).

##### Equalization Factor

A factor determined by the Illinois Department of Revenue (IDOR) each year to ensure an equal assessment among all 102 counties in the state. State statute requires that the aggregate value of assessments within each county must be equalized at $`33 \frac{1}{3}%`$ of the estimated [fair market value](#fair-market-value-fmv) of real property in the county. This factor is also known as the "multiplier." 

##### Equalized Assessed Valuation (EAV)

The [Assessed Value](#assessed-value-av) multiplied by the [Equalization Factor](#equalization-factor). The EAV is the value multiplied by a tax rate to calculate a property's tax bill.

##### Partial Assessment

An [Assessed Value](#assessed-value-av) that is less than a full assessed value, because

1. Improvements were added but were not usable for the entire tax year, or
2. The taxable status of the property changed during the tax year. 

New construction, building demolition, or fire occurring during the taxable year are common triggers for a partial assessment.  

##### Tax Base

The total of all [Assessed Values](#assessed-value-av) of properties.

##### Tax Incentives

Incentives include exemptions, deferrals, abatements or tax credits. Incentives were established to stimulate a specific type of new growth for certain types of properties (i.e. affordable housing) or growth in areas of economic need.

##### Tax Levy

The amount in real estate taxes requested by each taxing body.

##### Tax Rate

The tax levy divided by the total of all equalized assessed values. This figure is compiled by the Cook County Clerk and applied to the [equalized assessed valuation](#equalized-assessed-value-eav) to determine the amount paid in property taxes.

##### Taxing Body

Units of governments that collect taxes to fund government services (the City of Chicago, Chicago Board of Education, Chicago Park District, County of Cook, and local school districts).

## Sources

* [IAAO Glossary](https://www.iaao.org/media/Pubs/IAAO_Glossary.pdf)
* [CCAO Glossary](https://www.cookcountyassessor.com/glossary)
