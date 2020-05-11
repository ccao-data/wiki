---
title: Residential Pipeline Documentation
description: Technical Documentation
published: true
date: 2020-04-09T18:41:59.869Z
tags: residential
---

# Single Family Sale Comparables
The Data Science Department has developed an algorithm that automatically identified **comparable sales** for nearly every single-family residential property in the County (918,481 properties). We are currently alpha testing our comparison sets. The end-goal of this project is to establish a single set of comparable sales to be used for valuation purposes that is also easily visible to the public.

## Background
The most common approach to residential property appraisal is the sales comparisons approach. In this approach, the appraiser assembles a data set of recent sales or properties that closely resemble the subject property. The appraiser then makes a judgement about the fair market value of the subject property based on the distribution of sales they have assembled, and the relative characteristics of the comparison properties.
The Data Science Department has created algorithms that automatically executes a comparison approach to valuation. In writing this algorithm, we had to answer a number of challenging questions:
- What determines whether a sale is a valid comparison to a subject property?
- Suppose two different criteria are proposed - how can you systematically choose between those criteria?
- Suppose two different criteria produce different coverages of the universe of PINs? 
- What is the relationship between estimates from sales comparison approaches and estimates derived from statistical models?

## Approach
Before we began writing algorithms to find comps, we needed a way to judge whether a comp set was 'valid.' To do this, we took the average of each subject property's comp set and treated it as though it were an assessed value. We then subjected that set of assessed values to a sales ratio study, and ranked each algorithm according to its performance on these measures. 
We also needed to reduce the dimensionality of the problem. Typically, comparable sales are selected from within a pre-defined geographic region or time period. It is not clear, however, that this is done because it is the most accurate approach, or because it reduces the computational requirements of the problem to a manageable level. Without these restrictions, any given subject PIN may have hundreds of comparable sales. There are roughly 920 thousand single-family residential PINs in the County. Searching a data-set of about 50,000 sales to find comparable sales for each of the 920 thousand PINs would be very time consuming.
To solve this, we developed a two-stage approach. First, we reduced the dimensionality of the problem, then we selected comparable sales from within this more manageable sales set.
We developed 20 different methods of determining sales comparisons.  The methods we tested included 4 first stage filters:

- Distance: include sales within one mile in any direction from a target pin
- Median Sale Price by Neighborhood: include sales from neighborhoods with a median sale price within 5% of target pin AV
- Township: include sales in target pin's township
- Neighborhood: include sales in target pin's neighborhood (subset of township)

We also tested five second stage filters:

- Range: include properties based on similarity to target pin characteristics (±2 rooms, ±1 bedrooms, ±500 building square feet, ±10 years in age)
- Percentile include properties based on similarity to target pin characteristics (±20 percent in rooms/bedrooms/building square foot/age)
- Ranked percentile difference: include the 15% most similar sales based on ranked differences between property characteristics
- Kmean: unsupervised learning algorithm which finds clusters in the data, returns cluster which includes target pin
- First pass only

Each method was then evaluated by selecting 200 random recent single family sales in every township and calculating the average sale price of the comp set to produce a comp-generated assessed value. This value was compared to the recent sale price of the target pin using the same IAAO statistics we use to judge the accuracy of our assessments. 
The best method was 1st pass Target Pin's Neighborhood and 2nd pass Percentile filter. The second best method was 1st pass Median Sale Price by Neighborhood and 2nd pass Percentile filter. These two methods were then applied to every single family property to generate over 635,000,000 comps. The best method generated about 68 comps per property for about 876,000 properties. The second best method generated about 654 comps per property for 912,000 properties.
