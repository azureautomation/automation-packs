# Connect to an Azure Virtual Machine


This runbook sets up a connection to an Azure virtual machine (classic). It requires the Azure virtual machine to have the Windows Remote Management service enabled, which is the default. It sets up a connection to the Azure subscription and then imports the certificate used for the Azure VM so remote PowerShell calls can be made to it.  

It uses the Azure Service Management module.  

[![Deploy Runbook to Azure](http://azuredeploy.net/deploybutton.png)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fazureautomation%2Fautomation-packs%2Fmaster%2F200-connect-azure-vm%2FdeployRunbookAndCredential.json) 

#Resources deployed


##Automation Account
This is the account that will contain your credentials. If you want to deploy to an existing account, make sure that the Resource Group, region, tags, and SKU in the template are all the same as your existing account, otherwise the properties will be overwritten. 

##Runbook
Connect-AzureVM runbook is deployed to draft state.  

##Credential
The credential should contain the username and password of the Azure AD organizational ID to connect to Azure. To learn about how to create this user, see [Get Set Up to Automate Azure]("http://aka.ms/getsetuptoautomate") and check out this blog post [Authenticating to Azure using Active Directory]("http://azure.microsoft.com/blog/2014/08/27/azure-automation-authenticating-to-azure-using-azure-active-directory/").  




