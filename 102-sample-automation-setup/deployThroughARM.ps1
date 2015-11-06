#Connect to your Azure account
Login-AzureRmAccount

#Select your subscription if you have more than one
#Select-AzureSubscription -SubscriptionName "My Subscription Name"

$ResourceGroupName = "MySampleResourceGroup"
$AutomationAccountName = "MySampleAutomationAccount"
$Location = "South Central US"

New-AzureRmResourceGroup -Name $ResourceGroupName -Location $Location
New-AzureRmAutomationAccount -ResourceGroupName $ResourceGroupName -Name $AutomationAccountName -Location $Location -Plan Free

#Set the parameter values for the template
$Params = @{
    "accountName" = $AutomationAccountName
	"regionId" = $Location
    "vmName" = ("SampleVM" + [System.Guid]::NewGuid().toString())
}

$TemplateURI = "https://raw.githubusercontent.com/azureautomation/automation-packs/master/102-sample-automation-setup/azuredeploy.json"

New-AzureRmResourceGroupDeployment -ResourceGroupName $ResourceGroupName -TemplateParameterObject $Params -TemplateUri $TemplateURI