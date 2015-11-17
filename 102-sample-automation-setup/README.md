# Create a sample automation environment

This sample deploys in a new resource group, an Azure VM and an automation account to manage that Azure VM. This includes a runbook that runs on a schedule against the VM, and the VM is also onboarded as a DSC node for configuration management by Azure Automation DSC. This is meant to make it very easy to get started testing out Azure Automation's capabilities without having to go through the work of setting up Azure Automation's various features yourself.

It contains a script, deployThroughARM, that you can use to easily deploy the sample through Azure Resource Manager:
`.\deployThroughARM.ps1`

Note: You must have the [Azure Resource Manager cmdlets v1.0 (or later)](https://azure.microsoft.com/en-us/documentation/articles/powershell-azure-resource-manager/) installed for the script to work.
