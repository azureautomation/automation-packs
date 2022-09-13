# Automation Packs

Automation Packs include an Azure Resource Manager template that deploys Automation resources to Azure.  The template can include any Automation resource needed for an Automation solution.  Automation resources include:

- Runbooks
- DSC Configurations
- DSC Configuration Compilation Jobs
- Runbook jobs
- Integration Modules
- Schedules
- Credentials
- Certificates
- Variables
- Connections

## Rules for contributing to the Automation repository

1. Each Automation pack is contained in its own folder.  
2. The parent deployment template must be named **azuredeploy.json**.  You can also have child templates which do not need to follow a naming convention.
3. Include a **Readme.md** file that explains:
4. How the template works and what the Automation pack automates
5. What resources are deployed
6. Includes the "Deploy to Azure" link
7. Any known limitations
8. Any Automation assets used in your runbooks or DSC configurations should be included in the deployment template.
9. Any runbooks, modules, or DSC Configurations in your ARM template should use the following conventions:
   1. A **variable** containing the **URL** for the resource content
   2. A **variable** containing the **Name** of the resource
10. Any Automation assets in your template should follow the the following conventions:
    1. **Parameter(s)** for the asset value(s) are in the deployment template to allow end users input their own values
    2. **variable** for each asset name  
11. Template parameters should:
    1. Follow **camelCasing**
    2. Contain **allowedValues** wherever it makes sense
    3. Have the **description** specified using the metadata property. An example is included below:

  ```json
  "automationAccountName": {
        "type": "string",
        "metadata": {
            "description": "The name of the Automation Account"
        }
  }
  ```
  
## Recommendations for writing your Automation Pack

### Runbooks in Automation Packs

You can store runbooks referenced in Automation Packs in two different ways:

1. In an external location of your choice.  Preferred locations are the [PowerShell Gallery](https://www.powershellgallery.com) or [Script Center](https://gallery.technet.microsoft.com/scriptcenter/site/search?f%5B0%5D.Type=RootCategory&f%5B0%5D.Value=WindowsAzure&f%5B0%5D.Text=Windows%20Azure)
2. In a Runbook subfolder within the Automation Pack.

Best practices for runbooks:

1. Follow practices outlined [here](http://social.technet.microsoft.com/wiki/contents/articles/26616.quick-tips-and-tricks-for-runbook-writing.aspx).
2. Always include a header with the following when publishing to PowerShell Gallery:

```PowerShell
 <#PSScriptInfo
    
     .Version 1.0
     .Author elcooper
     .CompanyName Microsoft Corporation
     .Copyright (c) 2015 Microsoft Corporation. All rights reserved.
     .Tags Tag1 Tag2
     .LicenseUri https://contoso.com/License
     .ProjectUri https://contoso.com/
     .IconUri https://contoso.com/MyScriptIcon
     .ExternalModuleDependencies bar
     .RequiredScripts foo 
     
     .ReleaseNotes 
          contoso script now supports following features
          Feature 1
          Feature 2
          Feature 3
          
 #>
```

### PowerShell Modules in Automation Packs

You can store modules used in your runbook in two different ways:

1. Create a Module subfolder and place all your modules in the folder.
2. Place your modules on the [PowerShell GitHub repository](https://github.com/powershell) and publish your module to [PowerShell Gallery](https://www.powershellgallery.com/).

To deploy a module, you must also have a zipped module folder formatted for Azure Automation.  This is used in the Azure Resource Manager deployment template.  For more on creating modules for Azure Automation see [Authoring Integration Modules](http://azure.microsoft.com/blog/2014/12/15/authoring-integration-modules-for-azure-automation/).  

Follow the PowerShell best practices for publishing a module to the PowerShell gallery outlined in this [blog](http://blogs.msdn.com/b/powershell/archive/2015/07/07/powershell-gallery-registration-is-now-unrestricted.aspx).

## Other notes on authoring Automation Packs

If you have a pack that contains many Automation resources, you can write one parent template that refers to the base templates: [000-base-templates](https://github.com/azureautomation/automation-packs/tree/Master/000-base-automation-resource-templates).   This allows you to reuse the core Automation resource templates without having to write your own.
