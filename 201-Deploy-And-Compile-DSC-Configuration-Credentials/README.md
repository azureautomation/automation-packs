# Copy a DSC Configuration to Azure Automation and compile
[![Deploy to Azure](http://azuredeploy.net/deploybutton.png)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3a%2f%2fraw.githubusercontent.com%2fbdanse%2fautomation-packs%2fmaster%2f201-Deploy-And-Compile-DSC-Configuration-Credentials%2fazuredeploy.json)

This DSC configuration compiles a node configuration to join a ADDS domain. 

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
- Quotation marks around userName from credential asset
- Quotation marks around variableValue from variable asset

#Resources deployed

- Automation account
- Variable asset "domainName"
- Credential asset "domainCreds"
- Assets are used during compilation

``` PowerShell
    $domainName = Get-AutomationVariable -Name 'domainName'
    $domainCreds = Get-AutomationPSCredential -Name 'domainCreds'
```
- Upload module xComputerManagement
- Upload module xActiveDirectory
- DSC Configuration: dscDomainJoin, configure with a nodename per node. Since computername is used. 
	reference the DSc configuration as dscDomainJoin.SRV001, dscDomainJoin.SRV002, etc. 


``` PowerShell
Configuration dscDomainJoin
{
    param(
        [Int]$RetryCount = 20,
        [Int]$RetryIntervalSec = 30
    )
    
    Import-DscResource -ModuleName PSDesiredStateConfiguration
    Import-DscResource -ModuleName xComputerManagement    
    Import-DscResource -ModuleName xActiveDirectory

    $domainName = Get-AutomationVariable -Name 'domainName'
    $domainCreds = Get-AutomationPSCredential -Name 'domainCreds'

    Node $AllNodes.NodeName
    {
        WindowsFeature ADPowershell
        {
            Name = "RSAT-AD-PowerShell"
            Ensure = "Present"
        } 

        xWaitForADDomain WaitForDomain 
        { 
            DomainName = $domainName 
            DomainUserCredential= $domainCreds
            RetryCount = $RetryCount 
            RetryIntervalSec = $RetryIntervalSec
            DependsOn = "[WindowsFeature]ADPowershell" 
        }

        xComputer DomainJoin
        {
            Name = $Node.NodeName
            DomainName = $domainName
            Credential = $domainCreds
            DependsOn = "[xWaitForADDomain]WaitForDomain" 
        }
    }
}


```
