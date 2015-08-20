# Creates a Write-HelloWorld runbook and a schedule for it
[![Deploy to Azure](http://azuredeploy.net/deploybutton.png)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fazureautomation%2Fautomation-packs%2Fmaster%2F101-sample-deploy-automation-resources%2Fsample-deploy-schedule%2FdeployRunbookOnSchedule.json) 


This sample shows how to create an Azure Automation schedule and associate it with a runbook.    

##Resources Deployed
###Automation Account
This is the account that will contain your runbook and schedule. 

If you want to deploy to an existing account, make sure that the tags, and pricing tier in the template are all the same as your existing account. 

###Runbook: Write-HelloWorld
Creates a published version of Write-HelloWorld.  The schedule will be linked to this runbook. 

###Schedule
Creates a schedule with the name, time, and frequency of your choice.  

###Job Schedule
Links the Write-HelloWorld runbook to the schedule created above.  
