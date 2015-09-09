# Deploy a DSC configuration to an Automation Account

This sample shows how to deploy a DSC configuration to Azure Automation.  
  **Note** that DSC configurations can only be imported in a 'published' state during preview

## Parameter details 

| Name          			| Type          | Details 																													|
| ------------- 			|:-------------:| ---------------------------------------------------------------------------------:										|
| accountName   			| string 		| The name of the Automation account to deploy the DSC configuration to. 																|
| regionId					| string 		| The region the Automaiton account is located in. 																			|
| configurationName   		| string 		| The name for the DSC configuration. The name must match the name in the URI. 														|
| configurationURI   		| string 		| The URI for the DSC configuration. 																									|						
| configurationDescription	| string	    | The DSC configuration description.																									|

## How to call this template from your template

Copy and paste the following section into the resources block in your parent template.  Make sure the values of **name** in the **variables('name')** or **parameters('name')** match the names you have specified your template.  

configurationTemplate = "https://raw.githubusercontent.com/azureautomation/automation-packs/master/000-base-automation-resource-templates/deploy-configuration/deployConfiguration.json"

```json
                {
                    "apiVersion": "2015-01-01",
                    "name": "nestedDSCconfiguration",
                    "type": "Microsoft.Resources/deployments",
                     "dependsOn": [
                        "[concat('Microsoft.Automation/automationAccounts/', parameters('accountName'))]"
                    ],
                    "properties": {
                        "mode": "incremental",
                        "templateLink": {
                            "uri": "[variables('configurationTemplate')]",
                            "contentVersion": "1.0"
                        },
                        "parameters": {
                            "accountName": {
                                "value": "[parameters('accountName')]"
                            },
                            "location": {
                                  "value": "[parameters('regionId')]"
                            },
                            "configurationName": {
                                "value": "[variables('configurationName')]"
                            },
                            "configurationDescription": {
                                "value": "[variables('configurationDescription')]"
                            },
                            "configurationURI": {
                                "value": "[variables('configurationURI')]"
                            }
                        }
                    }
                }

```