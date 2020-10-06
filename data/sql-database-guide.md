# SQL Database Guide

> :warning: Anything with a `DEV` prefix is still in development and should not be used by anyone other than its creator.

# Data Dictionaries

| HEAD COLUMN | DESCRIPTION |
| ------ | ------ |
| HD_PIN | parcel ID number, not left padded |
| HD_VOL | - |
| HD_TOWN | 5 digit tax code, use first two digits for township |
| HD_CLASS | class code |
| HD_NBHD | neighborhood |
| HD_ASS_LND | land AV |
| HD_ASS_BLD | improvement AV |
| HD_PRI_LND | prior year land AV |
| HD_PRI_BLD | prior year improvement AV |
| HD_NAME | mailing name |
| HD_DEED_TYPE | - |
| HD_SDATE | most recent sale date |
| HD_SPRICE | most recent sale price |
| HD_HD_SF | land square footage |
| HD_STREET_CODE | - |
| HD_HOUSE_NO | - |
| HD_ADDR | address |
| HD_CITY | city |
| HD_ZIP | zip code |
| HD_DOCUMENT | unique sale document number (do not use for joins) |
| TAX_YEAR | assessment year |
| PIN | parcel ID number, left padded |

All other data dictionary materials can be found in the [Residential Repository](https://gitlab.com/ccao-data-science---modeling/ccao_sf_cama_dev/-/tree/master/data_dictionary_constituents)

# Table Definitions

## AS_ TABLES
*AS Tables contain data that originates from the AS400.*

* T suffix - updated after a township has been mailed assessment notices.  It's the most up-to-date version of the HEAD file. These tables are considered ***FIRST PASS***.
* TB suffix - updated after a township has been certified by the assessor's office.  Karen sends out an email every time a town is closed, this is the easiest way to keep track of which towns have been updated. These tables are considered ***SECOND PASS***.
* BR suffix - updated after a township has been certified by the BoR. These tables are considered ***THIRD PASS***.

***AS_HEAD***  
The universe of all PINs in Cook County.

***AS_DETAIL***  
Land, improvement, and potentially 288 lines for each PIN that break down valuation and provide information necessary for proration.

## FTBL_ TABLES
*Fact Tables are attributes about objects that are determined exclusively by some bureaucratic agency. For example, the township codes are simply set by the CCAO, and are therefore facts.*

***FTBL_CERT_DATES***  
Historical mailing/certification dates for the assessor and board of review.

***FTBL_EQUALIZATION_FACTOR***  
Historical IDOR Cook County equalization factors.

> The department is required by law to calculate the factor, also called the multiplier, to achieve uniform property assessment throughout the state.
>
> The department determines the final equalization factor for each county by comparing the actual selling price of individual properties, over a three-year period, with the assessed value placed on those properties by the county assessor and adjusted by the board of review. If the median level of assessment for all property in the county varies from the 33 1/3 percent level required by law, an equalization factor is assigned to bring assessments to the legally mandated level.

***FTBL_CERT_DATES***  
Table containing township and triad names and codes.

## DTBL_ TABLES
*Data Tables contain data collected, stored, or calculated from sources other than the AS/400.*

***DTBL_CLASSCODES*** 
Provides joinable text descriptions of all class codes

***DTBL_CCRDSALES***  
Sales data received monthly from the Cook County Recorder of Deeds.

***DTBL_CONDOSTRATA***  
Contains 10 and 100 level strata assigned to individual condo buildings by year.  Not all tris have been assigned strata values for every year due to the triennial schedule.

***DTBL_CONDOSTRATA_STATS10***  
Descriptive statistics for the 10 level condo building strata.  Stats are only valid for the year displayed within the table.

***DTBL_CONDOSTRATA_STATS100***  
Descriptive statistics for the 100 level condo building strata.  Stats are only valid for the year displayed within the table.

***DTBL_FORECLOSURES***  
Parcel level foreclosure data reaching back to 1997.  Cannot be used to match with sales due to a lack of precision in IDOR dates. `sales_results` column is used to identify foreclosures. Obtained from "public-record.com".

***DTBL_IDPH_SENIOR_DEATHS***  
Records returned from the Illinois Department of Public Health matching seniors receiving a senior homestead or freeze exemption against IDPH death records.

***DTBL_LANDUNITPRICES***  
Land unit prices determined by an analysts in the DS department, typically on a township by township basis, while townships are being valued during a tri.

***DTBL_LEXISNEXIS_SENIOR_DEATHS***  
Records returned from LexisNexis matching seniors receiving a senior homestead or freeze exemption against LexisNexis death records.

***DTBL_MODELVALS***  
MODELVALS contains initial fitted values produced by data science.  These values are adjusted through desk review and revisions before they enter AS_HEADT.  The `version` column should be utilized to determine which value for a township within a given year is the most up-to-date.

***DTBL_PINLOCATIONS***  
Contains geographic data for all county parcels, such as centroid LAT/LONG, floodplain, distance from a major road, and political districts.

***DTBL_RPIE_NOTICES***
A dataset of commercial PINs and the RPIE codes associated with them.

***DTBL_VALIDATED_IC_SALES***  
Industrial and commercial class sales identified by whether or not they're valid and by deed number.  Commercial analysts included comments while validating sales.

***DTBL_LEVIES***
Compiled levy data by tax agency and tax code.

> :warning: This table is generated in the PTAXSIM repo, *NOT* Data Architecture

## MTBL_ TABLES
*Metrics Tables contain summary data calculated from views (see below).*

***MTBL_RESIDENTIAL_DIAGOSTIC***
Contains summary statistics and IAAO statistics for townships and triads. Used to run the diagnostic report. 

## OTHER TABLES
*These are tables that are generally sourced from the AS/400 but don't have T/TB/BR suffixes.*

***65D***  
A table recording changes made to pipeline values during desk review.  Precedes "mailed" in CCAO assessment work flow.

> :warning: This table is not reliable for Berwyn, Lemont, Lyons, Worth, and Stickney in 2020 due to COVID-19 adjustments.

***EXEMPTIONS***  
Database of exemptions homeowners are recieving/have recieved:

* 'HO' = Homeowner Exemption
* 'HS' = Senior Exemption
* 'SF' = Senior Freeze 

# View Definitions
*Views are combinations of tables that exist as queries rather than a physical flat file.  They must be assembled each time they're referenced.*

***VW_CLEAN_IDORSALES***  
A list of sales since 1997 that has been "cleaned" - one record per sale (the record with the largest sale $). Excludes sales for deeds of type Q, E, and B.

***VW_HB833***  
Data to support the automatic renewal of the senior homestead exemptions

***VW_MOST_RECENT_IDORSALES***  
A list of the most recent sale for each PIN in the current assessment year that has been sold since 1997. Excludes sales for deeds of type Q, E, and B.

***VW_PINGEO***  
Spatial data as well as addresses and political districts for each PIN in the current assessment year.

***VW_RES_RATIOS***  
"Leading" ratios using sales from ***`VW_CLEAN_IDORSALES`***.  Ratios are created using sales that occurred after but within 365 days of a parcel's value being assessor certificated, so that we can be sure those sales were not "sales chased".

***VW_RES_UNIVERSE***  
A collection of all residential PINs available in the HEADT file from 1997 to present.  Physical characteristics are added for SF and MF PINs, condo strata, percent assessed, and the number of units in condo buildings for NCHAR PINs.
