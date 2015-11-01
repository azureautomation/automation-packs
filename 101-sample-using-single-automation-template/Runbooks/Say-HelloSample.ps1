<#PSScriptInfo
    
    .Version 1.0
	.Author elcooper
	.CompanyName Microsoft Corporation
	.Copyright (c) 2015 Microsoft Corporation. All rights reserved.
	.Tags Tag1 Tag2
	.LicenseUri https://contoso.com/License
	.ProjectUri https://github.com/azureautomation/automation-packs/tree/master/000-sample-using-single-automation-template
	.IconUri https://contoso.com/MyScriptIcon
	.ExternalModuleDependencies Hello-WorldModule
	.RequiredScripts 
	.ReleaseNotes 
	     contoso script now supports following features
	     Feature 1
	      
#>

workflow Say-HelloSample {
    param ( [string] $Name )


     Say-Hello -Name $Name

}