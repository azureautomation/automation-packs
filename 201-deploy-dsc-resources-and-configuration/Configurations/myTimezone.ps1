Configuration myTimezone {
    param(
        [string]$zone
    )

    Import-DscResource -ModuleName xTimezone

    node zone {
        xTimeZone zone {
            IsSingleInstance = 'Yes'
            TimeZone = $zone
        }  
    }
}