
#Connect to your Azure account
Add-AzureAccount

#Select your subscription if you have more than one
#Select-AzureSubscription -SubscriptionName "My Subscription Name"

#Create a GUID for the job
$JobGUID = [System.Guid]::NewGuid().toString()

#DSC ConfigurationData
$ConfigurationData = @{
    AllNodes = @(
        @{
            NodeName = "*";
            PSDscAllowPlainTextPassword = "true"
         },
        @{
            NodeName = "SRV001" 
         },
        @{
            NodeName = "SRV002" 
         }
   )
}


#"{\"AllNodes\":[{\"NodeName\":\"*\",\"PSDscAllowPlainTextPassword\":true},{\"NodeName\":\"FS002\"}]}"
#{"AllNodes":[{"NodeName":"*","PSDscAllowPlainTextPassword":true},{"NodeName":"FS002"}]} 
#{\"AllNodes\":[{\"NodeName\":\"*\",\"PSDscAllowPlainTextPassword\":\"true\"},{\"NodeName\":\"SRV001\"},{\"NodeName\":\"SRV002\"}]}


#$EscapedConfigurationData = "`"" + ($ConfigurationData | ConvertTo-Json -Compress).replace("`"", "`\`"") + "`""
$EscapedConfigurationData = ($ConfigurationData | ConvertTo-Json -Compress).replace("`"", "`\`"")


#Use Azure resource Manager to deploy template 
Switch-AzureMode -Name AzureResourceManager

#Set the parameter values for the template
$Params = @{
    'accountName' = 'MyAutomationAccount'
	'regionId' = 'East US 2'
    'credentialName' = 'domainCreds'
    'userName' = '"DOMAIN\Account"'
    'password' = 'secret'
    'variableName' = 'domainName'
    'variableType' = 'string'
    'variableValue' = '"DOMAIN.LOCAL"'
    'configurationName' = 'dscDomainJoin'
    'configurationURI' = 'https://raw.githubusercontent.com/bdanse/azure/master/201-Deploy-And-Compile-DSC-Configuration-Credentials/Configurations/dscDomainJoin.ps1'
    'configurationDescription' = 'Configuration for Domain Join with credentials support through ConfigurationData'
    'jobId' = $JobGUID
    'jobConfigurationData' = $EscapedConfigurationData
	
}

$TemplateFile = 'C:\Users\admbada\Source\Repos\azure\201-Deploy-And-Compile-DSC-Configuration-Credentials\azuredeploy.json'
$TemplateURI = "https://raw.githubusercontent.com/bdanse/azure/master/201-Deploy-And-Compile-DSC-Configuration-Credentials/azuredeploy.json"

#New-AzureResourceGroupDeployment -TemplateParameterObject $Params -ResourceGroupName "resourcgroup01" -TemplateUri $TemplateURI
New-AzureResourceGroupDeployment -TemplateParameterObject $Params -ResourceGroupName "resourcgroup01" -TemplateFile $TemplateFile