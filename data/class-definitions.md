# Property Class Definitions

This document defines codes for the classification of real property in Cook County. These codes are also available as a dataset within R via the [CCAO R package](https://gitlab.com/ccao-data-science---modeling/packages/ccao). They can be accessed as a dataframe using the following R code:

```r
library(ccao) # load the CCAO library after installing it

ccao::class_dict

```


# Major Class 0 - Exempt and Railroad

EX - Exempt Property
RR - Railroad Property


Major Class 1 Vacant (10% level of assessment)
1-00 Vacant Land
1- 90 Minor Improvement on Vacant Land
```
```
Major Class 2 Residential (10% level of assessment)
```
```
Regression Classes
2-00 Residential Land
2-02 One-story Residence, any age, up to 999 square feet
2-03 One-story Residence, any age, 1,0 00 to 1,800 square feet
2-04 One-story Residence, any age, 1,8 01 square feet and over
2-05 Two-or-more story residence, over 62 years of age up to
2,200 square feet
2-06 Two-or-more story residence, over 62 years of age, 2,201 to
4,999 square feet
2-07 Two-or-more story residence, up to 62 years of age, up to
2,000 square feet
2-08 Two-or-more story residence, up to 62 years of age, 3,
to 4,999 square feet
2-09 Two-or-more story residence, any age, 5,000 square feet
and over
```
```
2- 10 Old style row house (town home), over 62 years of age
```
```
1 of 11 04/03/
```

```
04/03/
```
```
2- 11 Apartment bu ilding with 2 to 6 units, any age
2-12 Mixed-use commercial/residential building with apartment
and commercial area totaling 6 units or less with a
square foot area less than 20,0 00 square feet, any age
2- 34 Split level residence with a lower level below grade
(ground level) all ages, all sizes
2-78 Two-or-more story residence, up to 62 years of age, 2,
to 3,800 square feet
2-95 Individually-owned townhome or row house up to 62 years
of age
```
**Non-Regression Classes**

```
2- 00 Residential land
```
```
2- 39 Non-equalized land under agricultural use, valued at farm
pricing
```
```
2-40 First-time agricultural use of land valued at market price
2-41 Vacant land under common ownership with adjacent
```
```
2- 01 Residential garage
2-13 Cooperative
```
```
2- 24 Farm Building
2-25 Single-ro om occupancy rental building
2- 36 Any residence located on a parcel used primarily for
commercial or industrial purposes
```
```
2- 88 Home improvement exemption
2- 90 Minor improvement
2- 97 Special residential improvements (May apply to condo
building in first year of construction before division into
individual units.)
2- 99 Residential condominium
2 of 11
```
```
residence
```
```
municipality, County of Cook or registered as a Bed &
Breakfast with the State of Illinois under 50 ILCS 820/
et.seq., with six or fewer rentable units and where one
unit is owner occupied and is entitled to a Homeowner’s
Exemption pursuant to the Property Tax Code.
```
```
2-1 8 A residential building licensed as a Bed & Breakfast by the
```
```
2-1 9 A residential building licensed as a Bed & Breakfast by the
municipality, County of Cook or registered as a Bed &
Breakfast with the State of Illinois under 50 ILCS 820/
et.seq., with six or fewer rentable units and where none
of the units is owner occupied and no Homeowner’s
Exemption is allowed pursuant to the Property Tax
Code.
```

**Major Class 3 Multi Family**
10% Level of Assessment

```
3-00 Land used in conjunction with rental apartments
3- 01 Garage used in conjunction with rental apartments
3-13 Two-or-three-story, building, seven or more units
3-14 Two-or-three-story, non-fireproof building with corridor
apartment or California type apartments, no corri dors
exterior entrance
3-15 Two-or-three-story, non-fireproof corridor apartments or
California type apartments, interior entrance
3-18 Mixed-use commercial/residential building with apartments
and commercial area totaling seven units or more with
a square-foot area of over 20,0 00 square feet
3- 90 Other minor improvement related to rental use
3- 91 Apartment bu ilding over thr ee stories, seven or more units
3- 96 Rented modern row houses, seven or more units in a single
development or one or more contiguous parcels in common
ownership
3- 97 Special rental structure
3- 99 Rental condominium
```
**Major Class 4 Not For Profit** _(2 0 % level of assessment)_

```
4-00 Not-for-profit land
4-01 Not-for-profit garage
4-17 Not-for-profit one story commercial
building
4-1 8 Not-for-profit two-or-three story mixed use
commercial/residential building
4-22 Not-for-profit one-story non-fireproof public garage
4-23 Not-for-profit gasoline station
4-2 6 Not-for-profit commercial greenhouse
4-27 Not-for-profit theatre
4-2 8 Not-for-profit bank building
4-2 9 Not-for-profit motel
```
```
3 of 11
```
```
04/03/
```

```
4-30 Not-for-profit supermarket
4-3 1 Not-for-profit shopping center
4-3 2 Not-for-profit bowling alley
4-3 3 Not-for-profit quonset hut or butler type building
4-3 5 Not-for-profit golf course improvement
4-8 0 Not-for-profit industrial minor improvement
4-8 1 Not-for-profit garage used in conjunction with industrial
improvement
4-8 3 Not-for-profit industrial quonset hut or butler type building
4-8 7 Not-for-profit special industrial improvement
4-8 9 Not-for-profit industrial condominium
4-9 0 Not-for-profit commercial minor improvement
4-9 1 Not-for-profit improvement over three stories
4-9 2 Not-for-profit, two-or-three story building containing part or
all retail and/or commercial space
4-9 3 Not-for-profitindustrial building
4-9 6 Not-for-profit, rented modern row houses, seven or more
units in a single development
4-97 Not-for-profit special structure
4-99 Not-for-profit condominium
```
**Major Class 5A Commercial** _(25% level of assessment)_

```
5- 00 Commercial land
5- 35 Golf course land
5- 01 Garage used in conjunction with commercial improvements
5-16 Non-fireproof hotel or rooming house (apartment hotel)
5-17 One-story commercial building
5-22 One-story, non-fireproof public garage
5- 23 Gasoline station
5- 26 Commercial greenhouse
5- 27 Theatre
5- 28 Bank building
5- 29 Motel
5- 30 Supermarket
```
```
4 of 11 04/03/
```

```
5-31 Shopping center
5-32 Bowling alley
5-33 Quonset hut or butler type building
5-35 Golf course improvement
5-90 Commercial minor improvement
5-91 Commercial building over three stories
5-92 Two-or-three-story building containing part or all retail
and/or commercial space
5- 97 Special commercial structure
5- 99 Commercial condominium unit
```
**Major Class 5B Industrial** _(25% level of assessment)_

```
5- 50 Industrial land
5- 80 Industrial minor improvement
5- 81 Garage used in conjunction with industrial improvement
5- 83 Industrial quonset hut or butler type building
5- 87 Special industrial improvement
5- 89 Industrial condominium unit
5- 93 Industrial building
```
**Major Class 6A Industrial Incentive**

```
A. Industrial Incentive Classes (6A)
```
```
6- 50 Industrial land
6- 80 Industrial minor improvement
6- 81 Garage used in conjunction with industrial incentive
improvement
6- 83 Industrial quonset hut or butler type building
6- 87 Special industrial improvement
6- 89 Industrial condominium unit
6- 93 Industrial building
```
```
5 of 11 04/03/
```

```
04/03/
```
```
B. Industrial Incentive Classes (6B)
```
```
6- 51 Industrial land
6- 63 Industrial building
6- 70 Industrial minor improvement
6- 71 Garage used in conjunction with industrial incentive
improvement
6- 73 Industrial quonset hut or butler type building
6- 77 Special industrial improvement
6- 79 Industrial condominium unit
```
**Major Class 6C Industrial Brownfield Incentive**

```
6- 37 Industrial Brownfield land
6- 38 Industrial Brownfield
6- 54 Other industrial Brownfield minor improvements
6- 55 Garage used in conjunction with industrial Brownfield
incentive improvement
6- 66 Industrial Brownfield quonset hut or butler type building
6- 68 Special industrial Brownfield improvement
6- 69 Industrial Brownfield condominium unit
```
**Major Class 7 Commercial Incentive**

```
A. Commercial Incentive Classes
7- 00 Commercial Inc entive Land
7- 35 Golf Course Land
7- 01 Garage used in conjunction with Commercial Incentive
improvement
7-16 Non-Fireproof hotel or rooming house (Apartment hotel)
7-17 One-story commercial use building
7-2 2 Garage, service station
7-23 Gasoline station, with /without bays, store
7-26 Commercial greenhouse
7-27 Theatre
```
```
6 of 11
```
```
02 / 02 /201 8
02 / 02 /201 8
02 / 02 /201 8
```

```
04/03/
```
```
7-28 Bank building
7-29 Motel
7-30 Supermarket
7-31 Shopping center
7-32 Bowling alley
7-33 Quonset hut or butler type building
7-35 Golf course improvement
7-90 Other minor commercial improvement
7-91 Office building (One story, low, rise, mid rise, high rise)
7-92 Two-or-three-story building containing part or all retail
and/or commercial space
7- 97 Special commercial structure
7- 99 Commercial/In dustrial-Condominium unit/garage
```
**B. Commercial Incentive Classes**

```
7- 42 Commercial incentive land
7- 45 Golf course land
7- 43 Garage used in conjunction with commercial incentive
improvement
7-45 Golf course improvement
7-46 Non-Fireproof hotel or rooming house (Apartment hotel)
7-47 One-story commercial building
7-4 8 Motel
7-52 Garage, service station
7-53 Gasoline station, with/without bays, store
7-56 Commercial greenhouse
7-57 Theatre
7-58 Bank building
7-60 Supermarket
7-61 Shopping center (Regional, community, neighborhood,
promotional, specialty)
7- 62 Bowling alley
7- 64 Quonset hut or butler type building
7- 65 Other minor commercial improvements
7- 67 Special commercial structure
```
```
7 of 11
```

```
04/03/
```
```
7-72 Two-or-three-story building, containing part or all retail
and/or commercial space
7- 74 Office building
7- 98 Commercial/In dustrial-condominium units/garage
```
**Major Class 8 Commercial/Industrial Incentive**

```
8- 00 Commercial incentive land
8- 35 Golf course land
8- 50 Industrial incentive land
8- 01 Garage used in conjunction with commercial incentive
improvement
8-16 Non-fireproof hotel or rooming house (apartment hotel)
8-17 One-story commercial building
8-2 2 Garage, service station
8-23 Gasoline station with/with out bay, store
8-26 Commercial greenhouse
8-27 Theatre
8-28 Bank building
8-29 Motel
8-30 Supermarket
8-31 Shopping center (Regional, community, neighborhood,
promotional, specialty)
8- 32 Bowling alley
8- 33 Quonset hut or butler type building
8- 35 Golf course improvement
8- 80 Industrial minor improvement
8- 81 Garage used in conjunction with industrial incentive
improvement
8-83 Quonset hut or butler type building
8-87 Special industrial improvement
8-89 Industrial condominium unit
8-90 Minor industrial improvement
8-91 Office building
8-92 Two-or-three-story building containing part or all retail
and/or commercial space
```
```
8 of 11
```

```
04/03/
```
```
8- 93 Industrial building
8- 97 Special commercial structure
8- 99 Commercial/In dustrial condominium unit/garage
```
**Major Class 9 Multi Family Incentive**
10% Level of Assessment
9-00 Land used in conjunction with incentive rental apartments
9-01 Garage used in conjunction with incentive rental apartment
9-13 Two-or-three-story apartment building, seven or more units
9-14 Two-or-three-story, non-fireproof court and corridor
apartments or California type apartments, no corrid ors,
exterior entrance
9-15 Two-or-three-story non-fireproof corridor apartments, or
California type apartments, interior entrance
9-18 Mixed use commercial/residential building with apartments
and commercial area where the commercial area is granted
an incentive use
9-59 Rental condominium unit
9-90 Other minor improvements
9-91 Apartment buildings over three stories
9-96 Rented modern row houses, seven or more units in a single
development or one or more contiguous parcels in common
ownership
9-97 Special rental structure

```
9 of 11
```

```
04/03/
```
**Valid Major Class 6 to 9 and “C”, “L”, “S” Major Classes Incentive CDU’s**

CDU represents the area on the Assessor’s Office record where the incentive type is
stored. The CDU is shown on AINQ and the facesheet under the heading “CDU”.

```
Major Class 6A
CDU = Blank Industrial; 2009 ordinance; 8 years at 20%
```
```
Major Class 6B
CDU = ‘PB’ Industrial; 2009 ordinance; 10% for the first 10 years and
any subsequent 10 - year renewal period; if not renewed,
15% in the 11th year, 20% in the 12th year
```
```
Major Class 6C
CDU = ‘BF’ 2009 ordinance; 3 years at 10%
```
```
Major Class 7A
CDU = ‘SA’ Industrial; 2009 ordinance; 10% for the first 10 years, 15% in
the 11th year, 20% in the 12th year, el igible for renewable
terms, if not renewed, returns to 25% in year 13.
CDU = “CM” Commercial: 2009 ordinance; 10% for first 10 years,15% in
the 11th year, 20% in 12th year, not eligible for renewal.
```
```
Major Class 7B
CDU = ‘CB’ Commercial; 2009 ordinance; 10% for first 10 years,15% in
the 11th year, 20% in 12th year, not eligible for renewal.
CDU = ‘SB’ Industrial; 2009 ordinance; 10% for first 10 years,15% in the
11th year, 20% in 12th year, not eligible for renewal.
```
```
Major Class 8
CDU = ‘RE’ Industrial; 2009 ordinance; 10% for the first 10 years and any
subsequent renew period; if not renewed, 15% in the 11th
year, 20% in the 12th year, 25% in the 13th and subsequent
years;
CDU = ‘RC’ Industrial; 2009 ordinance; 10% for the first 10 years and any
subsequent re new period; if not renewed, 15% in the 11th
year, 20% in the 12th year, 25% in the 13th and subsequent
years, not eligible for renewal.
```
```
10 of 11
```

```
04/03/
```
```
Major Class 9
CDU = ‘AP’ Apartments; 2009 ordinance; 10 years at 10%
```
```
Major Class “C” (Reflected in Major Class 6)
CDU = ‘CL’ Industrial; 2009 ordinance; 10% for the first 10 years and for
any subsequent 10 - year renewal period; if not renewed,
15% in the 11 th year, 20% in the 12th year.
CDU = ‘CC’ Commercial; 2009 ordinance; 10% in the first 10 years, 15%
in the 11th year, 20% in the 12th year, not eligible for
renewal.
```
```
Major Class “L” (Reflected in Major Class 3, 4, 5 and 6 (Landmark))
CDU = ‘LI’ Industrial landmark; 2009 ordinance; 10% for 8 years, 15% in
the 9th year, 20% in the 10th year
CDU = ‘LL’ Commercial landmark; 2009 ordinance; 10% for 8 years, 15%
in the 9th year, 20% in the 10th year, no t eligible for renewal.
CDU = ‘LM’ Multifamily Class 3 landmark; 2009 ordinance 10% for 10
years and for any subsequent re newal periods; if not
renewed, 15% in year 11 and 20% in year 12.
CDU = ‘LP’ Not-for-Profit landmark 2009 ordinance 10% for 10 years and
for any subsequent renewal periods; if not renewed 15% in
year 11 and 20% in year 12.
CDU = ‘LD’ Industrial landmark 2009 ordinance 10% for 10 years and for
any subsequent re newal periods, if not re newed 15% in year
11 and 20% in year 12.
CDU = ‘LC’ Commercial landmark 2009 ordinance 10% for 10 years, 15%
in year 11 and 20% in year 12, not eligible for renewal.
```
**Major Class “S”** _(Reflected in Major Class 3)_

```
CDU = ‘S’ Multifamily class 3; 2009 ordinance 10% for the term (at least
5 years) of the section 8 contract re newal under the mark up
to the market option and then any additional terms of renewal
under tha t contract.
```
```
11 of 11
```

