# Deploy a module to an Automation Account

This sample shows how to deploy a module to Azure Automation. To deploy your own module update the name & the URL.  The URL for the module must contain the zipped module folder.
To learn about authoring modules for Automation see: [Authoring Integration Modules](http://azure.microsoft.com/blog/2014/12/15/authoring-integration-modules-for-azure-automation/)


## Parameter details 

| Name          | Type          | Details 															|
| ------------- |:-------------:| -----------------------------------------------------------------:|
| accountName   | string 		| The name of the Automation account to deploy the module to. 	|
| moduleName	| string      	| The name of the module. 										|
| moduleUri	 	| string	    | The user name for the module. 									|


## How to call this template from your template

Copy and paste the following section into the resources block in your parent template.  Make sure the values of **name** in the **variables('name')** or **parameters('name')** match the names you have specified your template.  


```json
                {
                    "apiVersion": "2015-01-01",
                    "name": "nestedTemplateModule",
                    "type": "Microsoft.Resources/deployments",
                    "dependsOn": [
                        "[concat('Microsoft.Automation/automationAccounts/', parameters('accountName'))]"
                    ],
                    "properties": {
                        "mode": "incremental",
                        "templateLink": {
                            "uri": "[variables('moduleTemplate')]",
                            "contentVersion": "1.0"
                        },
                        "parameters": {
                            "accountName": {
                                "value": "[parameters('accountName')]"
                            },
                            "moduleName": {
                                "value": "[parameters('moduleName')]"
                            },
							"moduleUri": {
                                "value": "[parameters('moduleUri')]"
                            }
                        }
                    }
                }

```