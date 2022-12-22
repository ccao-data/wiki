When [Onboarding](People/Onboarding), the CCAO's IT Department will provide you with the forms and handouts necessary to setup Cook County's VPN. Some troubleshooting tips:

* If you need to redownload the Cisco AnyConnect Secure Mobility Client&trade;, visit [here](http://vpnclient.cookcountyil.gov).
* Connecting to the VPN requires the use of a multi-factor authentication device. If you lose your device or get a new one, email [Assessor Admins](Assessor.Admins@cookcountyil.gov) for a new Duo setup link.
* Occasionally, connecting to a [datascience.cookcountyassessor.com](datascience.cookcountyassessor.com) site will 404, even while connected via the VPN. If this happens, try disconnecting then reconnecting the VPN, the refreshing the page.

Various CCAO services are only available while connected via VPN. Below is a list of commonly-used services and their corresponding VPN requirements:

| Owner   | Service | VPN Required | 
| ------- | ------- |:---:|
| Cook County | [Web Clock](https://www.cookcountyil.gov/cct) | No |
| Cook County | iasWorld Backend | Yes |
| Cook County | [iasWorld Frontend (Test)](http://iptsweb-tst.ccounty.com/) | Yes |
| Cook County | [iasWorld Frontend (Prod)](https://iptsweb.ccounty.com/) | Yes |
| Cook County | [Cook Viewer](https://maps.cookcountyil.gov/cookviewer/) | No |
| CCAO        | [Intranet](http://intranet/) | Yes |
| CCAO        | [SQL Server](http://10.129.122.31) | Yes |
| CCAO        | Shared Drives | Yes |
| Data Dept.  | [Shiny Server](https://datascience.cookcountyassessor.com/shiny/) | Yes |
| Data Dept.  | [RStudio Server](https://datascience.cookcountyassessor.com/rstudio/)| Yes |
| Data Dept.  | [JupyterLab](https://datascience.cookcountyassessor.com/jupyter/)| Yes |
| Microsoft   | [Office 365](https://outlook.office365.com/cookcountyil.gov) | No |
| Microsoft   | OneDrive | No |
| Microsoft   | Teams | No |
| Microsoft   | Outlook | No |
| Amazon      | [AWS Console](https://ccao-ds.signin.aws.amazon.com/console) | No |
| Amazon      | AWS CLI | No, see [CLI setup](Setup/Setup-the-AWS-Command-Line-Interface-and-Multi-factor-Authentication) |
