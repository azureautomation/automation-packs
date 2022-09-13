# Hello World Example

[![Deploy to Azure](http://azuredeploy.net/deploybutton.png)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fazureautomation%2Fautomation-packs%2Fmaster%2F000-sample-using-single-automation-template%2Fazuredeploy.json)

This sample shows how you can deploy a runbook, a module that the runbook needs, and create an assign a schedule to the runbook.

##Resources Deployed

###Automation Account

This is the account that will contain your runbook, module and schedule. If you want to deploy to an existing account, make sure that the Resource Group, region, tags, and SKU in the template are all the same as your existing account, otherwise the properties will be overwritten.

###Runbook

This runbook writes "Hello $Name" to the output stream.

###Module

The module is deployed from the sample-deploy-module in https://github.com/azureautomation/automation-packs/tree/master/101-sample-deploy-automation-resources/sample-deploy-modules.

###Schedule
A schedule is deployed and linked to the runbook.

To associated the schedule with a runbook, you need a GUID. You can use [System.Guid]::NewGuid() or $JobGUID = (New-Guid).Guid (in PowerShell 5.0) to generate this.
