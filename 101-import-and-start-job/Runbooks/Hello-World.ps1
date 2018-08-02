param  (
        [Parameter(Mandatory=$False)]
        $JsonParameterList = '{"Name":"World"}'
)
$ErrorActionPreference = 'stop'
$Params = ConvertFrom-Json $JsonParameterList

Write-Output ("Hello " + $Params.Name)