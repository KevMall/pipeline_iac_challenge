# Azure DevOps Pipeline Readme

## GitHub Service Connection
For the pipeline to be able to access GitHub it requires a service conenction:
1. In Project Settings go to Service Conenctions
1. Create a new GitHub Service Connection
1. For authentication use either your credential or a PAT
1. Note the name of the Service Connection as you need to use it in the pipeline

## Azure Service Connection 
For the pipeline to be able to provision the resources, a Service Connection is required that uses a Service Principal that has at least Contributor access to the target Subscription.

# Pipeline Steps

## checkout
Uses the GitHub Service Conenction mentioned above to checkout the default branch (main) to the agent

## Install Terraform
This Bash script fetches the target version of Terraform and moves it to a folder where it can be used

## Run Terraform Init
`terraform init`

This initialises the `iac` folder in the agent. All of the files are stored under the `.teraform` folder.

## Run Terraform Plan
`terraform plan`

This command merges togeter all of the `tf` files in the `iac` folder and interprets them as a whole to define the declated state. It then examines the target subscription and determines what changes to make (if any) and outputs them as a plan.

## Wait for review of Terraform Plan
It is good practice to always check the Terraform plan output.  This is to ensure that only expected chagnes are made and not revert intended changes made outside of Terraform.
if the plan looks good, the the user of the pipeline can approve and the pipeline will continue.

## Run Terraform Apply
`terraform apply`

This command does the same tasks as the plan command.  The extra step is that it will then apply the changes to the target Subscription.


## Check that the Azure Web App has been created
`az webapp show $(prefix)-webapp --query "state" --output tsv`

Use the Azure CLI to query the status of the target web app. If the status is anything except "running" then cause the pipeline condition to fail.

## Deploy the web page to the Web App Service
`az webapp deployment source --name $(prefix)-webapE --src index.html`

Again using Azure CLI to upload the index.html file to the target Web App