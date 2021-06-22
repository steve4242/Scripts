Connect-MsolService
Get-MsolUser -All |
        Select-Object DisplayName, @{N = "MFAStatus"; E = {
                        if ( $_.StrongAuthenticationMethods.IsDefault -eq $true) {
                                ($_.StrongAuthenticationMethods | Where-Object IsDefault -EQ $True).MethodType
                        } else {
                                "Disabled" 
                        } 
                }
        } | Where-Object { ($_.MFAStatus -notlike "Disabled") } |
        Export-Csv -NoTypeInformation -Delimiter ";" -Encoding Default $env:homedrive\MFA_enabled_Users_ALL_$((Get-Date).ToString('dd.MM.yyyy')).csv
Write-Output "Die Datei $env:homedrive\MFA_enabled_Users_ALL_$((Get-Date).ToString('dd.MM.yyyy')).csv wurde erstellt"