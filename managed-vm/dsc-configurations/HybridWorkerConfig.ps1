Configuration HybridWorkerConfig
{
    param 
    (  
        # Name of the VM for the hybrid worker group 
        [Parameter(Mandatory)] 
        [ValidateNotNullOrEmpty()] 
        [String]$VMName 
    )

    Import-DscResource -ModuleName HybridRunbookWorkerDsc

    $AutomationEndpoint = Get-AutomationVariable AutomationEndpoint
    $AutomationKey = Get-AutomationPSCredential AutomationCredential

    Node "Demo"
    {   
        # Wait 20 minutes for hybrid worker bits to be downloaded, else fail.
        WaitForHybridRegistrationModule ModuleWait
        {
            IsSingleInstance = 'Yes'
            RetryIntervalSec = 60
            RetryCount = 20
        }

        HybridRunbookWorker Onboard
        {
            Ensure    = 'Present'
            Endpoint  = $AutomationEndpoint
            Token     = $AutomationKey
            GroupName = $VMName
            DependsOn = '[WaitForHybridRegistrationModule]ModuleWait'
        }
    }
}