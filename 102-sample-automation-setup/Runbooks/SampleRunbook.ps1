param(
    [string] $VMName,
    [int] $VMPort,
    [boolean] $VMUseSSL
)

$VMCredential = Get-AutomationPSCredential -Name "MyVMCredential"

Invoke-Command -ScriptBlock {        
    Write-Verbose ("Successfully remoted to " + $env:COMPUTERNAME)

    ## what to do??
        
} -ComputerName $VMName -Port $VMPort -Credential $VMCredential -UseSsl:$VMUseSSL -SessionOption (New-PSSessionOption –SkipCACheck –SkipCNCheck –SkipRevocationCheck)