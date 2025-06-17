# Infrastructure As Code Readme
This doc tells you what you need to know to 

# Azure Cloud
This challenge targets Azure Public Cloud as that is the cloud platform that I am most knowledgable on. Azure has the most regions of all the cloud platforms, giving the best global reach.

# Azure Web App Service
The Azure Web App Service already has the desired network configuration of:
* Public access to ports 80 & 443

## Azurerm 4.x
In this generation of the Azure provider, `azurerm_app_service` has been removed.  You now need to use either:
* azurerm_linux_web_app
* azurerm_windows_web_app
As there are no Windows dependencies, we can use the Linux web app resoruce

# Terraform
For this challenge Terraform has been used to prevision the Azure resources.

## Local Setup
To run this Terraform code locally you need to
1. Download terraform
1. Add it to your path
1. Set the environment variables for ARM that will point it at the target subscription
1. Change into the `iac` folder
1. Run `terraform init`
1. Run `terraform plan`