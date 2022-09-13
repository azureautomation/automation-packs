# Create an Automation variable

[![Deploy to Azure](http://azuredeploy.net/deploybutton.png)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fazureautomation%2Fautomation-packs%2Fmaster%2F101-sample-automation-resource-templates%2Fsample-deploy-variable%2FdeployVariable.json)

This sample shows how to deploy an Azure Automation variable asset of type string.

##Resources Deployed
###Automation Account
This is the account that will contain your variable.

If you want to deploy to an existing account, make sure that the Resource Group, region, tags, and pricing tier in the template are all the same as the account you want to deploy the variable in.

###Variable
The string variable to deploy to Azure Automation.
