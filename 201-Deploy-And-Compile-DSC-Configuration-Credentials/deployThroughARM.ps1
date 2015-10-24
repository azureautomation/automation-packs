
#Connect to your Azure account
#Add-AzureAccount

#Select your subscription if you have more than one
#Select-AzureSubscription -SubscriptionName "My Subscription Name"

#Create a GUID for the job
$JobGUID = [System.Guid]::NewGuid().toString()

#DSC ConfigurationData
$ConfigurationData = @{
    AllNodes = @(
        @{
            NodeName = "*";
            PSDscAllowPlainTextPassword = $true
         },
        @{
            NodeName = "SRV001" 
         },
        @{
            NodeName = "SRV002" 
         }
   )
}

#Use Azure resource Manager to deploy template 
Switch-AzureMode -Name AzureResourceManager

#Set the parameter values for the template
$Params = @{
    accountName = 'MyAutomationAccount'
	regionId = 'East US 2'
    credentialName = 'domainCreds'
    userName = '"DOMAIN\Account"'
    password = 'secret'
    variableName = 'domainName'
    variableType = 'string'
    variableValue = '"DOMAIN.LOCAL"'
    configurationName = 'dscDomainJoin'
    configurationURI = 'https://raw.githubusercontent.com/bdanse/automation-packs/master/201-Deploy-And-Compile-DSC-Configuration-Credentials/Configurations/dscDomainJoin.ps1'
    configurationDescription = 'Configuration for Domain Join with credentials support through ConfigurationData'
    jobId = $JobGUID
    jobConfigurationData = ($ConfigurationData | ConvertTo-Json -Compress).ToString()
	
}


$TemplateURI = "https://raw.githubusercontent.com/bdanse/automation-packs/master/201-Deploy-And-Compile-DSC-Configuration-Credentials/azuredeploy.json"

New-AzureResourceGroupDeployment -TemplateParameterObject $Params -ResourceGroupName "resourcgroup01" -TemplateUri $TemplateURI


