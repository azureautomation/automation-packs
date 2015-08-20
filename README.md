# Automation Packs
Automation Packs include an Azure Resource Manager template that deploys Automation resources to Azure.  The template can include any Automation resource needed for an Automation solution.  Automation resources include:

- Runbooks
- DSC Configurationsi 
- Runbook jobs
- Integration Modules
- Schedules
- Credentials
- Certificates
- Variables
- Connections

##Rules for contributing to the Automation repository

1.	Each Automation pack is contained in it's own folder.  
2.	The parent deployment template must be named **azuredeploy.json**.  You can also have child templates which do not need to follow a naming convention. 
3.	Include a **Readme.md** file that explains:
	4.	How the template works and what the Automation pack automates
	5.	What resources are deployed
	6.	Includes the "Deploy to Azure" link
6. Template parameters should: 
	7. Follow **camelCasing**
	8. Contain **allowedValues** where ever makes sense
	7. Have the **description** specified using the metadata property. An example is included below:

  ```json
  "automationAccountName": {
        "type": "string",
        "metadata": {
            "description": "The name of the Automation Account"
        }
  }
  ```
##Recommendations for writing your Automation Pack 
### Deploying Automation resources
For simplicity, we recommend you write one parent template that refers to the base templates: [000-base-templates](https://github.com).   This allows you to reuse the core Automation resource templates without having to write your own.  See XXX for an example of this.  

### Runbooks in Automation Packs
You can store runbooks referenced in Automation Packs in two different ways:

1.  In a Runbook subfolder within the Automation Pack
2. In an external location of your choice (ideally on Script Center or in the PowerShell Gallery repository)


Best practices for runbooks:
1.  Follow practices outlined [here](http://social.technet.microsoft.com/wiki/contents/articles/26616.quick-tips-and-tricks-for-runbook-writing.aspx). 
2.  Always include a header with the following: 

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
2. The [PowerShell GitHub repository](https://github.com/powershell) for modules.

To deploy a module, you must also have the zip of the module folder included to reference in the Azure Resource Manager deployment template.  For more on creating modules for Azure Automation see [Authoring Integration Modules](http://azure.microsoft.com/blog/2014/12/15/authoring-integration-modules-for-azure-automation/).  

Follow the PowerShell best practices for publishing a module to the PowerShell gallery outlined in this [blog](http://blogs.msdn.com/b/powershell/archive/2015/07/07/powershell-gallery-registration-is-now-unrestricted.aspx).

