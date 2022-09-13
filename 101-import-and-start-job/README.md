# Import a runbook, and start a job using parameters

[![Deploy to Azure](http://azuredeploy.net/deploybutton.png)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fazureautomation%2Fautomation-packs%2Fmaster%2F101-import-and-start-job%2Fazuredeploy.json)

This sample shows how you can deploy a runbook, a credential the runbook and start a job with parameters through an Azure Resource Manager template.

## Resources Deployed

### Automation Account

This is the account that will contain your runbook and credentials. If you want to deploy to an existing account, make sure that the Resource Group, region, tags, and SKU in the template are all the same as your existing account, otherwise the properties will be overwritten.

### Runbook

The runbook is a simple hello world PowerShell script that takes in a json string of name:value parameters that is converted to a PowerShell object and then writes out hello.

### Job

A job will be triggered once the other resources are deployed. The job needs a unique GUID as the jobId. This is determined by getting a unique guid based on the resource group and deployment name, subscription, and runbook name using [guid(subscription().subscriptionId, resourceGroup().id, deployment().name, parameters('runbookName'))]. If you redeploy this template then you should give a different name for the deployment to ensure a new job gets created.
