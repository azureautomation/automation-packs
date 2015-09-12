# Start Azure Classic VM Graph Runbook
[![Deploy to Azure](http://azuredeploy.net/deploybutton.png)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fazureautomation%2Fautomation-packs%2Fmaster%2F201-start-azure-vm-graphical%2FdeployAutomationResources.json) 


This is an Azure Automation graph runbook that gets all of your Azure VMs or just the VMs in a service and then starts the ones that are stopped.  You can set this on a schedule to start the VMs when you want.  Use in conjunction with StopAzureClassicVM runbook to start and stop VMs as you need them.

You can import and use this runbook only in the **Azure Preview Portal**.

This runbook relies on 2 assets which are also deployed as part of this template: 

1.  Credential
2.  Variable


## Resources Deployed
### Automation Account
This is the Automation account that will contain your runbook and credentials. 

If you want to deploy to an existing account, make sure that the Resource Group, region, tags, and pricing tier in the template are all the same as your existing account, otherwise the properties will be overwritten. 

### Runbook
This graphical runbook is loaded to Azure Automation as a draft runbook.  

### Credential
An Automation credential asset called AzureCredential that contains the Azure AD user credential with authorization for this subscription. To use an asset with a different name you can pass the asset name as a runbook input parameter or change the default value for the input parameter.

To learn about how to create this user, see [Get set up to automate Azure](http://aka.ms/getsetuptoautomate) and check out this blog post [Authenticating to Azure using Active Directory](http://azure.microsoft.com/blog/2014/08/27/azure-automation-authenticating-to-azure-using-azure-active-directory/).  

### Variable
An Automation variable asset called **AzureSubscriptionId** that contains the GUID for this Azure subscription.  To use an asset with a different name you can pass the asset name as a runbook input parameter or change the default value for the input parameter.