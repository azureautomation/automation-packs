Configuration myTimezone {
    param(
        [string]$zone
    )

    Import-DscResource -ModuleName xTimezone

    xTimeZone zone {
        IsSingleInstance = 'Yes'
        TimeZone = $zone
    }
}