# Remove ResourceGroups runbook and Automation credential
[![Deploy to Azure](http://azuredeploy.net/deploybutton.png)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fazureautomation%2Fautomation-packs%2Fmaster%2F101-remove-resourcegroups%2Fazuredeploy.json) 

This deploys the Remove-ResourceGroups runbook to an Azure Automation account (or a new one will be created for you) and a credential the runbook relies on.

## Resources Deployed

### Automation Account
This is the account that will contain your runbook and credentials. If you want to deploy to an existing account, make sure that the Resource Group, region, tags, and SKU in the template are all the same as your existing account, otherwise the properties will be overwritten.

###Runbook
This runbook connects to Azure and removes all resource groups which match the name filter. You can run across multiple subscriptions, delete all resource groups, or run in preview mode.

###Credential
The credential should contain the username and password of the Azure AD organizational ID to connect to Azure.  To learn about how to create this user, see [Get set up to automate Azure]("http://aka.ms/getsetuptoautomate") and check out this blog post [Authenticating to Azure using Active Directory]("http://azure.microsoft.com/blog/2014/08/27/azure-automation-authenticating-to-azure-using-azure-active-directory/").