# Creates three runbooks

[![Deploy to Azure](http://azuredeploy.net/deploybutton.png)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fazureautomation%2Fautomation-packs%2Fmaster%2F101-sample-deploy-automation-resources%2Fsample-deploy-runbooks%2FdeployRunbooks.json)

This sample shows how you can deploy a runbook in its 3 different states: empty draft, draft with content, and published runbook.

##Resources Deployed
###Automation Account
This is the account that will contain your runbooks.

If you want to deploy to an existing account, make sure that the tags, and SKU (pricing tier) in the template are all the same as your existing account, otherwise the properties will be overwritten.

###Runbook 1 - Blank runbook
This creates a runbook stub with the name specified in the parameter files. This runbook is created as a graphical runbook.

###Runbook 2 - Runbook created in draft mode
This creates a PowerShell Workflow runbook in draft mode. The runbook that is deployed in this case is called DraftRunbook.
###Runbook 3 - Runbook created in published mode
This creates a PowerShell runbook in published mode. The runbook that is deployed in this case is called PublishedRunbook.

###Aditional notes
Note that the optional hash value for runbook #2 and #3 is removed from the deployment template. If you would like to use a hash value, convert your runbook to binary and use the SHA 256 algorithm against the binary file to generate a hash value.

Example deployment template snippet:

    "publishContentLink": {
        "uri": "http://mystorageaccount/MyRunbook.ps1",
        "version": "1.0.0.0",
        "hash": {
            "algorithm": "sha256",
            "value": "6E7753DAB302EAD767F5A2CF6A950C496EDE541EAC108D45B62762D7B53495F0"
        }
    }
