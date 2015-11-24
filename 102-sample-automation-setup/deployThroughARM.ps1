#Connect to your Azure account
Login-AzureRmAccount

#Select your subscription if you have more than one
#Select-AzureSubscription -SubscriptionName "My Subscription Name"

$ResourceGroupName = "SampleAutomationResourceGroup"
$AutomationAccountName = "SampleAutomationAccount"
$Location = "southcentralus"

New-AzureRmResourceGroup -Name $ResourceGroupName -Location $Location
New-AzureRmAutomationAccount -ResourceGroupName $ResourceGroupName -Name $AutomationAccountName -Location $Location -Plan Free

$RegistrationInfo = Get-AzureRmAutomationRegistrationInfo -ResourceGroupName $ResourceGroupName -AutomationAccountName $AutomationAccountName

#Set the parameter values for the template
$Params = @{
    accountName = $AutomationAccountName
    regionId = $Location
    registrationKey = $RegistrationInfo.PrimaryKey
    registrationUrl = $RegistrationInfo.Endpoint
    vmName = ('samplevm' + [System.Guid]::NewGuid().toString().Substring(0,7))
    dscCompilationJobId = [System.Guid]::NewGuid().toString()
    runbookJobId = [System.Guid]::NewGuid().toString()
    jobScheduleId = [System.Guid]::NewGuid().toString()
    timestamp = (Get-Date).toString()
    storageAccountName = ('SampleVMStorage' + [System.Guid]::NewGuid().toString().Replace('-','').Substring(0,9))
}

$TemplateURI = 'https://raw.githubusercontent.com/azureautomation/automation-packs/master/102-sample-automation-setup/azuredeploy.json'

New-AzureRmResourceGroupDeployment -ResourceGroupName $ResourceGroupName -TemplateParameterObject $Params -TemplateUri $TemplateURI
