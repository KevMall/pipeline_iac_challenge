# DevOps Challenge Design
This design document details the design decisions made for this challenge.
In summary the design uses an Azure DevOps pipeline to provision Azure resources using Terraform.

# Pipeline
An Azure DevOps YAML pipeline will be used to provision the Web App Service and then deploy to it.
Azure DevOps was chosen due to its close integration with Azure Cloud. It also has a selection of tasks like AzureCLI and PowerShell that make it easy to work with Azure subscritions.

# Infrastructure As Code (IAC)
Terraform will be used to provision the Azure resources. This is a mature and well supported tool that uses declarative syntax to define the intended state.

## The terraform.tfvars File
This is not usually included in a repo, but I have added it for convenience for this challenge.

## Hosting Resources
The hosting of the web app will be provided by Azure App Service.  This provides the ability to host dynamic web apps in the future.  It also provides the capabilty to configure the network.

## Hosting Alternatives
If it was know that the web app would remain static and public, then Azure Static Web Apps would have been a very cost effective alternative. This resource type is purposely designed to host static pages like HTML, React, Angular, or Vue at minimal cost.

# Web Page
Currently this is a simple static `index.html` page displaying the title.
of the 

meets the following deliverbales:
1. Simple Webpage Optional): A basic index.html file (or similar) that your defined server 
would serve. 
2. IaC Configuration AWS or Azure): All necessary files for your chosen IaC tool to define 
the infrastructure on your chosen cloud. Include a README.md explaining your 
resource choices, the cloud platform you selected, the IaC tool you used, and the 
commands that would be used for deployment. 
3. CI/CD Pipeline Definition: The YAML or JSON definition of your chosen CI/CD pipeline. 
Include a README.md explaining the pipeline stages and the commands or steps that 
would be executed in a real deployment scenario. 
4. Brief Documentation: A short document (e.g., design.md) outlining: 
○ The chosen cloud platform and the infrastructure components you defined, and 
the rationale behind these choices. 
○ A brief explanation of the CI/CD pipeline and how it would function for 
deployment. 