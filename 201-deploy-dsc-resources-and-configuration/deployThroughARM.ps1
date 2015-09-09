
#Connect to your Azure account
Add-AzureAccount

#Select your subscription if you have more than one
#Select-AzureSubscription -SubscriptionName "My Subscription Name"

#Create a GUID for the job
$JobGUID = [System.Guid]::NewGuid().toString()

#Use Azure resource Manager to deploy template 
Switch-AzureMode -Name AzureResourceManager

#Set the parameter values for the template
$Params = @{
    'accountName' = 'MyAutomationAccount'
	'regionId' = 'East US 2'
    'configurationName' = 'myTimezone'
    'configurationURI' = 'https://raw.githubusercontent.com/azureautomation/automation-packs/master/201-deploy-dsc-resources-and-configuration/Configurations/myTimezone.ps1'
    'configurationDescription' = 'Set the timezone using DSC. for a full list of supported values execute [System.TimeZoneInfo]::GetSystemTimeZones().Id in PowerShell'
    'jobId' = $JobGUID
	
}

$TemplateURI = "https://raw.githubusercontent.com/azureautomation/automation-packs/master/201-deplopy-dsc-resources-and-configuration/azuredeploy.json"

New-AzureResourceGroupDeployment -TemplateParameterObject $Params -ResourceGroupName "MyResourceGroup" -TemplateUri $TemplateURI