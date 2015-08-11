workflow HelloWorld
{
    param (
        [String]
        $Name
    )
    $VerbosePreference = 'Continue'

    Write-Output ("Hello " + $Name)

    $cred = Get-AutomationPSCredential -Name 'DefaultAzureCredential'
    $cred
}