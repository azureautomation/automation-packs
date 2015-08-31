# Create an Automation credential

This sample shows how to deploy an Azure Automation credential asset.  The credential contains the username and password that you provide.  


## Parameter details 

| Name           	| Type          | Details 															|
| -------------  	|:-------------:| -----------------------------------------------------------------:|
| accountName      	| string 		| The name of the Automation account to deploy the credential to. 	|
| credentialName	| string      	| The name of the credential. 										|
| userName	 		| string	    | The user name for the credential. 									|
| password	 		| securestring  | The password for the credential. 									|


## How to call this template from your template

Copy and paste the following section into the resources block in your parent template.  Make sure the values of **name** in the **variables('name')** or **parameters('name')** match the names you have specified your template.  

credentialTemplate = "https://raw.githubusercontent.com/azureautomation/automation-packs/master/000-base-automation-resource-templates/deploy-credential/deployCredential.json"

```json
                {
                    "apiVersion": "2015-01-01",
                    "name": "nestedTemplateCredential",
                    "type": "Microsoft.Resources/deployments",
                    "dependsOn": [
                        "[concat('Microsoft.Automation/automationAccounts/', parameters('accountName'))]"
                    ],
                    "properties": {
                        "mode": "incremental",
                        "templateLink": {
                            "uri": "[variables('credentialTemplate')]",
                            "contentVersion": "1.0"
                        },
                        "parameters": {
                            "accountName": {
                                "value": "[parameters('accountName')]"
                            },
                            "credentialName": {
                                "value": "[parameters('credentialName')]"
                            },
							"userName": {
                                "value": "[parameters('userName')]"
                            },
                            "password": {
                                "value": "[parameters('password')]"
                            }
                        }
                    }
                }

```
