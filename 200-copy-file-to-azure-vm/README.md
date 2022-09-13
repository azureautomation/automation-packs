# Copy file to an Azure Virtual Machine

[![Deploy Runbook to Azure](http://azuredeploy.net/deploybutton.png)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fazureautomation%2Fautomation-packs%2Fmaster%2F200-copy-file-to-azure-vm%2Fazuredeploy.json)

This Azure Automation runbook copies a file from the local runbook host to an Azure virtual machine (classic). This runbook is intended to run after a file is copied to the local host so ensure that you have copied the file to the runbook host before calling this.

#Resources deployed

- Automation account
- Runbook: Connect-AzureVM (Child runbook)
- Runbook: Copy-ItemToAzureVM
- Credential
