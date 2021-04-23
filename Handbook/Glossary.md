The property assessment world is filled with lots of technical jargon that can make things confusing, even for veteran employees. This glossary of terms should clarify some of the confusion. Terms are listed by section in alphabetical order. If you have questions about a term or think something is omitted, please ping @dfsnow.

## General

#### Arm's Length Sale

1. A sale between a willing buyer and a willing seller that are unrelated and are not acting under duress, abnormal pressure or undue influences.
2. A sale between two unrelated parties, both seeking to maximize their positions from the transaction. 

#### Assessed Value (AV)

The value set by the CCAO for the purpose of computing property taxes. In some jurisdictions, assessed value is equal to [Fair Cash Value](#fair-cash-value-fcv). In Cook County, assessed value is:

   - 10% of [Fair Cash Value](#fair-cash-value-fcv) for [residential properties](#residential-property) (all class 200 properties, including condominiums)
   - 25% of [Fair Cash Value](#fair-cash-value-fcv) for commercial properties (all class 500 properties) 

These percentage multipliers are known as Assessment Levels.

#### Automated Valuation Model (AVM)

A mathematical model which produces estimates of property market value based on location, time, characteristics, etc. of properties. The distinguishing feature of an AVM is that it is a market appraisal produced through mathematical modeling. Credibility of an AVM is dependent on the data used and the skills of the modeler producing the AVM.

#### Class

Groupings of properties defined by use and physical characteristics. Different classes are subject to different [assessment levels](#assessed-value-av).

#### Computer-Assisted Mass Appraisal (CAMA)

See [AVM](#automated-valuation-model-avm).

#### Fair Cash Value (FCV)

The amount for which a property can be sold in the due course of business and trade, not under duress, between a willing buyer and a willing seller. (35 ILCS 200/1-50)

#### Fair Market Value (FMV)

Identical to [Fair Cash Value](#fair-cash-value-fcv). These terms are used interchangeably at the CCAO. 

#### Exemption

Removal  of  property  from  the  tax  base;  may  be  a  partial  (a  homestead) or complete (church building used exclusively for religious use) 

#### IAAO

The [International Association of Assessing Officers](https://www.iaao.org/). The IAAO (pronounced I double-A O) is the professional organization for assessors. It offers training, standards, and resources related to the process of assessment. It hosts an annual conference that many members of the CCAO attend.

#### Property Index Number (PIN)

A brief legal description of a particular parcel by numerical reference to parcels on assessment maps.  It is a fourteen-digit number.  The first two digits refer to the geographical township; the second two, to the section in which the parcel is located; the next three, to the block number; the next three digits identify the parcel within the block; the last four digits identify parcel subunits such as condos.

#### Residential Property

A property valued solely on the market valuation standard that is used, or intended to be used, for a residential purposes. This includes:

* Residential condominiums
* Property with up to seven self-contained dwelling units
* Vacant and marginally improved land used, or intended to be used, in conjunction with a residential property

<br>

## Sales Ratio Studies

#### Assessment Ratio

The ratio of the assessor's estimated [Assessed Value](#assessed-value-av) to the property's sale price in the same period $`t`$:

```math
\text{Assessment Ratio}_t = \frac{\text{Assessor's Estimated Assessed Value}_t}{\text{Sale Price}_{t}}
```

:warning: NOTE: The CCAO typically uses lagged/leading sales when calculating sales/assessment ratios. See the [Sales Ratio Study SOP](/SOPs/Sales%20Ratio%20Studies) for more details.

#### Coefficient of Dispersion (COD)

COD is a measure of horizontal equity and uniformity. The COD is the average percentage deviation of ratios from the [median ratio](#sales-ratio). It is calculated as the ratio of the Average Absolute Deviation from the Median Sales Ratio to the Median Sales Ratio:

```math
COD = \frac{\text{Average Absolute Deviation From Median Ratio}}{\text{Median Ratio}}*100
```

#### Prediction Ratio

See [Sales Ratio](#sales-ratio).

#### Price Related Bias (PRB)

PRB is a statistical measure of vertical equity. The statistic is obtained by running a linear regression:

```math
\frac{\text{Sales Ratio}_i-\text{Median Sales Ratio}}{\text{Median Sales Ratio}}=\beta_0 +\beta_1\Bigg[\frac{Ln\bigg(\Big(\frac{\text{EFCV}_i}{\text{Median EFCV}}\Big) + \text{Sale Price}_i\bigg)/2}{Ln(2)} \Bigg]+\mu_i
```

The recovered coefficient $`\beta_1`$ is the PRB statistic.

#### Price Related Differential (PRD)

PRD is a statistical measure of vertical equity in assessment. It is the mean prediction ratio divided by the sale-price weighted mean prediction ratio.

```math
PRD = \frac{\text{Mean Sales Ratio}}{\Big(\sum{\text{Sales Ratio}_i}*w\Big)/n}*100
```

#### Sales Chasing

Also known as 'Selective Appraisal,' sales chasing is the practice of changing a property's assessed value in response to a recent sale.

#### Sales Ratio

The ratio of the assessor's estimated [Fair Cash Value](#fair-cash-value-fcv) to the property's sale price in period $`t`$:

```math
\text{Sales Ratio}_t = \frac{\text{Assessor's Estimated Fair Cash Value}_{t}}{\text{Sale Price}_{t}}
```

:warning: NOTE: The CCAO typically uses lagged/leading sales when calculating sales/assessment ratios. See the [Sales Ratio Study SOP](/SOPs/Sales%20Ratio%20Studies) for more details.

#### Sales Ratio Study

A statistical analysis to evaluate the quality of assessments with respect to accuracy, uniformity, and vertical equity.

<br>

## Statistics

#### Bootstrapped Standard Deviation

The standard deviation of 100 or more calculations of the same statistic, with each calculation based on a random sample of the overall population.

#### 95% Confidence Interval

The range in which it is likely that an unknown parameter lies given an observed sample distribution. The confidence interval is given by the mean of the sample statistic plus and minus the product of the z-score (1.96) and the ratio of the standard deviation or bootstrapped standard deviation to the square root of the sample size:

```math
CI = \text{Mean} \pm \sigma / \sqrt n
```

<br>

## CCAO/Cook County/Illinois Specific

#### AS/400

The machine used by the CCAO to communicate with the Cook County [Mainframe](#mainframe). Analysts interface with the AS/400 via an IBM System i terminal screen. Up until 2021, the AS/400 was the primary way analysts interacted with individual property records. The AS/400 has been effectively replaced by [iasWorld](#iasworld).

#### Appeals Process

The official review of an assessment placed on a property. Also known as [Assessment Review](#assessment-review). Review can be up to four stages. Each stage can yield an adjustment in [Assessed Value](#assessed-value-av).

1. Appeal an assessment at the Assessor’s Office
2. Appeal at the [Board of Review (BOR)](#board-of-review-bor)
3. Appeal to the [Property Tax Appeal Board (PTAB)](#property-tax-appeal-board-ptab)
4. File an objection in Circuit Court (only if filed at BoR)

#### Assessment Cycle

The Cook County assessment cycle occurs in four primary stages:

1. **Initial Values AKA Model Values:** These are the raw output from the [AVMs](#automated-valuation-model-avm).
   * Desk Review: Initial values go through a review process to look for modeling errors, characteristic errors, and other anomalies. See [Desk Review](#desk-review) for more information.
     - Model values are exported to Excel for review by [class](#class)/neighborhood.
     - Model values are uploaded to [iasWorld](#iasworld). Individual property prediction errors are corrected in iasWorld.
2. **Mailed Values AKA First Pass:** These are the values that are actually mailed to taxpayers.
3. **Assessor Certified AKA Second Pass:** These are the first pass values after appeals. Values are considered Assessor Certified once the appeal window for a town has closed.
4. **Board Certified AKA Final Values:** These are the final values after both CCAO and [BoR](#board-of-review-bor) appeals. Values are Board Certified after the [BoR's](#board-of-review-bor) appeal window has closed.

#### Assessment Review

See [Appeals Process](#appeals-process).

#### Board of Review (BoR)

An independent office created by Illinois statute and governed by 3 commissioners who are elected to two or four-year terms. The Board of Review acts as a second round of assessment appeals (after the intial round of appeals processed by the CCAO).

#### Bureau of Technology (BoT)

The Cook County Bureau of Technology, an independent office that manages IT infrastructure, contracting, and setup. Responsbile for maintaining certain databases as well as the [AS/400](as-400).

#### Certificate of Error (CofE)

A way to apply changes to a property tax bill that has already been issued (the assessment is finalized). These are mostly (but not only) used to correct for missing [exemptions](#exemption).

#### Certified Illinois Assessing Officer (CIAO)

A designation in the Illinois chapter of the [IAAO](#iaao) certifying that the recipient has taken specific coursework in assessment/appraisal.

#### Equalization Factor

A factor determined by the Illinois Department of Revenue (IDOR) each year to ensure an equal assessment among all 102 counties in the state. State statute requires that the aggregate value of assessments within each county must be equalized at $`33 \frac{1}{3}\%`$ of the estimated [Fair Market Value](#fair-market-value-fmv) of real property in the county. This factor is also known as the "multiplier." 

#### Equalized Assessed Valuation (EAV)

The [Assessed Value](#assessed-value-av) multiplied by the [Equalization Factor](#equalization-factor). The EAV is the value multiplied by a tax rate to calculate a property's tax bill.

#### iasWorld

[Web portal link](https://iptsweb.ccounty.com/app/home#/dashboard) - Must be on CCAO network

Property assessment and tax administration software produced by [Tyler Technologies](https://www.tylertech.com/products/iasworld). As of 2021, CCAO analysts use this software as their primary method of accessing individual property records. This system replaces the [AS/400](#as400) and will eventually replace the [Mainframe](#mainframe).

#### Mainframe

Cook County's system of record for property taxes and assessments. Shared between the Assessor, Clerk, and Treasurer. Originally installed in the 1980s. Still in use for the calculation of tax bills, but likely to be deprecated in the next few years.

#### Partial Assessment

An [Assessed Value](#assessed-value-av) that is less than a full assessed value, because:

1. Improvements were added but were not usable for the entire tax year, or
2. The taxable status of the property changed during the tax year. 

New construction, building demolition, or fire occurring during the taxable year are common triggers for a partial assessment.  

#### Property Tax Appeal Board (PTAB)

A [quasi-judicial, state-level body](http://www.ptab.illinois.gov/) that also processes property tax appeals. Appeals are only considered by PTAB after being considered by the [Cook County Board of Review](#board-of-review-bor). See [Appeals Process](#appeals-process) for more information.

#### PTAXSIM

Short for Property Tax Simulator, [PTAXSIM](https://gitlab.com/ccao-data-science---modeling/applications/ptaxsim) is an application developed by the CCAO Data Science designed to replicate the property tax bill calculations performed by the Clerk/Treasurer. The goal of the application is to allow users to model different scenarios in order to more accurately predict how certain changes will affect the tax bill of a property.

#### RPIE

The Real Property Income and Expense form. See the [RPIE pages](/RPIE/RPIE Overview) on the wiki for more information.

#### Tax Base

The total [Assessed Value](#assessed-value-av) of all properties. Sometimes broken out by area i.e the tax base of Rogers Park, which refers to the sum of all property [AVs](#assessed-value-av) in that town. 

#### Tax Incentives

Incentives include [exemptions](#exemption), deferrals, abatements or tax credits. Incentives were established to stimulate a specific type of new growth for certain types of properties (i.e. affordable housing) or growth in areas of economic need.

#### Tax Increment Financing (TIF)

A TIF is a special property tax district for a specific geographic area. TIFs are designed to encourage local development, fund specific projects, and help blighted areas. They work by effectively freezing the [Tax Base](#tax-base) of the TIF area, then funneling any additional tax revenues to a dedicated fund. TIFs expire after 23 years.

See [City of Chicago resources on TIFs](https://www.chicago.gov/city/en/depts/dcd/provdrs/tif.html).

#### Tax Levy

The amount in real estate taxes requested by each [taxing body](#taxing-body). 

#### Tax Rate

The tax levy divided by the total of all equalized assessed values. This figure is compiled by the Cook County Clerk and applied to the [equalized assessed valuation](#equalized-assessed-value-eav) to determine the amount paid in property taxes.

#### Taxing Body

Units of governments that collect taxes to fund government services (the City of Chicago, Chicago Board of Education, Chicago Park District, County of Cook, and local school districts).

#### Taxpayer Information Services (TPI)

A department within the CCAO responsible for interfacing with the public. TPI helps guide taxpayers through the appeals process, provides information about [exemptions](#exemption), etc. They are located on the 3rd floor of City Hall.

#### Valuations

A department within the CCAO responsible for:

* Certain aspects of the valuation process, such as valuing land
* Reviewing initial model values from Data Science
* Mailing, closing, and certifying assessed values
* Processing appeals submitted to the CCAO
* Validating data such as property characteristics, sales, and [PIN](#property-index-number-pin) divisions
* And many additional things

<br>

## Sources

* [IAAO Glossary](https://www.iaao.org/media/Pubs/IAAO_Glossary.pdf)
* [CCAO Glossary](https://www.cookcountyassessor.com/glossary)
