# Create an Automation credential
[![Deploy to Azure](http://azuredeploy.net/deploybutton.png)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fazureautomation%2Fautomation-packs%2Fmaster%2F101-sample-deploy-automation-resources%2Fsample-deploy-credential%2FdeployCredential.json) 


This sample shows how to deploy an Azure Automation credential asset.  

##Resources Deployed
###Automation Account
This is the account that will contain your credential. 

If you want to deploy to an existing account, make sure that the Resource Group, region, tags, and SKU in the template are all the same as the account you want to deploy the credential in.   

###Credential
The credential contains the username and password that you provide.  

