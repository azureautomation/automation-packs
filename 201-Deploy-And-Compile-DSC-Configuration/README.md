# Copy a DSC Configuration to Azure Automation and compile
[![Deploy to Azure](http://azuredeploy.net/deploybutton.png)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3a%2f%2fraw.githubusercontent.com%2fazureautomation%2fautomation-packs%2fmaster%2f201-Deploy-And-Compile-DSC-Configuration%2fazuredeploy.json)

This DSC configuration installs a full blown webserver.
The configuration file gets imported and compiled. 
Once the DSC configuration is published and compiled it can be consumed by any registered DSC node.

#Requirements
A DSC configuration is made available in the folder Configurations.
a guid for the jobId parameter, you can create a guid using PowerShell:
``` PowerShell
#PowerShell < v5
[System.Guid]::NewGuid()

#PowerShell v5
$JobGUID = (New-Guid).Guid

``` 

#Known limitations
- I had an issue using a DSC Configuration link containing spaces
- Configurations can only be deployed as 'Published' during the preview

#Resources deployed

- Automation account
- DSC Configuration: webrolefull, with a node named 'Full'    
	reference the DSc configuration as webrolefull.Full

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