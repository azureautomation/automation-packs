# Automation variable

This template creates a variable in an existing Automation account. You can deploy an unencrypted variable or an encyrpted variable. Update the variableTemplate in the template Link URI to deploy the type of variable that you
want.

## Parameter details

| Name          |          Type          |                                                       Details |
| ------------- | :--------------------: | ------------------------------------------------------------: |
| accountName   |         string         | The name of the Automation account to deploy the variable to. |
| variableName  |         string         |                                     The name of the variable. |
| variableType  |         string         |                                         The type of variable. |
| variableValue | string or securestring |                                    The value of the variable. |

## How to call this template from your template

Copy and paste the following section into the resources block in your parent template. Make sure the values of **name** in the **variables('name')** or **parameters('name')** match the names you have specified your template.

Unencrypted value for variableTemplate = "https://raw.githubusercontent.com/azureautomation/automation-packs/master/000-base-automation-resource-templates/deploy-variable/deployVariable.json"

Encrypted value for variableTemplate = "https://raw.githubusercontent.com/azureautomation/automation-packs/master/000-base-automation-resource-templates/deploy-variable/deployEncryptedVariable.json"

```json
{
  "apiVersion": "2015-01-01",
  "name": "nestedTemplatevariable",
  "type": "Microsoft.Resources/deployments",
  "dependsOn": [
    "[concat('Microsoft.Automation/automationAccounts/', parameters('accountName'))]"
  ],
  "properties": {
    "mode": "incremental",
    "templateLink": {
      "uri": "[variables('variableTemplate')]",
      "contentVersion": "1.0"
    },
    "parameters": {
      "accountName": {
        "value": "[parameters('accountName')]"
      },
      "variableName": {
        "value": "[parameters('variableName')]"
      },
      "variableType": {
        "value": "[parameters('variableType')]"
      },
      "variableValue": {
        "value": "[parameters('variableValue')]"
      }
    }
  }
}
```
