$BlockedDevices = @(Get-MobileDevice -Filter 'DeviceAccessState -eq "Blocked"')
$BlockedDevices.Foreach({
    Get-CASMailbox -Filter "ActiveSyncBlockedDeviceIDs -eq `'$($_.DeviceId)`'" | Set-CASMailbox -ActiveSyncAllowedDeviceIDs @{add=$($_.DeviceId)}
})