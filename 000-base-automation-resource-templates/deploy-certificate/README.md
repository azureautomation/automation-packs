
# Automation certificate

This template creates a certificate in an existing Automation account.  This certificate is not password protected.  


## Parameter details 

| Name           	| Type          | Details 															|
| -------------  	|:-------------:| -----------------------------------------------------------------:|
| accountName      	| string 		| The name of the Automation account to deploy the certificate to. 	|
| certificateName   | string      	| The name of the certificate. 										|
| base64Value 		| securestring  | The base 64 value for the certificate. 							|
| thumbprint  		| securestring  | The thumbprint for the certificate.  								|

## How to call this template from your template

Copy and paste the following section into the resources block in your parent template.  Make sure the values of **name** in the **variables('name')** or **parameters('name')** match the names you have specified your template.  

```json
                {
                    "apiVersion": "2015-01-01",
                    "name": "nestedTemplateCertificate",
                    "type": "Microsoft.Resources/deployments",
                    "dependsOn": [
                        "[concat('Microsoft.Automation/automationAccounts/', parameters('accountName'))]"
                    ],
                    "properties": {
                        "mode": "incremental",
                        "templateLink": {
                            "uri": "[variables('certificateTemplate')]",
                            "contentVersion": "1.0"
                        },
                        "parameters": {
                            "accountName": {
                                "value": "[parameters('accountName')]"
                            },
                            "certificateName": {
                                "value": "[parameters('certificateName')]"
                            },                            
							"base64Value": {
                                "value": "[parameters('base64Value')]"
                            },
                            "thumbprint": {
                                "value": "[parameters('thumbprint')]"
                            }
                        }
                    }
                }

```
