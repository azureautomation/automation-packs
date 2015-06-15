# Automation Packs
Automation Packs include an Azure Resource Manager template that deploys Automation resources to Azure.  The template can include any Automation resource needed for an Automation solution.  Automation resources include:

- Runbooks 
- Runbook jobs
- Integration Modules
- Schedules
- Credentials
- Certificates
- Variables
- Connections

## Runbooks in Automation Packs
To include a runbook in your Automation pack, create a runbook subfolder and place all your runbooks in the folder.  

## Modules in Automation Packs
To include a module in your Automation pack, create a module subfolder and place all your modules in the folder. Alternatively, you can reference the [PowerShell GitHub repository](https://github.com/powershell) for modules. 

To deploy a module,you must also have the zip of the module folder included to reference in the Azure Resource Manager deployment template.  For more on creating modules for Azure Automation see [Authoring Integration Modules](http://azure.microsoft.com/blog/2014/12/15/authoring-integration-modules-for-azure-automation/).  


