# Create an Automation connection 
[![Deploy to Azure](http://azuredeploy.net/deploybutton.png)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fazureautomation%2Fautomation-packs%2Fmaster%2F101-sample-deploy-automation-resources%2Fsample-deploy-connection%2FdeployConnection.json) 


This sample shows how to deploy an Azure Automation connection asset of type Azure.   

You must have a connection type created to be able to create a connect asset.  To do this, you should include an Automation connection file in the module it is used with.  This [blog](http://azure.microsoft.com/blog/2014/12/15/authoring-integration-modules-for-azure-automation/) talks more about creating your own modules and how to create a connection for your module.  Since the Azure module has a connection file defined, you can create a connection of this type without having your own module.  

##Resources Deployed
###Automation Account
This is the account that will contain your connection asset. 

If you want to deploy to an existing account, make sure that the Resource Group, region, tags, and pricing tier in the template are all the same as the account you want to deploy the variable in.   

###Connection
The connection to deploy to Azure Automation.  This particular connection will have the Azure connection properties (subscription  ID, and certificate name).  

