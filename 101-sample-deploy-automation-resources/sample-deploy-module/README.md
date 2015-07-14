# Deploy a module to an Automation Account
[![Deploy to Azure](http://azuredeploy.net/deploybutton.png)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fazureautomation%2Fautomation-packs%2Fmaster%2F101-sample-deploy-automation-resources%2Fsample-deploy-module%2FDeployModule.json) 


This sample shows how to deploy a module to Azure Automation. 

##Resources Deployed
###Automation Account
This is the account that will contain the module you are deploying. 

If you want to deploy to an existing account, make sure that the region, tags, and SKU in the template are all the same as your existing account, otherwise the properties will be overwritten. 

###Module
The default values for the module deployed in this template is a hello world sample used to show how you can deploy a module.  

To deploy your own module with this template, modify the following parameters:

- **moduleName**: this parameter contains the name of the module to deploy
- **moduleUri**: the URL for the module zip file to upload to Azure Automation. To learn about authoring modules for Automation see: [Authoring Integration Modules](http://azure.microsoft.com/blog/2014/12/15/authoring-integration-modules-for-azure-automation/)