# Copy a DSC Configuration to Azure Automation and compile
[![Deploy to Azure](http://azuredeploy.net/deploybutton.png)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3a%2f%2fraw.githubusercontent.com%2fazureautomation%2fautomation-packs%2fmaster%2f201-deplopy-dsc-resources-and-configuration%2fazuredeploy.json)

This DSC configuration sets the timezone to the desired zone.
The timezone can be set using a parameter.
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
- DSC resource module   
  the DSC resource used is called xTimeZone. The module is maintained on github and hosted on the [powershell Gallery](https://www.powershellgallery.com/packages/xTimeZone/)
- DSC Configuration: mytimezone, with a node named 'Test'
- a compilation job to compile the configuration    
	reference the DSC configuration as webrolefull.Full

##configuration details

``` PowerShell
Configuration myTimezone {
    param(
        [string]$zone
    )

    Import-DscResource -ModuleName xTimezone

    node zone {
        xTimeZone zone {
            IsSingleInstance = 'Yes'
            TimeZone = $zone
        }  
    }
}
```

## timezone information
You can use powershell to find a timezone:

``` PowerShell
[System.TimeZoneInfo]::GetSystemTimeZones().Id

<# Sample output
Dateline Standard Time
UTC-11
Hawaiian Standard Time
Alaskan Standard Time
Pacific Standard Time (Mexico)
Pacific Standard Time
US Mountain Standard Time
Mountain Standard Time (Mexico)
Mountain Standard Time
Central America Standard Time
Central Standard Time
Central Standard Time (Mexico)
Canada Central Standard Time
SA Pacific Standard Time
Eastern Standard Time (Mexico)
Eastern Standard Time
US Eastern Standard Time
Venezuela Standard Time
Paraguay Standard Time
Atlantic Standard Time
Central Brazilian Standard Time
SA Western Standard Time
Newfoundland Standard Time
E. South America Standard Time
SA Eastern Standard Time
Argentina Standard Time
Greenland Standard Time
Montevideo Standard Time
Bahia Standard Time
Pacific SA Standard Time
UTC-02
Mid-Atlantic Standard Time
Azores Standard Time
Cape Verde Standard Time
Morocco Standard Time
UTC
...
#>

````