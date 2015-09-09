# Deploy a simple DSC Configuration using nested templates
[![Deploy to Azure](http://azuredeploy.net/deploybutton.png)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3a%2f%2fraw.githubusercontent.com%2fazureautomation%2fautomation-packs%2fmaster%2f201-deploy-and-compile-DSC-configuration-using-base-templates%2fazuredeploy.json) 

This sample demonstrates how to deploy a DSC configuration and compile the configuration.
It uses nested deployment templates for the configuration and its compilation job.

## Resources Deployed

### Automation Account

This is the account that will contain your DSC configuration.     
If you want to deploy to an existing account, make sure that the Resource Group, region, tags, and SKU in the template are all the same as your existing account, otherwise the properties will be overwritten. 

### Configuration

The configuration installs all web server windows features  
	reference the DSC configuration as webrolefull.Full

``` PowerShell
Configuration webrolefull {

    $features = @(
        @{Name = "Web-Server"; Ensure = "Present"},
        @{Name = "Web-WebServer"; Ensure = "Present"},
        @{Name = "Web-Common-http"; Ensure = "Present"},
        @{Name = "Web-Default-Doc"; Ensure = "Present"},
        @{Name = "Web-Dir-Browsing"; Ensure = "Present"},
        @{Name = "Web-Http-Errors"; Ensure = "Present"},
        @{Name = "Web-Static-Content"; Ensure = "Present"},
        @{Name = "Web-Health"; Ensure = "Present"},
        @{Name = "Web-Http-Logging"; Ensure = "Present"},
        @{Name = "Web-Performance"; Ensure = "Present"},
        @{Name = "Web-Stat-Compression"; Ensure = "Present"},
        @{Name = "Web-Dyn-Compression"; Ensure = "Present"},
        @{Name = "Web-Security"; Ensure = "Present"},
        @{Name = "Web-Filtering"; Ensure = "Present"},
        @{Name = "Web-Basic-Auth"; Ensure = "Present"},
        @{Name = "Web-Windows-Auth"; Ensure = "Present"},
        @{Name = "Web-App-Dev"; Ensure = "Present"},
        @{Name = "Web-Net-Ext45"; Ensure = "Present"},
        @{Name = "Web-Asp-Net45"; Ensure = "Present"},
        @{Name = "Web-ISAPI-Ext"; Ensure = "Present"},
        @{Name = "Web-ISAPI-Filter"; Ensure = "Present"},
        @{Name = "Web-Ftp-Server"; Ensure = "Present"},
        @{Name = "Web-Mgmt-Tools"; Ensure = "Present"},
        @{Name = "Web-Mgmt-Console"; Ensure = "Present"}     
       )

    node full {
    
        foreach ($feature in $features){
            WindowsFeature ($feature.Name) {
                Name = $feature.Name
                Ensure = $feature.Ensure
            }
        }
    }
}

```
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

#Known limitations
- I had an issue using a DSC Configuration link containing spaces
- Configurations can only be deployed as 'Published' during the preview