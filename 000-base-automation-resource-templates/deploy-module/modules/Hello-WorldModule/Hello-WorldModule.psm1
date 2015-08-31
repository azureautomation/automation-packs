
function Say-Hello 
{ 
    param( 
       [Parameter(Mandatory=$True)]
       [ValidateNotNullOrEmpty()]
       [string]
       $Name
    )

    Write-Output "Hello $Name"
    
}

Export-ModuleMember *