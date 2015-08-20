# Connect to an Azure Virtual Machine


This runbook sets up a connection to an Azure virtual machine (classic). It requires the Azure virtual machine to have the Windows Remote Management service enabled, which is the default. It sets up a connection to the Azure subscription and then imports the certificate used for the Azure VM so remote PowerShell calls can be made to it.  

#Requirements

Before running this runbook, make sure the following Automation Assets and runbooks are available:

1. The credential should contain the username and password of the Azure AD organizational ID to connect to Azure.  To learn about how to create this user ID, see [Get Set Up to Automate Azure]("http://aka.ms/getsetuptoautomate") and check out this blog post [Authenticating to Azure using Active Directory]("http://azure.microsoft.com/blog/2014/08/27/azure-automation-authenticating-to-azure-using-azure-active-directory/").  
2. Azure Service Management PowerShell module 


#Resources deployed
##Deploy a runbook and credential
[![Deploy Runbook to Azure](http://azuredeploy.net/deploybutton.png)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Frjmax%2FArmExamples%2Fmaster%2FNewOrExistingTemplate.json) 

Use this deployment template if you are creating a new Automation account or if you do not have a credential that contains your Azure AD username and password.   

- Automation account
- Runbook: Connect-AzureVM
- Credential 


##Deploy runbook only
[![Deploy Runbook to Azure](http://azuredeploy.net/deploybutton.png)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fazureautomation%2Fautomation-packs%2Fmaster%2F101-get-vm-tutorial%2FdeployAutomationResources.json) 

Use this deployment template if you already have an Automation account with a credential to authenticate to Azure.

- Automation account 
- Runbook: Connect-AzureVM

