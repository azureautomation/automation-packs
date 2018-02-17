# Azure Automation Managed VM demo

[![Deploy to Azure](http://azuredeploy.net/deploybutton.png)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fazureautomation%2Fautomation-packs%2Fmaster%2Fmanaged-vm%2Fazuredeploy.json) 
<a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2Fazureautomation%2Fautomation-packs%2Fmaster%2Fmanaged-vm%2Fazuredeploy.json" target="_blank">
    <img src="http://armviz.io/visualizebutton.png"/>
</a>

This Azure resource manager template will deploy a new Windows server 2016 VM and configure it to be managed with Azure Automation features. These include Update management, Inventory, Change Tracking, Desired State Configuration, and a make the VM a hybrid worker.

## Azure Automation features

This template will everything into a single resource group. It has currently only been tested when deployed to region "West Europe".
