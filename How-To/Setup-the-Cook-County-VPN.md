When [Onboarding](People/Onboarding), the CCAO's IT Department will provide you with the forms and handouts necessary to setup Cook County's VPN. Some troubleshooting tips:

* If you need to redownload the Cisco AnyConnect Secure Mobility Client&trade;, visit [here](http://vpnclient.cookcountyil.gov).
* Connecting to the VPN requires the use of a multi-factor authentication device. If you lose your device or get a new one, email [Assessor Admins](mailto:Assessor.Admins@cookcountyil.gov) for a new Duo setup link.
* Occasionally, connecting to a [datascience.cookcountyassessor.com](https://datascience.cookcountyassessor.com) site will 404, even while connected via the VPN. If this happens, try disconnecting then reconnecting the VPN, the refreshing the page.

Various services used by the Data Department are only available while connected to the VPN. Below is a list of the most commonly-used services. Services that require the VPN are marked with an X.

| Owner   | Service | VPN Required | 
| ------- | ------- |:---:|
| Cook County | [Web Clock](https://www.cookcountyil.gov/cct) |  |
| Cook County | iasWorld Backend | X |
| Cook County | [iasWorld Frontend (Test)](http://iptsweb-tst.ccounty.com/) | X |
| Cook County | [iasWorld Frontend (Prod)](https://iptsweb.ccounty.com/) | X |
| Cook County | [Cook Viewer](https://maps.cookcountyil.gov/cookviewer/) |  |
| CCAO        | [Intranet](http://intranet/) | X |
| CCAO        | [SQL Server](http://10.129.122.31) | X |
| CCAO        | Shared Drives | X |
| Data Dept.  | [Shiny Server](https://datascience.cookcountyassessor.com/shiny/) | X |
| Data Dept.  | [RStudio Server](https://datascience.cookcountyassessor.com/rstudio/)| X |
| Data Dept.  | [JupyterLab](https://datascience.cookcountyassessor.com/jupyter/)| X |
| Microsoft   | [Office 365](https://outlook.office365.com/cookcountyil.gov) |  |
| Microsoft   | OneDrive |  |
| Microsoft   | Teams |  |
| Microsoft   | Outlook |  |
| Amazon      | [AWS Console](https://ccao-ds.signin.aws.amazon.com/console) |  |
| Amazon      | AWS CLI | See [CLI setup](How-To/Setup-the-AWS-Command-Line-Interface-and-Multi-factor-Authentication) |
