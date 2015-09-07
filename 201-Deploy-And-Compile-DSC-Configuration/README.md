# Copy a DSC Configuration to Azure Automation and compile
[![Deploy Configuration to Azure](http://azuredeploy.net/deploybutton.png)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3a%2f%2fraw.githubusercontent.com%2fStijnc%2fautomation-packs%2fmaster%2f201-Deploy-And-Compile-DSC-Configuration%2fazuredeploy.json) 


This DSC configuration installs a full blown webserver.
The configuration file gets imported and compiled. 
Once the DSC configuration is published and compiled it can be consumed by any registered DSC node.

#Requirements
A DSC configuration is made available in the folder Configurations.
a guid for the jobId parameter (you can create a guid using PowerShell v5:
``` Powershell
(New-Guid).Guid 
```

#Known limitations
- I had an issue using a DSC Configuration link containing spaces
- Configurations can only be deployed as 'Published' during the preview

#Resources deployed

- Automation account
- DSC Configuration: webrolefull