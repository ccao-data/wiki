# CDU codes

The table below condition, desirability, and utility (CDU) codes as of 2020. This data is also accessible via the [CCAO R package](https://gitlab.com/ccao-data-science---modeling/packages/ccao). You can retrieve this data with the following code:

```r
# After intalling the package using the instruction in the package README, load the ccao library
library(ccao)

ccao::cdu_dict
```

|cdu_code|cdu_type|cdu_desc|cdu_desc_short|
|--------|--------|--------|--------------|
|AA|SF|Affordable Housing - Appraisal Based Restriction|Aff. Housing - Appr. Based. Res.|
|AI|SF|Affordable Housing - Index Based Restriction|Aff. Housing - Index Based. Res.|
|AV|SF|Average|Avg.|
|AX|SF|Affordable Housing - Other Restriction|Aff. Housing - Other Res.|
|BB|SF|Bed and Breakfast|B&B|
|CO|SF|Cooperative (2-13 Class)|Coop|
|CV|SF|Conversion|Conv.|
|EX|SF|Excellent|Exc.|
|EZ|SF|Economic Zoning Valuation|Econ. Zoning. Val.|
|FR|SF|Fair|Fair|
|FV|SF|Federal Veterans|Fed. Vet.|
|GD|SF|Good|Good|
|GR|SF|Condo Garage|Condo Garg.|
|GS|SF|Governmental Subsidy|Gov. Subsidy|
|LF|SF|Lifecare Facility|Lifecare Fac.|
|LM|SF|Leasehold Method|Leasehold Method|
|LR|SF|Landmark Renovation|Landmark|
|MH|SF|Model Home|Model|
|PC|SF|Partial Carrier|Partial Carrier|
|PR|SF|Poor|Poor|
|PW|SF|Partial Wreck|Partial Wreck|
|PX|SF|Partial Exemption|Partial Exemption|
|RH|SF|Rear House|Rear House|
|RS|SF|Recent Sale|Recent Sale|
|SR|SF|Eligible Single Room Occupancy Improvement (Class 2-25)|SRO Impr.|
|UN|SF|Unsound|Unsound|
|VG|SF|Very Good|V. Good|
|VP|SF|Very Poor|V. Poor|
|Blank|6A|Industrial; 2009 ordinance; 8 years at 20%|NA|
|PB|6B|Industrial; 2009 ordinance; 10% for the first 10 years and any subsequent 10-year renewal period; if not renewed, 15% in the 11th year, 20% in the 12th year|NA|
|BF|6C|2009 ordinance; 3 years at 10%|NA|
|SA|7A|Industrial; 2009 ordinance; 10% for the first 10 years, 15% in the 11th year, 20% in the 12th year, eligible for renewable terms, if not renewed, returns to 25% in year 13.|NA|
|CM|7A|Commercial: 2009 ordinance; 10% for first 10 years,15% in the 11th year, 20% in 12th year, not eligible for renewal.|NA|
|CB|7B|Commercial; 2009 ordinance; 10% for first 10 years,15% in the 11th year, 20% in 12th year, not eligible for renewal.|NA|
|SB|7B|Industrial; 2009 ordinance; 10% for first 10 years,15% in the 11th year, 20% in 12th year, not eligible for renewal.|NA|
|RE|8|Industrial; 2009 ordinance; 10% for the first 10 years and any subsequent renew period; if not renewed, 15% in the 11th year, 20% in the 12th year, 25% in the 13th and subsequent years;|NA|
|RC|8|Industrial; 2009 ordinance; 10% for the first 10 years and any subsequent renew period; if not renewed, 15% in the 11th year, 20% in the 12th year, 25% in the 13th and subsequent years, not eligible for renewal.|NA|
|AP|9|Apartments; 2009 ordinance; 10 years at 10%|NA|
|CL|C|Industrial; 2009 ordinance; 10% for the first 10 years and for any subsequent 10-year renewal period; if not renewed, 15% in the 11th year, 20% in the 12th year.|NA|
|CC|C|Commercial; 2009 ordinance; 10% in the first 10 years, 15% in the 11th year, 20% in the 12th year, not eligible for renewal.|NA|
|LI|L|Industrial landmark; 2009 ordinance; 10% for 8 years, 15% in the 9th year, 20% in the 10th year|NA|
|LL|L|Commercial landmark; 2009 ordinance; 10% for 8 years, 15% in the 9th year, 20% in the 10th year, not eligible for renewal.|NA|
|LM|L|Multifamily Class 3 landmark; 2009 ordinance 10% for 10 years and for any subsequent renewal periods; if not renewed, 15% in year 11 and 20% in year 12.|NA|
|LP|L|Not-for-Profit landmark 2009 ordinance 10% for 10 years and for any subsequent renewal periods; if not renewed 15% in year 11 and 20% in year 12.|NA|
|LD|L|Industrial landmark 2009 ordinance 10% for 10 years and for any subsequent renewal periods, if not renewed 15% in year 11 and 20% in year 12.|NA|
|LC|L|Commercial landmark 2009 ordinance 10% for 10 years, 15% in year 11 and 20% in year 12, not eligible for renewal.|NA|
|S|S|Multifamily class 3; 2009 ordinance 10% for the term (at least 5 years) of the section 8 contract renewal under the mark up to the market option and then any additional terms of renewal under that contract.|NA|