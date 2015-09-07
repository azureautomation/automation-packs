# Deploy a simple DSC Configuration using nested templates
[![Deploy to Azure](http://azuredeploy.net/deploybutton.png)](https://portal.azure.com/#create/Microsoft.Template/uri/) 

This sample demonstrates how to deploy a DSC configuration and compile the configuration.
It uses nested deployment templates for the configuration and its compilation job.

## Resources Deployed

### Automation Account

This is the account that will contain your DSC configuration.     
If you want to deploy to an existing account, make sure that the Resource Group, region, tags, and SKU in the template are all the same as your existing account, otherwise the properties will be overwritten. 

### Configuration

The configuration installs all web server windows features  

### Compilation job 
the compilation job is linked to the configuration deployed to Azure automation. It makes sure the configuration gets compiled.
You will need a GUID to start the job.
You can use PowerShell to create a GUID.
``` PowerShell
#PowerShell < v5
[System.Guid]::NewGuid()

#PowerShell v5
$JobGUID = (New-Guid).Guid

``` 