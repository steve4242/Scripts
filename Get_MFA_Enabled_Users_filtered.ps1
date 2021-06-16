Connect-MsolService
Get-MsolUser -All -EnabledFilter EnabledOnly |
Select-Object DisplayName, @{N = "MFAStatus"; E = { if ( $_.StrongAuthenticationMethods.IsDefault -eq $true) {
            ($_.StrongAuthenticationMethods |
                Where-Object IsDefault -eq $True).MethodType
        }
        else { "Disabled" } }
} |
Where-Object { ($_.MFAStatus -notlike "Disabled") } |
Format-Table -AutoSize