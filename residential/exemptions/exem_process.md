# CCAO Exemptions Process

<img src="new/asrlogo.png" alt="" align="top" width="500">

## [CCAO Organizational Chart: Exemption Focus](new/org_edit_p.pdf)
### Overview

<details><summary>**Total Annual Exemptions Processed**</summary>

_Type_ | 2017 | 2018 |2019
------:|:----:|:----:|:---:
Homeowner|1,321,760||
Senior|295,075||
Senior Freeze|159,757||
Disabled Persons|15,768||
Returning Veteran|107||
Disabled Veteran|4,997||
Longtime|2,463||
No File|62,117||
</details>

<details><summary>**Property Tax Exemptions 101**</summary>
####The Assessor’s Office processes seven types of property tax exemptions.

1.	Senior (a.k.a. “homestead”) – processed in the mainframe (MF);
    * A Senior “Prime” Application refers to a first time applicant.
    * If it is not a “prime” application, then it a “renewal.”
    * Renewals are processed on the AS400.
2.	Senior Freeze – processed in the AS400;
3.	Disabled person – processed in the AS400;
4.	Disabled veteran – processed in the AS400
    * For three categories of disabled veterans:
    * 70% disability or greater
    * 50 to 69% disabled
    * 30 to 49% disabled
5.	Returning veteran – processed in the AS400;
6.	Homeowner – processed in the AS400;
    * Co-ops and prorated parcel exemptions are uniquely calculated
7.	Long-time homeowner (or Long Term Occupant) – processed in the AS400;
* <details><summary>Other</summary>
    * Disabled Veteran Homestead
        * Processed by the State but reviewed by the Assessor’s Office Legal Department
        * Legal Dept. keys the data into the AS400.
    * Sunset exemptions
        * Expired in 2014 and will likely be out of scope for the IPTS implementation.
</details>

<details><summary>**Order of Operations for Exemption Deductions**</summary>

1. Senior Freeze
2. Homeowner
3. Homestead non-Coop
4. Veteran
5. Homestead Coop 
6. Disabled Person
7. Disabled Veteran < 75%
8. Disabled Veteran > 74%
9. Returning Veteran 
</details><br>

**Note**: Given limitations of the mainframe, exemption applications are grouped in batches. In practice, the initial entry of Senior and Senior Freeze Exemptions uses batch numbers `000001` to `000005`; one batch per branch including downtown.  

Senior renewals are captured in the AS400 and thus batch in a simpler manner, in sets of 100 records, each group of 100 gets its own batch number (to make it easier to search and retrieve). The County requires the elimination of these limitations.

While some exemptions are captured and processed in the AS400, all exemption information is subsequently uploaded to the mainframe. Assessor’s Office does not apply exemption amounts directly, but rather to the equalized assessed value (EAV) after this has been determined by the Illinois State Department of Revenue.

###[Original Granular Process Map (.pdf)](new/mirella_pmap.pdf)

###<details><summary>Abstract System Map</summary> (S. Eifert 8/16/2016)![](new/systems_diag.png)</details>

</details><br>

### Changes for Tax Year 2019
<details><summary>**Updates to Forms and Processes for 2020 Intake Period**</summary>

2019|2020
----:|----
"Senior Citizens Exemption"|Renamed Senior Exemption
"Disabled Veterans Exemption"|Renamed Veterans with Disabilities Exemption
"Disabled Persons Exemption"|Renamed Persons with Disabilities Exemption
No exemption applications were available online.|Homeowner, Senior, and Senior Freeze are online. They are linked on each exemption’s web page.
Exemptions: accept/reject via the mail.|For online applicants, notification via email.
Taxpayers with leases applied for exemptions via Certificates of Error.|Can apply for current tax year (must see a manager).
Occupancy Affidavit: attestation by someone other than applicant.|Applicant now attests to their own occupancy of the property.
Homeowner and Senior Exemptions were on the same form.|These exemptions are now on separate forms, as they have different eligibility and document requirements.
Listed accepted ID documents: drivers license, state ID.|Lists are greatly expanded to match eligibility requirements for ID, occupancy, and taxpayer status.
Must renew Senior Exemption every year.|Now the Senior Exemption is renewed automatically.
Didn’t ask for last 4 of SSN.|Senior and Senior Freeze forms request (optional) the last 4 of SSN. 
**Mailers:** Two senior-related mailers: _purple_ "full" booklet for deed changes (Homeowner, Senior, Freeze) and the _blue_ “senior renewal” booklet that included the Senior and Freeze.|This “Senior” group was broken into 3 categories. _Blue_ mailer: modified to just renew the Freeze. _Gold_ mailer: new. Is the “full booklet” renewal mailed to prior recipients of the Senior who may be deceased. _Postcard:_ new. Confirms Homeowner and Senior auto-renewal so that no action is necessary.

### Resources for taxpayers
* Link directly to https://www.cookcountyassessor.com/exemptions
* Site contains a brief overview of all exemptions, with links to each one
* Lists the documents required with application
* Printable PDF applications and online submission available when possible.
* It has important notes for anyone applying for exemptions
</details>

### Eight Steps of Exemption Administration
<details>
<summary>**Interdepartmental Collaboration & Process Flow**</summary>
![](new/hi_lvl_flowchart.png)
</details>

### Schedule & Relationship Dependencies 
<details>
<summary>**Gantt Chart**</summary> 
**The Chart below focuses on the period following application intake in which meeting deadlines is critical, due to the way each step is dependent upon completion of the prior steps. Many of the other tasks in the administration process can be and usually are completed in varied order.**
##### [Interactive Excel File](new/GANTT.xlsx)
![](new/GANTT.png)
</details>

# 1. Generate Master File

Departments Involved | Programs & <br> Technology Employed
:-------------------:|:---------------------------:
Bureau of Technology (BOT) | Mainframe 
Taxpayer Information (TPI) | Homestead Update Interface (HUPD)
Data Science | AS400
Legacy Systems |

## Description
####Generates list of taxpayers who are likely eligible for exemptions (“Master File”).
####These will be informed of their eligibility, status and the next steps to take to receive their exemption.

## Details
<details>
<summary>**1.1.**	Create a copy of last year's Master File for use in current tax year  </summary>

- Backup prior year HUPD file
-	The file is updated nightly with assessment and exemption information from Board of Review data sets.
- PTI: Change the nightly back up (new file scheduler)
- BOT: Enable HUPD transactions on Mainframe
    - HUPD is a program that interfaces directly with the Mainframe
    - TPI can use it to update the records directly
    - HUPD is technically a noun, but is often used as a verb as jargon for "use the HUPD to access the Mainframe"
- 
<details> 
  <summary>Associated files, programs & naming conventions</summary>
  -	  Conversion program: `TRIPT761`
  -	  Panvalet record description: `ASREASRDU3`
  -	  Run-A-job: `TRIPT63T`   -	  FTP file name example: `AS.REA.ASMTMSTR-MF-120817.TXT` </details>
    -	  <details> 
    <summary>Data dictionary & documentation</summary>
        - [as.rea.asmtmstr.csv](new/as.rea.asmtmstr.csv)
            - NB: each field is interspersed with a '|' delimiter, omitted here.
            - [Original](orig/VSAM_layout.docx) (S. Pham 2017) 
        - The Assessor property master is a **VSAM** file that has detail segment data for all Cook County properties: land data, improvement data and questionnaire data.
            - **V**irtual **S**torage **A**ccess **M**ethod, IBM data structure circa 1970.
        -	 The file name the mainframe uses is `AS.REA.ASMTMSTR`
        -	 The converted output file will be a variable length file. 
        -	 Bytes 1 – 273 will always be on each record as defined below. 
        -	 File length is variable.
            -	After byte 273, the data format will vary depending on what variable segments the records will have.
            -	 Minimum length is 273. 
            -	 Maximum length is 273 + (118 * 200) = 23,873.  
            -	 118 is the variable segment data length for all segments
            -	 200 is maximum number of segments.  
        - Each record can three distinct types of segments all 118 bytes in length. They are:
            - _Sales segment:_ 
                - This segment can exist only once on each record. 
                - You must inspect the value of ‘Sales segment counter’ in byte 264.
                - If the value is ‘zero’ then the record will have no Sales	segment.
                - If the value is ‘one’ the record will have a Sales segment.
                - The Sales segment, if it exists, will always follow the fixed data of the record.
                - It will always be in bytes 274 to 391 on the record. 
            - _Detail segments:_ 
                - These segments can occur up as many times as the value in the field called ‘Detail/Questionnaire segment counter’. 
                - There are five different types of Detail segments.
                    - Type 1 – Land
                    - Type 2 – Improvement
                    - Type 3 – Improvement
                    - Type 4 – Improvement
                    - Type 5 – Improvement
                    - In order to determine what kind of Detail segment you are dealing with you must inspect the value in the field called ‘Type’, which will be in the fifth byte of every Detail segment. 
                - If no Sales segment exists, the Detail segment will followed the fixed data in bytes 274 to 391.
                - If a Sale segment exists then the first detail segment will follow it in bytes 392 to 509. 
            - _Questionnaire:_ 
                - This segment will always follow directly behind a Detail segment if that Detail segment is either Type 2, 3, 4 or 5 and the Detail segment field called ‘Class’ has a value of 202-212, 234, 278, 295, 402-412, 434, 478 or 495.  
                - The field ‘Class’ will be in bytes 13-15 in all of the Detail Type 2-5 segments. 
                - When dealing with the variable segments you will have bump through the record after the fixed portion by 118 bytes as many times as the counters in the fixed portion of the record tell you in order to process all the variable data.

</details>
  
</details>

<details>
<summary>**1.2.** Removal of deceased taxpayers</summary>

-	An application may return with a signature from an estate executor or, notification is received from a family member.
-	An Executor must submit authorization to execute and Death Certificate.
-	TPI works with Systems to delete PINs: uses the Exemptions homestead file from the prior year to remove deceased seniors or to make adjustments
-	Data Science working to utilize other county and state databases to match ineligible taxpayers to properties
</details>

<details>
<summary>**1.3.**	Open new tax year HUPD file</summary>

-	Systems Department typically calls BOT to request opening of the Mainframe HUPD transactions sometime in October of every year, prior to preparing exemption mailings which start in January of the following year.
- This is in preparation for the exemption and tax processing. BOT opens a new year with no PIN numbers and updates the menu/options/screens to point to the new year - which is empty
- BOT downloads the Mainframe file to the AS400
</details>


<details>
<summary>**1.4.** Integrity & Quality Assurance Testing</summary>

- TPI keys 4 or 5 PINs for Prime applications (new senior applications)
- BOT runs a nightly cycle, and downloads the Senior and Homeowner File to the AS400
- Systems validates the test PINs and notifies TPI
</details>

<details>
<summary>**1.5.** New file reconciliation</summary>

- TPI enters all Prime applications received prior to mailing and applications received thereafter directly to Mainframe.
- BOT disables HUPD upon request from TPI, triggers appropriate jobs to update for all other users (e.g. Clerk, Treasurer)
</details>

#2. Generate Mailing List

Departments Involved | Programs & <br> Technology Employed
:-------------------:|:---------------------------:
Bureau of Technology (BOT) | Mainframe 
Taxpayer Information (TPI) | AS400
Legacy Systems |

##Description
####Use Master File to create list of addresses associated with potential exemption eligibility.

##Details
<details>
<summary>**2.1.** Build Sales File for mailings</summary>

* **Query Basis:** Properties sold in past year likely indicate change in exemption eligibility, if only from one taxpayer to the next.
    * <details><summary>Query syntax</summary>
        * RUN FOLLOWING JOBS TO CREATE PRIOR YEAR SALES FILE WITH SALES GREATER THAN 1 DOLLAR (VALID SALES)
        * Library `DATAC`

        | AS400 Query | Note | Input File |
        |-------------|------|------------|
        RMMSALEA|USE PRIOR YR SALES MD FILE|SELECT DEED`YYYY` PRIOR YEAR
        RMMSALEC|USE CURRENT YR SALES MD FILE|SELECT DEED`YYYY` PRIOR YEAR
        RMMSALED|IDENTIFIES DUPLICATE RECORDS|n/a
        RMMSALEE|ELIMINATES DUPLICATE RECORDS|CHANGE YEAR IN ‘DEFINE DATABASE FILE’ TO PRIOR YEAR (E.G. `SALE2017W0/DATAC`)
        RMMSALEF|SELECT SALEPRICE GREATER THAN ‘1’|CHANGE YEAR IN ‘DEFINE DATABASE FILE’ TO PRIOR YEAR (E.G.`SALE2017G0/DATAC`)</details>

* Re-run prior year’s sales for new year Processing and replace file on `SALE2013C` with new year.
* Changed to `PTAX203` from Recorder file on 11/10/2015
* `SALE2014A` with `PTAX203` prior year file
* `SALE2014C` with `PTAX203` current year file<br>
![](p2.1/Picture1.png)<br>
* Copy Queries to New Tax /Exemption Year<br>
![](p2.1/p2.png)<br>
* Run `SALE2014A` now (6/3/14), then re-run all files by December before mailing
* Build files for AS400 menu (option #29)<br>
![](p2.1/p3.png)<br>
* Ran on 11/10/2015 as test file, re-run when BOT creates 2015 `HOMOWNMST` file
* Have SYSTEMS (STEVE) upload file from `SALESADJ01`<br>
![](p2.1/p4.png)<br>
* Change to 2014 for 2014 Tax year
* Build 10 year sales history<br>
![](p2.1/p5.png)
![](p2.1/p6.png)<br>
* After `SALES10Y17` re-run `SALES10Y6`, -`7`, -`10` and -`11` 
* Creating properties where age = 10 or greater<br>
![](p2.1/p7.png)<br>
* For long-time mailing<br>
![](p2.1/p8.png)<br>
* Run when preparing to mail LT
* Early No_file<br>
![](p2.1/p9.png)<br>
* Look at write-up for No-File (contact Kathy Lee)
</details>

<details>
<summary>**2.2.** Create 10 year age property file</summary>

-	This is used to calculate means-tested percentage exemptions
-	**Query Basis**: has the taxpayer received the homestead exemption for at least nine consecutive years **OR** previously received a long-term exemption?
    - <details><summary>Query syntax</summary>
        - IF CURRENT TAX YEAR =TRI YEAR, THEN AGE =10
        - IF CURRENT TAX YEAR =TRI YEAR-1, THEN AGE=9
        - IF CURRENT TAX YEAR =TRI YEAR-2, THEN AGE =8
        - Library `DATAC`
        
        | AS400 Query | Result | Output File |
        |-------------|--------|-------------|
        DTLAGE_CY|CITY PINS (CURRENT TRI YEAR, AGE=10)| DTLAGE/DATAC
DTLAGE_NW|NORTHWEST PINS (TRI WAS TWO YEARS AGO, AGE=8)| DTLAGE/DATAC
DTLAGE_SW|SOUTHWEST PINS (TRI WAS ONE YEAR AGO, AGE=9)| DTLAGE/DATAC
LTOWN01|CHANGE MEMBER YEAR TO CURRENT ON OUTPUT FILE|LTOWN01
LTOWN02|ELIMINATES DUPLICATES|LTOWN02

-	Known by the names:
    - Long-time Homeowner Exemption
    - Long Term Occupant Exemption
    - LT4 (Long-term 4%; income < $75,000)
    - LT2 (Long-term 2%, income $75,000 - $100,000)
    - LT7 (Better than Senior Freeze)
- Process in AS400
    <details>
    <summary> Create Database </summary>
    ![](p1.4/fig1.png)<br>
    * run `tslstbuil1/datac`<br>
    ![](p1.4/fig2.png)
    </details>
    
    <details>
    <summary> Calculate LT4 & LT2 Exemptions: </summary>
    - New queries: Run `PRORAT3` and `PRORAT4` BEFORE FOLLOWING QUERIES<br>
    ![](p1.4/fig3.png)
    ![](p1.4/fig4.png)<br>
    - Run `CHK297_02` AS FILE AND REPORT<br>
	 ![](p1.4/fig5.png)<br>
    - Run following query after LNGTM_20 and before LNGTM_21<br>
	 ![](p1.4/fig6.png)
	 ![](p1.4/fig7.png)
	 ![](p1.4/fig8.png)<br>
    - Give Lumni following reports (‘R’ for report, ‘F’ to create file):<br>
    ![](p1.4/fig9.png)<br>
    - Wait for approval before uploading ASREA86X (LNGTM_90/DATAC) file<br>
	 ![](p1.4/f1.png)<br>
    - Wait for approval before uploading ASREA86X (LNGTMFX2/DATAC) file
    - Old queries: change years and State Equalizer<br>
	 ![](p1.4/f2.png)
	 ![](p1.4/f3.png)
	 ![](p1.4/f4.png)
	 ![](p1.4/f5.png)
	 ![](p1.4/f6.png)
	 ![](p1.4/f7.png)<br>
    - Give Lumni reports:
        - 14_23
        - 14_31
        - 14_32
        - 14_96
    - Wait for approval before uploading `ASREA86X` (LNGTM14_30/DATAC) file<br>
    ![](p1.4/f8.png)<br>
    - Wait for approval before uploading `ASREA86X` (LNGTM14_90/DATAC) file
    - To ‘fix’ PIN’s whose LT should equal 7000, run following queries (data entry of pins in both queries (FX1 to assign 7000, FX2 to include remaining LT PIN’s):<br>
    ![](p1.4/f9.png)<br>
    - MISC QUERIES<br>
	 ![](p1.4/f10.png)<br>
	 ![](p1.4/f11.png)
	 </details>
	 
	 <details>
	 <summary> Calculate LT7 Exemptions</summary>
        - Files Needed:<br>
        ![](p1.4/f12.png)
        ![](p1.4/f13.png)<br>
        - GIVE LUMNI the following reports:
        - Once approved, run `ASREA86X`
        - Sndnetf following file:<br>
        ![](p1.4/f14.png)<br>
        - ASHMA82V<br>
        ![](p1.4/f15.png)<br>
        ![](p1.4/f16.png)
        ![](p1.4/f17.png)
        ![](p1.4/f18.png)
        ![](p1.4/f19.png)
    </details>
    
</details>


<details>
<summary>**2.3.** Update ‘HOMEOWNER NO FILE’</summary>

* Mainframe Data Filename: `A.AS.HMA.NOFILE15-NOFILE15-MF-050616.txt`
* TPI gets Senior Lexus/Nexus ‘NO’ file PINs & uploads to Homeowner NO-FILE
* Upload can be run multiple times during year
* Change  JCL for new year (one time)<br>
![](p2.3/p.png)
![](p2.3/p1.png)
![](p2.3/p2.png)
![](p2.3/p3.png)
![](p2.3/p4.png)
![](p2.3/p5.png)
![](p2.3/p6.png)
![](p2.3/p7.png)<br>
* During MIS processing, only run when requested by BOT (after SF processing and before 7%)
* Make sure no one is on the AS400 “no-file” prior to running following jobs<br>
![](p2.3/p8.png)
![](p2.3/p9.png)<br>
* Screenprint counts
* Produces `ASREA45U` job (check JHS)<br>
![](p2.3/p10.png)
![](p2.3/p11.png)
![](p2.3/p12.png)
</details>

<details>
<summary>**2.4.** Mainframe generates Mailing Files</summary>

* Senior & Senior Freeze Exemption
    * Systems/TPI requests BOT send `HSRENEW` and `HOMOWNMST` files 
    * BOT transfers file from Mainframe to AS400
    * Systems generates the Senior Renewal and Senior Freeze mailing files on the AS400, filtering out persons that should not be on the list, in order to narrow it down to the accurate final mailing list
    * <details><summary>Process on AS400</summary>
        * Update `SENMAIL1CA`, -`CB`, -`CC`, -`CD`,-`FA`, -`SA`, -`2FA`, -`2FB`, -`2SA`, -`1SA`<br>
        ![](p2.4/a/image001.png)
        ![](p2.4/a/image003.png)
        ![](p2.4/a/image005.png)
        ![](p2.4/a/image007.png)
        ![](p2.4/a/image009.png)
        ![](p2.4/a/image011.png)<br>
        * Copy file to: Cpyf<br>
        ![](p2.4/a/image013.png)
        ![](p2.4/a/image015.png)
        * SENMAILF05,01 ---- Brian’s PIN file built from Nexus Lexus (check with Jason Pyle).<br>
        ![](p2.4/a/image017.png)
        ![](p2.4/a/image019.png)
        ![](p2.4/a/image021.png)
        ![](p2.4/a/image023.png)
        ![](p2.4/a/image025.png)<br>
        * Place file in G:\WebExemptions\Mail YYYY\Senior Mailing.txt and zip file and send to Vendor
        * Following provides counts. Check with Lumni on mailing SENMAILCT3 ( C oFE)<br>
        ![](p2.4/a/image027.png)
        * <details><summary>AS400 Query Detailed Explanations (N. Bernacchi 01/15/2020)</summary>
            
            [Query Dictionary (.csv)](p2.4/a/sr_mailing_queries_bernacchi.csv)
            
            | AS400 Query | Result | Output File |
            |-------------|--------|-------------|
            |SENMAIL1CA/DATAC|SELECTS PINS WITH PRIOR YEAR SENIOR C OF E AND NOT ON PRIOR YEAR COOP FILE& ASSIGNS CODE "1C"|SENMAIL1CA/DATAC|
|SENMAIL1CB/DATAC|SELECTS PINS FROM SENMAIL1CA AND COMPARES FILE TO CURRENT HOMSTDMST/MASTERS FILE& ASSIGNS CODE "1C"|SENMAIL1CB/DATAC|
|SENMAIL1CC/DATAC |SELECTS PINS FROM SENMAIL1CA EQUAL TO PRIOR HOMSTDMST/MASTERS FILE, NOT EQUAL TO CURRENT|ADDS TO OUTPUT FILE SENMAIL1CB/DATAC|
|SENMAIL1CD/DATAC|SELECTS PINS FROM SENMAIL1CA EQUAL TO   PRIOR PRIOR (2YEARS)  HOMSTDMST/MASTERS FILE, NOT EQUAL TO CURRENT& AND NOT EQUAL TO PRIOR|ADDS TO OUTPUT FILE SENMAIL1CB/DATAC|
|SENMAIL1FA/DATAC|SELECTS PINS FROM PRIOR SF FILE AND PRIOR HOMSTDMST& ASSIGNS CODE "1F"|SENMAIL1FA/DATAC|
|SENMAIL1PA/DATAC|SELECTS PINS FROM CURRENT HOMSTDMST/MASTERS& ASSIGNS CODE "1P"|SENMAIL1PA/DATAC|
|SENMAIL1SA/DATAC|SELECTS PINS FROM CURRENT YEAR HSRENEW/MASTERS FILE AND NOT ON SF FILE& ASSIGNS CODE "1S"|SENMAIL1SA/DATAC|
|SENMAIL2FA/DATAC|SELECTS COOP PINS FROM PRIOR SF09 FILE|SENMAIL2FA/DATAC|
|SENMAIL2FB/DATAC|SELECTS PINS FROM SENMAIL2FA COMPARES FILE TO PRIOR HOMSTDMST/MASTERS AND MATCHES ON BIRTHDATE& ASSIGNS CODE "2F"|SENMAIL2FB/DATAC|
|SENMAIL2SA/DATAC|SELECTS COOP PINS FROM PRIOR HOMSTDMST NOT ON SENMAIL2FB FILE OR PRIOR HOMSTDMST PINS EQUAL TO SENMAIL2FB BUT BIRTHDATES DO NOT MATCH & ASSIGNS CODE "2S"|SENMAIL2SA/DATAC|
|SENMAILDV1/DATAC|SELECTS PINS FROM SENMAILSA1/DATAC NOT ON DVVOIDPIN/DVPRD FILE|SENMAILDV1/DATAC|
|SENMAILDV2/DATAC|SELECTS SENMAILSA1/DATAC AND DVVOIDPIN/DVPRD TO ADD NEW PIN |ADDS TO SENMAILDV1/DATAC|
|SENMAILJN1/DATAC|SELECTS PINS FROM SENMAIL1FA AND SENMAIL1SA WHERE SENMAIL1FA NOT EQUAL TO SENMAIL1SA OR SENMAIL1FA EQUAL TO SENMAIL1SA BUT BIRTHDATES DO NOT MATCH  |SENMAILJN1/DATAC|
|SENMAILJN2/DATAC|SELECTS PINS FROM SENMAIL1SA AND SENMAIL1FA WHERE SENMAIL1SA NOT EQUAL TO SENMAIL1FA OR SENMAIL1SA EQUAL TO SENMAIL1FA BUT BIRTHDATES DO NOT MATCH  |ADDS TO SENMAILJN1/DATAC|
|SENMAILJN3/DATAC|SELECTS PINS WHERE SENMAILJN1/DATAC NOT EQUAL TO SENMAIL1PA/DATAC|SENMAILJN3/DATAC|
|SENMAILJN4/DATAC|SELECTS PINS WHERE SENMAIL1PA/DATAC NOT EQUAL TO SENMAILJN1/DATAC|ADDS TO SENMAILJN3/DATAC|
|SENMAILJN5/DATAC|SELECTS SENMAILJN3/DATAC|SENMAILJN5/DATAC|
|SENMAILJN6/DATAC|SELECTS PINS ON SENMAIL1CB/DATAC BUT NOT ON SENMAILJN3/DATAC|ADDS TO SENMAILJN5/DATAC|
|SENMAILPRD/DATAC|CREATES DECEASED MAILING FILE (SENIOR_ROB/DATAC) BY ADDING MAILING NAME AND ADDRESS AND PROPERTY LOCATION|SENMAILPRD/DATAC|
|SENMAILPRF/DATAC|CREATES MAILING FILE FOR SENIOR FREEZES|SENMAILPRF/DATAC|
|SENMAILPRS/DATAC|CREATES MAILING FILE FOR SENIORS|SENMAILPRS/DATAC|
|SENMAILPRT/DATAC|SELECTS SENMAILPRS/DATAC FILE AND EXCLUDES SENIOR_ROB/DATAC PINS (DECEASED AS400 FILE)|SENMAILPRT/DATAC|
|SENMAILSA1/DATAC|SELECTS PINS FROM SENMAILJN5 NOT ON SALE2018GO/DATAC FILE|SENMAILSA1/DATAC|
|SENMAILVD1/DATAC|SELECTS SENMAILDV1/DATAC AND CURRENT ASMASTER/MASTERS AND EXCLUDES ANY PIN ON NO-FILE|SENMAILVD1/DATAC|
        </details>
        

* Long-term Exemptions
    * Create data entry file (`TS70LT`/`TSPRD`)
    * <details><summary>Process on AS400</summary>
        * NOTE: for 2017 ran NPHEC with 17 and NPHEN and S with query name 16. (run same yr queries but change the HOMEOWNER,  ASMASTER and SE )
        * Use all `xxxxx17_xx` Queries <br>
        ![](p2.4/b/image001.png)<br>
        * **DO NOT COPY QUERY AND RENAME THEM FOR CURRENT YEAR**
        * CITY <br>
        ![](p2.4/b/image003.png)<br>
        * NORTH <br>
        ![](p2.4/b/image005.png)
        * SOUTH <br>
        ![](p2.4/b/image007.png)
        ![](p2.4/b/image009.png)<br>
        * CITY <br>
        ![](p2.4/b/image011.png)
        ![](p2.4/b/image013.png)
        ![](p2.4/b/image015.png)<br>
        * For new year, copy over last query and renamed it with the following letter (eg. `NPHE1719O`)<br>
        ![](p2.4/b/image017.png)<br>
        * NORTH
        ![](p2.4/b/image019.png)
        ![](p2.4/b/image021.png)
        ![](p2.4/b/image023.png)<br>
        * For new year, copy over last query and renamed it with the following letter<br>
        ![](p2.4/b/image025.png)<br>
        * SOUTH <br>
        ![](p2.4/b/image027.png)
        ![](p2.4/b/image029.png)
        ![](p2.4/b/image031.png)<br>
        * For new year, copy over last query and renamed it with the following letter<br>
        ![](p2.4/b/image033.png)
        ![](p2.4/b/image035.png)
        ![](p2.4/b/image037.png)
        ![](p2.4/b/image039.png)
        ![](p2.4/b/image041.png)
        ![](p2.4/b/image043.png)
        ![](p2.4/b/image045.png)
        ![](p2.4/b/image047.png)
        ![](p2.4/b/image049.png)
        ![](p2.4/b/image051.png)
        * Send `NPHELTAU`3 to WEB EXEMPTIONS FOLDER </details>
    * Homestead Exemption
        * Systems requests Homeowner File from BOT (Master File in Mainframe used to generate)
        * BOT transfers file from Mainframe to AS400
        * Systems runs queries on AS400 according to this logic:
            * _No Exemption:_ If property owner lives in the home, and there is no recorded sale, but they have secondary property on file, then no exemption option is given to the second property.
            * _Yes Exemption:_ If property owner received the home owner exemption last year, and did not sell it, then exemption renews automatically.
            * _No Mailing:_ PIN is in the “No” file (PINs are for rental, common areas, parking spaces, or some other ineligible category).
            * Systems runs further queries to define if the Assessor has heard from property owner in 3 years 
                * These have incredibly low response rate and do not receive mailed notifications)
        * <details><summary>Apply Lucky 777’s to Homeowner Master file</summary>
            * What is this?<br>
            ![](p2.4/b/c/p7.png)<br>
            * Change SYSDTE on HO77_20
            * Copy output file from HO77_20 over to TS40DTA/TSPRD YNN_7777S<br>
            ![](p2.4/b/c/p8.png)
            ![](p2.4/b/c/p9.png)<br>
            * Have Steve Pham upload file TS40DTA/TSPRD YNN_7777S<br>
            ![](p2.4/b/c/p10.png)</details>
            * <details><summary>Create the booklet mailing file</summary>
                * After running the following, place output file into G:WebExemptions\Mail`yyyy`\Booklet Mailing `YYYY` final
                ![](p2.4/b/c/p3.png)
                ![](p2.4/b/c/p4.png)
                ![](p2.4/b/c/p5.png)
                ![](p2.4/b/c/p6.png)</details>
            * <details><summary>Other, less voluminous mailing files </summary>
                * Disabled Persons Exemption
                ![](p2.4/b/c/p1.png)
                * Veterans Exemptions
                ![](p2.4/b/c/p2.png)
                * ~~Sunset~~ (Expired in 2014)</details>
</details>

<details open><summary>**2.5.** Systems FTPs mailing text file to vendor (see 2.4 details)</summary></details>

<details>
<summary>**2.6.** Create Senior Reminder mailing file </summary>

* Run only `SRREMIND5` and send file to Vendor (`SRREMIND5/DATAC`)
* Run `SRREMIND5`, `5A` and `5B` if requested by TPI to not include prior year batch=4. Send file to vendor (`SRREMIND5B/DATAC`).<br>
![](p2.4/b/c/p11.png)</details>


#3.	Mail Exemption Notifications
Departments Involved | Programs & <br> Technology Employed
:-------------------:|:---------------------------:
Taxpayer Information (TPI) | 
ADLAXX (Vendor) |
Communications |

##Description
####Taxpayers are mailed information about the exemptions for which they may qualify. 
####The information sent is dependent on the data TPI has about each taxpayer.
##Details
<details>
<summary>**3.1.** Communications department sends mailer designs to vendor</summary>

* [Senior Freeze ("Blue Booklet")](orig/SF_ap.pdf) 
* [Full Application ("Purple Packet")](orig/full_ap.pdf)
* [Senior Prime ("Gold Packet")](orig/gold.pdf)
* [Automatic Renewal Postcard](orig/postcard.pdf)
* [Long-Time Homeowner](orig/lte_ap.pdf)
* [Persons with Disabilities Renewal](orig/pwd_r.pdf)
* [Veterans with Disabilities Renewal](vwd_r.pdf)
</details>

<details>
<summary>**3.2.** Vendor assigns barcode to property index numbers</summary>

* Barcode scanning allows for easy data entry, matching PIN to application
* Not all applications are returned to vendor, so TPI must be able to handle the ones that arrive
* Vendor and TPI coodinate to test barcode system
</details>

<details>
<summary>**3.3.** Vendor mails notifications</summary>

* This process is outsourced because it is unskilled-labor intensive.
    * Vendor uses mailing files generated in previous subprocess to determine which mailers go to which addresses.
    * Garbage in, garbage out: the vendor does not parse the list beyond what is given to them.
* Mailing file sent to vendor includes:
    * PIN
    * Taxpayer birth date
    * Type of property
    * Address
</details>

<details>
<summary>**3.4.** Determination of mailer is different in 2020 due to automatic renewal of Senior Exemption.</summary>
    
* <details><summary>Decision Tree Effective 2020 (tax year 2019)</summary> ![](orig/desTree2020.png)</details>
* <details><summary>Deprecated Decision Tree (2019/tax year 2018 and earlier)</summary> ![](orig/desTree2019.png)</details>
</details>

#4.	Application Intake

Departments Involved | Programs & <br> Technology Employed
:-------------------:|:---------------------------:
Taxpayer Information (TPI) | Mainframe
ADLAXX (Vendor) | AS400
Legal: Freedom of Information (FOIA) | Microsoft Excel

##Description
####Applications for exemptions are received from several channels.

##Details
<details>
<summary>**4.1.** Most applicactions are submitted as hard copies. </summary>

* The ability to file online is new in 2020; this is now available for the so-called "Big Three" Exemptions.
* Each electronic application is available from the relevant subpage of the CCAO website. All e-File submissions are completed through DocuSign.
* These exemptions may be submitted either online or on paper:
    * [Senior](https://www.cookcountyassessor.com/senior-citizen-exemption) | [.pdf](https://prodassets.cookcountyassessor.com/s3fs-public/form_documents/SeniorExemption_0.pdf?VP7enzbQMrsgMomTduWHBdTCWogKOsLd)
    * [Senior Freeze](https://www.cookcountyassessor.com/senior-freeze-exemption) | [.pdf](https://prodassets.cookcountyassessor.com/s3fs-public/form_documents/SRFrz.pdf?saks82xchFD1dNR9g57H5SESrDKN.lYg)
    * [Homeowner](https://www.cookcountyassessor.com/homeowner-exemption) | [.pdf](https://prodassets.cookcountyassessor.com/s3fs-public/form_documents/HoHs.pdf?F1zIMMbRdjcsK.hwrNoXv9k7fw8gvB6C)
* These exemptions may be submitted only on paper:
    * [Persons with Disabilities](https://www.cookcountyassessor.com/persons-disabilities-exemption) | [.pdf](https://prodassets.cookcountyassessor.com/s3fs-public/form_documents/PersonswDisabilitiesEx.pdf)
    * [Returning Veterans](https://www.cookcountyassessor.com/returning-veterans-exemption) | [.pdf](https://prodassets.cookcountyassessor.com/s3fs-public/form_documents/ReturningVeteransEx.pdf)
    * [Veterans with Disabilities](https://www.cookcountyassessor.com/index.php/veterans-disabilities-exemption) | [.pdf](https://prodassets.cookcountyassessor.com/s3fs-public/form_documents/VeteranswDisabilitiesEx.pdf)
    * [Longtime Homeowner](https://www.cookcountyassessor.com/index.php/longtime-homeowner-exemption) | [.pdf](https://prodassets.cookcountyassessor.com/s3fs-public/form_documents/LongtimeExemptionApplication-2019.pdf)
</details>

<details>
<summary>**4.2.** Most applicactions are mailed to the Vendor's Post Office Box </summary>

* Property Owners seeking exemptions use the provided return envelope, which has a PO Box return address for vendor.
* Vendor keys data onto excel file
* Vendor sorts types of applications (vendor disallows longtime homeowner applications with income exceeding \$100k)
* Vendor emails final Excel files to TPI
* TPI sends Excel files to Systems
* Systems loads the excel files to the AS400
</details>

<details>
<summary>**4.3.** Some applicactions come directly to CCAO</summary>

* This happens mainly because property owner does not want to send the application to a PO Box in a different county (where vendor is located).
    * Enough arrive during peak to keep several staff opening mail full time
* TPI receives direct in-person applications from the taxpayer themselves on Third Floor.
* Freedom of Information Department receives agent applications.
    * These are from professionals who file them on behalf of clients
    * FOI serves as buffer between professionals within TPI.
    * TPI deals only with principals, not agents.
    * FOI timestamps applications as recieved and delivers daily batches to TPI who process as normal.
</details>

<details>
<summary>**4.4.** Internal Early Processing </summary>

##### [Original Script (.docx)](orig/EXEMPTIONPROCESSING.docx)

* Back Tax/Ommitted - for first installment tax bill.
    * Contact Felix/Dominick early December, deadline of Jan 5th
    * SNDNETF `BT01DTA/BTPRD/YYYY`
    * [Process](orig/process/1_BTO.html)
* Update files in `HOMEFZ` AS400 menu screen.
    * GO `TSPRD/HOMEFZ`
    * OPTION 3: CALL `TSPRD/TS40001CL` - HOMEWOWNER YES
    * OPTION 28: CALL `TSPRD/TS4005CL` - BASE YEAR ADJUSTMENT
* Contact Tanya (Clerk) for the Abatement pins spreadsheet. 
    * SNDNETF:  `ABATE_MIS/SYSOPS/ABATEYYYY`
    * `ASSRREA/COOKCNTYB/F...` MIS submits job
    * [Process](orig/process/6_AB.html)
* Expired Incentives new property - Incentives  Manager [Process](orig/process/4_INCENT.html)
* Veterans file - Legal Dept - Khang [Process](orig/process/7_BAVET.html)
* Duplicate pins in Division FROM/To file
    * Query = `chkfromto1` & `2` - `DVVOIDPIN/DVPRD`
* Upload an early "NO" file for AINQ so TPI sees on current exemptions 
    * earlyno1 thru 4 and sndnetf
* Senior Freeze w/no Seniors 
    * Q = `EX_VER_040` and `EX_VER_40C` - coops
    * Q = `CHKSF09YR` - SF birth year > 100 and/or sold last 10 years
    * Q = `CHKHS09YR` - Senior H/S birth year > 100 and/or sold last 10 years
* Number of Pins Current SF Equalized Assessed Value (EAV) less than Base Year EAV on prior year Qualified (Q’ed)
* SF Policing: Have SYSTEMS change years on following SF CL’s
    * Call `SFPRD/SF0106CL`: Change SF age 
    * Call `SFPRD/SF0106CLC`: Change SF age
    * Call `SFPRD/SF400082CL`: Change Process and Tax year 
    * Call `TSPRD/TS1002CL`: Change year for COOP Maintenance File
* Update `STPRD/LANDMARK` File
    * APIN (`ASAIS93B`)
    * Strip report file
* <details><summary>“EARLY” Queries: Run in `DATAC` library</summary>
    * `EX_VER_007`
    * `EX_VER_008` - Unmatched Birthdates
    * `EX_VER_010` - Voided PINs in HUPD File
    * `EX_VER_011` - Voided PIN’S in SF File
    * `EX_VER_001` - Non-Regression SF Pins
    * `SFDUP01`
    * `SFDUP02` - Check for SF duplicate PIN’s
    * `HSDUP01`
    * `HSDUP02	` - Check for HS duplicate PIN’s 
    * `CHKSFHSHO1` 
        * Compares `SF09` and `HOMOWNMST` for `STA1` and `STA2` counts
        * Run early and also after new `HOMOWNST` is built
    * `CHKSFHSHO2`
        * Compares `HOMSTDMST` and `HOMOWNMST` for `STA1` and `STA2` counts
        * Run early and also after new `HOMOWNST` is built
    * `CHKLTHO01`
        * Compares `TS70LT` (long-time file) and `HOMOWNMST` for `STA1` counts
        * Run early and also after new `HOMOWNST` is built
    * `CHKLTHO02`
        * Assigns `STA1`=1 to PINs not on `HOMOWNMST`
        * Have SYSTEMS upload `TS40DTA/TSPRD/YNNNN_LT` file to `HOMOWNMST`
    * `NOFILELT03` - Identifies LONG-TIME (LT) PINs in “NO” file
    * `CHKBDATESF` - Checks for bad birthdates on SF file
    * `CHKBDATEHS` - Checks for bad birthdates on HS file
    * `CHKNO01`-`CHKNO04` - Checks for prorated PIN’s in “NO” file
    * `NOFILESF03`
        * Checks for SF on “NO” file
        * Give to Lumni for review
    * `CHKNO05` - Checks for Division PINs on “NO” file
    * `CHKNO11` - Checks for SF and HS on “NO” file
    * `COESALADJ1`-`COSALADJ7`
        * Uploads COE’s (sales) for new Base
        * <details><summary>Process</summary><br>
        ![](orig/process/p1.png)<br>
            * Located in `APIN/assess00/asreajob`<br>

            ![](orig/process/p2.png)
        <br>
    * `COEHOMEOWN`
        * Uploads prior tax year COE’s to `HOMOWNMST` file
        * Have SYSTEMS upload `TS40DTA/TSPRD/YNNNN_COE` file to `HOMOWNMST`
    * `HOPRO11`, `HOPRO60`
        * Identifies single PIN prorations
        * Give to Residential dept </details>

</details>

#5.	Verification of Eligibility

Departments Involved | Programs & <br> Technology Employed
:-------------------:|:---------------------------:
Taxpayer Information (TPI) | Mainframe
Legacy Systems | AS400
Legal: Counsel | DocuSign

##Description
####All exemptions have eligibility requirements; TPI and satellite offices verify taxpayers qualify and record documentation.

##Details
<details>
<summary>**5.1.** Verification Process Abstract </summary>

##### In general, the process flow is as follows:
* Internal interface process with mainframe using Homestead Update Display (HUPD) or AS400 executed by TPI, depending on applications
    * Prime applications are the only ones keyed into the mainframe
    * All others are processed via the AS400
* Legacy Systems process intake from AS400 and batches into mainframe.
* Information gathered is verified against the Master File
* AS400 information translated into mainframe by BOT.

##### The following is a brief comparison of the seven major exemption types
![](new/grid_1.png)<br>
![](new/grid_2.png)
####Full Document | [.pdf](new/grid_full.pdf) | [.png](new/grid_full.png) | [.xlsx](new/2020_GRID.xlsx)
</details>

<details>
<summary>**5.2.** Homestead / Senior Exemption</summary>

* Determine type of senior application – first time or renewal
    * Senior renewals are processed automatically 
    * Senior First Time filer are the only ones keyed into the mainframe
* TPI validates requirements: applicants must meet the following 
    * Age = 65+ (e.g. via driver's license)
    * Proof of residence
* TPI staff member keys info into Homestead Update Display (HUPD) which interfaces with mainframe
    * Is PIN already in system?
        * Exemption already in the system. The Mainframe does not allow new entry
    * Is the exemption a renewal (homestead only)?
        * HD keys PIN and Birthday into AS400
            * Birth date is the validation on co-ops because co-ops have multiple owners for one PIN.
            * If it is a co-op, the system recognizes the PIN and prompts user to enter a birth date.
            * It will not renew if the PIN was not keyed in last year. Process as new application.
</details>

<details>
<summary>**5.3.** Senior Freeze </summary>

* Compared to first time Senior File which is captured directly onto the MF, all other applications are captured on the AS400
* TPI validates requirements. Applicant must meet the following:
    * Age = 65+ (e.g. via driver's license)
    * Proof of income = less than $55,000 per year
    * Proof of residence (must reside in the property) for two consecutive January 1
* System automatically assigns income of $54,999.00 for all vendor PIN numbers, because the vendor validates but does not enter the income.
* If the system raises an error
    * AS400 appends application with error code
    * These are investigated by TPI later
</details>

<details>
<summary>**5.4.** Longtime Homeowner </summary>

* Verify: is the applicant a Disabled Person, Disabled Veteran, or Returning Veteran?
* TPI validates requirements. Applicant must meet the following:
    * Property owner must have lived in the property more than 10 years
    * Income = $100,000 or less
    * Property has gone up in value significantly
* TPI staff verify income: only two categories are eligible.
    * Income level of \$75,000 or less = 7% increase modification
    * Income level \$75,000.01 to \$100,000 = 10% increase modification
* AS400 applies income values; system automatically assigns income of: 
    * \$1 to \$75,000.00 - system automatically populates \$74,999
    * \$75,000.01 to \$100,000.00 - system automatically populates \$99,999.00
* AS400 appends exemption amount based on income
</details>

<details>
<summary>**5.4.** Disabled Person, Returning Veteran, Disabled Veteran </summary>

* Verify: is the applicant a Disabled Person, Disabled Veteran, or Returning Veteran?
* TPI validates requirements. 
    * Disabled Person applicants must display one of the following documents:
        * Verification letter from Social Security Office
        * Verification letter from Doctor
        * Verification letter from Railroad
    * Disabled Veteran applicants must display both of the following documents:
        * Discharge papers (Form `DD2 14`)
        * Verification letter from the VA
    * Returning Veteran applicants must display discharge papers (Form `DD2 14`)
</details>

<details>
<summary>**5.6.** Online applications </summary>

* Systems downloads file from internet application
* Systems uploads the file directly to the AS400
</details>

<details>
<summary>**5.7.** Senior Reminders </summary>

* Systems runs AS400 query to identify “no returns,” the taxpayers who were sent notifications but have not yet submitted
* Systems generates the reminders file on AS400
* Systems FTPs “reminders” mailing file to vendor
* Same process as initial mailing is followed
</details>

#6. Technical Finalization

Departments Involved | Programs & <br> Technology Employed
:-------------------:|:---------------------------:
Bureau of Technology (BOT) | Mainframe 
Taxpayer Information (TPI) | AS400
Legacy Systems | Printers

##Description
All temporary files are transferred to the Property tax System of Record.

##Details
<details>
<summary>**6.1.** Assessor starts consolidation of all exemptions </summary>

* BOT runs jobs 1 to 29 of the BOT MF Procedures 
* Systems uploads updated/returned vendor files to AS400
* Systems runs AS400 batch jobs to MF
    * This step updates the exemption file that is ready to be processed by BOT
    * AS400 uploads file to mainframe
* BOT triggers MF jobs
</details>

<details>
<summary>**6.3.** Quality Assurance Analysis </summary>

* MF validates accuracy
    * Does a lookup for values in the MF table file. 
    * The MF has ~ 10 tables (or “TBs”), one for each exemption type
* BOT provides QA Report (File download from MF)
* Systems conducts manual QA
    * Error checking with standard queries to make sure the files run correctly
    * keep adding jobs to mitigate newly identified issues
* If new applications are received during this process:
    * TPI directly enters all applications on to the MF
    * Systems repeats consolidation steps
</details>

<details>
<summary>**6.3.** Close of Exemptions for Tax Year </summary>

* Systems reviews file one last time
* TPI and systems verify all exemptions and calculations
* IDOR issues State Equalizer
* Systems calculates exemption amounts
* TPI notifies Clerk to proceed with tax processing
</details>

#7. Interagency Resolution

Departments Involved | Programs & <br> Technology Employed
:-------------------:|:---------------------------:
Bureau of Technology (BOT) | Mainframe 
Taxpayer Information (TPI) | AS400
Legacy Systems | Printers
Cook County Clerk | Clerk's Mainframe Interface

##Description
Teams from the County Clerk and the CCAO meet to discuss the results of this calculation and make adjustments as necessary to ameliorate discrepancies between their records systems.
##Details

<details>
<summary>**7.1** The Clerk reviews all exemption calculations in relation to prior year</summary></details>

<details>
<summary>**7.2** Clerk and Assessor meet to discuss results</summary></details>

<details>
<summary>**7.3** Changes to Equalized Assessed Values are Calculated</summary>

* Senior = $5,000
* Senor Freeze (income <$55K) = varies by value of home
* Returning Veteran = $5,000
* Disabled Veteran
    * 30% to 49% = $2,500
    * 50% to 69% = $2,500
    * 70% or more = exempt up to 250,000 EAV
* Disabled Veteran Home Improvement = $70,000 AV
* Homeowner = $7,000
* Long-time Occupant exemption calculation:
    * <$75k, base year X 1.07 = exemption
    * >$75K to 100k, base year X 1.10 = exemption
    * From above, is 7% better? Give 7%
##### While this work is performed, the County Clerk runs New Property jobs and TIF Jobs (in this order).
</details>

<details>
<summary>**7.4** Assessor makes changes based on results of conference.</summary>

* Changes must be coordinated with the County Clerk. 
* The assessor cannot make changes without County Clerk’s collaboration.
    * [Data Request Memo](orig/2018_tax_files_request.doc)
* Changes are handled by Legacy Systems in tandem with BOT
</details>

<details>
<summary>**7.5** All Exemptions are accepted, CCAO Process Ends </summary>

* MF applies final calculation to the 2nd Installment tax bill
* Clerk Notifies the TR to proceed with Tax processing (print the tax bills)
* Did tax payer receive all entitled exemption?
    * If Yes: end of process. 
    * If No: 
        * Property owners must file Certificate of Error to receive an exemption.
    * If exemptions applications are received after the system is closed, TPI automatically converts them to a Certificate of Error
* Filing a Cerficate of Error results in a higher initial tax bill that is offset by a refund issued at a later date.
</details>

#8. Erroneous Investigation
Departments Involved | Programs & <br> Technology Employed
:-------------------:|:---------------------------:
Legal | Docketing Software
##Description
Subunit within the Legal Department investigates potentially unqualified exemptions and uses a variety of means to recoup the revenues lost.

#### [Investigations Process Map](orig/EEIflow.pdf)

#### Summary of Investigation Results

Year | Cases | Pins | Re-bills | No Action
:-----|-------|-------|---------|-------
2014	|2,300	|11,603	|2,718	| 
2015	|2,800	|17,046	|2,559	|1,190
2016	|3,426	|20,470	|2,426	|1,905
2017	|5,884	|26,221	|3,524	|2,989
2018	|5,272	|26,155	|2,830	|3,739
2019	|4,136	|27,910	|2,708	|2,023
**Totals**| **23,818** | **129,405** | **16,765** | **11,846**

##Details
<details>
<summary>**8.1.** Investigators generate leads regarding possible statutory violations. </summary>

* Leads come from a variety of sources and report in a variety of manners.
* <details><summary>Customer Service (Phone Calls)</summary>
    * Answer phones in a polite and professional manner
    * Some calls may need to be redirected to other departments. Transfer call or advise caller on the correct department
    * When taking complaints regarding possible violators gather as much information as possible:
        * Name of caller
        * Ask caller if they are willing to be contacted by a member of the Investigations Unit
        * Address of erroneous exemption and other properties if any
        * Pin. #’s if possible
        * Caller may wish to remain anonymous. Be polite and take all information caller gives
    * Open file by creating docket number and time stamp. Place all information in file for delivery to Investigations Unit for analysis </details>
    * <details><summary>Customer Service (Walk INS)</summary>
        * Taxpayers may come into the office to notify us about a potential violator.
        * Ask Taxpayer to complete an Exemption Inquiry Form (They can remain anonymous if they wish)
        * Ask Taxpayer if they are willing to be contacted by a member of the Investigations Unit in the future if follow up questions are required
        * Open file by creating docket number and time stamp. Place all information in file for delivery to Investigations Unit for analysis </details>
        * <details><summary>Customer Service (E-mail) </summary>
            * E-mail correspondence filters through the Communications Department
            * All E-mails concerning potential violators will be forwarded to the Investigations Unit
            * E-mail is read and taxpayer making complaint is contacted if possible
            * Ask Taxpayer any required follow up questions (They can remain anonymous if they wish)
            * Open file by creating docket number and time stamp. Place all information in file for delivery to Investigations Unit for analysis </details>
            * <details><summary>Customer Service (Mail INS):  Investigations Unit</summary>
                * All Mail concerning potential violators will be forwarded to the Investigations Unit
                * Mail is opened and read
                * Taxpayer making complaint is contacted if possible
                * Ask Taxpayer if they are willing to be contacted by a member of the Investigations Unit in the future if follow up questions are required (They can remain anonymous if they wish)
                * Open file by creating docket number and time stamp. Place all information in file for delivery to Investigations Unit for analysis</details>
                * <details><summary> Nexus Lexus: External Vendor </summary>
                    * Specifically tasked with identifying possible violators
                    * Leads are sent directly to 3rd Floor Investigation Unit</details>
</details>

<details>
<summary>**8.2.** Investigation is opened and docket is processed </summary>

* Enter data in computer to assign a Docket Number
* Create label containing Pin. #’s, owner’s name, Erroneous Exemptions, Billing Address Etc.
* Print out label and affix to Docket Jacket (Note: docket jacket is a long red envelope)
* Data printed out and placed in Docket Jacket
* Dockets sorted into bundles (number to be determined)
* Bundles placed on cart and delivered to Deputy of Investigations, 9th FL.

</details>

<details>
<summary>**8.3.** Docket is assigned to investigation team </summary>

##### The first phase of the investigation is completed without leaving the building
* Bundles distributed to investigators
* Identify who has exemptions what type and for how long
* Identify any and all Pin. #’s and exemptions associated with docket number
* Use all data supplied by vendor as well as, all data bases available to verify violations
* Data bases available, Lexus Nexus and the AS400 and Mainframe 
* Prepare docket to be sent down to the 3rd FL. to be billed or send to field for further investigating
* Prepare in-house dockets in a step by step manner to send to 3rd FL. for processing
* All Docket files are to be approved by chief of investigations.
</details>

<details>
<summary>**8.4.** Investigators conduct field research if necessary </summary>

##### This is expensive and time-consuming, only undertaken if cost-effective
* Identify current occupants
* Establish length of residency
* Determine renter or owner
* Interview neighbors, delivery people and utility workers in area. If a condo, interview doorman and association manager to help verify rental or owner-occupied, check name on mail boxes, etc.
* Compile all findings and evidence in an easy to follow manner
* Review all evidence for accurate time lines and residency factors
* Return completed docket on time and complete
* Be prepared to defend findings at hearing
* Prepare and return dockets to 3rd FL. for further processing/billing
</details>

<details>
<summary>**8.5.** Investigation yields finding of violation </summary>

* CCAO is empowered by statute to place lien on property for amount of back tax owed
* They are further entitled to collect the interest generated on the taxes in arrears after the lien is placed
* <details><summary>Finding is recorded in agencywide exemption processing system</summary>
    * All files from Investigations returned to 3rd FL. for processing
    * All properties found to be rentals will be entered into the No File in order to prevent future exemptions from being taken
    * Erroneous Exemptions will be entered into the Treasurer’s APIN File
    * Each Erroneous Exemption will be entered into the C.C.A.O. Erroneous Exemption System
    * A bill for each Erroneous Exemption will be created 
    * Bills placed in Billing Envelopes with Return Envelopes
    * Envelopes placed in trays for pick up and mailing</details>
    * Tax bill to recoup amount along with notice of legal action is mailed to violator
    * Often, the lien and potential for interest is enough to encourage prompt payment
    * <details><summary>Payments are sent directly to the Investigation Unit</summary>
        * Incoming Payments (Mail In):
            * Received by Erroneous Exemption Unit and letter opened
            * Payment amounts are verified for correct amount and entered into system
            * Checks are scanned and enter into ledger
            * Incorrect payments are returned to Taxpayer with letter of explanation
            * Checks walked down to Treasurer’s Office for processing daily
        * Incoming Payment (Walk Ins):
            * All walk in payments handled at front counter on 3rd FL.
            * Follow steps B through D in Incoming Payments (Mail In)
            * No incorrect or partial payments are to be accepted 
        * After checks are scanned and an electronic record is made, all checks not taken to Treasurer that day should be secured for safe keeping</details>

</details>

<details>
<summary>**8.6.** Alleged violator may dispute finding </summary>

* Statute affords due process for contested finding of violation
* Administrative hearings are scheduled that take place biweekly in county building
* Capacity to administer these is limited; potential for less than thirty per month
* In seven years and over a thousand hearings, CCAO has not lost a single contested case
* Often, negotiations with defendents and their representation result in settlements prior to hearing
</details>

## Investigation Unit Job Descriptions
#### [Chief Investigator](orig/Chief.pdf)
#### [Investigator](orig/Investigator.pdf)
#### [Erroneous Exemption Specialist](orig/Specialist.pdf)
