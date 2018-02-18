# Azure Automation Managed VM demo

[![Deploy to Azure](http://azuredeploy.net/deploybutton.png)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fazureautomation%2Fautomation-packs%2Fmaster%2Fmanaged-vm%2Fazuredeploy.json) 
<a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2Fazureautomation%2Fautomation-packs%2Fmaster%2Fmanaged-vm%2Fazuredeploy.json" target="_blank">
    <img src="http://armviz.io/visualizebutton.png"/>
</a>

This Azure Resource Manager template deploys a new Windows Server 2016 VM and configures it to be managed with Azure Automation features. These include Update management, Inventory, Change Tracking, Desired State Configuration, and a makes the VM a hybrid worker.

## Azure Automation features

This template deploys everything into a single resource group. It has currently only been tested when deployed to region *West Europe* so  create a new resource group there during deployment for testing.

## Templates used in the deployment

### Solution template

[Solution template](https://raw.githubusercontent.com/azureautomation/automation-packs/master/managed-vm/linked-templates/solution.json) deploys three automation solutions to the workspace.

* AzureAutomation is used for deploying hybrid workers on a VM. 

* ChangeTracking delivers Inventory and Change Tracking.

* Updates are deployed for assessment and deployment of updates. 

[Automation hybrid worker with DSC template](https://raw.githubusercontent.com/azureautomation/automation-packs/master/managed-vm/linked-templates/hybridworkerwithdsc.json) creates an automation account and does the following:
* Imports [hybridRunbookWorkerDSC](https://www.powershellgallery.com/packages/HybridRunbookWorkerDsc/1.0.0.0) from the PowerShellGallery.com.
* Creates a variable to hold the registration URL for the account.
* Creates a credential to hold the registration key for the account.
* Import the [DSC configuration](https://raw.githubusercontent.com/azureautomation/automation-packs/master/managed-vm/dsc-configurations/HybridWorkerConfig.ps1) to register the hybrid worker on the VM with the automation account.
* Compiles the imported configuration so it is available to be used by a VM that requires this configuration.

[Link workspace with automation account](https://raw.githubusercontent.com/azureautomation/automation-packs/master/managed-vm/linked-templates/linkedworkspaceaccount.json) to link the workspace with the automation account for use with Update Management, Change Tracking, and Inventory. It also enables DSC and automation logs to be sent to the workspace.

[Windows2016Server template](https://raw.githubusercontent.com/azureautomation/automation-packs/master/managed-vm/linked-templates/Windows2016Server.json) to deploy a new VM configured with some default values for network and disks.

[MonitoringAgent template](https://raw.githubusercontent.com/azureautomation/automation-packs/master/managed-vm/linked-templates/monitoringagent.json) installs the Log Analytics extension on the VM.

[DSCAgent](https://raw.githubusercontent.com/azureautomation/automation-packs/master/managed-vm/linked-templates/dscagent.json) installs the PowerShell DSC extension on the VM and configures it to pull the hybrid worker DSC configuration from the automation account.
