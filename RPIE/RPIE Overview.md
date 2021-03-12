# What is the Real Property Income and Expense Online Form?

Commercial real estate is diverse, and the attributes of each property are unique. When estimating the value of commercial real estate, experts need to be aware of those attributes. Historically, these details have been difficult to find or access, making property appraisal an opaque and labor-intensive task. In both the public and private sectors, there is a trend towards a standardized, data-driven approach to property appraisal (see, for example, the [Uniform Residential Appraisal Form](https://sf.freddiemac.com/general/uad-faq#new-uad-and-forms-redesign)). At minimum, standardization will increase transparency and improve efficiency.

Increased transparency and improved efficiency in property appraisals are vital to the success of the Cook County Assessor’s Office. Every three years, the CCAO estimates the value of every commercial property in the County. This is a unique challenge compared to private sector appraisers.The CCAO is almost unique both in terms of the number of estimates it must produce, as well as the information scarcity it faces. In order to meet these challenges, the CCAO needed an innovative data platform to gather and organise information. The Real Property Income and Expense Online Form (RPIE, pronounced 'R pie') is designed to collect and maintain the data required to accuratly and fairly assess commercial property.

RPIE serves two primary purposes. First, RPIE is designed to build and maintain a complete inventory of commercial real estate assets in Cook County. In order to accuratly estimated the value of *every single* commercial property in the County, the CCAO needs a highly detailed inventory of all of that real estate. That inventory needs to be stored in a structured data base so that it can be easily accessed and leveraged to estimate real estate values. 

Second, RPIE is designed to collect a sufficient amount of financial and economic data to be able to estimate the value of commercial real estate assets with a reasonable level of precision and accuracy. RPIE is designed to collect data in such a structured way as to be useful in automated valuation models. Primarily, this data includes income and expense data, and lease data. 

Fundamentally, the RPIE Online Form is not a form at all; it is a crowd-sourced database of commercial real estate data. It is our hope that the RPIE Online Form evolves to become a common source of truth in commercial property assessment, bringing the public and the CCAO together around a common set of facts. 

# Agile, not half-baked: The evolution of RPIE

The RPIE was designed by CCAO staff and built by [Clarity Partners LLC](https://www.claritypartners.com/). An iterative approach to design and development has produced a completely unique platform. RPIE is the only one of its kind—in both the private and public sectors.

## RPIE Version 1

Two major constraints guided the first phase of development:

* Data needed to be collected in a structured and systematic way from a highly diverse user group.
* The development timeline was 10 months.

A comprehensive data collection tool for all commercial properties could not be built in a single year. The CCAO adopted an agile approach to development, prioritizing the features necessary to collect data on the most common properties. The most common properties to generate rental income—apartment buildings and office spaces—report a Schedule E or 8825 to the IRS. Properties with these tax forms became the focus of the RPIE V1 online form. In an effort to collect details about properties that did not meet the requirements of the V1 form, the office used a fillable PDF as a backstop. 

V1 development began in the spring of 2019 and was deployed at the end of 2019.

### Mise en place: The RPIE data model

The primary task of RPIE V1 was to define a [data model](https://en.wikipedia.org/wiki/Data_model) that would be flexible enough to evolve over time, but also specific enough to impose structure onto the data. The RPIE data model identifies and relates the objects described below.

* **Economic unit:** At the least granular level, income and expense information is reported by an economic unit. For the purposes of RPIE, an economic unit may be a single person or a company with one or more real estate assets.  In RPIE, there is a 1:1 corrospondence between a single RPIE filing and an economic unit.
* **Income and expense data:** Income and expense data attaches to the economic unit, and sometimes buildings, depending on how the econonomic unit tracks its financial data. For example, the first page of the [IRS Schedule E](https://www.irs.gov/pub/irs-pdf/f1040se.pdf) allows a filer to include three different properties separatly as A, B, and C, though this is not required. 
* **Building:** *RPIE V1* defined a 'building' as a structure that contained rentable spaces. This included apartment, office, and retail buildings, but excluded a large number of other building types. 
     * There is a m:m relationship between buildings and economic units. In some cases, one economic unit will own multiple buildings. In others, a building will contain many economic units. For example, a large office tower with multiple lessees responsible for taxes. 
* **Spaces (leased and vacant):** RPIE V1 defined a space as a sub-division of a building that may be rented. There are two types of spaces: 'residential' and 'commercial.' Each type of space has its own vector of attributes, including lease status. A user that properly populates the spaces template will include both leased and un-leased spaces. 
     * There is m:1 relationship between spaces and buildings. The spaces data allow us to programatically calculate a building's gross potential income and vacancy rate, and attach those calculations to buildings.
**Property Index Number (PIN):** Though often depicted as a cadasteral division, the PIN is actually an accounting identity. PINs identify, spatially in most cases, the tax liability for real estate assets. 
     * There is a m:m relationship between PINs and buildings, and PINs and economic units. I would not be surprised to see multiple PINs associated with a single space, though it would be uncommon. 
* **Parties:** Parties are simply the people creating and submitting filings. 
     * There is a m:m relationship between parties and filings. Attornies may be associated with many filings, while owners of single properties are only associated with one filing anually.

### Practical examples of the data model

The image below shows four different examples of how the objects defined above may associate in real life. RPIE V1 is designed to identify and accomodate these different relationships in a structured data model. Each example below corrosponds to a single RPIE filing. 

<img src="Example 1.png"
     alt="Example 1"
     width="1000" height="600"
     style="float: left; margin-right: 10px;" />

Example 1 shows a single building with two PINs, where one PIN is associated with all the residential spaces, and the other PIN is associated with all of the commercial spaces. Example 2 shows a PIN associated with a single building that contains both commercial and residential spaces. Example 3 shows a single PIN associated with multiple dissimilar buildings. And Example 4 shows an economic unit associated with different PINs and buildings some distance from one another. RPIE's data model accomodates all of these cases.


### Defining the user-experience

We wanted the RPIE Online Form to resemble digital tax prep software like TurboTax. In order to accomplish that, we needed a clear data model, and a clear understanding of the order in which users needed to input information. For example, it was clear that users would have to input buildings before spaces, since spaces are contained inside of buildings. The chart below shows our initial outline. 

<img src="Workflow V1.png"
     alt="Workflow 1"
     width="1000" height="600"
     style="float: right; margin-right: 10px;" />

#### Securing RPIE via RPIE codes

What would stop a malicious actor from filing thousands of erroneous RPIE filings? PINs and addresses are public information, posted online. It would be a simple task to create a program that files millions of erroneous RPIE filings with bogus data. If that were to happen, the entire RPIE database would be rendered nearly worthless, since it would be impossible to distinguish legitimate filings from erroneous ones. 

To secure RPIE, we generated random codes that we mailed to taxpayers directly. Users can only create accounts and filings by entering the correct RPIE <> Code combination. While this does not entirely eliminate the possibility of an erroneous filing, it eliminates the type of programatic attack that RPIE is most exposed to.

### Documentation and privacy

Transparency is a core value in the data science department. It was extreamly important that we clearly define the data we would be collecting, and how that data would be used. 

## RPIE Version 2

The primary development goal for RPIE V2 was to accomodate a wider diversity of property types. Many commercial properties do not file IRS Schedule E or 8825 forms, even many that do collect traditional rental income. For example, properties that have recently underwent a change of ownership will not have these forms available. Properties held by much larger companies will typicall submit income and expense reports to their corporate owners. Most hotels and motels do not treat their income as typical rental income. Owner-occupied properties do not collect rental income. 

The main challenge to this goal was that we have no way of identifying the type of property associated with a user of the system. The CCAO's data on commercial property is so sparse that we cannot identify which properties are owner-occupied, which contain multiple buildings, etc. The RPIE system has to identify the user's specific property type and financial structure, and then display screens requesting the specific and appropriate information. 

### Questionnaire 

For RPIE V2, we designed a simple set of questions that would dictate which data screens a user would see. I have put the initial diagram, an intermedia diagram, and the final diagram to show the evolution of these questions. The primary challenge was to choose the right language for each question and the right order of the questions such that users were successfull categorized into their respective RPIE groups.


<img src="Questionnaire 1.png"
     alt="Questionnaire 1"
     width="1000" height="1000"
     style="float: right; margin-right: 10px;" />
<img src="Questionnaire 2.png"
     alt="Questionnaire 2"
     width="1000" height="1000"
     style="float: right; margin-right: 10px;" />
<img src="RPIE v2 Questionnaire Flowchart_Page_1.png"
     alt="RPIE v2 Questionnaire Flowchart_Page_1"
     width="1000" height="2000"
     style="float: right; margin-right: 10px;" />

## RPIE V3

The CCAO will continue to develop the RPIE platform.

