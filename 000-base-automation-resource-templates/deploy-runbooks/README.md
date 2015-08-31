# Deploy a runbook to an Automation Account

This sample shows how to deploy a runbook to Azure Automation.   You can create a runbook in draft state or in published state.   Update the URL in the templateLink URI to point to either the published or draft template depending on how
you want to publish this runbook.  Note you cannot schedule or run jobs on runbooks that only contain a draft (New) version.  


## Parameter details 

| Name          			| Type          | Details 																													|
| ------------- 			|:-------------:| ---------------------------------------------------------------------------------:										|
| accountName   			| string 		| The name of the Automation account to deploy the runbook to. 																|
| regionId					| string 		| The region the Automaiton account is located in. 																			|
| runbookName   			| string 		| The name for the runbook. The name must match the name in the URI. 														|
| runbookURI   				| string 		| The URI for the runbook. 																									|
| runbookType				| string      	| The type of runbook.  Runbooks can be Graph, PowerShell scripts, or PowerShell Workflows.									|
| projectSourceLocation	 	| string	    | The link back to the original source project.  A tag is generated with this value to help you locate the original project.|
| runbookDescription		| string	    | The runbook description.																									|

## How to call this template from your template

Copy and paste the following section into the resources block in your parent template.  Make sure the values of **name** in the **variables('name')** or **parameters('name')** match the names you have specified your template.  

For published use runbookTemplate = "deployPublishedRunbookTemplate.json"
For draft use runbookTemplate = "deployDraftRunbookTemplate.json"


```json
                {
                    "apiVersion": "2015-01-01",
                    "name": "nestedTemplateRunbook",
                    "type": "Microsoft.Resources/deployments",
                    "dependsOn": [
                        "[concat('Microsoft.Automation/automationAccounts/', parameters('accountName'))]"
                    ],
                    "properties": {
                        "mode": "incremental",
                        "templateLink": {
                            "uri": "[variables('runbookTemplate')]",
                            "contentVersion": "1.0"
                        },
                        "parameters": {
                            "accountName": {
                                "value": "[parameters('accountName')]"
                            },
							"regionId": {
                                "value": "[parameters('regionId')]"
                            },
                            "runbookName": {
                                "value": "[parameters('runbookName')]"
                            },
							"runbookUri": {
                                "value": "[parameters('runbookUri')]"
                            },                            
							"runbookType": {
                                "value": "[parameters('runbookType')]"
                            },
							"projectSourceLocation": {
                                "value": "[parameters('projectSourceLocation')]"
                            },
							"runbookDescription": {
                                "value": "[parameters('runbookDescription')]"
                            }
                        }
                    }
                }

```