# Azure Automation Deploy VM with DSC Configuration demo

[![Deploy to Azure](http://azuredeploy.net/deploybutton.png)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fazureautomation%2Fautomation-packs%2Fmaster%2Fdeploy-vm-with-dsc-configuration%2Fazuredeploy.json)
<a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2Fazureautomation%2Fautomation-packs%2Fmaster%2Fdeploy-vm-with-dsc-configuration%2Fazuredeploy.json" target="_blank">
<img src="http://armviz.io/visualizebutton.png"/>
</a>

This Azure Resource Manager template deploys a new Windows Server 2016 VM, installs the DSC extension and applies a DSC configuration.

## Resources Deployed

1. Windows Server 2016 Datacenter VM using Standard DS1 scale.
2. Microsoft.PowerShell.DSC VM extension.

## Inputs

Deployment of the template will prompt for the following inputs:

- Resource Group Name: The name of the resource group where the VM is to be deployed.
- Region: The region where the VM VM will be deployed.
- VM Name: The name given to the VM to be deployed.
- Username: The username that will be configured as the administrator for the VM.
- Password: The password that will be configured for the administrator account.
- Account Name: The automation account that will be used to link for DSC configuration (this must already exist).
- Account Resource Group Name: The resource group where the automation account resides (this must already exist).
- Node Configuration Name: The name of the DSC node configuration to be applied to the VM (this must already exist).
