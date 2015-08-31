# Create an Automation schedule and associate it with a runbook,

This sample shows how to deploy an Azure Automation schedule.


## Parameter details 

| Name           	| Type          | Details 																				|
| -------------  	|:-------------:| -----------------------------------------------------------------:					|
| accountName      	| string 		| The name of the Automation account to deploy the schedule to. 						|
| scheduleName		| string      	| The name of the schedule. 															|
| runbookName	 	| string	    | he name of the runbook to associate the schedule with.								|
| startTime	 		| securestring  | The time to start the schedule on.  This is a datetime in Automation. 				|
| frequency	 		| string	    | The frequency of the schedule.	 													|
| interval	 		| securestring  | The interval for the schedule to repeat on. 											|
| jobScheduleGuid	| string	    | The GUID for the job schedule.  This identifier links the schedule to the runbook. 	|



## How to call this template from your template

Copy and paste the following section into the resources block in your parent template.  Make sure the values of **name** in the **variables('name')** or **parameters('name')** match the names you have specified your template.  

scheduleTemplate = https://raw.githubusercontent.com/azureautomation/automation-packs/master/000-base-automation-resource-templates/deploy-schedule/deployRunbookOnSchedule.json

```json
                {
                    "apiVersion": "2015-01-01",
                    "name": "nestedTemplateschedule",
                    "type": "Microsoft.Resources/deployments",
                    "dependsOn": [
                        "[concat('Microsoft.Automation/automationAccounts/', parameters('accountName'))]"
                    ],
                    "properties": {
                        "mode": "incremental",
                        "templateLink": {
                            "uri": "[variables('scheduleTemplate')]",
                            "contentVersion": "1.0"
                        },
                        "parameters": {
                            "accountName": {
                                "value": "[parameters('accountName')]"
                            },
                            "scheduleName": {
                                "value": "[parameters('scheduleName')]"
                            },
							"runbookName": {
                                "value": "[parameters('runbookName')]"
                            },
                            "startTime": {
                                "value": "[parameters('startTime')]"
                            },							
							"frequency": {
                                "value": "[parameters('frequency')]"
                            },
                            "interval": {
                                "value": "[parameters('interval')]"
                            },
                            "jobScheduleGuid": {
                                "value": "[parameters('jobScheduleGuid')]"
                            }
                        }
                    }
                }

```
