# Create an Automation connection

This sample shows how to deploy an Azure Automation connection asset.  This template provides an example of how to deploy a connection for the Azure module.  Depending on your connection, the parameters will differ.



## Parameter details 

| Name           					| Type          | Details 															|
| -------------  					|:-------------:| -----------------------------------------------------------------:|
| accountName      					| string 		| The name of the Automation account to deploy the connection to. 	|
| connectionName					| string      	| The name of the connection. 										|
| connectionCertificateName	 		| string	    | The certificate name for the connection. 							|
| connectionSubscriptionId	 		| string		| The subscription ID for the connection. 							|


## How to call this template from your template

Copy and paste the following section into the resources block in your parent template.  Make sure the values of **name** in the **variables('name')** or **parameters('name')** match the names you have specified your template.  

connectionTemplate = "https://raw.githubusercontent.com/azureautomation/automation-packs/master/000-base-automation-resource-templates/deploy-connection-example/deployConnection.json"


```json
                {
                    "apiVersion": "2015-01-01",
                    "name": "nestedTemplateconnection",
                    "type": "Microsoft.Resources/deployments",
                    "dependsOn": [
                        "[concat('Microsoft.Automation/automationAccounts/', parameters('accountName'))]"
                    ],
                    "properties": {
                        "mode": "incremental",
                        "templateLink": {
                            "uri": "[variables('connectionTemplate')]",
                            "contentVersion": "1.0"
                        },
                        "parameters": {
                            "accountName": {
                                "value": "[parameters('accountName')]"
                            },
                            "connectionName": {
                                "value": "[parameters('connectionName')]"
                            },
							"connectionCertificateName": {
                                "value": "[parameters('connectionCertificateName')]"
                            },
                            "connectionSubscriptionId": {
                                "value": "[parameters('connectionSubscriptionId')]"
                            }
                        }
                    }
                }

```
