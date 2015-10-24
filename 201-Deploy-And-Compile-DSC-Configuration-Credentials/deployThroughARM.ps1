
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
    'configurationName' = 'webrolefull'
    'configurationURI' = 'https://raw.githubusercontent.com/azureautomation/automation-packs/master/201-deploy-and-compile-DSC-configuration/Configurations/webrolefull.ps1'
    'configurationDescription' = 'This webserver configuration contains all elements to install a full blown webserver'
    'jobId' = $JobGUID
	
}

$TemplateURI = "https://raw.githubusercontent.com/azureautomation/automation-packs/master/201-Deploy-And-Compile-DSC-Configuration/azuredeploy.json"

New-AzureResourceGroupDeployment -TemplateParameterObject $Params -ResourceGroupName "MyResourceGroup" -TemplateUri $TemplateURI